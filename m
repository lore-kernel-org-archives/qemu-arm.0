Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517DBCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 19:38:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulYL6-0007Ji-84; Mon, 11 Aug 2025 15:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKn-0007Ea-MH
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKT-0003sJ-Mt
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BIwXtZ008762
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oeFCTcBeYBu
 AaNVMoPz5tm7BdWNU7A6jatOQ6V3bflg=; b=fYk00oh16WmjmWtnJInz1VQsMHN
 JFG14giDhCTgLVNTpXn2LN6MViKVVzSb2z40fc6F0EijDfWCSKzmwCYDkEWjcZwH
 jlrlOyLxGu7+7ZsW4/66zFTRaKGSBSF/lEJSDJPQ7LNTs1DayYB4LEnijocnSRw7
 z1ae4aR1npCfxAFin6wAZVm6eozw9eI1fS1Tby5VjiLDk0dXk1z9TC6qCP0Za4zL
 kTCVhZ8AQGVYYBPWj22rpIpNbOJ8SOVM7XhksQbM7jQkuc/3inouy8pGAaK6V9TB
 LlShzbifmBA0fCCLs/YuHFPyJhT0Iykm0E47xyhEYOT7zp+s2hAVVq8g0Iw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjhevd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76bcd829ff1so4450446b3a.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 12:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754941022; x=1755545822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oeFCTcBeYBuAaNVMoPz5tm7BdWNU7A6jatOQ6V3bflg=;
 b=TPLJPJOS4yT0pXaR7MbL5MNDBU8aJj2CYkCGm07xsqu9pJNrWD1SBdKOclQzAVPMhL
 8Q9wz4gG+i0y7F1RjormoPTxTvlK/NhN4o4LrvuSilwvf4dXkHISZpJ70UK6DYEx0u9x
 wa5Jk3VVcn14Yizv77uGwSZzD+EN4VzZgF/2rad1hYlzhXUh9Jmjl5d3jJ2XKK/Q/UUi
 NBhPlSLO/W7UWH+fy0PpYqapZ8HgAe8oQB3sA8xWWEyo7Wb3OIUWEff5HrmrMaRd+iOg
 nPIPnWPSjeQ77gzkGO4RBQMau1h0TNnrFozf7CosfGOqm+SmjH+Uo5MVRG/jqIQrbD9i
 6hLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYpki4uGF3cFH0X/e2M1VvbeURi3mukZGWboexTQybvQ15uKAVXW4gtCzo3CSnjKKBQQDyqIJz2A==@nongnu.org
X-Gm-Message-State: AOJu0Yz0BmO6fRx0mPkf8Y1W1JgYymgph7mPVKUrfb6ObWT98jECfe6F
 iMATircupuXi0xVfJNKQs4ZAcXumekmJxB1yYJ75AHAyBfSaDSOTCqXvnZ0NIi5hSmboLQUE6/3
 Ygs/wgTlwnIie6kd0ezwKNMp5dv0jPbTAsrGroh14dafkd/Uu3zJWduo=
X-Gm-Gg: ASbGnctqlvTrG0fiM1nlpQSiROFXfn1Ku1x/rBB1WORMESkGTcpDCY0G8Q+s6sFw1vg
 rN0PaQ1iVtdly9PTcGImgXhdUHSOBiJQGthy9HPnUpvM9sa6lf2ERMWN/lats+6+v3RGJoOgjsF
 2eBpZNf/m4oqK5k4LKri/0c8q4eoQHhIu6vlyBpXMaF+KcKWVKordw4a78VYgDWQbyhf1Bx2p2F
 GmReG88FFiIzxdwpJ4TgWRbi861kPxCgUvSGHHy5Y5cemjXzqFRomCX5xH9C1/b1d6IyY7gLbdu
 7CEyQTvcn754hvT4o4+6fuwZ7YgO4idpZ2KVa3fJ2ZfUi05xAii9ejsFJoey7RX4+lLRWCgUMGP
 lOxonE7htFGt2fI8=
