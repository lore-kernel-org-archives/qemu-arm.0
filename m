Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E01FCAC587
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 16:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uw0w4-0007UX-3W; Tue, 09 Sep 2025 12:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vZ-0007Ob-Ke
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vL-0001eQ-O2
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:34 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LnLJ030812
 for <qemu-arm@nongnu.org>; Tue, 9 Sep 2025 16:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=obhecAcaWf1
 AiFkb7ZGuTlnLmsM1XQEOi2Z4/adR2Xg=; b=MRRC+1OoymkN+epNu/N8NslnQvk
 LlRT4AomcibZEuK2pQsZI9T89bwZEFHqUnE5xce+pEkCcrDpIa8JwtAD9Mhck56w
 FRCHXB2PBgOMxcL+KbK5OxEwKaba3MMvBcESHpckFjMjPVPBW7viR79foWlWj7+a
 Z+5s6mKL4uZpTbmiefFvZ1k/9INzYiUkDPuXFNPf/04epOUsrojG5Of1PU+aA4Ux
 VlBItbPMkd8rnwndrTakAXKd51Hy49CU8SSLbW6oL0ezU6cWW8y5IImQDmwGpy6b
 CBYZ7X703/TNwn+OcECYQJEwou0ZE0iRopykyCE9tc1Gf1gcPE0l/jopsrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8wvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 16:10:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-329cb4c3f78so5822522a91.2
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 09:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434219; x=1758039019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obhecAcaWf1AiFkb7ZGuTlnLmsM1XQEOi2Z4/adR2Xg=;
 b=duCLXc/0WvC0/k3gx0uVa3wgGDpZM9K/eFyCoB4cnh1hbp6cr+QxYE8NEL6pgSkPHs
 Ck8e19VjOcgDNubJuNJUeKlwjRDXMmmtnOuajsKcmVcDYeemdNix7R6ecwH6KmOoR1uh
 tgEXUO46P7WNZJE9A9CJYeXB7EYq0zLa+baDAvwwGhi6XXRaftWk+NIZNvsKj9nL3IZJ
 y36z6wXEWswAxbpoIT/c+CnDFfld8WUp0MMu0kZv2ooPeKRkQuGUCK2b3/h+JSYo7+gv
 Tzj0eW9pVqxMyBUt+JwSnrgxrx2TWxsx9AkV7UXW6YuzmPnhURTtTGxbPtcG39c9N632
 77MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVexa2KuDl9yEyQglvpp/mSpjPXDwXuSSJ04d7Oo8bTkhK2chqhPU2SC2Oa04QeGL32CsfmWTyr6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzyh9+cLeAzJHKhjK0Tf7tsAchD3HRjt5WIfFt6Tvl1EXEJ8dWc
 YUZT+AwJs8z3Sl/Bgi2XDkpIALhD+L2WbWdGcSc1JaNo6YjwJsAIKLgjV95cJO5E6A+qY/VsXDk
 tTTRqZMKFrQEeB69mTY4DBQfyQHoXmJz4SHne4FSmtiGSv80b4CiRvpE=
X-Gm-Gg: ASbGncvBnpO/SQ47ALNSTwilAMECvPYBcc6vNGDbyorgByd7c1w7ilUMNgx+jpo0V/c
 DTj7ZduFVpkNA1tWE31HVcsEOKffhAq5rivp7HLpUvkNOASKrzWATTYRF8WQ4M7NGELn/ZqKpAK
 D6ywTFJ9kduBg5tf/4CjKdRVr5EDX6NnYKH4m7yM4BXb78O8mE3Kt0vZpwKZuzqaz8jFyvghwgR
 nMpcGTljqk1ozh1mLFiT8YDrZiz47DYC8QqTf+9ZeGS7yPVbErWqx/zBAtjhedrqHbSnt70Fdr0
 rvbnyPtd8IjivWOdtYUNRjeMlY/Q4wd/EsLyY3fAZshwaN4mZr9O4LNIE87hZgHOCpUOAvBVuWo
 RdsZNF4Eql6nWiFQ=
X-Received: by 2002:a17:902:f684:b0:24c:be1f:c1f9 with SMTP id
 d9443c01a7336-2516d33d2demr137694625ad.8.1757434218525; 
 Tue, 09 Sep 2025 09:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7uXqTcCHtKK+IAStDMTF/GyKPFW+DXhncOW9Gln+4mzW3hRv5RzMNOwV9jK72QS7ToE4pMA==
