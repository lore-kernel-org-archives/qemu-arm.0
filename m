Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1985676lfj;
        Fri, 6 May 2022 11:21:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywWzrA34tBIuLNJXYXx1o2aoTWpspLEPJerU1jGfLpUGk2ckee1QZtzBLt3Hu4owaXpOvn
X-Received: by 2002:a05:620a:244e:b0:6a0:49a5:f409 with SMTP id h14-20020a05620a244e00b006a049a5f409mr2188190qkn.750.1651861299876;
        Fri, 06 May 2022 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861299; cv=none;
        d=google.com; s=arc-20160816;
        b=Po7as/Hb09YbAphKfRVPfCdt1M68kNVNpAZ45mWqd0eysQ7nWAHGZneFI56nMJsKIY
         4H8UqgC0tTO7Z2AVskI+uWyqZJN+etaiRse6b/FRuvJOM3hlPI/j8G0Tm7PXRuocUXSC
         CdJailBgS45hFrA9K7yXbJv1nLuJqAF8q5PoBJc6bFR3yMP+O5io0wYm4vGKKqNXgBPj
         Hrc/SSrZE9XgKwYKwbnrXPFdTv5E8D/zgiR94/Li50vAPRjIh36854M3BUvTLxSBaUOC
         5FLyW5xbkwO0Ve/nfTL4fa/W2Brfpn3pm9VO0nrlrbQe6pZ7ME0F0VaAzr1dG2TJIEGb
         s6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
        b=ShCscxScQ7LSOVPo3/KzDfA1fmVh8Yd8t/hC8mmxAVVD1Efxuoik7+rzT/c6bFgO9I
         Gn24v0YowlHS4vEch5jwJY/VT0ohr7X2lS3URWij4j4jIGukSsTp4MJY8eKSnhBqmrA6
         b9buHj4+bWpfaJyyImgCytkYKgzeYFncI5tBmtKLGXtA6/Sn0zNtl5ZN2Jc4HhnCBzLR
         JuIhE/LURr8cOs0CZBaixDmT2NhTj9jlfoQtEZT6sK03634peOpBdge9fY0kzi2mdyW+
         8w7ea0b/J0TJFY8sJrVRJIG3gkShFP19aK3DXy25ydEK9jdkp4rPYlCHyUqTYcZoz85f
         acAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGXk2LOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d73-20020a379b4c000000b006a01341f630si2372482qke.198.2022.05.06.11.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGXk2LOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2aB-0007V6-AY
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IZ-0006HQ-IT
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:27 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IX-0003ty-MN
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:27 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q8so8277255oif.13
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
 b=jGXk2LOSXxtMydGha3fsn6HDTV8xphHvC7b3ekIHlDFBYYxkvbRWXCDsWUl1KHxhgC
 2mgidXrlp4MFUrExq/4EXCfgDq6JwJ4Obrr6/w5OH6gKAJf5FxRCFcEt+dAgtoe77XYx
 FjVGRPI+SSuOH07KulEOeQIdVf2yaww+GqrEBvBSIIJ3a+6kr+w1tRJiFYnZaQPs/Msm
 vgC1ONRqCluNa30Secmc+AydCwwE0ZmOPo88a2S04/ezus3c/MNDSt2hWx2F1QASO3qT
 lzN3n4hzmnnGDZNH3PODVUN67cN/MxSXc9fscwINQ5VqQ7bnBPkSMjMv2EiI7xYD0V85
 T2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zS8iy63zUNyzTAn358CLXJXvtW6Z0IyKqcTl9uBiuyg=;
 b=rq+QizP35LqR172UNAH4b1r3jaDvCOEAaULM9C2enOU6F7yY58qteA0N5YyeZ/DPMM
 /HY5E9fqxQUMyMAVdQ6qtk25AktuOqHHfHvFM+zxz/WvRKOSsU1qnOwTvcvs84UeIBB0
 wJO8K03c3T+unoCQelBidBgh7/lQ5/hHmYWmPrfQ02Dr+/nTtxVgqtCzrHDyV6jD12pB
 3X2FX3tKrrEC09buC6X9vFl1gFgN+69zKu6Qu8JHv6YmbWA4aSWomjpsaNg+qMeE2MfP
 pA5Jd8bjyeivTQzvK6LZg12Uz0RfBRn4MHG7HuiVdA6CiZ7QlUvus4/gOXQKwzMS6w+t
 W8Dg==
X-Gm-Message-State: AOAM532dSHp4rSxOGZrLq9gBPSaoN3oYkiTSiqagwu1YJ4LAjXJN9fDy
 EgloL9aV7zM/3VNkfNQ0Qcb4yg==
X-Received: by 2002:a05:6808:1b11:b0:326:4608:4504 with SMTP id
 bx17-20020a0568081b1100b0032646084504mr2066067oib.145.1651860204953; 
 Fri, 06 May 2022 11:03:24 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 24/24] target/arm: Define neoverse-n1
Date: Fri,  6 May 2022 13:02:42 -0500
Message-Id: <20220506180242.216785-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-TUID: T8NDWec+99xT

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

