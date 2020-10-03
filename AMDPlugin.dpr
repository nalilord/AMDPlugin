library AMDPlugin;

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.Generics.Collections,
  adl in 'adl.pas';

{$R *.res}

const
  MIN_UPDATE_TIME = 250;

type
  TMeasure = class
  private
    FName: String;
    FAdapter: Integer;
  public
    property Name: String read FName write FName;
    property Adapter: Integer read FAdapter write FAdapter;
  end;

var
  ADL: TADL = nil;
  List: TObjectList<TMeasure> = nil;
  LastUpdate: UInt64 = 0;

type
  Measures = (Temperature, Clock, MemoryClock, Voltage, Activity, PerformanceLevel,
    PCIECurrentBusSpeed, PCIECurrentBusLanes, PCIEMaxBusLanes, FanSpeedRPM, FanSpeedPercent, MemoryType,
    MemorySize, MemoryBandwidth, AdapterName, AdapterActive, FanSpeedPercentMin, FanSpeedPercentMax,
    FanSpeedRPMMin, FanSpeedRPMMax, BiosDate, BiosVersion, BiosPartNumber, AdapterIdentifier, NumberOfAdapters,
    NumberOfDisplays);

const
  MeasureNames: Array[Measures] of String = ('Temperature', 'Clock', 'MemoryClock', 'Voltage', 'Activity', 'PerformanceLevel',
    'PCIECurrentBusSpeed', 'PCIECurrentBusLanes', 'PCIEMaxBusLanes', 'FanSpeedRPM', 'FanSpeedPercent', 'MemoryType',
    'MemorySize', 'MemoryBandwidth', 'AdapterName', 'AdapterActive', 'FanSpeedPercentMin', 'FanSpeedPercentMax',
    'FanSpeedRPMMin', 'FanSpeedRPMMax', 'BiosDate', 'BiosVersion', 'BiosPartNumber', 'AdapterIdentifier', 'NumberOfAdapters',
    'NumberOfDisplays');

function RmReadString(rm: Pointer; option: PWideChar; defValue: PWideChar; replaceMeasures: BOOL): PWideChar; stdcall; external 'Rainmeter.dll';
function RmReadFormula(rm: Pointer; option: PWideChar; defValue: Double): Double; stdcall; external 'Rainmeter.dll';
function RmReplaceVariables(rm: Pointer; str: PWideChar): PWideChar; stdcall; external 'Rainmeter.dll';
function RmPathToAbsolute(rm: Pointer; relativePath: PWideChar): PWideChar; stdcall; external 'Rainmeter.dll';
procedure RmGet(rm: Pointer; typ: Integer); stdcall; external 'Rainmeter.dll';
procedure RmExecute(skin: Pointer; command: PWideChar); stdcall; external 'Rainmeter.dll';

procedure Initialize(var data: Pointer; rm: Pointer); stdcall;
var
  Measure: TMeasure;
begin
  if NOT Assigned(ADL) then
    ADL:=TADL.Create;
  if NOT Assigned(List) then
    List:=TObjectList<TMeasure>.Create;

  Measure:=TMeasure.Create;
  Measure.Name:=RmReadString(rm, 'MeasureID', '', True);
  Measure.Adapter:=Trunc(RmReadFormula(rm, 'AdapterID', 0));

  List.Add(Measure);

  data:=Measure;
end;

procedure Reload(data: Pointer; rm: Pointer; var maxValue: Double); stdcall;
begin
  if GetTickCount64 - LastUpdate >= MIN_UPDATE_TIME  then
  begin
    LastUpdate:=GetTickCount64;
    ADL.Update;
  end;
end;

