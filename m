Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2193773lfm;
        Thu, 30 Apr 2020 11:11:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKHI0rbF9H1tE3QqEA7uhibZowb9AopI8s18wfLF5AeVablrl5TfN3zwfkf/926cjbY/VSE
X-Received: by 2002:a37:5744:: with SMTP id l65mr5010331qkb.470.1588270283372;
        Thu, 30 Apr 2020 11:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270283; cv=none;
        d=google.com; s=arc-20160816;
        b=IbYlkZJMg59/rc7bkjii7OwEVPRlho4TkYeXigWotS63v7RpomXS1wncmsrqG9cXHQ
         wgqCIscHLfcblZ7zwNoAK21eHAFDjy8dZauxJeLoJiXdWizO4Z3Q6kOESj8qdoNjl8Xl
         dJNYs0iDo4FJdVuig7DJnlfxFfgt3xSNjAfuT1XAjteKZaMrvguQxpVcpoINZ+2t75Bz
         uAgSW3E7B4wSexcORpqHpJRvrkl1lxtryZq4v8f6LqzfLh9Iqn0Jq86cJ6fI6VXnz/6d
         aIYV2+lA+ePq1ADe7a/mZQpGRiZUzxKCQ3e3owxcysOa8bDP5jZ7yQxSIK8xvGWcmE2v
         kjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zGpn+nE2cY3bbTpJiEK4NR1N+u/Wt/2TxzlYPkNv3Tc=;
        b=vSGf+waG3BgOb5SOknSrOzbvqXbkDVGSyPbsYelAp3n9ma6WRUf/PV5nKbFZn8JxYi
         I1V4QF1HZWoWiJhEJ63isq43q92DI0/5mnCJfMunZUIV0vTfv+ESbp+J3yIJLNmD9im2
         +bWY/jT+8E40ScWN6YDjSlQCoqBRKMxnSCkU6Nk5tPLL5DQe8qCWcFzqdSF34tLrj/9m
         UynZNBM50ee6x/HymU3gKujVtG/ri+z9clVQeEwtSOEhbXSZnA6/W4yEYZi+cumGZN51
         UQqWGG4/R0n91pFIP6f13ThvWvykj335NlcaVcROIotTzulqtKJ6RPP2tvJSB++VNK5j
         FalQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkeAQpBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b69si166109qkg.285.2020.04.30.11.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkeAQpBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDec-0002BK-E6
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdr-0001OD-Ov
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdX-0000Uw-Bk
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdW-0000Gz-Mb
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g12so3071253wmh.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGpn+nE2cY3bbTpJiEK4NR1N+u/Wt/2TxzlYPkNv3Tc=;
 b=IkeAQpBUZfNC7n5stH6nqQYmSJWqK9nfyNhHNTZ9r3+p78bhf+tbiS19e0Ck5/0OEw
 KEo5OHLJKoH5LQ0qA7/kyPZoIWRU7Q4wHT0fHSWe4Xj2X+l1y0QZagSY59PxFCHYIo87
 pdF/m242bsiNwImD4W8Yg1vRO7p7x7zSJn9yu+Wj6Afw1EL9fTg7rCkXXQ2wfL1OmF0g
 /OnqgkZua4u2ZXuag1fJ58AVTvanh92ohKOycnll/c/1TfrZQnf350BrF7WzSo18OC9q
 33mvr8VFkMYC2h7VjGD32X3N50BTGrYuC+w8pmPWmcnq3Hs7PzzuJvGI7IacOaMBk02C
 toTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGpn+nE2cY3bbTpJiEK4NR1N+u/Wt/2TxzlYPkNv3Tc=;
 b=IexwFbj1DdCzwBOFR/cQ158iGT5ExGIACH77ZoZiQe4OYlkRLkGhFYIwcO7AF2jS6B
 YF0dbFyV45wrEbQA+hwSfcQxJJR2SOibyBBfY1d+Vw1d9u2axHW0xNy+QTkSQ6F/G5Oh
 iQYnkV/TY68s//scDnaW5IvGipHrzGK97NeBVdtpy8om/4EYeWLS2yge0YI6ntv15SQ5
 F9QKOm63hZee4UDmvBUtKL1cFtS49yRJj31dAwTuz5+jxwO6C1vvae3C8DeHvNxPmydW
 We4zGwFq1ee7g95TfMGvTUcXg7DtE/dRpHjBtHCRMXZg11Q1dDscz11Yzq4+t4CVVqBZ
 sUoQ==
