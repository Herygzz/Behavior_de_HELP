@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZRAP_ATRAV001'
define root view entity ZR_RAP_ATRAV001
  as select from zrap_atrav001
  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency

{
  key travel_id             as TravelId,
      agency_id             as AgencyId,
      customer_id           as CustomerId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.largeObject: { mimeType: 'MimeType',//indicates the name of the field containing the type of a MIME object
                             fileName: 'FileName',   //indicates the name of the field containing the file name of a MIME object
                             acceptableMimeTypes: ['image/png', 'image/jpeg'],
                             contentDispositionPreference: #ATTACHMENT }

      attachment            as Attachment,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      file_name             as FileName,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

  ,
      //public associations
      _Customer,
      _Agency,
      _OverallStatus,
      _Currency

}
