Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3845109ejb;
        Tue, 19 Sep 2023 13:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQxWK9knd4d38ThEn/L1fpQJYhMkxXhWXxX0ELeOHtS+rkM08XTgqg/zXZE10fgiBNwLW7
X-Received: by 2002:a05:620a:400f:b0:773:cf82:d76f with SMTP id h15-20020a05620a400f00b00773cf82d76fmr945717qko.53.1695153936495;
        Tue, 19 Sep 2023 13:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153936; cv=none;
        d=google.com; s=arc-20160816;
        b=NP35xfvCYRpUixl8eUkLn6/K5RWOz4TEc7EzPRrxgikoqppo+9xnFaZj+qLPyC2/sc
         sNfA7SYLpScMpC6sbqmhLBpI/v+9RXjWuOZTazA95r06mbE/mrYCXjKJ7+c1/WPW+Qmi
         6HRok7fY3H4LyU7NZstKR8gymf8mJKCj3BBbwHpw7QLelmQhz456oj37+t3eEkh4J0Na
         PMBOtdWlSGiczch17b+0nJGHg76yUyepvyfGKztSG1HTt2b0+0BF+EVm+soXl3jG1La6
         F1gYpp6TRNtuD1AoeqXpkgQVro9NsElxQSOu4Sin6yh8/fGKDQMDU2YfjLkaYIVMZVcW
         MCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=0joMDJfdVcSOlSumVdw9F57UYMZZhd+yugc3hviET2M=;
        fh=31Pgf1blV3SQPmQ8WOxvGy7Z8ujSo7iGO5C67upv8D4=;
        b=o8e6xxy+ZEBaYmZxUbe6I+6FH0dKr7gJVS3q9jVgj3wU9Q+xHLztQVSRlrskT11XPC
         ql0NumzVYYKLX0nIpQH8dH8mylhaUhgqmquAWFR5HP7DAquiA9H8r2leeX4jxYPD57f4
         sI0TZR1pYDrwLQFJlibP4UCpbGjUpTa072ofRS9OZMvfRgX/s3ZCE31FQAaUopLSHcs+
         AEhhfyngmJfnngLNU1z4DyoVUD9NvxqsSPMALyobV8NxnXeR4Difn65GNpaSUP4YvuE2
         6r9St7QLjhenrdGRlCyxJ3AXdsSafZvJjV37Q2ooc9IzgFNQkyYScG080H4j5TZg/mDQ
         Nm7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=o9r7SfPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05620a44ce00b0075785c1637bsi8481674qkp.565.2023.09.19.13.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=o9r7SfPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxM-0005f5-OB; Tue, 19 Sep 2023 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IOEJZQwKCDkiVWdcZnoZaVibjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--nabihestefan.bounces.google.com>)
 id 1qiezS-0005CP-Sa
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:28 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IOEJZQwKCDkiVWdcZnoZaVibjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--nabihestefan.bounces.google.com>)
 id 1qieyz-00012D-8a
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:25 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59bee08c13aso65966937b3.0
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146272; x=1695751072; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0joMDJfdVcSOlSumVdw9F57UYMZZhd+yugc3hviET2M=;
 b=o9r7SfPUdY44p383XIA0NKNYv31/RijXjGPtR2isIeRwM5t2IXqWo/clXv0uk5bkdG
 prxKZOL2QkpJRoycIaOOUe4zqXVrfG4NSDEWwrrVGYBSOgFla7cC0YhvUW9+C1KyfPB0
 ADUwMgVYI9M1irNXYN/SliyTrDLpUcn/X65oUHcCgERyRTwMLWgQk/QjIh5/VTPYJfSd
 KQDCf5YQG7OBFfDRegOM6ijD2eRJAhRmoYujQ6s2Y+vuM8x8eJ287NEx69cF16qOlsbk
 EPbUyV1mdDRcwPWwYXhJ73M/Kv5l9SbzFTjtErHO5EHbAwsToazkVpBEQUl/QOIzQGmA
 2TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146272; x=1695751072;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0joMDJfdVcSOlSumVdw9F57UYMZZhd+yugc3hviET2M=;
 b=ahYpA8Tg7g0OzVSn55e6U4uss6DL6OhzrteRZ9xCGz4VIMxcGNfldkeB0+tCXK/hnL
 9hbdfkAboGclvJFS7HJ11pZvp4oC8OjAueRClS8GxGiaKMchxkk3uHIqjgBVDB7E6gpD
 J56aulSyo8NFr6R90qCnUOhLUpF+/XQPD4YpbRVe8vL2WQo9LZkwA07GUBLaEKOwoe3X
 3H0tW1t7Wm6XbWu+JzF9fSFXe5vebIg0b+hD1Y8FYqSqwpaVcWGPUf1UgM+BYfFot4Q1
 be7n9Sh8kE6DzGYzAbZVEHv3jV1MQHCJ/g1ruyruM5FVrVw3PIks0wiX5OjOxV7m6FRN
 bmtA==
X-Gm-Message-State: AOJu0YyTZmAgj4odicfNJFqE6671SyYuLpelK/fP9LkNClpBf9p5ebyh
 bRABTioj3jh+LV4l0hfXwohfiUczIB8jAJGkvDk=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:ae59:0:b0:59b:ebe0:9fcd with SMTP
 id g25-20020a81ae59000000b0059bebe09fcdmr4109ywk.7.1695146272365; Tue, 19 Sep
 2023 10:57:52 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:18 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-8-nabihestefan@google.com>
Subject: [PATCH 07/14] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3IOEJZQwKCDkiVWdcZnoZaVibjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:14 -0400
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
X-TUID: Q1f7gJ5Ls6E5

From: Hao Wu <wuhaotsh@google.com>

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c         | 38 ++++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h |  3 +++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c69e936669..15c58ef4a9 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -92,6 +92,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_GMAC2_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_PSPI2_IRQ           = 28,
     NPCM7XX_PSPI1_IRQ           = 31,
@@ -235,6 +236,12 @@ static const hwaddr npcm7xx_pspi_addr[] = {
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
@@ -463,6 +470,12 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
+
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -694,6 +707,29 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
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
@@ -764,8 +800,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 273090ac60..9e5cf639a2 100644
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
@@ -105,6 +106,8 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCMGMACState       gmac[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.42.0.459.ge4e396fd5e-goog

