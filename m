Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3487741ejb;
        Tue, 6 Jun 2023 06:28:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yu012QzrDjH3+prL//vB6/GL4/vAmXoGzImtZa+lgg8lFPVXQQITPgogCrPRHUP5j54OF
X-Received: by 2002:a05:6e02:11b2:b0:33c:2a80:3721 with SMTP id 18-20020a056e0211b200b0033c2a803721mr2176151ilj.4.1686058085249;
        Tue, 06 Jun 2023 06:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686058085; cv=none;
        d=google.com; s=arc-20160816;
        b=kYcG1WSOuSZJ7RVRycAl3iRCdaIuaCfqjp+3unCV6Zfq+896j2xNqQiq+VQmcRHtGB
         Be0PytYpp5OHQzhZLFRtREOperV91Jil8s6pcmEW5IM8t59PCafcaTGlWLPb6vDdcnaS
         aIhzDf6qxmqb8lPmX2jSbcU5mcIRVYHgX+yrloOlpycUdVxe4V+KyNA8CwK12vnP2XA4
         wGEHo/5GRxm85fKIbZHcNn7EaJfc898mh2tY4jnumGlwC3udmGWTyGrPIW35B+SvpGlX
         AeWNq2j3FagHp2HYnGpcHRyKkB2fwsG9AYLcWS5dUL8hRe66NW6Udm5I33ZDQGmxnbHr
         OWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kxVkWuqJdgcUe81jaYZw/eiz0P5IB2KSrCOA061VjX4=;
        b=WyI9eV+OEUkUpjt1qWQ8FVQsOcDcM/uvF1XfE+Qrvwwzyf9rb7DGjfTwwHV2BJna35
         h+wmFTl0VAFeWK34IQ/cotx1V0crp9aK48E6rtwrNSR8YrWIyL3R46IWib9CguuD7I0H
         eF4qY+hmBnWacmtoZMgQmDvuRKjyx3Tec+AXS4QORX9beh2zESeSI0BKPrEuiCm23U+x
         oP/I1fP9bl1eAZpD8Mz/m3DTuWVkIILguLH//hqExncntVV7eF0SVCPQUQkzZW/Rh1nU
         15SIhlGSSsISX/fx8p/AwYYZe64uOP2btiaQYrFVSo6zdDcnhOLqsUCTW+XgcU6SZez1
         8YVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g3QR8eUr;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id t33-20020a05663834a100b0041abeb217cbsi4613552jal.88.2023.06.06.06.28.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g3QR8eUr;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356DGx7r021018;
	Tue, 6 Jun 2023 13:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kxVkWuqJdgcUe81jaYZw/eiz0P5IB2KSrCOA061VjX4=;
 b=g3QR8eUrQgFix6qBVSMMSzgAGRVJQ5YVo/ExBZ8RRAJmm3YfYUzEgaKscGyllRuA9qeF
 GTDTTUCyXUeK3acWCo7auEPFWyXiW9H2XgUTD+m1wT8qTAjFWNVVPKAxUrh4STm10GPq
 fOFJJFMIvj+EuvW5AkDHhOdJJv4YHwNFSZj2qwOLcTuRDrnXWbFyNfKp6WjxEnz3UVov
 CKpG33CtDxs7OUieeF2NhQ8cbrJmxjrbPbVJmhVShgaEW0cGqxocrum+mcvwnL9puy3G
 SGgWDtJ/JZvXfifkEqNOvE+6qHzyLW5nBGVx5/2Eox83v+syWTaNuLsCqlEXRLudYjZ6 cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25hyr9rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:28:03 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356DIbNQ025947;
	Tue, 6 Jun 2023 13:28:02 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r25hyr9px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:28:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 355Mx3Tq023788;
	Tue, 6 Jun 2023 13:27:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qyxg2hyjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:27:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356DRuR124576664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 13:27:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6493520043;
	Tue,  6 Jun 2023 13:27:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21D1620040;
	Tue,  6 Jun 2023 13:27:56 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 13:27:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 8/8] tests/tcg: Add a test for info proc mappings
