Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4404243lfk;
        Mon, 13 Dec 2021 10:46:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynYtFRYfcSy1CMQAV/NQ0s0grOjYp7xwTXaJjypcDYdgdYqCn8cfK715lpxJFJXU0CLCNZ
X-Received: by 2002:a67:af0a:: with SMTP id v10mr396716vsl.35.1639421200840;
        Mon, 13 Dec 2021 10:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639421200; cv=none;
        d=google.com; s=arc-20160816;
        b=Qa/jU7YV8/Q+U/OKGejUFC11MN76OZedqJJwhgVqRicsjA/FLHtNNvKB4WKTUU71q/
         g93S6q84jVy+incK052s3GKx2ZYHHZ0vs33L17ZKUGcpDqW7j47EUdhU1/Kckp6EP3lK
         EqzPZ++P2fkpLpLZDvF8ItYh6PfxodwXxuC1SxUs053HW5rM7coAtpEn56X40rZbNdQl
         euLiMrtycqPleMsbI+0HBHvQfcmLtNEKWIeepPcV53vTBMu2p8lrAK2aiBjU0TWxIWWh
         9K64Ad95tbc0/9zcIIiw5jugmCFNg9BjCnWxaDZcWPsiPz1B2XeZRkzA3IgHJykqPDWD
         hGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ictXbh5mUpmLOfDQkMveVt/epIno+LDux93aq0yltOE=;
        b=KK5xLz62VesimBcCbvlGjClzS3esPI8yC+Kl3MsYaSJPt6F51+S8OSNaX39Jj6M8l9
         dU7/6FuqgDSTVvMhSY3LjO2GCzwzdsYnhIpxJ2DIniL+mCVcbN0OJ217GMLiuh3wSPKg
         Yfl5tMtBV2GVFakV30tR8CTaaJkjHiKl/UodbeNdI+/BoCdHGYMv8jBeqA4d1cLCdAD1
         nrTNOLZsYOwvFzgPnTPpTyrjNy9vTzEdBwbjf2hfo+mtl9ZN6EXn7RlirxRutMupl+ux
         ZiO37D5U3u+RiIOx971EBq/qlKbv2ittDh/02vphffkY1C9ECyNVNddMoJlcA2dDqEOF
         Qx0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Tca4WAPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si10033466vsj.268.2021.12.13.10.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 10:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Tca4WAPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwqLP-0006b1-6h
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 13:46:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mwq0O-0001rY-SW; Mon, 13 Dec 2021 13:24:56 -0500
Received: from [2607:f8b0:4864:20::12f] (port=41522
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mwq0N-0004y5-DY; Mon, 13 Dec 2021 13:24:56 -0500
Received: by mail-il1-x12f.google.com with SMTP id v13so2536572ilm.8;
 Mon, 13 Dec 2021 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ictXbh5mUpmLOfDQkMveVt/epIno+LDux93aq0yltOE=;
 b=Tca4WAPCaBZg0oeVyg6zo6DdhZhJtxxcUEhwHCNjybpHMy7mmlexboJN+TbwT9UAhk
 Ga5AoO1xt1jUO65PJkBoscr2szPLn4gqY/SYt/w300T/+AbrIWy8eefXcW7nOMSz+Py3
 1vQgezDjT9tGTumKLEjKZL1/Ot1ybAdU3lNY74PeFs6q7NpZeTapFYAw9pRHDBuAPanW
 JD3pqfcUCvGy3oND+NAA5G/sq3BKpfK70Sjk8zYubfxD3rFKFcfqnrosCZKdqpm7qC/5
 TJzO8EpmRJupoQYMD7WQ42xsdrVzbs3HnI9uCXy/crGPle0+MwOGVj0ZOXY6XhwJA6Yh
 48ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ictXbh5mUpmLOfDQkMveVt/epIno+LDux93aq0yltOE=;
 b=dhYi24Dg+Pyh4xjjw5kZQsuqL5erEhZ61D6HPHjKldEXY9fdRk53GwGRgZN/eQGcWC
 Wzy7+afuoZtjA9vmb4wGAgqFoZscYFqR/oI3B+0Megu1wGbvEr4ihiApvazH5mO6tvqN
 aFkdxW/UFp2JHHJuCWSVBlSLFXkujVWc1lrtKs9qbES/DdjDr8mk8ueGN0GknecuxFLP
 YRkqyuND4GgSYNEidYeinS6DK5yKUqXgYW2Ioqa647t2T9+xpDbis2/qU47IdeCs/HIR
 CgU1ZHIMaOFk5WW47lCXetqjeIv0i1SAMxd0pvXfQ5SBs72N28g1NzoU/xZw9fEJDjmN
 Csrg==
X-Gm-Message-State: AOAM532EzIoLpyQ15bwtbj+GwtUftzeA8hGxqh6r2Qf3o+NHjkOHj0DN
 M4jAC/fdeer1FbR3ZwjK1iYUXwfakwEkNQ==
X-Received: by 2002:a05:6e02:1705:: with SMTP id
 u5mr206253ill.97.1639419893366; 
 Mon, 13 Dec 2021 10:24:53 -0800 (PST)
Received: from LAPTOP-6MEG09M4.localdomain (s-30-204.flex.volo.net.
 [76.191.30.204]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-2faa6b4dac9sm429173.239.2021.12.13.10.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:24:53 -0800 (PST)
From: Byron Lathi <bslathi19@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Target/arm: Implement Cortex-A5
Date: Mon, 13 Dec 2021 12:24:49 -0600
Message-Id: <20211213182449.7068-1-bslathi19@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=bslathi19@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Dec 2021 13:45:16 -0500
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Byron Lathi <bslathi19@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ew4Hc59HkX3W

Add support for the Cortex-A5. These changes are based off of the A7 and
A9 init functions, using the appropriate values from the technical
reference manual for the A5.

Signed-off-by: Byron Lathi <bslathi19@gmail.com>
---
 target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 13d0e9b195..38f0fc3977 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -304,6 +304,42 @@ static void cortex_a8_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
+static void cortex_a5_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a5";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x410fc0f1;
+    cpu->reset_fpsid = 0x41023051;
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x11000011;
+    cpu->ctr = 0x83338003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001231;
+    cpu->isar.id_pfr1 = 0x00000011;
+    cpu->isar.id_dfr0 = 0x02010444;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00100103;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01230000;
+    cpu->isar.id_mmfr3 = 0x00102211;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.dbgdidr = 0x1203f001;
+    cpu->clidr = 0x09200003;
+    cpu->ccsidr[0] = 0x701fe00a;
+    cpu->ccsidr[1] = 0x203fe00a;
+}
+
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
     /*
      * power_control should be set to maximum latency. Again,
@@ -1019,6 +1055,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortext-a5",  .initfn = cortex_a5_initfn },
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-- 
2.20.1

