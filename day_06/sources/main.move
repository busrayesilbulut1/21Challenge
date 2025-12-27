/// DAY 6: String Type for Habit Names
///
/// Today you will:
/// 1. Learn about the String type
/// 2. Convert vector<u8> to String
/// 3. Update Habit to use String instead of vector<u8>

module challenge::day_06 {
    use std::vector;
    use std::string::{Self, String};

    // Habit now uses String for name
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    // Create a new habit using String
    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Helper: convert bytes to String and create Habit
    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        Habit {
            name,
            completed: false,
        }
    }

    // Habit list
    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }
}
