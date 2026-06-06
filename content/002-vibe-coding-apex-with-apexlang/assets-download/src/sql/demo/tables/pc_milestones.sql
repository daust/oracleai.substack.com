CREATE TABLE pc_milestones (
    pc_milestone_id  NUMBER        CONSTRAINT pc_milestones_pk PRIMARY KEY,
    milestone_name   VARCHAR2(100) CONSTRAINT pc_milestones_name_nn NOT NULL,
    created          DATE          DEFAULT SYSDATE,
    created_by       VARCHAR2(100) DEFAULT SYS_CONTEXT('APEX$SESSION', 'APP_USER'),
    updated          DATE,
    updated_by       VARCHAR2(100),
    CONSTRAINT pc_milestones_name_uk UNIQUE (milestone_name)
);
