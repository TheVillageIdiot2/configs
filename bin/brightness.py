#!/usr/bin/env python3
import sys

bright_dir = "/sys/class/backlight/intel_backlight/"

######################## UTIL #################################

def printHelp():
    print(
    '''
    Invoke as ./brightness.py <action> [value]
    Where action is one of:
     - get
     - set [newpercent]
     - incr [amt]
     - decr [amt]
    ''')


def boundPercent(perc):
    '''
    Bounds perc to range [0.1, 1.0]
    '''
    perc = max(0.01, perc)
    perc = min(1.0, perc)
    return perc



def getCurrBrightness():
    '''
    Retreives the current brightness
    '''
    with open(bright_dir + 'brightness', 'r') as f:
        return int(next(f).strip())


def getMaxBrightness():
    '''
    Retreives the max brightness
    '''
    with open(bright_dir + 'max_brightness', 'r') as f:
        return int(next(f).strip())

def getCurrPercent():
    return getCurrBrightness() / getMaxBrightness()

############### ACTION STUFF ###############

def setPercent(newPercent):
    '''
    Sets the brightness percent
    '''
    newValue = int(boundPercent(newPercent) * getMaxBrightness())
    with open(bright_dir + 'brightness', 'w') as f:
        f.write(str(newValue))


############## MAIN BASICALLY)
#The action switch statement
currPercent = getCurrPercent()
action_switch = {
        "set": lambda: setPercent(float(sys.argv[2]) / 100),
        "get": lambda: print("{0:.0f}%".format(100 * getCurrPercent())),
        "incr": lambda: setPercent(getCurrPercent() + float(sys.argv[2]) / 100),
        "decr": lambda: setPercent(getCurrPercent() - float(sys.argv[2]) / 100),
    }

try:
    action_switch[sys.argv[1]]()
except Exception as e:
    printHelp()
    print(e)
        


