unit fDExport;

interface {********************************************************************}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, DBGrids,
  ComCtrls_Ext, Forms_Ext, StdCtrls_Ext, ExtCtrls_Ext, Dialogs_Ext,
  MySQLDB,
  fSession, fPreferences, fTools,
  fBase;

type
  TDExport = class (TForm_Ext)
    FAccessFile: TRadioButton;
    FBBack: TButton;
    FBCancel: TButton;
    FBDataSource: TButton;
    FBFilename: TButton;
    FBForward: TButton;
    FBHelp: TButton;
    FCSVHeadline: TCheckBox;
    FDaily: TRadioButton;
    FDatabaseNodeAttribute: TEdit;
    FDatabaseNodeCustom: TRadioButton;
    FDatabaseNodeDisabled: TRadioButton;
    FDatabaseNodeName: TRadioButton;
    FDatabaseNodeText: TEdit;
    FDataSource: TEdit;
    FDestinationField1: TEdit;
    FDoneRecords: TLabel;
    FDoneObjects: TLabel;
    FDoneTime: TLabel;
    FDropStmts: TCheckBox;
    FEnabled: TCheckBox;
    FEntieredRecords: TLabel;
    FEntieredObjects: TLabel;
    FEntieredTime: TLabel;
    FErrorMessages: TRichEdit;
    FErrors: TLabel;
    FExcelFile: TRadioButton;
    FSourceField1: TComboBox_Ext;
    FSourceField2: TComboBox_Ext;
    FFieldNodeAttribute: TEdit;
    FFieldNodeCustom: TRadioButton;
    FFieldNodeName: TRadioButton;
    FFieldNodeText: TEdit;
    FFilename: TEdit;
    FHTMLData: TCheckBox;
    FHTMLFile: TRadioButton;
    FHTMLMemoContent: TCheckBox;
    FHTMLNullText: TCheckBox;
    FHTMLRowBGColor: TCheckBox;
    FHTMLStructure: TCheckBox;
    FL1DatabaseTagFree: TLabel;
    FL1FieldNodeCustom: TLabel;
    FL1TableNodeCustom: TLabel;
    FL2DatabaseNodeCustom: TLabel;
    FL2FieldNodeCustom: TLabel;
    FL2RecordTag: TLabel;
    FL2RootNodeText: TLabel;
    FL2TableNodeCustom: TLabel;
    FL3RecordTag: TLabel;
    FL3RootNodeText: TLabel;
    FLCSVHeadline: TLabel;
    FLDatabaseNode: TLabel;
    FLDataSource: TLabel;
    FLDestinationFields: TLabel;
    FLDone: TLabel;
    FLDrop: TLabel;
    FLEnabled: TLabel;
    FLEntiered: TLabel;
    FLErrors: TLabel;
    FLExecution: TLabel;
    FLExportType: TLabel;
    FLFieldNode: TLabel;
    FLSourceFields: TLabel;
    FLFilename: TLabel;
    FLHTMLBGColorEnabled: TLabel;
    FLHTMLNullValues: TLabel;
    FLHTMLViewDatas: TLabel;
    FLHTMLWhat: TLabel;
    FLName: TLabel;
    FLProgressRecords: TLabel;
    FLProgressObjects: TLabel;
    FLProgressTime: TLabel;
    FLQuoteChar: TLabel;
    FLQuoteValues: TLabel;
    FLRecordNode: TLabel;
    FLReferrer1: TLabel;
    FLRootNode: TLabel;
    FLSeparator: TLabel;
    FLSQLWhat: TLabel;
    FLStart: TLabel;
    FLTableNode: TLabel;
    FMonthly: TRadioButton;
    FName: TEdit;
    FODBC: TRadioButton;
    FPDFFile: TRadioButton;
    FProgressBar: TProgressBar;
    FQuoteAll: TRadioButton;
    FQuoteChar: TEdit;
    FQuoteNone: TRadioButton;
    FQuoteStrings: TRadioButton;
    FRecordNodeText: TEdit;
    FReplaceData: TCheckBox;
    FRootNodeText: TEdit;
    FSelect: TTreeView_Ext;
    FSeparator: TEdit;
    FSeparatorChar: TRadioButton;
    FSeparatorTab: TRadioButton;
    FSingle: TRadioButton;
    FSQLData: TCheckBox;
    FSQLFile: TRadioButton;
    FSQLStructure: TCheckBox;
    FStartDate: TDateTimePicker;
    FStartTime: TDateTimePicker;
    FTableNodeAttribute: TEdit;
    FTableNodeCustom: TRadioButton;
    FTableNodeDisabled: TRadioButton;
    FTableNodeName: TRadioButton;
    FTableNodeText: TEdit;
    FTextFile: TRadioButton;
    FWeekly: TRadioButton;
    FXMLFile: TRadioButton;
    GBasics: TGroupBox_Ext;
    GCSVOptions: TGroupBox_Ext;
    GErrors: TGroupBox_Ext;
    GFields: TGroupBox_Ext;
    GHTMLOptions: TGroupBox_Ext;
    GHTMLWhat: TGroupBox_Ext;
    GProgress: TGroupBox_Ext;
    GSelect: TGroupBox_Ext;
    GSQLOptions: TGroupBox_Ext;
    GSQLWhat: TGroupBox_Ext;
    GTask: TGroupBox_Ext;
    GXMLHow: TGroupBox_Ext;
    PageControl: TPageControl;
    PDatabaseNode: TPanel_Ext;
    PErrorMessages: TPanel_Ext;
    PFieldNode: TPanel_Ext;
    PQuote: TPanel_Ext;
    PrintDialog: TPrintDialog_Ext;
    PSelect: TPanel_Ext;
    PSeparator: TPanel_Ext;
    PSQLWait: TPanel_Ext;
    PTableNode: TPanel_Ext;
    SaveDialog: TSaveDialog_Ext;
    ScrollBox: TScrollBox;
    TSCSVOptions: TTabSheet;
    TSExecute: TTabSheet;
    TSFields: TTabSheet;
    TSHTMLOptions: TTabSheet;
    TSJob: TTabSheet;
    TSSelect: TTabSheet;
    TSSQLOptions: TTabSheet;
    TSTask: TTabSheet;
    TSXMLOptions: TTabSheet;
    procedure FBBackClick(Sender: TObject);
    procedure FBCancelClick(Sender: TObject);
    procedure FBFilenameClick(Sender: TObject);
    procedure FBForwardClick(Sender: TObject);
    procedure FBHelpClick(Sender: TObject);
    procedure FDatabaseDblClick(Sender: TObject);
    procedure FDatabaseNodeClick(Sender: TObject);
    procedure FDatabaseNodeKeyPress(Sender: TObject; var Key: Char);
    procedure FDestinationField1Change(Sender: TObject);
    procedure FExportTypeChange(Sender: TObject);
    procedure FSourceField1Change(Sender: TObject);
    procedure FSourceField1Exit(Sender: TObject);
    procedure FFieldTagClick(Sender: TObject);
    procedure FFieldTagKeyPress(Sender: TObject; var Key: Char);
    procedure FHTMLDataClick(Sender: TObject);
    procedure FHTMLDataKeyPress(Sender: TObject; var Key: Char);
    procedure FHTMLStructureClick(Sender: TObject);
    procedure FHTMLStructureKeyPress(Sender: TObject; var Key: Char);
    procedure FODBCSelectDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FQuoteCharExit(Sender: TObject);
    procedure FQuoteClick(Sender: TObject);
    procedure FQuoteKeyPress(Sender: TObject; var Key: Char);
    procedure FSelectChange(Sender: TObject; Node: TTreeNode);
    procedure FSelectGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure FSelectExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure FSeparatorClick(Sender: TObject);
    procedure FSeparatorKeyPress(Sender: TObject; var Key: Char);
    procedure FSQLOptionClick(Sender: TObject);
    procedure FSQLOptionKeyPress(Sender: TObject; var Key: Char);
    procedure FTableTagClick(Sender: TObject);
    procedure FTableTagKeyPress(Sender: TObject; var Key: Char);
    procedure TSCSVOptionsShow(Sender: TObject);
    procedure TSExecuteShow(Sender: TObject);
    procedure TSFieldsShow(Sender: TObject);
    procedure TSHTMLOptionsShow(Sender: TObject);
    procedure TSOptionsHide(Sender: TObject);
    procedure TSSQLOptionsShow(Sender: TObject);
    procedure TSXMLOptionChange(Sender: TObject);
    procedure TSXMLOptionsHide(Sender: TObject);
    procedure TSXMLOptionsShow(Sender: TObject);
    procedure FJobOptionChange(Sender: TObject);
    procedure TSJobShow(Sender: TObject);
    procedure TSSelectShow(Sender: TObject);
    procedure TSTaskShow(Sender: TObject);
    procedure FFilenameChange(Sender: TObject);
    procedure FBDataSourceClick(Sender: TObject);
    procedure ScrollBoxResize(Sender: TObject);
  private
    CodePage: Cardinal;
    Export: TTExport;
    FDestinationFields: array of TEdit;
    FSourceFields: array of TComboBox_Ext;
    Filename: string;
    FLReferrers: array of TLabel;
    FObjects: TList;
    ProgressInfos: TTool.TProgressInfos;
    SingleTable: Boolean;
    Title: string;
    WantedNodeExpand: TTreeNode;
    function BuildTitle(): TSDatabase;
    procedure CheckActivePageChange(const ActivePageIndex: Integer);
    procedure ClearTSFields();
    procedure FormSessionEvent(const Event: TSSession.TEvent);
    function GetDataSource(): Boolean;
    function GetFilename(): Boolean;
    function GetPrinter(): Boolean;
    procedure InitTSFields();
    procedure InitTSJob();
    function InitTSSelect(): Boolean;
    function ObjectsFromFSelect(): Boolean;
    procedure OnError(const Sender: TObject; const Error: TTool.TError; const Item: TTool.TItem; const ShowRetry: Boolean; var Success: TDataAction);
    procedure OnTerminate(Sender: TObject);
    procedure OnUpdate(const AProgressInfos: TTool.TProgressInfos);
    procedure CMChangePreferences(var Message: TMessage); message CM_CHANGEPREFERENCES;
    procedure CMTerminate(var Message: TMessage); message CM_TERMINATE;
    procedure CMPostAfterExecuteSQL(var Message: TMessage); message CM_POST_AFTEREXECUTESQL;
    procedure CMSysFontChanged(var Message: TMessage); message CM_SYSFONTCHANGED;
    procedure CMUpdateProgressInfo(var Message: TMessage); message CM_UPDATEPROGRESSINFO;
  public
    DBGrid: TDBGrid;
    DialogType: (edtNormal, edtCreateJob, edtEditJob, edtExecuteJob);
    ExportType: TPExportType;
    Job: TAJobExport;
    Session: TSSession;
    Window: TForm;
    function Execute(): Boolean;
    property SObjects: TList read FObjects;
  end;

function DExport(): TDExport;

implementation {***************************************************************}

{$R *.dfm}

uses
  Registry, Math, StrUtils, RichEdit, DBCommon,
  SQLUtils,
  fDLogin, fDODBC;

var
  FExport: TDExport;

function DExport(): TDExport;
begin
  if (not Assigned(FExport)) then
  begin
    Application.CreateForm(TDExport, FExport);
    FExport.Perform(CM_CHANGEPREFERENCES, 0, 0);
  end;

  Result := FExport;
