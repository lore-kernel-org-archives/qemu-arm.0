Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp55817ejk;
        Mon, 29 Jan 2024 01:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHADdNK1TSOz1PqjS3spVfa8dtUw5ZqqBRw0xne5n/IPfJsRBQSm7QTCw/Hyutyl0RE7tHV
X-Received: by 2002:a17:902:e543:b0:1d8:f82c:c74e with SMTP id n3-20020a170902e54300b001d8f82cc74emr148196plf.42.1706520867627;
        Mon, 29 Jan 2024 01:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706520867; cv=none;
        d=google.com; s=arc-20160816;
        b=KoALrQZQhxHWRvrMmScMp+zcy2zPHutabKQfLEOdb/JEkdoRLosIPVlVlCHh1uhg9E
         fp2q++A7rFZsF6eUQtWIS9MWNptLRyI/cVhp/CEWr9cmH+nppVlT/gvjp54GVk3wk6tB
         m8JuZ9jY+1KSQqjfpNoDVqe58kWWTaxljttDl62VXRc1+iu3rwhJkOm781tVW422V7FP
         StMg48Rg1I6Fn+RaFyO5ymlTnzh4HgBt2BzaG7z2t1pBST/FS23iaPDS5q9nhjVTQJlV
         dNfSVdSmgOwG55uojsvgf5kREQ0PDgHckfajeWfhtm5iGb1OEpweeyXDay2v5j69bQxn
         BE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hWf8HnN4xTze2R4Ey95SXMooKjiKjraimhDJQ1ivWmM=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=Acry9IOgBlYTZCTUVkBg3PxRmSJYzxEkuFERiwhA3aCzveH8QcjfQSd3zevtFyaOIp
         O2fwxbb7W5wtFdtNUpYsyJrxo1OXIWqyduVwhH31TxxhxzAPbEiFdD4dpNh4lWHDHO/S
         EPGe3efEsaA2M9aY3bc2geqMFXgcReqIEA3ISq3sl+ktZittYoN3VvAxsfbDwwEXl6Un
         mXWN2yFsmpEUCXrHFjJhQFSNZRmogaYuqwH2QKMW4vsrv61Z/1Zm9GhY6Iwai7/RMMqh
         kN3vye0V2k+LtPRnLFPdQjXBZgOjA8kN0Kpq4EQjKIo1nGQt9GYBkbnjVTBtzvoiOj5T
         qO3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AR83oh47;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id z20-20020a1709028f9400b001d7204a84ddsi5439629plo.499.2024.01.29.01.34.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jan 2024 01:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AR83oh47;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T9WL0W001658;
	Mon, 29 Jan 2024 09:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hWf8HnN4xTze2R4Ey95SXMooKjiKjraimhDJQ1ivWmM=;
 b=AR83oh47LESTxXIcE6VZ0eyak6DyZyvRxykd/GknoVq46qIyHucjBGiqyLTiNpt1RuWu
 q7mkGvY9X7HVjZ+WJwPnIYURB5S41juGmTOkLsRgfzZ8jIO0w1r6tOYqVALBzsKJeM8v
 BRxb1lZ1FPAA0LRaHlPZdtnfSnXap9Df/gwd6+qF5fVROaW7X6VwtSLd1iz3Bg8cABaw
 AB9KvEJ6H0/MU8TKqFN+AZKMm9em8SRe4jox60X98Pwed6BfthB6hNfa3I5pznNsdr46
 IuR3d7KyrKmJkoR77VPmc2HnnwWbxsNLXXOwYlMhdlUSdEOVhMjCoHJWXbVUpNRC+Sma gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx9fkr1cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T9Wn0n002818;
	Mon, 29 Jan 2024 09:34:26 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx9fkr1c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:25 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T6EXEg010884;
	Mon, 29 Jan 2024 09:34:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vweck70b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:34:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T9YNbu43909844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 09:34:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D3A320043;
	Mon, 29 Jan 2024 09:34:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94D9220040;
	Mon, 29 Jan 2024 09:34:22 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.179.7.240])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jan 2024 09:34:22 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Date: Mon, 29 Jan 2024 10:32:16 +0100
