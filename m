Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128138ejb;
        Wed, 21 Jun 2023 13:37:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DBQLTc594UcDcUftI0EHcdyU65+ngfun5gzMwncvaKeMW+PTEMz4TzawdhTrwQ5oIo24s
X-Received: by 2002:a05:6e02:14c:b0:33b:848:378b with SMTP id j12-20020a056e02014c00b0033b0848378bmr7779953ilr.8.1687379821289;
        Wed, 21 Jun 2023 13:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379821; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyQjyWC8BfoyEV422YPo5yTjsZFNKn++7fewus+YE56VF0BbxYl+fWvBFdO+qn86Fz
         ULNK8djQpHf28o9+ZxeGwclHbrglMyQqTKJV1zYX5ssGCLe/Sxs8uqo7Pllko3CiIURQ
         wCNvdNsKNNCY7qh6i3GkugskQ81DYlc6ISBJWZeOcoLPtxfljXhAhoSaBGx4zfRVCZ5y
         DrbNFjkW5/pQuesioQzGvomfbV1qjaoHQnAmf9TjKxjDUPzAoEICdp0HpxnZ2Kq7rnbt
         d5NjoVVh0PdKhlzfW4wVh5ft8mFfVrso9eKiOmi0oM1y37I0UCddGAxN0SSUpXtbXMpf
         fr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TdiIGw6EKMH60FCKoexCpccB5g6GF4b9SqalWcn+2hU=;
        b=mi88fMuyDL6scqGE9tCqv3MAOiK3FuUaqcsGD7nX23XL8bKxA3/vTgsPa879sBCGPG
         sw8aqRqnkVd2knR1x4tEcppV4ps9mjYcioQy1yMly2qxWsr5zfl3tSD1bdcA3KeVzLUP
         OVEBrc3jzduQwDCZZt6gg2b4ZsRoDKomvuZZdBMvnzdU2KIuHthaerfwRMaYFkvC4v0k
         Rfz/dn9h4tUgIOwqdhBldCheffmsEgu0Ao9ScstAU8rzLKdiA/gUdIcwP82kl7rkm5nm
         wwjkLGYtrW05zWhdA4qnxmG+2Ys7OKyFHWSEM2asMsiPiBUukY+Yt7kRVhmdhooxgdNn
         XRGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YdtarQEU;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id m16-20020a924a10000000b0034202189852si2067155ilf.137.2023.06.21.13.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YdtarQEU;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKGx8R008635;
	Wed, 21 Jun 2023 20:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TdiIGw6EKMH60FCKoexCpccB5g6GF4b9SqalWcn+2hU=;
 b=YdtarQEUn+cuSxunMKEEPvl9cDjKFcaXGb5lX2Eyf7pVjhYdFKAdSntoMyysss5+LIUc
 ggQah6xG6IXK5MAcy+tCODoXqvF3e4A5DQRQMt0KsEXbUyqroE99F8TiP/52qUVHYUY4
 v165z4K8Nd5BGuAmVq1aGhnPxUaRAF00HUKCKJ2q+vQ2ANvPwOPq8GxEWf1OnN3xWd6o
 E+KCV1bNpnf7/pvvvzzb/JS/aSYfJRp0lIKR16A6B+UtBD2fKGNXdpSQP2Uc3kT1sOtu
 YbvHoCrkSozdnr/fO+U8If4MU0EPOPchFrsTzFIYdQ9aYsKMKvnPwnQoowwYNW/jZR9a Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc83wrf94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:37:00 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKSFPE012981;
	Wed, 21 Jun 2023 20:36:59 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc83wrf7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:59 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L2eYbW023647;
	Wed, 21 Jun 2023 20:36:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r94f5aa8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKasWY62390638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:54 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 713F120043;
	Wed, 21 Jun 2023 20:36:54 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB5D920040;
	Wed, 21 Jun 2023 20:36:53 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 8/8] tests/tcg: Add a test for info proc mappings
Date: Wed, 21 Jun 2023 22:36:27 +0200
Message-Id: <20230621203627.1808446-9-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e155cBitdUeJE5gm05xsc16-QbLiI91g
X-Proofpoint-ORIG-GUID: SRrfTpcgVgZMnpGjRLgOPsVy6-co75nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=866
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210172
X-TUID: l0lKV/8wx8Ep

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 .../multiarch/gdbstub/test-proc-mappings.py   | 65 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 373db69648..43bddeaf21 100644
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
@@ -97,7 +104,7 @@ run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
-	      run-gdbstub-thread-breakpoint
+	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/test-proc-mappings.py b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
new file mode 100644
index 0000000000..a23bbcee7f
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
@@ -0,0 +1,65 @@
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
+    try:
+        mappings = gdb.execute("info proc mappings", False, True)
+    except gdb.error as exc:
+        exc_str = str(exc)
+        if "Not supported on this target." in exc_str:
+            # Detect failures due to an outstanding issue with how GDB handles
+            # the x86_64 QEMU's target.xml, which does not contain the
+            # definition of orig_rax. Skip the test in this case.
+            print("SKIP: {}".format(exc_str))
+            return
+        raise
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
-- 
2.40.1
