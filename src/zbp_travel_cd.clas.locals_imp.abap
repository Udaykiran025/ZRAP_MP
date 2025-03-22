CLASS lhc_ZI_TRAVEL_cd DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_TRAVEL_cd RESULT result.

    METHODS earlynumbering_cba_booking FOR NUMBERING
      IMPORTING entities FOR CREATE zi_travel_cd\_booking.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities
                  FOR CREATE zi_travel_cd.

ENDCLASS.

CLASS lhc_ZI_TRAVEL_cd IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA(lt_entities) = entities.
    DELETE lt_entities WHERE TravelId IS NOT INITIAL.


    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
*      ignore_buffer     =
            nr_range_nr       = '01'
            object            = '/DMO/TRV_M'
            quantity          =  CONV #( lines( lt_entities ) )
*      subobject         =
*      toyear            =
          IMPORTING
            number            = DATA(lv_latest_num)
            returncode        = DATA(lv_code)
            returned_quantity = DATA(lv_qty)
        ).
      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges INTO data(lo_error).
      LOOP AT lt_entities INTO DATA(ls_entites).
        APPEND VALUE #( %cid = ls_entites-%cid
                   %Key = ls_entites-%key )
                   to failed-zi_travel_cd.
                     APPEND VALUE #( %cid = ls_entites-%cid
                   %Key = ls_entites-%key
                    %msg = lo_error )
                   to reported-zi_travel_cd.
      ENDLOOP.
      EXIT.
    ENDTRY.
  ASSERT lv_qty = lines( lt_entities ).


  "data(lv_curr_num) = lv_latest_num - lv_qty.

  LOOP AT lt_entities INTO ls_entites.
  lv_latest_num = lv_latest_num + 1.

  APPEND VALUE #( %cid = ls_entites-%cid
                   TravelId = lv_latest_num )
                   to mapped-zi_travel_cd.

  endloop.
  ENDMETHOD.

  METHOD earlynumbering_cba_Booking.
  ENDMETHOD.

ENDCLASS.
