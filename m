Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2390537ejx;
        Mon, 21 Nov 2022 05:46:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ujM+xj3CbrrsB9FRZm51JwJKPcTddJKIuTDL0cJvuKSumpHIIPNtS7Fs8EUtH57TLiu4e
X-Received: by 2002:a05:620a:205e:b0:6fa:57a4:6526 with SMTP id d30-20020a05620a205e00b006fa57a46526mr949041qka.671.1669038411958;
        Mon, 21 Nov 2022 05:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669038411; cv=none;
        d=google.com; s=arc-20160816;
        b=uItyS7JnrOhsv9BzBty5YmNyC9+TTXw75y/bI6wVUfj2+FI2FSnXb/E9xIeH8rOdvV
         Acksm2QKJN8o9rLRozWV3U2vyFTkzGkjPhHQ10yVCl6BoI6CkDE6O3Nq6f9wEuzfXjdJ
         BCJrKNA8XjpRtkeeR8sosvDezUZ83UFxPoF3/9uRymxGIiHiiXqvcp+4CX0RJhNQxDuY
         4T91du0eDFjhZF9+HTeJE9uN/g95PrnTgtwn5wb+hSfpILqEtbupsGYbSItLqn9/txcO
         0YmM+oy6PFk2X/NA/hV7Uzdz9cFm63WRjvC/F01/gm+L6qHgt41Yaa+6CVamBSx1ZUW7
         GJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=P0hkIqbBe/RseetpPmCKez9mYuN6qSjmPAo1amuK0T4=;
        b=Al1L+VjkNnwo6eR5607D8F1vTu4YkZuOB7PbXSpn9MD5sCNXuU5zd/LVhe/A4vqnAp
         /XwkSrJTTUZ2HqVl0mTAODDRWgmpJ4yYvBPpSFrbW2U3aJ08STY4kHavA98xlkRCqFf9
         f0CMrI2olVT7PR42HYpB+ZVZ9+Qeo4X+EaekXMrASpAVtecS4hp6hn3tBeUyxwEXbvcC
         1xyE86JDPb8So+gUdyS7RuOj6WFBlyvSIbELzKs92piQy+OPFaM9yk3x9A+L5fiMn4yy
         17s2HkMoQwODsqHU1c2tLzl1EZ78n0ZDNwBIb0tQZSSoMtFr/jEypFKLaGAg7pYBOFSM
         3J4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XmerbbgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj5-20020a05620a190500b006fa22e9ae50si6344637qkb.519.2022.11.21.05.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 05:46:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XmerbbgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox78H-0003Mc-47; Mon, 21 Nov 2022 08:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox77t-0003Le-2E
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 08:46:25 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox77r-0001pG-13
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 08:46:20 -0500
Received: by mail-lf1-x12b.google.com with SMTP id g12so18922449lfh.3
 for <qemu-arm@nongnu.org>; Mon, 21 Nov 2022 05:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0hkIqbBe/RseetpPmCKez9mYuN6qSjmPAo1amuK0T4=;
 b=XmerbbgW38NkeT+ukwUmh3gZcuUStYr8fN7BU11RrEPz4eYRf7Pwtd0y7hJDg6ePOg
 vlN7b2xRWAS89uRHo+aetK5qeCwYcg9foE6x/dvKrCPzfTvzM6eYdqz9HqsbwPYQ9RIX
 7IG0In2lFgXvLRoPOTv8BXzW3cI63cRKsuhGxSfBtTzx6UMxnYDbwI0ViBTRgFCitz+3
 hULOlHyeSHeOLkX5609GVpnTUrDscK5K2juSFSAzK+J+bMe3ckRdxhJV+cVDr3DOvtDC
 PfIf+3Mxb9AmD3NCoQeskxrrpM9f0aQy043vrzPH8Pr0/ONfwpIKyZd0GLfmZvObpHzn
 +GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0hkIqbBe/RseetpPmCKez9mYuN6qSjmPAo1amuK0T4=;
 b=dU4CEVP1j52gxStUIcxGOfX03yIx9MNwi8IJ3LIaZM/CImbdkpN0lqg3G7AtzmvjLX
 SrA6u9VJMf+tCts/IkrcoY4mh7QmSz6flMgH291nsgxrG+gZc87LqomjICO/66N3X4rV
 NhyE5aRrZRgzb9IKNtzV+X+eV81cHbYQR8BNRi5kBFhUjCpf6XSUNPB0//0D87VCREKq
 IBAsGQMSP1gu6rCf7egvLWVovlLKEObgCg0Is5yPSc3wKUQe9AyHLGogGkFVb6Ow8gT8
 t4JNnDUUT/qO9EQCGFEPrhjBtZTmP0LDNvAyZM4qP02nMT9nI5ZEWgkxCa9zyuWKeHmB
 QkjQ==
X-Gm-Message-State: ANoB5pl2W0VW5eMDJBzHDmTbouWd4LKd9HCK0X+dtMaoSvKwtRWk90gI
 yFElZufLCKs0KZv2V+e08zA=
X-Received: by 2002:ac2:4bc5:0:b0:4b4:c099:a994 with SMTP id
 o5-20020ac24bc5000000b004b4c099a994mr3906641lfq.193.1669038375193; 
 Mon, 21 Nov 2022 05:46:15 -0800 (PST)
Received: from NBK05906.kdtln.ru (79-126-20-183.dynamic.mts-nn.ru.
 [79.126.20.183]) by smtp.gmail.com with ESMTPSA id
 s29-20020a19771d000000b004afeacffb84sm2029501lfc.98.2022.11.21.05.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:46:14 -0800 (PST)
From: Timofey Kutergin <tkutergin@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Cc: tkutergin@gmail.com
Subject: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
Date: Mon, 21 Nov 2022 16:46:05 +0300
Message-Id: <20221121134605.2762683-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: myxOXMzK3upG

  cortex-a55 is one of newer armv8.2+ CPUs supporting native
  Privileged Access Never (PAN) feature. Using this CPU
  provides access to this feature without using fictitious "max"
  CPU.

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 69 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..8055c59afa 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -54,6 +54,7 @@ Supported guest CPU types:
 - ``cortex-a15`` (32-bit; the default)
 - ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
+- ``cortex-a55`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..fc0c9baba6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -201,6 +201,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3d74f134f5..cec64471b4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -792,6 +792,74 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a55";
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
+    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00011011;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x412FD050;          /* r2p0 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+
+    /* From B2.96 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.45 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.4 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+}
+
 static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1243,6 +1311,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-- 
2.25.1

