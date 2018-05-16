Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp201073wme;
        Wed, 16 May 2018 15:31:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpqDHRBFrzqtpsUKQTRREjIJempbQ4QbWk57pkx7AgneWlgwbA9xxxUYxewEJ/vUGCHFglh
X-Received: by 2002:ac8:2753:: with SMTP id h19-v6mr2996835qth.185.1526509871246;
        Wed, 16 May 2018 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526509871; cv=none;
        d=google.com; s=arc-20160816;
        b=tfrfHeJweKQB7CxeYIK8sKWXI3pktL0heRa/tuftLPX8zRTFvN8V+qIdsZ7k6pvB53
         SGCtucLh7Hpe9rSs0XJ3rb97EOuNZ1j+rTZ5NxGMBpJ/Wf0BNPL5GZ8cp82WXMCcvxuQ
         Iskj5sZ6ceCFsySd9UyJkk4czpK8rcl7U7iD7BXGuekuYCmtegvS8zfknYsyCWYLeuoN
         VUyUtWFE+xf4togpDoCDP8fxgzUd9I1YzKoJ3XGUl7nTDV6/RNR86AT7n6pKT3n8ycIe
         +NVhOFwAIdZp4rPwMm3ARiNgYbgJHhNb890H4pWKCCXsdwmF+H66TXD47HnSd/QZyxF8
         KaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rti76ydk7wCoVs4pArdj2slbyyvaqRbPWHSPcl/C3C0=;
        b=IflnXb2HlED9Qpx9Mt2ooWrLYoi3sHrqJSOCu0fHwXU2WykeAWk1KHcsiW3lLp8zmx
         Io4g8Xpcau8PU/ucdC9Mvolc/5LDVrq89hjPfjNwNOvPZjENiJxdzbhqMQU1EQMKWFQt
         vDQewQmJDiGNIgybbdwieacG+uRIr/yLPS6xLKxiHdtFhPdngfqGD7dzb7T+NlDRGVic
         TdqVSjVbFa/7PhDSxdu2D8e3YQIkXxjGkdD2L04ROVgU7lbEzogqxDtTw18d4iNuPg0Q
         UgufvauhxIkt48n3N6FcHrELkMp3IJ9v3wi28bo32ysZEm0Z0LwDecVibag+CUqCtvM8
         pMWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h79lYeC1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a8-v6si2397144qtb.175.2018.05.16.15.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h79lYeC1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ4ww-0007iu-K2
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:31:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w3-0007Qx-QY
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w2-0007JN-KE
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:15 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:39059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4w2-0007Iz-CT
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:14 -0400
Received: by mail-pl0-x241.google.com with SMTP id c19-v6so1247160pls.6
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rti76ydk7wCoVs4pArdj2slbyyvaqRbPWHSPcl/C3C0=;
	b=h79lYeC1s5eoLv6EC57aenR11IDEjzhd9jtoxFONnXdx6YDaykWfdtfn7jWhysN22Z
	2+mK+zpocttItIAdJoNh8uc+isiGwB9PUIECoR+qzbnm+tZXFV6c5QqwmpUOP/LKZVFM
	ZgLNTcRTj9r668YgXstvu+paUsfHTxhdLNqeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rti76ydk7wCoVs4pArdj2slbyyvaqRbPWHSPcl/C3C0=;
	b=dzsf0sTKl2O7kOBLXump0ivQ+Zh/UmYOPQo7GP1VQZTVFffWnlXVK4lpeOKs96WqWh
	pqV3CQhZjxorUyKTVex96Yfpl6vnhu8uk+E8rz8PDhLKAgFILYDNHSWaU422RQqT7pC7
	P/ydR40udNSCesTMC2L7uBT7DvA1mdUr7fQ5JLK0vw/BcSWQ0xIDB6QnpivPWHFt0c92
	fQjYmefv+HtWYv5gANfyyqXxPQrQaXUTxIBGXbCYxoQ4SEmE3iBYiBNCV6aS6oMN1BHa
	Lg8+7DG4umsLQamMk1Et/9nky6v7s2B15x8GQAFXtgQQn8UEqlwLFfH/JZWb18hCxcpc
	lemw==
X-Gm-Message-State: ALKqPwdn7R94JsM/b9Kp3R852ilmI8FjuvkJvHqMeK2SzmJPTXJSc9Fj
	WwGNS8l2cMDWCEmZXf030cIpgPLX9fw=
X-Received: by 2002:a17:902:5502:: with SMTP id
	f2-v6mr2711426pli.108.1526509812974; 
	Wed, 16 May 2018 15:30:12 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:42 -0700
Message-Id: <20180516223007.10256-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v3-a 02/27] target/arm: Add SVE decode skeleton
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/FOvtOyR9Ag

Including only 4, as-yet unimplemented, instruction patterns
so that the whole thing compiles.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  7 ++++-
 target/arm/translate-sve.c | 63 ++++++++++++++++++++++++++++++++++++++
 .gitignore                 |  1 +
 target/arm/Makefile.objs   | 10 ++++++
 target/arm/sve.decode      | 45 +++++++++++++++++++++++++++
 5 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/translate-sve.c
 create mode 100644 target/arm/sve.decode

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ace9d5063e..f313d38beb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13653,9 +13653,14 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     s->fp_access_checked = false;
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x2: case 0x3: /* UNALLOCATED */
+    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
         unallocated_encoding(s);
         break;
+    case 0x2:
+        if (!arm_dc_feature(s, ARM_FEATURE_SVE) || !disas_sve(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
     case 0x8: case 0x9: /* Data processing - immediate */
         disas_data_proc_imm(s, insn);
         break;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
new file mode 100644
index 0000000000..d323bd0b67
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
+static bool trans_AND_zzz(DisasContext *s, arg_AND_zzz *a, uint32_t insn)
+{
+    return false;
+}
+
+static bool trans_ORR_zzz(DisasContext *s, arg_ORR_zzz *a, uint32_t insn)
+{
+    return false;
+}
+
+static bool trans_EOR_zzz(DisasContext *s, arg_EOR_zzz *a, uint32_t insn)
+{
+    return false;
+}
+
+static bool trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
+{
+    return false;
+}
diff --git a/.gitignore b/.gitignore
index 4055e12ee8..81e1f2fb0f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -206,3 +206,4 @@ trace-dtrace-root.h
 trace-dtrace-root.dtrace
 trace-ust-all.h
 trace-ust-all.c
+/target/arm/decode-sve.inc.c
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 1297bead5f..a6f733eaa8 100644
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
index 0000000000..48dac9f71f
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
+&rrr_esz        rd rn rm esz
+
+###########################################################################
+# Named instruction formats.  These are generally used to
+# reduce the amount of duplication between instruction patterns.
+
+# Three operand with unused vector element size
+@rd_rn_rm_e0    ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
+
+###########################################################################
+# Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
+
+### SVE Logical - Unpredicated Group
+
+# SVE bitwise logical operations (unpredicated)
+AND_zzz         00000100 00 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
+ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
+EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
+BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
-- 
2.17.0

