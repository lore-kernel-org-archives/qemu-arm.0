Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1310694lfj;
        Thu, 5 May 2022 12:36:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY9uRtvIJfB0mypRkQ2Jf2WGaa3ScpU6b3UnEXi/ICGsv0wO7WI99L9cqBIi5Ej7yKkswN
X-Received: by 2002:a05:620a:424c:b0:67d:2bad:4450 with SMTP id w12-20020a05620a424c00b0067d2bad4450mr20909981qko.171.1651779388556;
        Thu, 05 May 2022 12:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651779388; cv=none;
        d=google.com; s=arc-20160816;
        b=yfS0X3rQerQn9TDlrZeytl98u33pEbMTLhtV3NpO9YVhg/JUZlx44L7hetPtSJ5dPG
         nSdNQnPLYnKzQIJ0OPPfJTe9Oi42ZsjrGjIVMByJCu13exetqiV6pKaqLiYTcZZg3HV7
         GNVw/YChR6rdNbUbhv31aEAEMz57P29bThjo1KwW4kUT+ffM0D37Ome4MaJ8llF1MYvq
         fkMGwPLsy8A8+5GEXx+r1hcxKYwr9ZsbeAyiyZSaB31q4Yy8jEk1P6Rn+j3aL+F0bfjj
         8IgmRkaezQlLun1nG1v0uzgQLWMew7f0Xvmg/bIgO/Hj+/XtTrM5dxB6SMGb6i3ZlBRo
         PlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
        b=U8jTaMAadRCUL6wQq964opPgI8Pp8Xb5Voqf17YO762DTgIs7fWvXJ+3xroGNewzkm
         QFNCMiPOWNNRhHNobnSvc3tRxPBDblgrQxLChz3BDJf0bOESGSJHUbqRZgaIiAf2Iwti
         3H/mis0Uptv94lbP5EXMg2ybc0ehEKX7Ah1O8oGPQW7wyx7rJ7WhncIBgotZ7x2OPFTK
         uBPNaJKQ2ki7mFsPV7YWCw64kgs4OLkCpR6DN3ir80rb92yxG1Yn0AGuhoCT+DrjNtB3
         NvHMjcJdsbkJUMXVOsrnhZFm56tiA3HzHe4yVwJHrgjoPLxRACefwBR3AQH1m2UVKCoe
         zKJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k3/TdtDe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05622a170300b002f1eaa34acesi1512380qtk.315.2022.05.05.12.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k3/TdtDe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhH2-0007GL-1C
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYm-0003HU-Rv
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:46 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYk-0004bU-Uf
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:44 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso3503208otr.13
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=k3/TdtDeMUTpq8rXGdak5SySoEIQdUx0+f2LmA8anatcXk+esxalHnFPo0wYXfoaZR
 KgZavz1eB13dx8ohWmvDBbmcgDYlvlZMWWFR+EJL7LvAduGJ+cSDdffA6oq/zjRTPrER
 j+47k4M6vowFY3ieE2ZczYBJatAbPFwqB71VcvesRY9eiRdgvaLxFDvdSMmwPlxzMrWy
 XGDmD4+AEF7GS9Y5O+FSTmCXPhs+sBu/E1IiLvk36VgxuwD2/DY5HvxZZmGjMFMMqUWq
 uf6EdlEd0FHfRi/bj7QhCPxjni7SJeS+BIunYjFy+4Vkv1R0jYmHhm/G+XkgFaTf3ArA
 rRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=nJg+p6hazQZd3j72p3K3Z0N1bFTzSlf3wdm6Zp4IaKZDxv11teTRMBWvFaAFkWqxCL
 kfn0qGQwrpB3u2fdan8I/rOPlM6THgDjFbI1ItgX0nKOMbe6Nh7/Y1Go6PPc7L7leRt2
 czykVpDHRtqMX30tpSXY8OshcG/dv+IRXEH+gj4wpYoRv0JGZQFW9FrdIcme/Vdg/kJi
 llhtWrPNaMLoiIWy7GFg4AN00csRcx6Ayc0DiMjHURXtpwSyr11AQFOpeQAHXqjmWWwc
 A3PXNzLXMC0uVRSTxJJW/HgFVewM5B16atUt4tllrOnsfT04GXO/4fxFCNMucZ49KRo+
 AWqw==
X-Gm-Message-State: AOAM532k0DlRmPXRC0WpiJpb8fcqtKXIV/YbZer22kkRmQK/XJ2qkKCg
 UEp4GQOYr6qwj1tL3hVqRk6fzg==
X-Received: by 2002:a05:6830:1489:b0:605:e8f6:5047 with SMTP id
 s9-20020a056830148900b00605e8f65047mr9781090otq.185.1651776641781; 
 Thu, 05 May 2022 11:50:41 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 23/24] target/arm: Define cortex-a76
Date: Thu,  5 May 2022 13:50:05 -0500
Message-Id: <20220505185006.200555-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdunw3VWHw63

Enable the a76 for virt and sbsa board use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 5fe045cbf0..3e264d85af 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``cortex-a76`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2387401963..2ddde88f5e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,6 +145,7 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("max"),
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f94278935f..12bc2318ec 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f55121060d..adfe6b26be 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -194,6 +194,71 @@ static void aarch64_a72_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a76_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a76";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x8444C004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0b1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.18 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+
+    /* From B2.93 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+}
+
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -881,6 +946,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-- 
2.34.1

