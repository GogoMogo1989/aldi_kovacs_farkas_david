using SpacefarerService as service from './spacefarer-service';

annotate service.Spacefarers with @(UI : {
    HeaderInfo : {
        TypeName       : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title          : {
            $Type : 'UI.DataField',
            Value : firstName
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : lastName
        }
    },

    SelectionFields : [
        firstName,
        lastName,
        email,
        originPlanet,
        stardustCollection,
        wormholeNavigationSkill,
        spacesuitColor,
        department_ID,
        position_ID
    ],

    PresentationVariant : {
        SortOrder : [
            {
                Property   : stardustCollection,
                Descending : true
            }
        ]
    },

    LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : 'First Name',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : 'Last Name',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : originPlanet,
            Label : 'Origin Planet',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : stardustCollection,
            Label : 'Stardust Collection',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : wormholeNavigationSkill,
            Label : 'Wormhole Navigation Skill',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : spacesuitColor,
            Label : 'Spacesuit Color',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : department_ID,
            Label : 'Department ID',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : position_ID,
            Label : 'Position ID',
            ![@UI.Importance] : #High
        }
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
            {
                $Type : 'UI.DataField',
                Value : firstName,
                Label : 'First Name'
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
                Label : 'Last Name'
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'Email'
            },
            {
                $Type : 'UI.DataField',
                Value : originPlanet,
                Label : 'Origin Planet'
            },
            {
                $Type : 'UI.DataField',
                Value : stardustCollection,
                Label : 'Stardust Collection'
            },
            {
                $Type : 'UI.DataField',
                Value : wormholeNavigationSkill,
                Label : 'Wormhole Navigation Skill'
            },
            {
                $Type : 'UI.DataField',
                Value : spacesuitColor,
                Label : 'Spacesuit Color'
            },
            {
                $Type : 'UI.DataField',
                Value : department_ID,
                Label : 'Department ID'
            },
            {
                $Type : 'UI.DataField',
                Value : position_ID,
                Label : 'Position ID'
            }
        ]
    }
});