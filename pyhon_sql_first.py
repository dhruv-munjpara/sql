import mysql.connector
# xammp part:
# CREATE DATABASE student;
# CREATE table student(
# 	id int AUTO_INCREMENT PRIMARY  KEY,
#     study varchar(50),
#     course varchar(50),
#     name varchar(50)
# );
try:
    db=mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="student"
    )
    cursor=db.cursor()
    print("database connecterd")

except mysql.connector.Error as err:
    print("db is not connected",err)

def data_insert():
    try:
        study=input("enter your study:")
        course=input("enter your course:")
        name=input("enter your name:")

        sql="insert into student(study,course,name) Values (%s,%s,%s)"
        val=(study,course,name)

        cursor.execute(sql,val)
        db.commit()
        print("data insert successfully!!")

    except mysql.connector.Error as err:
        print("data not insert",err)



def data_update():
    try:
        id=input("enter your id")
        study=input("enter u r study for upadte")
        course=input("enter u r course for update")
        name=input("enter u r name for update")


        sql="update student set study=%s,course=%s,name=%s where id=%s"
        val=(study,course,name,id)

        cursor.execute(sql,val)

        db.commit()
        print("data updated successfully!!")

    except mysql.connector.Error as err:
        print("data not update",err)

def data_delete():
    try:
        id=input("enter a id for delete the data:")

        sql="delete from student where id=%s"
        val=(id,)

        cursor.execute(sql,val)

        db.commit()
        print("data deleted successfully!!")

    except mysql.connector.Error as err:
        print("data not deleted",err)

def data_fetch():
    try:
        cursor.execute("select * from student")
        data=cursor.fetchall()

        for i in data:
            print(i)
    except mysql.connector.Error as err:
        print("data not fetch",err)


while True:
    print("\n=====student=====")
    print("1.insert\n2.update\n3.delete\n4.fetch\n5.exit")

    Choice=input("enter a choice:")

    if Choice=="1":
        data_insert()
    elif Choice=="2":
        data_update()
    elif Choice=="3":
        data_delete()
    elif Choice=="4":
        data_fetch()
    else:
        exit()