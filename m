Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2017670lfq;
        Mon, 11 Apr 2022 18:04:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3b6cBLoBJg0E9mN/5E9fvt5XgCyCtcGJ5cG8pYR0+M/pweZZSaaPlxDOENn099aT4BbJv
X-Received: by 2002:a81:9204:0:b0:2ef:2a5a:89b9 with SMTP id j4-20020a819204000000b002ef2a5a89b9mr939022ywg.336.1649725445052;
        Mon, 11 Apr 2022 18:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649725445; cv=none;
        d=google.com; s=arc-20160816;
        b=uGRRVDa1MNV1ykwskkpa8Crdf+d90laW0/TDM69CLjd02TSpc9zyZbDidntcoSoxsA
         5u8LOiPZ06gT64JA++cP4DyVJ04BJLchdv0dySnk8ZYXmMSptySLTIko0p2Ck8nhed6r
         6gTyZVstMlxzgFRgL5p9TSOeGpWzx4SY0t/X/J8Yjo7TlL9kqY5fo4pw8akClFZ2+rLv
         wYjNO55FBcbDx89PpD6FaZHfujm88wyAqyPOQqCxawLA4kvi7aQlq3Pc2eMtiVSzTqUa
         hUuT3WcnggUnsmEmzBk1TPhyEzFCQpGKWAehD3jDrr6kY9Miav0NtRaLibYkbw6JK6WS
         pb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qbIU9/oJJWMiAyeUILBM2EtZ8CbZd4LnV/Fwi7z9ycI=;
        b=M3r0XmaeaRn/gUsNYUdg5EHpJckkp53hoCA+c2W4kWYXUUXWtT1jC/+YxunyAcZkr3
         4GGpCHr4vJecRppFHWvhpQx82AbzvhQ5oB+xSCE+0qNnE4pcFBCPhiVlIfsbbpPBdt/t
         08Tbt49SUZnRAw2AjUwl1nw+8VJSLvsA2qHdkcizRnV3FMJwZAZsSIybD9CMhZnHHDZW
         qZyIzpmH5xEfXMbeypEkIxOkEqiMTq0RL7G3yImXwXH910YP5GZJhqYbHm44LuYP6QsI
         cLBeUMTKp5C5vocPmC9s8PhJtgmcpwRRqIfTDmWPOUb+wfLrgIz7ZAftG0HKixJLCjV7
         Phlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aduO0cpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k143-20020a252495000000b006411aaf0c96si4595299ybk.211.2022.04.11.18.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 18:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aduO0cpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4wu-0006nO-Br
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 21:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Ti-0001za-P4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tf-0001uR-S0
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bg24so4359560pjb.1
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbIU9/oJJWMiAyeUILBM2EtZ8CbZd4LnV/Fwi7z9ycI=;
 b=aduO0cpRzVGFObzgvuu2nUKS8tQsf4RUWl5DF0CZwTvzCt1TI4DQmQOYFYGXqTAHq4
 KTUWwHFnb0xvi1AWusqfgA+mG4a/Z7cIfxO/s6X1NZrbaXQQf6ivmySGqrCNUyWmOfTM
 ZRPY26uC1t7qtX/AmKnk8BUAV7o9dAOae/Y4lyXtEYj7N3PuHRyh+j68432SwbWW0bON
 L5Zq/pze9GKCJ76IORidfU2Ag3Vf0a6UBscTFOQvsfyBTcQW1xlls/4fWcfdBpaIDwKU
 IQZD31uXFL6cDfPV8cMmeBjgUY3b03GhHoaGz5BcmDR081qsPrdM+9p4cizRy8IYyQ1K
 VVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbIU9/oJJWMiAyeUILBM2EtZ8CbZd4LnV/Fwi7z9ycI=;
 b=EgHGxOF8GGXsHUZ9F7hzOgu1IIIp7HJ1FkBHj/nY3r/WVHuy/rBZAugn6oBNIE3AW1
 kCVeJOdE5w5hEAp0K2Btt6RUTB/vRtiA4kBCEjrQQd5xSDOu1n2bmbt2FkfQTX9Vqz4a
 8B/VHm8iHxe0d4xe1X9JIkI4GAQ3YrOXyEyjiTJc4JMN4OlsqslIfWV31bbpQ6ktCGQG
 QGu1ZunRXl5m5ooZClL90T2t/fGRCD+zCJxGG1S/FDDN0dk+oLAnBgv4JK9v55V7yOeJ
 rjB87TxlSBRXZqx0AEvYaVU5zoNWMXHknLTcZF0v3gHq7MYjqhvV/OyP7Y3WRjpLVx5a
 eBpQ==
X-Gm-Message-State: AOAM531P0rAyyR8n7/JPFUdGF+Tns6lnbdws/FnNpxWlcbvORXCEQgwx
 EERF4knzgokjS3WYPOmmaxHwAYauQZHHeg==
X-Received: by 2002:a17:903:234d:b0:158:5c45:7e19 with SMTP id
 c13-20020a170903234d00b001585c457e19mr8721078plh.27.1649723629371; 
 Mon, 11 Apr 2022 17:33:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] target/arm: Define neoverse-n1
Date: Mon, 11 Apr 2022 17:33:26 -0700
Message-Id: <20220412003326.588530-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kkA1JvcojYir

Enable the n1 for virt and sbsa board use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index e9ff81aa21..e8e851a15b 100644
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
index ce15c36a7f..82dd934de6 100644
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
index 7dbd649b0c..4bfa8af833 100644
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
@@ -946,6 +1011,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
-- 
2.25.1