X-Received: by 2002:a17:902:f684:b0:24c:be1f:c1f9 with SMTP id
 d9443c01a7336-2516d33d2demr137694095ad.8.1757434217799; 
 Tue, 09 Sep 2025 09:10:17 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a2a43a9bcsm1794975ad.89.2025.09.09.09.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:10:17 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v8 3/3] target/arm: Added test case for SME register exposure
 to GDB
Date: Tue,  9 Sep 2025 16:10:12 +0000
Message-Id: <20250909161012.2561593-4-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX+CdsQ4HqyIKu
 sRptEr39UH5NR/0VH1ffc9Y6JFhI4be8rITpXjEnHDgaBKM0/VW9MyHvJcx8VaKD4mJhqTi69CD
 v0n1YyMWQe1nsR1wzX0QkRYjYMe/AJ9rRREEglYvr+JEabJfPzjgjHMTybZJlMy6K00VuM3xKUe
 vEdDnD67Sva5M1n7/TdqNv57TfF7KxrKwyoUY+1hOzoD6k60DXAXbukfpdbI+S4dar88W4JgNtv
 Pu/wZ+N15nk7ijAOwe0v9DEZJjlQNR15U7DHmx6ebyCiNS6cBb9LyotQtMNUBrZ0fj7jY/IUWZA
 zKWyJ8QlgJ9RY3oKGUY0hYTTnRr1/dozJYPIpZjExOUjY4mOgIuYWOYwZJ8nf617NT5dK7YuAE1
 LL1bf0Dz
X-Proofpoint-ORIG-GUID: NGt73rdGv_Vz3wrSTH8AIg-hAcd-CkRT
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c0516f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xJcYWlU_UAsFVtOlWloA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NGt73rdGv_Vz3wrSTH8AIg-hAcd-CkRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patch adds a test case to test SME register exposure to
a remote gdb debugging session. This test simply sets and
reads SME registers.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v7:
- removed int casting in test and removed checks for appropriate
gdb versions which support the required int casting
- merged quadword and doubleword tile slice support test into a
single tile slice support test
---
 configure                             |   6 ++
 tests/tcg/aarch64/Makefile.target     |  29 +++++++
 tests/tcg/aarch64/gdbstub/test-sme.py | 116 ++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme.py

diff --git a/configure b/configure
index 274a778764..9aea02cf6a 100755
--- a/configure
+++ b/configure
@@ -1839,6 +1839,12 @@ for target in $target_list; do
           echo "GDB=$gdb_bin" >> $config_target_mak
       fi
 
+      if test "${gdb_arches#*$arch}" != "$gdb_arches" && version_ge $gdb_version 14.1; then
+          echo "GDB_HAS_SME_TILES=y" >> $config_target_mak
+      else
+          echo "GDB_HAS_SME_TILES=n" >> $config_target_mak
+      fi
+
       if test "${gdb_arches#*aarch64}" != "$gdb_arches" && version_ge $gdb_version 15.1; then
           echo "GDB_HAS_MTE=y" >> $config_target_mak
       fi
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 16ddcf4f88..41b31c9353 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -134,6 +134,35 @@ run-gdbstub-sve-ioctls: sve-ioctls
 
 EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 
+ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
+# SME gdbstub tests
+
+run-gdbstub-sysregs-sme: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py \
+		-- test_sme --gdb_basic_za_test, \
+	basic gdbstub SME support)
+
+ifeq ($(GDB_HAS_SME_TILES),y)
+run-gdbstub-sysregs-sme-tile-slice: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py \
+		-- test_sme --gdb_tile_slice_test, \
+	gdbstub SME ZA tile slice support)
+else
+run-gdbstub-sysregs-sme-tile-slice: sysregs
+	$(call skip-test,"gdbstub SME ZA tile slice support", \
+	"selected gdb ($(GDB)) does not support SME ZA tile slices")
+endif
+
+EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-tile-slice
+			  
+endif
+
 ifeq ($(GDB_HAS_MTE),y)
 run-gdbstub-mte: mte-8
 	$(call run-test, $@, $(GDB_SCRIPT) \
diff --git a/tests/tcg/aarch64/gdbstub/test-sme.py b/tests/tcg/aarch64/gdbstub/test-sme.py
new file mode 100644
index 0000000000..ef3a4fcaee
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sme.py
@@ -0,0 +1,116 @@
+#
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from __future__ import print_function
+#
+# Test the SME registers are visible and changeable via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import argparse
+import gdb
+from test_gdbstub import main, report
+
+MAGIC = 0x01020304
+BASIC_ZA_TEST = 0
+TILE_SLICE_TEST = 0
+
+def run_test():
+    
+    # Run the requested test(s) for SME ZA gdbstub support
+
+    if BASIC_ZA_TEST:
+        run_basic_sme_za_gdbstub_support_test()
+    if TILE_SLICE_TEST:
+        run_basic_sme_za_tile_slice_gdbstub_support_test()
+
+def run_basic_sme_za_gdbstub_support_test():
+
+    # This test will check for gdbstub support for correctly reading
+    # and writing to the SME ZA register at the byte level.
+    
+    frame = gdb.selected_frame()
+    rname = "za"
+    za = frame.read_register(rname)
+    report(True, "Reading %s" % rname)
+
+    # Writing to the ZA register, byte by byte.
+    for i in range(0, 16):
+        for j in range(0, 16):
+            cmd = "set $za[%d][%d] = 0x01" % (i, j)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+
+    # Reading from the ZA register, byte by byte.
+    for i in range(0, 16):
+        for j in range(0, 16):
+            reg = "$za[%d][%d]" % (i, j)
+            v = gdb.parse_and_eval(reg)
+            report(str(v.type) == "uint8_t", "size of %s" % (reg))
+            report(v == 0x1, "%s is 0x%x" % (reg, 0x1))
+
+def run_basic_sme_za_tile_slice_gdbstub_support_test():
+
+    # Test if SME ZA tile slices, both horizontal and vertical,
+    # can be correctly read and written to. The sizes to test
+    # are quadwords and doublewords.
+
+    sizes = {}
+    sizes["q"] = "uint128_t"
+    sizes["d"] = "uint64_t"
+    
+    # Accessing requested sizes of elements of ZA
+    for size in sizes:
+
+        # Accessing various ZA tiles
+        for i in range(0, 4):
+
+            # Accessing various horizontal slices for each ZA tile
+            for j in range(0, 4):
+                # Writing to various elements in each tile slice
+                for k in range(0, 4):
+                    cmd = "set $za%dh%c%d[%d] = 0x%x" % (i, size, j, k, MAGIC)
+                    gdb.execute(cmd)
+                    report(True, "%s" % cmd)
+
+                # Reading from the written elements in each tile slice
+                for k in range(0, 4):
+                    reg = "$za%dh%c%d[%d]" % (i, size, j, k)
+                    v = gdb.parse_and_eval(reg)
+                    report(str(v.type) == sizes[size], "size of %s" % (reg))
+                    report(v == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+            
+            # Accessing various vertical slices for each ZA tile
+            for j in range(0, 4):
+                # Writing to various elements in each tile slice
+                for k in range(0, 4):
+                    cmd = "set $za%dv%c%d[%d] = 0x%x" % (i, size, j, k, MAGIC)
+                    gdb.execute(cmd)
+                    report(True, "%s" % cmd)
+
+                # Reading from the written elements in each tile slice
+                for k in range(0, 4):
+                    reg = "$za%dv%c%d[%d]" % (i, size, j, k)
+                    v = gdb.parse_and_eval(reg)
+                    report(str(v.type) == sizes[size], "size of %s" % (reg))
+                    report(v == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+
+
+parser = argparse.ArgumentParser(description="A gdbstub test for SME support")
+parser.add_argument("--gdb_basic_za_test",
+		            help="Enable test for basic SME ZA support",
+                    action="store_true")
+parser.add_argument("--gdb_tile_slice_test",
+		            help="Enable test for ZA tile slice support",
+                    action="store_true")
+args = parser.parse_args()
+
+if args.gdb_basic_za_test:
+    BASIC_ZA_TEST = 1
+if args.gdb_tile_slice_test:
+	TILE_SLICE_TEST = 1
+
+main(run_test, expected_arch="aarch64")
-- 
2.34.1


