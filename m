Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1113564wrp;
        Wed, 4 Sep 2019 12:31:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4YOxUo7HZ6QOeOGa3oZ9f7+9nZWM5S1D5mpwuIykflCnb+xcwmraF29ZBuz8RxZeiyucA
X-Received: by 2002:a05:620a:1215:: with SMTP id u21mr11211458qkj.116.1567625493931;
        Wed, 04 Sep 2019 12:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567625493; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ4lPFh4jqMgzpvF+OHDiXFdfLfJlV25jYDbyYXYl/rqIhUj5cw6AxBMpMxc84livX
         FexjVcXJKXwKqF0cWegtJNUxpZIPyFmqaU8QkMHm7eF7AWRqYgOlKuqtgoLzUEeOJ+PV
         oF5+qKCAXsCC6bAtuW+S6b3H7yf/a1n0NBD5kZl7jwgcoxZ777hGrhzqgpnc+Ku89brI
         zV/cki9XTGsFlGU5Mts5F6GaGPdIXg2XCF11dKjaJxm7f30Hd7xjJg8W4g9/fDyVqLm0
         CqWC6Dcq7kg+nwLiKDqLeAOT2sh28DBhc2iKqxmbM84loGv/Lq+xDl0pNNJ/3ZO80tfE
         o3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NBzAHUlZzheDevf0bsXniXn3jInVmGNWWYOMzwYImOs=;
        b=fhsSkMRD3jXXgNceN5X7+x+syMBdsNp45uPw/62jQn+rFyZwKmOOoFT9kMzCefWirz
         p3YPLXVdD11NQ90fb+NQsvZh8XiF1p/1S0TI3wlRP+ZmW7jJGJxqbTuIr3UANl54PbbP
         1b12OqeMrBMmCCRD9SXePXtOrlyRBJs/aTcDTODSJ1b7Gfy7CqXcFbSfFUrWbzbhWZsZ
         2RRnjdp5zdfPK1bGShWwsVISmqs3OzgEXvtojolAc+R69ifYTlKd/gv6HwONwnhIh9n/
         VsbLBT/f28udB35t5+WfxxrxJAMr1VKJOY9YW6wT5UjjrATaJhJU1L3Z+wt19Fbklca0
         CdBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKPWhUOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si9610565qkg.9.2019.09.04.12.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:31:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKPWhUOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b08-00049T-Jf
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azj-00043V-7L
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azh-00022g-CF
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:07 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34862)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azh-00021g-0L
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:05 -0400
Received: by mail-pl1-x62d.google.com with SMTP id gn20so10008plb.2
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBzAHUlZzheDevf0bsXniXn3jInVmGNWWYOMzwYImOs=;
 b=PKPWhUOfdKlfW1ND0j1hjvfaxn6oOmd+JQ5mkfiVBiWjXduZm8Yr8dNyFV3yPVjHYf
 A0FWvxcjlh+k3CzZdoFJDqeaCW2RD6xyTFzsimxjmx2ekolc5yxgC3BNu9ZXny+ZmyaF
 4Sbx8AySsfE0aS+oxsWivlEOSLB4UFiWdkbP1gHYc4iZeRTSVNx76vmEfMzk6zEcFJCJ
 dOLal0p6Ic/udlEq+Oz/Qz101gDe6EUqhrMIqGVYkDwv4xA7C7VY6LNqUhS5zNFTb+1P
 gwUcJo2vZROoJ1BVteOzzGQoo7rVRPUMUAQQs2RfxfnFFCf/7xydmCJ7laCz6qPtw+GZ
 y7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBzAHUlZzheDevf0bsXniXn3jInVmGNWWYOMzwYImOs=;
 b=hyLOE7M2esP0zG8lYTJ9CYCAFdJxlLfHahV0X4uavwsZLZcC6y6+5tzQTcIBd3I3T8
 DkUo4rFhX1yHQzy0AlRNcyNYGgcPCGA53vMdQWkH6rN1z5+pNv3B2CW2hSlu/6xoRGIK
 yQucHJfhFQNyI8V+nD9u+31+oyQVOJjrx5zX//cw88z32yvZg0CcBbcyi9xN8zrKoMWn
 KoqCBxtnxeGXZR4EwRaW4E82PJjGh9jRf51cfHrFYrbZvtRMHdCR202GNZYTA6IMll7e
 vbjdbpe5rE7rYu48WdU4SOsaE5s7W+E7gyFmXLrAmsRr+WM92ktlnxSRFFozZfe12m8H
 zuiQ==
X-Gm-Message-State: APjAAAX66zsUaJPDEPGjJWCITxcxPwzImsM6mk86GauRyVnuilSaZ4ie
 vKgeSqkxf81a4jwTNleXDEC4uQ==
X-Received: by 2002:a17:902:850a:: with SMTP id
 bj10mr2755063plb.254.1567625463978; 
 Wed, 04 Sep 2019 12:31:03 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:29:52 -0700
Message-Id: <20190904193059.26202-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62d
Subject: [Qemu-arm] [PATCH v4 02/69] target/arm: Add stubs for aa32
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
X-TUID: 50WFdf8NfN1G

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
index a39f792463..07674d223c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7683,6 +7683,18 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
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
@@ -7701,7 +7713,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
     cond = insn >> 28;
-    if (cond == 0xf){
+
+    if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
          * for miscellaneous unconditional instructions.
@@ -7709,6 +7722,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -7923,6 +7941,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -9414,6 +9438,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

