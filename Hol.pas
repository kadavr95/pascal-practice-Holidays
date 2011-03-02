unit Hol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    edt: TEdit;
    sgd: TStringGrid;
    btn: TButton;
    lbl: TLabel;
    lbl0: TLabel;
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
 function search(year,month:integer):integer;
 var
  a:tdatetime;
  I:integer;
 begin
  for i := 1 to 7 do
   begin
    a:=encodedate(year,month,i);
    if dayofweek(a)=2 then
     search:=i;
   end;
 end;
 function sunday(year,month,day:integer):integer;
 var
  a:tdatetime;
 begin
  a:=encodedate(year,month,day);
  sunday:=0;
  if dayofweek(a)=1 then
   sunday:=1;
 end;
procedure TForm2.btnClick(Sender: TObject);
var
 a:tdatetime;
 year1,year2,code1,code2,x:integer;
begin
 sgd.RowCount:=6;
 sgd.colcount:=3;
 sgd.Cells[0,0]:='Holidays';
 sgd.Cells[1,0]:='Start';
 sgd.Cells[2,0]:='End';
 sgd.Cells[0,1]:='Autumn';
 sgd.Cells[0,2]:='Winter';
 sgd.Cells[0,3]:='February';
 sgd.Cells[0,4]:='Spring';
 sgd.Cells[0,5]:='Summer';
 val(copy(edt.Text,1,4),x,code1);
 val(copy(edt.text,6,4),x,code2);
 if (code1=0) and (code2=0) then
  begin
   lbl.Caption:='Holidays timetable for '+edt.Text+' school year';
   year1:=strtoint(copy(edt.text,1,4));
   year2:=strtoint(copy(edt.text,6,4));
   x:=7*trunc((31-search(year2,03))/7);
   if year2-year1=1 then
    begin
     sgd.Cells[1,1]:=inttostr(search(year1,11))+'.11.'+inttostr(year1);
     sgd.Cells[2,1]:=inttostr(search(year1,11)+7)+'.11.'+inttostr(year1);
     sgd.Cells[1,2]:='30.12.'+inttostr(year1);
     sgd.Cells[2,2]:=inttostr(sunday(year2,01,07)+7)+'.01.'+inttostr(year2);
     sgd.Cells[1,3]:=inttostr(search(year2,02)+7)+'.02.'+inttostr(year2);
     sgd.Cells[2,3]:=inttostr(search(year2,02)+14)+'.02.'+inttostr(year2);
     if search(year2,04)=7 then
      begin
       sgd.Cells[1,4]:='25.03.'+inttostr(year2);
       sgd.Cells[2,4]:='31.03.'+inttostr(year2);
      end
     else
      begin
       sgd.Cells[1,4]:=inttostr(24+search(year2,04))+'.03.'+inttostr(year2);
       sgd.Cells[2,4]:=inttostr(search(year2,04))+'.04.'+inttostr(year2);
      end;
     sgd.Cells[1,5]:='25.06.'+inttostr(year2);
     sgd.Cells[2,5]:=inttostr(sunday(year2,09,01)+1)+'.09.'+inttostr(year2);
    end
   else
    Begin
     beep;
     showmessage('ENTER VALID SCHOOL YEAR!');
    End;
  end
 else
  begin
   beep;
   showmessage('ENTER VALID SCHOOL YEAR!');
 end;
end;

end.
