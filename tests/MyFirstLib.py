from robot.api import logger


def addiere_zwei_zahlen(self,a: int, b:int) -> int:
    logger.debug(f"Addiere zwei Zahlen {a} und {b}")
    return a+b

def gib_mir_json(self):
    return '{"name":"markus"}'