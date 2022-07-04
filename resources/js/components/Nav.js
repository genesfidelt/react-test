import React from "react";
import { useState, useEffect } from "react";
import SideNav, {
  Toggle,
  Nav,
  NavItem,
  NavIcon,
  NavText
} from "@trendmicro/react-sidenav";
import "@trendmicro/react-sidenav/dist/react-sidenav.css";
import Cookies from "js-cookie";
import AccessAlarmIcon from '@mui/icons-material/AccessAlarm';
import { Divider } from '@mui/material';
import axios from 'axios';

import { sayHello } from './Base';
import { useRecoilState } from "recoil";

import api from '../config/apisauce';

const SideBar = ({ sideNavExpanded, setSideNavExpanded, changeContent }) => {

  const [ navList, setNavList ] = useState([]);

  const [todoList, setToDo] = useRecoilState(sayHello);

  const createNavList = () => {
    const nav = [
      { 'label': 'Capital', 'id': 'capital', 'access': 4 },
      { 'label': 'Companies', 'id': 'companies', 'access': 1 },
    ];
    return nav;
  };

  const handlerClickedNav = (e) => {
    
    if (e.target.id === "") { return }
    const page = e.target.id.split('-')[1];
    console.log(page);
    todoList.fresh();
    console.log('page change');

    changeContent(page);
    
  }

  const logout = (e) => {
    api.post(
      '/api/auth/logout',
      {},
      { headers: {
          'content-type':'application/json',
          'Accept':'application/json',
          'Authorization':  'Bearer ' + Cookies.get('access_token')
      } }
  ).then((response) => {
      console.log(response)
      Cookies.remove('access_token');
      //todoList();
      todoList.fresh();
  });
  }

  useEffect(() => {
    const list = createNavList();
    setNavList(list);
  }, []);

  return (
    <>
      <SideNav
        onToggle={() => {
          setSideNavExpanded(!sideNavExpanded);
        }}
        expanded={sideNavExpanded}
      >
        <SideNav.Toggle />
        <SideNav.Nav defaultSelected=" ">
          {
            navList.map((item, index) => {
              return (
                <NavItem
                  key={'item-' + item.id}
                  eventKey={item.id}
                  id={'item-' + item.id}
                  onClick={handlerClickedNav}
                >
                  <NavIcon id={'navicon-' + item.id}>
                    <AccessAlarmIcon id={'icon-' + item.id}/>
                  </NavIcon>
                  <NavText id={'text-' + item.id}>{item.label}</NavText>
                </NavItem>
              );
            })
          }
          <Divider />
          <NavItem
                eventKey='logout'
                  id='item-logout'
                  onClick={logout}
                >
                  <NavIcon id='navicon-logout'>
                    <AccessAlarmIcon id='icon-logout'/>
                  </NavIcon>
                  <NavText id='text-logout'>Log Out</NavText>
                </NavItem>
        </SideNav.Nav>
      </SideNav>
    </>
  );
};
export default SideBar;