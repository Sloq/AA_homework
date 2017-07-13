import React from 'react';
import GiphysIndex from './giphys_index';

class Giphy extends React.Component {
    constructor() {
      this.state = {
        gifSearch: "",
        giphys: []
      };
      this.handleChange = this.handleChange.bind(this);
      this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
      e.preventDefault();

    }

    handleChange() {

    }

    render() {
      return(
      <div>
        <form onSubmit={this.handleSubmit}>
          <input value={this.state.gifSearch} onChange={ this.update('gifSearch') }/>
          <button type="button" onClick={ this.handleSubmit}>
            Search for Gif
          </button>
        </form>
      </div>
    );
    }
}
