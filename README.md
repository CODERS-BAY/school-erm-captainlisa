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

second draft:

![School-ERM](school2.jpeg)

## Relational Model (updated to second draft)

* Teacher (**teacher_ID:varchar(10)**, *department_allocation_ID:int*, *subjectlist_ID:int*, first_name:varchar(20), last_name:varchar(20), phone:varchar(20), email:varchar(32), date_of_birth:date, value_units:int)
* Department (**department_ID:int**, *department_allocation_ID:int*, designation:varchar(20), head_of_department:varchar(10))
* Department Allocation (**department_allocation_ID:int**, *teacher_ID:varchar(10)*,  *department_ID:int*)
* Subject (**subject_ID:int**, *teaching_group_ID:int*, *subjectlist_ID:int*, *curriculum_ID:int*, *gradelist_ID:int*, designation:varchar(32), classroom:varchar(10))
* Form of Education (**eduform_ID:int**, *curriculum_ID:int*, *class_ID:varchar(5)*, designation:varchar(32), regular_class:boolean, evening_class:boolean)
* Class (**class_ID:varchar(5)**, **school_year:int**, *eduform_ID:int*)
* Subjectlist (**subjectlist_ID:int**, *subject_ID:int*, *teacher_ID:varchar(10)*)
* Curriculum (**curriculum_ID:int**, *subject_ID:int*, *eduform_ID:int*, school_year:int, semester:int, is_theory:boolean, is_practice:boolean)
* Teaching Group (**teaching_group_ID:int**, *subject_ID:int*, factor:double)
* Student (**student_ID:int**, *class_ID:varchar(5)*, *gradelist_ID:int*, *parent_ID:int*, *siblinglist_ID:int*, first_name:varchar(20), last_name:varchar(20), phone:varchar(20), email:varchar(32), date_of_birth:date, semester:int, function:varchar(20))
* Parent (**parent_ID:int**, *student_ID:int*, first_name:varchar(20), last_name:varchar(20), phone:varchar(20), email:varchar(32))
* Gradelist (**gradelist_ID:int**, *student_ID:int*, *subject_ID:int*, semester:int, year:int, grade:int)
* Siblinglist (**siblinglist_ID:int**, *student_ID:int*, *sibling_ID:*)

## School Schema 

![School](school_schema.jpg)