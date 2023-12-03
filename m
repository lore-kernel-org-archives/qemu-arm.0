Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2371555ejb;
        Sun, 3 Dec 2023 15:48:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzEt5nEhl60dqx1sIbUCiEIC3c6ZPRBksPUy+ye/IM2M2gXBkEdo2KBXxgVHL+bUlcmdk9
X-Received: by 2002:a05:620a:171e:b0:77d:98aa:f7d3 with SMTP id az30-20020a05620a171e00b0077d98aaf7d3mr4613047qkb.13.1701647297695;
        Sun, 03 Dec 2023 15:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647297; cv=none;
        d=google.com; s=arc-20160816;
        b=hWjhfo6O0EporgcTPm0RDXd58rkh9Rp/0ApZaHsqoD4PIjdsgGQtGTRPoPMdwYzvir
         /T/6f6Qpu25KdF6XOjsTJOMF+PMwQexrLCyR0N5Q/tF5GGkDRI1hjeK/muGvsNQIsibT
         4Ykopc2r0/9NIAtJeus5+ouV2YiXzmXjmbMTWt3SWTbfi7PDAO0wf4YG1X99Punqj3Uv
         8/1C+hzrav7TWIkJwQxvqjs0p8b86wa3vaceQ6ukaaAU8ZsfxRWG9X+omGuqCnfKlhKF
         geBYJXsApArV/ApyI9KFEb1pnWMXowvGTN4SL1l3lqZGsamTfJmBQJn+GDw2y9ZLzEjY
         36GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FgtBxKk/YnE0/ZchwODTjsH1Cpkh2DZnmTE8Tpp7q3Y=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=WRePjnyREGfOA6KS/UeIJchscs8mBTGKo3en5NFUfUzDu9PCePQzuSP6tC90pY60Lz
         BOreDQWcavtxFNJ2ygWv5wJY6/kiEtCd39/WuwycqVK2H3pwTiu2dRPkjNDpaGXZJdK+
         Erm0jvbKat6rCz7efW7b4inXm2dzvJn2Ox3ihrBXEAfuGn8hIPlIi5Z6c+c4j6sLg2NN
         WIzW7YRgicWi+tz5TQgloGv3rauEsou6B5m0uMfBW7XeRVGmQA/zsjsjt2yWYF/79fgh
         DA3Cn1EC9SwmRfSsJ2XYcMnJ0Dyol5XhBtrsc4PCbbe4eSmw5BBG1wxVhSrTyYAz2hKS
         xYCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnatsMvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020a05620a268200b0076f280e295fsi8666929qkp.429.2023.12.03.15.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnatsMvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w71-0007J8-Hb; Sun, 03 Dec 2023 18:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6z-0007FM-WD; Sun, 03 Dec 2023 18:42:58 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6w-0002pL-6S; Sun, 03 Dec 2023 18:42:57 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d3d5b10197so29306547b3.2; 
 Sun, 03 Dec 2023 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646972; x=1702251772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgtBxKk/YnE0/ZchwODTjsH1Cpkh2DZnmTE8Tpp7q3Y=;
 b=LnatsMvIaUBMhUH3JsYHRVT4DIFTB9k7cP2R2x6fzS0MYuREEBDFYfJTktY/TcDo8s
 8Q0w2P9nnQSRuIdqeuWfAibexLzG0IZkMzB1KwclrTiGlSXVcPmBusJhLGVqA/zAK+sH
 btym1mlx1NZP6WnVgDMxLfUalAjxRQj3ddSOrygg38ckMDRhvp+lZdvyirIXewCF4uhS
 Wx7h/aed0zOVobwfstMxvue9s5wb9nh7lN9IuR9yuJoAWaXsqd3D5dFQDdgSWNLEWJGC
 YI4RaeG5g4XGXuNANL4EqBQP61V2Q2XiRVAmy6HJyXYFl+EsTM2NfmCIiriJukQRIw+F
 V3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646972; x=1702251772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgtBxKk/YnE0/ZchwODTjsH1Cpkh2DZnmTE8Tpp7q3Y=;
 b=Cf7NFTOgPFJEw2/E6FW4koM8mvrCXkTpVeX2jexhJ2UY995/daNRCGOeCicjl27XAI
 7eipYdL8OmhL46tT5iJV29GkQbe6yuQj6GFlG+HCducgKHAIIhj1Yn3+VT64QSaK0SKJ
 eKwOSa9kJaCcg7G7t+D0nsqdECumzmfON2Cgq0ZrU+I6zd7zmkRvRN2hIrUMKjPeMC/D
 WjXSeCXzLOKxH8I14ImVI2Nr+y3jAYuM3zofHR+bQESO8FPm83P95Ha4C0T4COOMSk4j
 Mmij0RoavU1rj+Nved6g7/CgMHWZKItwLDIFJnMqtEWkC6KW8Harao4jz1isTqCtfCwk
 gz4w==
