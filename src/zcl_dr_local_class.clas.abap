CLASS zcl_dr_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DR_LOCAL_CLASS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lo_connection TYPE REF TO lcl_connection.
    DATA: lo_connection1 TYPE REF TO lcl_connection.
    DATA: lo_connection2 TYPE REF TO lcl_connection.

    CREATE OBJECT lo_connection.
    lo_connection->carrier_id = 'LH'.
    lo_connection->connection_id = '0400'.

    CREATE OBJECT lo_connection.
    lo_connection->carrier_id = 'AH'.
    lo_connection->connection_id = '0500'.

    CREATE OBJECT lo_connection.
    lo_connection->carrier_id = 'BH'.
    lo_connection->connection_id = '0600'.


  ENDMETHOD.
ENDCLASS.
