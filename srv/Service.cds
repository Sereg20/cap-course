using {foo} from '../db/schema';

@path: 'service/item'
service Myservice {
    entity Items @(restrict: [
        {
            grant: 'READ',
            to   : 'ItemViewer'
        },
    ]) as projection on foo.Items;
    annotate Items with @odata.draft.enabled;

    // BusinessPartner
    @readonly
    entity BusinessPartners as projection on foo.BusinessPartners;

    function fi() returns array of String;
    function getNorthwind() returns array of String;
}