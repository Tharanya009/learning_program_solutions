import React from 'react';

const books = [
  { id: 101, bname: 'Master React', price: 670 },
  { id: 102, bname: 'Deep Dive into Angular 11', price: 800 },
  { id: 103, bname: 'Mongo Essentials', price: 450 },
];

const BookDetails = () => {
  return (
    <>
      {books.map((book) => (
        <div key={book.id}>
          <div className="bold">{book.bname}</div>
          <div>{book.price}</div>
        </div>
      ))}
    </>
  );
};

export default BookDetails;
