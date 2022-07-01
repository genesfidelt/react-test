import React from 'react';
import ReactDOM from 'react-dom';

import { Formik, Field, Form, ErrorMessage } from 'formik';
import { TextField, Grid, Button } from '@mui/material';
import * as Yup from 'yup';
import axios from 'axios';

import Cookies from "js-cookie";

export default function Login() {

    

    return (
        <Formik
          initialValues={{ password: '', email: '' }}
          validationSchema={Yup.object({

          })}
   
          onSubmit={(values, { setSubmitting }) => {
            alert(JSON.stringify(values, null, 2));
            axios.post(
                '/api/auth/login',
                values,
                { headers: { 'content-type':'application/json' } }
            )
                .then((response) => {
                    console.log('works');
                    console.log(response.data);
                    Cookies.set('access_token', response.data.access_token, { expires: 7 })
                })
          }}
        >
   
          <Form>
            <label htmlFor="email">Email</label>
            <Field name="email" type="email" />
            <ErrorMessage name="email" />
            <label htmlFor="password">Password</label>
            <Field name="password" type="password" />
            <ErrorMessage name="password" />
            <button type="submit">Submit</button>
          </Form>
        </Formik>
   
      );
}

