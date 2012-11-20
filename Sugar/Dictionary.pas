﻿namespace RemObjects.Oxygene.Sugar;

{$HIDE W0} //supress case-mismatch errors

interface

type
{$IF ECHOES}
  Dictionary<T, U> = public class mapped to System.Collections.Generic.Dictionary<T,U>
  public
    method &Add(Key: T; Value: U); mapped to &Add(Key, Value);
    method Clear; mapped to Clear;
    method ContainsKey(Key: T): Boolean; mapped to ContainsKey(Key);
    method ContainsValue(Value: U): Boolean; mapped to ContainsValue(Value);
    method &Remove(Key: T); mapped to &Remove(Key);

    property Item[Key: T]: U read mapped[Key] write mapped[Key]; default;
    property Keys: sequence of T read mapped.Keys;
    property Values: sequence of U read mapped.Values;
    property Count: Integer read mapped.Count;
  end;
{$ELSEIF COOPER}
  Dictionary<T, U> = public class mapped to java.util.HashMap<T,U>
  public
    method &Add(Key: T; Value: U); mapped to Put(Key, Value);
    method Clear; mapped to Clear;
    method ContainsKey(Key: T): Boolean; mapped to ContainsKey(Key);
    method ContainsValue(Value: U): Boolean; mapped to ContainsValue(Value);
    method &Remove(Key: T); mapped to &Remove(Key);

    property Item[Key: T]: U read mapped[Key] write mapped[Key]; default;
    property Keys: sequence of T read mapped.keySet;
    property Values: sequence of U read mapped.Values;
    property Count: Integer read mapped.size;
  end;
{$ELSEIF NOUGAT}
  Dictionary<T, U> = public class mapped to Foundation.NSMutableDictionary
  private
    method GetItem(Key: T): U;   
    method SetItem(Key: T; Value: U);
  public
    method &Add(Key: dynamic; Value: dynamic);
    method Clear; mapped to removeAllObjects;
    method ContainsKey(Key: T): Boolean;
    method ContainsValue(Value: U): Boolean;
    method &Remove(Key: T); 

    property Item[Key: T]: U read GetItem write SetItem; default;
    //sequences doesn't work in Nougat
    //property Keys: sequence of T read ;
    //property Values: sequence of U read ;
    property Count: Integer read mapped.Count;
  end;
{$ENDIF}

implementation

{$IF NOUGAT}
method Dictionary<T, U>.ContainsKey(Key: T): Boolean;
begin
  exit mapped.objectForKey(Key) <> nil;
end;

method Dictionary<T, U>.ContainsValue(Value: U): Boolean;
begin
  exit mapped.allValues.containsObject(Value);
end;

method Dictionary<T, U>.Remove(Key: T);
begin
  mapped.removeObjectForKey(Key);
end;

method Dictionary<T, U>.GetItem(Key: T): U;
begin
  exit mapped.objectForKey(Key);
end;

method Dictionary<T, U>.Add(Key: dynamic; Value: dynamic);
begin
  mapped.setObject(Value) forKey(Key);
end;

method Dictionary<T, U>.SetItem(Key: T; Value: U);
begin
  raise new SugarNotImplementedException();
end;
{$ENDIF}
end.
