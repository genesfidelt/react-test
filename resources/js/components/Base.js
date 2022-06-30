import React from 'react';
import ReactDOM from 'react-dom';
import { useState, useEffect } from "react";

import Box from '@mui/material/Box';

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Nav from './Nav';
import CapitalHistoryList from './CapitalHistory/CapitalHistoryList';
import CompaniesList from './Companies/CompaniesList';

export default function Base() {
    
  const [sideNavExpanded, setSideNavExpanded] = useState(true);

  const [content, setContent] = useState();

  const handleResize = () => {
    // iPhone X width, for example
    if (window.innerWidth <= 375) {
      setSideNavExpanded(false);
    }
  }

  const changeContent = (page) => {
    const components = {
      companies: CompaniesList,
      capital: CapitalHistoryList,
    }

    const MainContent = components[page];
    setContent(<MainContent content={page}/>)
  } 

  useEffect(() => {
    window.addEventListener("resize", handleResize);
    handleResize(); // on-component-mount, check already to see if user has a small device

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []); // initialize event listeners on-mount & clean on-unmount

  const contentStyle = {
    marginLeft: sideNavExpanded ? "250px" : "70px", // arbitrary values
    transition: "margin 0.2s ease"
  };
    
  return (
      <Router>
        <Nav
          setSideNavExpanded={setSideNavExpanded}
          sideNavExpanded={sideNavExpanded}
          changeContent={changeContent}
        />
        <Box style={contentStyle}>
          { content }
        </Box>
      </Router>
  );
}

if (document.getElementById('mainapp')) {
  ReactDOM.render(<Base />, document.getElementById('mainapp'));
}