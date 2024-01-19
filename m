Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1187046ejg;
        Fri, 19 Jan 2024 12:35:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwNi+CUK7CpN9ayxcvFmp7JwaMg1CE3tjF/mClDVDkKdnDVvSGV+uUDCcNXYd7fkWY5kUR
X-Received: by 2002:adf:ff84:0:b0:337:a5a4:b741 with SMTP id j4-20020adfff84000000b00337a5a4b741mr146948wrr.107.1705696526876;
        Fri, 19 Jan 2024 12:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705696526; cv=none;
        d=google.com; s=arc-20160816;
        b=qlMe6lQxiCe6DRTfSbznwTe4lozibQ7TpqsVcup/yQo+8mi3JY2LVizu5LS1yxMYBX
         jvhB83Pt74sUqetXVzYJEgM9d9OWTMz6Tyi2HUwpnPMLNRvD+kl4Kib6vhf7Ayiu0Pwt
         ozp7xKJ/BgSi2NeRa/jUl9voXWn4qHNVdDu28N+87gmK6BNPO6rWO+RJZE6oXG8af0ED
         HmnjmNF0+kl4xr7bsNCA/SyAD53m2QIo/Dv2eorkFlEqcY4U7+7v+s/qu/OZYXD9HQHI
         ol+fuPWs2077F1rn3Ja+iYMXqvcDXqpq75TPZspvrIYgj0ZQLtxKYYtmfVRzOWzQMtVO
         Xiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=JKCynwXHyuTm7d/4womyVuSHa++vDMfEnlpPnpd3PDE=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=eqVIvUCw3OmF98GhEKJD5nSt8TQss77JtGC71fBqsqY1oARJxW007bZftWeXdCvZn+
         xWh3PmjxKZCwIZjf17hB3f12z5JStjiePyLPBTE+V0bDcSeJVM6QvVjojMpN0LRGbRFh
         FfELlVPL7aOYV4qf74yLIH2xgZeQqisakhwrhJZCyQgv5xNLzUtskPV/mQ6/9mNIQpzS
         Db2kqloUYmjltgDyN8PWSXcNn6Sh7Aii6Fu7fSPPtroIyU6QhR6WpF/pOIw1cfscgaTd
         Je+YxziRQekLpv6yU09pz4Egc/gcEVja+tEzY2yWSHA2JbvDfMYl/+lt/p86Dgh5SQwL
         cPbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ES657C3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a5d4646000000b0033925142d8esi192005wrs.533.2024.01.19.12.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 12:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ES657C3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQvYD-0001P9-FH; Fri, 19 Jan 2024 15:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3h9yqZQwKCCAJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com>)
 id 1rQvYB-0001J7-Te
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 15:33:15 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3h9yqZQwKCCAJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com>)
 id 1rQvY9-0003lk-6H
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 15:33:15 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dc2470bc0bdso1734771276.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 12:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705696391; x=1706301191; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JKCynwXHyuTm7d/4womyVuSHa++vDMfEnlpPnpd3PDE=;
 b=ES657C3kjJ64P3lFJhTHQc8aXyXFWd4z0FbIT7MRx4aBVAJ4qSu+sh3Qn3wXgWXKrR
 KMaD4GFx3VsdPkTd4XSwV9uANhL40bEC5dkX+tSEonwSLvxyJx3BheFIcE9T1tbX7R2l
 6oLDjUfexqoLsqifbh7AV+ox+YQi+LJVPyCgCDsy96Q0KTx2l+Ftds1uj378+KtGHJUq
 zKvbvYaCC4jPFPUw+W12aZ6vnBmVZUdlF1TVHhRkkJlBYZRbjvHBRXuCmGftK+dcRg3R
 dRR9QVWZxc3Jw/iKJp6aR5znsPHN5newt4/M/AT6KPOOrAOKvr2aj6Ip2dEJ+JFhKa6q
 XmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705696391; x=1706301191;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKCynwXHyuTm7d/4womyVuSHa++vDMfEnlpPnpd3PDE=;
 b=PCLk/KrDeIOKhYm5qcZgoybg6qtmIJ5cfovJOn78Iu8YyAJjV6DcVxJFSvLXRFexTE
 xKD7PwHlmYyw530VdZYArvuIKsMh8IRP5SXYAWybWnMyx3tMInrf0tJEhI15g0UmwUoN
 6iQyIR7+eLBaa4bK72SJ0x4/8o45bat/2N2uLUCj21x6mXNWyeICmuU7xGigu81eUV1f
 Vn9fZIiPV3L38LfPwMW9VnF3s7alWxlJe/TcU6RW+kXhc4hcSxE1o6Ar0RBQrOAlwbWz
 P4duSzQVKOH+be5WbVoymGBgFcenayFUUCDMXG3KUWVxOz3El8IflyC15Kv9pTcMYp7F
 Qcfw==
