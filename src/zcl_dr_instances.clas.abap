CLASS zcl_dr_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DR_INSTANCES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lo_connection TYPE REF TO lcl_connection.
    DATA: lo_connection1 TYPE REF TO lcl_connection.
    DATA: lo_connection2 TYPE REF TO lcl_connection.

** Declare internal table of class ref type

    DATA: lt_connection TYPE TABLE OF REF TO lcl_connection.

    lo_connection = NEW #( ).
    lo_connection->carrier_id = 'LH'.
    lo_connection->connection_id = '0400'.

    APPEND lo_connection  TO lt_connection.

    lo_connection1 = NEW #( ).
    lo_connection->carrier_id = 'AH'.
    lo_connection->connection_id = '0500'.

    APPEND lo_connection  TO lt_connection.

    lo_connection2 = NEW #( ).
    lo_connection->carrier_id = 'BH'.
    lo_connection->connection_id = '0600'.

    APPEND lo_connection  TO lt_connection.

  ENDMETHOD.
ENDCLASS.
