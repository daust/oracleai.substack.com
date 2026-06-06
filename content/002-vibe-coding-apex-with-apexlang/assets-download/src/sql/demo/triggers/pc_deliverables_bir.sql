CREATE OR REPLACE TRIGGER pc_deliverables_bir
    BEFORE INSERT OR UPDATE ON pc_deliverables
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        IF :NEW.pc_deliverable_id IS NULL THEN
            :NEW.pc_deliverable_id := pc_deliverables_seq.NEXTVAL;
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
