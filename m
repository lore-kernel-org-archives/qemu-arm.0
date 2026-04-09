Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DEE98FA9
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPm-0000ie-RN; Wed, 08 Apr 2026 23:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPl-0000ht-9W
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:45 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPj-0003tg-Lo
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:44 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b0ba3bfe16so2429155ad.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706642; x=1776311442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=deKxnJ9KTUlUyf+gjXytl44RGJOeX3f90U/OxiKn/OU=;
 b=ZPPqX3Mb8uWU+IbqC6Sh97FveSUjkGEx4kn5hsDp6cVBda7FYofz+6aCqczXfCIenX
 9V6Okt3iG+SnV2lsz+lxboZ5NMp7uuRt66IiNB2vSrV/seXVKxwIilv+NU6YTwqKhXs7
 FaFQUHMasrfU+nRyBEJFoNSq6xH809F+d0q/S2dmfo7J64ar4BBO2Hus2hxQ1cKDJXFe
 lJUXmQhddJnNl/2WH3oQbvSJZRtqNfkkDbSKkCjWZT9qrAnIWpBRlM12dfHXzQJN1BZ0
 QVpnEBLBAI/o5bqq4rvI653P3z5kgWmRt4Xb94918MjYc5oY6aMQ3nE/gyxSrSBdyk8H
 YBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706642; x=1776311442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=deKxnJ9KTUlUyf+gjXytl44RGJOeX3f90U/OxiKn/OU=;
 b=tF92WWE7wJMUxGR2KvprdE/qDedtqCtWyEvPU7LC1QZ6WJT9nXiKxco/RdjJ1dlS/I
 XBq/dwV9xUPXl/4vBXXFkb173geuzjJ3j1eOtbI4g9ZGHVwoVndoG+6fVp0imhfwHuSB
 qm20FmuGEiztp9iK2sm8U4Zdl2B02lWwXvvYGr4pBFn35p9pKftL0qjOw7P/zap2v+LI
 WyBHydr3z7iF44krYL0bTbGxKSiEMU0lBsmJlNLZknsMUsQedzEpRc6ceYgH1xiOm7kM
 Rclkwv3jFCCLjAtbcoksEYNGb8rMgY0DcivoFfMSTnjvOMT374DSmG9OtVAyTj2GNlNL
 G+dg==
X-Gm-Message-State: AOJu0YyUHEmcsLLWiWNSnqhGoxXSIV2c41UC2R4JrrATe8OObuXkfx98
 t7042d8yUOmBJ/1KmsdJYipeObVsRl8fvX71HSGETQrQwJMO45RnVAxoTxbsY7x/ktI=
X-Gm-Gg: AeBDietpQGdnoQFol8sDpYuIgMEw0e2Q5HrX9cYnCxB9FCY2VF843WgHOKlq0LCbTIB
 EnTpkHcc8Ulc9Ei5IuB7V5t0XzeSOnuKZrll3DJqP06N2kPwC5L0Q7nXNqOZQPGhCkcUldBhL6E
 JY3x2MpZh4nDixPWumacGXckmIJWmE57SDWc1YWZ9ucyGfmQeYgftQ6O2js4efdTUALSQEsO9NN
 rqDukRvko0RYSHVsBdYcWzkWURGwI6JrCd9dGWKE5kxZibyFRLEbqqW3Uvi1MoCx/ErDMeuszgb
 xk8bVK/VZvQxkd9DSOIG2lgjEXLz+3j1cX++bPiYxGkokja6QD9cpDOzD2E2JhNtL34V0PWyF+W
 TOJ+3S71KSYWFD0WJbsVhMIa5uzGwZQsCtq9nK5iV8nnC5t29pBTx7xMBdH9jwYdgXca7FEEiyQ
 1o7le+6rng4abZbg6RWcRb0Nn/wqEh9FJs0W2WY/a4VMHSUrg0sxw5Jhn6
X-Received: by 2002:a17:902:cf12:b0:2ae:5ab4:f4c0 with SMTP id
 d9443c01a7336-2b2c73040a3mr16951275ad.13.1775706642016; 
 Wed, 08 Apr 2026 20:50:42 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 6/7] target/arm: Introduce EXCP_NWFPE
