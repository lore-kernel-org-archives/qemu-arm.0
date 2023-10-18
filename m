Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp19265ejb;
        Wed, 18 Oct 2023 11:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIjKNx0wCUGN3cSLc5xkfn3vEsHMSAj2vf9FU9OG+c7yVlHPuysxvA27pOg/f3juJ3mkvj
X-Received: by 2002:a05:620a:783:b0:76f:839:6bdd with SMTP id 3-20020a05620a078300b0076f08396bddmr6289627qka.3.1697652798631;
        Wed, 18 Oct 2023 11:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652798; cv=none;
        d=google.com; s=arc-20160816;
        b=GqbsSJDG6Cw53/LQhamJKPuMLiJwj4P3p6LbrjLhwXAy5nTfXkQjqy3w2aw0+XMF8g
         VwnjygwSI6xKmpoWYnjJdOI4MwsTxpLC8OpNFaAPDMcMFHyEB0PHDlbmmm5QmzmTAKno
         SX7HF3dMW/On4FluFBJXrK6FdmS/bEbYDMHr8XlhKp4Kt0MVLXYVThK17sxhFFMvtR8t
         osEFLuCa7L5Ian2bhbtE8XlCZuwHUHG/aR+rFkqRpTM5eYFuGLFgbM2TFz7b7sg/Tj0Y
         OR/XZiGBFVX3G+Uk1R3HOfzx9yneQbKNM+zw6AH8+ky0n/ECoZBjHToW8PkJYAhgZeEl
         BuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=hcIuUUD09tLBD5KUm5GXmpN1hiQeirYkXCjJx+ceAageDGBbOmPaKXlLRaxalyjBYr
         9q0YIx6dE8Gr6iWbXDx4oY9DhJV8CI4Dno+6n5SE58NOoGoKyqrHB8ITHdYZHcrOx9wC
         zaauVW2Pvu4VinuDy67fSPiqSAhDj/IcKcd0SsD6CNBN8pX1on0T7dC4ARzKY14revNt
         GCoYxm+tKl4Dzefv4bGx6juAJ1qPgda1nVCpMO6JGLPDHzZEqvmJ0NtQp2tB3j+Z2GLf
         lY1sEi47VHc8mA5s7UbJIFGP8IuenT0w2JRQ3vI0K4Y2DmlRzrM7lj3nrZofiCfr6K6C
         jlFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=O3nNWyZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a29d000b007788bafa32dsi324230qkp.345.2023.10.18.11.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=O3nNWyZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB2k-00007U-3N; Wed, 18 Oct 2023 14:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NiAwZQwKCGcSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com>)
 id 1qtB2h-0008U8-95
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:15 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NiAwZQwKCGcSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com>)
 id 1qtB2d-0008IS-IH
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:15 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d8486b5e780so8819774276.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652790; x=1698257590; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=O3nNWyZA2gupYH2EhkSR1cZa9a3SCjhInbObe1fAYgwz0KO22u4LLte5wbFv23rzso
 RKwYRtkingNSONZrtLBvJgWCCzEVzaII34ESDqaUhFLDQHnESrKCXpV7A2tjhERxbKBK
 Rl35vPzY75CVQw8rx0aCvurwuGcE8fR7Uz0Zc73+UF5URjkIJcXtASJ+AxO/x0IuMdOh
 W7uEclSMT+63qATEUWH1EkfzyjlTbMJLjioRRAg8YnSiUcSJVB+RmPh/FNVJZiQ6imf9
 7gy9vCs19JVwWODfX157yzh+3ZEN3jrPUJptTxHttJ4jryBNpiWp33tsDzroC8kEoLaf
 N5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652790; x=1698257590;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=DV/RdktQbt0Ufv4xGFJnSpSkhwVAFJrlaAAq522RIcq0x82JLoVan5U1DtbTdi0Uu+
 G+aKqpaGR9hITpDAZWJj+4uCx7FDM7WyHOAUTBaUUq62c1qgNmJjQ1fUVS/+7pBvpWde
 JPsTJuxuo2BVdYo7qBSO81yKGrc0wU/H1t3JzSUI4sZR3oop/f8Ium/wck1GA17yroMu
 TaLf4TNZZv6xa+pj+h4iqh96s2S1V1UGZwy3xKZd13UjDupzNIkxt0dqr3YAGyg60fn7
 coUEqdcP7BIqvWkIuDRTG7JUVXdCPDqQCPBu8kPF7e8I7Ki3KBY6YeLZFG3tS3JJajcd
 JtmA==
X-Gm-Message-State: AOJu0YzH9/jZyVDU5RfzokrMm8bPhdPu7+zxoGnMT2jqaI7xWpIA/cqw
 kmhcUTX9XHt8UFoEnbSy24/4u1tcw7skvfEey8s=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a5b:191:0:b0:d89:4d2c:d846 with SMTP
 id r17-20020a5b0191000000b00d894d2cd846mr2758ybl.12.1697652790087; Wed, 18
 Oct 2023 11:13:10 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:12:53 +0000
In-Reply-To: <20231018181259.748819-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181259.748819-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181259.748819-6-nabihestefan@google.com>
Subject: [PATCH v4 05/11] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3NiAwZQwKCGcSFGNMJXYJKFSLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: sH63qovZtvjn

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

