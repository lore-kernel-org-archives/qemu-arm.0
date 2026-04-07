Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDF10F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYcC-0005Pv-Qo; Wed, 08 Apr 2026 15:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAYA9-0000v3-6S
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:02:05 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoZ-0000q0-A8
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2b0afa0210bso27728865ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600549; x=1776205349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMozfKLpPr+o2x65kY+FaUHoEdApriGrkE0DK1FGUcI=;
 b=IVSIyItd3BO0Ba+TQORYM+wUeukx7eYzPo6VTSiSbc/xF3vVA5pLQlKgg4TDiJgxdF
 wrm2JWy3uUErpPXegEdBBjCL/PlBc8xCLn7cys9ShusVb1kffUP9ssq4rbrIozlQii7N
 BbgrGI6Rj/UB0lFF/c3bqnrJSGYDd4/gtGHDgc/V5N/vxjnhWNxsM6btNQJc2N8GVGK6
 Es2Lj0l6cUekdGi0kB/qc+xvhMbJ7ijmAo1ox2EFDxdLH1sQ4tMCmPjI8mqXbxqtezyg
 vP1W9Uoc580pqHaP3o8DFca8a9DHudfHnJjbVM8xWZpLTyDSQGICs4v95xzA6EB/Tc+m
 My9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600549; x=1776205349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QMozfKLpPr+o2x65kY+FaUHoEdApriGrkE0DK1FGUcI=;
 b=U/C+xc5SkRPi6XdAQwuiFsFdA0kHP9OQieZirT5R5VdSomS2ZKjqdD4t/3HsBCHSWY
 o+SNmp1zo1fTep1jrrWsQK+8gVYOGs+Fm7eobI6AHKKTuSHoOTz+OMatg1qssDMLsQPB
 MEh3JsP88+63V7PY/jVxj5Wyl5stzliVScT4/Qn6vV9JHW8TNMsHO1lw2r3NSR+T7O3w
 qfVpLRXPrySlzU7+6x+Vxa9pBe2ulxljPGF4yrwSTkngwYeAF1sMOaOGeVdckY87tDZT
 REEuOJQqlSydTJTtXn9Jel8VY1ijpGmJ79UF8QJzHUNE/9gysDv/JAJEuzH+Wi+e/4hD
 wCMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTxtm1YnudfF05TMyktdvgLnDLEdJG1ETqshD2S2xLhBDUpJZWoKPdBqQKBXKoZO3A7K1D9ZZI0g==@nongnu.org
X-Gm-Message-State: AOJu0Yx2DNZVDQr7Sv9SHiQ/JptCqs3NAmpBZZcItwmGWRuo0/uzZ3P4
 Jk7n87exSjwZGDdxvp1PCEwoBrzADAyqkzFZTysGgP+yt5tWKBlr0a7Cw8z7p3D+j6U=
X-Gm-Gg: AeBDievNsNYUVvx7w2TG5NfddTle3OV+lZQDjVr/2ncd3M9xgO61PI/YhL7IL1s9dAt
 U4CzM/etf2al4Fok2DlmorkenBWgy4j2C/QCsQuTuv23tNJlicwcQw6VPNoPgBUqD/zWR8e90a2
 nX8fPjZbkCWqdVIVxmYHXeawbD46FdlUw9/08e8KhpczFE8zOyXau1OSLkNrlZzVcwn0acPFu3k
 ghXYJd0v8D8471pYhug36aOkhdiN045K06mm9+IJj8rt1Of6bjupJO4Xa0r7FsZZ1eVlipScTdV
 fUa75bdobcXmaKHdRMtJcDkrEWJI2P5+sO5ENA8sLuX3tA2khiKuZwNJK3NDn3tz5Ls/agRg9Yk
 4SDxef5nKOv90XD1ypmoY2O3ewXiKai+P1ByAfxdp+2/1WvivUOJk98JyDZEICuwbyZw8IFW1W3
 b8JMVCRECiYiM/aQWlzxPFq2f/DdgL/Y2AuQaZ4sz7pOXcOqloX2lcYWX3aSof9XFyab2FcRppA
 nhQ
X-Received: by 2002:a17:903:3b8f:b0:2b0:445a:8c7b with SMTP id
 d9443c01a7336-2b28181f77amr196965195ad.15.1775600549042; 
 Tue, 07 Apr 2026 15:22:29 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 13/21] target/arm/tcg/translate.c: extract
 aarch64_translate_code()
Date: Tue,  7 Apr 2026 15:22:00 -0700
Message-ID: <20260407222208.271838-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

This allows to get rid of TARGET_AARCH64, and helps with next patch
which will define at runtime tcg address type, by adding a second entry
point in a different source file.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h         |  2 ++
 target/arm/tcg/stubs32.c       |  7 +++++++
 target/arm/tcg/translate-a64.c |  9 +++++++++
 target/arm/tcg/translate.c     | 19 +++++++++----------
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ec27508473..2850edcb198 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -381,6 +381,8 @@ void arm_init_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
+void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc);
 void arm_translate_code(CPUState *cs, TranslationBlock *tb,
                         int *max_insns, vaddr pc, void *host_pc);
 
diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
index c5a0bc61f47..3945dc49e5e 100644
--- a/target/arm/tcg/stubs32.c
+++ b/target/arm/tcg/stubs32.c
@@ -3,6 +3,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "target/arm/internals.h"
 #include "target/arm/tcg/translate.h"
 
 
@@ -15,3 +16,9 @@ void a64_translate_init(void)
 {
     /* Don't initialize for 32 bits. Call site will be fixed later. */
 }
+
+void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 35ad7530c4b..7533a4d01b6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "exec/target_page.h"
+#include "exec/translator.h"
 #include "helper-a64.h"
 #include "helper-sme.h"
 #include "helper-sve.h"
@@ -10949,3 +10950,11 @@ const TranslatorOps aarch64_translator_ops = {
     .translate_insn     = aarch64_tr_translate_insn,
     .tb_stop            = aarch64_tr_tb_stop,
 };
+
+void aarch64_translate_code(CPUState *cpu, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc)
+{
+     DisasContext dc = {};
+     translator_loop(cpu, tb, max_insns, pc, host_pc,
+                     &aarch64_translator_ops, &dc.base);
+}
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 204f9657993..9ab926b118e 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -28,6 +28,7 @@
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 #include "exec/target_page.h"
+#include "exec/translator.h"
 #include "helper.h"
 #include "helper-mve.h"
 
@@ -6878,18 +6879,16 @@ static const TranslatorOps thumb_translator_ops = {
 void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
                         int *max_insns, vaddr pc, void *host_pc)
 {
-    DisasContext dc = { };
-    const TranslatorOps *ops = &arm_translator_ops;
     CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
 
-    if (EX_TBFLAG_AM32(tb_flags, THUMB)) {
-        ops = &thumb_translator_ops;
-    }
-#ifdef TARGET_AARCH64
     if (EX_TBFLAG_ANY(tb_flags, AARCH64_STATE)) {
-        ops = &aarch64_translator_ops;
+        aarch64_translate_code(cpu, tb, max_insns, pc, host_pc);
+    } else {
+        DisasContext dc = { };
+        translator_loop(cpu, tb, max_insns, pc, host_pc,
+                        (EX_TBFLAG_AM32(tb_flags, THUMB)
+                        ? &thumb_translator_ops
+                        : &arm_translator_ops),
+                        &dc.base);
     }
-#endif
-
-    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
 }
-- 
2.47.3