end;

{ TDExport ********************************************************************}

function TDExport.BuildTitle(): TSDatabase;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to SObjects.Count - 1 do
    if (TObject(SObjects[I]) is TSDatabase) then
      if (not Assigned(Result) or (SObjects[I] = Result)) then
        Result := TSDatabase(SObjects[I])
      else
      begin
        Result := nil;
        break;
      end
    else if (TObject(SObjects[I]) is TSDBObject) then
      if (not Assigned(Result) or (TSDBObject(SObjects[I]).Database = Result)) then
        Result := TSDBObject(SObjects[I]).Database
      else
      begin
        Result := nil;
        break;
      end;

  if (Assigned(DBGrid)) then
    Title := Preferences.LoadStr(362)
  else if (SingleTable) then
    Title := TSObject(SObjects[0]).Name
  else if (Assigned(Result)) then
    Title := Result.Name
  else
    Title := ReplaceStr(Session.Caption, ':', '_');
end;

procedure TDExport.CheckActivePageChange(const ActivePageIndex: Integer);
var
  I: Integer;
  NextActivePageIndex: Integer;
begin
  FBBack.Enabled := False;
  for I := ActivePageIndex - 1 downto 0 do
    FBBack.Enabled := FBBack.Enabled or PageControl.Pages[I].Enabled;

  NextActivePageIndex := -1;
  for I := PageControl.PageCount - 1 downto ActivePageIndex + 1 do
    if (PageControl.Pages[I].Enabled) then
      NextActivePageIndex := I;
  if (NextActivePageIndex >= 0) then
    for I := NextActivePageIndex + 1 to PageControl.PageCount - 1 do
      PageControl.Pages[I].Enabled := False;

  if (ActivePageIndex = TSTask.PageIndex) then
    FBForward.Caption := Preferences.LoadStr(230)
  else if (NextActivePageIndex = TSExecute.PageIndex) then
    FBForward.Caption := Preferences.LoadStr(174)
  else if (NextActivePageIndex >= 0) then
    FBForward.Caption := Preferences.LoadStr(229) + ' >';

  FBForward.Enabled := FBForward.Visible and ((NextActivePageIndex >= 0) or (ActivePageIndex = TSTask.PageIndex));
  FBForward.Default := True;

  FBCancel.Caption := Preferences.LoadStr(30);
  FBCancel.Default := False;

  if ((ActiveControl = FBCancel) and FBForward.Enabled) then
    ActiveControl := FBForward;
end;

procedure TDExport.ClearTSFields();
var
  I: Integer;
begin
  for I := 0 to Length(FSourceFields) - 1 do
  begin
    FSourceFields[I].Free();
    FSourceFields[I] := nil;
  end;
  SetLength(FSourceFields, 0);
  for I := 0 to Length(FLReferrers) - 1 do
  begin
    FLReferrers[I].Free();
    FLReferrers[I] := nil;
  end;
  SetLength(FLReferrers, 0);
  for I := 0 to Length(FDestinationFields) - 1 do
  begin
    FDestinationFields[I].Free();
    FDestinationFields[I] := nil;
  end;
  SetLength(FDestinationFields, 0);
end;

procedure TDExport.CMChangePreferences(var Message: TMessage);
begin
  Preferences.SmallImages.GetIcon(iiExport, Icon);

  SaveDialog.EncodingLabel := Preferences.LoadStr(682) + ':';

  PSQLWait.Caption := Preferences.LoadStr(882);

  GSelect.Caption := Preferences.LoadStr(721);

  GBasics.Caption := Preferences.LoadStr(85);
  FLName.Caption := Preferences.LoadStr(35) + ':';
  FLExportType.Caption := Preferences.LoadStr(200) + ':';
  FSQLFile.Caption := Preferences.LoadStr(409);
  FTextFile.Caption := Preferences.LoadStr(410);
  FExcelFile.Caption := Preferences.LoadStr(801);
  FAccessFile.Caption := Preferences.LoadStr(695);
  FODBC.Caption := Preferences.LoadStr(607);
  FHTMLFile.Caption := Preferences.LoadStr(453);
  FXMLFile.Caption := Preferences.LoadStr(454);
  FPDFFile.Caption := Preferences.LoadStr(890);
  FLFilename.Caption := Preferences.LoadStr(348) + ':';
  FLDataSource.Caption := Preferences.LoadStr(38) + ':';

  GSQLWhat.Caption := Preferences.LoadStr(227);
  FLSQLWhat.Caption := Preferences.LoadStr(218) + ':';
  FSQLStructure.Caption := Preferences.LoadStr(215);
  FSQLData.Caption := Preferences.LoadStr(216);

  GSQLOptions.Caption := Preferences.LoadStr(238);
  FLDrop.Caption := Preferences.LoadStr(242) + ':';
  FDropStmts.Caption := Preferences.LoadStr(243);
  FReplaceData.Caption := LowerCase(Preferences.LoadStr(416));

  GCSVOptions.Caption := Preferences.LoadStr(238);
  FLCSVHeadline.Caption := Preferences.LoadStr(393) + ':';
  FCSVHeadline.Caption := Preferences.LoadStr(408);
  FLSeparator.Caption := Preferences.LoadStr(352) + ':';
  FSeparatorTab.Caption := Preferences.LoadStr(354);
  FSeparatorChar.Caption := Preferences.LoadStr(355) + ':';
  FLQuoteValues.Caption := Preferences.LoadStr(353) + ':';
  FQuoteNone.Caption := Preferences.LoadStr(359);
  FQuoteStrings.Caption := Preferences.LoadStr(360);
  FQuoteAll.Caption := Preferences.LoadStr(361);
  FLQuoteChar.Caption := Preferences.LoadStr(356) + ':';

  GProgress.Caption := Preferences.LoadStr(224);
  FLEntiered.Caption := Preferences.LoadStr(211) + ':';
  FLDone.Caption := Preferences.LoadStr(232) + ':';
  FLProgressObjects.Caption := Preferences.LoadStr(909) + ':';
  FLProgressRecords.Caption := Preferences.LoadStr(235) + ':';
  FLProgressTime.Caption := Preferences.LoadStr(661) + ':';
  FLErrors.Caption := Preferences.LoadStr(391) + ':';

  GXMLHow.Caption := Preferences.LoadStr(238);
  FLRootNode.Caption := 'Root:';
  FLDatabaseNode.Caption := Preferences.LoadStr(265) + ':';
  FDatabaseNodeDisabled.Caption := Preferences.LoadStr(554);
  FLTableNode.Caption := Preferences.LoadStr(234) + ':';
  FTableNodeDisabled.Caption := Preferences.LoadStr(554);
  FLRecordNode.Caption := Preferences.LoadStr(124) + ':';
  FLFieldNode.Caption := Preferences.LoadStr(253) + ':';

  GHTMLWhat.Caption := Preferences.LoadStr(227);
  FLHTMLWhat.Caption := Preferences.LoadStr(218) + ':';
  FHTMLData.Caption := Preferences.LoadStr(216);

  GHTMLOptions.Caption := Preferences.LoadStr(238);
  FLHTMLNullValues.Caption := Preferences.LoadStr(498) + ':';
  FHTMLNullText.Caption := Preferences.LoadStr(499);
  FLHTMLViewDatas.Caption := Preferences.LoadStr(574) + ':';
  FHTMLMemoContent.Caption := Preferences.LoadStr(575);
  FLHTMLBGColorEnabled.Caption := Preferences.LoadStr(740) + ':';
  FHTMLRowBGColor.Caption := Preferences.LoadStr(600);

  GFields.Caption := Preferences.LoadStr(253);
  FLSourceFields.Caption := Preferences.LoadStr(401) + ':';
  FLDestinationFields.Caption := Preferences.LoadStr(400) + ':';

  GErrors.Caption := Preferences.LoadStr(392);

  GTask.Caption := Preferences.LoadStr(661);
  FLStart.Caption := Preferences.LoadStr(817) + ':';
  FLExecution.Caption := Preferences.LoadStr(174) + ':';
  FSingle.Caption := Preferences.LoadStr(902);
  FDaily.Caption := Preferences.LoadStr(903);
  FWeekly.Caption := Preferences.LoadStr(904);
  FMonthly.Caption := Preferences.LoadStr(905);
  FLEnabled.Caption := Preferences.LoadStr(812) + ':';
  FEnabled.Caption := Preferences.LoadStr(529);

  FBHelp.Caption := Preferences.LoadStr(167);
  FBBack.Caption := '< ' + Preferences.LoadStr(228);
end;

procedure TDExport.CMTerminate(var Message: TMessage);
var
  Success: Boolean;
begin
  Success := Boolean(Message.WParam);

  FBBack.Enabled := True;
  FBForward.Enabled := False;
  FBCancel.Enabled := True;

  FBCancel.Caption := Preferences.LoadStr(231);
  if (Success) then
    FBCancel.ModalResult := mrOk
  else
    FBCancel.ModalResult := mrCancel;

  if (Assigned(Export)) then
  begin
    Export.WaitFor();
    FreeAndNil(Export);
  end;
end;

procedure TDExport.CMPostAfterExecuteSQL(var Message: TMessage);
var
  Database: TSDatabase;
  I: Integer;
  J: Integer;
  Table: TSBaseTable;
begin
  if ((DialogType in [edtEditJob, edtExecuteJob]) and InitTSSelect() and (DialogType in [edtExecuteJob]) and ObjectsFromFSelect()
    or (DialogType = edtNormal)) then
  begin
    I := 0;
    while (I < SObjects.Count) do
      if (TObject(SObjects[I]) is TSDatabase) then
      begin
        Database := TSDatabase(SObjects[I]);
        if (not Database.Valid) then
          Inc(I)
        else
        begin
          for J := 0 to Database.Tables.Count - 1 do
            if (SObjects.IndexOf(Database.Tables[J]) < 0) then
              SObjects.Add(Database.Tables[J]);
          if (Assigned(Database.Routines)) then
            for J := 0 to Database.Routines.Count - 1 do
              if (SObjects.IndexOf(Database.Routines[J]) < 0) then
                SObjects.Add(Database.Routines[J]);
          SObjects.Delete(I);
        end;
      end
      else if (TObject(SObjects[I]) is TSBaseTable) then
      begin
        Table := TSBaseTable(SObjects[I]);
        if (Assigned(Table.Database.Triggers)) then
          for J := 0 to Table.TriggerCount - 1 do
            if (SObjects.IndexOf(Table.Triggers[J]) < 0) then
              SObjects.Add(Table.Triggers[J]);
        Inc(I);
      end
      else
        Inc(I);
  end;

  BuildTitle();


  Message.Result := LRESULT(Session.Update(SObjects));
  if (Boolean(Message.Result)) then
    if (Assigned(WantedNodeExpand)) then
      WantedNodeExpand.Expand(False)
    else
    begin
      if (not PageControl.Visible) then
      begin
        PageControl.Visible := True;
        PSQLWait.Visible := not PageControl.Visible;
      end;

      if (TSFields.Enabled) then
        InitTSFields();
      if (TSJob.Enabled and (DialogType = edtCreateJob)) then
        InitTSJob();
      CheckActivePageChange(PageControl.ActivePageIndex);
    end;
end;

