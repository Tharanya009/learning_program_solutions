import React, { useState } from 'react';
import CurrencyConvertor from './CurrencyConvertor';

function App() {
  const [count, setCount] = useState(0);

  function increment() {
    setCount(prev => prev + 1);
    sayHello();
  }

  function decrement() {
    setCount(prev => prev - 1);
  }

  function sayHello() {
    alert("Hello! This is a static message.");
  }

  function sayWelcome(msg) {
    alert(msg);
  }

  function handleClick() {
    alert("I was clicked");
  }

  return (
    <div style={{ textAlign: 'left', marginLeft: '30px' }}>
      <h1>Count: {count}</h1>
      <button onClick={increment}>Increment</button>
      <br /><br />
      <button onClick={decrement}>Decrement</button>
      <br /><br />
      <button onClick={() => sayWelcome("Very Welcome")}>Say Welcome</button>
      <br /><br />
      <button onClick={handleClick}>Click on me</button>
      <br /><br />
      <h2>Currency Convertor!!!</h2>
      <CurrencyConvertor />
    </div>
  );
}

export default App;
