Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E361098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZiL-0006a1-Id; Fri, 20 Mar 2026 09:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhr-0005uw-Ja
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhm-0000LL-PV
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6611f41eebcso806243a12.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012557; x=1774617357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNdxjerdbcZP0JgKWD/vBlbem9xMpUBJ6AjRsNNYLJI=;
 b=Xv506pyY+L0lmzPhjPjBhhII2nSimXVh7ezb8zWscbiWaZHMe0aN5Io+FKIe5PfJz3
 GLObtUNdKteMBlMXxYLg2tVXudUI7SguIizk/OKVd9iP9KeM3nf7elbooJTwkPSoDaPl
 dHznrAtGM6FSk10PDZcv+H0GLMegBCDUhI3nV1qMklAuy3gKN0tXIQmXGxVrnTgedX3I
 l8+3Jo6AhEoZsT3B5FyDeypNuCphIx4D7fZtfkY/bzMS9+L2MOR+9wYFrZrcoC1jE7Zn
 MdITPS0WQlgZJJ/4ZxnjBV8W1wLEmgiqW5z33pTw3cVWKHfrmM8IY20ae5D0kZBT8RkQ
 2Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012557; x=1774617357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JNdxjerdbcZP0JgKWD/vBlbem9xMpUBJ6AjRsNNYLJI=;
 b=UhPjHPqwkPKXAJrvNG+f/naKVVk2PYHLEYuEW8yZv/VkW3YGKEPzkSgoATntzA3pM/
 dTwWTOlIvHssTlGfZGbIdIvSTnWqYY0FqRlbAJshPyYkgISq05kLnXKrLkkf32+RJ876
 rJ0VLxyj8BDzJaAM3NTURF4Zosgmgo+JNmMDDJ8IynOpyKga4BNhUQc6gUTYstabsbys
 a7uW5RksfvJ8aOnQ15B1JhYSYuM5K7HFbyLKAnbFAFDFbek7OKI7bMLPsTKTME5DY0ST
 6DWORozTy7uYyqSlZDE6wTUziDDqZYoCtz9pfu1I52lAOV211O+LyNpcFMRki0DRnAjQ
 8kVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+w7o0QLR2lLAd/JPUkRQ8F0+Fbn1vcKnL6kwwvSZJAT0SLohWOwVEeS6IyyyRhgMBcKMVMWiM9g==@nongnu.org
X-Gm-Message-State: AOJu0YwuN1CIPUaz4UE1mfAbvv0saq+r10XdBW/ByZQ80OhTknv1RkkC
 jiqQn7nK79CkbBdvsXHrY+EEa31LB796Y8ydld7QSZZx4vsk8f9ffkUTF5ut9uMzk4g=
X-Gm-Gg: ATEYQzyScW8TZFcd/R0TQi9mOF+MQGqc6SwsydFyWbLAB7r/zMF0+EpAp4Ohg6pmDPd
 lAniaMNK++kqZJ+3PQGMBYcBoDEEj15+Lq/biY1ilVdBagsWyR6OgXIy0T00UcSlb4n8gaINaFR
 Gyqw/ppdob5BB7MJPEA3CrjRferFKX7keJhG1Qao4IEaJnXbDUKgjtHDK7cZaJXFhpxWNikKYq8
 iwFwinsOaVdbmONWMlViVGu1khWZDqS6dgYHTuaXruF7MeIvw05U+sPb/D4mKghwEQahWbyAW7q
 2hNKc7ff+yaLjmAcGwz3qEzmMwUburALBj2hYd1dNtVpD4CP0FkCQHto2cAJN5aeQLPPiCQ0tfs
 /bPR6BsL2O+0t/b9bwwH9kS0zN26W+faH/RpLOLhR6Oft5ddKlCpgHcQYfV1wgW4zobLqRT07ky
 KWM4sY7NilbUEVaBZ6Impt5hA=
X-Received: by 2002:a17:906:1553:b0:b97:fbea:a618 with SMTP id
 a640c23a62f3a-b982f37d293mr199298466b.32.1774012556743; 
 Fri, 20 Mar 2026 06:15:56 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8c177sm161097866b.15.2026.03.20.06.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 974F75FA3C;
 Fri, 20 Mar 2026 13:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 23/35] target/arm: report register in WFIT syndromes
Date: Fri, 20 Mar 2026 13:05:54 +0000
Message-ID: <20260320130607.2071996-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

Pass the register number (rd) to the wfit helper and report it in the
syndrome ISS. This also includes the correction of the TI bits for
WFIT traps to 0b10.

TODO: split the helper flags

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h          | 4 +++-
 target/arm/tcg/helper-defs.h   | 2 +-
 target/arm/tcg/op_helper.c     | 7 ++++---
 target/arm/tcg/translate-a64.c | 2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 1887467b719..f303c41d71a 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -670,7 +670,7 @@ FIELD(WFX_ISS, RN, 5, 5)
 FIELD(WFX_ISS, COND, 20, 4)
 FIELD(WFX_ISS, CV, 24, 1)
 
-static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
+static inline uint32_t syn_wfx(int cv, int cond, int rn, int rv, int ti, bool is_16bit)
 {
     uint32_t res = syn_set_ec(0, EC_WFX_TRAP);
     res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
@@ -678,6 +678,8 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
     res = FIELD_DP32(res, WFX_ISS, CV, cv);
     res = FIELD_DP32(res, WFX_ISS, COND, cond);
     res = FIELD_DP32(res, WFX_ISS, TI, ti);
+    res = FIELD_DP32(res, WFX_ISS, RN, rn);
+    res = FIELD_DP32(res, WFX_ISS, RV, rv);
 
     return res;
 }
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 5a10a9fba3b..a05f2258f29 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -55,7 +55,7 @@ DEF_HELPER_2(exception_pc_alignment, noreturn, env, vaddr)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
-DEF_HELPER_2(wfit, void, env, i64)
+DEF_HELPER_2(wfit, void, env, i32)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index aa14f15eb62..635c538ed4b 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -399,7 +399,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
             env->regs[15] -= insn_len;
         }
 
-        raise_exception(env, excp, syn_wfx(1, 0xe, 0, insn_len == 2),
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, 0, 0, insn_len == 2),
                         target_el);
     }
 
@@ -409,7 +409,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
 #endif
 }
 
-void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
+void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 {
 #ifdef CONFIG_USER_ONLY
     /*
@@ -428,6 +428,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
     int target_el = check_wfx_trap(env, false, &excp);
     /* The WFIT should time out when CNTVCT_EL0 >= the specified value. */
     uint64_t cntval = gt_get_countervalue(env);
+    uint64_t timeout = env->xregs[rd];
     /*
      * We want the value that we would get if we read CNTVCT_EL0 from
      * the current exception level, so the direct_access offset, not
@@ -448,7 +449,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
 
     if (target_el) {
         env->pc -= 4;
-        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el);
+        raise_exception(env, excp, syn_wfx(1, 0xe, rd, 1, 2, false), target_el);
     }
 
     if (uadd64_overflow(timeout, offset, &nexttick)) {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5d261a5e32b..073454b9195 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2064,7 +2064,7 @@ static bool trans_WFIT(DisasContext *s, arg_WFIT *a)
     }
 
     gen_a64_update_pc(s, 4);
-    gen_helper_wfit(tcg_env, cpu_reg(s, a->rd));
+    gen_helper_wfit(tcg_env, tcg_constant_i32(a->rd));
     /* Go back to the main loop to check for interrupts */
     s->base.is_jmp = DISAS_EXIT;
     return true;
-- 
2.47.3


