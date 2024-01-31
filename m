Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1164915ejk;
        Tue, 30 Jan 2024 16:26:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG78432Df6k1jdJU85UYssyEIOppAlQLfXSf2h7mdnvNXB9/I9nbzzsZyoZ7cHzX24Uf2yb
X-Received: by 2002:a05:622a:1827:b0:42a:b8c0:20b9 with SMTP id t39-20020a05622a182700b0042ab8c020b9mr103611qtc.28.1706660793567;
        Tue, 30 Jan 2024 16:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706660793; cv=none;
        d=google.com; s=arc-20160816;
        b=0+T8IQELHP4yg5T3OlXP5D/b8mR68IVwqHieZBoWTChx5ZQuLj+rT5WuJSlwbKTpUA
         tNWy1z2p43DwOaAg/fpz6ytNgZbKdODEFEKNZMEj618kHF4QX/v9X2iYEn8DLgqjgm5D
         yNduuMDcxVSDPuemKJiA6Hirep9+3ce7mhfGCSCv0xmwftV3ZWXcrn8Tm7SmZ6XZcFIi
         AHp9piU0zo1DaxoDQuUu9QQ9UWZw+VXHH2gtLA8B6bJwS60aZN9o3y8EwyohYvFzHVIG
         Wbv1WHyG55DKRXILSPxoAgfHD+x/IoEZHu3yImDDUNbq6zuAtZasLAoLV7A/FSX8wY3W
         kNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=kZzIY1+s/gVdLPSvOlCyIRNzyGtETgLGcp0duDdF5l9HDRuOFdYcppQNCzyea+ljpq
         txEM8HDs6Z2ulvuhUPM7nb4QK5BAAKet9G3vzdxU6XSeXbelAKNBAWhdgm4lUD00seHj
         nkKg51spBOSNRqyGZfPuB8LSbTHGm1okIiImd/tKvJ72tOwa/iHtsnwfox1lm71AUp1X
         nlYOEEmSYYmBCsDRzjXgm3xavwggD5vgx5jX94FnuRwwYPFWjqgtwuSRY8c/TD81qefv
         zOJs4MXQfyPZ/46y7D/UPISPjm1keoxyqUMVMkNwCqusZ060pajyx6DNkooft5LhiBbk
         C2QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3+fchUnm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020ac87e83000000b0042aac1aecf6si4243566qtj.18.2024.01.30.16.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 16:26:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3+fchUnm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUyPx-0002Gp-OG; Tue, 30 Jan 2024 19:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cZO5ZQwKCrIfSTaZWklWXSfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--nabihestefan.bounces.google.com>)
 id 1rUyPv-0002Fq-Gn
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 19:25:27 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cZO5ZQwKCrIfSTaZWklWXSfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--nabihestefan.bounces.google.com>)
 id 1rUyPr-0003pH-DA
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 19:25:27 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dc6b9f4a513so516459276.3
 for <qemu-devel@nongnu.org>; Tue, 30 Jan 2024 16:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706660722; x=1707265522; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
 b=3+fchUnme7xDc5Fn5G8Up4f43w6tGZpYEInVAJAjAa+P1KcgobUAXJBNXjNXQYiKGq
 HtuP+1AaYDRbr1FxvuaBUvN6xQJKw/UKI+9utBuC/iHTZMzze5tAav1ghat7N4/a3fVM
 IvKkVftwzEB/F2KtPDKzaIMNtozakM+ozOI6MLqt7FdzHfIjzETSYW4rzUJY4VcXPBCk
 PUAXxZWTFhSZ0thiKiUHiPQkECp+fK6nQgJhvLcytXnkPth2s20LMExSNQ/pWAW23jr2
 8MmPf7G6UkJgNypsNgLJ7i70rHbhSixhGrs4ykC4swz9a+NoW0GifI4v2koh41GfabAl
 GKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706660722; x=1707265522;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6F7rO+7krLCvhDJo4uvkVmaeeAVFf0JOG0PEBpkkzu8=;
 b=tlaQzVX5+gDzpQJhU5hSRPn6rV/Ze3GPHHcaOvb2P+ZMh5ZSkZv8nl1NyGE+VMM368
 m8HTxvJX5iiOb7HDYDCYO62jfsVibzd2SbGiWBbOcr6okk1+LSka7d2aDtY1qhEqnUAq
 tBwz8jYSX/c7/BkfW3g/bsWtATa35flRRLpj9iYPgm3j1HllTK3w7WU6f6FcOGGrDYVD
 r9XBDfedMWWIilz3FOg1Ytp4BnTsYnvFGR+mqH7uIVF75Qgh7PLd/lC41BM9DXT5jsLr
 S9fINQpLSWm+ZV+91RvvDtSVOv0mmNRoWRkeFiSkH/pRiKvqNKwj/tFdtJz9USjfMHpx
 M2Kw==
X-Gm-Message-State: AOJu0Yxkg/dgxuh1V/OcklOjL4vT+eejNP81Gf+aNSWNO3M8uMgrxkIl
 w9GMvv064eqVdXkLDQEA/zopwEaYo9/wQB43F+BLb7YB9/x2EKpa2qS5zu39eq9NBMN2f5tfKPC
 205YWj+6MMFmEp9HE/h6QZxHJ1A==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1b10:b0:dc6:9e4a:f950 with
 SMTP id eh16-20020a0569021b1000b00dc69e4af950mr48403ybb.3.1706660721860; Tue,
 30 Jan 2024 16:25:21 -0800 (PST)
Date: Wed, 31 Jan 2024 00:25:07 +0000
In-Reply-To: <20240131002511.986787-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240131002511.986787-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240131002511.986787-3-nabihestefan@google.com>
Subject: [PATCH v16 2/6] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3cZO5ZQwKCrIfSTaZWklWXSfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--nabihestefan.bounces.google.com;
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
X-TUID: UIdwW/IbfLbb

From: Hao Wu <wuhaotsh@google.com>

Change-Id: Id8a3461fb5042adc4c3fd6f4fbd1ca0d33e22565
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/arm/npcm7xx.c         | 37 +++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h |  2 ++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index e3243a520d..3b29206265 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -84,8 +84,10 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_GMAC2_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_PSPI2_IRQ           = 28,
     NPCM7XX_PSPI1_IRQ           = 31,
@@ -229,6 +231,12 @@ static const hwaddr npcm7xx_pspi_addr[] = {
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
@@ -456,6 +464,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
+    
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
 
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
@@ -688,6 +700,29 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
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
@@ -750,8 +785,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 72c7722096..4e0d210188 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -29,6 +29,7 @@
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
+#include "hw/net/npcm_gmac.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCMGMACState       gmac[2];
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.43.0.429.g432eaa2c6b-goog

