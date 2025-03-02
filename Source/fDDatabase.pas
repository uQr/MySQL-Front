unit fDDatabase;

interface {********************************************************************}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ComCtrls,
  SynEdit, SynMemo,
  Forms_Ext, StdCtrls_Ext,
  fSession, fBase, Vcl.ExtCtrls;

type
  TDDatabase = class (TForm_Ext)
    FBCancel: TButton;
    FBCheck: TButton;
    FBFlush: TButton;
    FBHelp: TButton;
    FBOk: TButton;
    FBOptimize: TButton;
    FCollation: TComboBox_Ext;
    FChecked: TLabel;
    FCreated: TLabel;
    FDataSize: TLabel;
    FDefaultCharset: TComboBox_Ext;
    FIndexSize: TLabel;
    FLChecked: TLabel;
    FLCollation: TLabel;
    FLCreated: TLabel;
    FLDataSize: TLabel;
    FLDefaultCharset: TLabel;
    FLIndexSize: TLabel;
    FLName: TLabel;
    FLUnusedSize: TLabel;
    FLUpdated: TLabel;
    FName: TEdit;
    FSource: TSynMemo;
    FUnusedSize: TLabel;
    FUpdated: TLabel;
    GBasics: TGroupBox_Ext;
    GCheck: TGroupBox_Ext;
    GDates: TGroupBox_Ext;
    GFlush: TGroupBox_Ext;
    GOptimize: TGroupBox_Ext;
    GSize: TGroupBox_Ext;
    msCopy: TMenuItem;
    MSource: TPopupMenu;
    msSelectAll: TMenuItem;
    N1: TMenuItem;
    PageControl: TPageControl;
    PSQLWait: TPanel;
    TSBasics: TTabSheet;
    TSExtras: TTabSheet;
    TSInformations: TTabSheet;
    TSSource: TTabSheet;
    procedure FBHelpClick(Sender: TObject);
    procedure FBOkCheckEnabled(Sender: TObject);
    procedure FCollationChange(Sender: TObject);
    procedure FDefaultCharsetChange(Sender: TObject);
    procedure FDefaultCharsetExit(Sender: TObject);
    procedure FNameChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FSourceChange(Sender: TObject);
    procedure TSInformationsShow(Sender: TObject);
    procedure TSSourceShow(Sender: TObject);
    procedure FBOptimizeClick(Sender: TObject);
    procedure TSExtrasShow(Sender: TObject);
    procedure FBCheckClick(Sender: TObject);
    procedure FBFlushClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    procedure Built();
    procedure FormSessionEvent(const Event: TSSession.TEvent);
    function GetName(): string;
    procedure CMChangePreferences(var Message: TMessage); message CM_CHANGEPREFERENCES;
  public
    Session: TSSession;
    Database: TSDatabase;
    function Execute(): Boolean;
    property Name: string read GetName;
  end;

function DDatabase(): TDDatabase;

implementation {***************************************************************}

{$R *.dfm}

uses
  StrUtils,
  fPreferences;

var
  FDatabase: TDDatabase;

function DDatabase(): TDDatabase;
begin
  if (not Assigned(FDatabase)) then
  begin
    Application.CreateForm(TDDatabase, FDatabase);
    FDatabase.Perform(CM_CHANGEPREFERENCES, 0, 0);
  end;

  Result := FDatabase;
end;

{ TDDatabase ******************************************************************}

procedure TDDatabase.Built();
begin
  FName.Text := Database.Name;

  FDefaultCharset.ItemIndex := FDefaultCharset.Items.IndexOf(Database.DefaultCharset); FDefaultCharsetChange(nil);
  FCollation.ItemIndex := FCollation.Items.IndexOf(Database.Collation); FCollationChange(nil);

  FSource.Lines.Text := Database.Source;

  TSSource.TabVisible := Database.Source <> '';

  PageControl.Visible := True;
  PSQLWait.Visible := not PageControl.Visible;

  if (FDefaultCharset.Visible) then
    ActiveControl := FDefaultCharset;
end;

