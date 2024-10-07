<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\TaskUser;
use App\Task;
use App\Http\Controllers\API\BaseController as BaseController;


class TaskApiController extends BaseController
{
    public function get_tasks($id)
    {
        $task = TaskUser::with('task')
        ->join('tasks', 'task_users.task_id', '=', 'tasks.id') 
        ->where('task_users.user_id', $id) 
        ->select('task_users.*', 'tasks.*', 'tasks.created_at as tasks_created_at') 
        ->get();
        return response()->json([
            'message' => 'Task details fetched successfully!.',
            'task' => $task,
        ],200);
    }
    public function update_task_status(Request $request,$id)
    {
        $updateTask = Task::where('id',$id)->update([
            'board_column_id' => $request->status,
            'completed_on' => date('Y-m-d H:i:s', strtotime($request->completed_on)),
        ]);

        return response()->json([
            'message' => 'Task details fetched successfully!.',
            'data' => $updateTask,
        ],200);
    }
}
