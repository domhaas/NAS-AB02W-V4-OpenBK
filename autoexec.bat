
// Drivers
startDriver TuyaMCU

// Channels

// # ch1 = toggle
setChannelLabel 1 "Alarm Status"
setChannelType 1 toggle
linkTuyaMCUOutputToChannel 104 bool 1

// ------

// # ch4 = chime sound
// 0 - doorbell
// 1 - fuer elise
// 2 - big ben
// 3 - ring ring
// 4 - lone ranger
// 5 - turkish march
// 6 - high pitched
// 7 - red alert
// 8 - crickets
// 9 - beep
// 10 - dog bark
// 11 - police siren
// 12 - grandfather clock
// 13 - phone ring
// 14 - fire truck
// 15 - clock chime
// 16 - alarm clock
// 17 - school bell
setChannelLabel 2 "Chime Sound"
setChannelType 2 TextField
linkTuyaMCUOutputToChannel 102 enum 2
addEventHandler TuyaMCUParsed 0x02 setChannel 2 2 // set alam-sound default to "big ben"

// ------

// # ch6 = alarm duration in sec
setChannelLabel 3 "Alarm Duration"
setChannelType 3 TextField
linkTuyaMCUOutputToChannel 103 val 3
addEventHandler TuyaMCUParsed 0x02 setChannel 3 30 // set alarm-duration default to 30s

// ------

// # ch1 = power type
// 1 - battery high
// 2 - medium
// 3 - low
// 4 - usb port
setChannelLabel 4 "Power Type"
setChannelType 4 ReadOnly
linkTuyaMCUOutputToChannel 101 val 4

// ------

//Stop blinking
tuyaMcu_defWiFiState 3

//Ask for status at startup
tuyaMcu_sendQueryState
scheduleHADiscovery 1
