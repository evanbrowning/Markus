function toggle_persist_groups(persist_groups) {
  if(persist_groups) {
    $('persist_groups_assignment').enable();
    $('persist_groups_assignment_style').removeClassName('disable');
    $('persist_groups_assignment').onchange();
    $('is_group_assignment').disable();
    $('is_group_assignment').addClassName('disable');
    $('student_form_groups').disable();
    $('student_form_groups_style').addClassName('disable');
    $('assignment_group_min').disable();
    $('assignment_group_max').disable();
    $('group_limit_style').addClassName('disable')
    $('assignment_group_name_autogenerated').disable();    
    $('is_group_assignment_style').addClassName('disable');
  } else {
    $('persist_groups_assignment').disable();
    $('persist_groups_assignment_style').addClassName('disable');
    $('is_group_assignment').enable();
    $('is_group_assignment').removeClassName('disable');
    $('is_group_assignment_style').removeClassName('disable');
    toggle_group_assignment($F('is_group_assignment'));
  }
}

function toggle_group_assignment(is_group_assignment) {
  $('is_group_assignment').setValue(is_group_assignment);
  if(is_group_assignment) {
    $('student_form_groups').enable();
    $('student_form_groups_style').removeClassName('disable');
    $('persist_groups').disable();
    $('persist_groups_assignment_style').addClassName('disable');
    $('group_properties').removeClassName('disable');
    toggle_student_form_groups($F('student_form_groups'));
  } else {
    $('group_properties').addClassName('disable');
    $('assignment_group_min').disable();
    $('assignment_group_max').disable();
    $('group_limit_style').addClassName('disable');
    $('student_form_groups').disable();
    $('student_form_groups_style').addClassName('disable');
    $('assignment_group_name_autogenerated').disable();
    $('group_name_autogenerated_style').addClassName('disable');
    $('persist_groups').enable();
    $('persist_groups_assignment_style').removeClassName('disable');
  }
}

function toggle_student_form_groups(student_form_groups) {
  if(student_form_groups) {
    $('assignment_group_min').enable();
    $('assignment_group_max').enable();
    $('group_limit_style').removeClassName('disable');
    $('assignment_group_name_autogenerated').setValue(true);
    $('assignment_group_name_autogenerated').disable();
    $('group_name_autogenerated_style').addClassName('disable');
  } else {
    $('assignment_group_min').disable();
    $('assignment_group_max').disable();
    $('group_limit_style').addClassName('disable');
    $('assignment_group_name_autogenerated').enable();  
    $('group_name_autogenerated_style').removeClassName('disable');
  }
}

function toggle_remark_requests(allow_remark_requests) {
  $('allow_remarks').setValue(allow_remark_requests);
  if (allow_remark_requests) {
    $('remark_due_date').enable();
    $('assignment_remark_message').enable();
    $('remark_properties').removeClassName('disable');
  } else {
    $('remark_due_date').disable();
    $('assignment_remark_message').disable();
    $('remark_properties').addClassName('disable');
  }
}

function toggle_test_framework(is_testing_framework_enabled) {

  $('is_testing_framework_enabled').setValue(is_testing_framework_enabled);

  if(is_testing_framework_enabled) {
    $('tokens').removeClassName('disable');
    $('tokens_per_day').enable();
    $('assignment_token_refresh_period_daily').enable();
    $('assignment_token_refresh_period_hourly').enable();
    $('assignment_token_refresh_period_none').enable();
    $('token_refresh_label_none').removeClassName('disable');
    $('token_refresh_label_daily').removeClassName('disable');
    $('token_refresh_label_hourly').removeClassName('disable');

    $$('#antbuildfile_style').each(function(node) { node.removeClassName('disable'); });
    $$('#antbuildfile_style input').each(function(node) {
      $(node).enable();
    });
    $$('#antbuildprop_style').each(function(node) { node.removeClassName('disable'); });
    $$('#antbuildprop_style input').each(function(node) {
      $(node).enable();
	});
    $$('#test_files .test_file').each(function(node) { node.removeClassName('disabled'); });
    $$('#test_files .test_file input').each(function(node) {
      $(node).enable();
    });
    $$('#lib_files .test_file').each(function(node) { node.removeClassName('disabled'); });
    $$('#lib_files .test_file input').each(function(node) {
      $(node).enable();
    });
    $$('#parser_files .test_file').each(function(node) { node.removeClassName('disabled'); });
    $$('#parser_files .test_file input').each(function(node) {
      $(node).enable();
    });
  } else {
    $('tokens').addClassName('disable');
    $('tokens_per_day').disable();
    $('assignment_token_refresh_period_daily').disable();
    $('assignment_token_refresh_period_hourly').disable();
    $('assignment_token_refresh_period_none').disable();
    $('token_refresh_label_none').addClassName('disable');
    $('token_refresh_label_daily').addClassName('disable');
    $('token_refresh_label_hourly').addClassName('disable');

    $$('#antbuildfile_style').each(function(node) { node.addClassName('disable'); });
    $$('#antbuildfile_style input').each(function(node) {
      $(node).disable();
    });
    $$('#antbuildprop_style').each(function(node) { node.addClassName('disable'); });
    $$('#antbuildprop_style input').each(function(node) {
      $(node).disable();
    });
    $$('#test_files .test_file').each(function(node) { node.addClassName('disabled'); });
    $$('#test_files .test_file input').each(function(node) {
      $(node).disable();
    });
    $$('#lib_files .test_file').each(function(node) { node.addClassName('disabled'); });
    $$('#lib_files .test_file input').each(function(node) {
      $(node).disable();
    });
    $$('#parser_files .test_file').each(function(node) { node.addClassName('disabled'); });
    $$('#parser_files .test_file input').each(function(node) {
      $(node).disable();
    });
  }
}

