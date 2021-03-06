import { lazy, React, Suspense } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';

import { useRecoilState } from "recoil";
import { quickcash } from './Globals';

import Grid from '@mui/material/Grid';
import { useState, useEffect } from "react";
import Box from '@mui/material/Box';

import Nav from './Nav';
import Load from './Load';
import PageList from './PageList';

const Page = ({ refreshPage }) => {
  const [qc, setQC] = useRecoilState(quickcash);
  
  const [content, setContent] = useState();

  const [sideNavExpanded, setSideNavExpanded] = useState(true);

  const handleResize = () => {
    // iPhone X width, for example
    if (window.innerWidth <= 375) {
      setSideNavExpanded(false);
    }
  }

  const changeContent = (page) => {
    const MainContent = PageList[page].component;
    setContent(<MainContent content={page} />)
    qc.refresh();
  }

  useEffect(() => {
    window.addEventListener("resize", handleResize);
    handleResize(); // on-component-mount, check already to see if user has a small device
    setQC({refresh: refreshPage});
    
    return () => {
      window.removeEventListener("resize", handleResize);
    };
    
    
  }, []); // initialize event listeners on-mount & clean on-unmount

  const contentStyle = {
    marginLeft: sideNavExpanded ? "250px" : "70px", // arbitrary values
    transition: "margin 0.2s ease"
  };

  return (
    <>
      <BrowserRouter>
        <Suspense fallback={<Load />}>
          <Nav
            setSideNavExpanded={setSideNavExpanded}
            sideNavExpanded={sideNavExpanded}
            changeContent={changeContent}
            refreshPage={refreshPage}
          />
          <Box style={contentStyle}>
          { content }
          </Box>
        </Suspense>
      </BrowserRouter>
    </>
  );
}
export default Page;
