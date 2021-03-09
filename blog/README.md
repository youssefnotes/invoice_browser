# Notes on using CAP
## Housekeeping

Setting up our development workspace, thanks to my colleague @Gunter he pointed me to use VSCode.

the following packages are required for CAP development.
- Install nodejs, I use NVM `https://github.com/nvm-sh/nvm` allows switching between multiple node versions
- Install SQLite
- The command line client and development toolkit for the SAP Cloud Application Programming Model (CAP) `npm i -g @sap/cds-dk`
- on VSCode extensions, search for `SAP`,install the following extensions

![Selected Extensions](extensions.png)

- SAP HANA Developer Command Line Interface `npm i -g  hana-cli`
- The Cloud MTA Build Tool `npm install -g mbt`
- For windows user you need to have make installed, follow the steps here
[https://sap.github.io/cloud-mta-build-tool/makefile/](https://sap.github.io/cloud-mta-build-tool/makefile/)

- Add HANA to your project `cds add hana`
cf undeploy <mta-id> deletes an MTA (use cf mtas to find the MTA ID).

Use the optional --delete-services parameter to also wipe service instances.
Caution: This deletes the HDI containers with the application data.



Add the following in the package.json file in the root folder of your project:

```
{
  "cds": {
    "hana" : { "deploy-format": "hdbtable" }
  }
}
```

`cds build`
`cds build --production`

`cf create-service  hana  hdi-shared  ia-db`
`cf create-service-key ia-db default`
`hana-cli serviceKey ia-db default-ia`



`cf push -f gen/db`
`cf push -f gen/srv --random-route`
## The model
A master detail application is a foundation for most business application. Our model will start with an invoice header and line items entities


