# list of work - refactor

- [ ] **AddBeat.gd** 
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 1 | 4 | `onready var score` | The score val should be comming from a comon place and should be stored as an integer so that we don't have to think about converting it from a string to an int here. The only time we care about it being a string is in the UI label. |
- [ ] **AddLane.gd**
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 4 | 12 | `hint_tooltip` | Tooltip strings should be stored in in a resource and accessed from there. |
- [x] **Beat.tscn**
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [x] | 0 | NA | Editor: BaseButton/button_mask | should be right_click because this interaction feels most natural to a user |
- [ ] **Beat.gd**
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 0 | 14 | `f connect_menu_item_signals` | this funcion is a utility function and should be generalized moved to a global utility singleton |
- [ ] **Board.gd**
    - [ ] Naming: This node contains a list of samples listed by beat index called 'Count', it also contains interactable elements related to playing those samples in index order.
   
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 1 | 36 | `main_timer.connect` | use the utils connect_signal function. If the utils function still needs to be constructed see LaneManager.gd, 30, 41: `func connect_signal`, `func connect_board_signals`|
    | [ ] | 0 | 105 | `f _on_Pulse_pressed` | this should be in a script 'Pulse.gd' attached to 'Board/PulseContainer/Pulse' |
    | [ ] | 0 | 39 | `f get_beat_audio` | this should be in a script 'Pulse.gd' attached to 'Board/PulseContainer/Pulse' |
    | [ ] | 0 | 44 | `f get_beat_data` | this should be in a script 'Pulse.gd' attached to 'Board/PulseContainer/Pulse' |
    | [ ] | 0 | 33, 26 | `var c` | this should be better named and moved to 'Pulse.gd' attached to 'Board/PulseContainer/Pulse' |
    | [ ] | 1 | 48 | `f update_index_by_1` | this should be in 'utils.gd' singleton |
    | [ ] | 1 | 51 | `f reset_index` | this should be in 'utils.gd' singleton |
    | [ ] | 0 | 54 | `f populate_beats` | Can a beat populate itself? |
    | [ ] | 4 | 55 | `var instance_tooltip`| Tooltip strings should be stored in in a resource and accessed from there. |
    | [ ] | 0 | 97, 78 | `f populate_samples`, `f _onBeat_about_to_show` | this can all be done from beat.gd |
    | [ ] | 1 | 83 | `int(score.text)` | The score val should be comming from a comon place and should be stored as an integer so that we don't have to think about converting it from a string to an int here. The only time we care about it being a string is in the UI label. |
    | [ ] | 0 | 88 | `f reset_lane_score` | rename to 'reset_track_score' |
    | [ ] | 0 | 102, 133 | `f _play_beat`, `f _on_main_timer_timeout` | move to 'Pulse.gd' attached to 'Board/PulseContainer/Pulse' |
    | [ ] | 0 | 114 | `f _on_pulse_all_pressed` | move to IsAuto.gd attached to 'Board/PulseContainer/AutoPAnel/IsAuto', rename IsAuto to Autoplay |
    | [ ] | 0 | 117 | `f _on_AddBeat_pressed` | move to AddBeat.gd see 'Can a beat populate itself?' | 
    | [ ] | 0 | 122 | `f _on_LaneScore_pressed` | move to LaneScore.gd, rename LaneScore to TrackScore |
    | [ ] | 0 | 127 | `f _on_IsAuto_toggled` | move to IsAuto.gd |
- [ ] **IsAuto.gd**
    - [ ] naming: rename to AutoPlay
  
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 1 | 9 | `f main_timer.connect` | use the utils connect_signal function. If the utils function still needs to be constructed see LaneManager.gd, 30: `func connect_Signal` |
    | [ ] | 1 | 12 | `int(score.text)` | The score val should be comming from a comon place and should be stored as an integer so that we don't have to think about converting it from a string to an int here. The only time we care about it being a string is in the UI label. |
- [ ] **IsAutoPulseAll.gd**
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [ ] | 1 | 9 | `main_timer.connect` | use the utils connect_signal function. If the utils function still needs to be constructed see LaneManager.gd, 30: `func connect_Signal` |
    | [ ] | 1 | 12| `int(score.text)` |The score val should be comming from a comon place and should be stored as an integer so that we don't have to think about converting it from a string to an int here. The only time we care about it being a string is in the UI label. |
- [ ] **LaneManager.gd**
    |done|prio|ln|context|description|
    |:---:|:---:|:---:|:---|:---|
    | [x] | 0 | 69 | `f _on_IsAutoPulseAll_toggled` | move to IsAutoPulseAll.gd |
    | [x] | 0 | 65, 27 | `f _on_main_timer_timeout`, `emit_pulse_pressed_signal` | move to IsAutoPulseAll.gd |
    | [x] | 0 | 62, 27 | `f _on_PulseAll_pressed`, `emit_pulse_pressed_signal` | move to IsAutoPulseAll.gd |
    | [ ] | 0 | 57, 51 | `f _on_AddLane_pressed`, `f add_board` | move to AddLane.gd |
    | [x] | 0 | 30, 41 | `f connect_signal`, `connect_board_signals` | These functions can likely be consolidated. The fucntion shoul be defined in a utils singleton. |
- [ ] **Sample.gd, SampleData.gd**
  - [ ] These seem like they should be a class
- [ ] **UI.gd**
  |done|prio|ln|context|description|
  |:---:|:---:|:---:|:---|:---|
  | [ ] | 0 | 10-37 | `f <_on_signal_callback>` | These should be in Score.gd attached to UI/ScoreContainer/Score |
- [ ] **Main.tscn**
    - [ ] The names of nodes in the scene tree are confusing. they should better reflect what the node does or why it exists.
    - [ ] 'Boards' should be renamed to 'TrackContainer'
    - [ ] 'Board' -> 'TrackPlayer'
    - [ ] 'Count' -> 'Track'
    - [ ] 'AddLane' -> 'AddTrack'
    - [ ] 'LaneManager' -> 'PatternPlayer'
    - [ ] 'Lanes' -> 'Pattern'
    - [ ] 'Tracker' -> 'PatternContainer'

- [x] **Utils.gd**
    - [x] `func connect_signal`
        - arguements: 
            - node where the signal is declared
            - signal name 
            - target node to connect
        - effects:
            - connects a signal declared in any node to any other node using Godot's signal callback naming convention
            - handles error conditions of failed connections
            - prints success or error details to debug log

- [ ] **all scripts**
    - [ ] functions should be defined below where they are called. 
