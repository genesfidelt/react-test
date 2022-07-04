import React from 'react';

import { Formik, Field, Form, ErrorMessage } from 'formik';
import { TextField, Grid, Button } from '@mui/material';
import * as Yup from 'yup';
import axios from 'axios';

import Cookies from "js-cookie";
import { makeStyles } from "@material-ui/core/styles";
import { Card } from "@material-ui/core";

import api from '../config/apisauce';
import { loginUser } from '../config/apisauce';

const useStyles = makeStyles({
  root: {
    minWidth: "100%",
    minHeight: "100vh",
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
  },
  card: {
    maxWidth: "40%",
    minHeight: "20vh",
    display: "flex",
    alignItems: "center",
    padding: "1%",
  }
});

const Login = ({ refreshPage }) => {
  const classes = useStyles();

  const logUser = (data) => {
    // we should log user data for the ff info
    // >last login
    // >token value
    // >possibly IP
    // this is for comparing their session/cookie values
    const response = loginUser();
    console.log(response.data);
  }

  return (
    <Formik
      initialValues={{
        password: '',
        email: '',
      }}
      validationSchema={
        Yup.object({
          email: Yup.string()
            .email('Invalid email')
            .required('Required'),
          password: Yup.string()
            .required('Required')
        })
      }
      onSubmit={(values, { setSubmitting }) => {
        console.log(values);
        api.post(
          '/api/auth/login',
          values,
          { headers: { 'content-type': 'application/json' }}
        ).then((response) => {
          console.log(response.data);
          Cookies.set(
            'access_token',
            response.data.access_token,
            { expires: 7 }
          );
          logUser(response.data);
          refreshPage();
        });
      }}
    >
      <Grid
        className={ classes.root }
        alignItems="center"
        justify="center"
      >
        <Card className={ classes.card }>
          <Form>
            <Grid container spacing={3}>
              <Grid item xs={2} md={2}></Grid>
              <Grid item xs={8} md={8}>
                <Field name="email">
                  {({ field }) => (
                    <TextField
                      required
                      variant="outlined"
                      margin="normal"
                      fullWidth
                      label="Email"
                      autoFocus
                      type="email"
                      { ...field }
                    />
                  )}
                </Field>
                <ErrorMessage name="email" />
              </Grid>
              <Grid item xs={2} md={2}></Grid>
              <Grid item xs={2} md={2}></Grid>
              <Grid item xs={8} md={8}>
                <Field name="password">
                  {({ field }) => (
                    <TextField
                      required
                      variant="outlined"
                      margin="normal"
                      fullWidth
                      label="Password"
                      autoFocus
                      type="password"
                      { ...field }
                    />
                  )}
                </Field>
                <ErrorMessage name="password" />
              </Grid>
              <Grid item xs={2} md={2}></Grid>
              <Grid item xs={2} md={2}></Grid>
              <Grid item xs={8} md={8}>
                <Button type="submit" fullWidth>Submit</Button>
              </Grid>
              <Grid item xs={2} md={2}></Grid>
            </Grid>
          </Form>
        </Card>
      </Grid>
    </Formik>
  );
}
export default Login;