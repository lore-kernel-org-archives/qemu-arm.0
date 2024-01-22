Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2639416ejg;
        Mon, 22 Jan 2024 09:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkJvgj19VpTZj5ep36l03LyVZpBMyBUhiFUds8SFQ52m7RgqIpKhqC/6E0tzUYdjy+nfPl
X-Received: by 2002:a05:622a:c6:b0:42a:3ee5:d8c9 with SMTP id p6-20020a05622a00c600b0042a3ee5d8c9mr2526437qtw.1.1705945090802;
        Mon, 22 Jan 2024 09:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705945090; cv=none;
        d=google.com; s=arc-20160816;
        b=v1RPAYN1yEBu9BpwYBaVvqr5EHAbXyHu+cARloXjcG+b8f7qzqyzbqGNJnE9//8T3l
         TacXqfcTM+3prk0LjOhQ+jtIpl68zWHGh8IPyIPkQnz/pJ22pAUsHRJR7hwqBnArv3Cf
         vWKZlcNhNBLCDRm0Wtly/I7FHLeKusju53WHX5aF4/IJnnRP2Cz1lqy62hzOZXtp5xeZ
         1HEirQo1yISe5fpxD65qiqSGoieY3Z6ptCsjmsHLpjC0lxSHRrcWXYuNGFpn9V6O24/R
         xNfq7+Cm9E8e6+pZdfoPWpAKgjSa2FEHg0wrWFxSLKWx6M4MguCunU213d3wgQLBFqkw
         wfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=vw5t08FLRvzfKUK6zIqDGoACTkakXqTjk4bs2E9N63Xo5a0/FiY4rgWnabBNoN45UL
         uQJackAXIKnbDT3kTmSxFGDQeLZd/dI15znHM/er+wWHL5Zf0XvhZqroh+qbV4fV90yN
         alBgrffj6rZBVYxJbTEkqhfr71WTR2Bl//ejlZNJEUkj8kBBxUrg9Hdvhl2ObCvnt7rt
         vwVK/Vj1TX5n3oZZ/nQb+1Y8jvpSJcA+7hSXQCF5DcQ79giYVmfuK6KJVUcvhL1Mtevu
         CDzQ4fEKGlw/4fPhqIM2Hz8IVttBkgwb4s6w20au8+mzwXtIt5CWVvboVk2Q5sQ3zwFA
         Y02w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0nJWPKb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac87f08000000b0042a286a933asi5980234qtk.183.2024.01.22.09.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 09:38:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0nJWPKb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRyEk-0000BE-JO; Mon, 22 Jan 2024 12:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3z6euZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rRyEd-000083-RM
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:24 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3z6euZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rRyEb-0003zd-V8
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:23 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5e6fe91c706so55390787b3.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705945039; x=1706549839; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
 b=0nJWPKb1qy2Lr23kHwNjXfe3mQbxm6SFCjQM0wT4N5aX7uc55AFVUKWtw+vFxo9UEE
 gdjh8RWoPEnSylp9iUCnqFyTo7FaEra/bIvZ824fWA7ga/Iq4RWfWNHuvk2pd3dm5AaV
 BlibtK2qfHLlCNz///fgbY7GFtfau0wb3Y7bd3MyxZi29wDFNQ5NL8Dp3GN03hx7xEPu
 x4opkK+QQJ/t2yQqzhJ/BSIo/Ot9dNuC6VHEwjPj/zzhjbSv3GOIHXS5Lcbda9YRdms1
 EzfR/Kmq0KorucOglhQNYMFoRMXlcGls2XouUXaPgArKHv8h2azCEdYlj9+AeB/X5nyU
 XASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705945039; x=1706549839;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ3T1Pzlo5D5DrPDXz0m8rxjH12isVXvtRtjRQW4f40=;
 b=RRhqbcRKclHVoRFjPlVRA/ne41kmfyG/bDTpzKWVzMoxd7SjKdCmMph9lSbpBqYW30
 mSWAMTKrfmd26cDEJorBAKBjgssk7SIC+zY9AJXGir5Ea5cuZyOu8D14hGGAGv5V1KGu
 lvy9PrSAI6i3kawdSH0VdYpUNDBXNNo/99xrBBZjmU82ogPhBTaGY3FOyE8ZXwBlDCAX
 ofO5PBnMgxhZOa/N/Fet70gmt6i4K+fGQDcjVTKERdPrOuLrcN9Hh10R73RlrtWeaeCr
 wHPr6kU6hJCcMEJ3CBzKrlh601VXZm+eODrxe1VEjiT7Tg3o9G1PAEBeiPXVZgujMnjc
 rxOA==
X-Gm-Message-State: AOJu0YzodQsEN3f23oYRqdaohrIvi8n4YEeOhkCR95oG55zngWiAd0Hf
 nXrY8qzE1wb3S2VdzmqUfE6fYAB1hk+G+bYY0FE54QI+seDaVuyu0i08vLPEjbIH8johKmcXxKO
 TT37xuJcWI7rHxDTyLybs1kL5qw==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:4c56:0:b0:5de:9c9f:3ee4 with SMTP
 id z83-20020a814c56000000b005de9c9f3ee4mr2255644ywa.6.1705945039387; Mon, 22
 Jan 2024 09:37:19 -0800 (PST)
Date: Mon, 22 Jan 2024 17:37:02 +0000
In-Reply-To: <20240122173706.4019545-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240122173706.4019545-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122173706.4019545-6-nabihestefan@google.com>
Subject: [PATCH v14 5/9] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3z6euZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com;
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
X-TUID: W7i/a+qMq16q

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

