import React from 'react';

const blogs = [
  {
    id: 1,
    title: 'React Learning',
    author: 'Stephen Biz',
    content: 'Welcome to learning React!',
  },
  {
    id: 2,
    title: 'Installation',
    author: 'Schewzdenier',
    content: 'You can install React from npm.',
  },
];

const BlogDetails = () => {
  return (
    <>
      {blogs.map((blog) => (
        <div key={blog.id}>
          <div className="bold">{blog.title}</div>
          <div className="bold">{blog.author}</div>
          <div>{blog.content}</div>
        </div>
      ))}
    </>
  );
};

export default BlogDetails;
