import React from 'react';
import CourseDetails from './CourseDetails';
import BookDetails from './BookDetails';
import BlogDetails from './BlogDetails';
import './App.css';

function App() {
  return (
    <div className="columns">
      <div className="column">
        <h2 className="heading">Course Details</h2>
        <CourseDetails />
      </div>
      <div className="divider"></div>
      <div className="column">
        <h2 className="heading">Book Details</h2>
        <BookDetails />
      </div>
      <div className="divider"></div>
      <div className="column">
        <h2 className="heading">Blog Details</h2>
        <BlogDetails />
      </div>
    </div>
  );
}

export default App;
