<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\TaskUser;
use App\Task;
use App\ProjectTimeLog;
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
            'message' => 'Task updated successfully!.',
            'data' => $updateTask,
        ],200);
    }
    public function start_timer(Request $request)
    {
        $startTimer = new ProjectTimeLog();
        $startTimer->company_id = $request->company_id;
        $startTimer->project_id  = $request->project_id;
        $startTimer->task_id  = $request->task_id;
        $startTimer->user_id  = $request->user_id;
        $startTimer->start_time = date('Y-m-d H:i:s', strtotime($request->start_time));
        $startTimer->memo = $request->memo;
        $startTimer->hourly_rate = 0;
        $startTimer->earnings = 0;
        $startTimer->is_started = 1;
        $startTimer->save();
        return response()->json([
            'message' => 'Task started successfully!.',
            'data' => $startTimer,
        ],200);

    }
    public function stop_timer(Request $request,$id,$taskId)
    {
        $stopTimer = ProjectTimeLog::where('id',$id)->where('task_id',$taskId)->update([
            'end_time' =>  date('Y-m-d H:i:s', strtotime($request->stop_time)),
        ]);
        return $this->sendResponse([
            'data' => $stopTimer,
        ], 'Task stopped sucessfully!');

    }
    public function task_timer_details($id)
    {
        $timerDetail = ProjectTimeLog::where('task_id',$id)->first();
        return $this->sendResponse([
            'data' => $timerDetail,
        ], 'Task timer Detail fetched sucessfully!');
    }
}
