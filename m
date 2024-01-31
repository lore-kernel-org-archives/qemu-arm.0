Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1417264ejk;
        Wed, 31 Jan 2024 03:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0sDOOvyGM5n0R5rTfZvXe9GOnll3ur1VEM4Kqg82l3Ni/9gNuLs2pXbuOMJdzxIBG4oGs
X-Received: by 2002:a25:e08c:0:b0:dc2:2aca:6881 with SMTP id x134-20020a25e08c000000b00dc22aca6881mr1081848ybg.30.1706701707297;
        Wed, 31 Jan 2024 03:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706701707; cv=none;
        d=google.com; s=arc-20160816;
        b=0lchTq0cKckqCtvAkZEgHIdT/towFVe/qX1VS8oukf1WD19NzBwnmqzEv09AONJhiS
         fnGn8HdqBFd0KHKQ/6Q0UzdTIRBm+Mit61ZpCPgaq58TB8SNS5+l6l6no+AqMLP7QC0k
         xwZexNL6qoifdfermAJ8G+COsy9yq9bKo7fsTiQCwVgK1IsVZksLYD8qV9mJn0L8NPxF
         wjAA9fGhXVBySTdfeHtkov+wmJi1+ZLGydaCppZ94mk1/WFsjvpENZqf4HkzHnkuaypZ
         RWFUrCNWA8yPGdVQQRRGY+7ySdkDOfK9GK1JFZ8jIInU6wkfrslV6xNlfIVpyskLlVO3
         OP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YIgqkw+qeMnZEE+5XNOrMhtie0S82f26y+LdjDCYqgU=;
        fh=2a0nViFaHGaHSssXNkGSNXuXw5784d3G2xTLmzjSeV8=;
        b=sjqcgD7DEIuFyPmaXVnHFtArtTWfuttGmQszmG9w2kABrjJM6pLpukawBtK9VBjthb
         fXMdDhOdzx+f4NvNqQmCyMOx2R3gh8QdRbW9rKgcXJm5qhG+ng5pr0YqOd67cUYc4/dl
         pibYjZ1L7IOzdJSdGrzWaMyEckX7yfl35+XZ6M//zlmizoWmeG1CJ0wWH/Vb9ZP4lau+
         6LrMSBQpes+bAJ/zqDRMpRF+gUoiJkn+iRPfe7KeizAUyM1eSiAI7u0gVEJqNF/YTpRU
         lmf3NJvRuuQZJhnxLxqStlAS+7Q6mooVTkr9SKBmopmHJmG2wogeL1Wq/bgC6bGLXsCj
         ZlRQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ajDCRHNK;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
X-Forwarded-Encrypted: i=0; AJvYcCVZxwlUezZwBh6L63rkVOemn4aDzEKbH4E1vLgovxCGLYfMVpfIMYUSpDGO8dmY52ia7kcicyPOzZCvO0Pa2oL2LLMaRMQNlWPBlk99FaG573nEtyP9GBlyh8NJd2XDOl1w1NlFr1nwdaLZ90vu+hOlsvQx
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id q184-20020a2575c1000000b00dc6a16003basi1775359ybc.59.2024.01.31.03.48.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jan 2024 03:48:27 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ajDCRHNK;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40VB9PQg017450;
	Wed, 31 Jan 2024 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YIgqkw+qeMnZEE+5XNOrMhtie0S82f26y+LdjDCYqgU=;
 b=ajDCRHNKeCnxUQprXX+WBw+002K/AsfUFsibv8W5GTjgeqzVS3Z/BLfLbd9hAytiyaLY
 fAF9VwhtpVXhF4/5BSp9QcvpGz9hfy5bCWNgRhZxSHT8KoxxXIrY5Wrz0+Bk2BSMZxiZ
 Fm84wDDA+i6RMJ2rfoRPZjsT3quonidy2FmPrN53G0OhC9XZW1YrDMyCM1vohaFqCVAa
 x8F4lY/EtjkLj/RQGzO1dTMn/njRvhwWVHpK5lpPA4272pFkJEM7GE0rVX5d03M/ibqY
 4Ur4PSUWBELVwOAbR05T1agKQS84YfeXD20ePJCXZCZ3wZr43XIF05RvMR44tiki6CPT PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vyhhtpec7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:25 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40VB3SYD016004;
	Wed, 31 Jan 2024 11:48:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vyhhtpebn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:25 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40VAp4Fx017712;
	Wed, 31 Jan 2024 11:48:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwchywaq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:48:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40VBmLm623527714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jan 2024 11:48:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E3520043;
	Wed, 31 Jan 2024 11:48:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9187920040;
	Wed, 31 Jan 2024 11:48:21 +0000 (GMT)
Received: from black.boeblingen.de.ibm.com (unknown [9.155.200.166])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jan 2024 11:48:21 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Date: Wed, 31 Jan 2024 12:46:31 +0100
Message-ID: <20240131114817.288027-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131114817.288027-1-iii@linux.ibm.com>
References: <20240131114817.288027-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fqhbpY9gAx3sIy4NAyRINmdIFBfJwlS_
X-Proofpoint-ORIG-GUID: crZwyi3eDxxxg1GfZZVHlKyUmPWw7YET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=973
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401310089
X-TUID: 63vEbNuRgidb

Make sure that qemu gdbstub, like gdbserver, allows reading from and
writing to PROT_NONE pages.

Acked-by: Alex Bennée <alex.bennee@linaro.org>
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
index 00000000000..7e264589cb8
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
+    if not probe_proc_self_mem():
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
