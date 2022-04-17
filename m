Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1286631lfk;
        Sun, 17 Apr 2022 11:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8mOJukbcMvIqKP0O6jL7FsHGo6T2KbMQk6OL+tkA1HlJgJ+oiUjlOim4vkgc8hQg3i34K
X-Received: by 2002:ac8:5851:0:b0:2e1:eba3:3beb with SMTP id h17-20020ac85851000000b002e1eba33bebmr5153007qth.20.1650221544255;
        Sun, 17 Apr 2022 11:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650221544; cv=none;
        d=google.com; s=arc-20160816;
        b=xNvxLKXqNoCgINR5hVxs490O02JuCoAyi7WiNhu7p6UW5K64OqbR44DrM3a6uW14WT
         KI3oCHYAFUMNBUcJgevXElSU07S7XjErRhVtVp+HqgVVgW8GsKMFkF4JLXNnaoHGIr3+
         hXS9H7JFpZ9hI6E0+42if10WKVzFMDiDbDroOBn/2yFd5xd4SvoJbpq5c5y7oIsfG19O
         kyyocsIPyu/OaXL4EiBaSkXgxfnOzVzlAUnInbndDDPrEXaMJQfKsKqY/XteeTg7Tej2
         /uJoeM8HoEbdnmA7D6BtMdUCkf74/+ZoMtPFgcJCVghN790LD6Cz8t0pHbUGk0bs7DAT
         RP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AWChTNub/svxMafWwyMDKgs1ZSDrVWcoRccpdVr6IWk=;
        b=WN7POhOssVLWRUyuE4jEPVncn+hfnJXC8Of5OM2A8P4RhNWHD25njYOGDvhI2t1KB/
         Fcz4bCzuSPZW5O/o+w5IqcPskCWZTcDXalgtUcIEX721123hiIMQvJFB5wP2KFitw5Ns
         2i3uP/cHdzYF6KIuMBbRysmtNY2jJPw2ua+9S1dCqpk86oxQP1n5QWUV03Y8T295yd/4
         +q5QT9FGapkoXQe3iiT9ajZMDBT0S9/fgtQgE9m2IcnfKmpuHSuF3nAetM8Ey9Rr2o2O
         ibnvQpf5yUkK+WYbSL6Is8g0BW2IS4luTK9/HN21/g/EzrmjnHlIPu4zEsOKx1ZksC92
         91Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNvTwov8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a0562140d0a00b00443e039f033si2226443qvh.189.2022.04.17.11.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNvTwov8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngA0V-0008Qf-NG
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90a-0004nt-NK
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Y-00047T-7Q
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso10830339pjv.0
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWChTNub/svxMafWwyMDKgs1ZSDrVWcoRccpdVr6IWk=;
 b=MNvTwov8M7uHpW448lDUcuAo0h2kyuhJjIm5LWpKDNQdrzlCVDHGMEJeb2YnyPY3Uk
 m6OvjlpiU0PblON0aIFv1tf4AGB6BIKBzNatt1XFL2Myw5pTQSUlVPmpe18dS3g4MDAv
 3D9eQ8iZjtBIzI9hcJkvl0SUHL96aB9qUzmifDE2BNK3rak7dspxjYTGeJAiSfS6/6w0
 J5xbbhI7G9c9PMb/47rqBlEH1W7+OB3l45sjmRKGjzhaPtePEVo3a1lDpU92VF8m1Y0L
 BrkWbXYsNM98qpBNoDnn0N318Z0LolmEsK+Q9BectnRHZYA0Q2U7WvvTj44pfCWqfA85
 4+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWChTNub/svxMafWwyMDKgs1ZSDrVWcoRccpdVr6IWk=;
 b=ZhqqKu3UgoDV3Im8nZuNdNhc4YwA4lmgPRBx49q5JLoVxkOF9zFqbtuyJiPBT2PoVa
 w5EMH1wCGqm2TqCrDAwtPFywF8qXcHL0B1PvEc6hyb7396OZ0WyfYopSQkHp8sNMAsm+
 wHQCfWJNlRn21JMRZyCpWqNxoNySNgIcbYjezT3I8ljRA7HaX/1PZ9Po8aSBMO0l7xZC
 tglvc9YyzJajpTC2sH0k3MnhJaIVwWEVuuusS/lSm/e0QCGiPY+/VKv29ni6BQRwpoj5
 8amsjYBghlRSkCd9ePNIGjmk0/5/St/G+UY7fc8kgIetqTFveFbQJAkCVTf5HNKPwOVG
 78gA==
X-Gm-Message-State: AOAM530p1L2MLxQ5vrzah/cp+XsizPccdYdBXY1WOxnmk4YYner63yOh
 IE0eFYElHMzVI4DANrQYDqHQNSR0sbDc5Q==
X-Received: by 2002:a17:90a:510e:b0:1cb:b1de:27a0 with SMTP id
 t14-20020a17090a510e00b001cbb1de27a0mr14567096pjh.196.1650217700857; 
 Sun, 17 Apr 2022 10:48:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 59/60] target/arm: Define cortex-a76
Date: Sun, 17 Apr 2022 10:44:25 -0700
Message-Id: <20220417174426.711829-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
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
X-TUID: zRrHQQMdV8m+

Enable the a76 for virt and sbsa board use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1544632b67..e9ff81aa21 100644
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
index d2e5ecd234..ce15c36a7f 100644
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
index 336a941acd..d046351991 100644
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
@@ -879,6 +944,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-- 
2.25.1

