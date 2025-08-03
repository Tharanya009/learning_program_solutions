import React, { useState } from 'react';

function CurrencyConvertor() {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('Euro');
  const [converted, setConverted] = useState(null);

  const conversionRates = {
    Euro: 90,
    USD: 75,
    GBP: 105
  };

  function handleSubmit(e) {
    e.preventDefault();

    if (!amount || isNaN(amount)) {
      alert("Please enter a valid amount.");
      return;
    }

    const rate = conversionRates[currency];
    const result = (parseFloat(amount) / rate).toFixed(2);
    setConverted(result);
  }

  return (
    <form onSubmit={handleSubmit} style={{ textAlign: 'left', marginTop: '10px' }}>
      <div>
        <label>Amount: </label>
        <input
          type="number"
          value={amount}
          onChange={(e) => setAmount(e.target.value)}
          required
        />
      </div>
      <br />
      <div>
        <label>Currency: </label>
        <select value={currency} onChange={(e) => setCurrency(e.target.value)}>
          <option value="Euro">Euro</option>
          <option value="USD">USD</option>
          <option value="GBP">GBP</option>
        </select>
      </div>
      <br />
      <button type="submit">Submit</button>
      <br /><br />
      {converted && (
        <p>
          Converting to {currency}: Amount is {converted} {currency === 'Euro' ? '€' : currency === 'USD' ? '$' : '£'}
        </p>
      )}
    </form>
  );
}

export default CurrencyConvertor;
