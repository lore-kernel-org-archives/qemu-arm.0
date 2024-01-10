Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1359154ejs;
        Wed, 10 Jan 2024 15:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG12iCon6zAxsKxnjfnw9cNSZLP+8QqkoBD6z/bAx+Sc1gsrLj/IXnmLK6/PYWtd1AebDHj
X-Received: by 2002:a05:622a:18a3:b0:429:9749:5a88 with SMTP id v35-20020a05622a18a300b0042997495a88mr353218qtc.113.1704930240914;
        Wed, 10 Jan 2024 15:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704930240; cv=none;
        d=google.com; s=arc-20160816;
        b=LMB5ux3vtV9NDYO3mOZl2y+k+zZgRV3Di2We4XIzb8pKDTgdd2x2JhgdllOmi7SSz5
         yLDZqwEjjd0m8I0MbyUweozoA43GsWH2EGZFItkdexEYNYYVMcDUZSc5f72bO6ItMmVS
         0XKVF/qiE+dgg8bPOulzTZBFWEdUdQumUYWUKgm6Ed1yCnBG4ZSKd+Mu+dE1WIOrYcj8
         6P3I4uvskF+Ok+R8e4r9jFDG10Z2GgvR4vVtroP2d3FHLlrAq8/rD81XKqGcr0bSNr3q
         vCzSIGeLnoEAzITDMQo3y9M+AG0NIHhJ4O6bj66OxhR99avwZkBNO5vRauOxjRAz8au2
         0O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=LS/tK9kOWjhY8kCtORxL5yWX89oO+Nc4jzqjWqm7ZRk=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=b8xe71pwBhhm3ltm1gtEzmooNXSaIlJfX2VE6BviZaM9s3BLGIwAFxIIOC5Ki5TJsY
         MxkYP0AciMy8/WIhA4VKcqDbqXNh8f8/oQ7UDAnD7JLFcR80KWXXITzCe2BugcKBwik4
         nUat9b6Xw21d//gXBEk9oVsj36dAWcqHXDMO936n+64wK0CzCanGiGMY2ARt7ofGL6HN
         B6osOb4T4TbYv9SVHxPJAHMbVuYfNvvK7rHwf701LfHmGKb2yJ/ITywLAPF5lIf9Y/3g
         Nia+JdsoHcVN3tnlljD8FVXUjjgslZKkjkzDYIZpXPxsw0lCYSkca/IGOx3Cy/fXyFAd
         3udg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KsyzAJTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jd25-20020a05622a719900b0042588d183b4si5347260qtb.753.2024.01.10.15.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 15:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KsyzAJTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNiDn-0007Up-OZ; Wed, 10 Jan 2024 18:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3eiufZQwKCIEsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1rNiDl-0007Rs-EF
 for qemu-arm@nongnu.org; Wed, 10 Jan 2024 18:42:53 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3eiufZQwKCIEsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1rNiDj-0006dI-Gm
 for qemu-arm@nongnu.org; Wed, 10 Jan 2024 18:42:53 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5e73bd9079eso88429687b3.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jan 2024 15:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704930170; x=1705534970; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LS/tK9kOWjhY8kCtORxL5yWX89oO+Nc4jzqjWqm7ZRk=;
 b=KsyzAJTVr2rvsOQsfw+XGMBo63eSvRKb4B8f4djfbVUjuq9ZjAGNuDOr16H861t0fL
 s6G3KRJDBp7aEhVIoL4xvlWLCYXfu1aPk8FlvdwoMH/omdrN+ViVNYoDl5YGOZbXOXdn
 eWezpBFT4sIrLFWiemUw/Opuk2UIyLLpqiCq+DAxJ4jhP4McVWU5s8wjICFKyKJzONt1
 egV/u0FNgixgkzWfWQWd+TiYNe9K5ATfM0dq+PVMK5db3C5+PdH63Zvg3FNuNZi2Dmty
 p7ekStJqeZtx6qefGxFOKX40Saz8JSQIVEkjepW3vou6v61aktnkjWhClcShr8jl7LE5
 12Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704930170; x=1705534970;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LS/tK9kOWjhY8kCtORxL5yWX89oO+Nc4jzqjWqm7ZRk=;
 b=uEzgwps9FNrAygN77a4OryZ150iIil3ZmYII53yv4qZmJ/XhFkfQqhH6P+FJCiNePE
 kcc7iemUmyKq6AZq3bnvHGljjtG24jaFh23d+6CiPu7oMEgEui4YN/fDzhsIbytTFqvb
 8Dd5XefzIhfofkflk8+F4KHLEBwPeyiZ8bsktTx3tTQVQqskiT/wtu/2ipUJw7MVO2xe
 4XFm+W7XhBG1HM6Dm2TamDlFnY9zvBbfnri2Eza2RsAMtCzBdFVdS/xYTNqZAuulIIDr
 Pq3kp6LEb39keIfB0nZEG+TQKn31pg8gqbgEpYDNGl0cqGiVaLWUCAt248TE9EPgj2DW
 yFAQ==
X-Gm-Message-State: AOJu0YygHXZJJ6SLz0m9K65eZSzP5hut/0d17qjuI0SUXK+1ygNHeX+Y
 C1Vr05xcPwYiY4xWA2Ibiv/5abzT8x5BhCjUg5hFKZrjnQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:df4c:0:b0:dbd:b165:441 with SMTP
 id w73-20020a25df4c000000b00dbdb1650441mr176161ybg.0.1704930170200; Wed, 10
 Jan 2024 15:42:50 -0800 (PST)
Date: Wed, 10 Jan 2024 23:42:27 +0000
In-Reply-To: <20240110234232.4116804-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240110234232.4116804-6-nabihestefan@google.com>
Subject: [PATCH v12 05/10] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3eiufZQwKCIEsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com;
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
X-TUID: KlTRBbatv3xw

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
2.43.0.275.g3460e3d667-goog

