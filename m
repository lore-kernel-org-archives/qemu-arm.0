Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp908355ejc;
        Mon, 22 Aug 2022 06:24:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6pRb5A+GS1WfLgOzxJLD0jMNCOiiXroDhqKXp+w4aHl4Iqo8VROEHSvrqUZI96pb6Z4v1q
X-Received: by 2002:a05:6214:2685:b0:477:1d22:f017 with SMTP id gm5-20020a056214268500b004771d22f017mr15990484qvb.96.1661174677426;
        Mon, 22 Aug 2022 06:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174677; cv=none;
        d=google.com; s=arc-20160816;
        b=K8xq846aeQm3cjG1qvSlNNsXSRwx4v0jRK299tQbyskjJ4UcDv0rEyD2ejJhds3Ged
         N7Z+CvkI1O0YxdCjich2PoUvA9zs1BZBDZ97xAxKKAGNa1fvfx1P+InSpnfTxWAIpD4K
         PXeTcL16CYjr85VRY/4D5wVQVY1cmCNVC3y6c2pZFBlsJKwLfeRA8MSW4wQWYxGkzNFt
         wYoiNrOnQeNwwNqKFE9Pz57aLY6kKC1xLifpXEdfkB16tODrRq9HSNONfOviyZ8gj1nP
         fVJZfVJlE1zU7m9VhDjOV3qXOZwdUExsf99gvtVghW0IG+elp5XiUhQlSX9tbrWHIeUl
         czvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z3HMTNdAubSdARHZ1TYHyaaRh8yZaKl7eKMF8WGzqZY=;
        b=Poel7jwTWzDaJOpf/exz0Bot8hvYymTvzkP5zAM30dlij0GHyD1peWH1pQWmzQikd3
         h4x3Ep+3NTurxK5TzewxCPd/szJNCBDDpy3sVmJa4rX7df49u83mf4zIHbtZIzLzbKUJ
         sDrIZbZ1YyEsqvgLdeRtz0SattAf3ddJLJnPNsYQ3zfdrtAxt/rR9uJvb5G4LMiBHyi3
         WE7in//EEZ9JaSjZAsSF1jCoXtyOks/2MPOcU/MD4dfkdMwPTezcfr1NkRgqvCdaLID+
         Ct30ATr6sjJwCHkofQg+d5fBgT9CcgDChCLr85K16tqjQCrkmOdmyCRDqnoVI8rpNxp+
         4dQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQ9ppO9M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy5-20020a0562140f6500b004957b1a3733si5236259qvb.77.2022.08.22.06.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQ9ppO9M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7Pw-0006iU-SU
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PT-0005vQ-6Y
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PR-0001eI-DF
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n7so13207166wrv.4
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=z3HMTNdAubSdARHZ1TYHyaaRh8yZaKl7eKMF8WGzqZY=;
 b=MQ9ppO9Ms9TeebGs/EekuZ2lsw2d6OfTduf681AxJpve90Ynzgl4CBdNnrZKe042kH
 49aJehOGKUK6/23dbUFkV7ziChCrFISIVCsiOsw4Bcwb889DYGSFl5WmyeDO2ZC6D6Cy
 yJkPNTFLjn2J2FYgfKhPs/P7zOczgHT9lx9HFqp/cZUjnqIdBovP7zRKo4iJEajH2pp8
 TP7lNbuZsAIOQzCQmhkSLtza/bOD+W2pFHBlX67DKicbd/fXla0Ltk1XAwGmUTj7MUZQ
 ItGWV2zxgyeu8hyqfabbaw2AaiDv2Saew8NPHiX2KZPokU8WAmFcdT0qCT7qM0ZfszoZ
 DwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=z3HMTNdAubSdARHZ1TYHyaaRh8yZaKl7eKMF8WGzqZY=;
 b=QDOwHSbHzF88Xn6kkwss3xvvPqCqcPkawdl/i2MvtItNZODnBGod8l1Z28yiZMQEwQ
 BICQs31AeoGTaWZJQ36RQsGapX7IxplQ48KCQo0CEV2WSrM0db/nD2/HNJxGKfm2I8qh
 2MQvEteoUvZ2sK9iXf8GTO2wZKCjb/V5IREhWVnjYv1yOYfacvpm903oPE8r9qC4MGa5
 BZn0Ex+V/PjaM1qyQquaiJO1PTiotV5kRbC6JOydo9bHbPa3FB6A2hiMWtHqq5uYhESx
 zJbMEVhEGk1dN5vAegN6/zoSY9jSRiT6mHVdYWHa95aIWNkSNN3l0jP6aWneW6kFRjNE
 +B4g==
X-Gm-Message-State: ACgBeo3QGLs1eK1prW2Llmr/AfUHZksMrl8Sv2bpiybvHFMBAwX/YB2M
 LEjG5kkJc+rLezNKRP51LqHMr1f+8IltTg==
X-Received: by 2002:adf:d4c6:0:b0:225:2eeb:fe8e with SMTP id
 w6-20020adfd4c6000000b002252eebfe8emr10544266wrk.429.1661174643880; 
 Mon, 22 Aug 2022 06:24:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Date: Mon, 22 Aug 2022 14:23:51 +0100
Message-Id: <20220822132358.3524971-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: lgJUJ2bE2djs

The PMU cycle and event counter infrastructure design requires that
operations on the PMU register fields are wrapped in pmu_op_start()
and pmu_op_finish() calls (or their more specific pmmcntr and
pmevcntr equivalents).  This includes any changes to registers which
affect whether the counter should be enabled or disabled, but we
forgot to do this.

The effect of this bug is that in sequences like:
 * disable the cycle counter (PMCCNTR) using the PMCNTEN register
 * write a value such as 0xfffff000 to the PMCCNTR
 * restart the counter by writing to PMCNTEN
the value written to the cycle counter is corrupted, and it starts
counting from the wrong place. (Essentially, we fail to record that
the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
to have started counting is the point when PMCNTEN is written to enable
the counter.)

Add the necessary bracketing calls, so that updates to the various
registers which affect whether the PMU is counting are handled
correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: fixed comment typo
---
 target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 87c89748954..59e1280a9cd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1079,6 +1079,14 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
+/*
+ * Bits in MDCR_EL2 and MDCR_EL3 which pmu_counter_enabled() looks at.
+ * We use these to decide whether we need to wrap a write to MDCR_EL2
+ * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
+ */
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
  */
@@ -1432,15 +1440,19 @@ static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten |= value;
+    pmu_op_finish(env);
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten &= ~value;
+    pmu_op_finish(env);
 }
 
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4681,7 +4693,39 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
+    /*
+     * Some MDCR_EL3 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el3 ^ value) & MDCR_EL3_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
     env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
+}
+
+static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * Some MDCR_EL2 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
+    env->cp15.mdcr_el2 = value;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
 }
 
 static const ARMCPRegInfo v8_cp_reginfo[] = {
@@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mdcr_el2 = {
             .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
             .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
         };
-- 
2.25.1

