from robot.api import logger


def sum_two_numbers(a: int, b: int) -> int:
    logger.debug(f"Addiere zwei Zahlen {a} und {b}")
    return a + b


def gimme_json():
    return '{"name":"markus"}'