procedure TDDatabase.CMChangePreferences(var Message: TMessage);
begin
  Preferences.SmallImages.GetIcon(iiDatabase, Icon);

  PSQLWait.Caption := Preferences.LoadStr(882);

  TSBasics.Caption := Preferences.LoadStr(108);
  GBasics.Caption := Preferences.LoadStr(85);
  FLName.Caption := Preferences.LoadStr(35) + ':';
  FLDefaultCharset.Caption := Preferences.LoadStr(682) + ':';
  FLCollation.Caption := Preferences.LoadStr(702) + ':';

  TSInformations.Caption := Preferences.LoadStr(121);
  GDates.Caption := Preferences.LoadStr(122);
  FLCreated.Caption := Preferences.LoadStr(118) + ':';
  FLUpdated.Caption := Preferences.LoadStr(119) + ':';
  GSize.Caption := Preferences.LoadStr(125);
  FLIndexSize.Caption := Preferences.LoadStr(163) + ':';
  FLDataSize.Caption := Preferences.LoadStr(127) + ':';

  TSExtras.Caption := Preferences.LoadStr(73);
  GOptimize.Caption := Preferences.LoadStr(171);
  FLUnusedSize.Caption := Preferences.LoadStr(128) + ':';
  FBOptimize.Caption := Preferences.LoadStr(130);
  GCheck.Caption := Preferences.LoadStr(172);
  FLChecked.Caption := Preferences.LoadStr(120) + ':';
  FBCheck.Caption := Preferences.LoadStr(131);
  GFlush.Caption := Preferences.LoadStr(328);
  FBFlush.Caption := Preferences.LoadStr(329);

  TSSource.Caption := Preferences.LoadStr(198);
  FSource.Font.Name := Preferences.SQLFontName;
  FSource.Font.Style := Preferences.SQLFontStyle;
  FSource.Font.Color := Preferences.SQLFontColor;
  FSource.Font.Size := Preferences.SQLFontSize;
  FSource.Font.Charset := Preferences.SQLFontCharset;
  if (Preferences.Editor.LineNumbersForeground = clNone) then
    FSource.Gutter.Font.Color := clWindowText
  else
    FSource.Gutter.Font.Color := Preferences.Editor.LineNumbersForeground;
  if (Preferences.Editor.LineNumbersBackground = clNone) then
    FSource.Gutter.Color := clBtnFace
  else
    FSource.Gutter.Color := Preferences.Editor.LineNumbersBackground;
  FSource.Gutter.Font.Style := Preferences.Editor.LineNumbersStyle;

  msCopy.Caption := Preferences.LoadStr(64) + #9 + ShortCutToText(scCtrl + Ord('C'));

  msSelectAll.Action := MainAction('aESelectAll'); msSelectAll.ShortCut := 0;

  FBHelp.Caption := Preferences.LoadStr(167);
  FBOk.Caption := Preferences.LoadStr(29);
  FBCancel.Caption := Preferences.LoadStr(30);
end;

function TDDatabase.Execute(): Boolean;
begin
  ShowModal();
  Result := ModalResult = mrOk;
end;

procedure TDDatabase.FBCheckClick(Sender: TObject);
var
  I: Integer;
  List: TList;
begin
  List := TList.Create();
  for I := 0 to Database.Tables.Count - 1 do
    if (Database.Tables[I] is TSBaseTable) then
      List.Add(Database.Tables[I]);
  Database.CheckTables(List);
  List.Free();

  FBCheck.Enabled := False;
  ActiveControl := FBCancel;

  FBCancel.Caption := Preferences.LoadStr(231);
end;

procedure TDDatabase.FBFlushClick(Sender: TObject);
var
  I: Integer;
  List: TList;
begin
  List := TList.Create();
  for I := 0 to Database.Tables.Count - 1 do
    if (Database.Tables[I] is TSBaseTable) then
      List.Add(Database.Tables[I]);
  Database.FlushTables(List);
  List.Free();

  FBFlush.Enabled := False;
  ActiveControl := FBCancel;

  FBCancel.Caption := Preferences.LoadStr(231);
end;

procedure TDDatabase.FBHelpClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TDDatabase.FBOkCheckEnabled(Sender: TObject);
begin
  FBOk.Enabled := (FName.Text <> '')
    and (not Assigned(Session.DatabaseByName(FName.Text)) or (Assigned(Database) and (((Session.LowerCaseTableNames = 0) and (FName.Text = Database.Name)) or ((Session.LowerCaseTableNames > 0) and ((lstrcmpi(PChar(FName.Text), PChar(Database.Name)) = 0))))));
end;

procedure TDDatabase.FBOptimizeClick(Sender: TObject);
var
  I: Integer;
  List: TList;
begin
  List := TList.Create();
  for I := 0 to Database.Tables.Count - 1 do
    if (Database.Tables[I] is TSBaseTable) then
      List.Add(Database.Tables[I]);
  Database.OptimizeTables(List);
  List.Free();

  FBOptimize.Enabled := False;
  ActiveControl := FBCancel;

  FBCancel.Caption := Preferences.LoadStr(231);
end;

procedure TDDatabase.FCollationChange(Sender: TObject);
begin
  FBOkCheckEnabled(Sender);
  TSSource.TabVisible := False;
