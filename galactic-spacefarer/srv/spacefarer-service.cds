using { galactic as db } from '../db/schema';

// Bejelentkezett felhasználók érthetik csak el
@requires: 'authenticated-user'

// Lapozás
@cds.query.limit.default: 10
service SpacefarerService {

  // Jogosultság kezelések
  @restrict: [
    { grant: '*',      to: 'admin' },
    { grant: 'READ',   to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'CREATE', to: 'authenticated-user' },
    { grant: 'UPDATE', to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'DELETE', to: 'authenticated-user', where: (originPlanet = $user.planet) }
  ]

  // Fioriban applikációban lehessen draftolni
  @odata.draft.enabled

  // A fő entitás megjelenítése a Spacefarer táblázatban
  entity Spacefarers as projection on db.Spacefarers {
    key ID,
    firstName,
    lastName,
    email,
    originPlanet,
    stardustCollection,
    wormholeNavigationSkill,
    spacesuitColor,

    // Kapcsolt entitásokból kihozott megjelenítendő szövegekhez
    department.name as departmentName,
    position.title  as positionTitle,

    // Kapcsolt entitások ID mezőkhöz
    department.ID   as department_ID,
    position.ID     as position_ID
  };

  // Segéd entitások a value help 
  entity Departments as projection on db.Departments;
  entity Positions   as projection on db.Positions;
  entity Planets     as projection on db.Planets;
}