Date: Thu,  9 Apr 2026 13:50:14 +1000
Message-ID: <20260409035015.132370-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
References: <20260409035015.132370-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We don't normally emulate any coprocessor {1,2} insns, but
linux-user would like to emulate these fpa11 insns.

Filter these, raise a special exception, and store the
instruction in CPUARMState.syscall_info rather than reload
the instruction in the linux-user cpu_loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 linux-user/arm/cpu_loop.c  | 34 ++++++----------------------------
 target/arm/tcg/translate.c | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5b564c7113..8f1afca2ae 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -64,6 +64,7 @@
 #define EXCP_VINMI          27
 #define EXCP_VFNMI          28
 #define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
+#define EXCP_NWFPE          30   /* linux-user fpa11 emulation */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 4f7c5dab9c..ae941ba9af 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -29,19 +29,6 @@
 #include "user/page-protection.h"
 #include "target/arm/syndrome.h"
 
-#define get_user_code_u32(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
-            (x) = bswap32(x);                           \
-        }                                               \
-        __r;                                            \
-    })
-
-/*
- * Note that if we need to do data accesses here, they should do a
- * bswap if arm_cpu_bswap_data() returns true.
- */
-
 /*
  * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
  * Must be called with mmap_lock.
@@ -262,24 +249,15 @@ void cpu_loop(CPUARMState *env)
         qemu_process_cpu_events(cs);
 
         switch(trapnr) {
+        case EXCP_NWFPE:
+            if (emulate_arm_fpa11(env, env->syscall_info)) {
+                break;
+            }
+            /* fall through */
         case EXCP_UDEF:
         case EXCP_NOCP:
         case EXCP_INVSTATE:
-            {
-                uint32_t opcode;
-
-                /* we handle the FPU emulation here, as Linux */
-                /* we get the opcode */
-                /* FIXME - what to do if get_user() fails? */
-                get_user_code_u32(opcode, env->regs[15], env);
-
-                if (!env->thumb && emulate_arm_fpa11(env, opcode)) {
-                    break;
-                }
-
-                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN,
-                                env->regs[15]);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->regs[15]);
             break;
         case EXCP_SWI:
             {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 0447be0907..d910a007db 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -2358,8 +2358,26 @@ static bool valid_cp(DisasContext *s, int cp)
     return cp < 8 || cp >= 14;
 }
 
+static bool maybe_nwfpe(DisasContext *s, int cp)
+{
+#ifdef CONFIG_USER_ONLY
+# if defined(CONFIG_LINUX) && !defined(TARGET_AARCH64)
+    if (!s->thumb && (cp == 1 || cp == 2)) {
+        tcg_gen_st_i32(tcg_constant_i32(s->insn), tcg_env,
+                       offsetof(CPUARMState, syscall_info));
+        gen_exception_insn(s, 0, EXCP_NWFPE, syn_uncategorized());
+        return true;
+    }
+# endif
+#endif
+    return false;
+}
+
 static bool trans_MCR(DisasContext *s, arg_MCR *a)
 {
+    if (maybe_nwfpe(s, a->cp)) {
+        return true;
+    }
     if (!valid_cp(s, a->cp)) {
         return false;
     }
@@ -2370,6 +2388,9 @@ static bool trans_MCR(DisasContext *s, arg_MCR *a)
 
 static bool trans_MRC(DisasContext *s, arg_MRC *a)
 {
+    if (maybe_nwfpe(s, a->cp)) {
+        return true;
+    }
     if (!valid_cp(s, a->cp)) {
         return false;
     }
@@ -2380,6 +2401,9 @@ static bool trans_MRC(DisasContext *s, arg_MRC *a)
 
 static bool trans_MCRR(DisasContext *s, arg_MCRR *a)
 {
+    if (maybe_nwfpe(s, a->cp)) {
+        return true;
+    }
     if (!valid_cp(s, a->cp)) {
         return false;
     }
@@ -2390,6 +2414,9 @@ static bool trans_MCRR(DisasContext *s, arg_MCRR *a)
 
 static bool trans_MRRC(DisasContext *s, arg_MRRC *a)
 {
+    if (maybe_nwfpe(s, a->cp)) {
+        return true;
+    }
     if (!valid_cp(s, a->cp)) {
         return false;
     }
-- 
2.43.0


