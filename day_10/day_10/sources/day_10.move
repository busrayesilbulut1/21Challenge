module day_10::day_10 {

    public enum TaskStatus has copy, drop, store {
        Open,
        Done,
    }

    public struct Task has store, drop {
        id: u64,
        status: TaskStatus,
    }

    /// public constructor (API!)
    public fun new_task(id: u64): Task {
        Task {
            id,
            status: TaskStatus::Open,
        }
    }

    // private helper
    fun mark_done(task: &mut Task) {
        task.status = TaskStatus::Done;
    }

    // public API
    public fun complete_task(task: &mut Task) {
        mark_done(task);
    }

    // public read-only helper
    public fun is_done(task: &Task): bool {
        task.status == TaskStatus::Done
    }
}
