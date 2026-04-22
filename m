Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC6AF9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:55:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5e-0006a4-2t; Wed, 22 Apr 2026 08:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4r-00065v-1K
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4m-0005XS-Ud
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso74087365e9.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862387; x=1777467187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kLDDoOYtEyqQijc0QmTmJ1dX5SOzFgUIzyhmwCFraY=;
 b=l76bWmdp3ixKUCLuHZSeUhOubhhjmfImA6u4cAV/UzYzsKqwKPmrbYNJfMMVZA+E2O
 rMbVlBTQFzcu2QgsnLTnk1b7ElPmlD8vxVQGe/F+XSh7UHvCOWG65oGSUwLiZ7MGgXmi
 B5tEMNsMthNz/ChaV+3AQBgE64xm5BxXJ0yUXMJKXPnLmjf7V5CnQNYMnNPK102GLIVn
 /TbbJX7/rQ1G70CXMT5nbh+RtoHpVAPXxL24gUcZv37IZgFC+WaIvZ577XQlwrWqnQ7X
 Td9ov3u8okwP/4iJFCGrrHTH18WOGDSQXHIlJOk0qvGyXwwtNMFafMfyO+sqFdqfRzmg
 0jPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862387; x=1777467187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7kLDDoOYtEyqQijc0QmTmJ1dX5SOzFgUIzyhmwCFraY=;
 b=EX2M/YI3uNOhoA1LEehnu0E5eVytjCN0CBNIo1ybxCrDAPYdE+U+K+/U6Tf7DQ60vn
 +hgTmDu5qHQbQFSKHSfwxllLKZ8ANiDq9/pj3ZzWVkEOKaAiLDlOivyHQLxG3ldWmvtN
 mRyy5r9d4pBeQj3ehSiCc1TO6VngYmgEySC2ZiT+4CBcNoXS+4ScuKCdovWgTpn0zoWb
 iSCJfyQUIO2F/8MbHTpOwWUvOoDcMBOW/JF8h0L6UQ04BAk6L5bXouaOo1gHY646p6Kn
 OyPvaQ727CdJDFphT8BdKA3aXXch6iMHi9SsFU90+l+JonnYhjBULouxjCScj/NdbAOi
 zGVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jLGUBdrsHUBhvSC3foc5GO4N61uHXenfT08vpnHkVDM98NrUMTkEXggAf5CA7v5S3NurMSc9fiQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy3U4tzw6kBkb9zse3VwebiA3MJPMsN+JJ9KTUPn591tOXFeCs1
 KRzPylbLLSBzusFU93wp/HmH7TMyZwIn0ULf96DwTg01i427K6cLG69FxFiBm7chevQ=
X-Gm-Gg: AeBDieuDQ/7jhMthZaI6E/zrR18E4BbOl/I1Ppzl5maAa1qn+V+QS4SaI9yXhcovYIG
 i4+pEC5wmmmbzUO0jyz6B7sAUvhzJDr32yNBQxb0p7JGB1ZNM01oO4Ylvok2kAlQTzjAnhWgazF
 ZF8S0ujxJTKyu+W5oYAsC7updNxW04VSlcSLkk+MzJ42WPaB3BaWP4kUC7BFC5jhWseFMt9W8bq
 xDAoxjIfNYWdEGLVVP/ICQPElN6q2We3oqqEh+qXWU08e7awzM+etBobCCnnNG1bvc+9NQH3+UA
 iCnyO9t7oIDLGDN03JVcGFEg4JVr6muEzQd0Hhwzb3WIdhrWafxhevCPJTh2Mx/tmd5Y2gS6/NY
 xYkLEzgD+p6SB0qLQ39Xxzd9tQnyLGxNZ/5tWTtGCqbSggzKDbo7JQy31a+nuJhYFwMIxre4VJf
 aHiCSvuEedPXt7djRcgyrCWAueI3yGRmR/kA==
X-Received: by 2002:a05:600c:c4a1:b0:488:c014:34da with SMTP id
 5b1f17b1804b1-488fb77ed1bmr305546735e9.26.1776862387494; 
 Wed, 22 Apr 2026 05:53:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb79ecb9sm186670245e9.8.2026.04.22.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8C3B0617D8;
 Wed, 22 Apr 2026 13:52:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 31/32] target/arm: handle the WFE trap case
Date: Wed, 22 Apr 2026 13:52:48 +0100
Message-ID: <20260422125250.1303100-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Now WFE can actually suspend on A-profile we also need to handle when
its trapped. To do this we need to pass the instruction size so we can
deal with the is_16bit syndrome encoding.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     | 15 ++++++++++++++-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     |  2 +-
 4 files changed, 17 insertions(+), 4 deletions(-)

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
index 030209360e8..fe34c94e890 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -568,7 +568,7 @@ static int64_t gt_calc_next_event_stream(CPUARMState *env)
 }
 #endif
 
-void HELPER(wfe)(CPUARMState *env)
+void HELPER(wfe)(CPUARMState *env, uint32_t insn_len)
 {
 #ifdef CONFIG_USER_ONLY
     /*
@@ -586,12 +586,25 @@ void HELPER(wfe)(CPUARMState *env)
      */
     CPUState *cs = env_cpu(env);
     ARMCPU *cpu = ARM_CPU(cs);
+    uint32_t excp;
+    int target_el = check_wfx_trap(env, true, &excp);
 
     if (env->event_register) {
         env->event_register = false;
         return;
     }
 
+    /* We might sleep, so now we check to see if we should trap */
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
     /* For A-profile we also can be woken by the event stream */
     if (arm_feature(env, ARM_FEATURE_AARCH64) && cpu->wfxt_timer) {
         int64_t next_event = gt_calc_next_event_stream(env);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a1b0cc9508e..83b2a6e848f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10956,7 +10956,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(4));
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_YIELD:
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 18d64620e40..c30ea2261da 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6845,7 +6845,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


