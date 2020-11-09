unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, mysql57conn, sqldb, Forms, Controls, Graphics, Dialogs,
  DBCtrls, DBGrids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    MySQL57Connection1: TMySQL57Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
  private

  public

  end;

var
  Form1: TForm1;  utoch:boolean = false;   typeChar:boolean;

implementation
            uses unit2;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
  var
    newSQL: string;
  begin
      newSQL:= Concat('SELECT ',ListBox2.Items.Strings[ListBox2.ItemIndex], ' FROM ', ListBox1.Items.Strings[ListBox1   .ItemIndex],';');
      try
    MySQL57Connection1.Connected:=true;

  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;

  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add(newSQL);
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
  //Обнулить ВСЁ!!!!
end;

procedure TForm1.Button2Click(Sender: TObject);
    var
    newSQL: string;
  begin
      newSQL:= Concat('SELECT ',ListBox3.Items.Strings[ListBox3.ItemIndex], ' FROM ', ListBox1.Items.Strings[ListBox1   .ItemIndex],';');
      try
    MySQL57Connection1.Connected:=true;

  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;

  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add(newSQL);
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
  //Обнулить ВСЁ!!!!
end;

procedure TForm1.Button3Click(Sender: TObject);

    var
    newSQL: string;
  begin
      newSQL:= Concat('SELECT ',ListBox4.Items.Strings[ListBox4.ItemIndex], ' FROM ', ListBox1.Items.Strings[ListBox1   .ItemIndex],';');
      try
    MySQL57Connection1.Connected:=true;

  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;

  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add(newSQL);
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
  //Обнулить ВСЁ!!!!
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

 SQLQuery1.Close;
listbox1.clear;
listbox2.clear;
listbox3.clear;
listbox4.clear;
SQLQuery1.SQL.Text:='show tables';
SQLQuery1.open;
while not SQLQuery1.EOF do
begin
  ListBox1.Items.Add(SQLQuery1.FieldByName('Tables_in_library').AsString);
  SQLQuery1.Next;
end;
SQLQuery1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form2.visible:=true;
  Form1.visible:=false;
end;

procedure TForm1.Button6Click(Sender: TObject);

begin

      try
    MySQL57Connection1.Connected:=true;

  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;

  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.add('Select title as "Название", author as "Автор" ,  published as "Дата издания " , stock as "Кол-во" from books;');
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
  var newSQL : string;
 begin
       newSQL:= Concat('SELECT ','firstname,lastname', ' FROM ', 'members ', ';');
       try
     MySQL57Connection1.Connected:=true;

   except
     ShowMessage(' Не могу подключиться к базе данных');
   exit;
   end;

   try
     SQLTransaction1.Active:=true;
   except
     ShowMessage(' Не могу создать транзакцию');
   exit;
   end;
   try
     SQLQuery1.Active:=false;
     SQLQuery1.SQL.Clear;
     SQLQuery1.sql.add('Select firstname as "Имя " , lastname as "Фамилия "  from members;');
     SQLQuery1.Open;
   except
     ShowMessage(' Ошибка при выполнении SQL запроса.');
   exit;
   end;

end;

procedure TForm1.Button8Click(Sender: TObject);
   var newSQL : string;
begin
      newSQL:= Concat('SELECT ','title', ' FROM ', 'books ', ';');
      try
    MySQL57Connection1.Connected:=true;

  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;

  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add('SELECT members.firstname as "Имя" , members.lastname as"Фамилия ", books.title AS "Название", borrowings.borrowdate AS "Дата Выдачи", borrowings.returndate AS "Дата возрата", FROM borrowings JOIN books ON borrowings.books');
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
end;





procedure TForm1.FormCreate(Sender: TObject);
begin

listbox1.clear;
SQLQuery1.SQL.Text:='show tables';
SQLQuery1.open;
while not SQLQuery1.EOF do
begin
  ListBox1.Items.Add(SQLQuery1.FieldByName('Tables_in_library').AsString);
  SQLQuery1.Next;


end;
SQLQuery1.Close;
  end;

procedure TForm1.ListBox1SelectionChange(Sender: TObject; User: boolean);
   var
   _sel: string;
begin
_sel:=concat('show columns from ', ListBox1.Items.Strings[ListBox1.ItemIndex]);
SQLQuery1.SQL.Text :=_sel;
SQLQuery1.Open;
listbox2.clear;
listbox3.clear;
listbox4.clear;
while not SQLQuery1.EOF do
begin
  Listbox2.Items.Add(SQLQuery1.FieldByName('Field').AsString);
   Listbox3.Items.Add(SQLQuery1.FieldByName('Field').AsString);
    Listbox4.Items.Add(SQLQuery1.FieldByName('Field').AsString);
  SQLQuery1.Next;
end;
SQLQuery1.Close;
end;













end.

