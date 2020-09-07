-- ���� ������ ����
DROP SEQUENCE RSTRNT_INFO_SEQ;

CREATE SEQUENCE RSTRNT_INFO_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

INSERT INTO TB_RSTRNT_INFO VALUES(RSTRNT_INFO_SEQ.NEXTVAL, 
999, 
'01012345678', 
'����', 
'��Ÿ���� ���� �ĳ�', 
'����Ư���� ���ı� ���ʼ���� 134',
'����Ư���� ���ı� ���̵� 183-6', 
NULL, 
45000, 
DEFAULT, 
9, 
18, 
4, 
'���� �Ұ�', 
'N', 
'��', 
DEFAULT, 
DEFAULT, 
DEFAULT);

INSERT INTO TB_PHOTOFILES VALUES(1,
1,
'ĸó.JPG',
'2020090523440844614.JPG',
1
);

INSERT INTO TB_PHOTOFILES VALUES(2,
1,
'ĸó1.JPG',
'2020090523440863264.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(3,
1,
'ĸó2.JPG',
'2020090523444837295.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(4L,
1,
'ĸó3.JPG',
'2020090523441237540.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(5,
1,
'ī��1.jpg',
'2020090523442332653.jpg',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(6,
1,
'���մ°�1.jpg',
'2020090523448712567.jpg',
DEFAULT
);

INSERT INTO TB_RSTRNT_MENU VALUES(1,
1,
'�Ұ���� �������� ������',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(2,
1,
'������ ��ɱ��� ������',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(3,
1,
'���� ���ͱ���',
43000
);

INSERT INTO TB_RSTRNT_MENU VALUES(4,
1,
'NY������ũ 500g',
74000
);

INSERT INTO TB_RSTRNT_MENU VALUES(5,
1,
'ǳ�� ũ�� �Ľ�Ÿ',
28000
);

INSERT INTO TB_RSTRNT_MENU VALUES(6,
1,
'�����ʷ� ���� û��丮',
33000
);

INSERT INTO TB_RSTRNT_MENU VALUES(7,
1,
'�����ؽ� ����丮',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(8,
1,
'���Ľ��� �׶��',
12000
);

INSERT INTO TB_RSTRNT_MENU VALUES(9,
1,
'������ ���� ����',
11000
);

INSERT INTO TB_RSTRNT_MENU VALUES(10,
1,
'������ ���� ���ַ�',
8000
);

SET SERVEROUTPUT ON ;

DECLARE

        v_cnt NUMBER := 1;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_MEMBER
            VALUES(M_SEQ.NEXTVAL, 'honey' || v_cnt, '�����' || v_cnt, 'honey' || v_cnt || '@gmail.com', DEFAULT, DEFAULT, DEFAULT, 'Y', DEFAULT, DEFAULT);

	INSERT INTO TB_GNRL_MEMBER
	VALUES (M_SEQ.CURRVAL,'hp' || v_cnt, 050630, 01012345678, '�����', 1, 0);

	INSERT INTO TB_M_PASSWORD
	VALUES (M_SEQ.CURRVAL,'123');

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 100;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

     END;           
     /

DECLARE

        v_cnt NUMBER := 1;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '���� �׽�Ʈ' || v_cnt, SYSDATE, 1, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 10;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

     END;           
     /

DECLARE

        v_cnt NUMBER := 11;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '���� �׽�Ʈ' || v_cnt, SYSDATE, 2, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 15;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

     END;           
     /

DECLARE

        v_cnt NUMBER := 16;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '���� �׽�Ʈ' || v_cnt, SYSDATE, 3, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 20;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

     END;           
     /

COMMIT;