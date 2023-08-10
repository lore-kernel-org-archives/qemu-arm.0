Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp366180ejc;
        Wed, 9 Aug 2023 19:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAunKy5tS45WGRZSg2X+7hFSUaaWcdMsIGQTmegwnG/23h5eCbqmEWwJHdR+d+WeoTLZkW
X-Received: by 2002:a0c:8ece:0:b0:63c:f1d3:f662 with SMTP id y14-20020a0c8ece000000b0063cf1d3f662mr942550qvb.0.1691635015804;
        Wed, 09 Aug 2023 19:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691635015; cv=none;
        d=google.com; s=arc-20160816;
        b=VAUVHiwM+C0WN7ig/m3iR8JireAGWYq58mQvwVM01hPgI64AmB9dYKAcTjQ+z3An9D
         BqLIVYO0BZqRqt0exSJhLFG6hdhSqlpC2DwtJjtVTycWuXZsf1TYBpjDOabJ7VV1Gw6U
         bL3uPcjcEl79OYu3Aj2U1lcShWO0I+AwN2ZTFxaEBA77jprzhsvfE0PHGL8ZnJisy6Ln
         5US/IxsGM5QeDSjXLdD/hqsWpSjQ8U2kydGkJFmIge4TDzD36Jo4mofhEeXq75EFuyeQ
         O+cKqXw3W02xRMTIVhZuuAHkM3iscP5+6cvssXidVjPtITemeFdBXvojjkSxQbSqXemz
         kGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zAYDJTdawZ3d8edXM0V7IrgfXqP83Zo/hY/QUM86iSw=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=gyYKKZXw+DAPuzhSOQ/M3P6ibcgXv2skGYUVtnIDaqmZT+1ltpR96BD9joeGGmAfDf
         7/zB2s6ChIk/pug7F5lvhunLIWlZJ699x6136XrFg6ry4o6Ke2GDxlXniZe6PyOImahu
         g1Y4KvhWRntLV0kKb2YO5davXMDUec6HtdWMMVTf4LxZsL6D233IOD4LuxpPg69+yUzr
         ey9gp8cZMw69VrL464K80laB93LZWGQVrmqx+1DkySzTAM2xBB3v9CeIYoCFINRyTt6o
         RZb9OHGealw5sXEeKefmwnI4Z3NxGbJto8vYD7aMaH+RGplJp3aSHs9uz30LlBZUbvJi
         TuKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uTvHPUyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a0cb386000000b0062fe673acfcsi214150qve.548.2023.08.09.19.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uTvHPUyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTvWr-000113-Bt; Wed, 09 Aug 2023 22:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWo-0000yW-Hp
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWm-0004yf-17
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686f19b6dd2so316752b3a.2
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 19:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634955; x=1692239755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAYDJTdawZ3d8edXM0V7IrgfXqP83Zo/hY/QUM86iSw=;
 b=uTvHPUyFAJxSGZ1vUWo65FG3SGJlHTHFip8ogoG2B5xZHnSbdm2vGM9dhP4DGa7mFN
 KFKNXySA9ZPWK610u1m6AzujI3BrM/5eQ53kJ7hi+UCoEn0m9h78jKc57VkjRtrHQx/J
 0sbN2zEDeipGKbGIpdbunyr0cdLqRFOGsWEAcVnlesP/j/oQuGJtwfNN70nm0K4Apuk8
 6hpSdO+l7cwMsO2WmwGCPhrMjVJtXZPy3h8mknK9KT/wNRcdiuGQt5ygDxRnhSCo2pzC
 CfGQDBWalIzSaWkQs+T/5zQhyijvghsmGTrkDt7ZMczbCAETvWHDzgxVhu7NwLbJTTfS
 mq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634955; x=1692239755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAYDJTdawZ3d8edXM0V7IrgfXqP83Zo/hY/QUM86iSw=;
 b=apqOD9QFjczgrT2ut7f+kyk+vLdfPfg+QCj2ZYgA6VF9OZXDI63oYom2eT2487IFXO
 hwoeU3cuGeJMc21ryNTKlfUiwp1uTTU1rnRWCAbEix37b8CaKCj5iOkGmC/EyGevXct1
 NwUlS3pfyWG9oBEgw2V7M1SRNvBOz7yWrm7JmrRUDrvm2gKBedByvh6voIjGzcqe5Bi4
 4U1PpTpbS7pQcTDAmey6Q7PT1d3N9slmpsyrAujXp2bBy1O3nFSrZ21fJr6j8AFX5jdI
 6kiqNdlqiWpnl8zM7dZ3jzjC5FN++y666c4A1IlJzfaZzAsWZ5Gwg8krVHQ5pMU7RI2D
 Ji8Q==
X-Gm-Message-State: AOJu0YySCKcQOmaHTJkRcY+AyPpURorqaXEmRe1i01sg4aHK9cYKw+7b
 7Gt41y1apQNtiuWVN/At8OZogg==
