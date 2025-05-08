Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp731606njb;
        Thu, 8 May 2025 15:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeac8YLPjcACT1dTSJAvEA1IwGoCYwhWjV83nl9x/6/icx7fe1G85TmkgFtTurXGFTjfwyBvRxs8Mddw==@linaro.org
X-Google-Smtp-Source: AGHT+IHHexNpRBRm7LAs0Qal0upz6h5fxz8LGlfdoWiYbzo+B7AWaTQ/jtgGxzhJaVngFaYjv1he
X-Received: by 2002:a05:622a:2cf:b0:48a:c411:e864 with SMTP id d75a77b69052e-4945271d99bmr15200671cf.7.1746742100889;
        Thu, 08 May 2025 15:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746742100; cv=none;
        d=google.com; s=arc-20240605;
        b=FxpOVJRdla9abZ3z77iIPJcVZXPBJZwTfU0cA8NMaOhIKyO8zj5Sd1X3Em36qvrnu7
         nbZ+Us7WY18SOpAjB19tBhSUkWruGH/vyeHXYgijwKAoRYRVcDQSzOjErYLvHe6aKCmT
         /07NcxiNn8azt/Euxs/Ok1q/gwMtLj7zdN9mXsB8qTKoNoHJbasCR26GTzp+X6lQXdNt
         349hCwO70O1zAA3eiKNVHvCRIPl333ZbwPkff2azkl5MNg+67OI4YHn1zaWxHmp3Px7m
         xK+Yhu9ObS4tZSSdLYA91T7kQH3Scze8JbKPCJfNkAZb5vx/ahDh4TWBPONpfVmFFHM7
         R+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=y8fZ2oazQrEG5s1AS0nB/dvBEbv4XtnmcMMlYNe4V5k=;
        fh=hfmjFFdRcnFKLJ2EKcv4i4Gy3gwoaULFwvUxvnL1qw0=;
        b=bd/dINa+aDqSAIhIElQGRipmZDY6Vld9UfOqo38kWlzzWQT2c6W1tuBJw9eVHveCSJ
         UGSkVNcWTsasY4nXHW+J9FLIL9IrAsBDkVzQ2Ad0JerJDUpj6KanBUMX2z0jq5j8CVjB
         2BryuFl6R59Iity+48OU/Q92GB1KDNW5wsXJEvfLVtx2BFpWTYJxBqtPzFsyy+1ZON3Q
         cokI0rNFfYDBhK3rmBfgAjY1WX4o2L/bNSwoWkQAwYMene77n+f1O0xdnImPiBCJ3Af9
         8dv1gTUEqPgK4iZHEYsX5ZcB+6psA1dntFryypckWu+VmH0U09Ad+L7jEqK2Yq0/1aIS
         yUuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eiy50BvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494524598fdsi6337641cf.72.2025.05.08.15.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 15:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eiy50BvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD9Ot-0007QR-1S; Thu, 08 May 2025 18:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HCsdaAwKCC8YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1uD9Or-0007Li-OZ
 for qemu-arm@nongnu.org; Thu, 08 May 2025 18:07:29 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HCsdaAwKCC8YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1uD9Op-0001gp-Sk
 for qemu-arm@nongnu.org; Thu, 08 May 2025 18:07:29 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so1390365a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746742044; x=1747346844; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=y8fZ2oazQrEG5s1AS0nB/dvBEbv4XtnmcMMlYNe4V5k=;
 b=eiy50BvVW45y/oE5CNt2L3nlf0/qzCPIkyGidnIdk2dku1CI/uXnI39y1PDYYPewuX
 GsEqUCWdCKZrPW9d37jVFWPWSKRX4e04iikA4IuAiJNZYsMwOd5NmRnxrHTl6DpoHHKD
 eWe2ucHXpIh7yvBkyw0N/fzCwRSsprkrlO4bjno9xbhc3y3VHewq/C4mq6FWlmnlDd1m
 lyvJnTzWedn21CNsmKjITadFDd1WheFkr0mhfNAiUF2DZWBQcGnW6M0c9j/PrGa/BPwP
 bYucxevk5okdPCfXZNMGoGtLSHPir5afAvbGB5pqnC9VMm1dNzIDjOnYNdzCCw21zEhY
 oodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746742044; x=1747346844;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8fZ2oazQrEG5s1AS0nB/dvBEbv4XtnmcMMlYNe4V5k=;
 b=dRRVHnWub+7vnwlCyWN516tbVQAyA0Q40Y/9wwywxN8rK45syrlIDp21T6krQ1agxZ
 QFFe34UHrR1BY/3oEvW58Uwhccs49CM2xE+8leNtpBxqawWOyiIPX2j0kMB3OYWMWkCf
 iVA0aSuHzkwR4YD2c/cxhTz52aPif0+rgWg0KQ/KfQMSY4HLFIUzZ/C3VgLRCIBKnsGw
 3qgU/7qsirmnw8M2P4sWpFP5V1n+RVS2Xy3ntvHuUBtbiHnPbuv1f46FUSgX36ijXT5C
 3Yb1g0/VLFYJwIQ8RVLe/N+6Zo6Oct7Na7bkypdb008MEz+f3265vMr2BGuTsZrvDAcX
 Q3xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYcmq15PLHlSjNnShqYx1Do7kFvvf6K26MTpSlvhAtURRLEa4AVxaYSQBwtbg3Zglx+NH05nHYoA==@nongnu.org
