program SmartSetFSEdge;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  richmemopackage, uecontrols, u_form_main, u_const, u_form_saveas, 
  u_form_load;

{$R *.res}
begin
  Application.Title:='SmartSet App-Freestyle';
  GApplication := APPL_FSEDGE; //APPL_FSPRO;
  GApplicationName := 'SmartSet App';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