procedure TDExport.CMSysFontChanged(var Message: TMessage);
begin
  inherited;

  FBFilename.Height := FFilename.Height;

  FDatabaseNodeText.Left := FL1DatabaseTagFree.Left + FL1DatabaseTagFree.Width;
  FDatabaseNodeAttribute.Left := FDatabaseNodeText.Left + FDatabaseNodeText.Width + PDatabaseNode.Canvas.TextWidth('  ') + 2;
  FL2DatabaseNodeCustom.Left := FDatabaseNodeAttribute.Left + FDatabaseNodeAttribute.Width + 1;

  FTableNodeText.Left := FL1TableNodeCustom.Left + FL1TableNodeCustom.Width;
  FTableNodeAttribute.Left := FTableNodeText.Left + FTableNodeText.Width + PTableNode.Canvas.TextWidth('  ') + 2;
  FL2TableNodeCustom.Left := FTableNodeAttribute.Left + FTableNodeAttribute.Width + 1;

  FFieldNodeText.Left := FL1FieldNodeCustom.Left + FL1FieldNodeCustom.Width;
  FFieldNodeAttribute.Left := FFieldNodeText.Left + FFieldNodeText.Width + PFieldNode.Canvas.TextWidth('  ') + 2;
  FL2FieldNodeCustom.Left := FFieldNodeAttribute.Left + FFieldNodeAttribute.Width + 1;
end;

procedure TDExport.CMUpdateProgressInfo(var Message: TMessage);
var
  Infos: TTool.PProgressInfos;
begin
  Infos := TTool.PProgressInfos(Message.LParam);

  if (Infos^.ObjectsSum < 0) then
    FEntieredObjects.Caption := '???'
  else
    FEntieredObjects.Caption := FormatFloat('#,##0', Infos^.ObjectsSum, LocaleFormatSettings);
  if (Infos^.ObjectsDone < 0) then
    FDoneObjects.Caption := '???'
  else
    FDoneObjects.Caption := FormatFloat('#,##0', Infos^.ObjectsDone, LocaleFormatSettings);

  if (Infos^.RecordsSum < 0) then
    FEntieredRecords.Caption := '???'
  else
    FEntieredRecords.Caption := FormatFloat('#,##0', Infos^.RecordsSum, LocaleFormatSettings);
  if (Infos^.RecordsDone < 0) then
    FDoneRecords.Caption := '???'
  else
    FDoneRecords.Caption := FormatFloat('#,##0', Infos^.RecordsDone, LocaleFormatSettings);

  FEntieredTime.Caption := TimeToStr(Infos^.TimeSum, DurationFormatSettings);
  FDoneTime.Caption := TimeToStr(Infos^.TimeDone, DurationFormatSettings);

  FProgressBar.Position := Infos^.Progress;
end;

function TDExport.Execute(): Boolean;
begin
  PageControl.ActivePageIndex := -1;
  ModalResult := mrNone;

  Filename := '';
  Title := '';
  SingleTable := (SObjects.Count = 1) and (TSObject(SObjects[0]) is TSTable);

  if ((Assigned(DBGrid) or (SObjects.Count > 0)) and (DialogType = edtNormal)) then
    case (ExportType) of
      etODBC:
        if (not GetDataSource()) then
          ModalResult := mrCancel;
      etPrinter:
        if (not GetPrinter()) then
          ModalResult := mrCancel;
      else
        if (not GetFilename()) then
          ModalResult := mrCancel;
    end;

  Result := (ModalResult = mrNone) and (ShowModal() = mrOk);
end;

procedure TDExport.FBBackClick(Sender: TObject);
var
  ActivePageIndex: Integer;
begin
  for ActivePageIndex := PageControl.ActivePageIndex - 1 downto 0 do
    if (PageControl.Pages[ActivePageIndex].Enabled) then
    begin
      PageControl.ActivePageIndex := ActivePageIndex;
      Exit;
    end;
end;

procedure TDExport.FBCancelClick(Sender: TObject);
begin
  if (Assigned(Export)) then
  begin
    Export.Terminate();
    FBCancel.Enabled := False;
  end;
end;

procedure TDExport.FBDataSourceClick(Sender: TObject);
begin
  if (DODBC.Execute()) then
  begin
    FDataSource.Text := DODBC.DataSource;
    FJobOptionChange(nil);
  end;
end;

procedure TDExport.FBFilenameClick(Sender: TObject);
begin
  Filename := FFilename.Text;
  if (GetFilename()) then
  begin
    FFilename.Text := Filename;
    FJobOptionChange(Sender);
  end;
end;

procedure TDExport.FBForwardClick(Sender: TObject);
var
  ActivePageIndex: Integer;
begin
  if (PageControl.ActivePageIndex = TSTask.PageIndex) then
    ModalResult := mrOk
  else
    for ActivePageIndex := PageControl.ActivePageIndex + 1 to PageControl.PageCount - 1 do
      if (PageControl.Pages[ActivePageIndex].Enabled) then
      begin
        PageControl.ActivePageIndex := ActivePageIndex;
        Exit;
      end;
end;

procedure TDExport.FBHelpClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TDExport.FDatabaseDblClick(Sender: TObject);
begin
  FBForward.Click();
end;

procedure TDExport.FDatabaseNodeClick(Sender: TObject);
begin
  FDatabaseNodeText.Enabled := FDatabaseNodeCustom.Checked;

  TSXMLOptionChange(Sender);
end;

procedure TDExport.FDatabaseNodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  FDatabaseNodeClick(Sender);
end;

procedure TDExport.FDestinationField1Change(Sender: TObject);
var
  I: Integer;
  J: Integer;
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else
    TabSheet := TSExecute;
  TabSheet.Enabled := False;
  for I := 0 to Length(FSourceFields) - 1 do
    if ((FSourceFields[I].ItemIndex > 0) and (FDestinationFields[I].Text <> '')) then
      TabSheet.Enabled := True;

  for I := 0 to Length(FSourceFields) - 1 do
    for J := 0 to I - 1 do
      if ((I <> J) and FDestinationFields[I].Enabled and FDestinationFields[J].Enabled and (lstrcmpi(PChar(FDestinationFields[J].Text), PChar(FDestinationFields[I].Text)) = 0)) then
        TabSheet.Enabled := False;

  CheckActivePageChange(TSFields.PageIndex);
end;

procedure TDExport.FExportTypeChange(Sender: TObject);
begin
  FFilename.Text := '';
  FDataSource.Text := '';

  FJobOptionChange(Sender);
end;

procedure TDExport.FSourceField1Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Length(FDestinationFields) - 1 do
    if (Sender = FSourceFields[I]) then
    begin
      FDestinationFields[I].Enabled := (FSourceFields[I].ItemIndex > 0) and (ExportType in [etTextFile, etExcelFile, etHTMLFile, etPDFFile, etXMLFile, etPrinter]);
      FDestinationFields[I].Text := FSourceFields[I].Text;
    end;

  if (Length(FDestinationFields) > 0) then
    FDestinationField1Change(Sender);

  FBForward.Enabled := False;
  for I := 0 to Length(FSourceFields) - 1 do
    if (FSourceFields[I].ItemIndex > 0) then
      FBForward.Enabled := True;
end;

procedure TDExport.FSourceField1Exit(Sender: TObject);
var
  I: Integer;
begin
  if (Sender is TComboBox_Ext) then
    for I := 0 to Length(FSourceFields) - 1 do
      if ((FSourceFields[I] <> Sender) and (FSourceFields[I].ItemIndex = TComboBox_Ext(Sender).ItemIndex)) then
      begin
        FSourceFields[I].ItemIndex := 0;
        FSourceField1Change(FSourceFields[I]);
      end;
end;

procedure TDExport.FFieldTagClick(Sender: TObject);
begin
  FFieldNodeText.Enabled := FFieldNodeCustom.Checked;

  TSXMLOptionChange(Sender);
end;

procedure TDExport.FFieldTagKeyPress(Sender: TObject;
  var Key: Char);
begin
  FFieldTagClick(Sender);
end;

procedure TDExport.FFilenameChange(Sender: TObject);
begin
  Filename := Trim(FFilename.Text);
end;

