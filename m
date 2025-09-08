Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BEBCA1016
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 18:30:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvgc5-00081X-F8; Mon, 08 Sep 2025 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbs-0007zN-L1
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:29:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbe-0001BN-8t
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:28:59 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GOIFr029406
 for <qemu-arm@nongnu.org>; Mon, 8 Sep 2025 18:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5kvK2Zbx18K
 SbtZ55xiDNMiC1rLFrM21UQJLE860tI8=; b=cyzVlUFwVlleO/KxB+IHCx7gHwR
 /pRtKwUGG4dyqX3CRomGGrhC0rtLEYL6f99cZ643DduHx2LGYowFzw5Ru89yyj2v
 2MOOGjRQgoZnbl+zMfAJ4dL89WTILR+JQzVlydm+sIrKv0QWxUhCgsNruQ4Ws02b
 85sTna4PU/ziOX/KpSla9gf2lbZgfGvjxKCFInpPwkjAUN5W0H9FLZTo2Inz2WOH
 Pbl+f0IdxNv9Z5N/3COt0ESGMbWAwkmLZPI0gOVCfj0oF6qB4XlGYjW4Q+pL3NjM
 HRoEbiMIb/H4b+Y2v0db8GB6rbI5jkg24mNUTyfWVbdBce3zyvpxyZ65yYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8wppp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 18:28:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4c949fc524so3686507a12.2
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 11:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757356119; x=1757960919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kvK2Zbx18KSbtZ55xiDNMiC1rLFrM21UQJLE860tI8=;
 b=NPdMDZ2CNwOmenWGaN+D2W8h1Ari2M1Fn9eeitU3BL65IapWETak2Srh0trFO9ojvF
 fGf16leDN/efhpJUpCcce4ge3tAElhkOLOnRbv9HCGhQ4+OuosPp2m4QoclJp0xfU8v7
 VGZmLgklNTZpe+brVoyxEnB9sFPaUCOh3ru3JnJyhmGgZmVHEfGmBU55au2BtAy/J/gn
 uSNLWKH2RBnoAtMixmr5jLUPg/9d41IKydkBfXVg2Mhxn/9D9vGz0FFZTeL+yXIykFtW
 RrFleIXYdHcI4P5rBYR3IRptlmpspZ2d2hwKWEogP+hJGSw40XzRY5lrQwzbicka0GeM
 2usg==
X-Gm-Message-State: AOJu0Yy7M0Cx9gKH37eq0tpBTp1yORnY8nIjNBhHUmwns7fO46LQZKaH
 EG1flKEkh8CZ36td9U/5jmvSJyf1EQ78qEcLUJFStV39K5XtE4j1uPxcZPGnjtJU8vmIF8U/zMg
 IBfv6xSfuR2E9OzHZHYDS9VS0fvfbpPJHuCLIfd18Flsk5P9CH/zU9j8=
X-Gm-Gg: ASbGncsfB4Pguh5qy2P7oEspt5cTgsWRKTGpq43iwOr96hHpMQH6+Wul/v145LkSCxw
 0YWCKmRm0qATIURrEwHPf0hy0+yaVXnfyIpblg3N0fJN+mnyY9ctw/6yo756Xb//AXEzUGh99EW
 aSwEY3SH28ZkpYt6P4+GMuLJ7KsXYOZUaiXpgLIAa5kjHrC03Wtrs87R9fZjA5EAemBvneB9GyM
 6QtQKrdA5ZhdSzgCay+WTEASgFoWldbPZfEeGVsrxcDg7A5s1OItihy9uxarah6eNFP7o9tpSWy
 egb/93OuowFNhxQHtHPNCOepDwDCQS4YE8yIbXcfXEi3APxiyZYh3GnTusBj7gYm4tm1mXLGX46
 ylsXr+KKNgvSJueI=
