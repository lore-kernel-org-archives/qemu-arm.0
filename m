Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1165835ejk;
        Tue, 30 Jan 2024 16:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDftyDQGnWsToOD6XI6xEcS8rKAAU/SORMFdyCE2h7ja81HIac+NT9v3CKYDChE8jz1KJ2
X-Received: by 2002:a05:620a:29ca:b0:784:f2e6:e110 with SMTP id s10-20020a05620a29ca00b00784f2e6e110mr15858qkp.74.1706660935607;
        Tue, 30 Jan 2024 16:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706660935; cv=none;
        d=google.com; s=arc-20160816;
        b=EelM3VmAC+zcJiBaGGpXeb/RiSTWL9eW6wObpt52w7Av6vjjwY2m2ATt872JOBA76s
         IsuoIPVYsgyi/u2WXyXgSTQDN3qFn2dwD6IlQgoABLK9XIXkSlmEQ4teQrfpAe8sHVnq
         EHH9KdOgJSyXowiQ/L0doDSCMLzPxvebkPuX2vPIOnI8e1HE36kgFWC5SHju2b6G6IqA
         7RyNzLWjYvs93jc4O6qKB40acshYhsAqai55yb6OkwpiRmuMB4oMNIYlaJL0xy6EIzIo
         6y8o9iNF2ma7LPYXrD/bbPNFcBWxrnsENG2EcxogQejTgoQ4d3fPQ0T/nInxQ9c/uRyO
         zVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=hor9oL+HJs5wKIopkHJW0287wqKAqbZVillI1AljpNXNJTwDyHBhhIR7L5TnM8OEMu
         gJldW3hXmcIif7OIiD190KzfbOlER+Eoj+eB40BxCZLe0rX4kp7sAw279Xpr3ISTGMgH
         J4NLOdBFw1NP2AYChbrnE3BzhalcuIv0y7gI3ENSoobLFekpBqBOqSRiKapR80Xb1j7g
         60GSuiTbLphrPnJpeobuSbNmzkeQ/hFqTFU7P0BALwq3tEQtqXcOfjABPfiTPu417/E0
         QiReT0v2UcemJDWrYDDkZNgbmeAgTCJwz9+aR9hwxZ6QjuWgkQUukRIqV559Qe33MmNL
         tiWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="04/xz9F9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y29-20020a05620a0e1d00b007838d947f3csi10940253qkm.219.2024.01.30.16.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 16:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="04/xz9F9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUySb-00075n-5K; Tue, 30 Jan 2024 19:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FpS5ZQwKCFkE12985JK561E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--nabihestefan.bounces.google.com>)
 id 1rUySY-00073y-JY
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:28:10 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FpS5ZQwKCFkE12985JK561E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--nabihestefan.bounces.google.com>)
 id 1rUySV-0004J3-Uz
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:28:10 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dc6b2681571so815312276.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 16:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706660886; x=1707265686; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
 b=04/xz9F9fSNYoqMG+Jxbuis72cPGVJvkgQhDjAVaEP2RQ5OpFbKkkCYnK1Rx+lrgpK
 8qpt6y62qobyCTIAR2OTNMv1857b/o4/w6TT48oo60zlSGKuM8XizXQ8oWNffVCZjgSd
 9qol1pVthZoj2ICyMZJpgZW0w0uCq36vQNnK2TIFq/LvSRsIn1EBrMVa6Ml48uD7lFAz
 s6z3ZbkCYJ1GELVMLpwEqDmsCMSFmKgbxPnO+EFdGDTMgevKGlRQvVDZ7Iav0f6JDuVV
 ErTmdQIV7ZlFz0yZQBnvb/aJ7chL125xaW/kyicz4oAct3KlmwO0WZCS1IPdSE31m4k/
 1CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706660886; x=1707265686;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
 b=kavMAvlDcXpuDQn19vF5bET7quQlU0e6IpAnzRlQ+j4TqyPP3dDq9PSkEUR0Fbf4pJ
 LXd+UBTLq98wdNe56JDco8MWyeOB6qNvQ8Gz4gm2FhyjSURNaInWaKP7OPOhry8mwQxq
 nnfa1UtakJ4aCnnvdGGT1tL0jOf+pseD43hpakbRAt/m1oiq/6uY89qTun+U01G1J+dX
 B8yoAM0Ggk1HE+pz4dUQfxRtC37AzJud0iu0+EtUwH2cdRbuSHTo0qaqzd24uZOUOgeb
 eeEP0dXwwSuUoACZu9m2DTN94ryI9XQH7dy8Mrf1NZivDVIiUJ3iVmIqBEue3KPRisDK
 /o4Q==
X-Gm-Message-State: AOJu0YyOCozxAyKvky7KYUAe0vGTDOUZmrj4bJMcA+7kJgsTusdvoCpA
 FTC+cCMUu+97+pdMmYJ7NkXyPF+Kfg2xXA4rJ7exOsPq7ZE9+ArxKfKnq083fT8LzOqNhrUyGyE
 JZJksGb6x/t6pQnZ57jo2qpXYHA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1188:b0:dbe:d0a9:2be8 with
 SMTP id m8-20020a056902118800b00dbed0a92be8mr4932ybu.0.1706660886258; Tue, 30
 Jan 2024 16:28:06 -0800 (PST)
Date: Wed, 31 Jan 2024 00:27:55 +0000
In-Reply-To: <20240131002800.989285-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240131002800.989285-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240131002800.989285-3-nabihestefan@google.com>
Subject: [PATCH v16 2/6] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3FpS5ZQwKCFkE12985JK561E7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: CgWez97XuuLx

From: Hao Wu <wuhaotsh@google.com>

Change-Id: Id8a3461fb5042adc4c3fd6f4fbd1ca0d33e22565
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/arm/npcm7xx.c         | 37 +++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h |  2 ++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index e3243a520d..3b29206265 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -84,8 +84,10 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_GMAC2_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_PSPI2_IRQ           = 28,
     NPCM7XX_PSPI1_IRQ           = 31,
@@ -229,6 +231,12 @@ static const hwaddr npcm7xx_pspi_addr[] = {
     0xf0201000,
 };
 
+/* Register base address for each GMAC Module */
+static const hwaddr npcm7xx_gmac_addr[] = {
+    0xf0802000,
+    0xf0804000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -456,6 +464,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
+    
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
 
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
@@ -688,6 +700,29 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, 1, npcm7xx_irq(s, rx_irq));
     }
 
+    /*
+     * GMAC Modules. Cannot fail.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_gmac_addr) != ARRAY_SIZE(s->gmac));
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->gmac) != 2);
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->gmac[i]);
+
+        /*
+         * The device exists regardless of whether it's connected to a QEMU
+         * netdev backend. So always instantiate it even if there is no
+         * backend.
+         */
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_gmac_addr[i]);
+        int irq = i == 0 ? NPCM7XX_GMAC1_IRQ : NPCM7XX_GMAC2_IRQ;
+        /*
+         * N.B. The values for the second argument sysbus_connect_irq are
+         * chosen to match the registration order in npcm7xx_emc_realize.
+         */
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -750,8 +785,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 72c7722096..4e0d210188 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -29,6 +29,7 @@
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
+#include "hw/net/npcm_gmac.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCMGMACState       gmac[2];
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.43.0.429.g432eaa2c6b-goog

