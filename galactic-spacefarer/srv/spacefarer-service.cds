using { galactic as db } from '../db/schema';

@requires: 'authenticated-user'
@cds.query.limit.default: 20
service SpacefarerService {

  @restrict: [
    { grant: 'READ',   to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'CREATE', to: 'authenticated-user' },
    { grant: 'UPDATE', to: 'authenticated-user', where: (originPlanet = $user.planet) },
    { grant: 'DELETE', to: 'authenticated-user', where: (originPlanet = $user.planet) }
  ]
  @odata.draft.enabled
  entity Spacefarers as projection on db.Spacefarers;

}