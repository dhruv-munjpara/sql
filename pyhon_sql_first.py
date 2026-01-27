import mysql.connector
# xammp part:
# CREATE DATABASE student;
# CREATE table student(
# 	id int AUTO_INCREMENT PRIMARY  KEY,
#     study varchar(50),
#     coiurse varchar(50),
#     name varchar(50)
# );


try:
    db=mysql.connector.connect(
            host="localhost",
            username="root",
            password="",
            database="student"
            )
    cursor=db.cursor()
    print("database connecterd")

except mysql.connector.Error as err:
    print("db is not connected",+err)

try:
    study=input("enter your study")
    course=input("enter your course")
    name=input("enter your name")

    sql="insert into student(study,course,name) Values (%s,%s,%s)"
    val=(study,course,name)
    cursor.execute(sql,val)
    db.commit()
    print("data insert successfully!!")

except mysql.connector.Error as err:
    print("data not insert",err)