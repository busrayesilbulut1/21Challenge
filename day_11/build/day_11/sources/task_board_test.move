module 0x0::task_board_test {

    use 0x0::task_board;

    public fun test_board() {
        let owner = @0x1;
        let mut board = task_board::new_board(owner);

        let task1 = task_board::new_task(b"Buy milk");

        task_board::add_task(&mut board, task1);

        let task_count = task_board::task_count(&board);
        assert!(task_count == 1, 1);
    }
}
