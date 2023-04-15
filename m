Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp724664ejm;
        Sat, 15 Apr 2023 06:07:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgCycZHCC0AIMXYfrFxsjtwmfUJ4OCpcgq/FX8vDSngk34RyPibaCIoR727XCL8P8K/TiB
X-Received: by 2002:ad4:5f0a:0:b0:5ac:d6e6:452b with SMTP id fo10-20020ad45f0a000000b005acd6e6452bmr8163906qvb.24.1681564063189;
        Sat, 15 Apr 2023 06:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681564063; cv=none;
        d=google.com; s=arc-20160816;
        b=wI/cxzBiGqMVqA7Q5T7LYLiZSEvUBruhtqxFu+XUbho5hXdgeU19S6HRequxN8POFk
         D7qCB5o71quT0uBYxhpkYYuHthyXN38gSQ7PuofWGxAs3mdvORngMSAAqg6eHGrvaPr0
         3ZaMAIsthvThrgHeWjCDrFYzRcPCF/CdmthfctjawPMASyHFqXiQtwy80fCo2xhof1G0
         n9FhaJo+ogFEppdHg8ohj0M8lYyOssaFTeOIiyvgBq7R9WemGOP6o7FzikjnaKG8AN+e
         uEfVZG36PuHAvnpb64mhEzIbKQJWKPlHV1to32ZnS+mVKS8I9aEejiRfqzCkRPDtgcgW
         vofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E4l+aJIYWxp2W3zV79CcAEyS7NYgqKtdXuj+K6I2lNQ=;
        b=oqn5ceHouC+wVsoFzIuI49W0jv2wvwzG7cOXFhzGV8JzLWD8Byx2io9bURqTl1OMN5
         i5A1Pz0Py7AQSTjDpMwGnrwmOwWWMstbQgjMtI4RBuhJOf0tBvXJOaIP6cjDeSlSZz51
         Ng+S3t9Tslh20OQzszajkpWjEUPZpTDWwp+kjg0sVuOiTFPqh2YaZdo2txDj8mVcmi0c
         BexOlVqVuqy6AwivKNSwyrjBNlFzs0BLjIBe4rL919Tk2kGBMob/tgKl85W6x2fuewRu
         2Pnp/JecIiINONgPj3Or5BE3caganwfjm0Sx+dSC58wKfdDWo12tIg2GMgxkLENmU+lH
         a4xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="IO+sI0j/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05620a22a200b0074ac983a8e0si874706qkh.42.2023.04.15.06.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Apr 2023 06:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="IO+sI0j/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnfcU-0004qW-QF; Sat, 15 Apr 2023 09:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRW-00052Q-4g; Sat, 15 Apr 2023 04:39:34 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRU-0000uD-HM; Sat, 15 Apr 2023 04:39:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8475661532;
 Sat, 15 Apr 2023 08:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7E1C4339C;
 Sat, 15 Apr 2023 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681547963;
 bh=LNZidgtRoCkEo7HwCkp9NXpfLbvkmSUDAmpAp7fT6aA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IO+sI0j/lZpA3dqZkEfrk9jLIVzuYPDnP7Tj4vdJJ+oGT4b08WhYBLraw+zskCs/I
 +/93zbwhKu6OYCCxDKE7xIp+ZgR8ACgwHrW/9enQVD8DK4tMjFdanAwrTKo7AGY8/V
 86U3Vrx9LivXqOYtb/CZvOqd8fqczanaV9r3Pej1nCf6etYc+/v35pkaW+SRTkt9EA
 Svcy4g/oIabA6vrd7+Sst0GKaNJOzpHgl3qQXTqmZoBSYlkD7T8JL6BDLGFo2Ca26B
 gYj7in89jA3TmlFH7LPTH9DZy2Nwk9SpKY0JbLq04jt5CFCcBIfl8wD8Kk3lzgBYLK
 rGUImC6DX3aCw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peer.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Add Cortex-A78 CPU
Date: Sat, 15 Apr 2023 16:28:27 +0800
Message-Id: <20230415082827.2054-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415082827.2054-1-jszhang@kernel.org>
References: <20230415082827.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:06:54 -0400
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
X-TUID: 9DKASLH4k2Fx

Enable the Cortex-A78 for virt to use a CPU type on the virt
board that models a specific real hardware CPU, rather than
have to use the QEMU-specific "max" CPU type.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 69 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1cab33f02e..98cb53d977 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -58,6 +58,7 @@ Supported guest CPU types:
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
+- ``cortex-a78`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``neoverse-n1`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..4e00b58bdb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -212,6 +212,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("cortex-a78"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("host"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85dc9d57ff..144004b522 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -977,6 +977,74 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
+static void aarch64_a78_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a78";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
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
+    cpu->midr = 0x414fd412;          /* r1p2 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+
+    /* From B2.105 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x41213000;
+}
+
 static void aarch64_a64fx_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1377,6 +1445,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
+    { .name = "cortex-a78",         .initfn = aarch64_a78_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
-- 
2.40.0

