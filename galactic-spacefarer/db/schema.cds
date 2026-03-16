namespace galactic;

entity Planets {
  key code : String(50);
  name     : String(100);
}

entity Departments {
  key ID   : UUID;
  name     : String(100);
}

entity Positions {
  key ID   : UUID;
  title    : String(100);
}

entity Spacefarers {
  key ID : UUID;

  firstName : String(100);
  lastName  : String(100);
  email     : String(120);

  originPlanet : String(50);

  stardustCollection : Integer;
  wormholeNavigationSkill : Integer;

  spacesuitColor : String(50);

  department : Association to Departments;
  position   : Association to Positions;
}