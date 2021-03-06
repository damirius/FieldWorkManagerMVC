<?php if (!defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed'); ?>
<?php
$task_deadline = $current_task->task_deadline();
$deadline_ts = strtotime(str_replace('-', '/', $task_deadline)) - time();
$day_in_seconds = 86400;
$days = ($deadline_ts - ($deadline_ts % $day_in_seconds)) / $day_in_seconds;
?>
<span class="h4"><?php echo $resx['h4_taskstatus_leftcol'] ?></span>
<span id="h4-taskstatus-leftcol-gi" class="glyphicon glyphicon-info-sign"></span>
<div class="p-desc">
	<div><?php echo $resx['taskstatus_deadline_label'] ?>: <?php echo $task_deadline; ?></div>
    <div><?php echo $resx['taskstatus_daysremaining_label'] ?>: <?php echo $days; ?></div>
    <div><?php echo $resx['taskstatus_percentcomplete_label'] ?>: 0%</div>
</div>
<div class="p-desc">
	<?php
	if($current_task->task_trigger_cal_value() !== '') {
		?>
        <div><?php echo $resx['taskstatus_recurrence_label'] ?>: <?php echo $current_task->task_trigger_cal_value(); ?></div>
        <?php
	}
	if($current_task->task_trigger_pm() == 1) {	
		?>
        <div><?php echo $resx['taskstatus_manualtrigger_label'] ?>: Yes</div>
        <?php
	}
	if($current_task->task_trigger_ext() != 0) {
		?>
        <div><?php echo $resx['taskstatus_externaltrigger_label'] ?>: <?php echo $current_task->task_trigger_ext(); ?></div>
        <?php
	}
	?>
    
</div>