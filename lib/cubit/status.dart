abstract class BentoStates{}

class InitailState extends BentoStates{}
class ChangeNavBarState extends BentoStates{}
class ChangeItemInNavBarState extends BentoStates{}
class ChangeDrawerState extends BentoStates{}
class LoadingState extends BentoStates{}
class DataSuccessState extends BentoStates{}
class DataErrorStates extends BentoStates{
  DataErrorStates(String error);
}
class CreateDatabaseState extends BentoStates{}
class InsertDatabaseState extends BentoStates{}
class InsertDatabaseState2 extends BentoStates{}
class InsertDatabaseState3 extends BentoStates{}
class GetDatabaseState extends BentoStates{}
class GetDatabaseState2 extends BentoStates{}
class GetDatabaseState3 extends BentoStates{}
class UpdateDatabaseState extends BentoStates{}
class ReadmoreState extends BentoStates{}

