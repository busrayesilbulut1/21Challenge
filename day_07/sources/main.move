module 0x0::habit {

    use std::string;
    use std::string::String;

    public struct Habit has store, drop {
        name: String,
        completed: bool,
    }

    public struct HabitList has store, drop {
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

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let habit = vector::borrow_mut(&mut list.habits, index);
        habit.completed = true;
    }

    #[test]
    fun test_add_habit() {
        let mut list = empty_list();

        let habit = Habit {
            name: string::utf8(b"Read book"),
            completed: false,
        };

        add_habit(&mut list, habit);

        assert!(vector::length(&list.habits) == 1);
    }

    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();

        let habit = Habit {
            name: string::utf8(b"Exercise"),
            completed: false,
        };

        add_habit(&mut list, habit);
        complete_habit(&mut list, 0);

        let h = vector::borrow(&list.habits, 0);
        assert!(h.completed);
    }
}