X-Received: by 2002:a05:6a20:3944:b0:23f:fbb1:c21b with SMTP id
 adf61e73a8af0-24055046d01mr23603456637.17.1754941022320; 
 Mon, 11 Aug 2025 12:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNK6WAXYBIufEApoPMX97MHuwAocEaR3meWsnutyVRxqqNJv9Aoff5E/Xn/5+qA3fM3rtxkQ==
X-Received: by 2002:a05:6a20:3944:b0:23f:fbb1:c21b with SMTP id
 adf61e73a8af0-24055046d01mr23603411637.17.1754941021818; 
 Mon, 11 Aug 2025 12:37:01 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcef6sm27677171b3a.85.2025.08.11.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 12:37:01 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v5 4/4] target/arm: Added test case for SME register exposure
Date: Mon, 11 Aug 2025 19:36:54 +0000
Message-Id: <20250811193654.4012878-5-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX15D6xF+sgpxy
 BdLDcGJ7yen+mMEtPIHBC3r7NxFHcYRsXwQuti0d8+fWQMYUijX4tnPaaSKA0e2wW/Bi8aNcFxC
 1ZggArUvOtSsDQurUv2JgLHrZLeMAGa9ZzB5k0rekRSJmH/rzf6GIT6W5Dx13rRzu+J5oqRoT6F
 T/083JxcO8Q/qME2Vrezetz+BahlisQJ987tSv0rfC95GxlLqjWphZZeNR9lSRvWDisvdHnzStv
 J7neLNlRFmG1KTJTCkJRtUElXzJF7IPrMrNq8e7/zz82XQFRn7y1X3VBYc2MrRGM4Mp5l4rGH+9
 Y5N7oHXgnKP8sW8BLviSreoYZvVpqdDZ07xULX/7Knm8H1uJld2JSLI1QOHsdrCbWhwjqDtGQfv
 356c9Tal
X-Proofpoint-GUID: _ISQ6aXWXmv278ODR-PH5yII0X8OhEUa
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689a465f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hapuXSQWAQPwXaHXDnUA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: _ISQ6aXWXmv278ODR-PH5yII0X8OhEUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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
Changes since v4:
- this patch was not present in v4, it was added based on
suggestions during the review of v4
---
 configure                             |   6 ++
 tests/tcg/aarch64/Makefile.target     |  23 ++++-
 tests/tcg/aarch64/gdbstub/test-sme.py | 119 ++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme.py

diff --git a/configure b/configure
index 825057ebf1..177d3775ac 100755
--- a/configure
+++ b/configure
@@ -1837,6 +1837,12 @@ for target in $target_list; do
           echo "GDB=$gdb_bin" >> $config_target_mak
       fi
 
+      if test "${gdb_arches#*$arch}" != "$gdb_arches" && version_ge $gdb_version 14.1; then
+          echo "GDB_HAS_SME_TILES=y" >> $config_target_mak
+       else
+          echo "GDB_HAS_SME_TILES=n" >> $config_target_mak
+      fi
+
       if test "${gdb_arches#*aarch64}" != "$gdb_arches" && version_ge $gdb_version 15.1; then
           echo "GDB_HAS_MTE=y" >> $config_target_mak
       fi
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 16ddcf4f88..1a33ef17a0 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -132,7 +132,28 @@ run-gdbstub-sve-ioctls: sve-ioctls
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
 	basic gdbstub SVE ZLEN support)
 
-EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
+ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
+# SME gdbstub test
+ifeq ($(GDB_HAS_SME_TILES),y)
+run-gdbstub-sysregs-sme: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py \
+		-- test_sme --gdb_sme_tile_support, \
+	basic gdbstub SME support)
+else
+run-gdbstub-sysregs-sme: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme.py, \
+	basic gdbstub SME support)
+
+endif
+endif
+
+EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls run-gdbstub-sysregs-sme
 
 ifeq ($(GDB_HAS_MTE),y)
 run-gdbstub-mte: mte-8
