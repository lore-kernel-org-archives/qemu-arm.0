Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA9010F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYbg-0002W5-Q6; Wed, 08 Apr 2026 15:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY8n-00008S-Tv
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:00:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEod-0000sS-Lv
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso2232695ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600554; x=1776205354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPW1cE/fmyONyzC92p2j3tKoeEcHH77fUAfq913uUqk=;
 b=DyELtp7sG5M1GBRBv0xKKGMBcb/z7zatSjvpoLOVxSsXqb+zYE/69z5YuQXibMAAV3
 GPqM2xTHBct+PyC+EhnTdVIz/1qKKrvf6kFg1TWKjS3Qjs5lij8yoMfVI0KqmbQDUh5h
 h0qJIGxgo1vzqLn04SmpYGKcQafMc/YUb3sWNuLrH8b/LTTRYV0sBkrPjIH3B4JQpaSq
 L7/IrdJ8p8lkhWea8sUqkT5mZhN8QmbOffZRyX+D7Q/Png5xmSAoxTey3NBPcMxGznsp
 eXILgwWSg1M72HSQsn32lIEBDgn4viUYym3qdxK38cGmRaLUKtCaBB3qA+ZmdPdM1N+J
 LoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600554; x=1776205354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tPW1cE/fmyONyzC92p2j3tKoeEcHH77fUAfq913uUqk=;
 b=Y4U2vUz57GtZcsq7lRxt+li32hln7rlveEKF80T74Ob3/nb3jsjdjsSSShiBM6Hydo
 3udJUp8lDRWjSZbK8FWhc59SAZTM8u45sN7ti372zUl9gIUlJdn2HvXjqjvS1qv6+9AL
 /fzl+ZA8uZrnJySvUUrnaPYPsAVZ/xLALVNSXOKl9CoKxMolAa1MZPHKptMkO+Tgaflb
 gl5xgfPAWeUziB4evUeZWDvhRA4r4VI06KnKLutqPUHfLiTV/wkLUVaZFsva9bz5ISko
 6FYjqman2uKy01nlgBGwevyGaGtVBkLC7kGBF7FhybgAghI7unbYmVfyXIj5LqEB7ATl
 68uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqGcCghEEUORti3QFkofim6eDpqYjqPWHWVfkrf4KPXHOQB/X+qz8/DHqN7ga6q9/Nfeofs01rbg==@nongnu.org
X-Gm-Message-State: AOJu0YxRx34nr8xK8p820IlE3Pwhekr3a/JZ64GRR/ERPPt/QZIPPtOh
 10725/QE8dvUKO4T7J699IwnQ4G5ibmT2elXzltGWr0ZITPT4woqdTkect+SmiQOAWM=
X-Gm-Gg: AeBDietYaC5EvANN2H3ZOoK4uiK/WGS642RGHQMzUa65ihNSlDlGJwSmOMixRNOKZmh
 +xZ/8+mc+yj4BUETjh/Eo1ZLNpO3F1wxKfnWNNdEzJfj3u7oDhhAPuKsVDgMCQZzZqBQeQQlenu
 mcXmJh0sC2xcCxDphqyoCE5KFmqo7U6h+ltXMmTQ9jhVdf9jc7zSI1kV3bDrQjxuIvFfRFLlfuz
 sg7Uj9AyFXOZ5p80G/VnEJCv9rrGHWnWDDeRRhCZLiFjE9QVOy3fStv4w+PpWLnX54k5vyRuDIw
 KZ5waWXDiyc7uWFUpc0Oovp/1te9RQToYq3rnt+kWDtqQa0vS52AgJSVNewdEb0AyvLnXHbnpbn
 xUBq2G3ZU7ollZl44fQjDjBb1laiQjAZSu5ByPlj6+cuMvXrdGKP85ht7hJJiKruGon0/JeNVp6
 Y7U9+/cbUySfZs+QI88zma60n4QTBme/XJCLXnFYJJ7S0UlaGCMYglpbzFp82GhDG5z5Hp5E9Kf
 zmB
X-Received: by 2002:a17:902:e94d:b0:2b0:6365:217e with SMTP id
 d9443c01a7336-2b28206efdfmr170656095ad.15.1775600554253; 
 Tue, 07 Apr 2026 15:22:34 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 17/21] target/arm/tcg/arm_ldst.h: merge in translate.c
Date: Tue,  7 Apr 2026 15:22:04 -0700
Message-ID: <20260407222208.271838-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
 target/arm/tcg/translate.c | 24 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 48 deletions(-)

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
index 0b3b4ab86be..b6abaff4903 100644
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
@@ -6281,6 +6280,22 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
 }
 
+/* Ditto, for a halfword (Thumb) instruction */
+static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
+                              target_ulong addr, bool sctlr_b)
+{
+#ifndef CONFIG_USER_ONLY
+    /*
+     * In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
+     * within each word. Undo that now.
+     */
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
@@ -6515,6 +6530,13 @@ static void arm_post_translate_insn(DisasContext *dc)
     }
 }
 
+/* Load an instruction and return it in the standard little-endian order */
+static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
+                             target_ulong addr, bool sctlr_b)
+{
+    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+}
+
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-- 
2.47.3


