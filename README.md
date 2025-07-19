# 🔧 AMDPlugin

**Rainmeter Plugin for AMD GPUs**  
Provides detailed GPU telemetry including temperature, clocks, memory usage, and engine load — powered by ADL and D3DKMT.

---

## 🧪 Supported Measures

### 🔥 General GPU Metrics
| Measure ID             | Description                        |
|------------------------|------------------------------------|
| `Temperature`          | Core temperature (HotSpot)         |
| `TemperatureEdge`      | Edge or legacy temperature sensor  |
| `Clock`                | Core clock frequency               |
| `MemoryClock`          | Memory clock frequency             |
| `Voltage`              | Core voltage                       |
| `Activity`             | Core activity / load percentage    |
| `PerformanceLevel`     | Active performance state           |

### 🚀 PCIe Metrics
| Measure ID               | Description                        |
|--------------------------|------------------------------------|
| `PCIECurrentBusSpeed`    | Current PCIe bus speed (e.g., Gen4) |
| `PCIECurrentBusLanes`    | Currently used PCIe lanes           |
| `PCIEMaxBusLanes`        | Max supported PCIe lanes            |

### 🌬 Fan Metrics
| Measure ID             | Description                         |
|------------------------|-------------------------------------|
| `FanSpeedRPM`          | Fan speed in RPM                    |
| `FanSpeedPercent`      | Fan speed as percentage             |
| `FanSpeedRPMMin`       | Min fan speed in RPM                |
| `FanSpeedRPMMax`       | Max fan speed in RPM                |
| `FanSpeedPercentMin`   | Min fan speed %                     |
| `FanSpeedPercentMax`   | Max fan speed %                     |

### 🧠 Memory Metrics
| Measure ID             | Description                         |
|------------------------|-------------------------------------|
| `MemoryType`           | GDDR6, HBM, etc.                    |
| `MemorySize`           | Total VRAM (MB)                     |
| `MemoryUsage`          | Total memory usage (MB)             |
| `SharedLimit`          | Max shared memory (system)          |
| `SharedUsage`          | Current shared memory usage         |
| `DedicatedLimit`       | Max dedicated memory (VRAM)         |
| `DedicatedUsage`       | Current dedicated memory usage      |
| `MemoryBandwidth`      | Effective memory bandwidth (GB/s)   |

### 🖥 Adapter Info
| Measure ID             | Description                         |
|------------------------|-------------------------------------|
| `AdapterName`          | Name of the GPU                     |
| `BiosDate`             | VBIOS build date                    |
| `BiosVersion`          | VBIOS version string                |
| `BiosPartNumber`       | VBIOS part number                   |
| `NumberOfAdapters`     | Total number of AMD adapters        |
| `DriverDate`           | AMD driver release date             |
| `DriverVersion`        | AMD driver version string           |

---

## 🧪 D3DKMT Exclusive Measures  
> ⚠ Requires **WDDM 2.0 or higher** driver support!

These give access to low-level GPU engine data via `D3DKMTQueryStatistics`.

| Measure ID     | Description                                  |
|----------------|----------------------------------------------|
| `NodeUsage`    | Usage % of an individual GPU node/engine     |
| `NodeName`     | Friendly name of the GPU engine              |

---

## 📦 Usage Example (Rainmeter .ini)
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
