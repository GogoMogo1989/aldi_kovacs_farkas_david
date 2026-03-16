using SpacefarerService as service from './spacefarer-service';

annotate service.Spacefarers with {
    firstName               @title : 'First Name';
    lastName                @title : 'Last Name';
    email                   @title : 'Email';
    originPlanet            @title : 'Origin Planet';
    stardustCollection      @title : 'Stardust Collection';
    wormholeNavigationSkill @title : 'Wormhole Navigation Skill';
    spacesuitColor          @title : 'Spacesuit Color';
    departmentName          @title : 'Department';
    positionTitle           @title : 'Position';

    department_ID @UI.HiddenFilter;
    position_ID   @UI.HiddenFilter;
};

annotate service.Spacefarers with @(
Capabilities: {
   NavigationRestrictions : {
       $Type : 'Capabilities.NavigationRestrictionsType',
       RestrictedProperties : [
           {
               $Type : 'Capabilities.NavigationPropertyRestriction',
               NavigationProperty : DraftAdministrativeData,
               FilterRestrictions : {
                   $Type : 'Capabilities.FilterRestrictionsType',
                   Filterable : false,
               },
           },
       ],
   },
});

annotate service.Spacefarers with @(UI : {
    HeaderInfo : {
        TypeName       : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title : {
            $Type : 'UI.DataField',
            Value : firstName
        },
        Description : {
            $Type : 'UI.DataField',
            Value : lastName
        }
    },

    SelectionFields : [
        firstName,
        lastName,
        originPlanet
    ],

    LineItem : [
        { $Type : 'UI.DataField', Value : firstName,               ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : lastName,                ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : email,                   ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : originPlanet,            ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : stardustCollection,      ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : wormholeNavigationSkill, ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : spacesuitColor,          ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : departmentName,          ![@UI.Importance] : #High },
        { $Type : 'UI.DataField', Value : positionTitle,           ![@UI.Importance] : #High }
    ],

    Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'SpacefarerInformation',
            Label  : 'Spacefarer Information',
            Target : '@UI.FieldGroup#SpacefarerInformation'
        }
    ],

    FieldGroup #SpacefarerInformation : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            { $Type : 'UI.DataField', Value : firstName },
            { $Type : 'UI.DataField', Value : lastName },
            { $Type : 'UI.DataField', Value : email },
            { $Type : 'UI.DataField', Value : originPlanet },
            { $Type : 'UI.DataField', Value : stardustCollection },
            { $Type : 'UI.DataField', Value : wormholeNavigationSkill },
            { $Type : 'UI.DataField', Value : spacesuitColor },
            { $Type : 'UI.DataField', Value : departmentName },
            { $Type : 'UI.DataField', Value : positionTitle }
        ]
    }

});
