import React, { useEffect } from 'react';
import ReactDOM from 'react-dom';

import { Formik, Field, Form, ErrorMessage } from 'formik';
import { TextField, Grid, Button } from '@mui/material';
import * as Yup from 'yup';
import axios from 'axios';

import Cookies from "js-cookie";

export default function Logout({ShowPage}) {

    useEffect(() => {
        console.log('logout token');
        console.log(Cookies.get('access_token'));

        axios.post(
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
            ShowPage();
        });
      });

    return (
        <></>
      );
}

