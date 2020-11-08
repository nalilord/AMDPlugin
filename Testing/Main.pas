unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, adl, d3dkmt;

type
  TfrmMain = class(TForm)
    btnGetInfo: TButton;
    edTemp: TEdit;
    lblTemp: TLabel;
    edFan: TEdit;
    lblFan: TLabel;
    Label1: TLabel;
    edLoad: TEdit;
    Button1: TButton;
    Label2: TLabel;
    edClock: TEdit;
    Label3: TLabel;
    edMemory: TEdit;
    tmrUpdate: TTimer;
    TrackBar1: TTrackBar;
    Label4: TLabel;
    edVRAM: TEdit;
    GroupBox1: TGroupBox;
    lblMemoryUsage: TStaticText;
    lblSharedLimit: TStaticText;
    lblDedicatedLimit: TStaticText;
    lblSharedUsage: TStaticText;
    lblDedicatedUsage: TStaticText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FADL: TADL;
    FD3DKMT: TD3DKMTStatistics;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnGetInfoClick(Sender: TObject);
begin
  tmrUpdate.Interval:=TrackBar1.Position;
  tmrUpdate.Enabled:=True;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  tmrUpdate.Enabled:=False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FADL:=TADL.Create;
  FADL.Update;
  FD3DKMT:=TD3DKMTStatistics.Create(FADL.Adapters[0].PNP);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FADL.Free;
end;

procedure TfrmMain.tmrUpdateTimer(Sender: TObject);
begin
  FADL.Update;
  FD3DKMT.Update;

  edTemp.Text:=IntToStr(FADL.Adapters[0].Temp);
  edFan.Text:=IntToStr(FADL.Adapters[0].FanRPM);
  edLoad.Text:=IntToStr(FADL.Adapters[0].Activity);
  edClock.Text:=IntToStr(FADL.Adapters[0].Clock);
  edMemory.Text:=IntToStr(FADL.Adapters[0].Memory);
  edVRAM.Text:=IntToStr(Round(FADL.Adapters[0].MemorySize / 1024 / 1024));

  lblMemoryUsage.Caption:=IntToStr(Round(FD3DKMT.MemoryUsage / 1024 / 1024));
  lblSharedLimit.Caption:=IntToStr(Round(FD3DKMT.SharedLimit / 1024 / 1024));
  lblDedicatedLimit.Caption:=IntToStr(Round(FD3DKMT.DedicatedLimit / 1024 / 1024));
  lblSharedUsage.Caption:=IntToStr(Round(FD3DKMT.SharedUsage / 1024 / 1024));
  lblDedicatedUsage.Caption:=IntToStr(Round(FD3DKMT.DedicatedUsage / 1024 / 1024));
end;

end.
