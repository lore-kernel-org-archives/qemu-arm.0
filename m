Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp18217ejb;
        Wed, 18 Oct 2023 11:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJJ4mzgET85ks4E1BpiJN4qK18NIIi7aNVB0yGoECT2IMyhAP5Ae8xHUFlyTWpsWJEbluQ
X-Received: by 2002:a05:620a:40d6:b0:773:d4a1:c5c4 with SMTP id g22-20020a05620a40d600b00773d4a1c5c4mr7094617qko.54.1697652741445;
        Wed, 18 Oct 2023 11:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652741; cv=none;
        d=google.com; s=arc-20160816;
        b=ibT6EcCT+oMu3jIVOR9ACfTOgRjCbuW/J9hfZz1nh7qe2LA247kwxBXzZ5RfOjYMWU
         CMYQPktvpAJ6yvZGvU1QBFLyFTjTFEJFcxsaLdgXkOinv8SapZ3+eI6nHMXVZgnnjERI
         oGsKBhxtbLPlmC353N6AG+YWyLz8nMVXtr0nR4fBx2aauWidECcHku15z1JjkVcTv2Gh
         XU3o71+R11qONtU4cDId4Rr6ZB662RJe1UBfBOKF8u2VmOs2UeDphbbQClrVhRoGT2lY
         r80eIJqPF6tC3ozVtkBbiVCRSSgR+gDnwyI1P3Yt12g+tSljK+1Oqbcpn1WGS5QlvuGb
         axEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=iRH3BTSfH6tcW7SrhPV1z3LE6oy8vv5l5NyZ7VWJcT14idS9mGED1vKmOKg7kvk+z9
         RpVHmHIWtqIrID5YUqqaIfDbwyfUXnQtRvJPC2MbBzVfzVdQs/fAgBaI0r60uFGmbrFX
         FpNtuy5ciafYuGv0YCCTPPWcfGNfREWMPzX47XtpGN493BQ+9E51QDQWYVSuloq1YPaf
         6cAa6ffbOCbT2XqDnUpgWW7T1lAtAAz/debWEhJept9s0M7pRy6+E22DmEJ0SntDoErX
         kkLOBomOw1KYfPtTEB+yuRhXfwLMp4dv0CijZNbyJj1yyzXsLIEntr36jPU7rvD+umi/
         ZcPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3ZpRcOuh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05620a431600b007742b030641si319323qko.753.2023.10.18.11.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3ZpRcOuh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB1d-0006VX-Jy; Wed, 18 Oct 2023 14:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39B8wZQwKCCUOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1qtB1c-0006Ub-2m
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:08 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39B8wZQwKCCUOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1qtB1Z-0008AS-C4
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:07 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7ed6903a6so108430817b3.2
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652724; x=1698257524; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=3ZpRcOuheGoanxdObP1i3tT07UBSGZLdXdjZj8fji3b1yvqwt2+p5Hjw0z74Po4+kd
 VP5qt/k07FMqpXTsq0b4kQKxNIvRXk5lsMUABvuogoK1m5cftPC9b8jiTDUfugwPIxWE
 7kJRNiXfKM2nIf4BRZJqILf22xpdQPiUWHIfRth6YQjy6abbeSDP/PqiV0wOJdtCNSyX
 bq1nTvUTEEcsU0mEc/B6DuoIOK+ge0DRG/YPGJq0RQThN1M4e5SmX0mFz/Nsvwrz1isu
 DQTc379tMmS6k1TJeaR8yakTJzL7imxHQivqOU8mS2lhj5SiOkVWXd7wra3Gf1TdMt9F
 RSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652724; x=1698257524;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=tgNLcvNbdBZt2ebxaOU0B4y/0piTDnvarAuuIujZejkp7nt7ZIPbT0qnKEhTRwSud+
 HL8Zu5AyGvmuNf2T9kJuACqWQH2bEDjKLIan+zgxuoX8gWTaGZjpTBOxQTulP95bQEgo
 ySlyTAJwtEiZz35NOt4tJRKwxggWOyWY8DdbtD1oJE6wuhCn5MDNvzJbgHlGCPXRzCnW
 PmS7hFGCfyBs/MLOPhr4mfAk/lkTDhtELEOB/wWV8ywAXrBq1qFGEYfw81uxreFIBj7G
 VpDEGw/jD9btpIUUkjlUismNTTycoyRCjJaXp0A4WAi329sc6z4cMltR4ud+cK8q95wK
 ZYUA==
X-Gm-Message-State: AOJu0YxKO45tyPlh/8AMvJuMGtciZ6e64BjVxMfIUyKk0UCch1D26zNZ
 eyNTMpZTVj6qxJNRefsBV7bEu8Iu0uAKx3iVk+A=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a0d:ca46:0:b0:5a2:3de0:24a9 with SMTP
 id m67-20020a0dca46000000b005a23de024a9mr1190ywd.1.1697652724098; Wed, 18 Oct
 2023 11:12:04 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:11:46 +0000
In-Reply-To: <20231018181152.745496-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181152.745496-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181152.745496-6-nabihestefan@google.com>
Subject: [PATCH 05/11] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=39B8wZQwKCCUOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: lNpDfmvyQUvy

From: Hao Wu <wuhaotsh@google.com>

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c         | 36 ++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h |  2 ++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c9e87162cb..12e11250e1 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -91,6 +91,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_GMAC2_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_PSPI2_IRQ           = 28,
     NPCM7XX_PSPI1_IRQ           = 31,
@@ -234,6 +235,12 @@ static const hwaddr npcm7xx_pspi_addr[] = {
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
@@ -462,6 +469,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
+
     object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
                             TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
@@ -695,6 +706,29 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
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
@@ -765,8 +799,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index cec3792a2e..9e5cf639a2 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -30,6 +30,7 @@
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
+#include "hw/net/npcm_gmac.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -105,6 +106,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCMGMACState       gmac[2];
     NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
-- 
2.42.0.655.g421f12c284-goog

