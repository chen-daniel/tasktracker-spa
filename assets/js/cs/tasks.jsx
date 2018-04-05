import React from 'react';
import Task from './task';

export default function Tasks(params) {
  let tasks = _.map(params.tasks, (task) => <div><Task key={task.id} task={task} /><br></br></div>);
  return <div>
    { tasks }
  </div>;
}