procedure TDExport.FHTMLDataClick(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else
    TabSheet := TSExecute;

  FLHTMLNullValues.Enabled := FHTMLData.Checked;
  FHTMLNullText.Enabled := FHTMLData.Checked;
  FLHTMLViewDatas.Enabled := FHTMLData.Checked;
  FHTMLMemoContent.Enabled := FHTMLData.Checked;
  FLHTMLBGColorEnabled.Enabled := FHTMLData.Checked;
  FHTMLRowBGColor.Enabled := FHTMLData.Checked;

  TabSheet.Enabled := FHTMLStructure.Checked or FHTMLData.Checked;
  CheckActivePageChange(TSHTMLOptions.PageIndex);
end;

procedure TDExport.FHTMLDataKeyPress(Sender: TObject; var Key: Char);
begin
  FHTMLDataClick(Sender);
end;

procedure TDExport.FHTMLStructureClick(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else
    TabSheet := TSExecute;

  TabSheet.Enabled := FHTMLStructure.Checked or FHTMLData.Checked;

  CheckActivePageChange(TSHTMLOptions.PageIndex);
end;

procedure TDExport.FHTMLStructureKeyPress(Sender: TObject; var Key: Char);
begin
  FHTMLStructureClick(Sender);
end;

procedure TDExport.FJobOptionChange(Sender: TObject);
var
  I: Integer;
  TabSheet: TTabSheet;
begin
  if (FSQLFile.Checked) then
    ExportType := etSQLFile
  else if (FTextFile.Checked) then
    ExportType := etTextFile
  else if (FExcelFile.Checked) then
    ExportType := etExcelFile
  else if (FAccessFile.Checked) then
    ExportType := etAccessFile
  else if (FODBC.Checked) then
    ExportType := etODBC
  else if (FHTMLFile.Checked) then
    ExportType := etHTMLFile
  else if (FXMLFile.Checked) then
    ExportType := etXMLFile
  else if (FPDFFile.Checked) then
    ExportType := etPDFFile
  else
    ExportType := etUnknown;
  FFilename.Visible := ExportType in [etSQLFile, etTextFile, etExcelFile, etAccessFile, etHTMLFile, etXMLFile, etPDFFile];
  FLFilename.Visible := FFilename.Visible; FBFilename.Visible := FFilename.Visible;
  FDataSource.Visible := ExportType in [etODBC];
  FLDataSource.Visible := FDataSource.Visible; FBDataSource.Visible := FDataSource.Visible;

  TSSQLOptions.Enabled := (ExportType in [etSQLFile]) and (Filename <> '');
  TSCSVOptions.Enabled := (ExportType in [etTextFile]) and (Filename <> '');
  TSXMLOptions.Enabled := (ExportType in [etXMLFile]) and (Filename <> '');
  TSHTMLOptions.Enabled := (ExportType in [etHTMLFile, etPDFFile]) and (Filename <> '');
  TSFields.Enabled := (ExportType in [etExcelFile, etODBC]) and SingleTable and (TObject(SObjects[0]) is TSTable);
  TSTask.Enabled := not TSSQLOptions.Enabled and not TSCSVOptions.Enabled and not TSHTMLOptions.Enabled and not TSFields.Enabled;

  TabSheet := nil;
  for I := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[I].Enabled) then
      TabSheet := PageControl.Pages[I];
  if (Assigned(TabSheet) and (TabSheet <> TSJob)) then
    TabSheet.Enabled := TabSheet.Enabled
      and ValidJobName(Trim(FName.Text))
      and ((DialogType <> edtCreateJob) or not Assigned(Session.Account.JobByName(Trim(FName.Text))))
      and ((DialogType <> edtEditJob) or (Session.Account.JobByName(Trim(FName.Text)) = Job))
      and (not FFilename.Visible or (DirectoryExists(ExtractFilePath(FFilename.Text)) and (ExtractFileName(FFilename.Text) <> '')))
      and (not FDataSource.Visible or (FDataSource.Text <> ''));

  CheckActivePageChange(TSJob.PageIndex);
end;

procedure TDExport.FODBCSelectDblClick(Sender: TObject);
begin
  FBForward.Click();
end;

procedure TDExport.FormCreate(Sender: TObject);
begin
  Constraints.MinWidth := Width;
  Constraints.MinHeight := Height;

  BorderStyle := bsSizeable;

  if ((Preferences.Export.Width >= Width) and (Preferences.Export.Height >= Height)) then
  begin
    Width := Preferences.Export.Width;
    Height := Preferences.Export.Height;
  end;

  Export := nil;

  FSelect.Images := Preferences.SmallImages;

  FObjects := TList.Create();

  FCSVHeadline.Checked := Preferences.Export.CSV.Headline;
  FSeparatorTab.Checked := Preferences.Export.CSV.DelimiterType = dtTab;
  FSeparatorChar.Checked := Preferences.Export.CSV.DelimiterType = dtChar;
  FSeparator.Text := Preferences.Export.CSV.Delimiter;
  FQuoteNone.Checked := Preferences.Export.CSV.QuoteValues = qtNone;
  FQuoteStrings.Checked := Preferences.Export.CSV.QuoteValues = qtStrings;
  FQuoteAll.Checked := Preferences.Export.CSV.QuoteValues = qtAll;
  FQuoteChar.Text := Preferences.Export.CSV.Quoter;

  FSQLStructure.Checked := Preferences.Export.SQL.Structure;
  FSQLData.Checked := Preferences.Export.SQL.Data;
  FDropStmts.Checked := Preferences.Export.SQL.DropStmts;
  FReplaceData.Checked := Preferences.Export.SQL.ReplaceData;

  FSQLOptionClick(Sender);

  FHTMLStructure.Checked := Preferences.Export.HTML.Structure;
  FHTMLData.Checked := Preferences.Export.HTML.Data;
  FHTMLNullText.Checked := Preferences.Export.HTML.NULLText;
  FHTMLMemoContent.Checked := Preferences.Export.HTML.MemoContent;
  FHTMLRowBGColor.Checked := Preferences.Export.HTML.RowBGColor;

  FRootNodeText.Text := Preferences.Export.XML.Root.NodeText;
  case (Preferences.Export.XML.Database.NodeType) of
    ntDisabled: FDatabaseNodeDisabled.Checked := True;
    ntName: FDatabaseNodeName.Checked := True;
    ntCustom: FDatabaseNodeCustom.Checked := True;
  end;
  FDatabaseNodeText.Text := Preferences.Export.XML.Database.NodeText;
  FDatabaseNodeAttribute.Text := Preferences.Export.XML.Database.NodeAttribute;
  case (Preferences.Export.XML.Table.NodeType) of
    ntDisabled: FTableNodeDisabled.Checked := True;
    ntName: FTableNodeName.Checked := True;
    ntCustom: FTableNodeCustom.Checked := True;
  end;
  FTableNodeText.Text := Preferences.Export.XML.Table.NodeText;
  FTableNodeAttribute.Text := Preferences.Export.XML.Table.NodeAttribute;
  FRecordNodeText.Text := Preferences.Export.XML.Row.NodeText;
  case (Preferences.Export.XML.Field.NodeType) of
    ntName: FFieldNodeName.Checked := True;
    ntCustom: FFieldNodeCustom.Checked := True;
  end;
  FFieldNodeText.Text := Preferences.Export.XML.Field.NodeText;
  FFieldNodeAttribute.Text := Preferences.Export.XML.Field.NodeAttribute;

  FRootNodeText.Text := Preferences.Export.XML.Root.NodeText;
  case (Preferences.Export.XML.Database.NodeType) of
    ntDisabled: FDatabaseNodeDisabled.Checked := True;
    ntName: FDatabaseNodeName.Checked := True;
    ntCustom: FDatabaseNodeCustom.Checked := True;
  end;
  FDatabaseNodeText.Text := Preferences.Export.XML.Database.NodeText;
  FDatabaseNodeAttribute.Text := Preferences.Export.XML.Database.NodeAttribute;

  FMonthly.Visible := CheckWin32Version(6, 1);

  SendMessage(FErrorMessages.Handle, EM_SETTEXTMODE, TM_PLAINTEXT, 0);
  SendMessage(FErrorMessages.Handle, EM_SETWORDBREAKPROC, 0, LPARAM(@EditWordBreakProc));

  PageControl.ActivePage := nil; // Make sure, not ___OnShowPage will be executed

  ExportType := etSQLFile;
end;

procedure TDExport.FormDestroy(Sender: TObject);
begin
  FObjects.Free();
end;

procedure TDExport.FormHide(Sender: TObject);
var
  Export: TPExport;
  I: Integer;
  Hour, Min, Sec, MSec: Word;
  Year, Month, Day: Word;
begin
  Session.UnRegisterEventProc(FormSessionEvent);

  Preferences.Export.Width := Width;
  Preferences.Export.Height := Height;

  if (ModalResult = mrOk) then
  begin
    if (DialogType in [edtCreateJob, edtEditJob]) then
      Export := TAJobExport.Create(Session.Account.Jobs, Trim(FName.Text))
    else
      Export := Preferences.Export;

    case (ExportType) of
      etSQLFile:
        begin
          Export.SQL.Structure := FSQLStructure.Checked;
          Export.SQL.Data := FSQLData.Checked;
          Export.SQL.DropStmts := FDropStmts.Checked;
          Export.SQL.ReplaceData := FReplaceData.Checked;
        end;
      etTextFile:
        begin
          Export.CSV.Headline := FCSVHeadline.Checked;
          if (FSeparatorTab.Checked) then
            Export.CSV.DelimiterType := dtTab
          else if (FSeparatorChar.Checked) then
            Export.CSV.DelimiterType := dtChar;
          Export.CSV.Delimiter := FSeparator.Text;
          if (FQuoteNone.Checked) then
            Export.CSV.QuoteValues := qtNone
          else if (FQuoteAll.Checked) then
            Export.CSV.QuoteValues := qtAll
          else
            Export.CSV.QuoteValues := qtStrings;
          if (FQuoteChar.Text <> '') then
            Export.CSV.Quoter := FQuoteChar.Text[1];
        end;
      etExcelFile:
        Export.Excel.Excel2007 := (odExcel2007 in ODBCDrivers) and (SaveDialog.FilterIndex = 1);
      etODBC:
        if (Export is TAJobExport) then
        begin
          TAJobExport(Export).ODBC.DataSource := DODBC.DataSource;
          TAJobExport(Export).ODBC.Password := DODBC.Password;
          TAJobExport(Export).ODBC.Username := DODBC.Username;
        end;
      etHTMLFile,
      etPDFFile:
        begin
          Export.HTML.Data := FHTMLData.Checked;
          Export.HTML.MemoContent := FHTMLMemoContent.Checked;
          Export.HTML.NULLText := FHTMLNullText.Checked;
          Export.HTML.RowBGColor := FHTMLRowBGColor.Checked;
          Export.HTML.Structure := FHTMLStructure.Checked;
        end;
      etXMLFile:
        begin
          Export.XML.Root.NodeText := Trim(FRootNodeText.Text);
          if (FDatabaseNodeDisabled.Checked) then
            Export.XML.Database.NodeType := ntDisabled
          else if (FDatabaseNodeName.Checked) then
            Export.XML.Database.NodeType := ntName
          else
            Export.XML.Database.NodeType := ntCustom;
          Export.XML.Database.NodeText := Trim(FDatabaseNodeText.Text);
          Export.XML.Database.NodeAttribute := Trim(FDatabaseNodeAttribute.Text);
          if (FTableNodeDisabled.Checked) then
            Export.XML.Table.NodeType := ntDisabled
          else if (FTableNodeName.Checked) then
            Export.XML.Table.NodeType := ntName
          else
            Export.XML.Table.NodeType := ntCustom;
          Export.XML.Table.NodeText := Trim(FTableNodeText.Text);
          Export.XML.Table.NodeAttribute := Trim(FTableNodeAttribute.Text);
          Export.XML.Row.NodeText := Trim(FRecordNodeText.Text);
          if (FFieldNodeName.Checked) then
            Export.XML.Field.NodeType := ntName
          else
            Export.XML.Field.NodeType := ntCustom;
          Export.XML.Field.NodeText := Trim(FFieldNodeText.Text);
          Export.XML.Field.NodeAttribute := Trim(FFieldNodeAttribute.Text);
        end;
    end;

    if (DialogType in [edtCreateJob, edtEditJob]) then
    begin
      TAJobExport(Export).ClearObjects();
      for I := 0 to FSelect.Items.Count - 1 do
        if (FSelect.Items[I].Selected) then
        begin
          SetLength(TAJobExport(Export).JobObjects, Length(TAJobExport(Export).JobObjects) + 1);
          if (not Assigned(FSelect.Items[I].Parent)) then
            TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotServer
          else if (TObject(FSelect.Items[I].Data) is TSDatabase) then
          begin
            TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotDatabase;
            TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].Name := TSDatabase(FSelect.Items[I].Data).Name;
          end
          else if (TObject(FSelect.Items[I].Data) is TSDBObject) then
          begin
            if (TObject(FSelect.Items[I].Data) is TSTable) then
              TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotTable
            else if (TObject(FSelect.Items[I].Data) is TSProcedure) then
              TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotProcedure
            else if (TObject(FSelect.Items[I].Data) is TSFunction) then
              TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotFunction
            else if (TObject(FSelect.Items[I].Data) is TSTrigger) then
              TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotTrigger
            else if (TObject(FSelect.Items[I].Data) is TSEvent) then
              TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].ObjectType := jotEvent;
            TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].Name := TSDBObject(FSelect.Items[I].Data).Name;
            TAJobExport(Export).JobObjects[Length(TAJobExport(Export).JobObjects) - 1].DatabaseName := TSDBObject(FSelect.Items[I].Data).Database.Name;
          end;
        end;
      TAJobExport(Export).CodePage := CodePage;
      TAJobExport(Export).ExportType := ExportType;
      TAJobExport(Export).Filename := FFilename.Text;
      DecodeDate(FStartDate.Date, Year, Month, Day);
      DecodeTime(FStartTime.Time, Hour, Min, Sec, MSec);
      TAJobExport(Export).Start := EncodeDate(Year, Month, Day) + EncodeTime(Hour, Min, Sec, MSec);
      if (FDaily.Checked) then
        TAJobExport(Export).TriggerType := ttDaily
      else if (FWeekly.Checked) then
        TAJobExport(Export).TriggerType := ttWeekly
      else if (FMonthly.Checked) then
        TAJobExport(Export).TriggerType := ttMonthly
      else
        TAJobExport(Export).TriggerType := ttSingle;
      TAJobExport(Export).Enabled := FEnabled.Checked;

      if (DialogType = edtCreateJob) then
        Session.Account.Jobs.AddJob(Export)
      else if (DialogType = edtEditJob) then
        Session.Account.Jobs.UpdateJob(Job, Export);
      Export.Free();
    end;
  end;

  FSelect.Selected := nil; // Make sure, not to call FSelectedChange with a selected node
  FSelect.Items.BeginUpdate();
  FSelect.Items.Clear();
  FSelect.Items.EndUpdate();

  ClearTSFields();
  PageControl.ActivePage := nil;
