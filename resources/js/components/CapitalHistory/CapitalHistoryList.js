import React from 'react';
import ReactDOM from 'react-dom';

import { Formik, Field, Form, ErrorMessage } from 'formik';
import { TextField, Grid, Button } from '@mui/material';
import * as Yup from 'yup';

export default function CapitalHistoryList() {

    

    return (

        <Formik
   
          initialValues={{ firstName: '', lastName: '', email: '' }}
   
          validationSchema={Yup.object({
   
            firstName: Yup.string()
   
              .max(15, 'Must be 15 characters or less')
   
              .required('Required'),
   
            lastName: Yup.string()
   
              .max(20, 'Must be 20 characters or less')
   
              .required('Required'),
   
            email: Yup.string().email('Invalid email address').required('Required'),
   
          })}
   
          onSubmit={(values, { setSubmitting }) => {
   
            setTimeout(() => {
   
              alert(JSON.stringify(values, null, 2));
   
              setSubmitting(false);
   
            }, 400);
   
          }}
   
        >
   
          <Form>
   
            <label htmlFor="firstName">First Name</label>
   
            <Field name="firstName" type="text" />
   
            <ErrorMessage name="firstName" />
   
    
   
            <label htmlFor="lastName">Last Name</label>
   
            <Field name="lastName" type="text" />
   
            <ErrorMessage name="lastName" />
   
    
   
            <label htmlFor="email">Email Address</label>
   
            <Field name="email" type="email" />
   
            <ErrorMessage name="email" />
   
    
   
            <button type="submit">Submit</button>
   
          </Form>
   
        </Formik>
   
      );
}

