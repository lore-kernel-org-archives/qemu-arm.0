Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149499ejb;
        Mon, 30 Jan 2023 10:26:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZSs+6g2wVK2Z1rA4X5kE50TysiKQ8poI/YcAZYHOTaYVR/wTHz5+A3qvwitld4H3uLDdU
X-Received: by 2002:a0c:b39e:0:b0:532:1d87:d78a with SMTP id t30-20020a0cb39e000000b005321d87d78amr73076886qve.2.1675103164987;
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103164; cv=none;
        d=google.com; s=arc-20160816;
        b=bZESw5rFldtBxPUcL+XjTE7KztCVcMC6Qn3sr1dsNs2g6yvro7+QX4nrMoxkrbkIWH
         4cLFWJlg22x0+yonzLXLMhQbn64wgKuxbmiGt77V5xvxh1qxZKND/2UjbuOmpMmDf3N1
         39a8RkmXVauLJWLcZIBvZBM+v9TUrdlwXSksejzMPQQxB9Z3rFEMPYrYefMMgqhewY0l
         Z8LvGLyQoUxVwzCpUnsLME3NFo7j8AudMx8g8aoqBItWAzmmxocOzf1Id7X9Jk7dU8Hg
         NK25sR7o5UTwLZxWny+QDFM5ahndPjFkOc9nthiTEtderVLuPNwkZIm1OD4mpWt3G+Y2
         wpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uE1+7b7gus+hNDmeHdUGfNEuDyGv3C2iBvjQ8HFmN3M=;
        b=yDzSGVn6eTBzFHrWCwtaI71YCgwS8edii2lGKn3d7PigouY2/4ksTdzJ1UGlZ7nm4Q
         61lFwlpeIjzpsZhcFYbf6xHeIJZwCx7fY4dHAfpc0G9toG9eFC+kuEGtVBSJNxSj6wfy
         6mH4Wiq+pm1NfHwbsrugCN+oY1OtowXuYrWtT/A1f1u/yj7c4JmKXR62IdZ8XtQgAhHq
         cGmFEujGR0qjkoRuFekxWZXpYAVl8wzQEpm812W3FPqkpZ5PXIYYUD0LGPMiZ/mbDb/5
         mIjzU3fslO8fhg8hQkxx8tsarlUVK45crI33FtoOnL7eiSbmdyf9wyHGi5CfzurTFgJJ
         hR2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhf5Rof4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea7-20020a05620a488700b007066fc780e1si4016259qkb.308.2023.01.30.10.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhf5Rof4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqP-0001CD-Av; Mon, 30 Jan 2023 13:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqI-00014z-Hz
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:22 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqB-0008U0-Mx
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d14so11975612wrr.9
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uE1+7b7gus+hNDmeHdUGfNEuDyGv3C2iBvjQ8HFmN3M=;
 b=uhf5Rof4IxtTqsfdvUIRiVRRRk2K2j77EYOBa1xh2gchWP5FYp7UGaKk1tMr5swKeD
 SCOYTYn6eP5XM++d/Bav4bcgpAVkt1V4f0B18JP27xhz8qcoT5umkjiE74kM2g3FVp2G
 my6ueZ2wkdM+BV2zntJp2q+gJnpBy5nJqu2eytmVeHOPSPJX3uSDWVQIHKsiJuV0fHzv
 k+3UaKMoay4uEsE8ykSXN8JHBNIGVeY1Vh2uGmka68JOoT5S/Oti4hm5MtRPbimWY5+E
 VfbH1u8op0SnfSuCncqgTcB3sKL29JE4P9BgKD3wc+/nmaGqUZ4m9edUm0iOwf2nUbzE
 ziNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uE1+7b7gus+hNDmeHdUGfNEuDyGv3C2iBvjQ8HFmN3M=;
 b=olPYnnah6ZerBos/x4JkuaaMnRUJiu/T/RcggPnSf29x5/xNUdoRqRYIFBZU8mhLjk
 eakSR6S2gqj/FXvPcWbHLEO/bthhkLLxeIcglIJs8m+3Rczxi22kVi21hia61aKlEBX8
 /DEXk9ig3CkhRyyNt8UDISrFQ5qSDSCKZ5aTnHTbpab1hOlYccyZXM0OerNpt5X1eKhm
 WK8EyqPcXp0Wb7Zwx/abSJDnE78GvRS6biwjXtL7j8s8SEuoW1kl6/je+yANUD71VjHt
 5c42GsRvkSzTLMejatrgJeHp4QaVR0yXqM9fHYQoc37e62lx6F7Gj6pf1RTdF6ZoC7JD
 CCcA==
