Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp72840ejs;
        Mon, 8 Jan 2024 15:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6WLjB7/KA80cQ/c4gHqZQ5sZSxAb8kq//Ly/WyF4scUEWpH4ONrOIiDA91JZjoEY1tSJr
X-Received: by 2002:a0d:c601:0:b0:5f5:a0be:22dd with SMTP id i1-20020a0dc601000000b005f5a0be22ddmr3271014ywd.63.1704757118547;
        Mon, 08 Jan 2024 15:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704757118; cv=none;
        d=google.com; s=arc-20160816;
        b=fI66qLMZ3Qm7XVVNCG49nPke/aXyRmPs2l3dwIx/OUf+Wvn5mKosPcNHqRuY4BJBY3
         EH8R4BkcTXtVmL6fOct4sIVynQkOIXQLqF3puKyWpg9cDJUM0ZQ/ytF6F26SC7l9wbOH
         QD8QjBEd2dmTOa1u+56GlTJmo/vD9OxcST91WzF0SwFIwvQmzy01qXC01zPmYSS91Fpk
         RVwDnpa2qNaB/Tco0VQnbD9kle0auOUdxN1SfHMuOWGnnk6soKzhTB8vMGJGIpJ0rbYN
         jpQ/7eeTVJVRXNEx7mdtFxcY/wgBacv+jPOjg5sdf/gRaJOWlrn0cBd1lFjKhtxs3wSJ
         rCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BnOVy1brSmNwOJlli/9cw4CpTyAc6Y9wcRr8LqAG3Kk=;
        fh=MCCLRI7Eav0C58J4xbQiDqdrgb9nG6Ic0RkQM1eww+k=;
        b=pYnaJb8sU7bb69dNIT53jgeBRF3plvTXdJlfGRX+dKpkhljpsAsXu4JAIXfdCbYnbS
         GnXmLFQ3Rb7AgiCZF4fEpErN6lyQpVGgcCIofk5ZGV+mouwvLEDTQxqPX01IiaB3jiFf
         hB3mOyOaww+vXBUbLiJj3t0BJasjdxjN+7rhyrEuEuk1lCqKLZ5/J9TtOvZsRoJ2L0dr
         014UyJAsIVMSx1Xg4VaXPpTrroIgqJoSHBUApBFnpesSM6gRu2PPeeAPYgiBCiljmLl3
         yYRuAv4db15xG9bo0uFZWPKramqmWBPLLkNwishzS8v7ia37CoPV8fHxZmWyDKmpbqvJ
         wPPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qKWtiLhS;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id x34-20020a81af62000000b005f580d4d7ffsi397374ywj.159.2024.01.08.15.38.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jan 2024 15:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qKWtiLhS;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 408NBegH021919;
	Mon, 8 Jan 2024 23:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BnOVy1brSmNwOJlli/9cw4CpTyAc6Y9wcRr8LqAG3Kk=;
 b=qKWtiLhS3x7+1MwxCTYf9T6YIMJUCiHv7P0xcZRGE2Cm7j7bMlGMCG2BkGxSJr2x8aIi
 VQRs/vSph4NRJEEefqygQ12Q+cY/VrAoBuMTer3xHKAo2gqak4tLvKl76n+UH1kzB8Rx
 JXWHHpJud/NYfWGoA8oVUnVs9TH+8+WCB9zjn953/cio6w2cVtUVb+Rk97h2GmbiHeyX
 SHGs+xd37FWkDWvfpLu3g0ZxqQZuvDPD6C8LP3Rh1KJQGT4JErIb23wd6m5Kovr8Ccyo
 jIKf7M38KkZGVheWA2H3cG5BzY/9aMO7/AaaJt4qfd8BT8SlaOidhGOPFxiSFVlm2H3S rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgsf9a04g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:37 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 408NUuX0017289;
	Mon, 8 Jan 2024 23:38:37 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgsf9a049-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:37 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 408M0Ism000906;
	Mon, 8 Jan 2024 23:38:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkdk2xau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:38:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 408NcYSC11862738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jan 2024 23:38:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CAF420043;
	Mon,  8 Jan 2024 23:38:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F36EC20040;
	Mon,  8 Jan 2024 23:38:33 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.15.162])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jan 2024 23:38:33 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 3/3] tests/tcg: Add the PROT_NONE gdbstub test
Date: Tue,  9 Jan 2024 00:34:08 +0100
Message-ID: <20240108233821.201325-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108233821.201325-1-iii@linux.ibm.com>
References: <20240108233821.201325-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0jjNaVQ6eF2q4Zx9cBbQqlgWLdhqjMuw
X-Proofpoint-GUID: OupBdXrGsL_EUL7o2M5iNZkCHmrijP5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_10,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=862 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080192
X-TUID: 0SxsADQ+XKz1

Make sure that qemu gdbstub, like gdbserver, allows reading from and
writing to PROT_NONE pages.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target      |  9 +++++-
 tests/tcg/multiarch/gdbstub/prot-none.py | 22 ++++++++++++++
 tests/tcg/multiarch/prot-none.c          | 38 ++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
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
index 00000000000..751e44d5b93
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
+    val = int(gdb.parse_and_eval("*p"))
+    report(val == 42, "{} != 42".format(val))
+    gdb.execute("set *p = 24")
+    gdb.execute("continue")
+    exitcode = int(gdb.parse_and_eval("$_exitcode"))
+    report(exitcode == 0, "{} != 0".format(exitcode))
+
+
+main(run_test)
diff --git a/tests/tcg/multiarch/prot-none.c b/tests/tcg/multiarch/prot-none.c
new file mode 100644
index 00000000000..66e38065cf0
--- /dev/null
+++ b/tests/tcg/multiarch/prot-none.c
@@ -0,0 +1,38 @@
+/*
+ * Test that GDB can access PROT_NONE pages.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+void break_here(long *p)
+{
+}
+
+int main(void)
+{
+    long pagesize = sysconf(_SC_PAGESIZE);
+    int err;
+    long *p;
+
+    p = mmap(NULL, pagesize, PROT_READ | PROT_WRITE,
+             MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(p != MAP_FAILED);
+    *p = 42;
+
+    err = mprotect(p, pagesize, PROT_NONE);
+    assert(err == 0);
+
+    break_here(p);
+
+    err = mprotect(p, pagesize, PROT_READ);
+    assert(err == 0);
+    if (getenv("PROT_NONE_PY")) {
+        assert(*p == 24);
+    }
+
+    return EXIT_SUCCESS;
+}
-- 
2.43.0
