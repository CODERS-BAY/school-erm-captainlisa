# SchoolERM
A school information system for an HTL is to be developed:
The departmental structure of an HTL is to be reproduced. Each teacher is assigned to a department as a master department, but can also teach in classes of other departments. Each department is headed by a teacher as head of department.
For each form of education of the departments, the curriculum specifies which subjects have to be taught in which year and to what extent (theory and practice lessons).
The classes of a school year are taught by the teachers in the individual subjects to a certain extent (theory and practice lessons). Each student is assessed with one semester and one year mark per class and subject. The system should be able to record this information for several school years.
It should be possible to find out the class leaders of the different classes, as well as by whom which functions (class representative, cashier, etc.) are or were exercised.
Teachers are not remunerated according to the number of hours they teach, but according to the value units they hold: Each subject is assigned to a specific compulsory teaching group (I to VI). A factor (1.167 to 0.75) is defined for each teaching obligation group, which is used to convert lessons into value units.
A parent is responsible for each pupil (unless the pupil is a self-entitled guardian). If siblings attend school, this should also be able to be determined.

## ERM

![ER-Model](school_erm.jpeg)

## Relational Model
**primary key**
*foreign key*

* Teacher (**teacher-ID:int**, name:varchar(32), address:varchar(32), dateOfBirth:date, master_department:varchar(32), additional_department:varchar(32), classes:varchar(32))
* Department (**department-ID:int**, name:varchar(32), head_of_department:varchar(32), _form_of_education-ID:varchar(32)_)
* Curriculum (**_department-ID:int_**, **_subject-ID:int(32)_**, year:int, theory:boolean, practice:boolean, _teacher-ID:int_)
* Form of Education (**form_of_education-ID:int**, theory:boolean, practice:boolean)
* Subject (**subject-ID:int**, teaching_group:char, factor:double, value:int)
* Student (**student-ID:int**,  name:varchar(32), address:varchar(32), dateOfBirth:date, semester:int, _form_of_education-ID:varchar(32)_, has_sibling:boolean, function:varchar(32))
* Parent (**personal-ID:int**, *student-ID:int*, name:varchar(32), address:varchar(32), phone_number:varchar(32), dateOfBirth:date)