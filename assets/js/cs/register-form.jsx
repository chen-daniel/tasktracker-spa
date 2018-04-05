import React from 'react';
import { connect } from 'react-redux';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import api from '../api';

function RegisterForm(props) {

  function update(ev) {
    let tgt = $(ev.target);

    let data = {};
    data[tgt.attr('name')] = tgt.val();
    let action = {
      type: 'UPDATE_FORM',
      data: data,
    };
    console.log(action);
    props.dispatch(action);
  }

  function updateCompleted(ev) {
  	let tgt = $(ev.target);
    let data = {};
    if (tgt.val() === 'false') {
    	data[tgt.attr('name')] = true;
    } else {
    	data[tgt.attr('name')] = false;
    }
    props.dispatch({
      type: 'UPDATE_REGISTRATION',
      data: data,
    });
  }

  function submit(ev) {
    api.register_user(props.form);
    console.log(props.form);
  }

  function clear(ev) {
    props.dispatch({
      type: 'CLEAR_FORM',
    });
  }

  return <div style={{padding: "4ex"}}>
    <h2>Register User</h2>
    <FormGroup>
      <Label for="name">Name</Label>
      <Input type="text" name="name" value={props.form.name} onChange={update}>
      </Input>
    </FormGroup>
    <FormGroup>
      <Label for="email">Email</Label>
      <Input type="text" name="email" value={props.form.email} onChange={update} />
    </FormGroup>
    <FormGroup>
      <Label for="password">Password</Label>
      <Input type="text" name="password" value={props.form.password} onChange={update} />
    </FormGroup>
    <Button onClick={submit} to={"/"} color="primary">Register Account</Button> &nbsp;
    <Button onClick={clear}>Clear</Button>
  </div>;
}

function state2props(state) {
  return {
    form: state.form,
    users: state.users,
  };
}

export default connect(state2props)(RegisterForm);