function Update(data: Pointer): Double; stdcall;
begin
  Result:=0.0;

  if GetTickCount64 - LastUpdate >= MIN_UPDATE_TIME  then
  begin
    LastUpdate:=GetTickCount64;
    ADL.Update;
  end;

  if (TMeasure(data).Adapter >= 0) AND (TMeasure(data).Adapter < ADL.AdapterCount) then
  begin
    case Measures(IndexStr(TMeasure(data).Name, MeasureNames)) of
      Temperature         : Result:=ADL.Adapters[TMeasure(data).Adapter].Temp;
      Clock               : Result:=ADL.Adapters[TMeasure(data).Adapter].Clock;
      MemoryClock         : Result:=ADL.Adapters[TMeasure(data).Adapter].Memory;
      Voltage             : Result:=ADL.Adapters[TMeasure(data).Adapter].Vddc;
      Activity            : Result:=ADL.Adapters[TMeasure(data).Adapter].Activity;
      PerformanceLevel    : Result:=ADL.Adapters[TMeasure(data).Adapter].PerformanceLevel;
      PCIECurrentBusSpeed : Result:=ADL.Adapters[TMeasure(data).Adapter].BusSpeed;
      PCIECurrentBusLanes : Result:=ADL.Adapters[TMeasure(data).Adapter].BusLanes;
      PCIEMaxBusLanes     : Result:=ADL.Adapters[TMeasure(data).Adapter].BusLanesMax;
      FanSpeedRPM         : Result:=ADL.Adapters[TMeasure(data).Adapter].FanRPM;
      FanSpeedPercent     : Result:=ADL.Adapters[TMeasure(data).Adapter].Fan;
      MemoryType          : ;
      MemorySize          : Result:=ADL.Adapters[TMeasure(data).Adapter].MemorySize;
      MemoryBandwidth     : Result:=ADL.Adapters[TMeasure(data).Adapter].MemoryBandwidth;
      AdapterName         : ;
      AdapterActive       : ;
      FanSpeedPercentMin  : Result:=0;
      FanSpeedPercentMax  : Result:=100;
      FanSpeedRPMMin      : Result:=0;
      FanSpeedRPMMax      : Result:=ADL.Adapters[TMeasure(data).Adapter].FanMaxRPM;
      BiosDate            : ;
      BiosVersion         : ;
      BiosPartNumber      : ;
      AdapterIdentifier   : ;
      NumberOfAdapters    : Result:=ADL.AdapterCount;
      NumberOfDisplays    : ;
    end;
  end;
end;

function GetString(data: Pointer): PWideChar; stdcall;
begin
  Result:=nil;

  if GetTickCount64 - LastUpdate >= MIN_UPDATE_TIME  then
  begin
    LastUpdate:=GetTickCount64;
    ADL.Update;
  end;

  if (TMeasure(data).Adapter >= 0) AND (TMeasure(data).Adapter < ADL.AdapterCount) then
  begin
    case Measures(IndexStr(TMeasure(data).Name, MeasureNames)) of
      Temperature         : ;
      Clock               : ;
      MemoryClock         : ;
      Voltage             : ;
      Activity            : ;
      PerformanceLevel    : ;
      PCIECurrentBusSpeed : ;
      PCIECurrentBusLanes : ;
      PCIEMaxBusLanes     : ;
      FanSpeedRPM         : ;
      FanSpeedPercent     : ;
      MemoryType          : Result:=PWideChar(ADL.Adapters[TMeasure(data).Adapter].MemoryType);
      MemorySize          : ;
      MemoryBandwidth     : ;
      AdapterName         : Result:=PWideChar(ADL.Adapters[TMeasure(data).Adapter].Name);
      AdapterActive       : ;
      FanSpeedPercentMin  : ;
      FanSpeedPercentMax  : ;
      FanSpeedRPMMin      : ;
      FanSpeedRPMMax      : ;
      BiosDate            : Result:=PWideChar(ADL.Adapters[TMeasure(data).Adapter].BiosDate);
      BiosVersion         : Result:=PWideChar(ADL.Adapters[TMeasure(data).Adapter].BiosVersion);
      BiosPartNumber      : Result:=PWideChar(ADL.Adapters[TMeasure(data).Adapter].BiosPartNumber);
      AdapterIdentifier   : ;
      NumberOfAdapters    : ;
      NumberOfDisplays    : ;
    end;
  end;
end;

procedure Finalize(data: Pointer); stdcall;
begin
  if Assigned(List) then
    FreeAndNil(List);
  if Assigned(ADL) then
    FreeAndNil(ADL);
end;

function GetPluginVersion: Cardinal; stdcall;
begin
  Result:=1;
end;

function GetPluginAuthor: PWideChar; stdcall;
begin
  Result:='NaliLord';
end;

exports
   Initialize,
   Reload,
   Update,
   GetString,
   Finalize,
   GetPluginVersion,
   GetPluginAuthor;

begin
end.
