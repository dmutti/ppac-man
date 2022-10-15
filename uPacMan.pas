unit uPacMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uMapGen;

type
  TPacMan = class
  private
    img : TImage;
    Owner : TComponent;
    Parent : TWinControl;
    iSteps,
    iDotsToGo,
    iSpeed,
    iScore: byte;
    wDir, wNewDir : Word;
    tPos, tPrevPos : TPoint;
    bWalking, bChangePic : boolean;
    procedure AddScore(Point : integer);
    procedure WalkUp;
    procedure WalkLeft;
    procedure WalkDown;
    procedure WalkRight;
  public
    Constructor Create(Owner_ : TComponent; Parent_ : TWinControl);
    procedure Walk;
    procedure SetUp;
    property Position : TPoint read tPos write tPos;
    property DotsToGo : byte read iDotsToGo;
    property Speed : byte write iSpeed;
    property NewDirection : word write wNewDir;
  protected
end;

implementation

uses
  uMain;

constructor TPacMan.Create(Owner_ : TComponent; Parent_ : TWinControl);
begin
  Owner := Owner_;
  Parent := Parent_;
  img := TImage.Create(Owner);
  img.Parent := Parent;
  img.Transparent := True;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.SetUp;
begin
  iScore := 0;
  iSteps := 0;
  tPrevPos := tPos;
  img.Picture.LoadFromFile('.\Gfx\PM\pm.bmp');
  img.Left := tPos.X * Size;
  img.Top := tPos.Y * Size;
  img.Visible := True;
  bWalking := True;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.Walk;
begin
  bChangePic := False;
  if bWalking then
  begin
    if (iSteps = 0) then
      bChangePic := True;
    Case wNewDir of
      VK_UP    : WalkUp;
      VK_LEFT  : WalkLeft;
      VK_DOWN  : WalkDown;
      VK_RIGHT : WalkRight;
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.WalkUp;
begin
  if (frmMain.Map[tPos.Y-1][tPos.X] <> '#') then
  begin
    if bChangePic then
      img.Picture.LoadFromFile('.\Gfx\PM\pm-up.gif');
    inc(iSteps);
    img.Top :=  img.Top - 2;
    if (iSteps = 8) then
    begin
      tPos.Y := tPos.Y - 1;
      if (frmMain.Map[tPos.Y][tPos.X] = '.') then
      begin
        AddScore(1);
      end;
      iSteps := 0;
    end;
    wDir := VK_UP;
  end
  else
    case wDir of
      VK_DOWN  : WalkDown;
      VK_LEFT  : WalkLeft;
      VK_RIGHT : WalkRight;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.WalkLeft;
begin
  if (frmMain.Map[tPos.Y][tPos.X-1] <> '#') then
  begin
    if bChangePic then
        img.Picture.LoadFromFile('.\Gfx\PM\pm-left.gif');
    inc(iSteps);
    img.Left :=  img.Left - 2;
    if (iSteps = 8) then
    begin
      tPos.X := tPos.X - 1;
      if (frmMain.Map[tPos.Y][tPos.X] = '.') then
      begin
        AddScore(1);
      end;
      iSteps := 0;
    end;
    wDir := VK_LEFT;
  end
  else
    case wDir of
      VK_UP    : WalkUp;
      VK_DOWN  : WalkDown;
      VK_RIGHT : WalkRight;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.WalkDown;
begin
  if (frmMain.Map[tPos.Y+1][tPos.X] <> '#') then
  begin
    if bChangePic then
      img.Picture.LoadFromFile('.\Gfx\PM\pm-down.gif');
    inc(iSteps);
    img.Top :=  img.Top + 2;
    if (iSteps = 8) then
    begin
      tPos.Y := tPos.Y + 1;
      if (frmMain.Map[tPos.Y][tPos.X] = '.') then
      begin
        AddScore(1);
      end;
      iSteps := 0;
    end;
    wDir := VK_DOWN;
  end
  else
    case wDir of
      VK_UP    : WalkUp;
      VK_LEFT  : WalkLeft;
      VK_RIGHT : WalkRight;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.WalkRight;
begin
  if (frmMain.Map[tPos.Y][tPos.X+1] <> '#') then
  begin
    if bChangePic then
        img.Picture.LoadFromFile('.\Gfx\PM\pm-right.gif');
    inc(iSteps);
    img.Left :=  img.Left + 2;
    if (iSteps = 8) then
    begin
      tPos.X := tPos.X + 1;
      if (frmMain.Map[tPos.Y][tPos.X] = '.') then
      begin
        AddScore(1);
      end;
      iSteps := 0;
    end;
    wDir := VK_RIGHT;
  end
  else
    case wDir of
      VK_UP    : WalkUp;
      VK_DOWN  : WalkDown;
      VK_LEFT  : WalkLeft;
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TPacMan.AddScore(Point : integer);
begin
  case Point of
  1 : begin
        frmMain.EraseDot(tPos);
        inc(iScore);
        frmMain.Status.Panels[1].Text := IntToStr(iScore);
        frmMain.Mapa.Erase(tPos);
      end;
  end;
end;
end.
