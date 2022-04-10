Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp861023lfq;
        Sat, 9 Apr 2022 23:15:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbGs0JpjMBS/OGLRz77pUKrcLSm8lRAJ1+G0I/5uIq4LRlnKs/y/bd4oMAr0ose0A6DV1/
X-Received: by 2002:ad4:5b88:0:b0:441:5b5:e78e with SMTP id 8-20020ad45b88000000b0044105b5e78emr22548676qvp.14.1649571309746;
        Sat, 09 Apr 2022 23:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649571309; cv=none;
        d=google.com; s=arc-20160816;
        b=bLo9CLUt+vQD8Km2yIxAIm0WJ99JJiXVnX3MsA7eiUm4Oc0zuDsvq29HjWGLIuMDht
         U/XNRitDAv1NX+gmuan3i/O/2RPsdChH5QnivsRj63zdfi+l0NuUbXikqyQH1DFj6cox
         uD68AJ2hai0bP2y92C1IzUAyAHBd1XwW9NEYBjF8zZgkIPIL01E20xqdemo7zpxSkiJP
         ttgso5MBj6jDRacP/9fKHljPcLkrwzsRYrQy+42SS4beVybrwRLKcPTOzUwG4DOLunsK
         U8av0yRh7tikYJ7pmX7CneEN5WGLQMB2jxJxMmb2XgrXkEMYozmfkE1XmQxmSu+LTNdn
         USLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RQCqNqBk6D7obGxLExlOvEx+VOWdRCxumNtqIfV9qcg=;
        b=A3n+ygR1KZB0gILvjMwbxNy0EObnQN9tsabgm5VAJpLDoGgO4pvpVL55E7hunDqfy4
         Fz6P1KyXZ4hQtpW9PNy9fAHmt9J0PUsGPwSgYk+ywknhlNCXeFveOMtheP/BW2/fYgRN
         BopMwE/IPgLqbm86droRRTUHQzfXDpnNb9cqEMUdng/hoT7b43gOSw9BfXKE74eqL2Lh
         sa6/xF33zVG08I74+JETQQxjsY+UlWEm9tGchSXza3sw3qkUanYtjOzhzqwhFT5bD8PX
         niRCl1Mbivt4bMOQNAJtCVRRuoiu/vNlDysAb8BlnvehDduJ+EhKZBZpB3C/cEA3rseK
         FsMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oK/EtcpH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy9-20020a056214242900b004442a113f5csi2794083qvb.372.2022.04.09.23.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 23:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oK/EtcpH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndQqr-0002DK-8A
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 02:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZs-00028B-JB
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:36 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZq-00030g-KQ
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:36 -0400
Received: by mail-pg1-x534.google.com with SMTP id t13so11421701pgn.8
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQCqNqBk6D7obGxLExlOvEx+VOWdRCxumNtqIfV9qcg=;
 b=oK/EtcpHJr71WWjaM7tHpXckt9XUYsPoPk5PKZFGvK0zHxXEUi10q3lntrjY9NfSvr
 yp6u0uGmm51eeFmvc8/xYHD/pR0tgEHuITXkQdWV5rt0KOq/87Ia79HuNG+GHCBNns28
 rXkV6Wzy0YRaeYUKaPa7hSA6uGpMi6aaNOzfYLcMZ5fumcLdt5zVOc6mkLNsD3LTd4Q0
 SCj7POW1ltVlcmQntzNj8bJRWiA6AM6iNKh8QFIW2C/Cl5VE6Femb4DpFs/9QS+BW/Yk
 2dPUCXX2KH7rF1JAvRWQmBrC9WfTvH29IZmVhvrwqdxIH74cdy3NyvpITqX+IjfRyvoC
 sKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQCqNqBk6D7obGxLExlOvEx+VOWdRCxumNtqIfV9qcg=;
 b=6ml9sVV+rUfXP9/43VS8O8lfZAON/vhrxdH2wPO6KXT3Sf7KpJV0lKfyZDIEpM7FH6
 51FaEFlpf3L9RkOoTt/rOLzy1weiI1/9spvyplT7E/14D5O20FNIiHw/Re8Opv6fEwKz
 hAwaDQlDtQC4GeLZg3ITRFuUST10oK8laUwHUONWb3tWTvUsd5JvtRGoOf3wcXgUGVRX
 CZ96FFwyzRBIhzT3JXVZgia/mRu87DklnnKyIPOo/Kdeb7kLAoLmieyJO4+/ilYzjETG
 BMcvNNm1q1Hv+PqA9YtUllJJGG8jB65R3dipR5lYmanAXA8WY408pso2Su79K3GiR68L
 /UoA==
X-Gm-Message-State: AOAM533j5hzhsnQsXCRZHy9fGGQFYCZVm9dXh1n/YpAuqvr2/1ZRVco/
 uTL8aH6JonGLO5WFBawznPEEZQ==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr22326011pgq.215.1649570253242; 
 Sat, 09 Apr 2022 22:57:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Define neoverse-n1
Date: Sat,  9 Apr 2022 22:57:25 -0700
Message-Id: <20220410055725.380246-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pCpsIC57SMi2

Enable the n1 for virt and sbsa board use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c  |  1 +
 hw/arm/virt.c      |  1 +
 target/arm/cpu64.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

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
index a00c02be2c..6a67b3d840 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -314,6 +314,69 @@ static void aarch64_a76_initfn(Object *obj)
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
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
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
+    cpu->isar.id_pfr1  = 0x10010000;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0c1;
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
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+}
+
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -1000,6 +1063,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
-- 
2.25.1

