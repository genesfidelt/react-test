import React from "react";
import SideNav, {
  Toggle,
  Nav,
  NavItem,
  NavIcon,
  NavText
} from "@trendmicro/react-sidenav";
import "@trendmicro/react-sidenav/dist/react-sidenav.css";

export const SideBar = ({ sideNavExpanded, setSideNavExpanded }) => {
  return (
    <>
      <SideNav
        onToggle={() => {
          setSideNavExpanded(!sideNavExpanded);
        }}
        expanded={sideNavExpanded}
      >
        <SideNav.Toggle />
        <SideNav.Nav defaultSelected="home">
          <NavItem eventKey="home" onClick={() => {
            console.log('clicked');
          }}>
            <NavIcon>
              <i className="fa fa-fw fa-home" style={{ fontSize: "1.75em" }} />
            </NavIcon>
            <NavText>Home</NavText>
          </NavItem>
          <NavItem eventKey="charts">
            <NavIcon>
              <i
                className="fa fa-fw fa-line-chart"
                style={{ fontSize: "1.75em" }}
              />
            </NavIcon>
            <NavText>Charts</NavText>
          </NavItem>
        </SideNav.Nav>
      </SideNav>
    </>
  );
};

export default SideBar;