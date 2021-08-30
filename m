Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3873356lfb;
        Mon, 30 Aug 2021 01:29:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnIg7Dynu4nPh0wAV6bneaEMvwCTBrGlbSyP7jTuMZ53qs3gvrlXUSiozlEQaaZfRdxwif
X-Received: by 2002:a25:5406:: with SMTP id i6mr21049649ybb.4.1630312191668;
        Mon, 30 Aug 2021 01:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312191; cv=none;
        d=google.com; s=arc-20160816;
        b=WB4YjbGiFgVceoS/NlKxSSv8jv82L77b2oMbKR11T8yxEOI44dYT2+cPq0TKXh+tzI
         WoMZApr1jNnXRNNePjO47+yxKNwYj2OMv4zpMcq7FUTnPd8gsYKKLtrIS0kbJdnQCLdz
         nN7kXI0gSIpImf9xjkSq69JdHam2ZcvkH7uO1msMu4ro5KT5ATqolDPRw7DxNBxzmT6r
         vxRrzKFouZKWVxOWigj1aS3hmGnV6B9vH1DdmyTyjrbpJi8sbdJS2PsHjTMpq3KScwKO
         7Ooyt1TfaiUmrWJahEtRmQaadN57ApNW8uFwPwuYmi8cViAHxQKJ0vtvmUDLgfBWIhOe
         hDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=KDucolEgvjzSXGmu7rOiz9zx8yFUvzwoblv7UErLezI=;
        b=zBafgX9toX4Ml5cnhNKts1Rf0rV4IFZgsyCbsafggDPRhDVkWABmDmE4FLfr7q7MLc
         YTev5J6T9rd62oaoBByWUo8ieboio7fEcOUKEMDwpQXOwYEBL8M7fJHXWooMBCDO71nS
         b5sWQmt3QheyMo20KTVgaK4vI9wD9qbUY52XqWsq5r2fwomsLJyZMfWw8Lv72x3WxHNt
         bcCV8qnr98E96zOoqEbMi0aDKKtHKQZjTnTSYCLphFBlvNqhZ06IxOlVc4aqGypeB9Wv
         LAEVPbNxQfefOKfJ4ZBSSmPhMknxP2lpcb8OZVA0F6EjPD3S1DDH7JDIfmlldQs/EHPs
         I/4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si12958322ybc.107.2021.08.30.01.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKcfv-0007zN-0U
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcee-0005iy-Uo; Mon, 30 Aug 2021 04:28:32 -0400
Received: from esa11.hc1455-7.c3s2.iphmx.com ([207.54.90.137]:19038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKced-0000sQ-94; Mon, 30 Aug 2021 04:28:32 -0400
IronPort-SDR: KAOLC2sIx6gclmkwRmNh+JZOYjtostHh4lOLio+N8cevDjDIxFjXezLYXrrFtRia1MLAFQr7yT
 86DjG4SpZeNqMAf6EuM2c0Ibl5mC6KzWM/6IM9prgCTF3lTNfD8Qr+s6jjbGhK67YtrlhaHiq7
 LfD+MsAXeY5IkYNoGJuY50AGfJv0hVLkote4aptdA8sIb3vLJ6Q1bEq1WDUDlrN1K3fvOJwJk+
 Lr5kLkKR2oaC2pNbcr+tgMvmzFBC9H8plh4tO/G+QeVAoku6pL7cVOFWvR7Ki2+1CY9PAZ2HCY
 7Ycgo8ma9vT+7z7FVQgtH7LS
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="21965020"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="21965020"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Aug 2021 17:28:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89F211013A9;
 Mon, 30 Aug 2021 17:28:26 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C215FC9CE0;
 Mon, 30 Aug 2021 17:28:25 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id A15E24006D7DE;
 Mon, 30 Aug 2021 17:28:25 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
Date: Mon, 30 Aug 2021 17:28:18 +0900
Message-Id: <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=207.54.90.137;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa11.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nIov8RS5PuEK

Add a definition for the Fujitsu A64FX processor.

The A64FX processor does not implement the AArch32 Execution state,
so there are no associated AArch32 Identification registers.

For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2f0cbddab5..15245a60a8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -841,10 +841,58 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL);
 }
 
+static void aarch64_a64fx_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,a64fx";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x461f0010;
+    cpu->revidr = 0x00000000;
+    cpu->ctr = 0x86668006;
+    cpu->reset_sctlr = 0x30000180;
+    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
+    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
+    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
+    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    cpu->id_aa64afr0 = 0x0000000000000000;
+    cpu->id_aa64afr1 = 0x0000000000000000;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
+    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
+    cpu->isar.id_aa64isar0 = 0x0000000010211120;
+    cpu->isar.id_aa64isar1 = 0x0000000000010001;
+    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
+    cpu->clidr = 0x0000000080000023;
+    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    cpu->dcz_blocksize = 6; /* 256 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    aarch64_add_sve_properties(obj);
+    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
+    set_bit(0, cpu->sve_vq_supported); /* 128bit */
+    set_bit(1, cpu->sve_vq_supported); /* 256bit */
+    set_bit(3, cpu->sve_vq_supported); /* 512bit */
+
+    /* TODO:  Add A64FX specific HPC extension registers */
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 };
 
-- 
2.27.0

