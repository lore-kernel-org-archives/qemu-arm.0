Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3172756wrs;
        Mon, 19 Aug 2019 14:41:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxphC3Kpx6Ifr22xd+xSMFgcQqyao5+7H2oj+n+jxFzore9ldOvQotf/Hjzsj60Om1jdYzC
X-Received: by 2002:aed:3826:: with SMTP id j35mr22101168qte.54.1566250893802;
        Mon, 19 Aug 2019 14:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250893; cv=none;
        d=google.com; s=arc-20160816;
        b=UsNvRUUmLY8AEz8k8yatjYY0xrSW6fPqNzbYnRaG60pzqIlHf42y/TVeb0kXfCiJ2+
         M8kAFS+6j/jJAY7pyn2zoTp98ltDeowFn99yZoIiT5tZodr9/gP8owXPctCDCde6RL00
         rzBEEURTLXSZC3aoy/OFlUN3B/exr7JJTkNC+HFP5YLO+WzQQfBy3vN3GgABzIXEtz6h
         CoR5orE5maFunvlwBstV+/3ju2v752yVq2b7qB9t1pjiWJTzfV+wTTE5J+tB/BC61Gp/
         8RqchIoP6YeoQOh+3zv3RQySeSPJc8des+lv6mRpyAiglEjJFrZtQYBrmktZo+mmtdGE
         zeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Lk8BfvHlK27e0gTYQ9ZvQ9xJX5SjXjlYlXz2Xz9pa/E=;
        b=RQ61nROvr2jUShY33eo7QMHDCm/kbzm64s4V0bxWBYvg+OPaChS57e8vcWGIMOcGfu
         WHcyyFePV6c8uDsb9CsmRSkiZSsABxZjJFJzQ7xcyHnV5SafPPrV6zPdvp2vgwuR1DFC
         9aOjlSCA9qo9+f4JY5+nSJzLzcuJBzxdGKu8nrXhKRqq+MV1pobXpyGkP4xftzbZFj1T
         5m/iX6qWcPDzqP6kiTADhd0izCDLfhNK6hm/7CrXHqgDzROO6TxjJ/Xzm4TI0lsoVvjx
         I5s9erd14VpuK3iXKvfwUG0iZeDaL1oSuNsVDTlP67mz5bV9Yldte6w9rmpBGfk456dq
         JBMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jUNWfg2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si10599249qvj.39.2019.08.19.14.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jUNWfg2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpPA-0005aX-VH
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLm-0001AC-Sw
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLl-0005xm-9M
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:02 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLl-0005xE-3D
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:01 -0400
Received: by mail-pg1-x542.google.com with SMTP id n4so1935444pgv.2
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lk8BfvHlK27e0gTYQ9ZvQ9xJX5SjXjlYlXz2Xz9pa/E=;
 b=jUNWfg2JTViv2fix6PZzGp0t1W7scoz+UR0bxYVGWrHznfKiCzy2XwTqvKrR6YQh4j
 gi/Lex9NfNxyOzHOUQMPpVIcgXdcOuLFJ0o9ul2/MzrK4rXJq6VqYZYdPBiMb00gpiZM
 JCDbQEgRPoMKxs5QYoB1GdDdl4QNwttpoJ6rzwP47jitpJki0PX50lUaLjLBY6z+t44I
 qwF6DPhEcmIVqV5YDBAm3Wtl2ouHW6wekL9UsRtEGPK9eThdMaq9XuCVLWhvdZVmzXwv
 jgtdOa2K7nEhcXsvOJkyWEdzWJEFcx/qfqImcjMn00dq21LeR4HFMiWfQX0n5A8J8qCk
 +8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lk8BfvHlK27e0gTYQ9ZvQ9xJX5SjXjlYlXz2Xz9pa/E=;
 b=BEUwPIptkMpuX/WqcxiGirNMrJOC7GyS1BUs/4df3RCKqiwYcezbBiPYA29eWdCZgy
 QXwEGXtWATy4XPK3IAKYmlLdeel4igJlmudepyQGX/gZkhoJ6d68QwB2e3OnSYq7FEjN
 jfXfd4XXIfSZyX+O9/x115bLBvv6zSv04FThA0HzaHMvXfe3XiFGvolGn+03erJcTY3W
 l6391itiJ13SATe8GkjWsShjLS9v/5kZk/hwWSZA/a1RCz2eIK65o3pDh0IYKA+zu8gp
 pDZS37yyXYypCQ98AM761xRRJunvQIuEhU/SIGg/F4iVmydN3tIa8Ii9nx2AmnPYH7XY
 ABOw==
X-Gm-Message-State: APjAAAUUCC9y004IwVMbgYYMW/T6vHpWKp5VUoTz4hYWtCE1OD0XyvwP
 MAnL1FO3OoWj1LK0xGDam1E+RQ==
X-Received: by 2002:a63:2252:: with SMTP id t18mr21883402pgm.5.1566250680149; 
 Mon, 19 Aug 2019 14:38:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:49 -0700
Message-Id: <20190819213755.26175-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2 02/68] target/arm: Add stubs for aa32
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
X-TUID: pjI7TmGUuYUd

Add the infrastructure that will become the new decoder.
No instructions adjusted so far.

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
index db69d998eb..c759fe0797 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7661,6 +7661,18 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
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
@@ -7679,7 +7691,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
     cond = insn >> 28;
-    if (cond == 0xf){
+
+    if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
          * for miscellaneous unconditional instructions.
@@ -7687,6 +7700,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -7901,6 +7919,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -9386,6 +9410,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

