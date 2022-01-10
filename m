Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1050747lfj;
        Mon, 10 Jan 2022 10:08:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2eEW+K0H3kNseOaV1ra2VRiyqzxH8kxjQCRSd837r4GVvqsu9j2yCPZtwVH/71Z3opRMx
X-Received: by 2002:a05:6e02:12c8:: with SMTP id i8mr558620ilm.146.1641838133855;
        Mon, 10 Jan 2022 10:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641838133; cv=none;
        d=google.com; s=arc-20160816;
        b=fxbsZStNjC1CIMDAr5uKBx2EJPLzWJnozYQOanyHepioIVEQ1rscWSpM1kpF67qYXF
         k0DuxgiYFxyOLesLTCAeGvXFIlV3zDzGnNil4rhjJdPr4hOIuL29LaxiZnKwpVdg1mj/
         wbhClcHFefKOm2/n6j2mFu00eisY3q5aSEJpPDVr9FUEcFTcN1OgD586/u0Il9AXCCFb
         Df6SsPeSlQeGEwu9SamzgMINXU8qO8Fp+Zgos1o02UhJlRT4n2IcKR43n4/l7cKL1L07
         CuvJNLiU5Z1bvkkeyRCFPL3LrAPBOMhBjf7pLvp3qrdLG637L/77B5BcZd3DRNcnUTp3
         kI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=8sehJV55Mhq/TPsYPXorz5tVLGfqSkJ2ByLy2U/Tw1Q=;
        b=dr/LuAJIZlvVHeBntm7YJ7hnT8kM4P4xk9b+F3EAAwI/8wZJQoIchb8FDet7GFBtP2
         MVHoN4ywCMAfLHWMiVa6qIFveVDleSDJ3UyPR80/15UwOQyNmq/4qfb1tBbf9mj5I6f9
         xZ+AlCmzgrLxvI5W+KXueoezdatAKK9WFsnJi7ZYHr+/wybE9LfgYzCDAjBvMIQETFzW
         JMME+v+C0GOs+tTLz3G28nsPgTnKMVpyj3QwDv5Hy7yU4nNiHE+Vr+sWDR6vzl2vK2o2
         0K92d+ci0h9RAr8AvtWc56Z12eLoM++SjQoe9Rw9UsIthuxKn6FgmTeA5MgiwZfSAF7j
         iwgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="SFkw/5Z2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si1444285ilc.181.2022.01.10.10.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 10:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="SFkw/5Z2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6z6D-0003W0-7M
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 13:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QHPcYQcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1n6z1G-0005qB-Vo
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 13:03:46 -0500
Received: from [2607:f8b0:4864:20::b49] (port=49114
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QHPcYQcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1n6z1B-0007nR-GP
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 13:03:43 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 p140-20020a257492000000b0060dbb88d8abso28538336ybc.15
 for <qemu-arm@nongnu.org>; Mon, 10 Jan 2022 10:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8sehJV55Mhq/TPsYPXorz5tVLGfqSkJ2ByLy2U/Tw1Q=;
 b=SFkw/5Z2vC1ffd1HB4a/RV1FZYWyvmLswDcSOnyeSm+t6SH2cmk0N39Xg8zJnn4r3H
 5cMdNTSqn/4lxatjy2FGyNLxm5DqqRW0/oKJGgtLwaunWv9Ig/LCMZA0XG/tvpWvIwlc
 uLTFRQMrQv7EWpWaJPu3dfbrcD+pVdkdUEljYhDaCwCYyiSRBQQRgUg7bOE2mMerIU1G
 Kjj5a1ELkaH5NuCWka1ANPgkN4fe8CQ8seLiDk0la9rXOetl5MWk9Ovr3lVzAiR5e5UM
 ub0fPjwzOQGHvAhqXiZ6mKyltDYTeBVOHunvIVBubBsqKwTcWVWnt5EP2Su8lFIaht3N
 74BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8sehJV55Mhq/TPsYPXorz5tVLGfqSkJ2ByLy2U/Tw1Q=;
 b=3WDxJ1qyGGDqnbe/2+GNPvt9NsW80Ax2sIenADZ+dEKJcKCCzt3i1JpdknTd3yO7BA
 0nsszajc02qOo49yIPBYyn40ew8Uz3xtSOylaMvLmBa/U9SJ2soMwlc/5mkWPGT+AfiR
 3rrdJUUK1nkYYgTxSSLvpUPqyAgsIypm+zvW1xYzZwm/59zPW7EBZz98/O/yzYtXl/FY
 vyFWuPrzp4ckpUhMj2Y/B1oZSqLkRacfRw1cG+LxSuIlPMneGLNrBXza4epz2raSttvt
 TLWNRYEPRZfbVXbfkHLbkVe1RpwQaIOtDqMVXqNsB1F3hpdyuJN6BFIRP+oBwrA5LDby
 X9Lg==
X-Gm-Message-State: AOAM53085LxXwziRa9ENNlCGGnHGwviJN912U2GbgApbCgdBIIvEJTpp
 Ip/xGOv572bbZ7jDJcRBGWDfQa6gtfTh
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:abcf:: with SMTP id
 v73mr927324ybi.459.1641837376196; Mon, 10 Jan 2022 09:56:16 -0800 (PST)
Date: Mon, 10 Jan 2022 09:56:07 -0800
In-Reply-To: <20220110175607.591401-1-venture@google.com>
Message-Id: <20220110175607.591401-3-venture@google.com>
Mime-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 2/2] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3QHPcYQcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dD/J38dqwJje

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx.c            | 15 ++++++++++++++-
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index adf497e679..706c6f61c1 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -48,6 +48,7 @@ Supported devices
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
  * Tachometer
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 878c2208e0..ef8c9129ca 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -53,6 +53,9 @@
 /* ADC Module */
 #define NPCM7XX_ADC_BA          (0xf000c000)
 
+/* PCI Mailbox Module */
+#define NPCM7XX_PCI_MBOX_BA     (0xf0848000)
+
 /* Internal AHB SRAM */
 #define NPCM7XX_RAM3_BA         (0xc0008000)
 #define NPCM7XX_RAM3_SZ         (4 * KiB)
@@ -83,6 +86,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_PCI_MBOX_IRQ        = 8,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
@@ -447,6 +451,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -697,6 +703,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /* PCI Mailbox. Cannot fail */
+    sysbus_realize(SYS_BUS_DEVICE(&s->pci_mbox), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 0, NPCM7XX_PCI_MBOX_BA);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 1,
+        NPCM7XX_PCI_MBOX_BA + NPCM7XX_PCI_MBOX_RAM_SIZE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pci_mbox), 0,
+                       npcm7xx_irq(s, NPCM7XX_PCI_MBOX_IRQ));
+
     /* RAM2 (SRAM) */
     memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
                            NPCM7XX_RAM2_SZ, &error_abort);
@@ -747,7 +761,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sha",          0xf085a000,   4 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index ce593235d9..0bc27a28d6 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -26,6 +26,7 @@
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
+#include "hw/misc/npcm7xx_pci_mbox.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
@@ -104,6 +105,7 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
 } NPCM7xxState;
 
-- 
2.34.1.575.g55b058a8bb-goog

