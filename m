Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp455243ejc;
        Thu, 25 Jan 2024 11:44:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbemBq5y1SAVM+TN07K3wrecsN/ljwji8fNtcNhix8aMJ5TyLrJrJih5g1/yKwplcX6QXq
X-Received: by 2002:a0c:e24e:0:b0:681:929e:28cd with SMTP id x14-20020a0ce24e000000b00681929e28cdmr90321qvl.19.1706211852302;
        Thu, 25 Jan 2024 11:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706211852; cv=none;
        d=google.com; s=arc-20160816;
        b=EZ/uQDKIuFtwJIBZiVxVWkxRavj8OkpVo6aRJ/9+kc/tAwXfQ22CA+lZyNByFiTOyG
         MRZg614rcOSbN8sv7vtqWJKxuHuS+DlGfndwdeuSuxFO0EaMwhYiRX+iDrrkDpn62b1U
         xLhVPe9APVMAfCyD/vUECRA/xGDYKmvL5NisjT5FgMxfjmHmRGtAhiTWV++2Ubxi109i
         QilzCYl0gOvTsFCw6TvzFS9RMyem8rW5chzmaql8wj4HSBResyzAJZ8znpiMUiRsRd4a
         n6uVQCWOw3IC1vrTdK5WMip8l/UnT0YWs2Snohf4zT9e9qcjD8AVEE9NjtNiHtFO4Ex+
         BJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=RxnSm7b/yluLWW7LHejo8mh8V9p5xJkoccjGOOukrCFkCxMNEbOAMu0smClU+udjIZ
         y52RboxA8hAdHE9yLgdhQMPEofvY6cmnzLH+4n88W2hATRmyk0f/Uurzf/rOsmOQrCm0
         ljN95RZNajPpwRAgM7zzju5VWTicLIxrlfRD7/BSHO39mMK5Le9Kck1wwowkHC23hIeU
         Nq5A2/rH0r05TNoghGJGrvW8ClALmj0X6ifQwrVla0FiEMQ1n1SsEoqJDejwWVkIZUJt
         pZGDgpbqxghtwwHWp5x+PlAjPuUaOkK36g+wAX6g3AO26mIBQni9fj0WL3fxBC3PbmjL
         SejA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=A728oC3J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a056214202300b006816c0b1f82si3532qvf.446.2024.01.25.11.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 11:44:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=A728oC3J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rT5d0-00029v-UT; Thu, 25 Jan 2024 14:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wrmyZQwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1rT5cr-00026J-2v
 for qemu-devel@nongnu.org; Thu, 25 Jan 2024 14:43:01 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wrmyZQwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1rT5cp-0005D9-GF
 for qemu-devel@nongnu.org; Thu, 25 Jan 2024 14:43:00 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dc237543b74so9080791276.2
 for <qemu-devel@nongnu.org>; Thu, 25 Jan 2024 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706211778; x=1706816578; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
 b=A728oC3JWsb9vXH711nhANif0a6Rbn2qI4s8V3ivNptURIatcxUlcvminepKe9eyKX
 +vRCXPjUySO7/wYbrfRG/ryjLx9C18Jm2Y388dH3ayjMhvQEgAVCTvv0pO/gfTk55cKg
 JyGXdEXaN5N4twjetmXhxhwj9sEE9oh3wLa8R7moCiuYxtN/7BSz9wixPwqEb+s1frcO
 wlLjN1PtQviXHbIFm1RhUGwpkwqdaBfiWYm3FDjz47f2OwUf+O66A9UuH2gyuaz5xqM5
 e4WcnZjiK9ThXGvqjEkCshpHey0Kw5fZgtBPxmVJjOLeEbAH7cvSCzGI+5398peMffWx
 Rzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706211778; x=1706816578;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
 b=oMP753TP3c8L9NvoJFWuUweE9gDuIRQ+t/jNd/ot1AZmCyUhWkUBYz4gcZCVJroNDg
 wyvvBMuJBvkC4c4G7ufXleNoW7TL1hHxApQfnw7dULBzhtB8qFgZxPR5QansOR9wBO9a
 Uq3OzO3vBDC7jaG0sveYNt6DJZ7zmseCkT7fFecra++fIjyytuzfLzfuF6Tuy8ka6Vvr
 qeZQVcSWI64OTGzS21Vq2XP7fJFJUsHq68OFS1JEjIDDqTLt2g4JFW1tMc/rVnPbER8b
 9ITqJJfRLcszVqmA0Ul4KNtRb50/rk+ULe6xzC+RiE6uNmdVlbV5Jz/gd6XP51KQjXTz
 I9bQ==
X-Gm-Message-State: AOJu0YwHrEny9SxzVaeU61xTiak39Ad3YYKJ6EEkpsmJdM5uLX462mJ5
 K3mXRGPYBZJJlqzfDAoM8T/Z+LhrSE5JPuHMxh/7FkDyMTpuNVDOuATHziOqpbFDqDxclcpeIw6
 e72o6NT+4Gw9HKilzdKD6QqglxQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:2309:b0:dc2:3a02:4fc8 with
 SMTP id do9-20020a056902230900b00dc23a024fc8mr43016ybb.6.1706211778431; Thu,
 25 Jan 2024 11:42:58 -0800 (PST)
Date: Thu, 25 Jan 2024 19:42:43 +0000
In-Reply-To: <20240125194247.1589037-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240125194247.1589037-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125194247.1589037-6-nabihestefan@google.com>
Subject: [PATCH v15 5/9] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3wrmyZQwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: caw2acS+r+O5

From: Hao Wu <wuhaotsh@google.com>

Change-Id: Id8a3461fb5042adc4c3fd6f4fbd1ca0d33e22565
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
2.43.0.429.g432eaa2c6b-goog

