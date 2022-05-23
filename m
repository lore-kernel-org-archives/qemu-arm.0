Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3757152lfh;
        Mon, 23 May 2022 13:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze2SJYaS+xiaHJjXQg2jDS0Jc1eGaxipWchR6CpvA6+s+RsouSAzIq9bUNLSGxaCLcCUU9
X-Received: by 2002:a05:6214:560d:b0:461:d201:79e6 with SMTP id mg13-20020a056214560d00b00461d20179e6mr18916250qvb.4.1653339430226;
        Mon, 23 May 2022 13:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339430; cv=none;
        d=google.com; s=arc-20160816;
        b=scMIniGX7JEgYg4ugT2EAEooD7BEVY7/5gcJJPi8EHuoYEu+afFY/iEwxYAyDv/8O6
         tvZe4M+jrOvsjh3NSVlTBh6p8cPsADUpwBYyEQoMOUxKU3g/4VY86Bfpw27aQzgXleor
         CTKPeWRt4luBjW2AxomA0kFQ+scaWyLdX0Z9JQlyfq1kHTw5DTK8EME/ceiTfqnqjRfx
         cZMNk0H7F5kO3oX+NZKjxB5sTKle3KZRncwSXBdUiFa6BalwOXb0C6sgg1Wy0hgHiKYY
         WA5R2PlmBAFYvWAVQBRbl8CQ4o6ARdyJqY8aIr1vlyfPWNxQoIAD2s8zdWV4vApNWTHo
         vjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UXDNe7UAiSjLL81qtpI/xgpK//7QQXPJ6zCsJfDQpFw=;
        b=nXSQPbrruQcGlHsdVjH5MjQT98NYliA/zOF/NEcU6evOasSpRxmJr7UtsUqEahKPKP
         cTnFRT83PJw+qzpfalBVu8ZzYDBn+5zmqRrJMYzI93ndv8bcvKAD9RtrOo60Yeikt0Gc
         UDVudeeItgKl4rEG5+5NQvxWIphCBjruJgx63aq+jgmgJxn2g309+Kix6UlcR+RaVIMC
         szqE0UEhM/VeWgZJ3zvNNd0TSuipNbrJEHDM6EVRpzYzVmPqMYZOr3iZ2qFgDzV20xIw
         y41kWhobP/qsjcmXdCMNKVM0N5fu5nF8vQFD1n0w9GSOYxUcoAGt/4+/ZZSeVX09gKJV
         SBvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z3petxkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020ac87d47000000b002f372dbbe12si3286604qtb.542.2022.05.23.13.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z3petxkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF6z-0004Lh-Nk
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyH-0000QA-RO
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:09 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-00051M-Bv
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:09 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so356372pjf.5
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXDNe7UAiSjLL81qtpI/xgpK//7QQXPJ6zCsJfDQpFw=;
 b=z3petxkLcmX5NT0SjAkaCua/Q0ApUEU+obVhXuzm0SROUzOqf8yGRYKMyz6de9v9jn
 UUWd650fHNfWFeEBl900PV7jqTTHj9SCGKRN8QKmfnwPvDnbzJtLT+hknA/aMGLVVQZH
 jBC1JlH7d+LdNq88A3o9eTRs07v/FNV4y1IDi0ctjzePQhfq5KCYH8x6NfGWhwu+5s8E
 4CVzcHpLaUN56XsCNhZXHERj2lm/dd6AdcspNq11FNhq2w5NhMbGFY2pa4t1TRfGCo26
 WNbN03CToneEYArKuB4IHY6LANuZGeFRa1d8tPX8nXUxbY0zFFD4101t/bUnf8/uNXYy
 ysSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXDNe7UAiSjLL81qtpI/xgpK//7QQXPJ6zCsJfDQpFw=;
 b=nYy0mJTXnMVeusK1pDOImzWIhf2UOOSu2vnXpCbbhgLwoSfJdE+ZTZyCI/dgLeH24k
 M796JEMi6eJ2Yv9gfbWKaXEzjdlnXGaVDMF5ykj+wLDBx8LJpEGBxHAXY0S3BIpDzsLZ
 3t4EsSNgK7bbfDU6ZJ2+ZL1nsOn1+3EcQW5qvsmq2SbjXDG7Km3niWA3HUxYu0R+W2dw
 Bp297C6rGFcPiy1cb+/X9SX3EjkHYotbJTm+SjQms7stDDB8ZEK9t0Jdg9flx+szS9n2
 W7w46eNiNOPke3nfzvfyzdYaLmJI8dG+eE7Cxt+niCy780nlLCdEMFCYdULiW18yZicl
 M0ng==
X-Gm-Message-State: AOAM532zVwulYLSoalbUVrsUZLvySMD3U4ep+x/wEaY5phoKlIBHxxPp
 Kp8LLhsEx8Z+t6OzXZsvdfYdnQ==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id
 s16-20020a17090302d000b0014d8a8d0cb1mr24329246plk.50.1653338880568; 
 Mon, 23 May 2022 13:48:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:48:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/18] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
Date: Mon, 23 May 2022 13:47:40 -0700
Message-Id: <20220523204742.740932-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kgENvvlVE05O

We no longer need this value during translation,
as it is now handled within the helpers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  6 ++----
 target/arm/translate.h     |  2 --
 target/arm/helper.c        | 12 ++----------
 target/arm/translate-a64.c |  1 -
 target/arm/translate.c     |  1 -
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 90cdc7b1de..5bc6382fce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3064,11 +3064,9 @@ FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
-/* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
-FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
-FIELD(TBFLAG_ANY, PSTATE__IL, 13, 1)
+FIELD(TBFLAG_ANY, ALIGN_MEM, 10, 1)
+FIELD(TBFLAG_ANY, PSTATE__IL, 11, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index c03dbfb618..cd9ee41bbd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -59,8 +59,6 @@ typedef struct DisasContext {
      */
     uint32_t svc_imm;
     int current_el;
-    /* Debug target exception level for single-step exceptions */
-    int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     bool aarch64;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0be96b988..63c3fee5ff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13626,18 +13626,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
-static CPUARMTBFlags rebuild_hflags_aprofile(CPUARMState *env)
-{
-    CPUARMTBFlags flags = {};
-
-    DP_TBFLAG_ANY(flags, DEBUG_TARGET_EL, arm_debug_target_el(env));
-    return flags;
-}
-
 static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
 
     if (arm_sctlr(env, el) & SCTLR_A) {
@@ -13663,7 +13655,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f502545307..cc9344b015 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14645,7 +14645,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
     dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
-    dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87a899d638..59d7542a48 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9354,7 +9354,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
         dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED);
     } else {
-        dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
         dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
         dc->hstr_active = EX_TBFLAG_A32(tb_flags, HSTR_ACTIVE);
         dc->ns = EX_TBFLAG_A32(tb_flags, NS);
-- 
2.34.1

