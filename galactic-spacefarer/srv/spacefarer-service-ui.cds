using SpacefarerService as service from './spacefarer-service';

annotate service.Spacefarers with {

    // Mezők címei a Fiori UI-ban
    firstName               @title : 'First Name';
    lastName                @title : 'Last Name';
    email                   @title : 'Email';
    originPlanet            @title : 'Origin Planet';
    stardustCollection      @title : 'Stardust Collection';
    wormholeNavigationSkill @title : 'Wormhole Navigation Skill';
    spacesuitColor          @title : 'Spacesuit Color';
    departmentName          @title : 'Department';
    positionTitle           @title : 'Position';
    department_ID           @title : 'Department';
    position_ID             @title : 'Position';

    // Origin planet mezőhöz dropdown / value help beállítás
    originPlanet @(
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Planets',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : originPlanet,
                    ValueListProperty : 'code'
                }
            ]
        }
    );

    // Department mezőhöz value help beállítás
    department_ID @(
        Common.Text : departmentName,
        Common.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Departments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );

    // Position mezőhöz value help beállítás
    position_ID @(
        Common.Text : positionTitle,
        Common.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Positions',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title'
                }
            ]
        }
    );
};

// DraftAdministrativeData navigációs filterezésének tiltás
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
                        Filterable : false
                    }
                }
            ]
        }
    }
);

annotate service.Spacefarers with @(UI : {

    // Object Page fejléc beállításai
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

    // Filter táblázat mezői
    SelectionFields : [
        firstName,
        lastName,
        originPlanet
    ],

    // Táblázat oszlopai a List Report oldalon
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

    // Az Object Page szekciói
    Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'SpacefarerInformation',
            Label  : 'Spacefarer Information',
            Target : '@UI.FieldGroup#SpacefarerInformation'
        }
    ],

    // Az Object Page-en megjelenő mezők create / edit / display nézetben
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
            { $Type : 'UI.DataField', Value : department_ID },
            { $Type : 'UI.DataField', Value : position_ID }
        ]
    }
});