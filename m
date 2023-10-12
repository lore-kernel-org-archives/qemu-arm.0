Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp764530ejc;
        Thu, 12 Oct 2023 05:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNb5lGYgvVvgPtTgBWIevjtQTp5aVh0zlBlOfFEvNp3lVlNtvVdVsBS4Ux5D1VJESNTeqo
X-Received: by 2002:a05:620a:2a10:b0:775:ed1e:26d8 with SMTP id o16-20020a05620a2a1000b00775ed1e26d8mr20966186qkp.31.1697113231418;
        Thu, 12 Oct 2023 05:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113231; cv=none;
        d=google.com; s=arc-20160816;
        b=0yGDM/oN7MdUSqlCeSVJUi+ylY11rlPIJE92zHzg+Lvz4d4t+ELxqWKmzXHYXbrAr8
         j1K+Qc7XkJ1Hcmg+LbDqkd39hV+BJ4kYSGr3TB20OlKeQyyR+vcHug7duwPyCvZVUfsi
         GgP71oPcZXDyqx1rHIs5oDGbCk5mX6zihZvNnw/LShY4pJTfFS1Cuq8Q7umjEipT5lFw
         aMmO4lzFKELsCw09GonUuvRB3nCGX2/ZJuxfx/ncakYpjXjYXqAugwgNHzCETwN7EYD3
         xDYooKIcilSPo845O/MCcLy02f2y6mYSjkfXx1hzkkyR6LOmy5RCRlsm96O4UZGxAm2o
         gHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lkSYPpqF0kOrJ1x/hHvfUb0VtYPx+2ipYoi3NSqd0/Q=;
        fh=uMYo3jOuXUsDthaXCE4/M6n3+voY5rtHQA7Grzg1cYU=;
        b=l0dh4bJ2oivbrTGTj6UzU1uz3aKsxMv8vLcuxAM+9NSfg6hJUXH5UQfRZ+nxbPYZUK
         bzg6owlaxole3TutG/tCuMAwq2foAykSnT04/MW3LrNcwbQ1Sd9H0c0Hr/C/36XB/ugC
         S+wsofPsJrmqLhBKxBx8keQ9al2kie6xYg3CtTvlTk7DhnoEGDHYIZj9Qvd71wBlSLdQ
         Teu/XIL2qb1gCRuPrarObGbZ8GD8Cw22P3MQqe+AAs7EKVzUx74YPMSUXur5cFV7qXnn
         JQRDw9DxHfOEwGy/8gZNCPIoZd2C6yjMJVl0Eot7+1xFCq2G9kpBHNoNyWAUZ0PKqLgh
         AEaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnlVtpOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a29ce00b0077419b27784si11644584qkp.21.2023.10.12.05.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 05:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnlVtpOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqufW-0003mj-Kp; Thu, 12 Oct 2023 08:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqufT-0003aN-8D
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:56 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqufM-0001tl-GF
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:55 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53da72739c3so1556702a12.3
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697113185; x=1697717985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkSYPpqF0kOrJ1x/hHvfUb0VtYPx+2ipYoi3NSqd0/Q=;
 b=WnlVtpOEWs64M4VcMT1MHLkXWDsv9vh2rNlJiiV31gy5Dtax7CbnxpI6kzzlL7yTFO
 gMTtUk3xLewJxWFUpfE8pX+ubIqf9Fd4fA+85zlOYprOhkmNrp3yhvas1TqqekE1QS+D
 h8cTeH/FMPSjb8cgwIRNgAzzUytKxln7SZ0HuakzSO+EOE12wIpufh2tvPl+Gp8YMuwY
 HNnOi3dfhPd/BWVd3G8pkWU4Y2njFwlPcF+KPgQB82E+Fv1WA8GKpL8oBtQ8ZMdssBix
 I7AoV/R0AQ2/c+DbacToGIozTU96Z/gyQo0BwD8l1wXxcLXcbI/TpmRkcMhCRDph8m4i
 zhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697113185; x=1697717985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkSYPpqF0kOrJ1x/hHvfUb0VtYPx+2ipYoi3NSqd0/Q=;
 b=aK3PacAGPSRM9dwc2kkGqBNS2y9/9IS1TfJH2POFrb0tr/5WPidk1HgFQOV5kmGrVU
 g+8X0zp3/h+X0oWSOzUdBKnnkyCFV+xtRzrZZrYw1NFLlIW77W266hKFfWSgoBqlEXu1
 Abu/E5xeWpOZQlhzq2UjO3cIs4oW8rdhha5nuSgblrY/6AKaIiRfdEMvvRy+LcZYfU9+
 /0u/yxgE86Ho6sLJoL1DWcqbFQghCdECP1kWj/XO1/6y56BC7FGRq5pa47pwmZRGGa+X
 +ozFAM8AItFBn7+RXiheLGYA3RN0GJa9HYu7MtoIuVR4c2qxAesFUhLknZ58ze5cviAF
 rTIA==
