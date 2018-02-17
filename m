Received: by 10.28.71.27 with SMTP id u27csp2069896wma;
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
X-Google-Smtp-Source: AH8x2247vm66PYh/KVQXYMtWfi9qirvPV4EfCj5uEmpGHusXReb3AKDp9NQSkoXYSBrZmrTzjg+r
X-Received: by 10.37.102.82 with SMTP id z18mr6091217ybm.226.1518891848749;
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518891848; cv=none;
        d=google.com; s=arc-20160816;
        b=NVykwXjVXnGayqpxFk7Te7/jF+kgiRC8kf5mtDdK1Zg93jVP4WNvtgKYOF/nvtHvR7
         LtDgAE50qUq0o9hVAx+WoBnPR9wz4qoZpBrYaovRblHRaUlZW3K5nDFe4wWSzdr6T2Is
         EeE5JZ5jgosESVJkcZMAr6lzPmEidCcSVt1TUR9uSJMk7gO2GVbK0vTr8NXN2hNb1OJc
         zHVqfv1WP6sF/o3vMJdSpACwHAArDed0AP2IiSw68b660Df+/BrQag6w2RtjAuKra24h
         WTE0OmS8rFwYt5KQWvdP+cthzDSVZARIyTPIQPJshBAiooJpANhe1D5uy4m02SrIsvWy
         Znfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OB6hZuzKEdcsMV6fxaOMHmbJji7y30odOZxKDC955Eg=;
        b=WTmDaoPYm0vof2ukHKzBL8CXKJ3WpDD6GpVBHhT7IC3JjKaeYeCosP2aikWhFjOi/P
         2y+0wH9yuyRvmDOcvpOrY6rqG4pchk1U7bz0pj4umEBaviILK9nz4mjzRn2pod442VAC
         l7AK9VS9BKYp+G/ziXg37K33nHELAV6WTtlMzj85qeThDd/U0JSR5qw6SkLRS3sCTfoz
         FuZmZWf4/Nl1eb3kaAWyVVRDMjakh6Y6ch7BQKS0tHhzBI6mPpyXZPiTmVULKwRlz5Yb
         SQxKII0aMCLySeDLbm9GS9MWdkyS/Ls2vtoDJql7Etya8irSdl1Jaui4SIAuR6pIY1O6
         jjJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c6YW+HiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j80si595318ybg.161.2018.02.17.10.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c6YW+HiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en79b-0000RL-Vo
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:24:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en794-000062-D2
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en792-0001SL-Q1
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:34 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:32840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en792-0001S5-Fv
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:32 -0500
Received: by mail-pl0-x244.google.com with SMTP id t4so3446819plo.0
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OB6hZuzKEdcsMV6fxaOMHmbJji7y30odOZxKDC955Eg=;
	b=c6YW+HiO4jW5Mmcf4gnYNpIVEXUf4QNj+U0Jg2oowSjDC0/ZqeWs9lzweX5V16/RKJ
	lSUVOLET4GjNSOWuwZRZRzuYPhWNwVu0TZiXefinbqdJBHwf2XCQfLlbYiUc+pCRAQMe
	P0XdPf3Vl95L3SlIH1V5h55EZ507BMGvLRDCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OB6hZuzKEdcsMV6fxaOMHmbJji7y30odOZxKDC955Eg=;
	b=YCKC9Rp+pjSBELv3zmCkEsykSYMwgRCt9k3OFJBi4xghUnQ+fddM5vYe7zbCwBY1Aw
	iLgJoOD9PzEcyHRkfS677lbpJawFqGNWK39Q95RqMmwDaM8eFd8RjGYXmU43ezmlkjsL
	Unitm+73VhTM+a7DfsxW/YCVsbBtk+5Z9477Y5mhp8eC058OxHaP86VfLbWjoJqr7NSz
	4r1kT1sDk28TR9W00ZXssfl2BaUM5a2QWd/6oJm5YaOI7BaGJ/X9alvv7RHN69kAiCgG
	QKBANhkmg4RqGvO/lr5O/KOedNIEPAg+T3vtG7VuqTRE8ycZYnq8GTNR4HN/bKRLtbar
	97PQ==
X-Gm-Message-State: APf1xPAJ47s5abrAQjqPeM5DZ9zUal4+VptzHGW/aTSUVOsvo89vrcPt
	hR/PUwiA9VdQE1vliVpOeGskWpResOw=
