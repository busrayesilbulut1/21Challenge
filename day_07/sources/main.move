module 0x0::habit {

    use std::string;
    use std::string::String;
    use std::vector;

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
        let h = vector::borrow_mut(&mut list.habits, index);
        h.completed = true;
    }

    #[test]
    fun test_add_habit() {
        let mut list = empty_list();

        add_habit(
            &mut list,
            Habit {
                name: string::utf8(b"Read"),
                completed: false,
            }
        );

        assert!(vector::length(&list.habits) == 1);
    }

    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();

        add_habit(
            &mut list,
            Habit {
                name: string::utf8(b"Run"),
                completed: false,
            }
        );

        complete_habit(&mut list, 0);

        let h = vector::borrow(&list.habits, 0);
        assert!(h.completed);
    }
}
