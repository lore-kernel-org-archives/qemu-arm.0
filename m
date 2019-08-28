Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1148623wrs;
        Wed, 28 Aug 2019 12:06:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG2D+FBj/ucpWe1CbAQQVTxFTS0owYSX+bHQsX/OVbD5VBFVPIRKfp3rQq1zA1n04KIHgD
X-Received: by 2002:a0c:abca:: with SMTP id k10mr4050135qvb.177.1567019212416;
        Wed, 28 Aug 2019 12:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019212; cv=none;
        d=google.com; s=arc-20160816;
        b=hm1JwBNvys0FojWEYVCoTzwUmaqeS7DHgrIil5HeDvbXU6vzFs2M0SB90tJjwIzMVy
         mriBn8ysjNdLl4xCyXgp2dAaV1kf+T1dy9nfPDwXpmF09d1M062XLKz5hTojKxaei9mH
         6ChbSpRV8QBCp6n3JYE7Sl4mhQ1tc2haLhtCdxIxfAYMhhmlwWbjNjMFILRyvY8X6WH7
         nxuKwua4izdQsLWanpPahPdS4NKyy0/RtWTn3tSU2N72VH8veVzkiIiJi8n0f6opP3uc
         oUzAyKcjcnEpNdGeZHIZKNY0nnT0Q12tqZoXIMlzs3blI0UuAD0v8V8X9dgJjb3IV0e+
         sQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=14GQARTvu8E3U5TivytnupYS9fMVqAtXGLnyFkmLB/c=;
        b=u4eHFfRwLwikfxUe9cAc81BDyZook+qeKzhVJdzz3jvHQKQAL4cVDmXh+eS86lxs5d
         FXsqgsg/e7Dkywl8EgqtZWoI96rvAn6/Vkr95GBqKc9RfIscckiraPxDtbnJVn1NRKCU
         BJyy0cdKwBF4WlruBFHhrJhyrRE5hnu2sOVR0fj/W8cnBbUFi5V9hCPf/WO4TeOmV+h1
         0fx5SiAiz9sOwUdwAoW3IcuF/V+1vKoVq5mQRCT3AlBuR7rVvqKO1flDOD6Uw4DK/jJT
         lALul8GNd/+yvv7Bf5chGs9PbRf7FuO97u800NyZF2dF/exdckV36UyLLskI7b+G/fJy
         J2wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MycaWecf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s126si116043qkf.336.2019.08.28.12.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MycaWecf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33HO-0003uZ-Pf
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fg-0002x2-6A
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fe-00085E-8p
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:03 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37128)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fe-00084W-0X
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id bj8so401893plb.4
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14GQARTvu8E3U5TivytnupYS9fMVqAtXGLnyFkmLB/c=;
 b=MycaWecfNnxPRxXOZYPfu/QLR6YZmEo7fdFiu1esJs7vWwo+lMvsukw2tZfYkWLKUd
 ypGagD49XDmTcOfARcHSXtaRYfyTLVGSpybjGpeNSMbjtynU5LzFehP6X4y9qS/EUNxh
 RdvPQj+V6WJCoOm3kRqNgNVYjhWfiswrPmaFHzK+bg+Mga40b3G08/9Tp/jMa/4000eQ
 xWq8xLfbh6XkNwG2aRzy9WjhecY8IC3T2QzEfUSJxqWarJqN3xFswFudeqNH0TUb3lXD
 cgji9TfzLxVIME4w+gGp25uG5sTkk7huxh4vZ5MUc28W8TMgd6ycadC3vXTNx/9Eyny4
 FKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14GQARTvu8E3U5TivytnupYS9fMVqAtXGLnyFkmLB/c=;
 b=dIOfjO1Bk3/YdmMzZrAdDEratFmsE3cy5QiYzFhEt2DYzT9LbYB5i5NYPuCBTrpRP6
 rmr2BP+THszkWk1vor+KH+eJEXY8xguUoeGUcc070XTqtbk93K4PlHfK7A5UW5MO1UZh
 THFnrGg8rNrhUHVUSlL1aoDJdLDugYeCWNayk4qK+yPPPSCmOGawtV0sOnwZTGzv7WyV
 D2HCoKQHRu3c36MdxFhKklJAIut/SU2grdn2T20EuoPnprVCP0S6w0qt4cYAgOAM80gJ
 zxBbAaM1H0f/61Kkk8yk+ZEq/HsLrOeFhC1Mhbs8U8bQJDHsjB3DP7/SGvZESfJBL/NA
 COFg==
