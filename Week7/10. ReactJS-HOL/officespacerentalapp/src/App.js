import './App.css';

function App() {
  const element = "Office Space";
  const offices = [
    { Name: "DBS", Rent: 50000, Address: "Chennai" },
    { Name: "WeWork", Rent: 75000, Address: "Bangalore" },
    { Name: "Regus", Rent: 40000, Address: "Hyderabad" }
  ];

  return (
    <div className="App">
      <h1>{element} , at Affordable Range</h1>
      {offices.map((item, index) => {
        const colorClass = item.Rent <= 60000 ? "textRed" : "textGreen";
        return (
          <div key={index}>
            <img src="/office.png" width="25%" height="25%" alt="Office Space" />
            <h1>Name: {item.Name}</h1>
            <h3 className={colorClass}>Rent: Rs. {item.Rent}</h3>
            <h3>Address: {item.Address}</h3>
          </div>
        );
      })}
    </div>
  );
}

export default App;
