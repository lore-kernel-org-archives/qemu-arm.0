Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338022ejc;
        Fri, 27 Jan 2023 09:57:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0ztOk2AMOLjKaavh51JizP1+PPLPpJeLPJOktNyDgLAms5NJrlD1gh2XbNcfVmPLBxyT+
X-Received: by 2002:a05:622a:4a83:b0:3a8:55c:a893 with SMTP id fw3-20020a05622a4a8300b003a8055ca893mr61212595qtb.0.1674842234360;
        Fri, 27 Jan 2023 09:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842234; cv=none;
        d=google.com; s=arc-20160816;
        b=hj4F3MhJcbI3I7nUA1LJPICJ8Q52J/m5uejm2pWekdx7yysA+tvXJvQcSQhTJ/beEb
         UrZsGTcHe96+e5jzmiqTMNWypq/yTz/XPQOOW6Uakb94A+tuxsR6XCQMrWABZGYEUw01
         uQTzELihZO2fJ2zUSl4Hx7d7lqkF1faU2kDagE721yJRrW62SUO7z9qViFQOYci6zJTU
         vhTxvQDCVVkFwAtOJMVbQI0aLmWxh1lJqci4qIlzEyyIEd4HGJe41JYu7GDu6mOQHzBR
         zqGX9omfdTg4b6WDUnYqfT9+bVxynp9WSgl6QnBoekZCDTjWSUUpT/hiAb8kY7vY7p/k
         kJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xng+v030lq6saGey2ecXUc3PUX/ShBDvViyybr0A404=;
        b=EdKvVZm3WhwzP+3qM3fBjdCrEILtA8pUR4tADhaim0gmYy4pgLkcMNd95SukMKKmiZ
         zICgsMhCKCbgplB9om/6VDS5D4/DGukXmspuCrZoAEwbmzext2qok/bXKF+XFzAyKxxs
         rmC75bLutH8qSGxhFZ2CIcbc2+qGNttFLhIJed+D1hSVHlZETMtodyIqK3bx3DfkRo9A
         hiMo+5ZB8lvE0OJW4G/JX0lkboy/bbmEWs/pGpJsxXcogEfV++vGjvjAULMXryJm85C+
         Z+lkDta+vOLA5iV2o24eJ0/5AYakxqFHwf+wE8H5qSs5qQk5/wTlr+5mS6YPzZUhutd/
         3soQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX9tJFKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ac84109000000b0035bab05e960si81065qtl.154.2023.01.27.09.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX9tJFKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx9-000158-6j; Fri, 27 Jan 2023 12:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwv-0000sE-5l
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00062G-Ns
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d14so5665150wrr.9
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xng+v030lq6saGey2ecXUc3PUX/ShBDvViyybr0A404=;
 b=qX9tJFKq3hweuIiu1fa9MKARHhldzZn3nM+g9sPEyx1DzVMjtxi1o7ZtV55xDk9gaQ
 IlUrp53bUy/ktsXD6CwK/1Yht/kGIwHPsOV2VnYiq+OYdaagYttm1QEx5Vj/cHRxW3Bj
 GwcuNL/oUsbAgJNEeGvqK1HHbIEUvEHpmh+vD3XcP27nwl7jfvQW9ZJw8S/Fa2Qsu+CG
 Y31Co4YnaubfiBmpGBzGlVgupnR+mQMNGJLy57tUST4BxDd2lLV4OLtN386Gx88kC+k0
 TiAiXVJ3N7J/aCFehf01uVBn5Ph/rtcDWe5vjRJOidTLDS/Sjr7erRBtwlhgOmBdRq7G
 NA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xng+v030lq6saGey2ecXUc3PUX/ShBDvViyybr0A404=;
 b=HtmW2eHxSVbb2Ga/F/A39HBJ36j2KTZmxO3tscULD5Byu+tspWsiEs8tF2oOX9S85j
 BmNc0SLW1mo9csme65dB8kHqs8gQAEUpHts15xGWMianxcHwM/wS6RpdcMboF5odPEAS
 KJj3lvlSEpYCH+LrIEZM7vXIKGHTfmNi0WGtuDieSPW6w2QYBC7+Utk6bQ+bRnVk02xd
 fLdS5kgRZWNjP0BPYRKc7FxMPBsYluriQv0VFEnGhG1gqqn3jwcBZm7zOVqcNY67aZ/V
 fZx4eVvimh2e/WvpLA7RvjatJO/lHHJ/rkitxLyN2Aj9Q1YcBijB02JicQ6XEABL0J+n
 1s2g==
X-Gm-Message-State: AO0yUKVHZ7tEG3gyWvVCvLvMaCveXJpvuTd+xeml70Rzq5UtGkoFCoSB
 smJU7mo3cnlLlthzn2fMW3wKRCJurb0i/12Y
X-Received: by 2002:a5d:558a:0:b0:2bf:d6fc:580d with SMTP id
 i10-20020a5d558a000000b002bfd6fc580dmr1792356wrv.69.1674842124005; 
 Fri, 27 Jan 2023 09:55:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/23] target/arm: Mark up sysregs for HFGRTR bits 36..63
Date: Fri, 27 Jan 2023 17:54:57 +0000
Message-Id: <20230127175507.2895013-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: hNFM2aAD/Q9S

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 36..63.

Of these, some correspond to RAS registers which we implement as
always-UNDEF: these don't need any extra handling for FGT because the
UNDEF-to-EL1 always takes priority over any theoretical
FGT-trap-to-EL2.

Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
of the FEAT_LS64_ACCDATA feature which we don't yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

