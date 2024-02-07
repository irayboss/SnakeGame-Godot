extends Node

func repeat(value: float, length: float) -> float:
	return fposmod(value, length)