end;

procedure TDExport.FormSessionEvent(const Event: TSSession.TEvent);
begin
  if (Event.EventType = etAfterExecuteSQL) then
    PostMessage(Handle, CM_POST_AFTEREXECUTESQL, 0, 0);
end;

procedure TDExport.FormShow(Sender: TObject);
var
  I: Integer;
  Node: TTreeNode;
begin
  Session.RegisterEventProc(FormSessionEvent);

  ModalResult := mrNone;
  if (DialogType = edtCreateJob) then
    Caption := Preferences.LoadStr(897)
  else if (DialogType = edtEditJob) then
    Caption := Preferences.LoadStr(842, Job.Name)
  else if (DialogType = edtExecuteJob) then
    Caption := Preferences.LoadStr(210) + ' ' + ExtractFileName(Job.Filename)
  else if (ExportType = etPrinter) then
    Caption := Preferences.LoadStr(577)
  else if (ExtractFileName(Filename) = '') then
    Caption := Preferences.LoadStr(210)
  else
    Caption := Preferences.LoadStr(210) + ' ' + ExtractFileName(Filename);

  if (DialogType = edtCreateJob) then
    HelpContext := 1138
  else if (DialogType = edtEditJob) then
    HelpContext := 1140
  else if (DialogType = edtExecuteJob) then
    HelpContext := -1
  else
    case (ExportType) of
      etSQLFile: HelpContext := 1014;
      etTextFile: HelpContext := 1134;
      etExcelFile: HelpContext := 1107;
      etAccessFile: HelpContext := 1129;
      etXMLFile: HelpContext := 1017;
      etHTMLFile: HelpContext := 1016;
      etPDFFile: HelpContext := 1137;
      etPrinter: HelpContext := 1018;
      else HelpContext := -1;
    end;
  FBHelp.Visible := HelpContext >= 0;

  if (DialogType = edtCreateJob) then
  begin
    Node := FSelect.Items.Add(nil, Session.Caption);
    Node.ImageIndex := iiServer;
    Node.HasChildren := True;

    FName.Text := Title;
    FFilename.Visible := False; FLFilename.Visible := FFilename.Visible;
    FFilename.Text := '';
    DODBC.DataSource := '';
    DODBC.Username := 'Admin';
    DODBC.Password := '';

    FStartDate.Date := Now() + 1; FStartTime.Time := 0;
    FSingle.Checked := True;
    FEnabled.Checked := True;
  end
  else if (DialogType in [edtEditJob, edtExecuteJob]) then
  begin
    Node := FSelect.Items.Add(nil, Session.Caption);
    Node.ImageIndex := iiServer;
    Node.HasChildren := True;

    FName.Text := Job.Name;
    case (Job.ExportType) of
      etSQLFile: FSQLFile.Checked := True;
      etTextFile: FTextFile.Checked := True;
      etExcelFile: FExcelFile.Checked := True;
      etAccessFile: FAccessFile.Checked := True;
      etODBC: FODBC.Checked := True;
      etHTMLFile: FHTMLFile.Checked := True;
      etXMLFile: FXMLFile.Checked := True;
      etPDFFile: FPDFFile.Checked := True;
    end;
    FFilename.Visible := False; FLFilename.Visible := FFilename.Visible;
    CodePage := Job.CodePage;
    Filename := Job.Filename;
    FFilename.Text := Job.Filename;
    DODBC.DataSource := Job.ODBC.DataSource;
    DODBC.Username := Job.ODBC.Username;
    DODBC.Password := Job.ODBC.Password;
    FDataSource.Text := DODBC.DataSource;

    FStartDate.Date := Job.Start; FStartTime.Time := Job.Start;
    case (Job.TriggerType) of
      ttDaily: FDaily.Checked := True;
      ttWeekly: FWeekly.Checked := True;
      ttMonthly: FMonthly.Checked := True;
      else FSingle.Checked := True;
    end;
    FEnabled.Checked := Job.Enabled;
  end;
  if (DialogType <> edtNormal) then
    FJobOptionChange(nil);
  FName.Enabled := DialogType = edtCreateJob;

  if (Assigned(DBGrid)) then
    FHTMLStructure.Caption := Preferences.LoadStr(794)
  else
    FHTMLStructure.Caption := Preferences.LoadStr(215);

  TSSelect.Enabled := DialogType in [edtCreateJob, edtEditJob];
  TSJob.Enabled := False;
  TSSQLOptions.Enabled := (DialogType in [edtNormal]) and (ExportType in [etSQLFile]);
  TSCSVOptions.Enabled := (DialogType in [edtNormal]) and (ExportType in [etTextFile]);
  TSXMLOptions.Enabled := (DialogType in [edtNormal]) and (ExportType in [etXMLFile]) and not Assigned(DBGrid);
  TSHTMLOptions.Enabled := (DialogType in [edtNormal]) and (ExportType in [etHTMLFile, etPrinter, etPDFFile]);
  TSFields.Enabled := (DialogType in [edtNormal]) and (ExportType in [etExcelFile, etODBC]) and (SingleTable and (TObject(SObjects[0]) is TSTable) or Assigned(DBGrid)) or (ExportType in [etXMLFile]) and Assigned(DBGrid);
  TSTask.Enabled := False;
  TSExecute.Enabled := not TSSQLOptions.Enabled and not TSCSVOptions.Enabled and not TSHTMLOptions.Enabled and not TSFields.Enabled;

  FBBack.Visible := TSSelect.Enabled or TSSQLOptions.Enabled or TSCSVOptions.Enabled or TSXMLOptions.Enabled or TSHTMLOptions.Enabled or TSFields.Enabled;
  FBForward.Visible := FBBack.Visible;

  if (DialogType in [edtCreateJob, edtEditJob]) then
  begin
    PageControl.Visible := Session.Databases.Update() and Boolean(Perform(CM_POST_AFTEREXECUTESQL, 0, 0));
    if (PageControl.Visible) then
      FSelect.Items.GetFirstNode().Expand(False)
    else
      WantedNodeExpand := FSelect.Items.GetFirstNode();
  end
  else
    PageControl.Visible := Boolean(Perform(CM_POST_AFTEREXECUTESQL, 0, 0));
  PSQLWait.Visible := not PageControl.Visible;

  for I := 0 to PageControl.PageCount - 1 do
    if ((PageControl.ActivePageIndex < 0) and PageControl.Pages[I].Enabled) then
      PageControl.ActivePageIndex := I;
  CheckActivePageChange(PageControl.ActivePageIndex);

  FBCancel.ModalResult := mrCancel;

  if (PageControl.Visible and TSSelect.Visible and FName.Enabled) then
    ActiveControl := FSelect
  else if (FBForward.Visible and FBForward.Enabled) then
    ActiveControl := FBForward
  else
    ActiveControl := FBCancel;
end;

procedure TDExport.FQuoteCharExit(Sender: TObject);
begin
  if (FQuoteChar.Text = '') then
    FQuoteNone.Checked := True;
end;

procedure TDExport.FQuoteClick(Sender: TObject);
begin
  FQuoteChar.Enabled := not FQuoteNone.Checked;
  FLQuoteChar.Enabled := FQuoteChar.Enabled;

  if (not FQuoteNone.Checked and (FQuoteChar.Text = '')) then
    FQuoteChar.Text := '"';
end;

procedure TDExport.FQuoteKeyPress(Sender: TObject; var Key: Char);
begin
  FQuoteClick(Sender);
end;

procedure TDExport.FSelectChange(Sender: TObject; Node: TTreeNode);
begin
  TSJob.Enabled := Assigned(FSelect.Selected) and (DialogType in [edtCreateJob, edtEditJob]);
  CheckActivePageChange(TSSelect.PageIndex);
end;

procedure TDExport.FSelectExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
var
  Database: TSDatabase;
  I: Integer;
  NewNode: TTreeNode;
  Table: TSBaseTable;
  TreeView: TTreeView_Ext;
begin
  TreeView := TTreeView_Ext(Sender);

  if (Assigned(WantedNodeExpand)) then
    WantedNodeExpand := nil;

  if (Assigned(Node)) then
    if (Node.HasChildren and not Assigned(Node.getFirstChild())) then
    begin
      case (Node.ImageIndex) of
        iiServer:
          begin
            if (not Session.Databases.Update()) then
              WantedNodeExpand := Node
            else
            begin
              for I := 0 to Session.Databases.Count - 1 do
                if (((Session.Databases.NameCmp(Session.Databases[I].Name, 'mysql') <> 0) or (Session.Databases.NameCmp(Session.Databases[I].Name, 'sys') <> 0) and (Session.ServerVersion >= 50707)) and not (Session.Databases[I] is TSSystemDatabase)) then
                begin
                  NewNode := TreeView.Items.AddChild(Node, Session.Databases[I].Name);
                  NewNode.ImageIndex := iiDatabase;
                  NewNode.Data := Session.Databases[I];
                  NewNode.HasChildren := True;
                end;
              Node.HasChildren := Assigned(Node.getFirstChild());
            end;
          end;
        iiDatabase:
          begin
            Database := Session.DatabaseByName(Node.Text);
            if (not Database.Tables.Update()) then
              WantedNodeExpand := Node
            else
            begin
              for I := 0 to Database.Tables.Count - 1 do
              begin
                NewNode := TreeView.Items.AddChild(Node, Database.Tables[I].Name);
                if (Database.Tables[I] is TSBaseTable) then
                  NewNode.ImageIndex := iiBaseTable
                else
                  NewNode.ImageIndex := iiView;
                NewNode.Data := Database.Tables[I];
                NewNode.HasChildren := False;
              end;
              if (Assigned(Database.Routines)) then
                for I := 0 to Database.Routines.Count - 1 do
                begin
                  NewNode := TreeView.Items.AddChild(Node, Database.Routines[I].Name);
                  if (Database.Routines[I] is TSProcedure) then
                    NewNode.ImageIndex := iiProcedure
                  else
                    NewNode.ImageIndex := iiFunction;
                  NewNode.Data := Database.Routines[I];
                end;
              if (Assigned(Database.Events)) then
                for I := 0 to Database.Events.Count - 1 do
                begin
                  NewNode := TreeView.Items.AddChild(Node, Database.Events[I].Name);
                  NewNode.ImageIndex := iiEvent;
                  NewNode.Data := Database.Events[I];
                end;
              Node.HasChildren := Assigned(Node.getFirstChild());
            end;
          end;
        iiBaseTable:
          begin
            Database := Session.DatabaseByName(Node.Parent.Text);
            Table := Database.BaseTableByName(Node.Text);
            if (not Database.Triggers.Update()) then
              WantedNodeExpand := Node
            else
            begin
              for I := 0 to Table.TriggerCount - 1 do
              begin
                NewNode := TreeView.Items.AddChild(Node, Table.Triggers[I].Name);
                NewNode.ImageIndex := iiTrigger;
                NewNode.Data := Table.Triggers[I];
              end;
              Node.HasChildren := Assigned(Node.getFirstChild());
            end;
          end;
      end;
    end;

end;

