# AMDPlugin
Rainmeter AMD GPU Plugin

## Valid Measures
* Temperature
* TemperatureEdge
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
* SharedLimit
* SharedUsage
* DedicatedLimit
* DedicatedUsage
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
* DriverDate
* DriverVersion

## Usage Example
```
[Temp]
Measure=Plugin
Plugin=AMDPlugin.dll
MeasureID=Temperature
AdapterID=0
```
