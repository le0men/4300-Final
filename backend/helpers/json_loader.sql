SELECT doc->"$.data",id INTO @doc,@id FROM appiphany.test;

CREATE TABLE appiphany.dataslice 
AS SELECT * FROM JSON_TABLE(@doc, 
"$[*]" 
COLUMNS(
rid VARCHAR(100) PATH "$.id",
username VARCHAR(100) PATH "$.userName",
tuid VARCHAR(100) PATH "$.date",
rating INTEGER PATH "$.score",
title VARCHAR(100) PATH "$.title",
review VARCHAR(1024) PATH "$.text",
thumbs INTEGER PATH "$.thumbsUp"
)) AS jt;