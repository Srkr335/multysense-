<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\TaskUser;
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
}
