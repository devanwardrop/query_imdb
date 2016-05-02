--PRG 340, Final Project
DECLARE
   CURSOR all_of_mm_movie_cur
   IS
      SELECT *
        FROM mm_movie;
    
  my_title varchar2(100);
  my_title_url_friendly varchar2(200);
  omdb_return_str varchar2(200);
  omdbid varchar2(100);
  
BEGIN
   FOR movie_rec 
   IN all_of_mm_movie_cur
   LOOP
      my_title := movie_rec.movie_title;
      
      --code to encode spaces and commas in titles
      my_title_url_friendly := utl_url.escape(my_title);
      my_title_url_friendly := replace(my_title_url_friendly, ',' , '%2c');
      --DBMS_OUTPUT.put_line(my_title_url_friendly);
      
      omdb_return_str := SUBSTR (QUERY_OMDBAPI(my_title_url_friendly), 1, 200);
      omdbid := PARSE_VALUE_2(omdb_return_str);
      
      UPDATE mm_movie
      SET imdbid = omdbid
      WHERE movie_title = my_title;
      
   END LOOP;
END;



