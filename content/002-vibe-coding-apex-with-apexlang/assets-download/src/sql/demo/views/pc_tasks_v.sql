CREATE OR REPLACE VIEW pc_tasks_v AS
SELECT t.pc_task_id,
       t.pc_project_id,
       p.project_name,
       t.task_name,
       t.priority,
       t.pc_owner_id,
       o.owner_name,
       t.status,
       t.start_date,
       t.end_date,
       t.pc_milestone_id,
       m.milestone_name,
       t.pc_deliverable_id,
       d.deliverable_name,
       t.notes,
       t.created,
       t.created_by,
       t.updated,
       t.updated_by
  FROM pc_tasks        t
  JOIN pc_projects     p ON p.pc_project_id      = t.pc_project_id
  LEFT JOIN pc_owners  o ON o.pc_owner_id         = t.pc_owner_id
  LEFT JOIN pc_milestones  m ON m.pc_milestone_id = t.pc_milestone_id
  LEFT JOIN pc_deliverables d ON d.pc_deliverable_id = t.pc_deliverable_id;
