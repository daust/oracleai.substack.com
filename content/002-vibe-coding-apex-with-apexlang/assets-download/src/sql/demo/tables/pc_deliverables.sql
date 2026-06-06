CREATE TABLE pc_deliverables (
    pc_deliverable_id  NUMBER        CONSTRAINT pc_deliverables_pk PRIMARY KEY,
    deliverable_name   VARCHAR2(200) CONSTRAINT pc_deliverables_name_nn NOT NULL,
    created            DATE          DEFAULT SYSDATE,
    created_by         VARCHAR2(100) DEFAULT SYS_CONTEXT('APEX$SESSION', 'APP_USER'),
    updated            DATE,
    updated_by         VARCHAR2(100),
    CONSTRAINT pc_deliverables_name_uk UNIQUE (deliverable_name)
);
