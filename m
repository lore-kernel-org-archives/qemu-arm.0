Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAFECCD194
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 12:27:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9N0k-0000IC-1c; Thu, 16 Oct 2025 08:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9MzP-0006EJ-Cf
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 08:21:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9MzI-0000YE-Fd
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 08:21:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so7408255e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760617300; x=1761222100; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gX9CHLtUQzQsqafvh1D9/xpeNHhLNsIOOlPyJTczAG0=;
 b=SoJlCJbNwYuM0cskrbBk1tCDtnVz2eucg0nr6VUnQsT8dtlF+K3e40WqnIVWLw9cM3
 hCvs16bOuRhnbJ7QGXLvIrKXUNTzBJ57fKsXWpXpbrASVJzfM0i5MeEDpk31oI+FXQFR
 noJWhr0UBJWgXvaTXN/Ve92o2y0jCMNNqilHnafSO66cTft4epnyYVHFGxbygAkowbqQ
 d3Bmd8UaePnLfEIs/HJ2lpztvqSPxpWYYKuT9ENCCCvtahvj4jHUWhcRmw2JbaXFyCtJ
 hqUHFu++BuIpqlaTamXP+2B3hW5m4PSbGsz/5ywU3Gs3OJeolb4gLiOBeMo/sZJIL7Mf
 D05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760617300; x=1761222100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gX9CHLtUQzQsqafvh1D9/xpeNHhLNsIOOlPyJTczAG0=;
 b=dTH6+PYTJotTsBgoPPM1TA+O1OgeT6o60KtOtgi6JcnTswcUsLaE4DpY2w/NqrkpMZ
 qNvpjd5ILWE3vnU76fVsPtycD8uqSrz56YTILs9D52VWBvExdt51Er5NoPO6eC+iG5R0
 dAtQqPo6RGa3Mkjv1xiaS5t08azfLu9Kll/32kpFtdHwiPufSTpcuhlHdSAW1oQ47FK+
 l7oAsc/CmdIrsFl8XcaP4+BSPq7VOFR/9MtubTKhoTJzQhzzhfdIig55p7k6RuVSKy8k
 bKGZcRdvH+one+1gWrG2pelgrWXOUU8f2iQCBFX4IdmzeiGhVA9Mjd1yVMQessvVc2Yc
 LB5A==
X-Gm-Message-State: AOJu0Yy/yzQIb6iNkvbS+QN72Yc/X/3xSAp43L6nHi0B4jtY+96pTDIS
 9Tp+IaGMkpDU6S6+7O0TSnY04gtNZXYV3sNEIFC9QSI++yyHJzNvF/jkwvSrPGWmVpmRg/vmP/G
 bNnZD
X-Gm-Gg: ASbGncsZPT0Lr0y+RnImrTCS50MThEzA2rYPXtgGJqn7a+JZmaKjWR7ZkmJSc1v0X8R
 U3thJCqtzqDEsMz7MagPPewzAQUsMZQgwF5arpUFhlELx9V/z469yQm2m016dTPBvJUDI+ZLhq9
 ufNNjUdbDbWoEoUYJ6cvY6op3ZhBu19zT9KhOIrSdbrifISNVJoUprzqcyXiMfczGlUSs12uOMJ
 srnqZBlKUHfrSxBZvDWvw/fPOMnAmq1yB7NMx7kJ5j7JsWpVVSBh2BaW1mxz7Wwl6Cif/2QTwpp
 qHApL502EBjRz7tqx/e7mzS94AN41oS9UoeE0SHSd38beVjKEhzPqvxrjZdIJE0iQpFRv4kZWXw
 voTM4f42HoUXrMky9POUTNN3hMwaLPdhdcC9uim1MgmY6QhZvgeVZYbJTN2jk0aeCM1qzwn9GxL
 aDcLnE9GgM3A==
X-Google-Smtp-Source: AGHT+IGPMAj6OtELXZZ/34tlacL08Jh1Co154afKw23slH2RJDiPuDZPXSh3jdw6LBjZU3G55H9icA==
X-Received: by 2002:a05:600c:3d87:b0:45b:7d77:b592 with SMTP id
 5b1f17b1804b1-46fa9a9ede8mr228152475e9.12.1760617300520; 
 Thu, 16 Oct 2025 05:21:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ff65596csm3412428f8f.24.2025.10.16.05.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 05:21:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH 2/2] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
Date: Thu, 16 Oct 2025 13:21:32 +0100
Message-ID: <20251016122132.737016-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016122132.737016-1-peter.maydell@linaro.org>
References: <20251016122132.737016-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Test the SME2 register exposure over gdbstub, in the same way
we already do for SME.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/aarch64/Makefile.target      |  9 +++++-
 tests/tcg/aarch64/gdbstub/test-sme2.py | 41 ++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 55ce34e45ee..9fa86874534 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -164,7 +164,14 @@ run-gdbstub-sysregs-sme-tile-slice: sysregs
 	"selected gdb ($(GDB)) does not support SME ZA tile slices")
 endif
 
-EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-tile-slice
+run-gdbstub-sysregs-sme2: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sme2.py, \
+	gdbstub SME ZA tile slice support)
+
+EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-tile-slice run-gdbstub-sysregs-sme2
 
 endif
 
diff --git a/tests/tcg/aarch64/gdbstub/test-sme2.py b/tests/tcg/aarch64/gdbstub/test-sme2.py
new file mode 100644
index 00000000000..1d189ac01ca
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sme2.py
@@ -0,0 +1,41 @@
+#
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
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
+
+def run_test():
+    """Test reads and writes of the SME2 ZT0 register"""
+    frame = gdb.selected_frame()
+    rname = "zt0"
+    zt0 = frame.read_register(rname)
+    report(True, "Reading %s" % rname)
+
+    # Writing to the ZT0 register, byte by byte.
+    for i in range(0, 64):
+        cmd = "set $zt0[%d] = 0x01" % (i)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+
+    # Reading from the ZT0 register, byte by byte.
+    for i in range(0, 64):
+        reg = "$zt0[%d]" % (i)
+        v = gdb.parse_and_eval(reg)
+        report(str(v.type) == "uint8_t", "size of %s" % (reg))
+        report(v == 0x1, "%s is 0x%x" % (reg, 0x1))
+
+main(run_test, expected_arch="aarch64")
-- 
2.43.0


