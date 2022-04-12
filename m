Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2012197lfq;
        Mon, 11 Apr 2022 17:52:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzROLlAsqhwtnn80BQ136tNzFck1YgKyHdK2QojdENFzJSbsa/9ccrVvDprqDwhY+rH09no
X-Received: by 2002:a25:bb8c:0:b0:633:93f2:ecf6 with SMTP id y12-20020a25bb8c000000b0063393f2ecf6mr23783345ybg.54.1649724746749;
        Mon, 11 Apr 2022 17:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724746; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAJiYf8pw08gcF6bUEgBPM/JKZjqNXnZv2xniTiXFWfFu3kR3M6lX/QTTxOp7MdKdU
         jaSQwWH4U8ZRFx1gU/1x2/Af+l5yKtgt0+vPtNPTZqlsTSjwDphZDuJoXWdpmqkoKhmW
         3o/Cmsi+vMKRIDWqJ4hv23zxISLVp9qPVyCWvZfwujCZlXm3adi+saMv4Tze9BtKW9Ae
         f/0gGTZpV/zSxdWToJeUhr5951ovrpTWxhxUmg5fsBI4TX9bBNCdHqBpcVXilicR0qIE
         jFi2WTuwgPGVaN7D8TD2xekrfbaldb7ZrcmsHLf1avCzO3iMYNzRQbPrer2/iH51kXdd
         n4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JoBBg/kSFjOXyAKcvYGCO5ADafkL/tC3ktVRL7z4yew=;
        b=eOj7ZOExlRtp3L4yULH7MWsjQWByV8L881bALh8y/1J3SvmCrV10DNETUgylHuVj9k
         lKtAP18YsQvmeui7C4bcgtdD2gzjVZBkGGim8B69Bc0MqblZyrBdz9UqTVxoVUjmpLfw
         C4NKwR4QPhYdhPeXayc+OOC5uEiHnDMEv4XEMtpmg1d2ZqUtHIVZKq2sd2rk+cfHrPfU
         Atm3oCkabYo9ggNMHkl2C1trxC66app3ZwLc0EIuk8eSCeCE60CC88CLdRESBUCkjtwk
         N4bN5jZOLIbhNBk/0k9lExMc3yaFiTJnNEj2KeCMlNlS07goihUQU1DC/GQ0nBSvI385
         8DpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WXsxxoBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r136-20020a819a8e000000b002e6cd8f20aasi5365714ywg.388.2022.04.11.17.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WXsxxoBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4le-0005SO-49
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tc-0001vD-HL
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TW-0001s0-U8
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v12so2337604plv.4
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JoBBg/kSFjOXyAKcvYGCO5ADafkL/tC3ktVRL7z4yew=;
 b=WXsxxoBZj4APndTyi5P7xAxjtSreYBr+yzse7Wh2aMGYn00MFyGrcGokp/WIMQrObv
 DBov/cIUfpPNQmzoPU/odYQh4MKIYjbxvLjf6A0ydbt4RW0N7aaluSNlBSMbKYt07cqR
 4FfA+VYUpYWVwo6EKHRk6IsixFeDikL3xhsOtqAdPRzj/DlZ3jFa+3fnaj/HlERCofcx
 hVt6giRgjf5ycYpx6sICskzYSgovHDiOpcB7Y7bK/gNwpklWSTNpJrGl65QWOGXiVlQp
 R0gpPBCGfoDg3pJsUA9xifSbwX5W8Sw1H6J7qInb7zTx2y55OmVc1UqVv/1ZGr0/yDAA
 XnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JoBBg/kSFjOXyAKcvYGCO5ADafkL/tC3ktVRL7z4yew=;
 b=T0oWg4azxcdNCHRDBEBFOxgNrnObs9SSDHkyuGmmNo+mVeckT9Sti3OWKsV28f/nmg
 xtGph9QWvg0d6HtTMvdV2N2rbx+oDLYLSxTiyj9E8o9F7y1mAJltgnI+iHM7mEdTGFw9
 3ij+ClVM6/VhQArzBeiDsEy2/0paAtEmepXik0chVjAQ/ntMfwfYsrGI1sA2qvZnCPKq
 ej6td9SwscTu+2iEiOnUe6W3BeL0SHz52UKsW4KjJppKNH0k6pL+JmbeUkKa44kFxM+S
 zwWyfIs3bc73Gs9Iknfv+gLtAvJZIePeWuSE21zWBY8vDmOnW8JeA71ww5bzvY+bG6p6
 XmHw==
X-Gm-Message-State: AOAM532l14DBvpJb8tLGDeD27opdyUYi5UB9NOdGvoJSs1qeg6BAsxL3
 a7ipakxq4YaGF592Hyj3iLnNcVZDXSIN9g==
X-Received: by 2002:a17:903:186:b0:154:3606:7a73 with SMTP id
 z6-20020a170903018600b0015436067a73mr35276656plg.89.1649723621412; 
 Mon, 11 Apr 2022 17:33:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] target/arm: Implement ESB instruction
Date: Mon, 11 Apr 2022 17:33:17 -0700
Message-Id: <20220412003326.588530-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Uin7BwWVWnb

Check for and defer any pending virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain m-profile check; improve comments.
---
 target/arm/helper.h        |  1 +
 target/arm/a32.decode      | 16 ++++++++------
 target/arm/t32.decode      | 18 ++++++++--------
 target/arm/op_helper.c     | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 17 +++++++++++++++
 target/arm/translate.c     | 23 ++++++++++++++++++++
 6 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b463d9343b..b1334e0c42 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
