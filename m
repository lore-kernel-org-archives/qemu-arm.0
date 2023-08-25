Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1356131ejc;
        Fri, 25 Aug 2023 05:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErBB9lTm25q/ZGElH8YXiwYEC9EczCkkTDGbwFAqtymZLZcySukbx9OnzKQaKwWeRkXUKe
X-Received: by 2002:a05:6512:3b9a:b0:500:7fc7:852f with SMTP id g26-20020a0565123b9a00b005007fc7852fmr14260746lfv.39.1692966169950;
        Fri, 25 Aug 2023 05:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692966169; cv=none;
        d=google.com; s=arc-20160816;
        b=kfPkbSBMhPrSrzrCyiYbPkocQHWblGVOB7dkmBQ2DfuYk/xfih1+y9tHoCHM/8D/GP
         R6bGzPiZAMf5e3kmPjSDfmE+y3yQBYK8q+rmGDKczCVTKRn4NxlXwosEAJweTHBx0hOE
         Uas7QtRLbBVBOydVhequOb1EOBbHmJgjFTWvDxqAYr2XtHt3xTARgu8a4MO+l9NTGG26
         3yVwTR8KXfQOEfsGG3Ytkqc43cmk/78s1iuhCDfRs9WIUUNIWPrcL6AQAOpVw2imOdHt
         ablSeu909wNEzUNw0QfJ2d39NN23HqmuwPtr89+mZofTbtMXuzC5F/99MMRoWh55wioq
         Ab8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BTnJRlq4lb6YZw45NBqNWrvjeAwJ1d4pC8xWRDafEEo=;
        fh=93SjCkkBiUuyIB/rn91STPSZDdbsXlhhRtKHEoLqHpc=;
        b=vXoB8BFvgtk5xDCoA0+fOSx82yItjEhU22QGcwiGr0PDi+lv3bOAK4BkOCE+8R4OOO
         eufgCtp0atM3k1J/Yi4jCryV+0R1+X2iFXF8Zuq6v03N5An6ImisK68c6204RADm+n+I
         1+5v1zNddX4E22K8luFbjPfgMw133BCDAEa8BsyXKjvd9GAXKtpn+/FS2QqxWfGn/uH+
         c3gbPpNYVC5s/x5UNpyPJnjoJrsOQ+BAerIDhcj+/h+cNMUYAyzTSzcw4HaAKwnpmb5f
         HHgxxgqLMXhlhFUfgqRt0xfFGkmK2e0kuP4GLwx+98gpNPrVzhfqqQRjxCBMBsEPlcVE
         rETA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a1ced03000000b003fef4570aa9si2349571wmh.48.2023.08.25.05.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Aug 2023 05:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZVp3-00042O-Cx; Fri, 25 Aug 2023 08:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVos-0003zU-2K; Fri, 25 Aug 2023 08:21:43 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoi-0004xm-Tu; Fri, 25 Aug 2023 08:21:37 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8523260003;
 Fri, 25 Aug 2023 12:21:26 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 5/6] Add i.MX7 missing TZ devices and memory regions
Date: Fri, 25 Aug 2023 14:20:55 +0200
Message-Id: <f887a3483996ba06d40bd62ffdfb0ecf68621987.1692964892.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692964891.git.jcd@tribudubois.net>
References: <cover.1692964891.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=217.70.183.195; envelope-from=jcd@tribudubois.net;
 helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iNL3p7NHxhzE

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c         | 63 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx7.h |  7 +++++
 2 files changed, 70 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index e976053539..97e982bf06 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -664,6 +664,69 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
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
index 06b2c5e4ac..01e15004d7 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -84,6 +84,13 @@ struct FslIMX7State {
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

