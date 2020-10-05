unit adl_sdk;

interface

uses
  adl_structures;

///
///  Copyright (c) 2008 - 2013 Advanced Micro Devices, Inc.

///  THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
///  EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
///  WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.

/// \file adl_sdk.h
/// \brief Contains the definition of the Memory Allocation Callback.\n <b>Included in ADL SDK</b>
///
/// \n\n
/// This file contains the definition of the Memory Allocation Callback.\n
/// It also includes definitions of the respective structures and constants.\n
/// <b> This is the only header file to be included in a C/C++ project using ADL </b>

type
  ADL_MAIN_MALLOC_CALLBACK  = function(v1: Integer): Pointer; stdcall;

  ADL_MAIN_CONTROL_CREATE = function(v1: ADL_MAIN_MALLOC_CALLBACK; iActiveOnly: Integer): Integer; stdcall;
  ADL_MAIN_CONTROL_DESTROY = function: Integer; stdcall;

  ADL_ADAPTER_NUMBEROFADAPTERS_GET = function(var iCount: Integer): Integer; stdcall;
  ADL_ADAPTER_ADAPTERINFO_GET = function(v1: PAdapterInfo; iNum: Integer): Integer; stdcall;
  ADL_ADAPTER_ACTIVE_GET = function(iNum: Integer; var iActive: Integer): Integer; stdcall;
  ADL_ADAPTER_VIDEOBIOSINFO_GET = function(iNum: Integer; var lpBiosInfo: TADLBiosInfo): Integer; stdcall;
  ADL_ADAPTER_ID_GET = function(iNum: Integer; var lpId: Integer): Integer; stdcall;
  ADL_ADAPTER_MEMORYINFO_GET = function(iNum: Integer; var lpMemoryInfo: TADLMemoryInfo): Integer; stdcall;
  ADL_ADAPTER_CONFIGMEMORY_GET = function(iAdapterIndex: Integer; iScreenWidth, iScreenHeight, displayFeatureMask, numDisplays: Integer; var displayFeatureList: TADLMemoryDisplayFeatures; var iNumMemTypes: Integer; var lppMemRequired: LPADLMemoryRequired): Integer; stdcall;

  ADL_OVERDRIVE_CAPS = function(iAdapterIndex: Integer; var iSupported: Integer; var iEnabled: Integer; var iVersion: Integer): Integer; stdcall;

  ADL_OVERDRIVE5_THERMALDEVICES_ENUM = function(iAdapterIndex: Integer; iThermalControllerIndex: Integer; var lpThermalControllerInfo: TADLThermalControllerInfo): Integer; stdcall;
  ADL_OVERDRIVE5_ODPARAMETERS_GET = function(iAdapterIndex: Integer; var lpOdParameters: TADLODParameters): Integer; stdcall;
  ADL_OVERDRIVE5_TEMPERATURE_GET = function(iAdapterIndex: Integer; iThermalControllerIndex: Integer; var lpTemperature: TADLTemperature): Integer; stdcall;
  ADL_OVERDRIVE5_FANSPEED_GET = function(iAdapterIndex: Integer; iThermalControllerIndex: Integer; var lpFanSpeedValue: TADLFanSpeedValue): Integer; stdcall;
  ADL_OVERDRIVE5_FANSPEEDINFO_GET = function(iAdapterIndex: Integer; iThermalControllerIndex: Integer; var lpFanSpeedInfo: TADLFanSpeedInfo): Integer; stdcall;
  ADL_OVERDRIVE5_ODPERFORMANCELEVELS_GET = function(iAdapterIndex: Integer; iDefault: Integer; var lpOdPerformanceLevels: TADLODPerformanceLevels): Integer; stdcall;
  ADL_OVERDRIVE5_CURRENTACTIVITY_GET = function(iAdapterIndex: Integer; var lpActivity: TADLPMActivity): Integer; stdcall;
  ADL_OVERDRIVE5_FANSPEED_SET = function(iAdapterIndex: Integer; iThermalControllerIndex: Integer; var lpFanSpeedValue: TADLFanSpeedValue): Integer; stdcall;
  ADL_OVERDRIVE5_ODPERFORMANCELEVELS_SET = function(iAdapterIndex: Integer; var lpOdPerformanceLevels: TADLODPerformanceLevels): Integer; stdcall;
  ADL_OVERDRIVE5_POWERCONTROL_CAPS = function(iAdapterIndex: Integer; var lpSupported: Integer): Integer; stdcall;
  ADL_OVERDRIVE5_POWERCONTROLINFO_GET = function(iAdapterIndex: Integer; var lpPowerControlInfo: TADLPowerControlInfo): Integer; stdcall;
  ADL_OVERDRIVE5_POWERCONTROL_GET = function(iAdapterIndex: Integer; var lpCurrentValue: Integer; var lpDefaultValue: Integer): Integer; stdcall;
  ADL_OVERDRIVE5_POWERCONTROL_SET = function(iAdapterIndex: Integer; iValue: Integer): Integer; stdcall;

  ADL_OVERDRIVE6_FANSPEED_GET = function(iAdapterIndex: Integer; var lpFanSpeedInfo: ADLOD6FanSpeedInfo): Integer; stdcall;
  ADL_OVERDRIVE6_THERMALCONTROLLER_CAPS = function(iAdapterIndex: Integer; var lpThermalControllerCaps: ADLOD6ThermalControllerCaps): Integer; stdcall;
  ADL_OVERDRIVE6_TEMPERATURE_GET = function(iAdapterIndex: Integer; var lpTemperature: Integer): Integer; stdcall;
  ADL_OVERDRIVE6_CAPABILITIES_GET = function(iAdapterIndex: Integer; var lpODCapabilities: ADLOD6Capabilities): Integer; stdcall;
  ADL_OVERDRIVE6_STATEINFO_GET = function(iAdapterIndex: Integer; iStateType: Integer; var lpStateInfo: ADLOD6StateInfo): Integer; stdcall;
  ADL_OVERDRIVE6_CURRENTSTATUS_GET = function(iAdapterIndex: Integer; var lpCurrentStatus: ADLOD6CurrentStatus): Integer; stdcall;
  ADL_OVERDRIVE6_POWERCONTROL_CAPS = function(iAdapterIndex: Integer; var lpSupported: Integer): Integer; stdcall;
  ADL_OVERDRIVE6_POWERCONTROLINFO_GET = function(iAdapterIndex: Integer; var lpPowerControlInfo: ADLOD6PowerControlInfo): Integer; stdcall;
  ADL_OVERDRIVE6_POWERCONTROL_GET = function(iAdapterIndex: Integer; var lpCurrentValue: Integer; var lpDefaultValue: Integer): Integer; stdcall;
  ADL_OVERDRIVE6_FANSPEED_SET = function(iAdapterIndex: Integer; var lpFanSpeedValue: ADLOD6FanSpeedValue): Integer; stdcall;
  ADL_OVERDRIVE6_STATE_SET = function(iAdapterIndex: Integer; iStateType: Integer; var lpStateInfo: ADLOD6StateInfo): Integer; stdcall;
  ADL_OVERDRIVE6_POWERCONTROL_SET = function(iAdapterIndex: Integer; iValue: Integer): Integer; stdcall;

implementation

end.
