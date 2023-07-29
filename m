Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1328533ejb;
        Sat, 29 Jul 2023 15:09:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEKIsaJ/z+4ObcGj+Sy66T0zqsdwtysngZKphIIUPiPstWxdmZqy4pz/53cZN0KsfF+Q7TB
X-Received: by 2002:a9d:7590:0:b0:6bc:30d6:cbb6 with SMTP id s16-20020a9d7590000000b006bc30d6cbb6mr6601510otk.32.1690668590332;
        Sat, 29 Jul 2023 15:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690668590; cv=none;
        d=google.com; s=arc-20160816;
        b=iW2laJvxtxgK/1dH0fWpfHYA4ZaKO60QRoH1I86vib+o7ZHZOs69JBqMc5j6gRGZJ1
         UDoGzv0bjKOPpmWN5ihVmHR7aKj9w6LvtQcaP4ulVWk7tusevXHdhF9w9ubOV7SmCmf8
         1JBoQp+nk6GfOUSb1IHzp6vLPuZ10Yys+SToNb76xpwbWpD5/nHYLy9mt/WNIWxZu1CA
         R4nnvUyu8Mp2aQN/j03z+Kn6vOaBclkuCGG2LPHC2aNgHZ8+Vnk2IXhfxYVFWNhH6EaE
         iTmpaK+4UAYX1ro0ZtdtfSzR4V2Qv/TR8UaCzCct5gse4quWh43LPHdn7tru8UJN3BgN
         ajAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Og2TPsrv1/jGXkIhvcBSjWJ6FkXrQUjJ4l7oOTAUubM=;
        fh=+WBZG3uX9FXOqUEW7dRrAA3LgeoMrjfTvks8rWRkhTI=;
        b=eK1E37JPJXAcYlvXumo4X+HgFJ6Ze7v6fYRIngo8X5/xtRhf9/LyNT44f8cJMuMTSo
         kCcV1nR66aF8/fK0nvtHlr6P78aX4ay1VOnTrOG73joX/Gi1IevLbfWtV05AOKVUT0sC
         NAE0OoO1VwWrrgS8AjB2EeztyoLxvnGnHsPbY6CnOJSEj/USbWiyLz7VBMibwg2Ol6pd
         mFpf3ZlB965FvUsDaBmCuQ1yOYnrSXJ4U6k6FVq2Izl5BQamG4uAuokhm3TNmO7n4mAN
         hCY1Pm8vDI+7j38sCGww7qeqSz1oIBOkO3G5nxK5awdcUNBmlVep4x0wmfCWxpAXLy0m
         Jp0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a0cf18e000000b0063d27e0ad4esi3909242qvl.421.2023.07.29.15.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jul 2023 15:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qPrKQ-0002kA-RE; Sat, 29 Jul 2023 17:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qPrKP-0002jA-Fy; Sat, 29 Jul 2023 17:18:21 -0400
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qPrKN-0001hL-Mt; Sat, 29 Jul 2023 17:18:21 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A6311C0005;
 Sat, 29 Jul 2023 21:18:17 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] Add i.MX7 missing TZ devices and memory regions
Date: Sat, 29 Jul 2023 23:17:59 +0200
Message-Id: <17730ec23735a3bd6cc1ac2445be481b73e87d79.1690663106.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690663106.git.jcd@tribudubois.net>
References: <cover.1690663106.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::225;
 envelope-from=jcd@tribudubois.net; helo=relay5-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7Si6JYYVazYF

* Add TZASC as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device
* Add CSU as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device
* Add various memory segments
  - OCRAM
  - OCRAM EPDC
  - OCRAM PXP
  - OCRAM S
  - ROM
  - CAAM

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx7.c         | 63 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx7.h |  7 +++++
 2 files changed, 70 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 3bb0da6850..7ca105fd24 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -666,6 +666,69 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pcie-phy", FSL_IMX7_PCIE_PHY_ADDR,
                                 FSL_IMX7_PCIE_PHY_SIZE);
 
+    /*
+     * CSU
+     */
+    create_unimplemented_device("csu", FSL_IMX7_CSU_ADDR,
+                                FSL_IMX7_CSU_SIZE);
+
+    /*
+     * TZASC
+     */
+    create_unimplemented_device("tzasc", FSL_IMX7_TZASC_ADDR,
+                                FSL_IMX7_TZASC_SIZE);
+
+    /*
+     * OCRAM memory
+     */
+    memory_region_init_ram(&s->ocram, NULL, "imx7.ocram",
+                           FSL_IMX7_OCRAM_MEM_SIZE,
+                           &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_OCRAM_MEM_ADDR,
+                                &s->ocram);
+
+    /*
+     * OCRAM EPDC memory
+     */
+    memory_region_init_ram(&s->ocram_epdc, NULL, "imx7.ocram_epdc",
+                           FSL_IMX7_OCRAM_EPDC_SIZE,
+                           &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_OCRAM_EPDC_ADDR,
+                                &s->ocram_epdc);
+
+    /*
+     * OCRAM PXP memory
+     */
+    memory_region_init_ram(&s->ocram_pxp, NULL, "imx7.ocram_pxp",
+                           FSL_IMX7_OCRAM_PXP_SIZE,
+                           &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_OCRAM_PXP_ADDR,
+                                &s->ocram_pxp);
+
+    /*
+     * OCRAM_S memory
+     */
+    memory_region_init_ram(&s->ocram_s, NULL, "imx7.ocram_s",
+                           FSL_IMX7_OCRAM_S_SIZE,
+                           &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_OCRAM_S_ADDR,
+                                &s->ocram_s);
+
+    /*
+     * ROM memory
+     */
+    memory_region_init_rom(&s->rom, OBJECT(dev), "imx7.rom",
+                           FSL_IMX7_ROM_SIZE, &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_ROM_ADDR,
+                                &s->rom);
+
+    /*
+     * CAAM memory
+     */
+    memory_region_init_rom(&s->caam, OBJECT(dev), "imx7.caam",
+                           FSL_IMX7_CAAM_MEM_SIZE, &error_abort);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_CAAM_MEM_ADDR,
+                                &s->caam);
 }
 
 static Property fsl_imx7_properties[] = {
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 306fe3ce66..6138221350 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -83,6 +83,13 @@ struct FslIMX7State {
     IMX7GPRState       gpr;
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
+    MemoryRegion       rom;
+    MemoryRegion       caam;
+    MemoryRegion       ocram;
+    MemoryRegion       ocram_epdc;
+    MemoryRegion       ocram_pxp;
+    MemoryRegion       ocram_s;
+
     uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
     bool               phy_connected[FSL_IMX7_NUM_ETHS];
 };
-- 
2.34.1

