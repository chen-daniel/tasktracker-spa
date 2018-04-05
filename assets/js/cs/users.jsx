import React from 'react';
import { Link } from 'react-router-dom';

function User(params) {
  return <p>{params.user.name}</p>;
}

export default function Users(params) {
  let users = _.map(params.users, (user) => <User key={user.id} user={user} />);
  return <div>
    { users }
  </div>;
}