X-Gm-Message-State: AGi0PubMWa7GWWMATmoBJfqqUBQT3i4Uvebb5U+M21JeRwvBoM8iTm7H
 XrPI3zOKMf7t/MJbzHrU9pWzfcz08PeQPQ==
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr4200094wmb.130.1588270210440; 
 Thu, 30 Apr 2020 11:10:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/36] target/arm: Add stubs for AArch32 Neon decodetree
Date: Thu, 30 Apr 2020 19:09:30 +0100
Message-Id: <20200430181003.21682-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::32a
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3W6+kihiO1bf

Add the infrastructure for building and invoking a decodetree decoder
for the AArch32 Neon encodings.  At the moment the new decoder covers
nothing, so we always fall back to the existing hand-written decode.

We follow the same pattern we did for the VFP decodetree conversion
(commit 78e138bc1f672c145ef6ace74617d and following): code that deals
with Neon will be moving gradually out to translate-neon.vfp.inc,
which we #include into translate.c.

In order to share the decode files between A32 and T32, we
split Neon into 3 parts:
 * data-processing
 * load-store
 * 'shared' encodings

The first two groups of instructions have similar but not identical
A32 and T32 encodings, so we need to manually transform the T32
encoding into the A32 one before calling the decoder; the third group
covers the Neon instructions which are identical in A32 and T32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/Makefile.objs        | 18 +++++++++++++++++
 target/arm/translate-neon.inc.c | 32 +++++++++++++++++++++++++++++
 target/arm/translate.c          | 36 +++++++++++++++++++++++++++++++--
 target/arm/neon-dp.decode       | 29 ++++++++++++++++++++++++++
 target/arm/neon-ls.decode       | 29 ++++++++++++++++++++++++++
 target/arm/neon-shared.decode   | 27 +++++++++++++++++++++++++
 6 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/translate-neon.inc.c
 create mode 100644 target/arm/neon-dp.decode
 create mode 100644 target/arm/neon-ls.decode
 create mode 100644 target/arm/neon-shared.decode

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f6..775b3e24f22 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -18,6 +18,21 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
 	  $(PYTHON) $(DECODETREE) --decode disas_sve -o $@ $<,\
 	  "GEN", $(TARGET_DIR)$@)
 
+target/arm/decode-neon-shared.inc.c: $(SRC_PATH)/target/arm/neon-shared.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_neon_shared -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-neon-dp.inc.c: $(SRC_PATH)/target/arm/neon-dp.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_neon_dp -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/decode-neon-ls.inc.c: $(SRC_PATH)/target/arm/neon-ls.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --static-decode disas_neon_ls -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
 target/arm/decode-vfp.inc.c: $(SRC_PATH)/target/arm/vfp.decode $(DECODETREE)
 	$(call quiet-command,\
 	  $(PYTHON) $(DECODETREE) --static-decode disas_vfp -o $@ $<,\
@@ -49,6 +64,9 @@ target/arm/decode-t16.inc.c: $(SRC_PATH)/target/arm/t16.decode $(DECODETREE)
 	  "GEN", $(TARGET_DIR)$@)
 
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
+target/arm/translate.o: target/arm/decode-neon-shared.inc.c
+target/arm/translate.o: target/arm/decode-neon-dp.inc.c
+target/arm/translate.o: target/arm/decode-neon-ls.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 target/arm/translate.o: target/arm/decode-a32.inc.c
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
new file mode 100644
index 00000000000..a33e81ba3ab
--- /dev/null
+++ b/target/arm/translate-neon.inc.c
@@ -0,0 +1,32 @@
+/*
+ *  ARM translation: AArch32 Neon instructions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright (c) 2005-2007 CodeSourcery
+ *  Copyright (c) 2007 OpenedHand, Ltd.
+ *  Copyright (c) 2020 Linaro, Ltd.
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
+/*
+ * This file is intended to be included from translate.c; it uses
+ * some macros and definitions provided by that file.
+ * It might be possible to convert it to a standalone .c file eventually.
+ */
+
+/* Include the generated Neon decoder */
+#include "decode-neon-dp.inc.c"
+#include "decode-neon-ls.inc.c"
+#include "decode-neon-shared.inc.c"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ab5324a5aaa..bd766391e9e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1313,8 +1313,9 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 
 #define ARM_CP_RW_BIT   (1 << 20)
 
-/* Include the VFP decoder */
+/* Include the VFP and Neon decoders */
 #include "translate-vfp.inc.c"
