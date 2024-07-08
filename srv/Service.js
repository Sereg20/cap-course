
const cds = require('@sap/cds')

module.exports = cds.service.impl(async function() {

    const { BusinessPartners, Items } = this.entities;
    const BPsrv = await cds.connect.to("API_BUSINESS_PARTNER");
    const Northwind = await cds.connect.to("Northwind");
    const myonprem = await cds.connect.to("myonprem");
    const db = await cds.connect.to('db');
    const srv = this;


    this.on("READ", BusinessPartners, async (req) => {

        req.query.where("LastName <> '' and FirstName <> '' ");

        return await BPsrv.transaction(req).send({
            query: req.query
        });
    });

    this.on("READ", Items, (req, next) => {
        console.log(req.user)
        return next()
    });

    this.on("fi", async () => {
        const result = await myonprem.get('/teachers')
        return result;
    });

    this.on("getNorthwind", async () => {
        const result = await Northwind.get('/Products')
        return result;
    });

});