end;

procedure TDDatabase.FDefaultCharsetChange(Sender: TObject);
var
  DefaultCharset: TSCharset;
  I: Integer;
begin
  DefaultCharset := Session.CharsetByName(FDefaultCharset.Text);

  FCollation.Items.Clear();
  if (Assigned(Session.Collations)) then
  begin
    for I := 0 to Session.Collations.Count - 1 do
      if (Assigned(DefaultCharset) and (Session.Collations[I].Charset = DefaultCharset)) then
        FCollation.Items.Add(Session.Collations[I].Name);
    if (Assigned(DefaultCharset)) then
      FCollation.ItemIndex := FCollation.Items.IndexOf(DefaultCharset.DefaultCollation.Caption);
  end;
  FCollation.Enabled := FDefaultCharset.Text <> ''; FLCollation.Enabled := FCollation.Enabled;

  FBOkCheckEnabled(Sender);
  TSSource.TabVisible := False;
end;

procedure TDDatabase.FDefaultCharsetExit(Sender: TObject);
begin
  if ((FDefaultCharset.Text = '') and Assigned(Database)) then
    FDefaultCharset.Text := Database.DefaultCharset;
end;

procedure TDDatabase.FNameChange(Sender: TObject);
begin
  FBOkCheckEnabled(Sender);
  TSSource.TabVisible := False;
end;

procedure TDDatabase.FormSessionEvent(const Event: TSSession.TEvent);
begin
  if ((Event.EventType = etItemValid) and (Event.SItem = Database)) then
    if (not PageControl.Visible) then
      Built()
    else
      TSExtrasShow(nil)
  else if ((Event.EventType in [etItemCreated, etItemAltered]) and (Event.SItem is TSDatabase)) then
    Close()
  else if ((Event.EventType = etAfterExecuteSQL) and (Event.Session.ErrorCode <> 0)) then
  begin
    PageControl.Visible := True;
    PSQLWait.Visible := not PageControl.Visible;
  end;
end;

procedure TDDatabase.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  NewHeight := Height;
end;

procedure TDDatabase.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  NewDatabase: TSDatabase;
begin
  if ((ModalResult = mrOk) and PageControl.Visible) then
  begin
    NewDatabase := TSDatabase.Create(Session);
    if (Assigned(Database)) then
      NewDatabase.Assign(Database);

    NewDatabase.Name := Trim(FName.Text);
    if (not FDefaultCharset.Visible) then
      NewDatabase.DefaultCharset := ''
    else
      NewDatabase.DefaultCharset := Trim(FDefaultCharset.Text);
    if (not FCollation.Visible) then
      NewDatabase.Collation := ''
    else
      NewDatabase.Collation := Trim(FCollation.Text);

    if (not Assigned(Database) or not Assigned(Session.DatabaseByName(Database.Name))) then
      CanClose := Session.AddDatabase(NewDatabase)
    else
      CanClose := Session.UpdateDatabase(Database, NewDatabase);

    NewDatabase.Free();

    if (not CanClose) then
    begin
      ModalResult := mrNone;
      PageControl.Visible := CanClose;
      PSQLWait.Visible := not PageControl.Visible;
    end;

    FBOk.Enabled := False;
  end;
end;

procedure TDDatabase.FormCreate(Sender: TObject);
begin
  Constraints.MinWidth := Width;
  Constraints.MinHeight := Height;

  BorderStyle := bsSizeable;

  if ((Preferences.Database.Width >= Width) and (Preferences.Database.Height >= Height)) then
  begin
    Width := Preferences.Database.Width;
    Height := Preferences.Database.Height;
  end;

  FSource.Highlighter := MainHighlighter;

  PageControl.ActivePage := TSBasics; // TSInformationsShow soll nicht vorzeitig aufgerufen werden
end;

procedure TDDatabase.FormHide(Sender: TObject);
begin
  Session.UnRegisterEventProc(FormSessionEvent);

  Preferences.Database.Width := Width;
  Preferences.Database.Height := Height;

  FSource.Lines.Clear();

  PageControl.ActivePage := TSBasics; // TSInformationsShow soll nicht vorzeitig aufgerufen werden
end;

procedure TDDatabase.FormShow(Sender: TObject);
var
  DatabaseName: string;
  I: Integer;
