Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp690171ejs;
        Tue, 9 Jan 2024 15:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+loEeYWUvhkwzZyCGSVOY/kHo+YCS0nU0Tn20WovBwtyoxpLh/z0wDeNCMMHsNdLWjHFX
X-Received: by 2002:a0d:c841:0:b0:5e0:66ef:bca5 with SMTP id k62-20020a0dc841000000b005e066efbca5mr971621ywd.40.1704841698847;
        Tue, 09 Jan 2024 15:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704841698; cv=none;
        d=google.com; s=arc-20160816;
        b=hF/rG5YZs5cmm0Qo+92hbSQxPWjPj2spQZF83nP0+9Na5Ayzv+zsDECtlO9OMDcNPk
         hFRKNPE98nXLBonkcb4UCroCNl+oPNjJVbKin7nDUfGFDf8GpQUXrqqAseC8AYjFc3dC
         IslUgzCuTv9xbrpTIE+pQYzV0VSFciRkjtrqC5nkbmXuiIxWIi8OEyJbqiehZhUctdZ2
         I9ONlg3SGAaEepWe4skFye0q0yVZ/4dO488/56rRUSl7gWsSe+C6DfFPosTY0PU7P73B
         I4r0Sx4naqKBBLf5ik0AOQ8Z+9SQtW+TyXM2M80U4d1RRw69NBFwLTpeT+hpQ2xSgYIY
         oAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yHR/ROIVHnEEoiARJUniG8e0cZDOc3zEQr2XoI/ghDE=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=e1A06ES0jhreBtfKuUhxAhVwYO4V3qq9X3HW2DMx8L1rmd6MVCBChHTC0uidDaUnPp
         i8yFVMBJ8xBwdMn52//BK5Vw6a+WOJdSLeY8Wv7RwX6sI1rBijcvIKYRZY3condz12R6
         gDZ84/fsTCd3WkiBs40E74P/2wwgbBUbcRD8wjXIWxkf39W8ceBFaoae2tz9iRqqNCTq
         PzN4M+wpxjEkZCsnCIBuxtNAi1hreaxFcmqBNfCiOH5K5Qbvp+0bB6DYVIskfE92SM1M
         RwcsNKm+huFTV0zU3/6NbAKVjbQa8zDSfLoccQFoIEbWC+rOQENg1ls8lqcWvQVgGkPf
         2MdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dBI9iqif;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id z3-20020a81d403000000b005e3735dd212si1309430ywi.116.2024.01.09.15.08.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 15:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dBI9iqif;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409N4g7L009000;
	Tue, 9 Jan 2024 23:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yHR/ROIVHnEEoiARJUniG8e0cZDOc3zEQr2XoI/ghDE=;
 b=dBI9iqif2mksFbII3a/bJGznsJJmKwvSAxWngkc5Ix+2uzlrGUp9DwaX1yc3BaG76Pdn
 CASe1tR75hQcMtZkWE+o7F5zaTC9pKRx9HaPhnQ9KvTGxhPB1LfgUwGYzVJ1A2B8i+z6
 golgmtVouv0y/NxN0C/dnhhENFU29UC41Usct5ZMnhX0qzOfjAwI7dulGe8kWfZ+jWOj
 5cLcFrymnj8rGGUp3YkTiR4AsVIjfUL7TfHSnsH7yfv6oGK2NPlLQp6vVx6mzh+TYGGp
 5GiEthN3R6YQ/iKiDxLA4XXiKOTk0dKWAs8rEEEqQ0WnKUkOnB5/aDDJMtgchjwVBXML rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhasgxtsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:17 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409MtIF7031071;
	Tue, 9 Jan 2024 23:08:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhasgxtsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:17 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409LMuGk028035;
	Tue, 9 Jan 2024 23:08:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vgwfsnqmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:08:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409N8ECZ15401596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 23:08:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C215D20043;
	Tue,  9 Jan 2024 23:08:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538BB20040;
	Tue,  9 Jan 2024 23:08:14 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.60.193])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 23:08:14 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Date: Wed, 10 Jan 2024 00:05:55 +0100
Message-ID: <20240109230808.583012-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109230808.583012-1-iii@linux.ibm.com>
References: <20240109230808.583012-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mwq0GWn-Vx6H-MRkP07bwHizeKTDIxM6
X-Proofpoint-GUID: UlT6kA7H0_rosw8eEC2XFh_uLyY6sJKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=865 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090186
X-TUID: B2L86zDdC5/c

Make sure that qemu gdbstub, like gdbserver, allows reading from and
writing to PROT_NONE pages.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target      |  9 +++++-
 tests/tcg/multiarch/gdbstub/prot-none.py | 22 +++++++++++++
 tests/tcg/multiarch/prot-none.c          | 40 ++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)
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
index 00000000000..f1f1dd82cbe
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/prot-none.py
@@ -0,0 +1,22 @@
+"""Test that GDB can access PROT_NONE pages.
+
+This runs as a sourced script (via -x, via run-test.py).
+
+SPDX-License-Identifier: GPL-2.0-or-later
+"""
+from test_gdbstub import main, report
+
+
+def run_test():
+    """Run through the tests one by one"""
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
