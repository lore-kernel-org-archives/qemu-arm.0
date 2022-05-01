Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2345lfj;
        Sun, 1 May 2022 00:29:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkMcYvrm+KAtiadjYkLRpmTnknwuoxDgMoWEziup07OLoGRKP148Sg+bkNbNRZpJGkQsHg
X-Received: by 2002:a05:622a:1886:b0:2f3:9b94:ead0 with SMTP id v6-20020a05622a188600b002f39b94ead0mr5617147qtc.544.1651390154487;
        Sun, 01 May 2022 00:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651390154; cv=none;
        d=google.com; s=arc-20160816;
        b=ntEdIc041qRdxIYgtlp3V7XECBO+OIlFEY79qLuCMt0dnSDNi+jv8eiaabPwYoIF7V
         7civ/BesSepsFEYF1Y45kTaWRL4TiHvSm11xxgwOQLg0VnlQP4CirW3CpRsTSnWO4wC5
         sRNqpvEoVuolzTlaDVldggy74ziaxbpt5HVNfsC8+MbyPkNEuZxfDIGDmXL2cJXafswb
         IJKrYhS3vWYbVJcJIyCPbBoKyfdtSvDms2L1ToCcGuqsMOJQ/DvHZIg7OceXZz61HcRR
         iJqiJQ60EClOfa2ddFIEyelSTL5kqD1g6BNe3mm9YUQNwvr13YoRhQz5ix08ARb5K1ZK
         E02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
        b=okddGY5TTjHlN6YtB8xPPg4MtLFsqBT/F4o/yLouaiwhL2wzCx0HL2ZM55IzMF8JJe
         2Pe4ktt7l9+VAnDFe7qtYY4j4cROOOnvqv+zF89iA+zvhezNM2g3Nq3iwDaVZaClJUU8
         C7Uy+9KvMaqLzF4UlXHKERI0pkN2cAjGdfBMrlZ46B0LYdbwR4GGcYM3vqfF60/YIKVD
         kF7REGsA8kmOrQqzdE5cUkOqGiP4ea4wpMKLLzVM7RC2ZdNOmT1E3bVSrrajHFj+zTLP
         Jkwd81AyHaUZGz+KEYfMQXL7ZzKK8fPHnwXVbSpTytLMj/AOOBmgnzFzNS3h+UK9kLbs
         uZ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=thDrjyzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020a05620a268200b0069f845fb7e1si5484476qkp.286.2022.05.01.00.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 May 2022 00:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=thDrjyzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl413-0007d2-QF
	for alex.bennee@linaro.org; Sun, 01 May 2022 03:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2XA-0001Cx-FA
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X8-0001mH-0N
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:16 -0400
Received: by mail-pl1-x635.google.com with SMTP id i1so4139415plg.7
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=thDrjyzp+jfsNrGVER2O+pQaUjKBTN4zLVzDjsMiW+fmvIoLwXaa4bqztwrOuxuByT
 hOjlFQqxkqkre7Ylmmd7tXz8srFUF0l8oFNnFvKXJGUw0zTqJ07ELcbllsk0lcNygyyV
 LPybMt6WeOEoe4Q21r4wThSAQT6kLk5ORvJWjc4H/QtrcA1Fc/cMWdZfDsSnNNnc/JOF
 uhg1H9o8Hqxh0b2T5MGNxPIyvW9gVvbhKYaF6AkqLp28b+9ets4FCYwxkuoEemkFpsrk
 6MlMhNkoSgZ0OaqsH0vuRHNnA3cP36GcEKH89uIl11ZkCbZW0RHmBejjsNNNR8T59ySI
 U8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=QVNYD8EnC6XpgS3pq0BLcidn7mMh7tdbZ21yk1megmeCL9DE8PqYRIPWhHL8m/iIoH
 6co62HYSe5Dul3eOeZiv6n4WnSZQPHprfKo6mpTk5zDIWV3g0VrUL2P4/mdDheFnTL5V
 fuTSJX9VYTVryxxX/77ojkdEvj9XEmfzzZ4fLV5MBQaSOWYiqWfC0nHDuPPrFMjWXCgY
 F9qZlqATkMV9UPYc72gPytsVdoyoy9RFbA+PS+loLM/zdIAq2n24EWkHHSR1SXmjmLOE
 iz87MXNIXpfaT+tgpcbYWOPjYwadwUPUO/4+SXZdePlAm5QmpBF/B2Vohlx5n6aLJOZA
 T1nQ==
X-Gm-Message-State: AOAM53343HkVu5dwlViMsWITNzm1Ak7HaLosrpRh2sNshVmHW9jYYclr
 1csWgvChBJE2Rzv8U6AFqDj+rQ==
X-Received: by 2002:a17:902:b606:b0:158:f7d1:c085 with SMTP id
 b6-20020a170902b60600b00158f7d1c085mr6299777pls.12.1651384452625; 
 Sat, 30 Apr 2022 22:54:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/45] target/arm: Define cortex-a76
Date: Sat, 30 Apr 2022 22:50:26 -0700
Message-Id: <20220501055028.646596-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: fYRQRiwQ9bLw

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