+#include "translate-neon.inc.c"
 
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
 {
@@ -10949,7 +10950,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         /* Unconditional instructions.  */
         /* TODO: Perhaps merge these into one decodetree output file.  */
         if (disas_a32_uncond(s, insn) ||
-            disas_vfp_uncond(s, insn)) {
+            disas_vfp_uncond(s, insn) ||
+            disas_neon_dp(s, insn) ||
+            disas_neon_ls(s, insn) ||
+            disas_neon_shared(s, insn)) {
             return;
         }
         /* fall back to legacy decoder */
@@ -11102,6 +11106,33 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         ARCH(6T2);
     }
 
+    if ((insn & 0xef000000) == 0xef000000) {
+        /*
+         * T32 encodings 0b111p_1111_qqqq_qqqq_qqqq_qqqq_qqqq_qqqq
+         * transform into
+         * A32 encodings 0b1111_001p_qqqq_qqqq_qqqq_qqqq_qqqq_qqqq
+         */
+        uint32_t a32_insn = (insn & 0xe2ffffff) |
+            ((insn & (1 << 28)) >> 4) | (1 << 28);
+
+        if (disas_neon_dp(s, a32_insn)) {
+            return;
+        }
+    }
+
+    if ((insn & 0xff100000) == 0xf9000000) {
+        /*
+         * T32 encodings 0b1111_1001_ppp0_qqqq_qqqq_qqqq_qqqq_qqqq
+         * transform into
+         * A32 encodings 0b1111_0100_ppp0_qqqq_qqqq_qqqq_qqqq_qqqq
+         */
+        uint32_t a32_insn = (insn & 0x00ffffff) | 0xf4000000;
+
+        if (disas_neon_ls(s, a32_insn)) {
+            return;
+        }
+    }
+
     /*
      * TODO: Perhaps merge these into one decodetree output file.
      * Note disas_vfp is written for a32 with cond field in the
@@ -11109,6 +11140,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
      */
     if (disas_t32(s, insn) ||
         disas_vfp_uncond(s, insn) ||
+        disas_neon_shared(s, insn) ||
         ((insn >> 28) == 0xe && disas_vfp(s, insn))) {
         return;
     }
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
new file mode 100644
index 00000000000..c89a1a58591
--- /dev/null
+++ b/target/arm/neon-dp.decode
@@ -0,0 +1,29 @@
+# AArch32 Neon data-processing instruction descriptions
+#
+#  Copyright (c) 2020 Linaro, Ltd
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
+# Encodings for Neon data processing instructions where the T32 encoding
+# is a simple transformation of the A32 encoding.
+# More specifically, this file covers instructions where the A32 encoding is
+#   0b1111_001p_qqqq_qqqq_qqqq_qqqq_qqqq_qqqq
+# and the T32 encoding is
+#   0b111p_1111_qqqq_qqqq_qqqq_qqqq_qqqq_qqqq
+# This file works on the A32 encoding only; calling code for T32 has to
+# transform the insn into the A32 version first.
diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
new file mode 100644
index 00000000000..2b16c9256df
--- /dev/null
+++ b/target/arm/neon-ls.decode
@@ -0,0 +1,29 @@
+# AArch32 Neon load/store instruction descriptions
+#
+#  Copyright (c) 2020 Linaro, Ltd
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
+# Encodings for Neon load/store instructions where the T32 encoding
+# is a simple transformation of the A32 encoding.
+# More specifically, this file covers instructions where the A32 encoding is
+#   0b1111_0100_xxx0_xxxx_xxxx_xxxx_xxxx_xxxx
+# and the T32 encoding is
+#   0b1111_1001_xxx0_xxxx_xxxx_xxxx_xxxx_xxxx
+# This file works on the A32 encoding only; calling code for T32 has to
+# transform the insn into the A32 version first.
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
new file mode 100644
index 00000000000..3aea7c5e188
--- /dev/null
+++ b/target/arm/neon-shared.decode
@@ -0,0 +1,27 @@
+# AArch32 Neon instruction descriptions
+#
+#  Copyright (c) 2020 Linaro, Ltd
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
+# Encodings for Neon instructions whose encoding is the same for
+# both A32 and T32.
+
+# More specifically, this covers:
+# 2reg scalar ext: 0b1111_1110_xxxx_xxxx_xxxx_1x0x_xxxx_xxxx
+# 3same ext:       0b1111_110x_xxxx_xxxx_xxxx_1x0x_xxxx_xxxx
-- 
2.20.1