begin
  Session.RegisterEventProc(FormSessionEvent);

  if (not Assigned(Database)) then
    Caption := Preferences.LoadStr(147)
  else
    Caption := Preferences.LoadStr(842, Database.Name);

  if (not Assigned(Database)) then
    HelpContext := 1044
  else
    HelpContext := 1095;

  if (not Assigned(Database) and (Session.LowerCaseTableNames = 1)) then
    FName.CharCase := ecLowerCase
  else
    FName.CharCase := ecNormal;

  FDefaultCharset.Items.Clear();
  for I := 0 to Session.Charsets.Count - 1 do
    FDefaultCharset.Items.Add(Session.Charsets[I].Name);

  if (not Assigned(Database)) then
  begin
    FName.Text := Preferences.LoadStr(145);
    while (Assigned(Session.DatabaseByName(FName.Text))) do
    begin
      DatabaseName := FName.Text;
      Delete(DatabaseName, 1, Length(Preferences.LoadStr(145)));
      if (DatabaseName = '') then DatabaseName := '1';
      DatabaseName := Preferences.LoadStr(145) + IntToStr(StrToInt(DatabaseName) + 1);
      FName.Text := DatabaseName;
    end;

    FDefaultCharset.ItemIndex := FDefaultCharset.Items.IndexOf(Session.DefaultCharset); FDefaultCharsetChange(Sender);

    TSSource.TabVisible := False;

    PageControl.Visible := True;
    PSQLWait.Visible := not PageControl.Visible;
  end
  else
  begin
    PageControl.Visible := Database.Update(True);
    PSQLWait.Visible := not PageControl.Visible;

    if (PageControl.Visible) then
      Built();
  end;

  FName.Enabled := not Assigned(Database) or not Assigned(Session.DatabaseByName(Database.Name));
  FDefaultCharset.Visible := Session.ServerVersion >= 40101; FLDefaultCharset.Visible := FDefaultCharset.Visible;
  FCollation.Visible := Session.ServerVersion >= 40101; FLCollation.Visible := FCollation.Visible;

  FBOptimize.Enabled := True;
  FBCheck.Enabled := True;
  FBFlush.Enabled := True;

  TSInformations.TabVisible := not FName.Enabled;
  TSExtras.TabVisible := Assigned(Database);

  FName.SelectAll();

  FBOk.Enabled := PageControl.Visible and not Assigned(Database);

  ActiveControl := FBCancel;
  if (PageControl.Visible) then
    if (FName.Enabled) then
      ActiveControl := FName
    else if (FDefaultCharset.Visible) then
      ActiveControl := FDefaultCharset
    else
      ActiveControl := FBCancel;
end;

procedure TDDatabase.FSourceChange(Sender: TObject);
begin
  MainAction('aECopyToFile').Enabled := FSource.SelText <> '';
end;

function TDDatabase.GetName(): string;
begin
  Result := FName.Text;
end;

procedure TDDatabase.TSExtrasShow(Sender: TObject);
var
  DateTime: TDateTime;
  I: Integer;
  Size: Int64;
begin
  Size := 0;
  for I := 0 to Database.Tables.Count - 1 do
    if (Database.Tables[I] is TSBaseTable) then
      Inc(Size, TSBaseTable(Database.Tables[I]).UnusedSize);
  FUnusedSize.Caption := SizeToStr(Size);

  DateTime := Now();
  for I := 0 to Database.Tables.Count - 1 do
    if ((Database.Tables[I] is TSBaseTable) and (TSBaseTable(Database.Tables[I]).Checked < DateTime)) then
      DateTime := TSBaseTable(Database.Tables[I]).Checked;
  if (DateTime <= 0) then
    FChecked.Caption := '???'
  else
    FChecked.Caption := SysUtils.DateTimeToStr(DateTime, LocaleFormatSettings);
end;

procedure TDDatabase.TSInformationsShow(Sender: TObject);
begin
  Session.BeginSynchron();
  Database.Update(True);
  Session.EndSynchron();

  FCreated.Caption := '???';
  FUpdated.Caption := '???';
  FIndexSize.Caption := '???';
  FDataSize.Caption := '???';
  FUnusedSize.Caption := '???';

  if (Database.Created = 0) then FCreated.Caption := '???' else FCreated.Caption := SysUtils.DateTimeToStr(Database.Created, LocaleFormatSettings);
  if (Database.Updated = 0) then FUpdated.Caption := '???' else FUpdated.Caption := SysUtils.DateTimeToStr(Database.Updated, LocaleFormatSettings);

  FIndexSize.Caption := SizeToStr(Database.IndexSize);
  FDataSize.Caption := SizeToStr(Database.DataSize);
end;

procedure TDDatabase.TSSourceShow(Sender: TObject);
begin
  if (FSource.Lines.Count = 0) then
    FSource.Lines.Text := Database.Source + #13#10;
end;

initialization
  FDatabase := nil;
end.
