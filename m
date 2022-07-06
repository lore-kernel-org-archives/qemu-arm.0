Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4547305lft;
        Wed, 6 Jul 2022 01:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shW1nIr7e8AUJ3Yd9hXrZIQNH9Nyfk6oCTY3MBLi8i160o1rcGd4riSWBpoceVP8LJfvzD
X-Received: by 2002:a25:7455:0:b0:66e:2daf:8924 with SMTP id p82-20020a257455000000b0066e2daf8924mr22814676ybc.427.1657097480362;
        Wed, 06 Jul 2022 01:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097480; cv=none;
        d=google.com; s=arc-20160816;
        b=Ac/fmVTQoj5MnSqGM2VYRqlwK48306a5qesL1plFy4WzQK1iM5ttFq7nHWjaJOFmTh
         50sVdEY1yfSSyksuH9J3YPAtU4oT41ZQTgBu2TFDiJ5izm5PxXvvket3E6t816OG5CS7
         JXMxCngg67LgjYwzeRQ1LubTP01AbpUBOwwXjQSRreyR26ypwZ1179xRzNGmy0e4/FSA
         p9Hqs0slbSO64gsYUcPLydLBJFf8jMBc6+0vmXUllO/cMeO5K77tiNx4NmHYgS6+cUnY
         mxoWk/ScVvm7p+x0MawRds1zB+dhtY4kujUyBIiQZsChx/JVuQm9Q3y9iah/S69JGCtY
         d5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zt0iFWR3qz21z3bSyJ1iuT1OyELXtc2hbyVwv56j1M4=;
        b=c7OHPTQA8hrVOrS/Sg4hXebiLRur1g0V2i4late9UulgZ5JUEbf8I6BSynpof96d1V
         9Ul64S76ms1wkbf0uXIKLSK1DX7oc+CXUIr3OtPrXfBZZf4mhfYi5+yDclI1AMYTFksO
         6svvt0SR9BZdru4KBJD9kb5UOmDNkuZg1MZmdJ0FjRld4fbREbT0QAEKgGNaPoXeM8R7
         ARJx2M5YqUeMQaG5qSTtco39uHj7xFGLw2eAhCPZnGq9X3Nn6jdl26hOHJb9NQgY4vOv
         WjQk3tZVh34XFP6wzWRPgMM4E2/jw2PNMs2newsMqnKXTbMgd1Ft4A1VbLz4IrzP4vxU
         FL3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwOty5jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a8118c6000000b0031c933dac84si11830769ywy.171.2022.07.06.01.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwOty5jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90kh-0000ZP-Lw
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kj-0005g1-31
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kd-0000JE-00
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m2so13061699plx.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zt0iFWR3qz21z3bSyJ1iuT1OyELXtc2hbyVwv56j1M4=;
 b=DwOty5jfyrAdH+R5lveulEDACgBbxoq3624k7XN1sjbbeN282LcZx6LYdao8wAf/al
 BnHDoAzdPSjB473oh0/ntgCQrv+O08gyfU00Q+PeMQSF93fvjLN+rujcfz7ILoU2yLHx
 w2Xjf9I02oKisH/L+ypZwRTBgJ/4VI3FQaw+Abq7zzCPdQUV9I6Gcz2ywkCbTFlI7UU3
 ryvZShZ9yFOX2rokVvOtfYO+GEGfEU4nfu8LIs8/sXBkrHFtzrLFc41j+u0YbaaJ2Q89
 gfPUy9LwtXyTWgoRRcFMIekbP7W+EzRGeyCU2XFZx+ZFrl0TdJvhEBFppHVSyHuZpiSS
 mmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zt0iFWR3qz21z3bSyJ1iuT1OyELXtc2hbyVwv56j1M4=;
 b=lI4pXmAzCy0IUU2IUP9K/mEMn2W5YuQlATSneQGHdOKMWjt6XqxVYAHk/xbCU3vFML
 oZDiROiSwiUFdQe1cLz7/4oRnoGBvk5nG2YpVSYnS8IMAMfSI8hums55vrLwTIsEgcu6
 RKo4T4j95t2jSdp4++BNcg77mZdYqOJKBvlOXpIyPNvV762MLuHjj9GJhCO1jfzuj3Is
 3AMyQKnsW/PBKr3LJoVQyRTLLiSWIWDLCIcXQ0eLiD49bHgBICyXk6q0SmJLgMCTXqZm
 WmJREbWa1a9u+FnzK4U4ZWu5NiPCFWgQLbt95U+gDXQ0f/IYE/Pwx2G0hoy1neE6s/Rg
 +K3Q==
X-Gm-Message-State: AJIora+xnDnsCfqUvLUaNmZsxo8rK6bfoHTZGqNUv3HL6RUpjQEMc1Ew
 APder3QJFWydvTeG9ccf+ZiWYg==
X-Received: by 2002:a17:902:e889:b0:16a:439f:b3c5 with SMTP id
 w9-20020a170902e88900b0016a439fb3c5mr46950003plg.131.1657095861586; 
 Wed, 06 Jul 2022 01:24:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 02/45] target/arm: Add infrastructure for disas_sme
Date: Wed,  6 Jul 2022 13:53:28 +0530
Message-Id: <20220706082411.1664825-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZSJFnoKiuGXH

This includes the build rules for the decoder, and the
new file for translation, but excludes any instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      | 20 ++++++++++++++++++++
 target/arm/translate-a64.c |  7 ++++++-
 target/arm/translate-sme.c | 35 +++++++++++++++++++++++++++++++++++
 target/arm/meson.build     |  2 ++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f0970c6b8c..789b6e8e78 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -146,6 +146,7 @@ static inline int pred_gvec_reg_size(DisasContext *s)
 }
 
 bool disas_sve(DisasContext *, uint32_t);
+bool disas_sme(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
new file mode 100644
index 0000000000..c25c031a71
--- /dev/null
+++ b/target/arm/sme.decode
@@ -0,0 +1,20 @@
+# AArch64 SME instruction descriptions
+#
+#  Copyright (c) 2022 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
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
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c86b97b1d4..a5f8a6c771 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14806,7 +14806,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
+    case 0x0:
+        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x1: case 0x3: /* UNALLOCATED */
         unallocated_encoding(s);
         break;
     case 0x2:
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
new file mode 100644
index 0000000000..786c93fb2d
--- /dev/null
+++ b/target/arm/translate-sme.c
@@ -0,0 +1,35 @@
+/*
+ * AArch64 SME translation
+ *
+ * Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
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
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-gvec-desc.h"
+#include "translate.h"
+#include "exec/helper-gen.h"
+#include "translate-a64.h"
+#include "fpu/softfloat.h"
+
+
+/*
+ * Include the generated decoder.
+ */
+
+#include "decode-sme.c.inc"
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 43dc600547..6dd7e93643 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
@@ -50,6 +51,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
+  'translate-sme.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
-- 
2.34.1

