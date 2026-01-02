module 0x0::task_board {

    use std::vector;

    // Task struct
    public struct Task has store, drop, copy {
        title: vector<u8>,
        done: bool,
    }

    // TaskBoard struct
    public struct TaskBoard has store, drop, copy {
        owner: address,
        tasks: vector<Task>,
    }

    // Yeni TaskBoard oluşturma fonksiyonu
    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty<Task>(),
        }
    }

    // Task ekleme fonksiyonu
    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    // Board’daki task sayısını döndür
    public fun task_count(board: &TaskBoard): u64 {
        vector::length(&board.tasks)
    }

    // Yeni Task oluşturma fonksiyonu
    public fun new_task(title: vector<u8>): Task {
        Task {
            title,
            done: false,
        }
    }
}
