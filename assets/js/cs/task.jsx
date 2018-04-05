import React from 'react';
import { Card, CardBody, CardHeader } from 'reactstrap';

export default function Task(params) {
  let task = params.task;
  return <Card>
    <CardHeader>
        <p><b>{ task.assigned_to.name }</b>: { task.title }</p>
    </CardHeader>
    <CardBody>
      <div>
        <p>Assigned by <b>{ task.created_by.name }</b></p>
        <p>{ task.description }</p>
        <p> { task.completed ? "complete" : "incomplete" }</p>
      </div>
    </CardBody>
  </Card>;
}
