Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD1CA0FED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 22:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uw6aT-0007eL-6q; Tue, 09 Sep 2025 18:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FabAaAYKCLAokRYdpWeeWbU.SecgUck-QhcdedWdk.ehW@flex--yubinz.bounces.google.com>)
 id 1uw6ZA-0007IT-Le
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 18:11:57 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FabAaAYKCLAokRYdpWeeWbU.SecgUck-QhcdedWdk.ehW@flex--yubinz.bounces.google.com>)
 id 1uw6Yt-000510-Qm
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 18:11:56 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-24c9e2213f8so81973945ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757455893; x=1758060693; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NiQ978pxL/Tt3/1dhub6m048JLoFCWnVgsDiDRRFat4=;
 b=pT7O8aMhHUx7pWnTwAOssa3QjjMWQCu05cKcrxXI50Ie/VYXrmuKnBv1BvstxCXNSl
 8VBbYufp0Em89yKngr4EZo3KaVbRg8ljLstDe1WhLKltKeVpSyfpHfXg5szbhHdVaCVU
 r0wlS/oK2z0W/YpUMu2fuyR5XN/Vb39CylEiKvuTZZU6Dl0C6vg2uU9qHX2U4UFduTkv
 jYChZGtNIJG5cNnHpQUqMZ3LY3ZykSdIFJ8Tb+h2R0gLoNZqj/IwehBHZwg31kcFkhEo
 +97Mzdkhuhj3GYZgkpZNF5bHmBfNHRTeychpoD9oyqSm5nzZtFuPpahwbHJuMrxSa5/2
 JOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757455893; x=1758060693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiQ978pxL/Tt3/1dhub6m048JLoFCWnVgsDiDRRFat4=;
 b=Bxf/v45kHc9ndXSxHBzGCoYeoNC2RFMwGDGPeMd6tAsERIL4Eu/7QcGMdzWniePFcX
 aX6nro2+jVyKnagki+gXLSqDR3Q3JwQC4rKFfZoAEMcILMBhOEVF+nFSvL6aFbEDE2qo
 DwgKSE5WryJnIKpISbRY5aKjzHK1E/pSO5Kf2RX8x9cghiXQ8KuajXLur4bxgjpf5xxU
 316ga8W2FmzSpvbjptwGlBMHTNZGb0d5H5cKlYcO7TvKB0G2J5BKFz5g036YZjU6AD3R
 EMo4eGkKB5XJsUb5+YvgwcIeZmJPHH3K6wEKDmX2C5ZAvkDOeiLBNPcIS7dVKcxtE4oV
 eg+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUafXAk66qOs7BNm2owTIP6/CL0b9jErsoAyRHCgIHqVRBy1co23ShhQGV90W2nzqhLmAjwc4bDXg==@nongnu.org
X-Gm-Message-State: AOJu0YxDY0+LxTyvDakXcvLL8r2B/5EdGjKzVR7p6cd+m7fPteOv6Iue
 zSJfgIBcV0Ns9bGTiJbQqi0dlUOy6ImendVDoB9ZJoEHL/yxhF0S/o+UUik+NzLL8Tgr/yfLMpd
 joTyY3w==
X-Google-Smtp-Source: AGHT+IE09vqjj/kxrFr0mfitlmWzu78KVe6NUbPFRsP67xAwnLkg55qcY+I1RmO0FAkFVPT1QrxzNypX2JQ=
X-Received: from ploq12.prod.google.com ([2002:a17:903:1aac:b0:24b:1589:e332])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce03:b0:24c:bc02:78a4
 with SMTP id d9443c01a7336-2516e98142dmr193936295ad.24.1757455893307; Tue, 09
 Sep 2025 15:11:33 -0700 (PDT)
Date: Tue, 09 Sep 2025 22:11:02 +0000
In-Reply-To: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
Mime-Version: 1.0
References: <20250909-pcie-root-upstream-v1-0-d85883b2688d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250909-pcie-root-upstream-v1-7-d85883b2688d@google.com>
Subject: [PATCH 7/7] hw/arm: Add PCIERC to NPCM7xx SoC
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Yubin Zou <yubinz@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3FabAaAYKCLAokRYdpWeeWbU.SecgUck-QhcdedWdk.ehW@flex--yubinz.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Sep 2025 18:12:33 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Hao Wu <wuhaotsh@google.com>

GitWatcher: ignore
Google-Bug-Id: 262946103
Google-Bug-Id: 240169286
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Change-Id: I77ce849af30e999ec26aeab62b7db437db28c012
---
 hw/arm/Kconfig           |  1 +
 hw/arm/npcm7xx.c         | 10 ++++++++++
 include/hw/arm/npcm7xx.h |  4 +++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6ac38d083e4a01e09fc00e63df66046c7c17b356..a3f2041db7920c134a2d9d79ed4836bd35507d7b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -487,6 +487,7 @@ config NPCM7XX
     select UNIMP
     select PCA954X
     select USB_OHCI_SYSBUS
+    select NPCM_PCIERC
 
 config NPCM8XX
     bool
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index ecfae328a96a49c82beaa53a5d803469c8f02d91..118470af0694718520b7c3828d3a09ecfafb31ec 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -47,6 +47,8 @@
 #define NPCM7XX_CLK_BA          (0xf0801000)
 #define NPCM7XX_MC_BA           (0xf0824000)
 #define NPCM7XX_RNG_BA          (0xf000b000)
+#define NPCM7XX_PCIERC_BA       (0xe1000000)
+#define NPCM7XX_PCIE_ROOT_BA    (0xe8000000)
 
 /* USB Host modules */
 #define NPCM7XX_EHCI_BA         (0xf0806000)
@@ -148,6 +150,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_GPIO5_IRQ,
     NPCM7XX_GPIO6_IRQ,
     NPCM7XX_GPIO7_IRQ,
+    NPCM7XX_PCIE_RC_IRQ         = 127,
 };
 
 /* Total number of GIC interrupts, including internal Cortex-A9 interrupts. */
@@ -475,6 +478,7 @@ static void npcm7xx_init(Object *obj)
     }
 
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
+    object_initialize_child(obj, "pcierc", &s->pcierc, TYPE_NPCM_PCIERC);
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -781,6 +785,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
     }
 
+    /* PCIe RC */
+    sysbus_realize(SYS_BUS_DEVICE(&s->pcierc), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pcierc), 0, NPCM7XX_PCIERC_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcierc), 0,
+                       npcm7xx_irq(s, NPCM7XX_PCIE_RC_IRQ));
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 56536565b748c5fb2f415d85df36bc01cb64dc54..661d4050154a36dc2b90e96915ae59971a8c4a7a 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -31,6 +31,7 @@
 #include "hw/net/npcm7xx_emc.h"
 #include "hw/net/npcm_gmac.h"
 #include "hw/nvram/npcm7xx_otp.h"
+#include "hw/pci-host/npcm_pcierc.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
 #include "hw/ssi/npcm_pspi.h"
@@ -108,7 +109,8 @@ struct NPCM7xxState {
     NPCMGMACState       gmac[2];
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
-};
+    NPCMPCIERCState     pcierc;
+} NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
 OBJECT_DECLARE_TYPE(NPCM7xxState, NPCM7xxClass, NPCM7XX)

-- 
2.51.0.384.g4c02a37b29-goog


