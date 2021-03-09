using {com.cap.accountingDoc as accountingDoc} from '../db/schema';

service AccountingDocumentService @(path : '/api') {
    entity DocumentHeaderService as projection on accountingDoc.AccountingDocumentHeader;
     entity DocumentDetailsService as projection on accountingDoc.AccountingDocumentDetails;
}


annotate com.cap.accountingDoc.AccountingDocumentHeader with @fiori.draft.enabled;
annotate AccountingDocumentService.DocumentHeaderService with @odata.draft.enabled;
