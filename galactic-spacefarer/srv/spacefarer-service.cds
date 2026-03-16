using { galactic as db } from '../db/schema';

@requires: 'authenticated-user'
@cds.query.limit.default: 5
service SpacefarerService {

  @restrict: [
    { grant: '*',      to: 'admin' },
    { grant: 'READ',   to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'CREATE', to: 'authenticated-user' },
    { grant: 'UPDATE', to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'DELETE', to: 'authenticated-user', where: (originPlanet = $user.planet) }
  ]
  @odata.draft.enabled
  entity Spacefarers as projection on db.Spacefarers {
    key ID,
    firstName,
    lastName,
    email,
    originPlanet,
    stardustCollection,
    wormholeNavigationSkill,
    spacesuitColor,
    department.name  as departmentName,
    position.title   as positionTitle
  };

  entity Departments as projection on db.Departments;
  entity Positions   as projection on db.Positions;
}