function request_group_properties(assignment_id) {
/*  new Ajax.Request('update_group_properties_on_dependency', {asynchronous:true, evalScripts:true, parameters:'assignment_id=' + $F('assignment_dependency_list')}*/
}

function update_group_properties(is_group_assignment, student_form_groups, group_min, group_max, group_name_autogenerated) {
 $('is_group_assignment').setValue(is_group_assignment);
 $('student_form_groups').setValue(student_form_groups);
 $('assignment_group_min').setValue(group_min);
 $('assignment_group_max').setValue(group_max);
 $('assignment_group_name_autogenerated').setValue(group_name_autogenerated);
 
 $('is_group_assignment').disable();
 $('is_group_assignment').addClassName('disable');
 $('student_form_groups').disable();
 $('student_form_groups_style').addClassName('disable');
 $('assignment_group_min').disable();
 $('assignment_group_max').disable();
 $('group_limit_style').addClassName('disable');
 $('assignment_group_name_autogenerated').disable();
 $('group_name_autogenerated_style').addClassName('disable');

}

function add_assignment_file() {
  var new_assignment_file_div = new Element('div', {'class': 'assignment_file'})
  var new_assignment_file = new Element('input', {'type': 'text', 'name': 'assignment_files[]'})
  new_assignment_file.observe('keydown', function(e) {
    if(e.keyCode == Event.KEY_RETURN) {
      e.stop();
    }
  });
  var remove_link = new Element('a', {'href': 'javascript:void(0);'})
  remove_link.update('x')
  remove_link.observe('click', function(e) {
    $(new_assignment_file_div).remove();
  });
  new_assignment_file_div.insert(new_assignment_file);
  new_assignment_file.insert({'after': remove_link});
  $('assignment_files').insert(new_assignment_file_div);
  $(new_assignment_file).activate();
}

function default_group_fields() {
  toggle_persist_groups(false);
  toggle_group_assignment(false);
  toggle_remark_requests(true);
}

function update_due_date(new_due_date) {
  check_due_date(new_due_date);
  grace_periods.set_due_date(new_due_date);
  penalty_periods.set_due_date(new_due_date);
  grace_periods.refresh();
  penalty_periods.refresh();
}

function refresh_due_date() {
  update_due_date($F('assignment_due_date'));
}

function check_due_date(new_due_date) {
  var now = new Date();
  if(Date.parseFormattedString(new_due_date) < now) {
    alert(past_due_date_edit_warning);
  }
}

function change_submission_rule() {
  $$('.period').each(function(node) { node.removeClassName('disabled'); });
  $$('.period input').each(function(node) {
    $(node).enable();
  });
  
  if($('grace_period_submission_rule').getValue() == null) {
     // Disable any grace_period_submission_rule periods
    $$('#grace_periods .period').each(function(node) { node.addClassName('disabled'); });
    $$('#grace_periods .period input').each(function(node){node.disable();});
  }
  else {
    if ($$('#grace_periods .period').length == 0) {
        // Auto expand add a grace period if needed
        $("grace_period_link").onclick();
    }
  }
  if($('penalty_period_submission_rule').getValue() == null) {
     // Disable any penalty_period_submission_rule periods
    $$('#penalty_periods .period').each(function(node) { node.addClassName('disabled'); });
    $$('#penalty_periods .period input').each(function(node){node.disable();});
  }
  else {
    if ($$('#penalty_periods .period').length == 0) {
         // Auto expand add a penalty period if needed
        $("penalty_period_link").onclick();
    }
  }
}

function notice_marking_scheme_changed(is_assignment_new, clicked_marking_scheme_type, marking_scheme_type) {
  if(is_assignment_new != true && clicked_marking_scheme_type != marking_scheme_type) {
	if ($('marking_scheme_notice').hasClassName('hidden')) {
	    $('marking_scheme_notice').removeClassName('hidden');
	}
	$('marking_scheme_notice').show();
  } else {
	$('marking_scheme_notice').hide();
  }
}


