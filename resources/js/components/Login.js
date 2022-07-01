import React from 'react';

import { Formik, Field, Form, ErrorMessage } from 'formik';
import { TextField, Grid, Button } from '@mui/material';
import * as Yup from 'yup';
import axios from 'axios';

import Cookies from "js-cookie";
import { makeStyles } from "@material-ui/core/styles";
import { Card } from "@material-ui/core";


const useStyles = makeStyles({
  root: {
    minWidth: "100%",
    minHeight: "100vh",
    display: "flex",
    flexDirection: "column",
    justifyContent: "center"
  },
  card: {
    maxWidth: "40%",
    minHeight: "20vh",
    display: "flex",
    alignItems: "center"
  }
});

export default function Login({refreshPage}) {
  const classes = useStyles();
    return (
        <Formik
          initialValues={{ password: '', email: '' }}
          validationSchema={Yup.object({

          })}
   
          onSubmit={(values, { setSubmitting }) => {
            console.log(JSON.stringify(values, null, 2));
            axios.post(
                '/api/auth/login',
                values,
                { headers: { 'content-type':'application/json' } }
            )
                .then((response) => {
                    console.log(response.data);
                    Cookies.set(
                      'access_token',
                      response.data.access_token,
                      { expires: 7 }
                    );
                    refreshPage()
                })
          }}
        >


<Grid
      className={classes.root}
      spacing={0}
      alignItems="center"
      justify="center"
    >
   <Card className={classes.card}>
          <Form>


<Field name="email">
  {({ field }) => (
  <TextField
    required
    variant="outlined"
    margin="normal"

    label="Email"
    autoFocus
    type="email"       
    {...field} 
  />
  )}
</Field>
<ErrorMessage name="email" />
<Field name="password" >
  {({ field }) => (
  <TextField
    required
    variant="outlined"
    margin="normal"

    label="Password"
    autoFocus
    type="password"         
    {...field} 
  />
  )}
</Field>
<ErrorMessage name="password" />

            <Button type="submit">Submit</Button>
          </Form></Card></Grid>
        </Formik>
   
      );
}

