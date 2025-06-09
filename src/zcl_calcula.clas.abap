CLASS zcl_calcula DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calcula IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.


*  @parameter it_original_data | Table of original data, at least filled for requested original elements
*  @parameter it_requested_calc_elements | Requested calculation elements (transient)
*  @parameter ct_calculated_data | Table of calculated fields with 1:1 correspondence to original data by index
*  @raising cx_sadl_exit | Sub-exceptions can be raised for general errors - aborts processing
    DATA: lt_orig_data TYPE STANDARD TABLE OF zc_rap_atrav001 WITH DEFAULT KEY.

    lt_orig_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_orig_data ASSIGNING FIELD-SYMBOL(<fs_orig_data>).
      <fs_orig_data>-TotalTax = <fs_orig_data>-TotalPrice * ( 1 + 8 / 100 ).
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_orig_data ).

*    LOOP AT it_requested_calc_elements INTO DATA(lv_element).
*
*      LOOP AT ct_calculated_data ASSIGNING FIELD-SYMBOL(<fs_calc_data>).
*        ASSIGN COMPONENT lv_element OF STRUCTURE <fs_calc_data> TO FIELD-SYMBOL(<lv_element_value>).
*        CASE lv_element.
*          WHEN 'TOTALTAX'.
*          WHEN OTHERS.
*        ENDCASE.
*
*      ENDLOOP.
*    ENDLOOP.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.

ENDCLASS.
