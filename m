Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA85CC87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjc-0004u6-7x; Sat, 02 Aug 2025 19:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhi-0008R7-RD
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:55 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhh-00056g-2G
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:54 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6199bd724e1so54949eaf.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177512; x=1754782312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGaWh6qB/XNYeP5vG0YKYiWrjkJVNrqnpJ3x4KugETg=;
 b=JL23AYsHSmpbzDwC6HBVTjOfyy6MP6m3D9GVtsBTYUUBPZrfGU/8VD7yD4MtXc14zB
 emVQysWGrVQ87DQ2uaZS54YZ0gSQY96lBgeJ/WoKwMM3aPU7xVvDZl9uancIHIYKyq8Z
 RZKS6vVAVs02QCX/2Po8dNVjbNuHOPv3e/OduU2jH99IBZHNk/XO+OpUbN+R/jrylj0c
 cGqoL4XWui0+tGMuVv2vVZQZ/h0QQ8pZnK2UL2P7BuN5HWPTSlZNR8mV6Vlv7P7r4D3H
 jaPvpO0Hk/vGeYG0LoDXS9OkDixrlKiNAOebaarAczg+pBlaExfc2ilaYtxzUA6th8cQ
 xMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177512; x=1754782312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGaWh6qB/XNYeP5vG0YKYiWrjkJVNrqnpJ3x4KugETg=;
 b=EU54xcf13fpcqdxN9QMgibhY+3cWUBWSirCNLdr969jUzvYmefjNQ9Sp4KRtc0eAN7
 B/Knc8FVysrlMT+WK3jSTLcoh8Wa89Fb6+yYTSQpwEgEqTGyLkQh+9t0TvjsR/7KfOUB
 eTa+Z2gB9bRMUk5AzpX7JKmE7z2os09l+xXJGaJGC/03cZbyQ3Ir7KpT0UHKhPWu3GdS
 R+Fh6DNZFeKkR3lIhmYQromWMpnpIlqnKTXHtD9Sp55+9qLAD20Q5NOaNGhnZhZJhNds
 i+aW/lFLniDlPcrFy4XlESxZOqY8ftPwnoXK2eo633Sa+DAhhk0Je9pz1N8wXdEE3lYR
 ab/g==
X-Gm-Message-State: AOJu0YyPwlaWoNPJA3L3GdVKBU10mBJU4W/zaoJ4z6g5i6lT34W/csum
 nTE6gM1M28yn8/TUIsciR0Yp6k5a/DX3kWnvJCIOnn5ZN1Qbt4IlLRAc/iZmQsVmmUE=
X-Gm-Gg: ASbGncufchm/OL3aYMfrVa54io3At4neGCh8SouBkE+C4RrDk6UfHUAOsaGaCH+lTdT
 O4+RREYR8wj8geeoHanmMcuUXcgilk4eapVm3lnlDoqDbBivWYpnRx0r8TqYfPqSgn1dGKLLZ0/
 jBwxu618MwOhVn6cKAIpe9Ex/sPH2+o/F3iJuPP2keQmBE/aPA93cUhCDYGsrY3pj6Kzmss4ZrQ
 FpQEsWHr9x8igsYXBcCuAp2mMyD9RnDVasdXNYfG+JoRoRbv74GykUoDA0nqXDEinfPt95a7FaA
 zq0bqGxDauPhByZ3YqU7FQ46gWr0FmC6QcOxzq68TwA0XxndrTkL6kiwb77R41l2Mx32xZAW6qw
 IQCbrFSEvrfHmrDBZSrztnXhxns0Dt4oPZpu1uhjO1FUFsDc423H+
X-Google-Smtp-Source: AGHT+IEYragkG9sFyeueBHpelys0pg8+Y6YrfUjagcM1Me2m42UOdmWOFIzaoKnmJ7tpZtd4lURflw==
X-Received: by 2002:a05:6871:2881:b0:301:1218:60a0 with SMTP id
 586e51a60fabf-30b679a5575mr2751857fac.34.1754177511972; 
 Sat, 02 Aug 2025 16:31:51 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:31:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 23/85] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Sun,  3 Aug 2025 09:28:51 +1000
Message-ID: <20250802232953.413294-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
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

Prepare for raising exceptions with 64-bit syndromes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 +++---
 target/arm/tcg-stubs.c     | 2 +-
 target/arm/tcg/op_helper.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f0e888ff93..fc82dd65e8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -306,14 +306,14 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
  * and never returns because we will longjump back up to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint64_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint64_t syndrome, uint32_t target_el,
+                                   uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aac99b2672..aeeede8066 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,7 +16,7 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 575e566280..46a3b911ec 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -46,7 +46,7 @@ int exception_target_el(CPUARMState *env)
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+                     uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,7 +70,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
-- 
2.43.0


