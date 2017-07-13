import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  // your code here
  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num1});
  }
  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num2});
  }

  addNums(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtract(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  divide(e) {
    e.preventDefault();
    const result = this.state.num1/this.state.num2;
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    const result = 0;
    const num1 = "";
    const num2 = "";
    this.setState({ result, num1, num2 });
  }

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div class= "calc">
        <h1 id="title">Calculator</h1>
        <h1>{this.state.result}</h1>
          <input onChange={this.setNum1} type="text" value={num1}/>
          <input onChange={this.setNum2} type="text" value={num2}/>
          <br/>
          <button onClick={this.clear}>clear</button>
          <button onClick={this.addNums}>+</button>
          <button onClick={this.subtract}>-</button>
          <button onClick={this.multiply}>*</button>
          <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
