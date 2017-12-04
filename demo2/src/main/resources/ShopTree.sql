insert into PERMISSION values (1,'ADMIN',now(),now());
 insert into CUSTOMER values(1,'tttthuy','tranthuy0696@gmail.com','123',1,now(), null);
 
 curl -i -X GET http://localhost:8080/sendEmail?email=14130337@st.hcmuaf.edu.vn

 curl -i -H "Content-Type: application/json" -X POST -d '{"username":"username","password":"password"}
