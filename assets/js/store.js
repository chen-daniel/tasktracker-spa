import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';


function tasks(state = [], action) {
  switch (action.type) {
  case 'TASKS_LIST':
    return [...action.tasks];
  case 'ADD_TASK':
    return [action.task, ...state];
  default:
    return state;
  }
}

function users(state = [], action) {
  switch (action.type) {
  case 'USERS_LIST':
    return [...action.users];
  default:
    return state;
  }
}

let empty_form = {
  user_id: "",
  token: "",
  created_by_id: "",
  assigned_to_id: "",
  title: "",
  description: "",
  completed: false,
  time: ""
};

function form(state = empty_form, action) {
  switch (action.type) {
    case 'UPDATE_FORM':
      return Object.assign({}, state, action.data);
    case 'CLEAR_FORM':
      return empty_form;
    case 'SET_TOKEN':
      return Object.assign({}, state, action.token);
    default:
      return state;
  }
}


function token(state = null, action) {
  switch (action.type) {
    case 'SET_TOKEN':
      return action.token;
    default:
      return state;
  }
}

let empty_login = {
  email: "",
  pass: "",
};

function login(state = empty_login, action) {
  switch (action.type) {
    case 'UPDATE_LOGIN_FORM':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

let empty_registration_form = {
    name: "",
    email: "",
    pass: "",
};

function registrationForm(state = empty_registration_form, action) {
  switch (action.type) {
    case 'UPDATE_REGISTRATION_FORM':
      return Object.assign({}, state, action.data);
    case 'CLEAR_REGISTRATION_FORM':
      return empty_registration_form;
    default:
      return state;
  }
}

function root_reducer(state0, action) {
    let reducer = combineReducers({tasks, users, form, registrationForm, token, login});
    let state1 = reducer(state0, action);
    return deepFreeze(state1)
};

let store = createStore(root_reducer);
export default store;
