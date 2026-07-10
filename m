Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225F4C44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIGc-00047K-3G; Fri, 10 Jul 2026 16:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFS-00028m-Qp
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFA-0000vc-QX
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so1226529b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716873; x=1784321673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=D7uamCcbKptZF5/gWoDeMxTHveTlQYCOwvaB2wV+R0XYsjRioLNBj81mv0lXsCb8tu
 mBOiHoqXeIgr9G2jT2ZVt7mgnYA/D50C3MaMFAaoNyUgHD9tmSM+Rc/ERtg13Q+59JWf
 FZn1ha/2+jQmZyGDHfaTBCppjXz6HauXW6qZP+ponMw0frIah4ivLw+V/MIJ3DBqlcJB
 yOIcS9tML/QbjOPllTzY/UADUM7wmptO3acUD5IkFUuD6mgGtnUEoYILMC5J6Sm4Whao
 6trghKSLWVUPGsL17IHmK86nJ4DWTSwKekva5pJeal6z0IJwe4nMisD3yA5cmiOoCHqt
 9XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716873; x=1784321673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=fQvsKxn+pD2Sh06P1QS/nYC3aIp+2ggUgQ3UE7GJTozuWMf5SKbXcpWUdPpO8n7ZAe
 olie8OfgYTGraYTRDbkn8ZMhHrL+rzCl7W7QbMyhXoBdGGx8osvyhEpLK6YsvXaovBiT
 zLtafymu9+Zc442Th/MILw1hPOkxlnzwUiV8SsYmFyvV/e1xwYaRD+RK34JO0THiIFer
 PpnoiGTa+ZlnOOFix/62JZu3I3c3p8gZFFGlYufdM0mJQWjyXFXOVttSLzZsfJS8neI/
 jevMhJdPEtFF541rhYwlhZ9/sv9+v25NWMETbT5pdRjJy5l7MA2qmDkobaLMmqtHYVQt
 dQjg==
X-Gm-Message-State: AOJu0YxWyx5HSkMDWq9tbWlTD/gksE3HmpTpiLHJuoMfcH4Cr7yBn6W4
 HKAshijHbZiX8/sViwsBm6HlH4M/PJmdX0pohiy4y7IgaplNABRqlOu3lZRb8oIsvG4=
X-Gm-Gg: AfdE7clrfe4sjXLEwBgUpQ6bbTNiFwI+fEL68pG0bFQ1z7HKCekMRKtedjELe0RN9d6
 nnV72QSMWhHh/JhbfWtEkHEGKX1IjVrP7a3WT+ce43ZyMALlUwZI2H9OEr74jpSTKvCW4ta844V
 f81pML6nOlKcsQRwikFcFFy613SmpU41rR0Ter73LG16JVoco33bys5cVBAw+RpoQzQRgJEuFRS
 gTK2Ax5mgjQCa3m4QffQrjdP0d2hg6cvVI9fAgICdmPG4ZiK12Ao+QzUmtXQXJHxKPrdHpau+hv
 iFoyo2PrH8xlHONZ80t2OfQxuB15blL+QitUxmMqUPIgqdiQbHF/bPA+wrTWfdMVTPhyn5Hwp/5
 cqeOBy9qgjHk5wnWwYSppR6AhAtfG4V3G6J0e0CgrI7MR+F+S5yOdQa8jU3YvRFNHODe3SUvZr6
 bzTzGiKFBgapw/VXEWK0KyCRz98mzs
X-Received: by 2002:a05:6a00:14d1:b0:848:2f6e:e532 with SMTP id
 d2e1a72fcca58-848897cdcadmr473243b3a.70.1783716873368; 
 Fri, 10 Jul 2026 13:54:33 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 28/51] target/arm: Use CPUBreakpoint arg in
 arm_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:38 -0700
Message-ID: <20260710205401.836304-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We no longer need to search for a matched breakpoint,
test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index fe8513a5de..d705f7aef2 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -422,42 +422,27 @@ void arm_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    CPUBreakpoint *wp_hit = cs->watchpoint_hit;
+    uint32_t excp, syndrome;
 
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+    if (hit->flags & BP_MEM_ACCESS) {
+        bool wnr = hit->flags & BP_WATCHPOINT_HIT_WRITE;
+        syndrome = syn_watchpoint(0, 0, wnr);
+        excp = EXCP_DATA_ABORT;
 
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception_debug(env, EXCP_DATA_ABORT,
-                                  syn_watchpoint(0, 0, wnr));
-        }
+        env->exception.vaddress = hit->hitaddr;
     } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
+        syndrome = syn_breakpoint(0);
+        excp = EXCP_PREFETCH_ABORT;
 
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
-
-        env->exception.fsr = arm_debug_exception_fsr(env);
         /*
          * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
          * values to the guest that it shouldn't be able to see at its
          * exception/security level.
          */
         env->exception.vaddress = 0;
-        raise_exception_debug(env, EXCP_PREFETCH_ABORT, syn_breakpoint(0));
     }
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    raise_exception_debug(env, excp, syndrome);
 }
 
 /*
-- 
2.43.0


