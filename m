Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3CF9EDC7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:02:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE7-0001M9-BQ; Wed, 22 Apr 2026 09:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXE3-0001Fg-66
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:43 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXE1-0001BJ-AQ
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:42 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-488d2079582so63700455e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862960; x=1777467760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reUwRDuVhNbhnF2K13EHapoGcij9kmY6U8ucQNXXySM=;
 b=MMEEiQmRlZ3MV2KBUcrY5lRbCH+qGOIHqA7oh59ryQ1HPQTpM+OSJdANIm3iF9iR6I
 JeDX73CLK6K0tCaEBrb1MzEr26OzTq7QYwxCqgiQIK0+iFTuA0FH4ZpI1qjEkX+V8Cdm
 pjl01ea5r4g0FWfOoc5mLT7JgMfjPDMnpjRQx5QWtgy70ogEGY/w4KYMaMGOqSuSxR2p
 5bzdI9UQBIm24UvviRcEuKYCsCxDSPqFk9Z7eYw4PXW2RmVtkyqo+C/K6PZHwTqjfcXw
 lzKuU+My9P8tqIbHk/nDWWBYwNEsPFc/ZR6RxDuU2UxyOv5UmEj/MUz05ar/U+0dLVbk
 Dkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862960; x=1777467760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=reUwRDuVhNbhnF2K13EHapoGcij9kmY6U8ucQNXXySM=;
 b=o+n5rJKY7mq9wsNY4cXWdRyMKWR0bgP0abtqXwOISSqdKIad+WrXs7+W4TsBJ6M+o4
 vamX6YtJmsyvC7GPeKSuK38HCMH0g2ZrLMG6SXjhLKa3/+7Y7Xc3n9GDwgbd2QZs6QFr
 pFamF6N1JpS1RNLaULG5srHHz2G0qLVwbyfHlIw+sZcdIEvHPbsQfhulxInZJX7IqGu9
 kutI4bXapt7Y6RyZd3Pz4F02qehtGE+ZjqT+79qtRC/LPs14/5VHXECg5iG/xK0Yje2E
 IQ6kD5lUAQkNi762q3z4D3j8T/l5iR4U2LdQEysdSomX5ZsLNRlpvBlR3ps/Xk1cPwnJ
 J2qA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AAI+sxvUYlaOYKrIEM3lvcGceV1A2QfM/CnfmL95XhwBamQS4B/gamlKQj8Hib4jpPjnW7h4fgA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/k0wnAv9EQOxg5YRX0uBVG3ZWkVRRAG+/gg30sC8IqyrphPaN
 GdTIg5JJY/Se8C3CbFLRoaV15lZGUqfgiQ7t4RKCCxc+CzYi8b+s2JKklAFG0wIXVMo=
X-Gm-Gg: AeBDieskCFn1a/1k+qJch0mN/zm7kWOPKNkIBaGjKSdNq+/k+WCFzaEW06qRgri/cPl
 +aQJOkzP5E969E2AR9r946BEbXDSNCbzsR2QuBC7F2qXG35wFmFzZak8T6UKal/87XWjd2QR8oH
 qziK8qnejIcdZeczdsKDC0U7xQNOpNMxLq3mUkquscXgm+ZfwOsP5zeliewfzJ5SfzfKFTIvOtX
 IJF5QdMjAjIY6E0HhaVYeuc5t+WEMsOjtG8TxmRkEF1+2Q/CBq7QFi4+60TnGubEG2hYxgmt1xx
 jAseN6wtD/itugq/SXctsyfJpFljt4Ic0fRnzLSyUarK34boQyi9T0KlzwoRLbvlcTEdwxZKvHj
 Gk8pvo/mgMClQvMFtdcXIwgGWVznF9yuefeXZR8szFPAbAcQAmEUAOlOMbTlUQuxvYASr/VEBTC
 kePCqAQptz6O2URxj6mouW/T2XkMB3iMjrRg==
X-Received: by 2002:a05:600c:8908:b0:48a:58e1:6d02 with SMTP id
 5b1f17b1804b1-48a58e16eb2mr53254275e9.19.1776862958236; 
 Wed, 22 Apr 2026 06:02:38 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm287208155e9.6.2026.04.22.06.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C9F185FC04;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 23/32] target/arm: report register in WFIT syndromes
Date: Wed, 22 Apr 2026 13:52:40 +0100
Message-ID: <20260422125250.1303100-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
syndrome ISS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - drop stale TODO
  - fixup stale commit comment (WFIT fix already merged)
  - make rv a bool
  - make ti a enum type
---
 target/arm/syndrome.h          | 11 ++++++++++-
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     |  7 ++++---
 target/arm/tcg/translate-a64.c |  2 +-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 04a71eebcb5..4d1f1c529e2 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -670,7 +670,14 @@ FIELD(WFX_ISS, RN, 5, 5)
 FIELD(WFX_ISS, COND, 20, 4)
 FIELD(WFX_ISS, CV, 24, 1)
 
-static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
+typedef enum {
+    WFI = 0b00,
+    WFE = 0b01,
+    WFIT = 0b10,
+    WFET = 0xb11
+} wfx_ti;
+
+static inline uint32_t syn_wfx(int cv, int cond, int rn, bool rv, wfx_ti ti, bool is_16bit)
 {
     uint32_t res = syn_set_ec(0, EC_WFX_TRAP);
     res = FIELD_DP32(res, SYNDROME, IL, !is_16bit);
@@ -678,6 +685,8 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
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
index aa14f15eb62..652611b4313 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -399,7 +399,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
             env->regs[15] -= insn_len;
         }
 
-        raise_exception(env, excp, syn_wfx(1, 0xe, 0, insn_len == 2),
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false, WFI, insn_len == 2),
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
+        raise_exception(env, excp, syn_wfx(1, 0xe, rd, true, WFIT, false), target_el);
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


