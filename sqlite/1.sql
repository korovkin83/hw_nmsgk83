.headers on
.mode column
pragma foreign_keys =on;

create table designers (
'id_designer' integer primary key autoincrement,
'authorship_cert' integer,
'id_employee' integer,
'id_manager' integer,
 foreign key ('id_employee') references employees('id_designer'),
 foreign key ('id_manager') references managers('id_designer'),
);

create table customers (
  'id_customer' integer primary key autoincrement,
  'organization' text,
  'phone' text,
  'email' text,
  'address' text,
);

create table contats (
  'id_manager' integer,
  'id_contract' integer primary key autoincrement,
  'id_customer' integer,
  'contract_cost' float
  foreign key ('id_manager') references managers('id_manager'),
  foreign key ('id_customer') references customers('id_customer'),
);

create table employees (
  'id_employee' integer primary key autoincrement,
  'employee_name' text,
  'passport' text,
  'id_designer' integer,
  'id_departament' integer,
  'id_enginer' integer,
  foreign key ('id_departament') references departaments('id_designer'),
  foreign key ('id_enginer') references engineers('id_employee'),
);

create table managers (
  'id_enginer' integer,
  'id_designer' integer,
  'id_manager' integer primary key autoincrement,
  foreign key ('id_enginer') references engineers('id_manager'),
  foreign key ('id_designer') references designers('id_manager'),
);

create table contracts_project (
  'id_contract_project' integer primary key autoincrement,
  'id_contract' integer,
  'id_project' integer,
  foreign key ('id_contract') references contats('id_contract'),
  foreign key ('id_project') references projects('project_cost'),
);

create table departaments (
  'id_departament' integer primary key autoincrement,
  'departament_name' text,
  'chief' text
);

create table engineers (
  'id_engineer' integer primary key autoincrement,
  'id_employee' integer,
  'id_manager' integer,
  foreign key ('id_employee') references employees('id_enginer'),
  foreign key ('id_manager') references managers('id_enginer'),
);

create table projects (
  'id_manager' integer,
  'id_project' integer primary key autoincrement,
  'project_cost' float,
  foreign key ('id_manager') references managers('id_manager'),
);
