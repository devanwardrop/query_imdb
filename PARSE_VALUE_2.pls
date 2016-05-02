create or replace function parse_value_2 (pValue varchar2)
   return varchar2
is
   v_pos13 number;
   v_pos14 number;
   
begin

   --Return position after imdbID
   v_pos13 := INSTR (pValue, 'imdbID":"') + 9;
   --DBMS_OUTPUT.PUT_LINE(v_pos13);
   
   --Return next occurrence of '"'
   v_pos14 := INSTR (pValue, '"', v_pos13);
   --DBMS_OUTPUT.PUT_LINE(v_pos14);
   
   return SUBSTR (pValue, v_pos13, v_pos14 - v_pos13);
   
end parse_value_2;