X-Received: by 2002:a05:6a20:cea9:b0:13f:53b1:c063 with SMTP id
 if41-20020a056a20cea900b0013f53b1c063mr1010138pzb.49.1691634954479; 
 Wed, 09 Aug 2023 19:35:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/5] target/arm: Implement cortex-a710
Date: Wed,  9 Aug 2023 19:35:48 -0700
Message-Id: <20230810023548.412310-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810023548.412310-1-richard.henderson@linaro.org>
References: <20230810023548.412310-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: kVU7p3wh2tu7

The cortex-a710 is a first generation ARMv9.0-A processor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |   1 +
 hw/arm/virt.c            |   1 +
 target/arm/tcg/cpu64.c   | 167 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 51cdac6841..e1697ac8f4 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -58,6 +58,7 @@ Supported guest CPU types:
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
+- ``cortex-a710`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``neoverse-n1`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc2663..d1522c305d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -211,6 +211,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("cortex-a710"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("neoverse-v1"),
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5ca9070c14..6f555a39ce 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -700,6 +700,172 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
 }
 
+static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
+    /* TODO: trapped by HCR_EL2.TIDCP */
+    { .name = "CPUACTLR4_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUECTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 5,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR5_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR6_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR7_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR4_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 4,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR5_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 5,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR6_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 6,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 4, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 4,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 5,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+
+    /*
+     * Stub RAMINDEX, as we don't actually implement caches,
+     * BTB, or anything else with cpu internal memory.
+     * "Read" zeros into the IDATA* and DDATA* output registers.
+     */
+    { .name = "RAMINDEX_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA0_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA1_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 2,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA0_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA1_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
+static void define_cortex_a710_cp_reginfo(ARMCPU *cpu)
+{
+    /*
+     * The Cortex A710 has all of the Neoverse V1's IMPDEF
+     * registers and a few more of its own.
+     */
+    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
+    define_arm_cp_regs(cpu, neoverse_v1_cp_reginfo);
+    define_arm_cp_regs(cpu, cortex_a710_cp_reginfo);
+}
+
+static void aarch64_a710_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a710";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by Section B.4: AArch64 registers */
+    cpu->midr = 0x412FD471;          /* r2p1 */
+    cpu->revidr = cpu->midr;         /* mirror midr: "no significance" */
+    cpu->isar.id_pfr0  = 0x21110131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_dfr0  = 0x06011099; /* w/o FEAT_TRF */
+    cpu->id_afr0       = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x11011121;
+    cpu->isar.id_mmfr4 = 0x21021110;
+    cpu->isar.id_isar6 = 0x01111111;
+    cpu->isar.mvfr0    = 0x10110222;
+    cpu->isar.mvfr1    = 0x13211111;
+    cpu->isar.mvfr2    = 0x00000043;
+    cpu->isar.id_pfr2  = 0x00000011;
+    /* GIC filled in later; w/o FEAT_MPAM */
+    cpu->isar.id_aa64pfr0  = 0x1201101120111112ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
+    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull;
+    cpu->isar.id_aa64dfr0  = 0x000000f210305619ull; /* w/o FEAT_{TRF,TRBE} */
+    cpu->isar.id_aa64dfr1  = 0;
+    cpu->id_aa64afr0       = 0;
+    cpu->id_aa64afr1       = 0;
+    cpu->isar.id_aa64isar0 = 0x0221111110212120ull;
+    cpu->isar.id_aa64isar1 = 0x0010111101211032ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x1221011110101011ull;
+    cpu->clidr             = 0x0000002282000023ull;
+    cpu->gm_blocksize      = 4;
+    cpu->ctr               = 0x00000004b444c004ull; /* with DIC set */
+    cpu->dcz_blocksize     = 4;
+    /* TODO FEAT_MPAM: mpamidr_el1 = 0x0000_0001_0006_003f */
+
+    /* Section B.5.2: PMCR_EL0 */
+    cpu->isar.reset_pmcr_el0 = 0xa000;  /* with 20 counters */
+
+    /* Section B.6.7: ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* Section 14: Scalable Vector Extensions support */
+    cpu->sve_vq.supported = 1 << 0;  /* 128bit */
+
+    /*
+     * The cortex-a710 TRM does not list CCSIDR values.
+     * The layout of the cache is in text in Table 7-1 (L1-I),
+     * Table 8-1 (L1-D), and Table 9-1 (L2).
+     *
+     * L1: 4-way set associative 64-byte line size, total either 32K or 64K.
+     * We pick 64K, so this has 256 sets.
+     *
+     * L2: 8-way set associative 64 byte line size, total either 256K or 512K.
+     * We pick 512K, so this has 1024 sets.
+     */
+    cpu->ccsidr[0] = 0x000000ff0000001aull; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x000000ff0000001aull; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x000003ff0000003aull; /* 512KB L2 cache */
+
+    /* ??? Not documented -- copied from neoverse-v1 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    define_cortex_a710_cp_reginfo(cpu);
+    aarch64_add_pauth_properties(obj);
+    aarch64_add_sve_properties(obj);
+}
+
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c;
@@ -889,6 +1055,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
+    { .name = "cortex-a710",        .initfn = aarch64_a710_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
-- 
2.34.1

