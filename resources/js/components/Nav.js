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

import AccessAlarmIcon from '@mui/icons-material/AccessAlarm';
import ListItemIcon from '@mui/material/ListItemIcon';

export default function SideBar ({ sideNavExpanded, setSideNavExpanded, changeContent }) {

  const [ navList, setNavList ] = useState([]);
  const [ selectedNav, setSelectedNav ] = useState("");

  const createNavList = () => {
    const nav = [
      { 'label': 'Capital', 'id': 'capital', 'access': 4 },
      { 'label': 'Companies', 'id': 'companies', 'access': 1 },
      { 'label': 'Log Out', 'id': 'logout', 'access': 1 },
    ];
    return nav;
  };

  const handlerClickedNav = (e) => {
    if (e.target.id === "") { return }
    const page = e.target.id.split('-')[1];
    setSelectedNav(page);
    changeContent(page);
  }

  useEffect(() => {
    const list = createNavList();
    setNavList(list);
    setSelectedNav(list[0].id);
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
        <SideNav.Nav defaultSelected={selectedNav}>
          {
            navList.map((item, index) => {
              return (
                <NavItem
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
        </SideNav.Nav>
      </SideNav>
    </>
  );
};