X-Gm-Message-State: AOJu0YxtbtHYUtGWizsjHdnQM1NkZvUoEXj68A37bDLtZwAcFe1ULlZ9
 klj2iaa/6CFKpbQbOuEx9vu0sTjCEusdPkswwpnLqBdcSsrJp2J9u2UjQqHN51CKe4TAN9iiWGF
 IYH19YjgJ23zmAGp3TpjCdsVsuw==
X-Received: from pgut4.prod.google.com ([2002:a65:6084:0:b0:b1f:f3f1:9e07])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d81:b0:1f5:7df9:f13c with SMTP id
 adf61e73a8af0-215abc734c6mr1249250637.41.1746742044337; 
 Thu, 08 May 2025 15:07:24 -0700 (PDT)
Date: Thu,  8 May 2025 22:07:17 +0000
In-Reply-To: <20250508220718.735415-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20250508220718.735415-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508220718.735415-2-nabihestefan@google.com>
Subject: [PATCH 1/2] hw/arm: Add GMAC devices to NPCM8XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: qemu-devel@nongnu.org
Cc: kfting@nuvoton.com, wuhaotsh@google.com, peter.maydell@linaro.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3HCsdaAwKCC8YLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.499,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ce+s+YWGm5h5

From: Hao Wu <wuhaotsh@google.com>

The GMAC was originally created for the 8xx machine. During upstreaming
both the GMAC and the 8XX we removed it so they would not depend on each
other for the process, that connection should be added back in.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/npcm8xx.c         | 54 ++++++++++++++++++++++++++++++++++++----
 include/hw/arm/npcm8xx.h |  5 +++-
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
index d7ee306de7..d14bf55cd7 100644
--- a/hw/arm/npcm8xx.c
+++ b/hw/arm/npcm8xx.c
@@ -67,6 +67,9 @@
 /* SDHCI Modules */
 #define NPCM8XX_MMC_BA          0xf0842000
 
+/* PCS Module */
+#define NPCM8XX_PCS_BA          0xf0780000
+
 /* PSPI Modules */
 #define NPCM8XX_PSPI_BA         0xf0201000
 
