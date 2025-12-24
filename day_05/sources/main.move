
   module 0x0::habit {

    use std::string::String;

    public struct Habit has store {
        name: String,
        completed: bool,
    }

    public struct HabitList has store {
        habits: vector<Habit>,
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty<Habit>(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }


public fun complete_habit(habits: &mut vector<Habit>, index: u64) {
    let len = vector::length(habits);

    if (index >= len) {
        return;
    };

    let habit = vector::borrow_mut(habits, index);
    habit.completed = true;
}
}

