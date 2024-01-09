Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp82012ejs;
        Mon, 8 Jan 2024 16:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS8Hze33sKUIF1vDGdQFIsZT1ykaYHvlK081sIwzb9CykQYWTxXxDdseROXD/4XsaPotYg
X-Received: by 2002:ad4:4eeb:0:b0:67f:2632:9992 with SMTP id dv11-20020ad44eeb000000b0067f26329992mr7246083qvb.38.1704758651357;
        Mon, 08 Jan 2024 16:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704758651; cv=none;
        d=google.com; s=arc-20160816;
        b=bqs3vkM4pdrXYWn9l7DLPA548fTdWK0yR1+Fo7h7mhfc0qeREDYAsTpI58ES5zc7fR
         R4eAFDxkes5cSI7v5WgMpgUz7d8Zlk1ssRpeN6W+M/9bpJdo0N+p3hMkM55QMCnJLsPm
         CPMDFT/XAu94yrt+63MfxtrazYsIMVNH/8f7SFbpuH0UwQ3bRR3MnAU+2oHAv8o0E/6L
         QGJZUpV7+Db7SMXRvYFhfF4VUP8SwlG0r3GWShIimzd55Lkq3TwE3cDu/wvoWUXZW0fI
         FX4IuYVhrcVrkqlD0u2fDy40DKeiul+ZU4Kt5ZuDUc8RECRhqvtfMZPDb6JZ9/bz5VlA
         H1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=smjZfCmlKyImSH8UnLBJgxXERsRcvp3v7dvajAniG47cfANnL7j5CHk4y/AiXz8r5D
         OgeHvS2vfBw043O35dbwj8jb8dTPDtjOiAKseT3t/Pg/QT47RZgRuM4+EbaJY68luVnC
         UUhRdR/tjTMkowgbd443k6mNkzssBV3VBl6+DI4dlS70b8rJFxGS82pKTW7WY2dLi1P8
         IUtMNQYAcxIUejteejC/v6J2A45fN1KA8bT144n2vqFLhfsJ/zVNqvJl8xdoF+RSAFbw
         A6DzAQZkEpTCLJY0orzoNsPhDmpAV5YfZAzKHKl1C9kRI9eAKVaRDSLE71jdc2feDrAy
         j4gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GyMWpFX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020a0cf3d0000000b0067a9aad2247si1127918qvm.191.2024.01.08.16.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 16:04:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GyMWpFX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMza0-0002NF-T6; Mon, 08 Jan 2024 19:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JY2cZQwKCOQTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1rMzZy-0002KR-DK
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 19:02:50 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JY2cZQwKCOQTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1rMzZw-0002rs-B5
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 19:02:50 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5eb6dba1796so42154797b3.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704758566; x=1705363366; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
 b=GyMWpFX6PjKbYZkJSgsaci/L4rwbgnca8XK+exsO0T1E58LZiF5StPf4Mgj19Vz9D7
 F232ykgkSYfa2ZxX+I1CILZSjH+S5NPr3tts2oqq4OmZKFf/CYXFAO6V5ay1UtOeVUJP
 L98XIGR+Df10go4ZCVbK+hTYqvZhm9JvgFykhHWgxqG5eMPrMj9n5cpt/U+JfVf1i7ll
 f2uHzljmTEGM7AZd0asQQyXyZw5h9Lvo5sKaar9Es2JprHE25wktvyhB9ghGs9BZq8K0
 +i8s73L/MjnXhzlQVN7fuHwUSxgepnlVc9dI6LFcIv25S/jtx1QxG8zZ+GZfzoJyISY1
 1ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704758566; x=1705363366;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
 b=qKONZP2xxxfcEn4tZMKZiNgy24TXvED2DPweHSSrI0h6a9cgCLcNUGk0qbVbleyNao
 GnQGNJt7px+mlQwRsdC9nRoPDTWdLkGXNkNfxtfubEl2j9s9rCPb9jyGMWUPk2luN2VR
 mi+kJYL+KlPR3JBSeAzP7NT3hSc7LQbv+PyoL+FfIPSM1V9+Qp4HPVYfMzvomcSatb7j
 oVeQ0IBhk7oFiLnmdvVPQ9WWnI/IJhWgcnCV+QRlT5g1tzTKfMR3t373MrF42L5DvWX0
 9ceWoSN4GV8idVqVUwXm5UX2+/MDV24Av1cashrNeABQib8xzLnOT0CbRiSoaH50W+Dp
 73pw==
X-Gm-Message-State: AOJu0Yz08gVgMln+eup1KQRiw5HdclHAvbYb9I6guXAKhIXpZjmR9ARh
 dmFrz4/RleluTD3jbuIcEFr83afqE9Eo98cKuZGHI7oqmQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:f202:0:b0:5f7:e0cc:f4e2 with SMTP
 id i2-20020a81f202000000b005f7e0ccf4e2mr1417522ywm.10.1704758565861; Mon, 08
 Jan 2024 16:02:45 -0800 (PST)
Date: Tue,  9 Jan 2024 00:02:29 +0000
In-Reply-To: <20240109000234.2799153-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240109000234.2799153-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240109000234.2799153-6-nabihestefan@google.com>
Subject: [PATCH v11 05/10] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3JY2cZQwKCOQTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: V+VNw6iOW3Sc

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
2.43.0.472.g3155946c3a-goog

