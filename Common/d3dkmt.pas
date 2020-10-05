unit d3dkmt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Win.Registry, System.IniFiles, System.Generics.Defaults,
  System.Generics.Collections, System.Contnrs, System.SyncObjs, d3dkmthk;

type
  TD3DKMTStatistics = class
  private
    FDeviceName: String;
    FInitialized: Boolean;
    FOpenAdapter: D3DKMT_OPENADAPTERFROMDEVICENAME;
    FUsedMemory: UInt64;
    FSegments: Cardinal;
  protected
    procedure Initialize;
    procedure Finalize;
  public
    constructor Create(ADevicePNP: String);
    destructor Destroy; override;
    procedure Update;
    property UsedMemory: UInt64 read FUsedMemory;
  end;

implementation

{ TD3DKMTStatistics }

constructor TD3DKMTStatistics.Create(ADevicePNP: String);
begin
  inherited Create;

  FDeviceName:='\\?\' + StringReplace(ADevicePNP, '\', '#', [rfReplaceAll, rfIgnoreCase]) + '#{1CA05180-A699-450A-9A0C-DE4FBE3DDD89}';

  Initialize;
end;

destructor TD3DKMTStatistics.Destroy;
begin

end;

procedure TD3DKMTStatistics.Finalize;
var
  CloseAdapter: D3DKMT_CLOSEADAPTER;
begin
  if FInitialized then
  begin
    CloseAdapter.hAdapter:=FOpenAdapter.hAdapter;
    D3DKMTCloseAdapter(CloseAdapter);
    FInitialized:=False;
  end;
end;

procedure TD3DKMTStatistics.Initialize;
var
  QueryStats: D3DKMT_QUERYSTATISTICS;
begin
  FInitialized:=True;

  ZeroMemory(@FOpenAdapter, SizeOf(FOpenAdapter));
  FOpenAdapter.pDeviceName:=PChar(FDeviceName);
  if Succeeded(D3DKMTOpenAdapterFromDeviceName(FOpenAdapter)) then
  begin
    ZeroMemory(@QueryStats, SizeOf(QueryStats));
    QueryStats.Typ:=D3DKMT_QUERYSTATISTICS_ADAPTER;
    QueryStats.AdapterLuid:=FOpenAdapter.AdapterLuid;
    if Succeeded(D3DKMTQueryStatistics(QueryStats)) then
      FSegments:=QueryStats.QueryResult.AdapterInformation.NbSegments
    else
      Finalize;
  end else
    Finalize;
end;

procedure TD3DKMTStatistics.Update;
var
  I: Integer;
  QueryStats: D3DKMT_QUERYSTATISTICS;
begin
  FUsedMemory:=0;

  if FInitialized then
  begin
    for I:=0 to FSegments - 1 do
    begin
      ZeroMemory(@QueryStats, SizeOf(QueryStats));
      QueryStats.Typ:=D3DKMT_QUERYSTATISTICS_SEGMENT;
      QueryStats.AdapterLuid:=FOpenAdapter.AdapterLuid;
      QueryStats.QuerySegment.SegmentId:=I;
      if Succeeded(D3DKMTQueryStatistics(QueryStats)) then
        Inc(FUsedMemory, QueryStats.QueryResult.SegmentInformation.BytesResident);
    end;
  end;
end;

end.
