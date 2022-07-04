import { React, useState, useEffect } from 'react';
import ReactDOM from 'react-dom';

import Cookies from 'js-cookie'
import axios from 'axios';

import Login from './Login';
import Page from './Page';

const Base = () => {

  const [ page, setPage ] = useState();

  const refreshPage = () => {
    if (Cookies.get('access_token')) {
      setPage (<Page refreshPage={refreshPage}/>);
    } else {
      setPage (<Login refreshPage={refreshPage}/>);
    }
  }

  useEffect(() => { refreshPage() }, []);

  return (<>{ page }</>);
}
export default Base;

if (document.getElementById('mainapp')) {
  ReactDOM.render(<Base />, document.getElementById('mainapp'));
}