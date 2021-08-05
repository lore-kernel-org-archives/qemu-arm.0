Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp518962lff;
        Thu, 5 Aug 2021 00:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDBESQDsxKHqE18L0wlxpSGtmDEh/yGl8YVljMxARpx0y3SY88/QIjr2Dynyp6P0ApKYbE
X-Received: by 2002:a05:6214:d4b:: with SMTP id 11mr3788187qvr.44.1628148759470;
        Thu, 05 Aug 2021 00:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628148759; cv=none;
        d=google.com; s=arc-20160816;
        b=VclTxK/eyJUmQdqtX9a21OP1+NLkeExfA4wpRQNo6RGDmzAVUOZh19gCjwPDhxThC2
         1tYt8s2pFGoSTjF7fyBJWRzSmw7MrIx/1X+qREOrHswo4bF8Gf06iZ9XmPe6ieqHsEQQ
         yS1Xge2pntp1wdy+2C3TEC/hHjRE0h6ULdWTbbIlRJ/ZHLAUunqwSu7tkM4VhDSK9abK
         lUdjrI0IJR13SWISlV0lyGZva391OZNXRH7aSpb82BasvHzSH/EeWWB56j9hL+OFUx7f
         LgvJ5ET+C9xcYXAxtiI9nMTbD+E/b7dOHB4uHNW0UIpM/JI9Cd8buymYGu8z/Td6ILjr
         hMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=8ijGhShC10+f6c4crAziXDfchc0RrTVpFDF1hoq5SXU=;
        b=btrzSgDthPWxxO5fQBrK/YPyaqtwK0VFhbk/6enTrRyI09Kt4U+bIozGL7jOF3TXp5
         Cf+kb8z57gQBfQ7Z7nBvV81GEsnl5BEQuaaIU/O4S3/7SJ4GCd1llEN7sAQ6g6u4nHfe
         hytyGs8nC2jXNM4+Sup03RrYRFQC2kH6VRkEwC9+FJ5lObx613fMObNbQQMukSACQC46
         tED1D3VoH7RZyLrBz1Z5IJ/VzPNdgXja0jRyJtrch+OtEYs9r6ry7bg1Oh/pq7Opr1Xz
         SNotMChFHHfmmxx9BsIMH+exIaSXvUrvkHHO8F63ZOZKpgKLb0BlewKvyQ52Z24AZ7G/
         ijoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si4482687qtm.375.2021.08.05.00.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 00:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBXrq-0006RA-M9
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 03:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqG-0002nd-Al; Thu, 05 Aug 2021 03:31:00 -0400
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49]:62941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqE-00047R-Fn; Thu, 05 Aug 2021 03:31:00 -0400
IronPort-SDR: liusKCeu5m/oS9P4NSVbyYdBVZKL0Eql8PnjxY2npM1o103DLp9YqjIDn3RYyT3aZvmXAojFLC
 WuSGFGK83I47NfvoAyyPbPWMqLvJa8SUB7rgABNoV53SjFG2UGSQlchHVUBU2tDZ3zeWPiXRXB
 NJB1+MjuWkbGGYQaxCjQm6F3xXqK4hUhP3dkbv4jsztag63RRxJ7qUVoFE5C5R+SvMiTnLyNKP
 i8gt3kl1RMd/ZZxxwlN2Gjzj4mzt0UA/SZ1wSTJD0RK0z7xOl1EOIqQSupqyArz4LrYzb/wDwr
 DkfHFfd3vUcpoAdKAdzODOBy
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="39160696"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="39160696"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Aug 2021 16:30:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 318EDE0AE4;
 Thu,  5 Aug 2021 16:30:52 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AFAD215CF0;
 Thu,  5 Aug 2021 16:30:51 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 2A6B0400C23BF;
 Thu,  5 Aug 2021 16:30:51 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Date: Thu,  5 Aug 2021 16:30:43 +0900
Message-Id: <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.49;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa3.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xhmYDvNPsJan

Add a definition for the Fujitsu A64FX processor.

The A64FX processor does not implement the AArch32 Execution state,
so there are no associated AArch32 Identification registers.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 target/arm/cpu64.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c690318a9b..612644941b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -847,10 +847,54 @@ static void aarch64_max_initfn(Object *obj)
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
+    cpu->ctr = 86668006;
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
+    /* TODO:  Add A64FX specific HPC extension registers */
+
+    aarch64_add_sve_properties(obj);
+    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
+                        cpu_max_set_sve_max_vq, NULL, NULL);
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

