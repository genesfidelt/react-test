import React from 'react';
import ReactDOM from 'react-dom';

import Box from '@mui/material/Box';

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Nav from './Nav';
import Content from './Content';

export default function Base() {
    const [sideNavExpanded, setSideNavExpanded] = React.useState(true);

    function handleResize() {
        // iPhone X width, for example
        if (window.innerWidth <= 375) {
          setSideNavExpanded(false);
    
          // write other logic here such as disabling hamburger button
        }
      }
    
      React.useEffect(() => {
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
            />
            <Box style={contentStyle}><Content /></Box>
        </Router>
    );
}

if (document.getElementById('mainapp')) {
    ReactDOM.render(<Base />, document.getElementById('mainapp'));
}