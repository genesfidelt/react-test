import { React, useState, useEffect } from 'react';
import ReactDOM from 'react-dom';

import Cookies from 'js-cookie'
import axios from 'axios';

import { RecoilRoot, atom, useRecoilState } from "recoil";

import Login from './Login';
import Page from './Page';

const sayHi = () => {
  console.log('hi!');
}


export const sayHello = atom({
  key: 'sayHello',
  //default: (() => { console.log('hello!')})(),
  //default: sayHi() //works as long as function is above
  //default: 'hi'
  default: {}
});



const Base = () => {

  const [ page, setPage ] = useState();

  const insideHi = () => {
    console.log('hi from inside')
  }

  const refreshPage = () => {

    if (Cookies.get('access_token')) {
      setPage (<Page refreshPage={refreshPage}/>);
    } else {
      setPage (<Login refreshPage={refreshPage}/>);
    }
  }

  useEffect(() => { refreshPage() }, []);
  
  return (<><RecoilRoot>{ page }</RecoilRoot></>);
}
export default Base;

if (document.getElementById('mainapp')) {
  ReactDOM.render(<Base />, document.getElementById('mainapp'));
}
