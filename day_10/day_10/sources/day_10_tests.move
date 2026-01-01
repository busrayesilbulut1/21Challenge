module day_10::day_10_tests {
    use day_10::day_10::{new_task, complete_task, is_done};

    #[test]
    fun test_complete_task() {
        let mut task = new_task(1);

        complete_task(&mut task);

        assert!(is_done(&task), 0);
    }
}
