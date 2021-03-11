using {com.cap.accountingDoc as accountingDoc} from '../db/schema';

service AccountingDocumentService @(path : '/api') {
    entity DocumentHeaderService  as projection on accountingDoc.AccountingDocumentHeader;
    // annotate com.cap.accountingDoc.AccountingDocumentHeader with @fiori.draft.enabled;
    annotate AccountingDocumentService.DocumentHeaderService with @odata.draft.enabled;
    entity DocumentDetailsService as projection on accountingDoc.AccountingDocumentDetails;
}

annotate AccountingDocumentService.DocumentHeaderService with {
    companyCode   @title : 'Company Code';
    accDocNo      @title : 'Accounting Document No';
    year          @title : 'Year';
    docType       @title : 'Document Type';
    bp            @title : 'Business Partner';
    docHeaderText @title : 'Header Text';
    plant         @title : 'Plant';
    sensitivity   @title : 'Sensitivity';
    criticality   @title : 'Criticality';
};

annotate AccountingDocumentService.DocumentHeaderService with @(
    UI.HeaderInfo                 : {
        TypeName       : 'Accounting Documente',
        TypeNamePlural : 'Accounting Documents',
    },
    UI.LineItem                   : [
        {
            $Type : 'UI.DataField',
            Value : companyCode
        },
        {
            $Type : 'UI.DataField',
            Value : accDocNo
        },
        {
            $Type : 'UI.DataField',
            Value : year
        },
        {
            $Type : 'UI.DataField',
            Value : docHeaderText
        },
        {
            $Type : 'UI.DataField',
            Value : plant
        },
        {
            Value       : sensitivity,
            Criticality : criticality
        }
    ],
    UI.SelectionFields            : [
        companyCode,
        accDocNo,
        year,
        plant,
        sensitivity
    ],

    UI.HeaderFacets               : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#IndustryDetail',
        Label  : '{i18n>Ind.HeaderFacetIndDetails}'
    }],
    UI.Facets                     : [{
        $Type  : 'UI.CollectionFacet',
        Label  : '{i18n>Ind.FacetIndustryInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#IndustryInfo',
            Label  : '{i18n>Ind.FacetRegionDescription}'
        }, ]
    }],
    UI.FieldGroup #IndustryDetail : {Data : [
        {
            $Type : 'UI.DataField',
            Value : companyCode
        },
        {
            $Type : 'UI.DataField',
            Value : accDocNo
        },
        {
            $Type : 'UI.DataField',
            Value : year
        }
    ]},
    UI.FieldGroup #IndustryInfo   : {Data : [
        {
            $Type : 'UI.DataField',
            Value : bp
        },
        {
            $Type : 'UI.DataField',
            Value : docHeaderText
        },
        {
            $Type : 'UI.DataField',
            Value : plant
        },
        {
            Value       : sensitivity,
            Criticality : criticality
        }
    ]}
);
