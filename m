Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9CCD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 11:45:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSCfc-0005NW-5q; Wed, 27 May 2026 07:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfa-0005LT-84
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfX-00005Z-Hc
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso80055255e9.2
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779882206; x=1780487006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nGT9Jp4pthasA5g2F4sYzBBA0JTzuDlDIySeJkpXWw=;
 b=eO8gg54NhNvbwpkBDkn7wVdsSS2Ju85gT6XI1w7ZM+7IBJW0rWbl61mEnmPbyCplHe
 EkkjZaYn1yTdEUcKIXzcoc0iPmwUuRoo5QstIRl3iZfjEs7WiNN/5IanySyrkqW4om/O
 3guSJfCBmNyDIwyYuZRpF5cJamUvqXwEweP1soO8JM/AMjMHY2Am+LE1jzOeFv1U8epj
 MxLEmTdepWzGs0YiMxNGU8qfGBb+xYWbLNs2T93YquJaGeUEj/zyPQzaOHA7ZvTxjHlm
 Jewd3tNGY51HHevsBGFASDDKRX1sczUfj393MKrKEEzc3GhIqMyYaWFHumsAysbQe8rg
 52Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779882206; x=1780487006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0nGT9Jp4pthasA5g2F4sYzBBA0JTzuDlDIySeJkpXWw=;
 b=YWjYRVG/6bk/c4SWCgJa/Y/BhWFnShrpyD+ugSnSvi3s/o7wJyTuCN0B/eqEYBkkPd
 ApvWIyk1WUN8NZtJaQRTOljSxexVYCZPz8lsXniTGtwa386EU12Nn4ldYA4feAd/0w3v
 f7TbkYodys7VXbIvJGjTdBwX0pnEERYJoIfbdEspibzri5p8vRaE0sSTbweIXzC6YH8W
 WZGYolXzFHfeE31yTZrdrf14XEhyS0jNEk1y2n/g3pVHh1sM2S7RQMGyt63384mgyphX
 +hE0hbQ16hEtGtKr2d2k77I4USXHA3vpT8Kk5ueZjtqbnCmyhvvVtugNJCC3t6NUFKZa
 Lz1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gCWEk3ExKWWhpKkGcjPAHuM8h4RSnkqxG9wdoW/nBqAbF5WAvIhixD5KgZaJoUS5XLg69eSi8tw==@nongnu.org
X-Gm-Message-State: AOJu0YzdDZCtW7K7YOeWXf6AyD/oxXlSYur9NxXcQsLZk5b2srrkL0pQ
 R7EoYS+B/UqT5kldFHGodamqGp77mavjQlINsG3Cr2mwK6t3B+jneWIB1LQSp8C9yBg=
X-Gm-Gg: Acq92OEGnuw+W94Hd8/DvVlfrolpSD1s7TBE14RGuu2cMNTWalp088kJFpaM4bx65TH
 8QS9wPAa0N/zWROihfyheBnqxSCZqNDrv3vkpXXADMytfZz7CSBjCxg/wFVRuhXFXP5fnd8p3hm
 oY/bRyracf1U48w7JOM7riHOZRlg6KQvNdRSB2jMneROP+tKDcD+ZTX9eabihxOcm2FJS+kyHgb
 1yRcgRHQR9dIoSnWhWLfyxsoxTnMy3DtgQ3VcmDa9PWxSkd5dd4brmwIop93iwrN9u0x21Q1zz6
 k+WnN4tW6qm0ruxHCWPuydAUy3TZ2sAVNOTlzRMhhfYiRyosgPFH5C34W4EezdG+s6/O0tUK/oi
 Y0gXk7zzBG2keoc6/WaQmiJjgdj7lBThn4CBldNive7Sy4dfd9NJH45cfjNlnZ5myOnEhBSwX3s
 bheUzhfVF4o1pahYARhD8NtjE=
X-Received: by 2002:a05:600c:45d2:b0:490:6237:521d with SMTP id
 5b1f17b1804b1-490623753admr219397755e9.13.1779882205893; 
 Wed, 27 May 2026 04:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045620c05sm389935035e9.14.2026.05.27.04.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 04:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8D7045FFEF;
 Wed, 27 May 2026 12:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 7/8] target/arm: handle the WFE trap case
Date: Wed, 27 May 2026 12:43:19 +0100
Message-ID: <20260527114320.1581552-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527114320.1581552-1-alex.bennee@linaro.org>
References: <20260527114320.1581552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Now WFE can actually suspend on A-profile we also need to handle when
its trapped. To do this we need to pass the instruction size so we can
deal with the is_16bit syndrome encoding.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v6
  - defer calculating target_el until after the early return
---
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     | 16 +++++++++++++++-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     |  2 +-
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f29..ebdf09be38a 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -54,7 +54,7 @@ DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, vaddr)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-DEF_HELPER_1(wfe, void, env)
+DEF_HELPER_2(wfe, void, env, i32)
 DEF_HELPER_2(wfit, void, env, i32)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index b803c9bf162..060b155d559 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -574,7 +574,7 @@ static int64_t gt_calc_next_event_stream(CPUARMState *env)
 }
 #endif
 
-void HELPER(wfe)(CPUARMState *env)
+void HELPER(wfe)(CPUARMState *env, uint32_t insn_len)
 {
 #ifdef CONFIG_USER_ONLY
     /*
@@ -592,11 +592,25 @@ void HELPER(wfe)(CPUARMState *env)
      */
     CPUState *cs = env_cpu(env);
     ARMCPU *cpu = env_archcpu(env);
+    uint32_t excp;
+    int target_el;
 
     if (qatomic_xchg(&env->event_register, false)) {
         return;
     }
 
+    /* We might sleep, so now we check to see if we should trap */
+    target_el = check_wfx_trap(env, true, &excp);
+    if (target_el) {
+        if (env->aarch64) {
+            env->pc -= insn_len;
+        } else {
+            env->regs[15] -= insn_len;
+        }
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false, WFE, insn_len == 2),
+                        target_el);
+    }
+
     /*
      * If the CPU has entered the exclusive region we could sleep
      * until the global monitor moves from Exclusive to Open Access.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ee584e9a793..92db4e69b64 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10935,7 +10935,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          */
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(4));
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFI:
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c10cc382d15..1f554f6c271 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6836,7 +6836,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFE:
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper can return if the event register is set, so we
              * must go back to the main loop to check for events.
-- 
2.47.3


