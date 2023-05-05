page 70005 "File Account Browser"
{
    Caption = 'File Account Browser';
    PageType = List;
    SourceTable = "File Account Content";
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    DrillDown = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';

                    trigger OnDrillDown()
                    begin
                        if Rec.Type = Rec.Type::Directory then
                            BrowseFolder(Rec)
                        else
                            if not IsInLookupMode then
                                DownloadFile(Rec);
                    end;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }

            group(SaveFileNameGroup)
            {
                Caption = '', Locked = true;
                ShowCaption = false;
                Visible = ShowFileName;

                field(SaveFileNameField; SaveFileName)
                {
                    Caption = 'Filename';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Up)
            {
                Caption = 'Up';
                ApplicationArea = All;
                Image = MoveUp;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Enabled = ParentFolderExists;

                trigger OnAction()
                var
                    Path: Text;
                begin
                    if CurrPath = '' then
                        exit;

                    Path := FileSystem.GetParentPath(CurrPath);
                    BrowseFolder(Path);
                end;
            }
            action(Upload)
            {
                Caption = 'Upload';
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Visible = not IsInLookupMode;
                Enabled = not IsInLookupMode;

                trigger OnAction()
                begin
                    UploadFile();
                    BrowseFolder(CurrPath);
                end;
            }
        }
    }

    var
        FileSystem: Codeunit "File System";
        CurrPath, CurrFileFilter, SaveFileName, CurrPageCaption : Text;
        ParentFolderExists, DoNotLoadFields, IsInLookupMode, ShowFileName : Boolean;

    trigger OnOpenPage()
    begin
        if CurrPageCaption <> '' then
            CurrPage.Caption(CurrPageCaption);
    end;

    internal procedure SetFileAcconut(FileAccount: Record "File Account")
    begin
        FileSystem.Initialize(FileAccount);
    end;

    internal procedure BrowseFileAccount(Path: Text)
    begin
        BrowseFolder('');
    end;

    internal procedure EnableFileLookupMode(Path: Text; FileFilter: Text)
    begin
        CurrFileFilter := FileFilter;
        EnableLookupMode();
        BrowseFolder(Path);
    end;

    internal procedure EnableDirectoryLookupMode(Path: Text)
    begin
        DoNotLoadFields := true;
        EnableLookupMode();
        BrowseFolder(Path);
    end;

    internal procedure EnableSaveFileLookupMode(Path: Text; FileExtension: Text)
    var
        FileFilterTok: Label '*.%1', Locked = true;
    begin
        ShowFileName := true;
        CurrFileFilter := StrSubstNo(FileFilterTok, FileExtension);
        EnableLookupMode();
        BrowseFolder(Path);
    end;

    internal procedure GetCurrentDirectory(): Text
    begin
        exit(CurrPath);
    end;

    internal procedure GetFileName(): Text
    begin
        exit(SaveFileName);
    end;


    internal procedure SetPageCaption(NewCaption: Text)
    begin
        CurrPageCaption := NewCaption;
    end;

    local procedure StripNotsupportChrInFileName(InText: Text): Text
    var
        InvalidChrStringTxt: Label '"#%&*:<>?\/{|}~', Locked = true;
    begin
        InText := DelChr(InText, '=', InvalidChrStringTxt);
        exit(InText);
    end;

    local procedure EnableLookupMode()
    begin
        IsInLookupMode := true;
        CurrPage.LookupMode(true);
    end;

    local procedure BrowseFolder(var TempFileAccountContent: Record "File Account Content" temporary)
    var
        Path: Text;
    begin
        Path := FileSystem.CombinePath(TempFileAccountContent."Parent Directory", TempFileAccountContent.Name);
        BrowseFolder(Path);
    end;

    local procedure BrowseFolder(Path: Text)
    begin
        CurrPath := Path;
        ParentFolderExists := Path <> '';
        Rec.DeleteAll();

        FileSystem.ListDirectories(Path, Rec);
        ListFiles(Path);

        if Rec.FindFirst() then;
    end;

    local procedure DownloadFile(var TempFileAccountContent: Record "File Account Content" temporary)
    var
        Stream: InStream;
    begin
        FileSystem.GetFile(FileSystem.CombinePath(TempFileAccountContent."Parent Directory", TempFileAccountContent.Name), Stream);
        DownloadFromStream(Stream, '', '', '', TempFileAccountContent.Name);
    end;

    local procedure UploadFile()
    var
        UploadDialogTxt: Label 'Upload File';
        FromFile: Text;
        Stream: InStream;
    begin
        if not UploadIntoStream(UploadDialogTxt, '', '', FromFile, Stream) then
            exit;

        FileSystem.SetFile(FileSystem.CombinePath(CurrPath, FromFile), Stream);
    end;

    local procedure ListFiles(var Path: Text)
    var
        FileAccountContent: Record "File Account Content" temporary;
    begin
        if DoNotLoadFields then
            exit;

        FileSystem.ListFiles(Path, FileAccountContent);
        if CurrFileFilter <> '' then
            FileAccountContent.SetFilter(Name, CurrFileFilter);

        if not FileAccountContent.FindSet() then
            exit;

        repeat
            Rec.Init();
            Rec.TransferFields(FileAccountContent);
            Rec.Insert();
        until FileAccountContent.Next() = 0;
    end;
}