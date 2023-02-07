Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5711060ejb;
        Tue, 7 Feb 2023 11:47:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZxRewTPaTDi2NLymXXPWukffAXOXeeLuuq3yp9zlWjfmkdqTyuV4EfKuIDwaWCqrFLIJS
X-Received: by 2002:ac8:5955:0:b0:3b3:7d5:a752 with SMTP id 21-20020ac85955000000b003b307d5a752mr8196776qtz.50.1675799229939;
        Tue, 07 Feb 2023 11:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675799229; cv=none;
        d=google.com; s=arc-20160816;
        b=PKkLtEXXdYzyqAjFWhFafMOQH7Dyr21pZuqaLdeeSoThX0/GHsHpLzwPpML5XUpxMC
         2XVGsBF47/gCF0i86jrJvWkGXYpJRirLtJcYja4YHpg35BrC9m1DQiGBHXRdQoKUZwq7
         +0F+rIT3FHShRTqefp0u5Amv6b337qcQ5PgI98jCkta/OuqVXPCgoLuOMUPOO/pEFaz+
         jc12bbgFo1XbfWHZyMesk1iiW+6pSkL5t7C4RzR8xxMHBzxYhzJrxTo6mbbVE3ooHZxF
         qAMg9NF6uwXvrRXPwQgF5QVqVuGBAwv6o0xA8+FINfV4mN74pXE7+NnQHNbwDhKLaMXL
         Tu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=0+NgHraPggD1/G/0Zic2rQg5R0ycbmNyiemBx69rPPw=;
        b=oJMK4AsAuRJ38tYzJhNTooiHSXY9IJ6WyJsPVaYWO5yYW8gfZ8p7oQntcH6wcYIzBf
         zA/pFRMQ2+QgpdRNaY7B+mBdtZvP0+9jOkrOqXmHyeI/Kv9825KaLkoB75HC7VlIQX90
         EKzfSErGJ6Qo1kWVxNN/80NUuZSJbb18S2ha8gKtvlejIcPDTGQ4cR43PWdgxh+FO2Xs
         F5Qgd8zzNpcW7R3pCjIvWrI2icJggQ9QF87RgEyD00SDsf26HtB469IX+5pbg4dDixt3
         N79MR1X0rSGwBskhtwjsibSOo+y2Fr7fzDyq4o2f3dJmgxuxkFdrk4Qg8kGBn6fODqL7
         ww/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=IwiT65RW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a372f04000000b007389214bcc3si131647qkh.357.2023.02.07.11.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 11:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=IwiT65RW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPTvB-0002Xh-HZ; Tue, 07 Feb 2023 14:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fariYwgKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv7-0002Sc-So
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:46:26 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fariYwgKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv1-0002ff-0Y
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:46:22 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 g31-20020a63111f000000b004bbc748ca63so7199756pgl.3
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0+NgHraPggD1/G/0Zic2rQg5R0ycbmNyiemBx69rPPw=;
 b=IwiT65RW/lOEqRtBItqNU8ntEbgoZLfMwyaG4QuaPLY2OvdI3DBVtqGVpejUmXIpRQ
 Z8ywrbQrOPjiBpd1XKJqcvne/Y1NeyjOCZXcj/Cb/JsEfjHja37uq5fDYxfR2Nc0m8bE
 yEciBS2c29MZvvTCUROiY4LkaN1POWfVWHZdv4Y2UnxdkkAa8fBLlEAua3U8a8O5NfTo
 jxOZs9Ba4D5WZgtmhr0sza9xPLBX7gSdS/WIIUmZaIE9iMEq4lP5DezvROUiW+c+K5KN
 nXI6rvARxbbOL/h7DZY3tpuDw0E8A5JP+oTjYsIBOiDy6bWtfcgcBoQwzpyZCX2CgaPL
 enxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+NgHraPggD1/G/0Zic2rQg5R0ycbmNyiemBx69rPPw=;
 b=kXAg+013rH2o301gf7+Jci/+7Br0jWlO9+fO1sVAPSg38YIxk5BTPW/1Y6FClEmkXp
 +O1j9NaxP72NQIKKiCVDqFSenfR6o7OPv1bddT/Nz2/fn/gU2b5Nk5jGayifK2kwsF5Z
 qBlbXbkqkiKmX/Gv5UKydZz7ySFM7bHCo4Zg8zuFEB5x2iuNODckO9NgNYuYu9pqpJUP
 if0IRx3ICIxOTFQz/wO2IBzTAx95SRZF4jIaj6/dpjagNWOLVtd7FYnMmogC9F7Vmbr1
 St/ghG0KzEnmBm0f6VklovV1Y0Wmna/VI0AhVHE38pmqj8tYqcFn6J12sIP3amvdGg7R
 7JWA==
X-Gm-Message-State: AO0yUKVVKUZKgZJy+P3ylHbAcrxDLsJ4KeoyPdWXcGQnuH0hX4TmWqOx
 W9F9sXOnPKqe4pV6wiFSgKFrglnlpbK+AA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:c202:b0:230:ee6f:28bc with SMTP
 id e2-20020a17090ac20200b00230ee6f28bcmr7784pjt.1.1675799165587; Tue, 07 Feb
 2023 11:46:05 -0800 (PST)
Date: Tue,  7 Feb 2023 11:45:56 -0800
In-Reply-To: <20230207194556.3262708-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230207194556.3262708-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230207194556.3262708-4-wuhaotsh@google.com>
Subject: [PATCH v2 3/3] hw/arm: Attach PSPI module to NPCM7XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 Philippe Mathieu-Daude <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3fariYwgKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
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
X-TUID: C+xWv5HG97Wf

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
---
 docs/system/arm/nuvoton.rst |  2 +-
 hw/arm/npcm7xx.c            | 25 +++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index c38df32bde..0424cae4b0 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -49,6 +49,7 @@ Supported devices
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
  * Tachometer
+ * Peripheral SPI controller (PSPI)
 
 Missing devices
 ---------------
@@ -64,7 +65,6 @@ Missing devices
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
- * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
  * PCI and PCIe root complex and bridges
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..15ff21d047 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -86,6 +86,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
+    NPCM7XX_PSPI2_IRQ           = 28,
+    NPCM7XX_PSPI1_IRQ           = 31,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -220,6 +222,12 @@ static const hwaddr npcm7xx_emc_addr[] = {
     0xf0826000,
 };
 
+/* Register base address for each PSPI Module */
+static const hwaddr npcm7xx_pspi_addr[] = {
+    0xf0200000,
+    0xf0201000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -444,6 +452,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
+    }
+
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -715,6 +727,17 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
             npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
 
+    /* PSPI */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pspi_addr) != ARRAY_SIZE(s->pspi));
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pspi[i]);
+        int irq = (i == 0) ? NPCM7XX_PSPI1_IRQ : NPCM7XX_PSPI2_IRQ;
+
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_pspi_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
+    }
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -724,8 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
     create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f1b7e4a48d..72c7722096 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -32,6 +32,7 @@
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
+#include "hw/ssi/npcm_pspi.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
     NPCM7xxSDHCIState   mmc;
+    NPCMPSPIState       pspi[2];
 };
 
 #define TYPE_NPCM7XX    "npcm7xx"
-- 
2.39.1.519.gcb327c4b5f-goog