X-Gm-Message-State: APjAAAVnlA1/UVOp7y3zHiDmdXdKI1xcTw5ZYcaJgbTbMhx5BStcJaC/
 QdubKgfOzMZOM0b74RzvNL2xsQ==
X-Received: by 2002:a17:902:e406:: with SMTP id
 ci6mr5716394plb.207.1567019100988; 
 Wed, 28 Aug 2019 12:05:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:49 -0700
Message-Id: <20190828190456.30315-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 02/69] target/arm: Add stubs for aa32
 decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U34wTZMZkanb

Add the infrastructure that will become the new decoder.
No instructions adjusted so far.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 31 ++++++++++++++++++++++++++++++-
 target/arm/Makefile.objs     | 18 ++++++++++++++++++
 target/arm/a32-uncond.decode | 23 +++++++++++++++++++++++
 target/arm/a32.decode        | 23 +++++++++++++++++++++++
 target/arm/t32.decode        | 20 ++++++++++++++++++++
 5 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t32.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 35e59a8a16..91651b9736 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7657,6 +7657,18 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
     arm_gen_test_cc(cond ^ 1, s->condlabel);
 }
 
+/*
+ * Include the generated decoders.
+ */
+
+#include "decode-a32.inc.c"
+#include "decode-a32-uncond.inc.c"
+#include "decode-t32.inc.c"
+
+/*
+ * Legacy decoder.
+ */
+
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
     unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
@@ -7675,7 +7687,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
     cond = insn >> 28;
-    if (cond == 0xf){
+
+    if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
          * for miscellaneous unconditional instructions.
@@ -7683,6 +7696,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         ARCH(5);
 
         /* Unconditional instructions.  */
+        if (disas_a32_uncond(s, insn)) {
+            return;
+        }
+        /* fall back to legacy decoder */
+
         if (((insn >> 25) & 7) == 1) {
             /* NEON Data processing.  */
             if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
@@ -7897,6 +7915,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
            next instruction */
         arm_skip_unless(s, cond);
     }
+
+    if (disas_a32(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     if ((insn & 0x0f900000) == 0x03000000) {
         if ((insn & (1 << 21)) == 0) {
             ARCH(6T2);
@@ -9379,6 +9403,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         ARCH(6T2);
     }
 
+    if (disas_t32(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5cafc1eb6c..7806b4dac0 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -28,9 +28,27 @@ target/arm/decode-vfp-uncond.inc.c: $(SRC_PATH)/target/arm/vfp-uncond.decode $(D
 	  $(PYTHON) $(DECODETREE) --static-decode disas_vfp_uncond -o $@ $<,\
 	  "GEN", $(TARGET_DIR)$@)
 
+target/arm/decode-a32.inc.c: $(SRC_PATH)/target/arm/a32.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_a32 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-a32-uncond.inc.c: $(SRC_PATH)/target/arm/a32-uncond.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_a32_uncond -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
+target/arm/translate.o: target/arm/decode-a32.inc.c
+target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
+target/arm/translate.o: target/arm/decode-t32.inc.c
 
 obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
new file mode 100644
index 0000000000..8dee26d3b6
--- /dev/null
+++ b/target/arm/a32-uncond.decode
@@ -0,0 +1,23 @@
+# A32 unconditional instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
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
+# All insns that have 0xf in insn[31:28] are decoded here.
+# All of those that have a COND field in insn[31:28] are in a32.decode
+#
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
new file mode 100644
index 0000000000..a3e6e8c1c2
--- /dev/null
+++ b/target/arm/a32.decode
@@ -0,0 +1,23 @@
+# A32 conditional instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
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
+# All of the insn that have a COND field in insn[31:28] are here.
+# All insns that have 0xf in insn[31:28] are in a32-uncond.decode.
+#
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
new file mode 100644
index 0000000000..ac01fb6958
--- /dev/null
+++ b/target/arm/t32.decode
@@ -0,0 +1,20 @@
+# Thumb2 instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
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
-- 
2.17.1

