unit IMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  result: Real;
begin
if (Edit3.Text = EmptyStr) or (Edit1.Text = EmptyStr) or (Edit1.Text = EmptyStr) then
ShowMessage('Prencha os campos corretamente')
else
begin
result := StrToFloat(Edit2.Text) / (StrToFloat(Edit1.Text) * StrToFloat(Edit1.Text));
 if (Edit3.Text = 'm') then
 begin
  if (Edit3.Text <> EmptyStr) then
   begin
    if result < 20 then
     ShowMessage(FloatToStr(result)+ 'Passando uma Fome!!');
    if (result >= 20) and (result < 25) then
     ShowMessage(FloatToStr(result)+ 'Tamo bem demais!!');
    if result >= 25 then
    ShowMessage(FloatToStr(result)+ 'Tamo se passando!!');
   end;
 end
 else
 begin
  if result < 19 then
   ShowMessage(FloatToStr(result)+ 'Passando uma Fome!!');
   if (result >= 19) and (result < 24) then
    ShowMessage(FloatToStr(result)+ 'Tamo bem demais!!');
   if result >= 24 then
   ShowMessage(FloatToStr(result)+ 'Tamo se passando!!');
 end;
end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8, '0'..'9', DecimalSeparator]) then
  begin
     ShowMessage('Caractere Inválido: ' + Key);
     Key := #0;
  end
else
  if (Key = DecimalSeparator) and (Pos(Key, Edit1.Text) > 0) then
  begin
    ShowMessage('Caractere Duplicado: ' + Key);
    Key := #0;
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8, '0'..'9', DecimalSeparator]) then
  begin
     ShowMessage('Caractere Inválido: ' + Key);
     Key := #0;
  end
else
  if (Key = DecimalSeparator) and (Pos(Key, Edit1.Text) > 0) then
  begin
    ShowMessage('Caractere Duplicado: ' + Key);
    Key := #0;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if (Key <> 'f') and (Key <> 'm') and (Key <> #8) then
begin
ShowMessage(Key+' Caractere Inválido utilize m ou f');
Key := #0;
end;
end;

end.