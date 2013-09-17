﻿namespace RemObjects.Oxygene.Sugar.Xml;

{$HIDE W0} //supress case-mismatch errors

interface

uses
  {$IF COOPER}
  org.w3c.dom,
  {$ELSEIF ECHOES}
  System.Xml.Linq,
  {$ELSEIF NOUGAT}
  Foundation,
  {$ENDIF}
  RemObjects.Oxygene.Sugar;

type
  XmlCharacterData = public class (XmlNode)
  private
    {$IF NOUGAT}
    method GetData: String;
    method SetData(aValue: String);
    method GetLength: Integer;
    {$ELSE}
    property CharacterData: {$IF COOPER}CharacterData{$ELSEIF ECHOES}XText{$ENDIF} 
                            read Node as {$IF COOPER}CharacterData{$ELSEIF ECHOES}XText{$ENDIF};
    {$ENDIF}
  public
    {$IF ECHOES}
    property Data: String read CharacterData.Value write CharacterData.Value; virtual;
    property Length: Integer read CharacterData.Value.Length; virtual;
    property Value: String read CharacterData.Value write CharacterData.Value; override;
    {$ELSEIF COOPER}
    property Data: String read CharacterData.Data write CharacterData.Data;
    property Length: Integer read CharacterData.Length;
    {$ELSEIF NOUGAT}
    property Data: String read GetData write SetData;
    property Length: Integer read GetLength;
    {$ENDIF}

    method AppendData(aValue: String);
    method DeleteData(Offset, Count: Integer);
    method InsertData(Offset: Integer; aValue: String);
    method ReplaceData(Offset, Count: Integer; WithValue: String);
    method Substring(Offset, Count: Integer): String;
  end;

  XmlCDataSection = public class (XmlCharacterData)
  {$IF ECHOES}
  public
    property Name: String read "#CDATA"; override;
  {$ENDIF}
  end;

  XmlComment = public class (XmlCharacterData)
  {$IF ECHOES}
  private
    property Comment: XComment read Node as XComment;
  public    
    property Data: String read Comment.Value write Comment.Value; override;
    property Length: Integer read Comment.Value.Length; override;
    property Value: String read Comment.Value write Comment.Value; override;
    property Name: String read "#comment"; override;
  {$ENDIF}
  end;

  XmlText = public class (XmlCharacterData)
  {$IF ECHOES}
  public
    property Name: String read "#text"; override;
  {$ENDIF}
  end;
implementation

{$IF NOUGAT}
method XmlCharacterData.GetData: String;
begin
  {$IF IOS}
  exit Value;
  {$ELSEIF OSX}
  exit Node.stringValue;
  {$ENDIF}  
end;

method XmlCharacterData.SetData(aValue: String);
begin
  {$IF IOS}
  Value := aValue;
  {$ELSEIF OSX}
  Node.setStringValue(aValue);
  {$ENDIF}  
end;

method XmlCharacterData.GetLength: Integer;
begin
  {$IF IOS}
  //Can not get type for nullable
  exit Value.Length;
  {$ELSEIF OSX}
  exit Node.stringValue.length;
  {$ENDIF}  
end;
{$ENDIF}

method XmlCharacterData.AppendData(aValue: String);
begin
  {$IF ECHOES}
  Value := Value + aValue;
  {$ELSEIF COOPER} 
  CharacterData.AppendData(aValue);
  {$ELSEIF NOUGAT}
  var lData: NSMutableString := NSMutableString.stringWithString(Data);
  lData.appendString(aValue);
  {$IF IOS}Value := lData;{$ELSEIF OSX}Node.setStringValue(lData);{$ENDIF}  
  {$ENDIF}
end;

method XmlCharacterData.DeleteData(Offset: Integer; Count: Integer);
begin
  {$IF ECHOES}
  Value := System.String(Value).Remove(Offset, Count);
  {$ELSEIF COOPER} 
  CharacterData.DeleteData(Offset, Count);
  {$ELSEIF NOUGAT}
  var lData: NSMutableString := NSMutableString.stringWithString(Data);
  lData.deleteCharactersInRange(NSMakeRange(Offset, Count));
  {$IF IOS}Value := lData;{$ELSEIF OSX}Node.setStringValue(lData);{$ENDIF}  
  {$ENDIF}
end;

method XmlCharacterData.InsertData(Offset: Integer; aValue: String);
begin
  {$IF ECHOES}
  Value := System.String(Value).Insert(Offset, aValue);
  {$ELSEIF COOPER} 
  CharacterData.InsertData(Offset, aValue);
  {$ELSEIF NOUGAT}
  var lData: NSMutableString := NSMutableString.stringWithString(Data);
  lData.insertString(aValue) atIndex(Offset);
  {$IF IOS}Value := lData;{$ELSEIF OSX}Node.setStringValue(lData);{$ENDIF}
  {$ENDIF}
end;

method XmlCharacterData.ReplaceData(Offset: Integer; Count: Integer; WithValue: String);
begin
  {$IF ECHOES}
  DeleteData(Offset, Count);
  InsertData(Offset, WithValue);
  {$ELSEIF COOPER} 
  CharacterData.ReplaceData(Offset, Count, WithValue);
  {$ELSEIF NOUGAT}
  var lData: NSMutableString := NSMutableString.stringWithString(Data);
  lData.replaceCharactersInRange(NSMakeRange(Offset, Count)) withString(WithValue);
  {$IF IOS}Value := lData;{$ELSEIF OSX}Node.setStringValue(lData);{$ENDIF}
  {$ENDIF}
end;

method XmlCharacterData.Substring(Offset: Integer; Count: Integer): String;
begin
  {$IF ECHOES}
  exit Value.Substring(Offset, Count);
  {$ELSEIF COOPER} 
  exit CharacterData.substringData(Offset, Count);
  {$ELSEIF NOUGAT}
  exit NSString(Data).substringWithRange(NSMakeRange(Offset, Count));
  {$ENDIF}
end;

end.