Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2615263ejo;
        Thu, 14 Dec 2023 13:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi/aKbBVpggEEj3ktujg2eNICYY/oHLYa7fAZC7DZfOHV60zFAUvFIZFz5F9HQF1Bvxj6u
X-Received: by 2002:a05:620a:2444:b0:77e:fbba:6455 with SMTP id h4-20020a05620a244400b0077efbba6455mr18057397qkn.52.1702588685464;
        Thu, 14 Dec 2023 13:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702588685; cv=none;
        d=google.com; s=arc-20160816;
        b=MkmL9exnYvA25H1iTy3VPubx9kPvQ67164MQRqqyEk+I8h98PyZlDmbQ3r805FVv64
         Fn/yh0814rzji17wQTe0VJYol3v7iHhRLZrm2d2or9xSypjcl0n3pNXJBcRpxrELIgb+
         ZnbmszPYOEU/ateP+/pAXU+50wJ6g2bBbbApuGaa6IGE3/+G135O65lUVBizUSyxlDZX
         YkOyu9MM22qJ9GcPdPZ/Fb2UstxrryEjoRy01gJdBi+Uo+Eo4qoIDvKtDWawPbeBVBT7
         MsebzON8rAZyZf7B1wrPpJMu8orCEnU7nJ+BLvLz2h93XiHOXPz7X2EPL2YDAGEDIgFs
         ag9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=la0vdrB96Ah8SznlfjlycsT+isEZNMJ3a4XqQ/DyKsZSF3xS4wuwB+o0sgDoL/tZoi
         c7nUQNyqUgXehe4YrlrPRghUzGl0JOc9U63lo2SGH5fzv/DN+qo1xfA3K09mTrWBenWL
         mRyZZ1AEJ4wnSHgJ2lOn+oEyFIRaTvaU8SZSWRM8dr2P1JkhJuHoqt17Jt4rqJPWsvFo
         ut6AD4H71PNUiUwea0zwiK5Rb3otJMa6n3F/Egj/lESjWQRdzy1ZqqUBEqA+d0sY9agV
         jGIFU9GBbc02/r87+SGThh1DmietT0tyI7xRsPK86NVD7pjXIR++9uE9++S3bva6kqtG
         MI0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YXL2EuDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj41-20020a05620a192900b0077d9abbe307si16059987qkb.236.2023.12.14.13.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 13:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YXL2EuDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDt3y-0002hP-7H; Thu, 14 Dec 2023 16:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3enB7ZQwKCHsmZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1rDt3g-0002Vf-T2
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 16:15:56 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3enB7ZQwKCHsmZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com>)
 id 1rDt3U-0005w3-WA
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 16:15:50 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dbcdf587bd6so1684923276.0
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 13:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702588538; x=1703193338; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
 b=YXL2EuDvmFs8LBtEC6p0nQ4QtLwo1m3jD5c8Ocrl4YgIS358e6ij7FFxp9rBN+q3uW
 4pT9q1qI7/r5WvxxBT7kUb0hQUjRKpSF5CrLq2cT8M8gUgPxhNjbtYd0ynUA2uq05k+P
 wxD6Ncy6DSd+7T550DU871mxCoo2ONIgRbk82PxrUZpbeueVCQUK79+x/Hkruk2Pm+zs
 kDvGM167OTh5mAWL6skGXk8+IrGH6DTCiWUxzT3U3FAGzIt3eNPG9seKhhFk3Wa7ACWF
 pOt2otbKqM68W62xrZIMrYB2YJ+jsoFqTeHTmoxYfd7IVLSvt/02eUmu9187l6MCHFHN
 TjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702588538; x=1703193338;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
 b=M/tBI9Xtf/pSuqFgLRJUghv1CIIltLZMATu/wJaYjkm0oARbwaG1Z2OpACEhdxDWtB
 p6OA6SlzLe14MMxV+YHW3JbJAFI7twO/LUn+FXNrgG9Gi6IRe8bVCz3GFJQNgl1i1AXv
 q5ytdyFgPSxa6UFgUqLR7LVyH3bUsmvgk+YXN9/JixTwKIhqw8uJd5gpoz+y79N31RHk
 4xYw6SlDywupISa0aSMTpVVbS9PAOzqB9TVh94i0lYZUYnFdbcP1MaFx5jb+91qoa4ZH
 tR7K/kVQUqj6g28FQ0S2y0nvSm0Oxi1yH0um8FF3Qq+sJygVaM+H3FBjgMV8SgyxY2fn
 SXjA==
X-Gm-Message-State: AOJu0YwCrhpv7mWKzhN+o6Gki+nf5vQvN3nCafoHYFB+tQkni4UcgZPD
 OzcepZ4Mt2cpWDnl1EPolqgSAFNUJ459G2TChmg=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:db14:0:b0:dbc:b125:2948 with SMTP
 id g20-20020a25db14000000b00dbcb1252948mr72440ybf.0.1702588538335; Thu, 14
 Dec 2023 13:15:38 -0800 (PST)
Date: Thu, 14 Dec 2023 21:15:21 +0000
In-Reply-To: <20231214211527.1946302-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231214211527.1946302-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231214211527.1946302-6-nabihestefan@google.com>
Subject: [PATCH v8 05/11] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3enB7ZQwKCHsmZahgdrsdeZmfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--nabihestefan.bounces.google.com;
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
X-TUID: q933HybWAQ9m

From: Hao Wu <wuhaotsh@google.com>

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
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
2.43.0.472.g3155946c3a-goog