X-Received: by 2002:a17:902:6e8c:: with SMTP id
	v12-v6mr9359642plk.424.1518891811558; 
	Sat, 17 Feb 2018 10:23:31 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:19 -0800
Message-Id: <20180217182323.25885-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 03/67] target/arm: Add SVE decode skeleton
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZ0CM94L3WVQ

Including only 4, as-yet unimplemented, instruction patterns
so that the whole thing compiles.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 +++++++-
 target/arm/translate-sve.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 .gitignore                 |  1 +
 target/arm/Makefile.objs   | 10 ++++++++
 target/arm/sve.decode      | 45 +++++++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/translate-sve.c
 create mode 100644 target/arm/sve.decode

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e0e7ebf68c..a50fef98af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12772,9 +12772,18 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     s->fp_access_checked = false;
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x2: case 0x3: /* UNALLOCATED */
+    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
         unallocated_encoding(s);
         break;
+    case 0x2:
+        if (!arm_dc_feature(s, ARM_FEATURE_SVE)) {
+            unallocated_encoding(s);
+        } else if (!sve_access_check(s) || !fp_access_check(s)) {
+            /* exception raised */
+        } else if (!disas_sve(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
     case 0x8: case 0x9: /* Data processing - immediate */
         disas_data_proc_imm(s, insn);
         break;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
new file mode 100644
index 0000000000..2c9e4733cb
--- /dev/null
+++ b/target/arm/translate-sve.c
@@ -0,0 +1,63 @@
+/*
+ * AArch64 SVE translation
+ *
+ * Copyright (c) 2018 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "tcg-op.h"
+#include "tcg-op-gvec.h"
+#include "qemu/log.h"
+#include "arm_ldst.h"
+#include "translate.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+#include "exec/helper-gen.h"
+#include "exec/log.h"
+#include "trace-tcg.h"
+#include "translate-a64.h"
+
+/*
+ * Include the generated decoder.
+ */
+
+#include "decode-sve.inc.c"
+
+/*
+ * Implement all of the translator functions referenced by the decoder.
+ */
+
+static void trans_AND_zzz(DisasContext *s, arg_AND_zzz *a, uint32_t insn)
+{
+    unsupported_encoding(s, insn);
+}
+
+static void trans_ORR_zzz(DisasContext *s, arg_ORR_zzz *a, uint32_t insn)
+{
+    unsupported_encoding(s, insn);
+}
+
+static void trans_EOR_zzz(DisasContext *s, arg_EOR_zzz *a, uint32_t insn)
+{
+    unsupported_encoding(s, insn);
+}
+
+static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
+{
+    unsupported_encoding(s, insn);
+}
diff --git a/.gitignore b/.gitignore
index 704b22285d..abe2b81a26 100644
--- a/.gitignore
+++ b/.gitignore
@@ -140,3 +140,4 @@ trace-dtrace-root.h
 trace-dtrace-root.dtrace
 trace-ust-all.h
 trace-ust-all.c
+/target/arm/decode-sve.inc.c
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 847fb52ee0..9934cf1d4d 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -10,3 +10,13 @@ obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
 obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
+
+DECODETREE = $(SRC_PATH)/scripts/decodetree.py
+
+target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --decode disas_sve -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/translate-sve.o: target/arm/decode-sve.inc.c
+obj-$(TARGET_AARCH64) += translate-sve.o
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
new file mode 100644
index 0000000000..2c13a6024a
--- /dev/null
+++ b/target/arm/sve.decode
@@ -0,0 +1,45 @@
+# AArch64 SVE instruction descriptions
+#
+#  Copyright (c) 2017 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
+
+###########################################################################
+# Named attribute sets.  These are used to make nice(er) names
+# when creating helpers common to those for the individual
+# instruction patterns.
+
+&rrr_esz	rd rn rm esz
+
+###########################################################################
+# Named instruction formats.  These are generally used to
+# reduce the amount of duplication between instruction patterns.
+
+# Three operand with unused vector element size
+@rd_rn_rm_e0	........ ... rm:5  ... ...  rn:5 rd:5		&rrr_esz esz=0
+
+###########################################################################
+# Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
+
+### SVE Logical - Unpredicated Group
+
+# SVE bitwise logical operations (unpredicated)
+AND_zzz		00000100 00 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
+ORR_zzz		00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
+EOR_zzz		00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
+BIC_zzz		00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
-- 
2.14.3

