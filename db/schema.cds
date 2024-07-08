namespace foo;

using {managed, cuid} from '@sap/cds/common';
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.cds';

entity Items : cuid, managed {
    title: String(100);
    quantity: Int16;
    // bp: Association to BusinessPartners;
    virtual criticality: Integer;
};

entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner,
    BusinessPartnerFullName as FullName,
};