X-Received: by 2002:a05:6a20:9184:b0:251:e4b4:7a37 with SMTP id
 adf61e73a8af0-2533fd956b8mr14460968637.19.1757356119356; 
 Mon, 08 Sep 2025 11:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFum+csjEs7j5pwEm3dPD3XQBJuekdLEcDs89Ufxyf0P01sRmq1HZiknm8O7cElTbz9htywzw==
X-Received: by 2002:a05:6a20:9184:b0:251:e4b4:7a37 with SMTP id
 adf61e73a8af0-2533fd956b8mr14460916637.19.1757356118804; 
 Mon, 08 Sep 2025 11:28:38 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4f9c35f391sm15480164a12.25.2025.09.08.11.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 11:28:38 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v7 3/3] target/arm: Added test case for SME register exposure
 to GDB
Date: Mon,  8 Sep 2025 18:28:34 +0000
Message-Id: <20250908182834.2476277-4-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908182834.2476277-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250908182834.2476277-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bf2058 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z_9JEIKELzp6YBcrEJoA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: SafAKFGmdwzeHMydk3Psis3rmo9wh_dr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0dK/F8n+VXHn
 e6SO8WMUGBdzFOJazPL3jqLUurrNba6Dj03i3Wonx+vG/ujg3vjpTl60Q1I5MSKRsGcooM/pizB
 aNlS7IMLpgB/SMAqIx5UZixoFTnocYjIdd6joQ2FWR+1AjWLiryIIQWM6LCSqP97cx1UbTiWSj2
 u9ABTsyeSMjinc7ABmLl7+45cIatBJ4d6ifdLg9aIBrXPf5tAQo9YiOCN2ugE8g8eGySezUJ157
 seaCs6m9ImQSzlYkbp81Y9+L8hyV6MmKaDXguaWl82M0vo4Hr4U08xHxKvliPVE+vNwf7T1GISe
 kuj4KCgV8IPPbTy8MOLYc4nG0mpx8uopUHS+6cYmclx53YoTfCRZ+cBopXbFWO/VwqLE295dgAb
 FJ4Fnfay
X-Proofpoint-ORIG-GUID: SafAKFGmdwzeHMydk3Psis3rmo9wh_dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Changes since v6:
- added functionality to skip ZA quadword and doubleword
tile slice tests when the detected version of gdb does not
support SME tile slices
- added functionality to skip ZA quadword tile slice test
when the detected version of gdb does not support casting
gdb.Value to a 128bit python integer
- cleaned up testcase and made it more compact with additional
comments
---
 configure                             |  11 +++
 tests/tcg/aarch64/Makefile.target     |  51 +++++++++++
 tests/tcg/aarch64/gdbstub/test-sme.py | 125 ++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme.py

diff --git a/configure b/configure
index 274a778764..8de18e755f 100755
--- a/configure
+++ b/configure
@@ -1839,6 +1839,17 @@ for target in $target_list; do
           echo "GDB=$gdb_bin" >> $config_target_mak
       fi
 
