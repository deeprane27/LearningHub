@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity view for student'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_student_DET
  as select from zrd_student_det
{
  key id              as Id,
      firstname       as Firstname,
      lastname        as Lastname,
      age             as Age,
      course          as Course,
      courseduratuion as Courseduratuion,
      status          as Status,
      gender          as Gender,
      dob             as Dob
}
