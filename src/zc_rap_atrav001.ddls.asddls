@Metadata.allowExtensions: true
//@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZRAP_ATRAV001'

@EndUserText.label: '##GENERATED Travel App (001)'
@Search.searchable: true

define root view entity ZC_RAP_ATRAV001
  provider contract transactional_query
  as projection on ZR_RAP_ATRAV001
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelId,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' }, useForValidation: true }]
      AgencyId,
      _Agency.Name              as AgencyName,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  }, useForValidation: true }]
      CustomerId,
      _Customer.LastName        as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }, useForValidation: true } ]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      Attachment,
      MimeType,
      FileName,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
