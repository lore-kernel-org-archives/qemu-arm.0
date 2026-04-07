Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E5FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaW-0004GB-Hz; Tue, 07 Apr 2026 15:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaU-0004DR-5N
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:50 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaR-0007PM-SQ
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35da9c0c007so5170810a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591986; x=1776196786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQL9Hl0FES8WTZXjDlYkXc+8OCIhCSx/KV6Dh9R+V+E=;
 b=gHI8zR0w2P2MJxt4PGP4QpKVkLkbV5lKGH+N1zD9pCCbIT1VIJ2ld3KzV5EEFik11/
 wta+fu39037pNtOIUOG/o+x20RzUd4XxT4e6KzB6vVmoRtYHi+zBa0Xq0vELAeHl7jOJ
 57+n0ZIdOqttVcnzmLBVDcZgayWa/72AXt6DUUE7sKchN8rsmAKKV6Zmi3sTIoaWsWX0
 4PELlr9kJGu14NjFYMBwF5Bn9MVnIMd8V3ypyTys3gftg31F0EsqfdBCbWlC4lEh4iR1
 2KndZ+tkMzSoBh8Hgph7XkXW0hq314hcjdcTdhWbqb4iAj2JPmM5oEkVA8hIyqHdrrVa
 ZuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591986; x=1776196786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KQL9Hl0FES8WTZXjDlYkXc+8OCIhCSx/KV6Dh9R+V+E=;
 b=rRmAd/Udu58OPuwjHn1E3iNw0TEPIhiHPYC+k+kbsm0QvnrczBClD2JS8u8jrnDVrd
 eLblaJ612TE8pr5SCKzTzMeS8UF77oWjX50ZaL1mvUHkPFDZu2Md2BIH5a9MAcF10nuf
 /yOFXu09cIOX6gMc1y1FovBI7zzU7tm0Zdh0zbcB1ejk0Y0vqyE80qdQiuZac8pD6BxX
 +V8GIdunyrVuf7vTR1TzmQoSE5jC4trrbuoNzyReuY6zNUVPhZrv3lnwQ3MW6OSS0H8Q
 TD6L+lO0xdfv4/XQycPFoXuFeuXp2d3Q4RMjGDYRSiO6HEmL2GpPi/rCo0ca6w3aQXru
 P0ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyBsOOXkaLst4wr0IW9xnWh6Z8wvd8LOQVgEsDxnewfmJ5saLD+XXLlozzi6LD+mZs7z4fXudo2A==@nongnu.org
X-Gm-Message-State: AOJu0Yxyor1BkwLOPQ56JoFq2id/GzvTRDkg05KXCdq0ky6YsIWXuMER
 NDAdgKo5YIK1SBKqkCtO/U1FUkpst/PeHJ7VGiLkps/LyHRTapjSRxgHxMf5P9Q4hYXnmsUPtTI
 h1ReqVCw=
X-Gm-Gg: AeBDiese3jz/UnvdP3suV12bqyZFjTiRAp6jfIkshC1QHB2WrBy9dlYVZ1CI+9tvV8k
 BzvRZCzVIXxfPOa1lg8Y1CT6KcV9L1ECQEMobrWEVkTcWUFIga+KY7FlcjIEX8wdf7YxsrRcIZy
 IZaqaVLbig0DXijFS2OH23CY5RpPOygPTeZjvsnZYyvJCBX5+qtLaneDNu0fEf+Ept+TG8Wqyv9
 7yDkvcvRmFAfrLlVT4tRpeHEs0VbILEd2GcyLoWwT1zg0Z/3KG5sipuWhri4MHO6D12JqdHJSLi
 hexLl2NUlqHuIxjhILcawjBhzFnMsxAHkJjiw2oDZkIq1blqGiPbxsOSPJelFXMG2KmMiELhajw
 smbuFqYwDbhId2VJliOyTUvs+3mAOhkKexa8jid0do8jlEc3VjFFUoC1Xm8GzcP583o/kDqzgNX
 e1j3EyH/7M081/qAaWlkP6JhieJ1GCWb7+jqQViNit+fzHYu4Ohv3kiEtKb00nJmCPltoZ+LxQ1
 Suvpl0HBytoW9s=
X-Received: by 2002:a17:90b:5583:b0:35a:329:73d8 with SMTP id
 98e67ed59e1d1-35de67a0817mr16559057a91.4.1775591986365; 
 Tue, 07 Apr 2026 12:59:46 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 17/21] target/arm/tcg/arm_ldst.h: merge in translate.c
Date: Tue,  7 Apr 2026 12:59:18 -0700
Message-ID: <20260407195922.196410-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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
index 0b3b4ab86be..20f5bdcbe2c 100644
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
@@ -6281,6 +6280,20 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
 }
 
+/* Ditto, for a halfword (Thumb) instruction */
+static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
+                              target_ulong addr, bool sctlr_b)
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
@@ -6515,6 +6528,13 @@ static void arm_post_translate_insn(DisasContext *dc)
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


