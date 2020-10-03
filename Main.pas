unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, adl, Vcl.ComCtrls;

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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FADL: TADL;
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
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FADL.Free;
end;

procedure TfrmMain.tmrUpdateTimer(Sender: TObject);
begin
  FADL.Update;

  edTemp.Text:=IntToStr(FADL.Adapters[0].Temp);
  edFan.Text:=IntToStr(FADL.Adapters[0].FanRPM);
  edLoad.Text:=IntToStr(FADL.Adapters[0].Activity);
  edClock.Text:=IntToStr(FADL.Adapters[0].Clock);
  edMemory.Text:=IntToStr(FADL.Adapters[0].Memory);
end;

end.
