CREATE TABLE pc_tasks (
    pc_task_id         NUMBER        CONSTRAINT pc_tasks_pk PRIMARY KEY,
    pc_project_id      NUMBER        CONSTRAINT pc_tasks_project_id_nn NOT NULL
                                     CONSTRAINT pc_tasks_project_id_fk
                                         REFERENCES pc_projects (pc_project_id),
    task_name          VARCHAR2(200) CONSTRAINT pc_tasks_task_name_nn NOT NULL,
    priority           VARCHAR2(10),
    pc_owner_id        NUMBER        CONSTRAINT pc_tasks_owner_id_fk
                                         REFERENCES pc_owners (pc_owner_id),
    status             VARCHAR2(20),
    start_date         DATE,
    end_date           DATE,
    pc_milestone_id    NUMBER        CONSTRAINT pc_tasks_milestone_id_fk
                                         REFERENCES pc_milestones (pc_milestone_id),
    pc_deliverable_id  NUMBER        CONSTRAINT pc_tasks_deliverable_id_fk
                                         REFERENCES pc_deliverables (pc_deliverable_id),
    notes              VARCHAR2(4000),
    created            DATE          DEFAULT SYSDATE,
    created_by         VARCHAR2(100) DEFAULT SYS_CONTEXT('APEX$SESSION', 'APP_USER'),
    updated            DATE,
    updated_by         VARCHAR2(100),
    CONSTRAINT pc_tasks_priority_chk CHECK (
        priority IN ('P0', 'P1', 'P2', 'P3')
    ),
    CONSTRAINT pc_tasks_status_chk CHECK (
        status IN ('Blocked', 'Complete', 'In progress', 'Not started', 'On hold')
    )
);
