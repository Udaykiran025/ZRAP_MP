@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for travel entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_P
  provider contract transactional_query
  as projection on ZI_TRAVEL_cd
{


  key TravelId,

      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _Status._Text.Text as OverallStatusText : localized,
      // CreatedBy,
      //CreatedAt,
      //LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BOOKING_P,
      _currency,
      _Customer,
      _Status
}