+      if test "${gdb_arches#*$arch}" != "$gdb_arches" && version_ge $gdb_version 14.1; then
+          echo "GDB_HAS_SME_TILES=y" >> $config_target_mak
+          if version_ge $gdb_version 16.1; then
+            echo "GDB_HAS_128BIT_INT_CAST_SUPPORT=y" >> $config_target_mak
+          else
+            echo "GDB_HAS_128BIT_INT_CAST_SUPPORT=n" >> $config_target_mak
+          fi
+       else
+          echo "GDB_HAS_SME_TILES=n" >> $config_target_mak
+      fi
+
       if test "${gdb_arches#*aarch64}" != "$gdb_arches" && version_ge $gdb_version 15.1; then
           echo "GDB_HAS_MTE=y" >> $config_target_mak
       fi
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 16ddcf4f88..954bc3139a 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -134,6 +134,57 @@ run-gdbstub-sve-ioctls: sve-ioctls
 
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
+run-gdbstub-sysregs-sme-doubleword-tile-slice: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py \
+		-- test_sme --gdb_doubleword_tile_slice_test, \
+	gdbstub SME ZA doubleword tile slice support)
+
+ifeq ($(GDB_HAS_128BIT_INT_CAST_SUPPORT),y)
+run-gdbstub-sysregs-sme-quadword-tile-slice: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py \
+		-- test_sme --gdb_quadword_tile_slice_test, \
+	gdbstub SME ZA quadword tile slice support)	
+
+else
+run-gdbstub-sysregs-sme-quadword-tile-slice: sysregs
+	$(call skip-test,"gdbstub SME ZA quadword tile slice support", \
+	"selected gdb ($(GDB)) does not support casting gdb.Value into 128bit python integer")
+
+endif
+else
+run-gdbstub-sysregs-sme-doubleword-tile-slice: sysregs
+	$(call skip-test,"gdbstub SME ZA doubleword tile slice support", \
+	"selected gdb ($(GDB)) does not support SME ZA tile slices")
+
+run-gdbstub-sysregs-sme-quadword-tile-slice: sysregs
+	$(call skip-test,"gdbstub SME ZA quadword tile slice support", \
+	"selected gdb ($(GDB)) does not support SME ZA tile slices")
+
+endif
+
+EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-doubleword-tile-slice \
+			  run-gdbstub-sysregs-sme-quadword-tile-slice
+			  
+endif
+
 ifeq ($(GDB_HAS_MTE),y)
 run-gdbstub-mte: mte-8
 	$(call run-test, $@, $(GDB_SCRIPT) \
diff --git a/tests/tcg/aarch64/gdbstub/test-sme.py b/tests/tcg/aarch64/gdbstub/test-sme.py
new file mode 100644
index 0000000000..bad80f9925
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sme.py
@@ -0,0 +1,125 @@
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
+DOUBLEWORD_TILE_SLICE_TEST = 0
+QUADWORD_TILE_SLICE_TEST = 0
+
+def run_test():
+    
+    # Run the requested test(s) for SME ZA gdbstub support
+
+    if BASIC_ZA_TEST:
+        run_basic_sme_za_gdbstub_support_test()
+    if DOUBLEWORD_TILE_SLICE_TEST or QUADWORD_TILE_SLICE_TEST:
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
+            report(int(v) == 0x1, "%s is 0x%x" % (reg, 0x1))
+
+def run_basic_sme_za_tile_slice_gdbstub_support_test():
+
+    # Test if SME ZA tile slices, both horizontal and vertical,
+    # can be correctly read and written to. The sizes to test
+    # depend on which tests are requested (QUADWORD_TILE_SLICE_TEST
+    # and/or DOUBLEWORD_TILE_SLICE_TEST).
+
+    sizes = {}
+    if QUADWORD_TILE_SLICE_TEST:
+        sizes["q"] = "uint128_t"
+    if DOUBLEWORD_TILE_SLICE_TEST:
+        sizes["d"] = "uint64_t"
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
+                    report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
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
+                    report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+
+
+parser = argparse.ArgumentParser(description="A gdbstub test for SME support")
+parser.add_argument("--gdb_basic_za_test",
+		            help="Enable test for basic SME ZA support",
+                    action="store_true")
+parser.add_argument("--gdb_doubleword_tile_slice_test",
+		            help="Enable test for ZA doubleword tile slice support",
+                    action="store_true")
+parser.add_argument("--gdb_quadword_tile_slice_test",
+                    help="Enable test for ZA quadword tile slice support",
+                    action="store_true")
+args = parser.parse_args()
+
+if args.gdb_basic_za_test:
+    BASIC_ZA_TEST = 1
+if args.gdb_doubleword_tile_slice_test:
+	DOUBLEWORD_TILE_SLICE_TEST = 1
+if args.gdb_quadword_tile_slice_test:
+	QUADWORD_TILE_SLICE_TEST = 1
+
+main(run_test, expected_arch="aarch64")
-- 
2.34.1


