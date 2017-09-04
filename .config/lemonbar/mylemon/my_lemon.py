#!/usr/bin/env python3
from datetime import datetime, timedelta
import i3ipc
import threading
import time
import subprocess

from elements import *

CLOCK_INTERVAL = timedelta(seconds=1)
BATTERY_INTERVAL = timedelta(seconds=5)

class Workspace(BarElem):
    def __init__(self, ws_dict):
        self.num = ws_dict['num']
        self.name = ws_dict['name']
        self.focused = ws_dict['focused']
        self.visible = ws_dict['visible']
        self.output = ws_dict['output']
        self.urgent = ws_dict['urgent']

    def reduce(self):
        txt = Button(" "+self.name+" ", "i3-msg workspace \"{}\"".format(self.name))
        if self.focused:
            return Overline(Underline(txt))
        elif self.visible:
            return Underline(txt)
        else:
            return txt
        
class WSMaster(BarElem):
    def __init__(self):
        self.workspaces = None
        self.last_update = datetime.min

    def reduce(self):
        global STATE
        if self.last_update < STATE.last_workspace_change:
            ws = STATE.i3.get_workspaces()
            self.workspaces = [Workspace(x) for x in ws]
            self.workspaces = sorted(self.workspaces, key=lambda w: w.num)
            self.last_update = STATE.last_workspace_change
        return self.workspaces

class Clock(BarElem):
    def __init__(self):
        self.next_update = datetime.min
        self.text = ""

    def reduce(self):
        if self.next_update < STATE.last_update:
            now = datetime.now()
            self.next_update = now + CLOCK_INTERVAL
            self.text = now.strftime("%a, %b %d, %Y | %H:%M:%S")
        return self.text

class Battery(BarElem):
    def __init__(self):
        self.next_update = datetime.min
        self.text = ""

    def reduce(self):
        if self.next_update < STATE.last_update:
            now = datetime.now()
            self.next_update = now + BATTERY_INTERVAL
            bat_output = subprocess.run(['acpi', '-b'], stdout=subprocess.PIPE).stdout.decode('utf-8')
            left_bound = bat_output.find(":") + 2
            right_bound = bat_output.find("%") + 1
            self.text = bat_output[left_bound : right_bound]
        return self.text


STATE = None
class BarState(object):
    def __init__(self, i3):
        #Store connection
        self.i3 = i3

        #Build bar
        padding = "  "
        self.basebar = [padding, WSMaster(), RightAlign([Battery(), " | ", Clock()]), padding]

        #Set timestamps of data fed from global
        self.last_window_change = datetime.now()
        self.last_workspace_change = datetime.now()
        self.last_update = datetime.now()
        self.last_str = ""
        self.need_print = True

    def update(self):
        '''
        Prints updated bar string afterwards
        '''
        self.last_update = datetime.now()
        new_str = flatten(self.basebar)
        if self.last_str != new_str:
            print(flatten(self.basebar), flush=True)
            self.last_str = new_str


def i3_workspace_callback(i3, e):
    global STATE
    STATE.last_workspace_change = datetime.now()
    STATE.update() #Want an immediate update for such critical ui changes

def i3_window_callback(i3, e):
    global STATE
    STATE.last_window_change = datetime.now()
    STATE.update() #Want an immediate update for such critical ui changes

def main():
    global STATE
    #Connect to i3
    i3 = i3ipc.Connection()

    #Initialize state based on current i3 status
    STATE = BarState(i3)
    STATE.update()

    #Add i3 listeners
    i3.on('workspace::focus', i3_workspace_callback)
    i3.on('window::focus', i3_window_callback)

    #Add thread that polls on .1 second intervals
    def upd_loop():
        while True:
            time.sleep(.1)
            STATE.update()

    upd_thread = threading.Thread(target=upd_loop)
    upd_thread.daemon = True
    upd_thread.start()

    #Listen on i3
    i3.main()

if __name__ == "__main__":
    main()