X-Gm-Message-State: AOJu0YzBG32A3zcz732+fwSnp6Yhg/VQvVP3k5M0QrOVfsZ/0rm9/fsg
 toUqODaL05FnAwlBpHBc24O4Sg==
X-Received: by 2002:a17:906:10ce:b0:9a1:e233:e627 with SMTP id
 v14-20020a17090610ce00b009a1e233e627mr23525326ejv.42.1697113185506; 
 Thu, 12 Oct 2023 05:19:45 -0700 (PDT)
Received: from m1x-phil.lan (176-131-211-232.abo.bbox.fr. [176.131.211.232])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170906190600b009ad89697c86sm11081434eje.144.2023.10.12.05.19.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Oct 2023 05:19:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] hw/pci-host/designware: Move MSI registers from root func
 to host bridge
Date: Thu, 12 Oct 2023 14:18:55 +0200
Message-ID: <20231012121857.31873-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9yxMQqTSFkRK

The MSI registers belong the the host bridge. Move the
DesignwarePCIEMSI field to the host bridge state.

This is a migration compatibility break for the machines
using the i.MX7 SoC (currently the mcimx7d-sabre machine).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci-host/designware.h |  2 +-
 hw/pci-host/designware.c         | 79 ++++++++++++++++----------------
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 702777ab17..fe8e8a9f24 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -63,7 +63,6 @@ typedef struct DesignwarePCIEMSI {
 struct DesignwarePCIERoot {
     PCIBridge parent_obj;
 
-    DesignwarePCIEMSI msi;
     DesignwarePCIEHost *host;
 };
 
@@ -71,6 +70,7 @@ struct DesignwarePCIEHost {
     PCIHostState parent_obj;
 
     DesignwarePCIERoot root;
+    DesignwarePCIEMSI msi;
 
     uint32_t atu_viewport;
 #define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 2ef17137e2..6cb8655a75 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -57,7 +57,7 @@
 
 #define DESIGNWARE_PCIE_IRQ_MSI                    3
 
-static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
+static uint64_t designware_pcie_host_msi_read(void *opaque, hwaddr addr,
                                               unsigned size)
 {
     /*
@@ -74,22 +74,21 @@ static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
     return 0;
 }
 
-static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
+static void designware_pcie_host_msi_write(void *opaque, hwaddr addr,
                                            uint64_t val, unsigned len)
 {
-    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
-    DesignwarePCIEHost *host = root->host;
+    DesignwarePCIEHost *host = opaque;
 
-    root->msi.intr[0].status |= BIT(val) & root->msi.intr[0].enable;
+    host->msi.intr[0].status |= BIT(val) & host->msi.intr[0].enable;
 
-    if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
+    if (host->msi.intr[0].status & ~host->msi.intr[0].mask) {
         qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 1);
     }
 }
 
 static const MemoryRegionOps designware_pci_host_msi_ops = {
-    .read = designware_pcie_root_msi_read,
-    .write = designware_pcie_root_msi_write,
+    .read = designware_pcie_host_msi_read,
+    .write = designware_pcie_host_msi_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -97,12 +96,12 @@ static const MemoryRegionOps designware_pci_host_msi_ops = {
     },
 };
 
-static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
+static void designware_pcie_host_update_msi_mapping(DesignwarePCIEHost *host)
 
 {
-    MemoryRegion *mem   = &root->msi.iomem;
-    const uint64_t base = root->msi.base;
-    const bool enable   = root->msi.intr[0].enable;
+    MemoryRegion *mem   = &host->msi.iomem;
+    const uint64_t base = host->msi.base;
+    const bool enable   = host->msi.intr[0].enable;
 
     memory_region_set_address(mem, base);
     memory_region_set_enabled(mem, enable);
@@ -147,23 +146,23 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_LO:
-        val = root->msi.base;
+        val = host->msi.base;
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_HI:
-        val = root->msi.base >> 32;
+        val = host->msi.base >> 32;
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
-        val = root->msi.intr[0].enable;
+        val = host->msi.intr[0].enable;
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_MASK:
-        val = root->msi.intr[0].mask;
+        val = host->msi.intr[0].mask;
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_STATUS:
-        val = root->msi.intr[0].status;
+        val = host->msi.intr[0].status;
         break;
 
     case DESIGNWARE_PCIE_PHY_DEBUG_R1:
@@ -305,29 +304,29 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_LO:
-        root->msi.base &= 0xFFFFFFFF00000000ULL;
-        root->msi.base |= val;
-        designware_pcie_root_update_msi_mapping(root);
+        host->msi.base &= 0xFFFFFFFF00000000ULL;
+        host->msi.base |= val;
+        designware_pcie_host_update_msi_mapping(host);
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_HI:
-        root->msi.base &= 0x00000000FFFFFFFFULL;
-        root->msi.base |= (uint64_t)val << 32;
-        designware_pcie_root_update_msi_mapping(root);
+        host->msi.base &= 0x00000000FFFFFFFFULL;
+        host->msi.base |= (uint64_t)val << 32;
+        designware_pcie_host_update_msi_mapping(host);
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
-        root->msi.intr[0].enable = val;
-        designware_pcie_root_update_msi_mapping(root);
+        host->msi.intr[0].enable = val;
+        designware_pcie_host_update_msi_mapping(host);
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_MASK:
-        root->msi.intr[0].mask = val;
+        host->msi.intr[0].mask = val;
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_STATUS:
-        root->msi.intr[0].status ^= val;
-        if (!root->msi.intr[0].status) {
+        host->msi.intr[0].status ^= val;
+        if (!host->msi.intr[0].status) {
             qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 0);
         }
         break;
@@ -495,7 +494,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
     viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
     designware_pcie_update_viewport(root, viewport);
 
-    memory_region_init_io(&root->msi.iomem, OBJECT(root),
+    memory_region_init_io(&host->msi.iomem, OBJECT(root),
                           &designware_pci_host_msi_ops,
                           root, "pcie-msi", 0x4);
     /*
@@ -504,8 +503,8 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
      * in designware_pcie_root_update_msi_mapping() as a part of
      * initialization done by guest OS
      */
-    memory_region_add_subregion(address_space, dummy_offset, &root->msi.iomem);
-    memory_region_set_enabled(&root->msi.iomem, false);
+    memory_region_add_subregion(address_space, dummy_offset, &host->msi.iomem);
+    memory_region_set_enabled(&host->msi.iomem, false);
 }
 
 static void designware_pcie_set_irq(void *opaque, int irq_num, int level)
@@ -564,15 +563,10 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
 
 static const VMStateDescription vmstate_designware_pcie_root = {
     .name = "designware-pcie-root",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCIBridge),
-        VMSTATE_STRUCT(msi,
-                       DesignwarePCIERoot,
-                       1,
-                       vmstate_designware_pcie_msi,
-                       DesignwarePCIEMSI),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -704,8 +698,8 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_designware_pcie_host = {
     .name = "designware-pcie-host",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(root,
                        DesignwarePCIEHost,
@@ -720,6 +714,11 @@ static const VMStateDescription vmstate_designware_pcie_host = {
                                1,
                                vmstate_designware_pcie_viewport,
                                DesignwarePCIEViewport),
+        VMSTATE_STRUCT(msi,
+                       DesignwarePCIEHost,
+                       1,
+                       vmstate_designware_pcie_msi,
+                       DesignwarePCIEMSI),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.41.0

