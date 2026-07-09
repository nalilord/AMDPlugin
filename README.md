# 🔧 AMDPlugin

Version 0.9

**Rainmeter Plugin for AMD GPUs**  
Provides GPU telemetry including temperatures, clocks, memory usage, PMLog sensors, and engine load through ADL, ADL2 PMLog, and D3DKMT.

AMDPlugin enumerates active AMD adapters first, so newer mobile APUs can expose telemetry through ADL2 PMLog even when the older Overdrive capability API reports unsupported. For PMLog telemetry the plugin prefers the current ADL2 shared-memory API when the driver supports it. If that API is unavailable it falls back to the legacy `ADL2_New_QueryPMLogData_Get` path.

---

## 🧪 Supported Measures

### 🔥 General GPU Metrics
| Measure ID | Description |
|------------|-------------|
| `APIVersion` | Active Overdrive / PMLog API version |
| `Temperature` | Core temperature (HotSpot) |
| `TemperatureEdge` | Edge or legacy temperature sensor |
| `Clock` | Core clock frequency |
| `MemoryClock` | Memory clock frequency |
| `Voltage` | Core voltage |
| `Activity` | Core activity / load percentage |
| `PerformanceLevel` | Active performance state |

### 🚀 PCIe Metrics
| Measure ID | Description |
|------------|-------------|
| `PCIECurrentBusSpeed` | Current PCIe bus speed |
| `PCIECurrentBusLanes` | Currently used PCIe lanes |
| `PCIEMaxBusLanes` | Max supported PCIe lanes |

### 🌬 Fan Metrics
| Measure ID | Description |
|------------|-------------|
| `FanSpeedRPM` | Fan speed in RPM |
| `FanSpeedPercent` | Fan speed as percentage |
| `FanSpeedRPMMin` | Min fan speed in RPM |
| `FanSpeedRPMMax` | Max fan speed in RPM |
| `FanSpeedPercentMin` | Min fan speed % |
| `FanSpeedPercentMax` | Max fan speed % |

### 🧠 Memory Metrics
| Measure ID | Description |
|------------|-------------|
| `MemoryType` | GDDR6, HBM, etc. |
| `MemorySize` | Total VRAM / dedicated UMA reservation |
| `MemoryUsage` | Total memory usage |
| `SharedLimit` | Max shared system memory |
| `SharedUsage` | Current shared memory usage |
| `DedicatedLimit` | Max dedicated memory |
| `DedicatedUsage` | Current dedicated memory usage |
| `MemoryBandwidth` | Effective memory bandwidth |

### 🖥 Adapter Info
| Measure ID | Description |
|------------|-------------|
| `AdapterName` | Name of the GPU |
| `BiosDate` | VBIOS build date |
| `BiosVersion` | VBIOS version string |
| `BiosPartNumber` | VBIOS part number |
| `NumberOfAdapters` | Total number of AMD adapters |
| `DriverDate` | AMD driver release date |
| `DriverVersion` | AMD driver version string |

### 📈 PMLog Diagnostics
| Measure ID | Description |
|------------|-------------|
| `PMLogSupported` | `1` when PMLog telemetry is active |
| `PMLogSharedMemorySupported` | `1` when the driver supports the shared-memory PMLog path |
| `PMLogBackend` | Active PMLog backend: `0` none, `1` legacy query, `2` shared memory |

### 🧪 D3DKMT Exclusive Measures
> ⚠ Requires **WDDM 2.0 or higher** driver support.

These give access to low-level GPU engine data through `D3DKMTQueryStatistics`.

| Measure ID | Description |
|------------|-------------|
| `NodeUsage` | Usage % of an individual GPU node/engine |
| `NodeName` | Friendly name of the GPU engine |

---

## Notes
* Integrated Radeon APUs often do not report fan sensors. Fan measures can legitimately return `0` when no GPU fan sensor exists.
* On UMA/integrated graphics, `MemorySize` is the dedicated/reserved video memory segment reported by the driver. Shared memory availability and usage are exposed through `SharedLimit`, `SharedUsage`, `DedicatedLimit`, `DedicatedUsage`, and `MemoryUsage`.
* The test app shows unsupported values as `N/A` and includes adapter diagnostics, a D3DKMT node list, and a PMLog sensor dump to make driver-specific behavior visible.

## Usage Example
```ini
[Temp]
Measure=Plugin
Plugin=AMDPlugin.dll
MeasureID=Temperature
AdapterID=0

[D3DKMTUsageNode0]
Measure=Plugin
Plugin=AMDPlugin.dll
NodeEngine=0
MeasureID=NodeUsage
AdapterID=0

[D3DKMTUsageNodeName0]
Measure=Plugin
Plugin=AMDPlugin.dll
NodeEngine=0
MeasureID=NodeName
AdapterID=0
```

## Build From WSL
The helper script calls the Windows Delphi compiler from WSL:

```
./build-wsl-generic.sh Testing/AMDPluginTestApp.dproj Win64
./build-wsl-generic.sh Plugin/AMDPlugin.dproj Win64
./build-wsl-generic.sh Plugin/AMDPlugin.dproj Win32
```

Build output is written to `Bin/<Platform>`.
