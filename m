Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1310832lfj;
        Thu, 5 May 2022 12:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF9yPMmWvlAeYKxsqhrGFVcK2e4d7SFO+Ii1QY0x8+L0RL6PGYjjltloyK9Lf+4GjkdZ3x
X-Received: by 2002:a05:620a:1729:b0:6a0:2717:9aa8 with SMTP id az41-20020a05620a172900b006a027179aa8mr4650661qkb.158.1651779402001;
        Thu, 05 May 2022 12:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651779401; cv=none;
        d=google.com; s=arc-20160816;
        b=go7rK8lEZmp9Eq6y08Mrn0tmcZ52Zym+7YZrU30ogHSv6sZn28NAqvRxYZ4U7UK0L2
         K91YRRrkRQOggwPkpdd840z6meV6aFDWbNICWwOKAjhZDagZ3CoWUmc2zeAS6fP46s0a
         VMHm2MTzqjcNmC/XacFYaQCEI2aTdpI9iK5hTso2EXIYo9aGEA+2HgBqIMS9dKrZCYvc
         Sa5upkaj0121ZvD3dqjdFuXGInJ9Vl4+HKvQa2q+MarH5XonC96oulztlq8DJavwxeA7
         270ZZd0l37UxC5d+P+iz+JKOMz7BSQOIM1adknnCUktEs+14kTuaonMCN9mywtHOjP3i
         HWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
        b=pAIefetb9cX00erujSL7XSCpOSRXbYtMlanQuo1VkIQbIrDscbiri1vcVS7gnqIQe0
         tpqe8lOH/8TO+xf/tJSUABpugdZvcsMsR7z85XgYhyjvzGZZA9g2tmZhKza4/1sO9K2U
         hT1cFYGLGDWivCNDSfOQQENgeIAQIjQKMWMPZJMQIgOnZWf103nf+tNHKaYcGt1+cee+
         og6MRq7xy9+ZRSNIuwH2J16FBWwZeGUb+ALWTEu28LTg/F9FMJI4Lkz9itNtEBk1/506
         ZDyfj+wGRsCoBSgzk2AA0HzAlv4xbAnDWlAOFYTjXq1cw/FnmWsWLbcjoW+upgdHrQiy
         m9bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGnf9CAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n124-20020a37a482000000b0069feb7a9273si1083098qke.248.2022.05.05.12.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGnf9CAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhHF-0008BG-Fc
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYo-0003Hy-BI
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:46 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYm-0004c7-EC
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:46 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 h10-20020a056830400a00b00605e92cc450so3495868ots.11
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
 b=rGnf9CAui+YDLtBZwLybfnOWZfceePp8T0P0lR/t+X3ydPbQt66USLtQPt0fDCQWVY
 5AJDaylxxIXEspnCYUicUR2AxdW4o8qYwXLCDC/FRXHi2+7Jmklf5HXMpHzHj7mAeHOR
 JzppiGXs99lxtV/UCL/NiLUFMQ3wDno7ToqA9cCUcAvuwNt/COif+nCCzRtoHblSeZQz
 GRJyqtBQqQYxhjmCHzL+3lHIjWgRYTWJfOlOM4xT6hx7FUY/GjyCD3aId/zJN7Qd9bbX
 lSXaWKgs9Y0hwWyJEWjahcUeJM//bDKrSqBn1qGE6ockHZRt3DhntJ9FsOVzXJ6Uc9iv
 XHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
 b=MhjntozcHpZOJG49sIoYBcgHWjXx1d9Y2RxVvWkdBLVozwhRllbGKfB23yKj5NHyNL
 qkvMAZarcSB/MFAioDzZbGEYdZaipYrTaxl3sypSvlZBFYogbMepHAy5167gS9C7HqEJ
 UPSRV/UN/cmfx/+MIxPemig7/hmnOZmOcjp9KAEpxrM5fRkYFLM6Kb9NAq+y/2eEVAJZ
 xpqgZxuOcQrEuXhOxnXfnlzxn+TfqpgkDfYjP3jWBKfccpEZfP/ILflfY4nVcnIlzzha
 j/36FG3zklzRHGTx67krSzZDsbkJZH4lXmyIjzSCmQv9jx3MFs+yLREHbzO+X2Z4kqeS
 BVeg==
X-Gm-Message-State: AOAM530mh3Kyd77E+z12kCGZgdAKHCzuRh4PuLXLrPYlQFXjC4NHm4G7
 Vymt87F0CpIT6V2dg0HSAyaAn/dcgDHfqE5g
X-Received: by 2002:a05:6830:2307:b0:606:1573:172a with SMTP id
 u7-20020a056830230700b006061573172amr7996084ote.334.1651776643256; 
 Thu, 05 May 2022 11:50:43 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 24/24] target/arm: Define neoverse-n1
Date: Thu,  5 May 2022 13:50:06 -0500
Message-Id: <20220505185006.200555-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
X-TUID: cY47f60XmA3f

Enable the n1 for virt and sbsa board use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3e264d85af..3d1058a80c 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -58,6 +58,7 @@ Supported guest CPU types:
 - ``cortex-a76`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
+- ``neoverse-n1`` (64-bit)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
 Note that the default is ``cortex-a15``, so for an AArch64 guest you must
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2ddde88f5e..dac8860f2d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -146,6 +146,7 @@ static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 12bc2318ec..da7e3ede56 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
+    ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index adfe6b26be..04427e073f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -259,6 +259,71 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000043;
 }
 
+static void aarch64_neoverse_n1_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,neoverse-n1";
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
+    cpu->ctr = 0x8444c004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
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
+    cpu->midr = 0x414fd0c1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+
+    /* From B2.98 SCTLR_EL3 */
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
@@ -948,6 +1013,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
-- 
2.34.1

