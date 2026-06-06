CREATE OR REPLACE TRIGGER pc_tasks_bir
    BEFORE INSERT OR UPDATE ON pc_tasks
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        IF :NEW.pc_task_id IS NULL THEN
            :NEW.pc_task_id := pc_tasks_seq.NEXTVAL;
        END IF;
        :NEW.created    := SYSDATE;
        :NEW.created_by := NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER);
    END IF;
    IF UPDATING THEN
        :NEW.updated    := SYSDATE;
        :NEW.updated_by := NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER);
    END IF;
END;
/
