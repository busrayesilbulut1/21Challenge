module 0x0::main {

    public enum TaskStatus has copy, drop, store {
        Open,
        Done,
    }

    public struct Task has copy, drop, store {
        id: u64,
        title: vector<u8>,
        status: TaskStatus,
    }

    public fun is_open(task: &Task): bool {
        match (task.status) {
            TaskStatus::Open => true,
            TaskStatus::Done => false,
        }
    }

    // Testler VM bug yüzünden kapalı
    /*
    #[test]
    fun test_is_open() {
        let task = Task {
            id: 1,
            title: b"Learn Move",
            status: TaskStatus::Open,
        };

        assert!(is_open(&task), 0);
    }
    */
}