procedure TDExport.FSelectGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TDExport.FSeparatorClick(Sender: TObject);
begin
  if (not FQuoteStrings.Enabled and FQuoteStrings.Checked) then
    FQuoteAll.Checked := True;
end;

procedure TDExport.FSeparatorKeyPress(Sender: TObject; var Key: Char);
begin
  FSeparatorClick(Sender);
end;

procedure TDExport.FSQLOptionClick(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else
    TabSheet := TSExecute;

  FDropStmts.Enabled := FSQLStructure.Checked;
  FDropStmts.Checked := FDropStmts.Checked and FDropStmts.Enabled;
  FReplaceData.Enabled := FSQLData.Checked and not FDropStmts.Checked;
  FReplaceData.Checked := FReplaceData.Checked and FReplaceData.Enabled;

  TabSheet.Enabled := FSQLStructure.Checked or FSQLData.Checked;
  CheckActivePageChange(TSSQLOptions.PageIndex);
end;

procedure TDExport.FSQLOptionKeyPress(Sender: TObject; var Key: Char);
begin
  FSQLOptionClick(Sender);
end;

procedure TDExport.FTableTagClick(Sender: TObject);
begin
  FTableNodeText.Enabled := FTableNodeCustom.Checked;

  TSXMLOptionChange(Sender);
end;

procedure TDExport.FTableTagKeyPress(Sender: TObject;
  var Key: Char);
begin
  FTableTagClick(Sender);
end;

function TDExport.GetDataSource(): Boolean;
begin
  Result := DODBC.Execute();

  if (Result and (DialogType in [edtCreateJob, edtEditJob, edtExecuteJob])) then
    FJobOptionChange(nil);
end;

function TDExport.GetFilename(): Boolean;
var
  Database: TSDatabase;
begin
  Database := BuildTitle();

  if (SingleTable and (TObject(DExport.SObjects[0]) is TSBaseTable)) then
    CodePage := Session.CharsetToCodePage(TSBaseTable(DExport.SObjects[0]).DefaultCharset)
  else if (Assigned(Database)) then
    CodePage := Session.CharsetToCodePage(Database.DefaultCharset)
  else if (Assigned(Session) and (Session.Charset <> '')) then
    CodePage := Session.CharsetToCodePage(Session.Charset)
  else
    CodePage := Session.CodePage;

  SaveDialog.Title := Preferences.LoadStr(582);
  SaveDialog.InitialDir := Preferences.Path;
  SaveDialog.Filter := '';
  SaveDialog.DefaultExt := '';
  case (ExportType) of
    etSQLFile:
      begin
        SaveDialog.Filter := FilterDescription('sql') + ' (*.sql)|*.sql';
        SaveDialog.DefaultExt := '.sql';
        SaveDialog.Encodings.Text := EncodingCaptions();
      end;
    etTextFile:
      begin
        SaveDialog.Filter := FilterDescription('txt') + ' (*.txt;*.csv;*.tab)|*.txt;*.csv;*.tab';
        SaveDialog.DefaultExt := '.csv';
        SaveDialog.Encodings.Text := EncodingCaptions();
      end;
    etExcelFile:
      begin
        SaveDialog.Filter := '';
        if (odExcel2007 in ODBCDrivers) then
          SaveDialog.Filter := SaveDialog.Filter + FilterDescription('xlsx') + ' (*.xls;*.xlsx;*.xlsm;*.xlsb)|*.xls;*.xlsx;*.xlsm;*.xlsb|';
        SaveDialog.Filter := SaveDialog.Filter + FilterDescription('xls') + ' (*.xls)|*.xls';
        SaveDialog.DefaultExt := '.xls';
        SaveDialog.Encodings.Clear();
      end;
    etAccessFile:
      begin
        SaveDialog.Filter := '';
        if (odAccess2007 in ODBCDrivers) then
          SaveDialog.Filter := FilterDescription('accdb') + ' (*.accdb)|*.accdb|';
        SaveDialog.Filter := SaveDialog.Filter + FilterDescription('mdb') + ' (*.mdb)|*.mdb';
        if (odAccess2007 in ODBCDrivers) then
          SaveDialog.DefaultExt := '.accdb'
        else
          SaveDialog.DefaultExt := '.mdb';
        SaveDialog.Encodings.Clear();
      end;
    etHTMLFile:
      begin
        SaveDialog.Filter := FilterDescription('html') + ' (*.html;*.htm)|*.html;*.htm';
        SaveDialog.DefaultExt := '.html';
        SaveDialog.Encodings.Clear();
      end;
    etPDFFile:
      begin
        SaveDialog.Filter := FilterDescription('pdf') + ' (*.pdf)|*.pdf';
        SaveDialog.DefaultExt := '.pdf';
        SaveDialog.Encodings.Clear();
      end;
    etXMLFile:
      begin
        SaveDialog.Filter := FilterDescription('xml') + ' (*.xml)|*.xml';
        SaveDialog.DefaultExt := '.xml';
        SaveDialog.Encodings.Clear();
      end;
  end;
  SaveDialog.Filter := SaveDialog.Filter + '|' + FilterDescription('*') + ' (*.*)|*.*';

  if (Filename <> '') then
    SaveDialog.FileName := Filename
  else
    SaveDialog.FileName := Title + SaveDialog.DefaultExt;

  if (SaveDialog.Encodings.Count = 0) then
    SaveDialog.EncodingIndex := -1
  else
    SaveDialog.EncodingIndex := SaveDialog.Encodings.IndexOf(CodePageToEncoding(CodePage));

  Result := SaveDialog.Execute();
  if (Result) then
  begin
    Preferences.Path := ExtractFilePath(SaveDialog.FileName);

    if ((SaveDialog.EncodingIndex < 0) or (SaveDialog.Encodings.Count = 0)) then
      CodePage := GetACP()
    else
      CodePage := EncodingToCodePage(SaveDialog.Encodings[SaveDialog.EncodingIndex]);
    Filename := SaveDialog.FileName;
  end;
end;

function TDExport.GetPrinter(): Boolean;
begin
  Result := PrintDialog.Execute();
  if (Result) then
    Filename := PrintDialog.PrinterName;
end;

procedure TDExport.InitTSFields();
var
  I: Integer;
  J: Integer;
  K: Integer;
  FieldNames: string;
begin
  ClearTSFields();

  FLDestinationFields.Visible :=
    (ExportType = etTextFile) and FCSVHeadline.Checked
    or (ExportType in [etExcelFile, etXMLFile])
    or (ExportType in [etHTMLFile, etPrinter, etPDFFile]) and not FHTMLStructure.Checked;

  if (SingleTable) then
    SetLength(FSourceFields, TSTable(SObjects[0]).Fields.Count)
  else if (Assigned(DBGrid)) then
    SetLength(FSourceFields, DBGrid.DataSource.DataSet.FieldCount)
  else
    SetLength(FSourceFields, 0);

  if (FLDestinationFields.Visible) then
  begin
    SetLength(FLReferrers, Length(FSourceFields));
    SetLength(FDestinationFields, Length(FSourceFields));
  end;

  FieldNames := #13#10;
  if (SingleTable) then
    for J := 0 to TSTable(SObjects[0]).Fields.Count - 1 do
      FieldNames := FieldNames + TSTable(SObjects[0]).Fields[J].Name + #13#10
  else if (Assigned(DBGrid)) then
    for J := 0 to DBGrid.FieldCount - 1 do
      FieldNames := FieldNames + DBGrid.DataSource.DataSet.Fields[J].DisplayName + #13#10;

  ScrollBox.DisableAlign();
  for I := 0 to Length(FSourceFields) - 1 do
  begin
    FSourceFields[I] := TComboBox_Ext.Create(ScrollBox);
    FSourceFields[I].Left := FSourceField1.Left;
    FSourceFields[I].Top := FSourceField1.Top + I * (FSourceField2.Top - FSourceField1.Top);
    FSourceFields[I].Width := FSourceField1.Width;
    FSourceFields[I].Height := FSourceField1.Height;
    FSourceFields[I].Style := FSourceField1.Style;
    FSourceFields[I].OnChange := FSourceField1.OnChange;
    FSourceFields[I].OnExit := FSourceField1.OnExit;
    FSourceFields[I].Parent := ScrollBox;
    FSourceFields[I].Items.Text := FieldNames;
    FSourceFields[I].ItemIndex := I + 1;

    if (FLDestinationFields.Visible) then
    begin
      FLReferrers[I] := TLabel.Create(ScrollBox);
      FLReferrers[I].Left := FLReferrer1.Left;
      FLReferrers[I].Top := FLReferrer1.Top + I * (FSourceField2.Top - FSourceField1.Top);
      FLReferrers[I].Width := FLReferrer1.Width;
      FLReferrers[I].Height := FLReferrer1.Height;
      FLReferrers[I].Caption := FLReferrer1.Caption;

      FDestinationFields[I] := TEdit.Create(ScrollBox);
      FDestinationFields[I].Parent := ScrollBox;
      FDestinationFields[I].Left := FDestinationField1.Left;
      FDestinationFields[I].Top := FDestinationField1.Top + I * (FSourceField2.Top - FSourceField1.Top);
      FDestinationFields[I].Width := FDestinationField1.Width;
      FDestinationFields[I].Height := FDestinationField1.Height;
      FDestinationFields[I].Enabled := ExportType in [etTextFile, etExcelFile, etHTMLFile, etPrinter, etPDFFile, etXMLFile];
      TEdit(FDestinationFields[I]).Text := FSourceFields[I].Text;
      K := 2;
      for J := 0 to I - 1 do
        if (FSourceFields[I].Text = FSourceFields[J].Text) then
        begin
          TEdit(FDestinationFields[I]).Text := FSourceFields[J].Text + '_' + IntToStr(K);
          Inc(K);
        end;
      FDestinationFields[I].OnChange := FDestinationField1.OnChange;
      FLReferrers[I].Parent := ScrollBox;
    end;
  end;

  ScrollBoxResize(ScrollBox);
  ScrollBox.EnableAlign();
end;

procedure TDExport.InitTSJob();
var
  I: Integer;
  Index: Integer;
begin
  if ((FName.Text = '') and (DialogType in [edtCreateJob])) then
  begin
    FName.Text := Title;
    if (Assigned(Session.Account.JobByName(FName.Text))) then
    begin
      Index := 2;
      while (Assigned(Session.Account.JobByName(FName.Text + ' (' + IntToStr(Index) + ')'))) do
        Inc(Index);
      FName.Text := FName.Text + ' (' + IntToStr(Index) + ')';
    end;
  end;

  FSQLFile.Enabled := True;
  FTextFile.Enabled := False;
  FExcelFile.Enabled := (SObjects.Count = 1) and (TObject(SObjects[0]) is TSDatabase);
  FAccessFile.Enabled := (SObjects.Count = 1) and (TObject(SObjects[0]) is TSDatabase);
  FODBC.Enabled := (SObjects.Count = 1) and (TObject(SObjects[0]) is TSDatabase);
  FHTMLFile.Enabled := True;
  FXMLFile.Enabled := True;
  FPDFFile.Enabled := True;

  for I := 0 to SObjects.Count - 1 do
    if (TObject(SObjects[I]) is TSTable) then
    begin
      FTextFile.Enabled := True;
      FExcelFile.Enabled := True;
      FAccessFile.Enabled := True;
      FODBC.Enabled := True;
      FXMLFile.Enabled := True;
    end;
  FSQLFile.Checked := True;
end;

function TDExport.InitTSSelect(): Boolean;
var
  Database: TSDatabase;
  I: Integer;
  J: Integer;
  K: Integer;
  L: Integer;
  Nodes: TList;
begin
  Result := True;
  if (FSelect.Items[0].Count = 0) then
  begin
    Session.BeginSynchron();

    Nodes := TList.Create();
    if (not Session.Databases.Update()) then
      Result := False
    else
      for I := 0 to Length(Job.JobObjects) - 1 do
        if (Job.JobObjects[I].ObjectType = jotServer) then
          Nodes.Add(FSelect.Items[0])
        else
        begin
          FSelect.Items[0].Expand(False);
          if (Job.JobObjects[I].ObjectType = jotDatabase) then
          begin
            for J := 0 to FSelect.Items[0].Count - 1 do
              if (Session.Databases.NameCmp(FSelect.Items[0].Item[J].Text, Job.JobObjects[I].Name) = 0) then
                Nodes.Add(FSelect.Items[0].Item[J]);
          end
          else
          begin
            for J := 0 to FSelect.Items[0].Count - 1 do
              if (Session.Databases.NameCmp(FSelect.Items[0].Item[J].Text, Job.JobObjects[I].DatabaseName) = 0) then
              begin
                Database := Session.DatabaseByName(Job.JobObjects[I].DatabaseName);
                if (not Database.Update()) then
                  Result := False
                else
                begin
                  FSelect.Items[0].Item[J].Expand(False);
                  for K := 0 to FSelect.Items[0].Item[J].Count - 1 do
                    if (Job.JobObjects[I].ObjectType in [jotTable, jotProcedure, jotFunction, jotEvent]) then
                    begin
                      if ((Job.JobObjects[I].ObjectType = jotTable) and (TObject(FSelect.Items[0].Item[J].Item[K].Data) is TSTable) and (Database.Tables.NameCmp(TSTable(FSelect.Items[0].Item[J].Item[K].Data).Name, Job.JobObjects[I].Name) = 0)
                        or (Job.JobObjects[I].ObjectType = jotProcedure) and (TObject(FSelect.Items[0].Item[J].Item[K].Data) is TSProcedure) and (Database.Routines.NameCmp(TSProcedure(FSelect.Items[0].Item[J].Item[K].Data).Name, Job.JobObjects[I].Name) = 0)
                        or (Job.JobObjects[I].ObjectType = jotFunction) and (TObject(FSelect.Items[0].Item[J].Item[K].Data) is TSFunction) and (Database.Routines.NameCmp(TSFunction(FSelect.Items[0].Item[J].Item[K].Data).Name, Job.JobObjects[I].Name) = 0)
                        or (Job.JobObjects[I].ObjectType = jotEvent) and (TObject(FSelect.Items[0].Item[J].Item[K].Data) is TSEvent) and (Database.Events.NameCmp(TSEvent(FSelect.Items[0].Item[J].Item[K].Data).Name, Job.JobObjects[I].Name) = 0)) then
                        Nodes.Add(FSelect.Items[0].Item[J].Item[K]);
                    end
                    else if (Job.JobObjects[I].ObjectType = jotTrigger) then
                    begin
                      if ((Job.JobObjects[I].ObjectType = jotTable) and (TObject(FSelect.Items[0].Item[J].Item[K].Data) = Database.TriggerByName(Job.JobObjects[I].Name).Table)) then
                      begin
                        FSelect.Items[0].Item[J].Item[K].Expand(False);
                        for L := 0 to FSelect.Items[0].Item[J].Item[K].Count - 1 do
                          if ((TObject(FSelect.Items[0].Item[J].Item[K].Data) is TSTrigger) and (Database.Triggers.NameCmp(TSTrigger(FSelect.Items[0].Item[J].Item[K].Item[L].Data).Name, Job.JobObjects[I].Name) = 0)) then
                            Nodes.Add(FSelect.Items[0].Item[J].Item[K].Item[L]);
                      end;
                    end;
                end;
              end;
          end;
        end;
    FSelect.Select(Nodes);
    Nodes.Free();

    Session.EndSynchron();
  end;
end;

function TDExport.ObjectsFromFSelect(): Boolean;
var
  Child: TTreeNode;
  I: Integer;
begin
  Result := True;

  SObjects.Clear();
  for I := 0 to FSelect.Items.Count - 1 do
    if (FSelect.Items[I].Selected) then
      if (FSelect.Items[I].ImageIndex = iiServer) then
      begin
        Child := FSelect.Items[I].getFirstChild();
        while (Assigned(Child)) do
        begin
          SObjects.Add(Child.Data);
          Child := Child.getNextSibling();
        end;
      end
      else
        SObjects.Add(FSelect.Items[I].Data);
end;

procedure TDExport.OnError(const Sender: TObject; const Error: TTool.TError; const Item: TTool.TItem; const ShowRetry: Boolean; var Success: TDataAction);
var
  ErrorMsg: string;
  Flags: Integer;
  Msg: string;
begin
  ErrorMsg := '';
  case (Error.ErrorType) of
    TE_Database:
      begin
        Msg := Preferences.LoadStr(165, IntToStr(Session.ErrorCode), Session.ErrorMessage);
        ErrorMsg := SQLUnwrapStmt(Session.ErrorMessage);
        if (Session.ErrorCode > 0) then
          ErrorMsg := ErrorMsg + ' (#' + IntToStr(Session.ErrorCode) + ')';
      end;
    TE_File:
      begin
        Msg := Error.ErrorMessage + ' (#' + IntToStr(Error.ErrorCode) + ')';
        ErrorMsg := Msg;
      end;
    TE_ODBC:
      begin
        if (Error.ErrorCode = 0) then
          Msg := Error.ErrorMessage
        else
          Msg := Error.ErrorMessage + ' (#' + IntToStr(Error.ErrorCode) + ')';
        ErrorMsg := Msg;
      end;
    else
      begin
        Msg := Error.ErrorMessage;
        ErrorMsg := Msg;
      end;
  end;

  if (not ShowRetry) then
    Flags := MB_OK + MB_ICONERROR
  else
    Flags := MB_CANCELTRYCONTINUE + MB_ICONERROR;
  case (MsgBox(Msg, Preferences.LoadStr(45), Flags, Handle)) of
    IDOK,
    IDCANCEL,
    IDABORT: Success := daAbort;
    IDRETRY,
    IDTRYAGAIN: Success := daRetry;
    IDCONTINUE,
    IDIGNORE: Success := daFail;
  end;

  if ((Success in [daAbort, daFail]) and (ErrorMsg <> '')) then
  begin
    FErrors.Caption := IntToStr(TTool(Sender).ErrorCount);
    FErrorMessages.Lines.Add(ErrorMsg);
  end;
end;

procedure TDExport.OnTerminate(Sender: TObject);
begin
  PostMessage(Handle, CM_TERMINATE, WPARAM(not Export.Terminated), 0);
end;

procedure TDExport.OnUpdate(const AProgressInfos: TTool.TProgressInfos);
begin
  MoveMemory(@ProgressInfos, @AProgressInfos, SizeOf(AProgressInfos));

  PostMessage(Handle, CM_UPDATEPROGRESSINFO, 0, LPARAM(@ProgressInfos));
end;

procedure TDExport.ScrollBoxResize(Sender: TObject);
var
  I: Integer;
  Padding: Integer;
begin
  Padding := ScrollBox.Left + FSourceField1.Left;

  for I := 0 to Length(FSourceFields) - 1 do
    if ((Length(FSourceFields) > I) and Assigned(FSourceFields[I])) then
      FSourceFields[I].Width :=
        (ScrollBox.ClientWidth
          - FLReferrer1.Canvas.TextWidth(FLReferrer1.Caption)
          - 3 * Padding
          - GetSystemMetrics(SM_CXVSCROLL)) div 2;

  for I := 0 to Length(FLReferrers) - 1 do
    if ((Length(FLReferrers) > 0) and Assigned(FLReferrers[I])) then
      FLReferrers[I].Left := FSourceFields[I].Left + FSourceFields[I].Width + Padding;

  for I := 0 to Length(FDestinationFields) - 1 do
    if ((Length(FDestinationFields) > I) and Assigned(FDestinationFields[I]) and (Length(FLReferrers) > 0) and Assigned(FLReferrers[I]) and (Length(FSourceFields) > 0) and Assigned(FSourceFields[I])) then
    begin
      FDestinationFields[I].Left := FLReferrers[I].Left + FLReferrers[I].Width + Padding;
      FDestinationFields[I].Width := FSourceFields[I].Width;
    end;

  if ((Length(FDestinationFields) > 0) and (Assigned(FDestinationFields[0]))) then
    FLDestinationFields.Left := FDestinationFields[0].Left + 6;
end;

procedure TDExport.TSCSVOptionsShow(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else if (SingleTable) then
    TabSheet := TSFields
  else
    TabSheet := TSExecute;

  ClearTSFields();

  FSeparatorClick(Self);

  FBForward.Default := True;

  FBCancel.Caption := Preferences.LoadStr(30);
  FBCancel.ModalResult := mrCancel;
  FBCancel.Default := False;

  TabSheet.Enabled := not TSFields.Enabled;
  CheckActivePageChange(TSCSVOptions.PageIndex);
end;

procedure TDExport.TSExecuteShow(Sender: TObject);
var
  I: Integer;
begin
  Session.UnRegisterEventProc(FormSessionEvent);

  FEntieredObjects.Caption := '';
  FDoneObjects.Caption := '';
  FEntieredRecords.Caption := '';
  FDoneRecords.Caption := '';
  FEntieredTime.Caption := '';
  FDoneTime.Caption := '';
  FProgressBar.Position := 0;
  FErrors.Caption := '0';
  FErrorMessages.Lines.Clear();

  CheckActivePageChange(TSExecute.PageIndex);
  FBBack.Enabled := False;

  FBForward.Default := False;
  FBCancel.Default := True;
  FBCancel.ModalResult := mrNone;
  ActiveControl := FBCancel;

  case (ExportType) of
    etSQLFile:
      begin
        Export := TTExportSQL.Create(Session, Filename, CodePage);
        TTExportSQL(Export).Data := FSQLData.Checked;
        TTExportSQL(Export).DropStmts := FDropStmts.Checked;
        TTExportSQL(Export).ReplaceData := FReplaceData.Checked;
        TTExportSQL(Export).Structure := FSQLStructure.Checked;
      end;
    etTextFile:
      begin
        Export := TTExportText.Create(Session, Filename, CodePage);
        TTExportText(Export).Data := True;
        if (FSeparatorTab.Checked) then
          TTExportText(Export).Delimiter := #9;
        if (FSeparatorChar.Checked) then
          TTExportText(Export).Delimiter := FSeparator.Text;
        if (FQuoteNone.Checked) then
          TTExportText(Export).QuoteValues := qtNone
        else if (FQuoteAll.Checked) then
          TTExportText(Export).QuoteValues := qtAll
        else
          TTExportText(Export).QuoteValues := qtStrings;
        TTExportText(Export).Quoter := FQuoteChar.Text[1];
        TTExportText(Export).Structure := FCSVHeadline.Checked;
      end;
    etODBC:
      begin
        if (DialogType = edtNormal) then
          Export := TTExportODBC.Create(Session, DODBC.DataSource, DODBC.Username, DODBC.Password)
        else
          Export := TTExportODBC.Create(Session, Job.ODBC.DataSource, Job.ODBC.Username, Job.ODBC.Password);
        TTExportBaseODBC(Export).Data := True;
        TTExportBaseODBC(Export).Structure := True;
      end;
    etAccessFile:
      begin
        Export := TTExportAccess.Create(Session, Filename);
        TTExportAccess(Export).Access2007 := (odAccess2007 in ODBCDrivers) and (SaveDialog.FilterIndex = 1);
        TTExportAccess(Export).Data := True;
        TTExportAccess(Export).Structure := True;
      end;
    etExcelFile:
      begin
        Export := TTExportExcel.Create(Session, Filename);
        TTExportExcel(Export).Data := True;
        TTExportExcel(Export).Excel2007 := (odExcel2007 in ODBCDrivers) and (SaveDialog.FilterIndex = 1);
        TTExportExcel(Export).Structure := True;
      end;
    etHTMLFile:
      begin
        Export := TTExportHTML.Create(Session, Filename);
        TTExportHTML(Export).Data := FHTMLData.Checked;
        TTExportHTML(Export).TextContent := FHTMLMemoContent.Checked;
        TTExportHTML(Export).NULLText := FHTMLNullText.Checked;
        TTExportHTML(Export).RowBackground := FHTMLRowBGColor.Checked;
        TTExportHTML(Export).Structure := FHTMLStructure.Checked;
      end;
    etXMLFile:
      begin
        Export := TTExportXML.Create(Session, Filename);
        TTExportXML(Export).Data := True;
        if (FDatabaseNodeName.Checked) then
        begin
          TTExportXML(Export).DatabaseNodeText := 'database';
          TTExportXML(Export).DatabaseNodeAttribute := '';
        end
        else if (FDatabaseNodeCustom.Checked) then
        begin
          TTExportXML(Export).DatabaseNodeText := FDatabaseNodeText.Text;
          TTExportXML(Export).DatabaseNodeAttribute := FDatabaseNodeAttribute.Text;
        end
        else
        begin
          TTExportXML(Export).DatabaseNodeText := '';
          TTExportXML(Export).DatabaseNodeAttribute := '';
        end;
        TTExportXML(Export).RootNodeText := FRootNodeText.Text;
        TTExportXML(Export).Structure := True;
        if (FTableNodeName.Checked) then
        begin
          TTExportXML(Export).TableNodeText := 'Table';
          TTExportXML(Export).TableNodeAttribute := '';
        end
        else if (FTableNodeCustom.Checked) then
        begin
          TTExportXML(Export).TableNodeText := FTableNodeText.Text;
          TTExportXML(Export).TableNodeAttribute := FTableNodeAttribute.Text;
        end
        else
        begin
          TTExportXML(Export).TableNodeText := '';
          TTExportXML(Export).TableNodeAttribute := '';
        end;
        TTExportXML(Export).RecoreNodeText := FRecordNodeText.Text;
        if (FFieldNodeName.Checked) then
        begin
          TTExportXML(Export).FieldNodeText := 'database';
          TTExportXML(Export).FieldNodeAttribute := '';
        end
        else
        begin
          TTExportXML(Export).FieldNodeText := FFieldNodeText.Text;
          TTExportXML(Export).FieldNodeAttribute := FFieldNodeAttribute.Text;
        end;
      end;
    etPrinter,
    etPDFFile:
      begin
        if (ExportType = etPrinter) then
          Export := TTExportPrint.Create(Session, Filename, Title)
        else
          Export := TTExportPDF.Create(Session, Filename);
        TTExportCanvas(Export).Data := FHTMLData.Checked;
        TTExportCanvas(Export).NULLText := FHTMLNullText.Checked;
        TTExportCanvas(Export).Structure := FHTMLStructure.Checked;
      end;
  end;

  if (Assigned(Export)) then
  begin
    if (Assigned(DBGrid)) then
    begin
      Export.Add(DBGrid);

      if (Length(FSourceFields) = 0) then
        for I := 0 to DBGrid.FieldCount - 1 do
        begin
          SetLength(Export.Fields, Length(Export.Fields) + 1);
          Export.Fields[Length(Export.Fields) - 1] := DBGrid.Fields[I];
          SetLength(Export.DestinationFields, Length(Export.DestinationFields) + 1);
          Export.DestinationFields[Length(Export.DestinationFields) - 1].Name := DBGrid.Fields[I].DisplayName;
        end
      else
        for I := 0 to Length(FSourceFields) - 1 do
          if (FSourceFields[I].ItemIndex > 0) then
          begin
            SetLength(Export.Fields, Length(Export.Fields) + 1);
            Export.Fields[Length(Export.Fields) - 1] := DBGrid.Fields[FSourceFields[I].ItemIndex - 1];
            SetLength(Export.DestinationFields, Length(Export.DestinationFields) + 1);
            Export.DestinationFields[Length(Export.DestinationFields) - 1].Name := FDestinationFields[I].Text;
          end;
    end
    else
    begin
      for I := 0 to SObjects.Count - 1 do
        Export.Add(TSDBObject(SObjects[I]));

      if (SingleTable) then
        for I := 0 to Length(FSourceFields) - 1 do
          if (FSourceFields[I].ItemIndex > 0) then
          begin
            SetLength(Export.TableFields, Length(Export.TableFields) + 1);
            Export.TableFields[Length(Export.TableFields) - 1] := TSTable(SObjects[0]).Fields[FSourceFields[I].ItemIndex - 1];
            SetLength(Export.DestinationFields, Length(Export.DestinationFields) + 1);
            if (Length(FDestinationFields) = 0) then
              Export.DestinationFields[Length(Export.DestinationFields) - 1].Name := FSourceFields[I].Text
            else
              Export.DestinationFields[Length(Export.DestinationFields) - 1].Name := Session.ApplyIdentifierName(FDestinationFields[I].Text);
          end;
    end;

    Export.Wnd := Handle;
    Export.OnTerminate := OnTerminate;
    Export.OnUpdate := OnUpdate;
    Export.OnError := OnError;
    Export.Start()
  end;
end;

procedure TDExport.TSFieldsShow(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else
    TabSheet := TSExecute;

  TabSheet.Enabled := True;
  CheckActivePageChange(TSFields.PageIndex);
end;

procedure TDExport.TSHTMLOptionsShow(Sender: TObject);
begin
  FHTMLStructure.Enabled := not Assigned(DBGrid) or not (DBGrid.DataSource.DataSet is TMySQLTable);
  FHTMLStructure.Checked := FHTMLStructure.Checked and FHTMLStructure.Enabled;
  FHTMLStructureClick(Sender);
  FHTMLDataClick(Sender);

  FHTMLMemoContent.Visible := not (ExportType in [etPrinter, etPDFFile]); FLHTMLViewDatas.Visible := FHTMLMemoContent.Visible;
  FHTMLRowBGColor.Visible := not (ExportType in [etPrinter, etPDFFile]); FLHTMLBGColorEnabled.Visible := FHTMLRowBGColor.Visible;
end;

procedure TDExport.TSJobShow(Sender: TObject);
begin
  ObjectsFromFSelect();

  PageControl.Visible := Boolean(Perform(CM_POST_AFTEREXECUTESQL, 0, 0));
  PSQLWait.Visible := not PageControl.Visible;

  FJobOptionChange(Sender);
end;

procedure TDExport.TSOptionsHide(Sender: TObject);
begin
  if (TSFields.Enabled) then
    InitTSFields();
end;

procedure TDExport.TSSelectShow(Sender: TObject);
begin
  FSelectChange(nil, FSelect.Selected);
end;

procedure TDExport.TSSQLOptionsShow(Sender: TObject);
begin
  FSQLStructure.Enabled := not Assigned(DBGrid) or (TMySQLDataSet(DBGrid.DataSource.DataSet).TableName <> '');
  FSQLData.Enabled := not Assigned(DBGrid);

  FSQLStructure.Checked := FSQLStructure.Checked and FSQLStructure.Enabled;
  FSQLData.Checked := FSQLData.Checked or Assigned(DBGrid);

  FBForward.Default := True;

  FBCancel.Caption := Preferences.LoadStr(30);
  FBCancel.ModalResult := mrCancel;
  FBCancel.Default := False;

  FSQLOptionClick(Sender);
end;

procedure TDExport.TSTaskShow(Sender: TObject);
begin
  CheckActivePageChange(TSTask.PageIndex);
end;

procedure TDExport.TSXMLOptionChange(Sender: TObject);
var
  TabSheet: TTabSheet;
begin
  if (DialogType in [edtCreateJob, edtEditJob]) then
    TabSheet := TSTask
  else if (SingleTable) then
    TabSheet := TSFields
  else
    TabSheet := TSExecute;

  TabSheet.Enabled :=
    (FRootNodeText.Text <> '')
    and (not FDatabaseNodeDisabled.Checked or FDatabaseNodeDisabled.Enabled)
    and (not FDatabaseNodeName.Checked or FDatabaseNodeName.Enabled)
    and (not FDatabaseNodeCustom.Checked or FDatabaseNodeCustom.Enabled and (FDatabaseNodeText.Text <> '') and (FDatabaseNodeAttribute.Text <> ''))
    and (not FTableNodeDisabled.Checked or FTableNodeDisabled.Enabled)
    and (not FTableNodeName.Checked or FTableNodeName.Enabled)
    and (not FTableNodeCustom.Checked or FTableNodeCustom.Enabled and (FTableNodeText.Text <> '') and (FTableNodeAttribute.Text <> ''))
    and (FRecordNodeText.Text <> '')
    and (not FFieldNodeName.Checked or FFieldNodeName.Enabled)
    and (not FFieldNodeCustom.Checked or FFieldNodeCustom.Enabled and (FFieldNodeText.Text <> '') and (FFieldNodeAttribute.Text <> ''));
  CheckActivePageChange(TSXMLOptions.PageIndex);

  FDatabaseNodeText.Enabled := FDatabaseNodeCustom.Checked;
  FDatabaseNodeAttribute.Enabled := FDatabaseNodeCustom.Checked;

  FTableNodeText.Enabled := FTableNodeCustom.Checked;
  FTableNodeAttribute.Enabled := FTableNodeCustom.Checked;
end;

procedure TDExport.TSXMLOptionsHide(Sender: TObject);
begin
  if (TSFields.Enabled) then
    InitTSFields();
end;

procedure TDExport.TSXMLOptionsShow(Sender: TObject);
var
  DatabaseCount: Integer;
  I: Integer;
  OldDatabase: TSDatabase;
begin
  DatabaseCount := 0;
  OldDatabase := nil;
  for I := 0 to SObjects.Count - 1 do
  begin
    if (TSDBObject(SObjects[I]).Database <> OldDatabase) then
      Inc(DatabaseCount);
    OldDatabase := TSDBObject(SObjects[I]).Database;
  end;

  FDatabaseNodeDisabled.Enabled := DatabaseCount <= 1;
  if (FDatabaseNodeDisabled.Checked and not FDatabaseNodeDisabled.Enabled) then
    FDatabaseNodeCustom.Checked := True;

  FTableNodeDisabled.Enabled := SingleTable;
  if (FTableNodeDisabled.Checked and not FTableNodeDisabled.Enabled) then
    FTableNodeCustom.Checked := True;

  CheckActivePageChange(TSXMLOptions.PageIndex);
  TSXMLOptionChange(Sender);
end;

initialization
  FExport := nil;
end.