X-Gm-Message-State: AOJu0Yx0RTF+YtNr8UgH+vlpwsQ1wODNx6TouAkHsTBhgYx1pg10I46j
 o2niM9mgxagU/9f8J9GYKjmXJFXFdIOtzF7TEApnjXT2K5LfWRHq4AET9tbtV/gFCq5aBIdU/IP
 z5XaAi7QwQE75PacXP1tbEitSXA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1808:b0:dc2:3426:c9ee with
 SMTP id cf8-20020a056902180800b00dc23426c9eemr45198ybb.11.1705696391636; Fri,
 19 Jan 2024 12:33:11 -0800 (PST)
Date: Fri, 19 Jan 2024 20:32:56 +0000
In-Reply-To: <20240119203303.2230984-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240119203303.2230984-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240119203303.2230984-3-nabihestefan@google.com>
Subject: [PATCH v13 2/9] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3h9yqZQwKCCAJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: FVBPr0y+nCbP

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Change-Id: I14c42c628258804030f0583889882842bde0d972
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 docs/system/arm/nuvoton.rst |  2 ++
 hw/arm/npcm7xx.c            | 17 ++++++++++++++++-
 hw/misc/npcm7xx_pci_mbox.c  | 10 ++++++++--
 include/hw/arm/npcm7xx.h    |  2 ++
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 0424cae4b0..e611099545 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -50,6 +50,8 @@ Supported devices
  * Ethernet controller (EMC)
  * Tachometer
  * Peripheral SPI controller (PSPI)
+ * BIOS POST code FIFO
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 15ff21d047..c9e87162cb 100644
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
@@ -83,6 +86,9 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_PCI_MBOX_IRQ        = 8,
+    NPCM7XX_KCS_HIB_IRQ         = 9,
+    NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
@@ -456,6 +462,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -706,6 +714,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
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
@@ -765,7 +781,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sha",          0xf085a000,   4 * KiB);
diff --git a/hw/misc/npcm7xx_pci_mbox.c b/hw/misc/npcm7xx_pci_mbox.c
index dc56e2bd5a..0ac8391479 100644
--- a/hw/misc/npcm7xx_pci_mbox.c
+++ b/hw/misc/npcm7xx_pci_mbox.c
@@ -76,22 +76,28 @@ static void npcm7xx_pci_mbox_send_response(NPCM7xxPCIMBoxState *s, uint8_t code)
 
 static void npcm7xx_pci_mbox_handle_read(NPCM7xxPCIMBoxState *s)
 {
+    uint8_t offset_bytes[4];
     MemTxResult r = memory_region_dispatch_read(
         &s->ram, s->offset, &s->data, MO_LE | size_memop(s->size),
         MEMTXATTRS_UNSPECIFIED);
 
-    npcm7xx_pci_mbox_send_response(s, (uint8_t)r);
+    stl_le_p(offset_bytes, r);
+    npcm7xx_pci_mbox_send_response(s, offset_bytes[0]);
 }
 
 static void npcm7xx_pci_mbox_handle_write(NPCM7xxPCIMBoxState *s)
 {
+    uint8_t offset_bytes[4];
     MemTxResult r = memory_region_dispatch_write(
         &s->ram, s->offset, s->data, MO_LE | size_memop(s->size),
         MEMTXATTRS_UNSPECIFIED);
 
-    npcm7xx_pci_mbox_send_response(s, (uint8_t)r);
+    stl_le_p(offset_bytes, r);
+    npcm7xx_pci_mbox_send_response(s, offset_bytes[0]);
 }
 
+// The device is using a Little Endian Protocol.
+// If running into errors, please check what protocol is being expected.
 static void npcm7xx_pci_mbox_receive_char(NPCM7xxPCIMBoxState *s, uint8_t byte)
 {
     switch (s->state) {
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 72c7722096..cec3792a2e 100644
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
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.43.0.429.g432eaa2c6b-goog

