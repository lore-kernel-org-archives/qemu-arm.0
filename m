Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp362284ejo;
        Mon, 11 Dec 2023 09:30:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYomaiKADVzMtxWUc2ZvfvOvPWDM5Y9g/CxZjm9Px694Rv3gn3W0ar1Yc3rmgsMlS1tBXZ
X-Received: by 2002:a67:c090:0:b0:464:9b1f:c718 with SMTP id x16-20020a67c090000000b004649b1fc718mr1380268vsi.33.1702315834237;
        Mon, 11 Dec 2023 09:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702315834; cv=none;
        d=google.com; s=arc-20160816;
        b=OtQOsyfDp24Q3502sjX4dLo7S8t/hpX/TgJtF1detAoyEmjNPPrS1UB1sw73VExjWe
         HRCGwTctdt2lQxl992f1QYqu1PjCOlyb4IHtAbrtNndwRenKYtRP0ONsWwUdkwpgfOyz
         cSnJiau0B+webKBMeC2FSpB1i8unptoDHan2CduG8gaSjfW0dxXnXDAPyWTRgzBmY+6G
         tcGdhmEnZBXFGb1bLDBymsg0iaUnJCBUpIkRjg9GuudG7wdb4Jb+MOR56EBCPsJwnb/q
         ADAf3WyUcmKrIPqkANpOjxbsidcmFO5TopmhHW8muMvht8GDym2+kuJ9AEaHFiiGTylL
         g4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=BVy2Ttx8T9zbfcE/1tNnZ5FWV3r1EfL6OZ+Vb5oFAt0=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=DMsGCrnx0iSm/XCXH1YB8apmMTdF8C+uXteh2UbeJtj9ElbNzs7CBEuwf48Sogn8u9
         MN59g76rYm/bthThT/wQ4wUiV0KfIN6iIyFLw8fYBBozsE4JrcNUMeVFyM0ieCOAiIJR
         WtyGRbLJ++k4uTKWd/X2Qot5KbPinOVgaNB/INvI81AxJ1HKLjzx3gwe+ww/2JWNWXpA
         0pJOxsC0Arc+9wg9GUJi84rlEH0cIACT6kAp8F0MAXDolD3m2/G8o6FzCiTTLbOjCTdK
         msj5tk8QVtHlWTucdBZWQXWIPHToU8sMRKrYZOsfygyeE8qwjHHpXErn2pBLZRb8ZVUE
         ZwHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tsVQB25H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y24-20020a05610230b800b0046471ee1e45si1357645vsd.362.2023.12.11.09.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:30:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tsVQB25H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCk6w-0000gQ-SR; Mon, 11 Dec 2023 12:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3I0d3ZQwKCMAtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1rCk6t-0000eA-2T
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:27 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3I0d3ZQwKCMAtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1rCk6j-0004l8-SD
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:26 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5d3911218b3so55278707b3.1
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702315812; x=1702920612; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BVy2Ttx8T9zbfcE/1tNnZ5FWV3r1EfL6OZ+Vb5oFAt0=;
 b=tsVQB25Hb357sxsV5Z1JEN0NBsDRX+FpxTErbxatFPQyqFzSUsYFk7neHls6h8UOjZ
 sw03mmWIOSuVU/CVppjsIc5gqWGsU+QTHahtJQ2Qj6iiBfv8cnr/BSchoEL915XnFoLM
 KNM1gUURRFQkCV6ErFbB6wC1uqaAss0Qtzt429n5vPZkFLykTCKCLWwIcs3Q8jbC7DXx
 8uj5fO+Mn3mybmVq9mgx3v3YoJK5qOeJgYil0fYlxtXiZsNGtXqTrvq9VkZi4IWdKSnt
 R/akGkSZ0MdM/RphfU4QKREJFZIj6ImNpdfda1FK1b6Fi3d3UfEvN3o3uTPDL5JH3Kgd
 1Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315812; x=1702920612;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVy2Ttx8T9zbfcE/1tNnZ5FWV3r1EfL6OZ+Vb5oFAt0=;
 b=UNJ4R3IPTrGTW4EQCHn78p3sl2iuhx18MEtXFqAFc4u2bIpSNS09XUzJp89ZOQf5Et
 PNZTRZnMWLpk3bf7RBiqbGvtX3nW/eAItcYaSEngGW3dwO6MOc2CTjgDxiWdiaNo8Nfd
 ki051L4wfHzgfrgeZ3QyWLVG+5v2Jh86AbDYUDURheR66xUUaVtIOnrT86hb9UFAG9Ch
 Fgs0u/W6W/GKpXWtptaxHwfGbv1Q0WrSDZTzV/2cc34TdJDCWN3E0/ru03OK9G1emxZF
 /hFmv9pShuQubdptwBxG/kR/zRCnd1dSg7IC4fBSyGmGLDIw/rSAju0jWvjN1j48qsu+
 GYjg==
X-Gm-Message-State: AOJu0YzmGda4xVwpjSyFXFaTon9OOQhNO4gzBY4Myf67JYll0YnnnlB2
 cRtsXWPowzAH8hxQHhi+RUL7RLve6FeqdiDL3Ls=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:d05:b0:5d0:a744:719b with
 SMTP id cn5-20020a05690c0d0500b005d0a744719bmr44460ywb.0.1702315811890; Mon,
 11 Dec 2023 09:30:11 -0800 (PST)
Date: Mon, 11 Dec 2023 17:29:46 +0000
In-Reply-To: <20231211172953.3164357-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211172953.3164357-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211172953.3164357-6-nabihestefan@google.com>
Subject: [PATCH v6 05/11] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3I0d3ZQwKCMAtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: brf5HPTAY8h+

From: Hao Wu <wuhaotsh@google.com>

Change-Id: Ibbb1d7221bb14e75173bf051271e758d640f40c8
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