X-Gm-Message-State: AOJu0YyZO+lCtRHtNmIJp2WmZWV0RewMtsg7ru6p4YlWB/KFndsgWNHF
 GIePYK8rdWuS2tKV4TI+RBaBgfL8w/JaDA==
X-Received: by 2002:a0d:d892:0:b0:5d8:d93:f054 with SMTP id
 a140-20020a0dd892000000b005d80d93f054mr743638ywe.23.1701646972479; 
 Sun, 03 Dec 2023 15:42:52 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:52 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 32/45] Enable BCM2838 GENET controller
Date: Sun,  3 Dec 2023 17:42:00 -0600
Message-Id: <20231203234213.1366214-33-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: z2xvmr2hgotx

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 16 ++++++++++++++++
 hw/arm/raspi4b.c                     | 17 -----------------
 include/hw/arm/bcm2838_peripherals.h |  2 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 65a659c15c..d962999daf 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -47,6 +47,15 @@ static void bcm2838_peripherals_init(Object *obj)
     object_initialize_child(obj, "pcie-host", &s->pcie_host,
                             TYPE_BCM2838_PCIE_HOST);
 
+    /* Gigabit Ethernet */
+    object_initialize_child(obj, "genet", &s->genet, TYPE_BCM2838_GENET);
+    for (int i = 0; i < nb_nics; i++) {
+        if ((nd_table[i].used && nd_table[i].model) && !strcmp(nd_table[i].model, "bcmgenet")) {
+            qdev_set_nic_properties(DEVICE(&s->genet), &nd_table[i]);
+            break;
+        }
+    }
+
     /* Extended Mass Media Controller 2 */
     object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
 
@@ -231,6 +240,13 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
                                 &s->pcie_mmio_alias);
 
+    /* Gigabit Ethernet */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->genet), errp)) {
+        return;
+    }
+    regs_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->genet), 0);
+    memory_region_add_subregion(&s->peri_low_mr, GENET_OFFSET, regs_mr);
+
     create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
                  CLOCK_ISP_SIZE);
 
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index fda27d36cb..8aa8dfb087 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -64,23 +64,6 @@ static int raspi_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
 
 static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 {
-
-    /* Temporarily disable following devices until they are implemented*/
-    const char *to_be_removed_from_dt_as_wa[] = {
-        "brcm,bcm2711-genet-v5",
-    };
-
-    for (int i = 0; i < ARRAY_SIZE(to_be_removed_from_dt_as_wa); i++) {
-        const char *dev_str = to_be_removed_from_dt_as_wa[i];
-
-        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
-        if (offset >= 0) {
-            if (!fdt_nop_node(fdt, offset)) {
-                warn_report("bcm2711 dtc: %s has been disabled!", dev_str);
-            }
-        }
-    }
-
     uint64_t ram_size = board_ram_size(info->board_id);
 
     if (info->ram_size > UPPER_RAM_BASE) {
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 20b7d1eb67..1cfcf5dcce 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -13,6 +13,7 @@
 #include "hw/misc/bcm2838_rng200.h"
 #include "hw/misc/bcm2838_thermal.h"
 #include "hw/arm/bcm2838_pcie.h"
+#include "hw/net/bcm2838_genet.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -73,6 +74,7 @@ struct BCM2838PeripheralState {
     UnimplementedDeviceState clkisp;
     BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
+    BCM2838GenetState genet;
 
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
-- 
2.34.1