diff --git a/tests/tcg/aarch64/gdbstub/test-sme.py b/tests/tcg/aarch64/gdbstub/test-sme.py
new file mode 100644
index 0000000000..c2b9d774ae
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sme.py
@@ -0,0 +1,119 @@
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
+
+def run_test():
+    "Run through the tests one by one"
+
+    frame = gdb.selected_frame()
+    rname = "za"
+    za = frame.read_register(rname)
+    report(True, "Reading %s" % rname)
+
+    for i in range(0, 16):
+        for j in range(0, 16):
+            cmd = "set $za[%d][%d] = 0x01" % (i, j)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+    for i in range(0, 16):
+        for j in range(0, 16):
+            reg = "$za[%d][%d]" % (i, j)
+            v = gdb.parse_and_eval(reg)
+            report(str(v.type) == "uint8_t",
+                    "size of %s" % (reg))
+            report(int(v) == 0x1, "%s is 0x%x" % (reg, 0x1))
+
+def run_test_slices():
+    "Run through the tests one by one"
+
+    frame = gdb.selected_frame()
+    rname = "za"
+    za = frame.read_register(rname)
+    report(True, "Reading %s" % rname)
+
+    for i in range(0, 16):
+        for j in range(0, 16):
+            cmd = "set $za[%d][%d] = 0x01" % (i, j)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+    for i in range(0, 16):
+        for j in range(0, 16):
+            reg = "$za[%d][%d]" % (i, j)
+            v = gdb.parse_and_eval(reg)
+            report(str(v.type) == "uint8_t",
+                    "size of %s" % (reg))
+            report(int(v) == 0x1, "%s is 0x%x" % (reg, 0x1))
+
+    for i in range(0, 4):
+        for j in range(0, 4):
+            for k in range(0, 4):
+                cmd = "set $za%dhq%d[%d] = 0x%x" % (i, j, k, MAGIC)
+                gdb.execute(cmd)
+                report(True, "%s" % cmd)
+        for j in range(0, 4):
+            for k in range(0, 4):
+                reg = "$za%dhq%d[%d]" % (i, j, k)
+                v = gdb.parse_and_eval(reg)
+                report(str(v.type) == "uint128_t",
+                    "size of %s" % (reg))
+                report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+        
+        for j in range(0, 4):
+            for k in range(0, 4):
+                cmd = "set $za%dvq%d[%d] = 0x%x" % (i, j, k, MAGIC)
+                gdb.execute(cmd)
+                report(True, "%s" % cmd)
+        for j in range(0, 4):
+            for k in range(0, 4):
+                reg = "$za%dvq%d[%d]" % (i, j, k)
+                v = gdb.parse_and_eval(reg)
+                report(str(v.type) == "uint128_t",
+                    "size of %s" % (reg))
+                report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+
+    for i in range(0, 4):
+        for j in range(0, 4):
+            for k in range(0, 4):
+                cmd = "set $za%dhd%d[%d] = 0x%x" % (i, j, k, MAGIC)
+                gdb.execute(cmd)
+                report(True, "%s" % cmd)
+        for j in range(0, 4):
+            for k in range(0, 4):
+                reg = "$za%dhd%d[%d]" % (i, j, k)
+                v = gdb.parse_and_eval(reg)
+                report(str(v.type) == "uint64_t",
+                    "size of %s" % (reg))
+                report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+        
+        for j in range(0, 4):
+            for k in range(0, 4):
+                cmd = "set $za%dvd%d[%d] = 0x%x" % (i, j, k, MAGIC)
+                gdb.execute(cmd)
+                report(True, "%s" % cmd)
+        for j in range(0, 4):
+            for k in range(0, 4):
+                reg = "$za%dvd%d[%d]" % (i, j, k)
+                v = gdb.parse_and_eval(reg)
+                report(str(v.type) == "uint64_t",
+                    "size of %s" % (reg))
+                report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+
+
+parser = argparse.ArgumentParser(description="A gdbstub test for SME support")
+parser.add_argument("--gdb_sme_tile_support", help="GDB support for SME tiles", \
+                    action="store_true")
+args = parser.parse_args()
+
+if args.gdb_sme_tile_support:
+    main(run_test_slices, expected_arch="aarch64")
+else:
+    main(run_test, expected_arch="aarch64")
\ No newline at end of file
-- 
2.34.1


