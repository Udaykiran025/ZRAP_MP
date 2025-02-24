CLASS zup_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUP_TRAVEL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  Delete from ztravel_tb.
  Delete from Zbooking_tb.
  Delete from Zbooksuppl_tb.
  commit WORK.

  Insert Ztravel_tb from  (
  Select * from /dmo/travel_m ).
  commit  WORK.

  Insert Zbooking_tb from (
  Select * from /dmo/booking_m ).
  commit work.

  Insert zbooksuppl_tb from (
  Select * from /dmo/booksuppl_m ).
  Commit work.

  ENDMETHOD.
ENDCLASS.
