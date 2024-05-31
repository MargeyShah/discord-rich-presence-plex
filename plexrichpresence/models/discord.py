from typing import TypedDict
from enum import Enum

class ActivityType(Enum):
	PLAYING: int = 0
	STREAMING: int = 1
	LISTENING: int = 2
	WATCHING: int = 3
	CUSTOM: int = 4
	COMPETING: int = 5

class ActivityAssets(TypedDict):
	large_text: str
	large_image: str
	small_text: str
	small_image: str

class ActivityTimestamps(TypedDict, total = False):
	start: int
	end: int

class ActivityButton(TypedDict):
	label: str
	url: str

class Activity(TypedDict, total = False):
	details: str
	state: str
	assets: ActivityAssets
	timestamps: ActivityTimestamps
	buttons: list[ActivityButton]
	type: int

