namespace com.training;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Course : cuid {
    Student : Association to StudentCourse
                  on Student.Course = $self;
};

entity Student : cuid {
    Course : Association to many StudentCourse
                 on Course.Student = $self;
};

entity StudentCourse : cuid {
    Student : Association to Student;
    Course  : Association to Course;
}
