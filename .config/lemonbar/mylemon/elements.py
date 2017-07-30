'''
Contains various useful lemonbar wrappers :)
'''

'''
Note:
an "Element" is one of
    - a string
    - a BarElem
    - a List of Elements
'''

def flatten(elements):
    '''
    Flattens an element into a string.
    '''
    if isinstance(elements, str):
        return elements
    elif isinstance(elements, list):
        return "".join(flatten(e) for e in elements)
    elif isinstance(elements, BarElem):
        return flatten(elements.reduce())

class BarElem(object):
    def reduce(self):
        #Must always return an element
        return "UNIMP"

class RightAlign(BarElem):
    def __init__(self, elem):
        self.elem = elem

    def reduce(self):
        return ["%{r}", self.elem]

class LeftAlign(BarElem):
    def __init__(self, elem):
        self.elem = elem

    def reduce(self):
        return ["%{l}", self.elem]

class Underline(BarElem):
    def __init__(self, elem):
        self.elem = elem

    def reduce(self):
        return ["%{+u}", self.elem, "%{-u}"]

class Overline(BarElem):
    def __init__(self, elem):
        self.elem = elem

    def reduce(self):
        return ["%{+o}", self.elem, "%{-o}"]

class Button(BarElem):
    def __init__(self, elem, command):
        self.elem = elem
        self.command = command

    def reduce(self):
        return ["%{A:" + self.command + ":}", self.elem, "%{A}"]
