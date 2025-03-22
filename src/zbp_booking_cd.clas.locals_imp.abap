CLASS lhc_zi_booking_cd DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Bookingsupp FOR NUMBERING
      IMPORTING entities FOR CREATE ZI_BOOKING_CD\_Bookingsuppl.

ENDCLASS.

CLASS lhc_zi_booking_cd IMPLEMENTATION.

  METHOD earlynumbering_cba_Bookingsupp.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
