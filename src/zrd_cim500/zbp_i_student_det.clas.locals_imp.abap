CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Student RESULT result.
    METHODS SetAdmitted FOR MODIFY
      IMPORTING keys FOR ACTION Student~SetAdmitted RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Student RESULT result.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.


  ENDMETHOD.

  METHOD SetAdmitted.

    MODIFY ENTITIES OF ZI_student_DET IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )
    FAILED failed
    REPORTED reported.

*   Get the response updated data
    READ ENTITIES OF ZI_student_DET IN LOCAL MODE
    ENTITY student
    ALL FIELDS WITH CORRESPONDING #( Keys )
    RESULT DATA(studentdata).
    result = VALUE #( FOR studentda IN studentdata ( %tky = studentda-%tky %param = studentda ) ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ZI_student_DET IN LOCAL MODE
    ENTITY student
    FIELDS ( status ) WITH CORRESPONDING #( keys )
    RESULT DATA(studadmitted)
    FAILED failed.

    result = VALUE #( FOR studadmit IN studadmitted LET admittstat = COND #( WHEN studadmit-Status EQ abap_true
                                                                             THEN if_abap_behv=>fc-o-disabled
                                                                             ELSE if_abap_behv=>fc-o-enabled )
                                                                       IN ( %tky = studadmit-%tky %action-SetAdmitted = admittstat )  ).
  ENDMETHOD.

ENDCLASS.
