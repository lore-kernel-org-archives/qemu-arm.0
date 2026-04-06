Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF3F46C66
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:28:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oeq-0007Z3-3g; Mon, 06 Apr 2026 14:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oen-0007VJ-4V
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:41 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oei-0002Qb-R6
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:40 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c742b9b7727so1039543a12.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499995; x=1776104795; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGNNUspwfjjVphep29b2Uy+Py50M4N0M3ribH84tHN4=;
 b=iRb/kDL/cZRur2XGB16Up9aM4llLQ6zJTHqTQMpJxhCmxnE2y30+zRscAolZuY9Sgj
 4qjRfFsx2o3MbTx55eVsJ9Cq627K44fnyLQaTTzylAmHlZLl8+2Tx+v85HYaTH4CBHal
 YoFgHcKhRnxPROL/uutG6lIhMbvID9smZ+ZnPlbskGOSs7+Df9rrVeY/p+Xqznhjia4P
 O8Fp8qPUYTddpVR42mlaPmoDh/RzdGmJBg2MGLo5Djq2I+jr+xMB54dejuyl6W9rylAT
 B0JiIyRD8qXfmYUoGuAEF4BItzSC2pyNXR2P1KgublZqOm/Zh8yzA1TNdKF3N6qS+7nl
 NCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499995; x=1776104795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QGNNUspwfjjVphep29b2Uy+Py50M4N0M3ribH84tHN4=;
 b=Znh0SDFEA6SPvnD/Y8+jQZZpQdVoxf1dvu/NAhcqA5Gx27RewsjjmrfYcGijLmuOMO
 eUBJamYGh0Hrkw5uRyj+aVJt4Focq3q35KyeX/0TgA1z8x+4A8+ieVsUND48qviAVjJM
 peqP6dcRVmxzP5cmrtqRsoOPXa0Em0uiYNnngQQYis4X0Kf9IOYPZ10HYgdPfgylT222
 HQirDW0rVpNab+m4kJWU6v7WqEwGMoX7nkri+BcOisfsAjqrQHH3+GprTqVQb4WHbhrH
 FmnEH5l0i4KhOTRQlNk8pwkhO1Rer8FVJRJGxDnitTDths6oH7loqVq0P7mp4UZVWXwi
 Pk+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvbNkDof3y3VJ9fxfWO1voXsap1TFGzA9+YUuforBsqxs9zFwerTKnQ2N1ekFooA7WUlidrlNV8w==@nongnu.org
X-Gm-Message-State: AOJu0YzjABgyxwlhXKfMhygXFGyVGHxg/E2qdHRuWZpWjizyOI7oIXbL
 IYtFgqYMatal04ydi7XoxgQ3/sYOfMR4XrXnBf5XsARk1fsY1G8jV04yFqFOHo8rXmJlwLCYSLr
 sm6nuWYQZsQ==
X-Gm-Gg: AeBDiev+GYkOHBZTC0e836hv2sVoZq2rYn+JuHvQMIouxRKXuzJMHIr92L6avK7YIVc
 7CtRJ+5FODfx67U2k3OeRafnTIFxm9LBbu65WlNPcV9FK1FdMu/wxvmQ8JI7+oivJm8xbDvBTO+
 qXX1M9WNuzWbvdBwF/0fEPg/0xkVpuWZRCTUyfLUukYTzq5aBScM2D3clp3l6g6D85YeiXVxFnG
 YKSkFk4D4+y9d/tKz+wsrETlrlB//Dwsc69zIBaCorixEjFn8tol5woPiagluo83H7+Zaul2Wvk
 v7MQJ1UGK6tIG5BN1KnfM3rV9rIBpDFAcyYkM66eE0yLKT9K8yReno/YkEIdYDwskUGbHFORhQB
 IchY1+teTL0S/PwNh4h8m/nyGG4Z1vAQkSqYXUzfieiZV7oi0ni91OO6Gup2ax3fq4YhX//300a
 rG8kiv+LLc2rzv1DCO82yRED2sOZfri9+oFh0Hw3h0q+IgXr2UKUBakjnaJzhnvnDqzBfhuDb6Z
 vO/
X-Received: by 2002:a05:6a21:3286:b0:39f:7183:b1ee with SMTP id
 adf61e73a8af0-39f71840e38mr4367726637.15.1775499995372; 
 Mon, 06 Apr 2026 11:26:35 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 16/20] target/arm/tcg/arm_ldst.h: merge in translate.c
Date: Mon,  6 Apr 2026 11:26:05 -0700
Message-ID: <20260406182609.193886-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

Only translate.c uses those functions, thus move them back to this file.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
 target/arm/tcg/translate.c | 22 +++++++++++++++++-
 2 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/arm_ldst.h b/target/arm/tcg/arm_ldst.h
index cee0548a1c7..e69de29bb2d 100644
--- a/target/arm/tcg/arm_ldst.h
+++ b/target/arm/tcg/arm_ldst.h
@@ -1,47 +0,0 @@
-/*
- * ARM load/store instructions for code (armeb-user support)
- *
- *  Copyright (c) 2012 CodeSourcery, LLC
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef ARM_LDST_H
-#define ARM_LDST_H
-
-#include "exec/translator.h"
-#include "qemu/bswap.h"
-
-/* Load an instruction and return it in the standard little-endian order */
-static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
-                                    target_ulong addr, bool sctlr_b)
-{
-    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
-}
-
-/* Ditto, for a halfword (Thumb) instruction */
-static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
-                                     target_ulong addr, bool sctlr_b)
-{
-#ifndef CONFIG_USER_ONLY
-    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
-       within each word.  Undo that now.  */
-    if (sctlr_b) {
-        addr ^= 2;
-    }
-#endif
-    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
-}
-
-#endif
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 6ea48efbac2..7fcf0656630 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -25,7 +25,6 @@
 #define TCG_ADDRESS_BITS 32
 #include "tcg/tcg-op-mem.h"
 #include "qemu/log.h"
-#include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 #include "exec/target_page.h"
@@ -6280,6 +6279,20 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
 }
 
+/* Ditto, for a halfword (Thumb) instruction */
+static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
+                                     target_ulong addr, bool sctlr_b)
+{
+#ifndef CONFIG_USER_ONLY
+    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
+       within each word.  Undo that now.  */
+    if (sctlr_b) {
+        addr ^= 2;
+    }
+#endif
+    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
+}
+
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
 {
     /* Return true if the insn at dc->base.pc_next might cross a page boundary.
@@ -6514,6 +6527,13 @@ static void arm_post_translate_insn(DisasContext *dc)
     }
 }
 
+/* Load an instruction and return it in the standard little-endian order */
+static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
+                                    target_ulong addr, bool sctlr_b)
+{
+    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+}
+
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-- 
2.47.3


