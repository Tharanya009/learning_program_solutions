import React from 'react';

const courses = [
  { id: 1, name: 'Angular', date: '4/5/2021' },
  { id: 2, name: 'React', date: '6/3/2021' },
];

const CourseDetails = () => {
  return (
    <>
      {courses.map((course) => (
        <div key={course.id}>
          <div className="bold">{course.name}</div>
          <div>{course.date}</div>
        </div>
      ))}
    </>
  );
};

export default CourseDetails;
