import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './actions/giphy_actions';
import { receiveSearchGiphys, requestSearchGiphys, RECEIVE_SEARCH_GIPHYS, REQUEST_SEARCH_GIPHYS } from './actions/giphy_actions';



document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.requestSearchGiphys = requestSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.store = store;
  ReactDOM.render(
    <div>
      <Root store={store}/>
    </div>
    , document.getElementById('root'));
});
