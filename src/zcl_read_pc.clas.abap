CLASS zcl_read_pc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_pc IMPLEMENTATION.




  METHOD if_oo_adt_classrun~main.


*from value #( ( %key-TravelId = '00000012'
*                  %control = value #( AgencyId = if_abap_behv=>mk-on
*                                      CustomerId = if_abap_behv=>mk-on
*                                      BeginDate = if_abap_behv=>mk-on ) ) )

  Read Entity ZI_TRAVEL_cd
*  by \_Booking          " Incase i want to use join
ALL FIELDS
*  FIELDS ( AgencyId CustomerId BeginDate Description )
  with value #( ( %key-TravelId = '000000012' ) )

  RESULT data(lt_result_short)
  FAILED data(lt_failed_short).
if lt_failed_short is not initial.

out->write( 'Read Failed' ).
else.
 out->write( lt_result_short ).

endif.
  ENDMETHOD.
ENDCLASS.