X-Gm-Message-State: AFqh2koWOF1XIvYewKMKmRKi9Ga4ALfGIV6NkkzOHdjAIv0tbkDDyZ7X
 JLtnYHDXNQDWKYQaHo+X0+02JasMD9UZNEW1
X-Received: by 2002:a05:6000:38a:b0:2be:4c32:a7df with SMTP id
 u10-20020a056000038a00b002be4c32a7dfmr39515156wrf.63.1675103114414; 
 Mon, 30 Jan 2023 10:25:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] target/arm: Mark up sysregs for HFGRTR bits 36..63
Date: Mon, 30 Jan 2023 18:24:49 +0000
Message-Id: <20230130182459.3309057-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fr6I6x1Ulv46

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 36..63.

Of these, some correspond to RAS registers which we implement as
always-UNDEF: these don't need any extra handling for FGT because the
UNDEF-to-EL1 always takes priority over any theoretical
FGT-trap-to-EL2.

Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
of the FEAT_LS64_ACCDATA feature which we don't yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-14-peter.maydell@linaro.org
---
 target/arm/cpregs.h       |  7 +++++++
 hw/intc/arm_gicv3_cpuif.c |  2 ++
 target/arm/helper.c       | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1b219242d5d..fef8ad08acc 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -615,6 +615,13 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, TPIDR_EL1),
     DO_BIT(HFGRTR, TPIDRRO_EL0),
     DO_BIT(HFGRTR, TPIDR_EL0),
+    DO_BIT(HFGRTR, TTBR0_EL1),
+    DO_BIT(HFGRTR, TTBR1_EL1),
+    DO_BIT(HFGRTR, VBAR_EL1),
+    DO_BIT(HFGRTR, ICC_IGRPENN_EL1),
+    DO_BIT(HFGRTR, ERRIDR_EL1),
+    DO_REV_BIT(HFGRTR, NSMPRI_EL1),
+    DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index b17b29288c7..6a3ca482fff 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2376,6 +2376,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fgt = FGT_ICC_IGRPENN_EL1,
       .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
@@ -2384,6 +2385,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 7,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .fgt = FGT_ICC_IGRPENN_EL1,
       .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9f6d9e2a3c9..a48b022def6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4158,12 +4158,14 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TTBR0_EL1,
       .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TTBR1_EL1,
       .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
@@ -6488,6 +6490,10 @@ static void disr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
  *   ERRSELR_EL1
  * may generate UNDEFINED, which is the effect we get by not
  * listing them at all.
+ *
+ * These registers have fine-grained trap bits, but UNDEF-to-EL1
+ * is higher priority than FGT-to-EL2 so we do not need to list them
+ * in order to check for an FGT.
  */
 static const ARMCPRegInfo minimal_ras_reginfo[] = {
     { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
@@ -6497,6 +6503,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
     { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
       .access = PL1_R, .accessfn = access_terr,
+      .fgt = FGT_ERRIDR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
@@ -6819,6 +6826,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
       .access = PL0_RW, .accessfn = access_tpidr2,
+      .fgt = FGT_NTPIDR2_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
     { .name = "SVCR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
@@ -6856,6 +6864,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_esm,
+      .fgt = FGT_NSMPRI_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
@@ -8884,6 +8893,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
+              .fgt = FGT_VBAR_EL1,
               .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
                                      offsetof(CPUARMState, cp15.vbar_ns) },
               .resetvalue = 0 },
-- 
2.34.1