Message-ID: <20240129093410.3151-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129093410.3151-1-iii@linux.ibm.com>
References: <20240129093410.3151-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JkubJDxknbuiHi_AWmSGSWlB9tynwuM3
X-Proofpoint-ORIG-GUID: u_0e3XFw6uXLKWdwZcgslyCQwu4Un5FL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_05,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=907
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290068
X-TUID: OL9LnEF9E4gv

Make sure that qemu gdbstub, like gdbserver, allows reading from and
writing to PROT_NONE pages.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target      |  9 +++++-
 tests/tcg/multiarch/gdbstub/prot-none.py | 36 +++++++++++++++++++++
 tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/prot-none.py
 create mode 100644 tests/tcg/multiarch/prot-none.c

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index d31ba8d6ae4..315a2e13588 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -101,13 +101,20 @@ run-gdbstub-registers: sha512
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
 	checking register enumeration)
 
+run-gdbstub-prot-none: prot-none
+	$(call run-test, $@, env PROT_NONE_PY=1 $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/prot-none.py, \
+	accessing PROT_NONE memory)
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
 	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
-	      run-gdbstub-registers
+	      run-gdbstub-registers run-gdbstub-prot-none
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/prot-none.py b/tests/tcg/multiarch/gdbstub/prot-none.py
new file mode 100644
index 00000000000..e829d3ebc5f
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/prot-none.py
@@ -0,0 +1,36 @@
+"""Test that GDB can access PROT_NONE pages.
+
+This runs as a sourced script (via -x, via run-test.py).
+
+SPDX-License-Identifier: GPL-2.0-or-later
+"""
+import ctypes
+from test_gdbstub import main, report
+
+
+def probe_proc_self_mem():
+    buf = ctypes.create_string_buffer(b'aaa')
+    try:
+        with open("/proc/self/mem", "rb") as fp:
+            fp.seek(ctypes.addressof(buf))
+            return fp.read(3) == b'aaa'
+    except OSError:
+        return False
+
+
+def run_test():
+    """Run through the tests one by one"""
+    if not probe_proc_self_mem:
+        print("SKIP: /proc/self/mem is not usable")
+        exit(0)
+    gdb.Breakpoint("break_here")
+    gdb.execute("continue")
+    val = gdb.parse_and_eval("*(char[2] *)q").string()
+    report(val == "42", "{} == 42".format(val))
+    gdb.execute("set *(char[3] *)q = \"24\"")
+    gdb.execute("continue")
+    exitcode = int(gdb.parse_and_eval("$_exitcode"))
+    report(exitcode == 0, "{} == 0".format(exitcode))
+
+
+main(run_test)
diff --git a/tests/tcg/multiarch/prot-none.c b/tests/tcg/multiarch/prot-none.c
new file mode 100644
index 00000000000..dc56aadb3c5
--- /dev/null
+++ b/tests/tcg/multiarch/prot-none.c
@@ -0,0 +1,40 @@
+/*
+ * Test that GDB can access PROT_NONE pages.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+void break_here(void *q)
+{
+}
+
+int main(void)
+{
+    long pagesize = sysconf(_SC_PAGESIZE);
+    void *p, *q;
+    int err;
+
+    p = mmap(NULL, pagesize * 2, PROT_READ | PROT_WRITE,
+             MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(p != MAP_FAILED);
+    q = p + pagesize - 1;
+    strcpy(q, "42");
+
+    err = mprotect(p, pagesize * 2, PROT_NONE);
+    assert(err == 0);
+
+    break_here(q);
+
+    err = mprotect(p, pagesize * 2, PROT_READ);
+    assert(err == 0);
+    if (getenv("PROT_NONE_PY")) {
+        assert(strcmp(q, "24") == 0);
+    }
+
+    return EXIT_SUCCESS;
+}
-- 
2.43.0