@@ -85,6 +88,10 @@ enum NPCM8xxInterrupt {
     NPCM8XX_ADC_IRQ             = 0,
     NPCM8XX_PECI_IRQ            = 6,
     NPCM8XX_KCS_HIB_IRQ         = 9,
+    NPCM8XX_GMAC1_IRQ           = 14,
+    NPCM8XX_GMAC2_IRQ,
+    NPCM8XX_GMAC3_IRQ,
+    NPCM8XX_GMAC4_IRQ,
     NPCM8XX_MMC_IRQ             = 26,
     NPCM8XX_PSPI_IRQ            = 28,
     NPCM8XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
@@ -260,6 +267,14 @@ static const hwaddr npcm8xx_smbus_addr[] = {
     0xfff0a000,
 };
 
+/* Register base address for each GMAC Module */
+static const hwaddr npcm8xx_gmac_addr[] = {
+    0xf0802000,
+    0xf0804000,
+    0xf0806000,
+    0xf0808000,
+};
+
 /* Register base address for each USB host EHCI registers */
 static const hwaddr npcm8xx_ehci_addr[] = {
     0xf0828100,
@@ -444,6 +459,11 @@ static void npcm8xx_init(Object *obj)
         object_initialize_child(obj, "mft[*]", &s->mft[i], TYPE_NPCM7XX_MFT);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
+    object_initialize_child(obj, "pcs", &s->pcs, TYPE_NPCM_PCS);
+
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
     object_initialize_child(obj, "pspi", &s->pspi, TYPE_NPCM_PSPI);
 }
@@ -668,6 +688,35 @@ static void npcm8xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, 0, npcm8xx_irq(s, NPCM8XX_MFT0_IRQ + i));
     }
 
+    /*
+     * GMAC Modules. Cannot fail.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm8xx_gmac_addr) != ARRAY_SIZE(s->gmac));
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->gmac[i]);
+
+        /* This is used to make sure that the NIC can create the device */
+        qemu_configure_nic_device(DEVICE(sbd), false, NULL);
+
+        /*
+         * The device exists regardless of whether it's connected to a QEMU
+         * netdev backend. So always instantiate it even if there is no
+         * backend.
+         */
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm8xx_gmac_addr[i]);
+        /*
+         * N.B. The values for the second argument sysbus_connect_irq are
+         * chosen to match the registration order in npcm7xx_emc_realize.
+         */
+        sysbus_connect_irq(sbd, 0, npcm8xx_irq(s, NPCM8XX_GMAC1_IRQ + i));
+    }
+    /*
+     * GMAC Physical Coding Sublayer(PCS) Module. Cannot fail.
+     */
+    sysbus_realize(SYS_BUS_DEVICE(&s->pcs), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pcs), 0, NPCM8XX_PCS_BA);
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -741,12 +790,7 @@ static void npcm8xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm8xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm8xx.dap",          0xf0500000, 960 * KiB);
     create_unimplemented_device("npcm8xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm8xx.pcs",          0xf0780000, 256 * KiB);
     create_unimplemented_device("npcm8xx.tsgen",        0xf07fc000,   8 * KiB);
-    create_unimplemented_device("npcm8xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm8xx.gmac2",        0xf0804000,   8 * KiB);
-    create_unimplemented_device("npcm8xx.gmac3",        0xf0806000,   8 * KiB);
-    create_unimplemented_device("npcm8xx.gmac4",        0xf0808000,   8 * KiB);
     create_unimplemented_device("npcm8xx.copctl",       0xf080c000,   4 * KiB);
     create_unimplemented_device("npcm8xx.tipctl",       0xf080d000,   4 * KiB);
     create_unimplemented_device("npcm8xx.rst",          0xf080e000,   4 * KiB);
diff --git a/include/hw/arm/npcm8xx.h b/include/hw/arm/npcm8xx.h
index 3436abff99..a8377db490 100644
--- a/include/hw/arm/npcm8xx.h
+++ b/include/hw/arm/npcm8xx.h
@@ -28,7 +28,8 @@
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
-#include "hw/net/npcm7xx_emc.h"
+#include "hw/net/npcm_gmac.h"
+#include "hw/net/npcm_pcs.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/sd/npcm7xx_sdhci.h"
 #include "hw/timer/npcm7xx_timer.h"
@@ -99,6 +100,8 @@ struct NPCM8xxState {
     EHCISysBusState     ehci[2];
     OHCISysBusState     ohci[2];
     NPCM7xxFIUState     fiu[3];
+    NPCMGMACState       gmac[4];
+    NPCMPCSState        pcs;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi;
 };
-- 
2.49.0.1015.ga840276032-goog

