Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1779824eji;
        Tue, 19 Dec 2023 13:35:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH29JvHtciFIpFYrNFvosjSesHWLpVsctsCp1NNSK0Y7Y/955DrpuaSMVRdu6oivShvT7m1
X-Received: by 2002:a05:6830:208f:b0:6db:a329:7b34 with SMTP id y15-20020a056830208f00b006dba3297b34mr919061otq.22.1703021704958;
        Tue, 19 Dec 2023 13:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703021704; cv=none;
        d=google.com; s=arc-20160816;
        b=I1J+e0HpWhs3NPeLQbkYH2dDQYwNqsU06TKDkpKlZ1+ghHoA09XBZujVoilHJJbueY
         sNhisUxM6pZsRSsr8CseOX5gQPOhp2czLFTSEebRQ+xZuWhc08wZ8RxRy4LleX0lmkjh
         +WVtYytjp1eSZPo0cZhG0d8OFLgXEv0eZqqD1636ybGm1b/BGdkuXD3oSM5afRdmoMOr
         bkAfmbVE18Q4wHkEXgA4cDo/zQsymYdx7pzs1mcpAopRDtVQR2j0CJKINIMAKOK/rGug
         tWfxZWSp8ARzdlY10DK06wy3RV6cpK0mZ9sak0VDFwfFcDiaK4mTynwB7o2tINpQvokK
         54bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=pN3G294JUiZlIjaO5JGOFf/iqtnjhi3qBdQLQ8EPZ4Szm5WGJ9VaJJEhtiVkRnt/11
         vTR90Lv054Q5KHXisnDesPly76HVUWZMaItNN/AqSQtl7/9Uqb7R/YMfamEHv2ZXmmik
         xr+vF1izfojRwZlHJLYb+Xm2wVJNIG+LBGxyLQFSGzVJSd+C9zBGrjtkNpjtYNRbWi3Q
         2ITEcSsTgFTP8H63tYj3tgOzXn+vmeca2lXwlcTeo6itHN3MB0QOVIvkk27MJuoczArz
         fT05F6CU6fkFDWByIk8suMGYCLvZZj1K0IUCcLjL+1rxTc5k/Cn4IOAXkN0lS1w99JyI
         fPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PLY6+bM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac85984000000b00425a9eedd9dsi26387515qte.88.2023.12.19.13.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 13:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PLY6+bM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFhip-0007Zg-3K; Tue, 19 Dec 2023 16:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HwyCZQwKCHIdQRYXUijUVQdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--nabihestefan.bounces.google.com>)
 id 1rFhiP-0007To-Mv
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:26 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HwyCZQwKCHIdQRYXUijUVQdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--nabihestefan.bounces.google.com>)
 id 1rFhiK-0003ur-Rw
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:23 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5cb6271b225so65269937b3.1
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 13:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703021599; x=1703626399; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
 b=PLY6+bM8y19rSy7h+GTL1S2wtoxnk6mRizFW6fTeB3tPPZjGfpa+VQC06H8ftcqQ/u
 ZTXT9ksU+Oz9tFIng+qAyVVW0tmRIqSF5IW9A+OwsaTg7UFGbZooqgE5xAjbkxjKQzlc
 ghkpEUv0QibEpUspmH73EEPpCoN/dwotO9TxWxPOO/H36ublX07/24hRsPJUBTYF3VwF
 dsIg6jP5sPc14e9hwiQ2wIb9b/EK1HWlNE4jlyqmuX04X+JV3tJ7gOhdrqN3PgAXtt84
 H+OFn7hnCs0I6tWezrL95jaUH+M2mZ3SvMljAUliU7nuwRAckSwNxXSMYXR7XP9CMvoP
 f+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703021599; x=1703626399;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKLZ54AbI88r4e47lvaGme8APaDzv2gELULCjtrwYoA=;
 b=J7YQPomVOWoWdZ2wy2lm+A7tgKpi3hHXxulhbu0rJHTo64ItuyHXqG5jd8CMHqYpbV
 zKoEq4aTj1a15eoGWACq8Kru4wb4m2/hphgHaof2YSZYVhFFBvUxawK2n47tMH+j/rso
 yG8WzoCRNy2NXTd2uX7+XmyZORa9O/NbzXQlM/ZyDrrX4+t2d3vntnGp+LAuOofk0YlN
 GhPMeb73P/UB2CUPVaydqeJ4s4F3omOP8LWZY1dyS/ROiXHojyEE9ZFYu6FwSTeaTase
 c34fZozRx4AuMu7htWkTfY/s8EY63eF5kxkBZMz2aOSAXwWI3Ka78XOCNWgquukEBIYn
 pAlg==
X-Gm-Message-State: AOJu0YwEdjWrtOlUcKe5h7/iTb1LJA61dPFSB04hEO/hADw4yENBLGdX
 4fgb+3cFco9lweO34BLKa9t465qrdXhfyitggiM=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:98a:b0:5e4:35c2:fd37 with
 SMTP id ce10-20020a05690c098a00b005e435c2fd37mr3297736ywb.6.1703021599246;
 Tue, 19 Dec 2023 13:33:19 -0800 (PST)
Date: Tue, 19 Dec 2023 21:32:50 +0000
In-Reply-To: <20231219213255.604535-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231219213255.604535-6-nabihestefan@google.com>
Subject: [PATCH v9 05/10] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3HwyCZQwKCHIdQRYXUijUVQdWeeWbU.SecgUck-QhcdedWdk.ehW@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: pjTSyedY5iWF

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

