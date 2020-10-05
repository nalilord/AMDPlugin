# AMDPlugin
Rainmeter AMD GPU Plugin

## Valid Measures
* Temperature
* Clock
* MemoryClock
* Voltage
* Activity
* PerformanceLevel
* PCIECurrentBusSpeed
* PCIECurrentBusLanes
* PCIEMaxBusLanes
* FanSpeedRPM
* FanSpeedPercent
* MemoryType
* MemorySize
* MemoryUsage
* MemoryBandwidth
* AdapterName
* FanSpeedPercentMin
* FanSpeedPercentMax
* FanSpeedRPMMin
* FanSpeedRPMMax
* BiosDate
* BiosVersion
* BiosPartNumber
* NumberOfAdapters

## Usage Example
```
[Temp]
Measure=Plugin
Plugin=AMDPlugin.dll
MeasureID=Temperature
AdapterID=0
```
