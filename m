Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp44822ejs;
        Mon, 8 Jan 2024 14:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBm3+VBDgmpV1L1c4HC5wqgVlsOhAIJpcl3DxClkk8TUYJkzpB62QyIG9QqKZbqm0HtujM
X-Received: by 2002:a05:622a:3cd:b0:429:96f8:86c8 with SMTP id k13-20020a05622a03cd00b0042996f886c8mr2481696qtx.122.1704752948455;
        Mon, 08 Jan 2024 14:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704752948; cv=none;
        d=google.com; s=arc-20160816;
        b=XBiNZTqIXicQ+V12rFIsPJgbzfU8TqwBr/0QV8yHJHSs+nekfNIJXNGQMz8CVjD/HO
         Q17KZsX/q5cQIP4ayWtVm8wLAPPNnZTRXhWGQveK0YvzpLzd7I+QPN4rVbjbq8JO2jyf
         tDNrHJCQWsZCVcIubpLhLjQxVQaM47dV5/DCD3s8vBBZGIg6fe67UmZElaHfToRBz49Q
         dxG5HVntLYPKnLJiThMO51DpU5VlBVbL56vCfZT9Quz51XocpCQt4Y/QD2+AYtndXK1O
         r9rad/vc/3Cvr+QtbmCBtvNwfphPg3vGV2XvpUxGltDYa0yjz/9o6+4bO6J6tIEY49VX
         tzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=CrlfUk2cV40CpIgkLu7CTTLHL+H0lGthFdfbQ2wGI99h0r7r0xhxVH83ULkZNqI7rG
         w1ZRJVINHShyDCk4MKI+kw6B9P3Snq/0Lc/d1eUeQ+PY4i0ne7WeWP1r+c1sQFVOJfp6
         3bDkjZtj8gt+ZgjfOy98vUszvaCYUaAsm0EZVtSZlPLLPACTNnpKxJuT22W6LL0NlIdH
         7OW6Bnm7j9oHSdS+o4CszFqYpWe5fCGQrvr0ldPvixphXrCFPh5ZA2T+NAr5jRu1u8jM
         +Yt+wQEs5remLM9dawrlUHTinCWQH5L4qSotcIsuiXjoVnZYYmB67swYC4KEoaJQppYB
         tY7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pA22jOnF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb17-20020a05622a481100b004299e360d39si849411qtb.765.2024.01.08.14.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 14:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pA22jOnF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMy6G-0006nh-S3; Mon, 08 Jan 2024 17:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38HacZQwKCIMuhipolz0lmhunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--nabihestefan.bounces.google.com>)
 id 1rMy6F-0006nM-PU
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:28:03 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38HacZQwKCIMuhipolz0lmhunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--nabihestefan.bounces.google.com>)
 id 1rMy6E-00046R-0J
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 17:28:03 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dbed6083a91so2596480276.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704752880; x=1705357680; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
 b=pA22jOnFrEw2vVBVk+WoLEJ7Eaan1V02l+PivOAsi0HAChlnj0nHDBZorSz3eqK8Ew
 IFYkkv0y6ILBmzl9tlWkroswekWF/fWxX2Ip7f1G5MD26JZjrf9Cp/Sy9nEhWTE/UER1
 F0F3AffyCEonNEp9ExrL+qDgjkkqx2uUBVX44y0JZ4lbDqcGNc405JxcWY7UguphgOUF
 36dJPW/U2HGjdyJDiHM65dSWTbioaB8BCQPbYh2gFVrXPRQvAleNVwlEHWS9pnP5ABaM
 t7OF22vtuRrYm335tZwMxndmNPlKGNvBhtZGjgbUvCWtRr5YUnHUMbGHkefMFZinMGl6
 Q/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704752880; x=1705357680;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6iBOMgf9hpZYop+0lXsFMKyjLJAgDOQNMwHSzA4Z+UA=;
 b=D+EEtL9y4rhD73Yz0bb9Vk/Wd+3o6mMWZcEdWt9Fuaz9h5ETYL9qH2ibuljOcRN194
 wm5r86BhdZcfuX05NZx5crtL75UnGmHbt7MhVuB2pCvifzEVls2TcgeXOM8D44b6+Yhd
 BiJBz15fBtap0PEMkJRz4SzJLThM/Gi1jdS9UN7alV0Paf7D30Y7D8jS7GGx0yVwGSo9
 wDx2se3EtA+VElgqYeKWPX5kKEJhnw2Qc4bhsMolNLnW/s2HCIVhvjxwPndoNdDUxhKh
 mVshDK+x4+75Zle627sulhaL/YLJxV6449yNviMMwvbCJj4T9IKzgWv7hJVIeC6wJZnh
 2/Xw==
X-Gm-Message-State: AOJu0YxVQrqdjYHh6Sv+9VetgAAsj1nBtaz/hRV8wvbN4KI7uWQoYLy/
 9Ha8TTzI8+XxFKdiSt3KYmvHmQaw1ayjMs9PxHiKtRn92g==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:bbce:0:b0:dbd:7254:a62a with SMTP
 id c14-20020a25bbce000000b00dbd7254a62amr1692073ybk.12.1704752880419; Mon, 08
 Jan 2024 14:28:00 -0800 (PST)
Date: Mon,  8 Jan 2024 22:27:42 +0000
In-Reply-To: <20240108222747.2453106-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240108222747.2453106-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240108222747.2453106-6-nabihestefan@google.com>
Subject: [PATCH v10 05/10] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=38HacZQwKCIMuhipolz0lmhunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: wvgkfJfs47of

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

