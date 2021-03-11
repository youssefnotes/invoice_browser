using {
  Currency,
  cuid,
  managed,
  sap
} from '@sap/cds/common';

namespace com.cap.accountingDoc;

entity AccountingDocumentHeader : cuid, managed {
  companyCode     : String(4);
  accDocNo        : Integer;
  year            : Date;
  docType         : DocType;
  bp              : String(50);
  docHeaderText   : String;
  plant           : String;
  sensitivity     : Integer;
  criticality     : Integer;
  documentDetails : Composition of many AccountingDocumentDetails
                      on documentDetails.up_ = $self;
}

entity AccountingDocumentDetails : cuid, managed {
  itemNo          : Integer;
  itemDescription : String;
  qty             : Decimal;
  unit            : String;
  price           : Decimal;
  currency        : Currency;
  up_             : Association to AccountingDocumentHeader;
}


type DocType : String enum {
  GL;
  AP;
  AR;
}