+DEF_HELPER_1(vesb, void, env)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index fcd8cd4f7d..f2ca480949 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -187,13 +187,17 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 
 {
   {
-    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
-    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
-    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+    [
+      YIELD      ---- 0011 0010 0000 1111 ---- 0000 0001
+      WFE        ---- 0011 0010 0000 1111 ---- 0000 0010
+      WFI        ---- 0011 0010 0000 1111 ---- 0000 0011
 
-    # TODO: Implement SEV, SEVL; may help SMP performance.
-    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
-    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+      # TODO: Implement SEV, SEVL; may help SMP performance.
+      # SEV      ---- 0011 0010 0000 1111 ---- 0000 0100
+      # SEVL     ---- 0011 0010 0000 1111 ---- 0000 0101
+
+      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
+    ]
 
     # The canonical nop ends in 00000000, but the whole of the
     # rest of the space executes as nop if otherwise unsupported.
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 78fadef9d6..f21ad0167a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -364,17 +364,17 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
   [
     # Hints, and CPS
     {
-      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
-      WFE        1111 0011 1010 1111 1000 0000 0000 0010
-      WFI        1111 0011 1010 1111 1000 0000 0000 0011
+      [
+        YIELD    1111 0011 1010 1111 1000 0000 0000 0001
+        WFE      1111 0011 1010 1111 1000 0000 0000 0010
+        WFI      1111 0011 1010 1111 1000 0000 0000 0011
 
-      # TODO: Implement SEV, SEVL; may help SMP performance.
-      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
-      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
+        # TODO: Implement SEV, SEVL; may help SMP performance.
+        # SEV    1111 0011 1010 1111 1000 0000 0000 0100
+        # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
 
-      # For M-profile minimal-RAS ESB can be a NOP, which is the
-      # default behaviour since it is in the hint space.
-      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+        ESB      1111 0011 1010 1111 1000 0000 0001 0000
+      ]
 
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70b42b55fd..13076ee885 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -972,3 +972,46 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
                      access_type, mmu_idx, ra);
     }
 }
+
+/*
+ * This function corresponds to AArch64.vESBOperation().
+ * Note that the AArch32 version is not functionally different.
+ */
+void HELPER(vesb)(CPUARMState *env)
+{
+    /*
+     * The EL2Enabled() check is done inside arm_hcr_el2_eff,
+     * and will return HCR_EL2.VSE == 0, so nothing happens.
+     */
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    bool enabled = !(hcr & HCR_TGE) && (hcr & HCR_AMO);
+    bool pending = enabled && (hcr & HCR_VSE);
+    bool masked  = (env->daif & PSTATE_A);
+
+    /* If VSE pending and masked, defer the exception.  */
+    if (pending && masked) {
+        uint32_t syndrome;
+
+        if (arm_el_is_aa64(env, 1)) {
+            /* Copy across IDS and ISS from VSESR. */
+            syndrome = env->cp15.vsesr_el2 & 0x1ffffff;
+        } else {
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal };
+
+            if (extended_addresses_enabled(env)) {
+                syndrome = arm_fi_to_lfsc(&fi);
+            } else {
+                syndrome = arm_fi_to_sfsc(&fi);
+            }
+            /* Copy across AET and ExT from VSESR. */
+            syndrome |= env->cp15.vsesr_el2 & 0xd000;
+        }
+
+        /* Set VDISR_EL2.A along with the syndrome. */
+        env->cp15.vdisr_el2 = syndrome | (1u << 31);
+
+        /* Clear pending virtual SError */
+        env->cp15.hcr_el2 &= ~HCR_VSE;
+        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_VSERR);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9333d7be41..4fc31807ff 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1469,6 +1469,23 @@ static void handle_hint(DisasContext *s, uint32_t insn,
             gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
         }
         break;
+    case 0b10000: /* ESB */
+        /* Without RAS, we must implement this as NOP. */
+        if (dc_isar_feature(aa64_ras, s)) {
+            /*
+             * QEMU does not have a source of physical SErrors,
+             * so we are only concerned with virtual SErrors.
+             * The pseudocode in the ARM for this case is
+             *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+             *      AArch64.vESBOperation();
+             * Most of the condition can be evaluated at translation time.
+             * Test for EL2 present, and defer test for SEL2 to runtime.
+             */
+            if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+                gen_helper_vesb(cpu_env);
+            }
+        }
+        break;
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..fa34b0ad4d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6275,6 +6275,29 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_ESB(DisasContext *s, arg_ESB *a)
+{
+    /*
+     * For M-profile, minimal-RAS ESB can be a NOP.
+     * Without RAS, we must implement this as NOP.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && dc_isar_feature(aa32_ras, s)) {
+        /*
+         * QEMU does not have a source of physical SErrors,
+         * so we are only concerned with virtual SErrors.
+         * The pseudocode in the ARM for this case is
+         *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+         *      AArch32.vESBOperation();
+         * Most of the condition can be evaluated at translation time.
+         * Test for EL2 present, and defer test for SEL2 to runtime.
+         */
+        if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+            gen_helper_vesb(cpu_env);
+        }
+    }
+    return true;
+}
+
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
 {
     return true;
-- 
2.25.1

