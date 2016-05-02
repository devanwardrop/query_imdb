create or replace FUNCTION QUERY_OMDBAPI(p_title varchar2)
  RETURN VARCHAR2 
AS 
  pieces UTL_HTTP.html_pieces;
  url VARCHAR2(100) := 'http://www.omdbapi.com/?s=' || p_title;
  found_imdbid VARCHAR(100);
  
BEGIN

  pieces := UTL_HTTP.REQUEST_PIECES (url);
  found_imdbid := SUBSTR (pieces(1), 1, 100);
  
  return found_imdbid;
END QUERY_OMDBAPI;