Date: Tue,  6 Jun 2023 15:27:43 +0200
Message-Id: <20230606132743.1386003-9-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132743.1386003-1-iii@linux.ibm.com>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Susbg_Kr8-PF65k27wg8Aay1i_1MUF3N
X-Proofpoint-GUID: CBbXBiqnILJbqjvMcPGFKpKP9AZnK9he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=802
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060110
X-TUID: TDVkYRvp5iO5

Add a small test to prevent regressions.
Since there are issues with how GDB interprets QEMU's target.xml,
enable the test only on aarch64 and s390x for now.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/aarch64/Makefile.target             |  3 +-
 tests/tcg/multiarch/Makefile.target           |  7 +++
 .../multiarch/gdbstub/test-proc-mappings.py   | 55 +++++++++++++++++++
 tests/tcg/s390x/Makefile.target               |  2 +-
 4 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 03157954871..38402b0ba1f 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -97,7 +97,8 @@ run-gdbstub-sve-ioctls: sve-ioctls
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
 	basic gdbstub SVE ZLEN support)
 
-EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
+EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls \
+              run-gdbstub-proc-mappings
 endif
 endif
 
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 373db696481..cbc0b75787a 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -81,6 +81,13 @@ run-gdbstub-qxfer-auxv-read: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
 	basic gdbstub qXfer:auxv:read support)
 
+run-gdbstub-proc-mappings: sha1
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-proc-mappings.py, \
+	proc mappings support)
+
 run-gdbstub-thread-breakpoint: testthread
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
diff --git a/tests/tcg/multiarch/gdbstub/test-proc-mappings.py b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
new file mode 100644
index 00000000000..657e36a2fc7
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
@@ -0,0 +1,55 @@
+"""Test that gdbstub has access to proc mappings.
+
+This runs as a sourced script (via -x, via run-test.py)."""
+from __future__ import print_function
+import gdb
+import sys
+
+
+n_failures = 0
+
+
+def report(cond, msg):
+    """Report success/fail of a test"""
+    if cond:
+        print("PASS: {}".format(msg))
+    else:
+        print("FAIL: {}".format(msg))
+        global n_failures
+        n_failures += 1
+
+
+def run_test():
+    """Run through the tests one by one"""
+    mappings = gdb.execute("info proc mappings", False, True)
+    report(isinstance(mappings, str), "Fetched the mappings from the inferior")
+    report("/sha1" in mappings, "Found the test binary name in the mappings")
+
+
+def main():
+    """Prepare the environment and run through the tests"""
+    try:
+        inferior = gdb.selected_inferior()
+        print("ATTACHED: {}".format(inferior.architecture().name()))
+    except (gdb.error, AttributeError):
+        print("SKIPPING (not connected)")
+        exit(0)
+
+    if gdb.parse_and_eval('$pc') == 0:
+        print("SKIP: PC not set")
+        exit(0)
+
+    try:
+        # These are not very useful in scripts
+        gdb.execute("set pagination off")
+        gdb.execute("set confirm off")
+
+        # Run the actual tests
+        run_test()
+    except gdb.error:
+        report(False, "GDB Exception: {}".format(sys.exc_info()[0]))
+    print("All tests complete: %d failures" % n_failures)
+    exit(n_failures)
+
+
+main()
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 4899503e1db..d33960caa0a 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -78,7 +78,7 @@ run-gdbstub-signals-s390x: signals-s390x
 		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
 	mixing signals and debugging)
 
-EXTRA_RUNS += run-gdbstub-signals-s390x
+EXTRA_RUNS += run-gdbstub-signals-s390x run-gdbstub-proc-mappings
 endif
 
 # MVX versions of sha512
-- 
2.40.1
