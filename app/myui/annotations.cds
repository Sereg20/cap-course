using Myservice as service from '../../srv/Service';

annotate service.Items with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
    ]
);
annotate service.Items with @(
    UI.SelectionFields : [
        quantity,
    ]
);
annotate service.Items with {
    quantity @Common.Label : 'quantity'
};

annotate service.Items with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : quantity,
        },
    }
);
annotate service.Items with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Info',
            ID : 'Info',
            Target : '@UI.FieldGroup#Info',
        },
    ],
    UI.FieldGroup #Info : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },{
                $Type : 'UI.DataField',
                Value : quantity,
            },{
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            }],
    }
);
