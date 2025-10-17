Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6D6CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:31:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9mPw-0005N1-NQ; Fri, 17 Oct 2025 11:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9mPk-0005ET-E4
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:30:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9mPd-00015g-Jn
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:30:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so19389565e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760715032; x=1761319832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=psius4cHlJsmBDgSNlELg8TK6nCqMNbS0nYX0Lh5t7o=;
 b=Mqiechj7ANj+AvTQHr4LtS/GbweNWhCxDkhw1/s+p6wQjwYJAXXHcWP5HbMOM5RZjB
 kEvpqRrqYF1TdL14LG+rjvKBJGsIo75NZcXh4iXJIlqhMEucVH7T1dU1iwgMbfPBCk+h
 lhN8t6uP0uvaRmnbqUnDz+3ubXZsp2+Po0zkzwhN1z1jqKslR94XMfVCbjcpCkmYjiht
 Wh5auNossL86tGEGCn+NYkHI+aGoY0C79aznKjrf1VclRp2F/VJP/Bs42h9HHFxq7Bxq
 JI2HIN+2tj5Av0DPYhQFq6dbx5TMlCDYSVlqL38mSc4E8QHPKntQ3SxBt6fmlr1aqEP0
 NYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760715032; x=1761319832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psius4cHlJsmBDgSNlELg8TK6nCqMNbS0nYX0Lh5t7o=;
 b=BvjPs5HLfVRKFROw1tyT9UfOlre1I9qWs0LstP0WPn1dP+WW8LKsnhxQ6c0tjYdo4S
 3seZ15bj7h6xerCtPsiH7psfDjvkrViMHi4pF6Gko00c9PYFwhVrLHLO2Wrp+QOSWWrO
 0gzVIAvwoBHft+/2Z38WL8jNYqfn3j2EgNgjTbRgNShIfZA/C0w7cdVtustAxOQ5HuPS
 46PwGLKWcKKshTg1FyHOoizw9hs7VgsL5iuR+fNlie+0emV9WaoZqfPRlauNHjHElWuq
 QElKysfOCgUouv2jGrb741FZ2rs1T2eA1YmMQZHRyWUCMHRN6ZSOJSsvt+nN3TLDIuQP
 kANg==
X-Gm-Message-State: AOJu0YztL/gsZa1szsd/E21DQo2W0Qa/1WLFloL3JiuRtzKUwn3Gfxf3
 w55eUg2dq1Ze9S44wlAMTo3kCxm7rxgnnKwxngSFdxdUrIaW2hYRJZeVPj206gHpvNyekRtzjZr
 JOdWi
X-Gm-Gg: ASbGncurgCJoLS1gZ6T3/rKP/E888laZLUM9PMZV/bykQfn5vQEZWj7IiAtDLTfOqDP
 ufyz+OHZ83lXK0TVP6yjQGZfaxNMPJXfZ7kp1k9CAtLmFG6l7dDtxK2EzesMzk1VzulS+pPQGKQ
 hx2e3VFKACGhe5a1WIJqRzYerPGHT5OsnCg4y9Y1z1TLLgopDkt2wgq5yxaY08+P2XiMoypFVO0
 LGAs17j7K31R1L1EZuxYkWboGRJTXrqIvYl8GM9hPGFEJ3Efu6QqTBZOZxh2j8Bid9FpvVOpHh0
 GPLFJN/uLKCpn9goaOpjqiQRmIVaNLRE9fKBP+/+qOKd7BkWCqRNwVycqVE4IMNA41W5YEagEWg
 +hh3eO+4Cg/C+cd0gaFWe4hT2RstfBMmJ6BbhF5Y+dAjjvlAsIjUE77HmUJCKmQHP3j80afbKwB
 PUga4Pjw==
X-Google-Smtp-Source: AGHT+IF7jINcGz/mkOYP+Ez6vnPD2vp8sCWWCPL2D3TgUpGrrXYwcdETQZlw+BdyZFjiSAli3KQBEg==
X-Received: by 2002:a05:600c:5026:b0:470:bcc4:b07c with SMTP id
 5b1f17b1804b1-47117925d38mr35605855e9.37.1760715032157; 
 Fri, 17 Oct 2025 08:30:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144d17cdsm85038635e9.18.2025.10.17.08.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 08:30:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v2 3/3] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
Date: Fri, 17 Oct 2025 16:30:27 +0100
Message-ID: <20251017153027.969016-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017153027.969016-1-peter.maydell@linaro.org>
References: <20251017153027.969016-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
 tests/tcg/aarch64/Makefile.target      |  9 ++++++-
 tests/tcg/aarch64/gdbstub/test-sme2.py | 36 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
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
index 00000000000..a1663fac658
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sme2.py
@@ -0,0 +1,36 @@
+#
+# Copyright (C) 2025 Linaro Ltd.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+#
+# Test the SME2 registers are visible and changeable via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+from test_gdbstub import main, report
+
+
+def run_test():
+    """Test reads and writes of the SME2 registers"""
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


