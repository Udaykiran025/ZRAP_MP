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



*Read entity ZI_TRAVEL_cd
*ALL FIELDS WITH
*VALUE #( ( TravelId = '00001510' ) )
*RESULT data(result_short)
*FAILED data(failed_short).
*if failed_short is not INITIAL.
*out->write( failed_short ).
*else.
*out->write( result_short ).
*endif.



Read ENTITIES OF ZI_TRAVEL_cd
ENTITY ZI_TRAVEL_cd ALL FIELDS WITH
VALUE #( ( TravelId = '00001510' ) )
RESULT data(it_result_travel)
ENTITY zi_booking_cd ALL FIELDS WITH
VALUE #( ( TravelId = '00001510'
           BookingId = '0001'  ) )
RESULT data(it_result_booking)
FAILED data(it_failed).
if it_failed is not INITIAL.
out->write( it_failed ).
else.
out->write( it_result_travel ).
out->write( it_result_booking ).
endif.




*
************************************
*data : it_optab type abp_behv_retrievals_tab,
*       it_travel type TABLE FOR READ IMPORT ZI_TRAVEL_cd,
*       it_travel_result TYPE TABLE FOR READ RESULT ZI_TRAVEL_cd,
*       it_booking type TABLE FOR READ IMPORT ZI_TRAVEL_cd\_Booking,
*       it_booking_result TYPE TABLE FOR READ RESULT ZI_TRAVEL_cd\_Booking.
*
*
*       it_travel = value #( ( %key-TravelId = '00000004'
*                              %control = value #( AgencyId = if_abap_behv=>mk-on
*                                                  CustomerId = if_abap_behv=>mk-on
*                                                  BeginDate = if_abap_behv=>mk-on ) ) ).
*
*              it_booking = value #( ( %key-TravelId = '00000004'
*                                      %control = value #( BookingId = if_abap_behv=>mk-on
*                                                  BookingDate = if_abap_behv=>mk-on
*                                                  BookingStatus = if_abap_behv=>mk-on ) ) ).
*       it_optab = value #( ( op = if_abap_behv=>op-r-read
*                             entity_name = 'ZI_TRAVEL_CD'
*                             instances = ref #( it_travel )
*                             results = ref #( it_travel_result ) )
*
*                             ( op = if_abap_behv=>op-r-read_ba
*                             entity_name = 'ZI_TRAVEL_CD'
*                             sub_name = '_BOOKING'
*                             instances = ref #( it_booking )
*                             results = ref #( it_booking_result )
*                             ) ).
*       READ Entities
*       OPERATIONS  it_optab
*       failed data(it_failed_dy).
*
*        if it_failed_dy is not INITIAL.
*         out->write( 'Result Failed' ).
*        else.
*        out->write( it_travel_result ).
*        out->write( it_booking_result ).
*        endif.


*DATA: it_result_travel  TYPE TABLE OF zi_travel_cd,  " Table to store travel records
*      it_result_booking TYPE TABLE OF zi_booking_cd, " Table to store booking records
*      it_failed         TYPE TABLE OF bapireturn1.   " Table for error messages
*
*" Perform the EML read operation to fetch all records (without any filter)
*READ ENTITIES OF zi_travel_cd
*    ENTITY zi_travel_cd
*    ALL FIELDS WITH
*    RESULT it_result_travel
*
*    ENTITY zi_booking_cd
*    ALL FIELDS
*    RESULT it_result_booking
*
*    FAILED it_failed.
*
*" Check for errors
*IF it_failed IS NOT INITIAL.
*    out->write( it_failed ).  " Output failed records if any
*ELSE.
*    out->write( it_result_travel ).  " Output all travel records
*    out->write( it_result_booking ). " Output all booking records
*ENDIF.
*************************************


**1. Read
*read ENTITIES OF ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*FROM value #( ( %key-TravelId =  '00001510'  )  )
*RESULT data(It_result1)
*Failed data(It_failed1).
*    out->write( It_result1 ).
*    out->write( It_failed1 ).

*%key-TravelId =  if_abap_behv=>mk-on


*
***2. Read with Fields
*read ENTITIES OF ZI_TRAVEL_cd ENTITY  ZI_TRAVEL_cd
*FIELDS ( AgencyId BeginDate CreatedBy )
*with value #( ( %key-TravelId =  if_abap_behv=>mk-on  )  )
*RESULT data(It_result2).
* out->write( It_result2 ).



**3. Read with All Fields
*read entities of ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*ALL FIELDS WITH VALUE #( ( TravelId = '00001510'  )  )
*RESULT data(It_result3)
*FAILED data(It_failed3).
* out->write( It_result3 ).
*out->write( It_failed3 ).



**4. Read  by Association
*read ENTITIES OF ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*by \_Booking
*ALL FIELDS WITH VALUE #( ( TravelId = '00001510' ) )
*RESULT data(It_result4).
*out->write( It_result4 ).




**Read entity
*READ ENTITY ZI_TRAVEL_cd
*ALL FIELDS WITH
*   VALUE #( ( TravelID = '00001510' ) )
*  RESULT DATA(ls_result).
*out->write( ls_result ).



**Read entity with multiple instances
*READ ENTITY ZI_TRAVEL_cd
*ALL FIELDS WITH
*   VALUE #( ( TravelID = '00001510' ) ( TravelID = '00000027' ) )
*  RESULT DATA(lt_result).
*out->write( lt_result ).



*5. Modify Update
*modify ENTITIES OF ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*Update SET FIELDS WITH value #( ( TravelId = '00000014'
*                                  Description = ' Vacation to Mumbai ') )
*                                  MAPPED data(it_mapped)
*                                  FAILED data(it_failed)
*                                  REPORTED data(it_reported).
*   out->write( 'Update Done' ).
*      out->write( it_failed ).
*
*
*COMMIT ENTITIES
*RESPONSE OF ZI_TRAVEL_cd
*FAILED data(It_failed_commit)
*REPORTED data(it_repoted_commit).


**6. Modify Create
*modify ENTITIES OF ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*Create SET FIELDS WITH value #( ( %cid = 'Content_Id1'
*                                  CustomerId = '2'
*                                  AgencyId = '70002'
*                                  BeginDate = cl_abap_context_info=>get_system_date(  )
*                                  EndDate = cl_abap_context_info=>get_system_date(  ) + 10
*                                  Description = ' Vacation to Delhi') )
*                                  MAPPED data(it_mapped)
*                                  FAILED data(it_failed)
*                                  REPORTED data(it_reported).
*   out->write( it_mapped-zi_travel_cd ).
*
*
*COMMIT ENTITIES
*RESPONSE OF ZI_TRAVEL_cd
*FAILED data(It_failed_commit)
*REPORTED data(it_repoted_commit).
*out->write( 'Create Done' ).


**7. Modify Delete
*modify ENTITIES OF ZI_TRAVEL_cd ENTITY ZI_TRAVEL_cd
*DELETE FROM value #( ( TravelId = '00004908' ) )
*                                  MAPPED data(it_mapped)
*                                  FAILED data(it_failed)
*                                  REPORTED data(it_reported).
*   out->write( 'Delete Done' ).
*
*
*COMMIT ENTITIES
*RESPONSE OF ZI_TRAVEL_cd
*FAILED data(It_failed_commit)
*REPORTED data(it_repoted_commit).


  ENDMETHOD.
ENDCLASS.
