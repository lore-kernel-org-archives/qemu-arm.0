Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2046679ejb;
        Thu, 7 Dec 2023 18:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF97/oCYhfbQ5LnmX09ky3BwZ0moY7B9GE6wviPjocibToNqHL4pnQIJP2ic8y+rXcIvtOp
X-Received: by 2002:a05:622a:148b:b0:423:b9fb:44a3 with SMTP id t11-20020a05622a148b00b00423b9fb44a3mr4325622qtx.64.1702003226780;
        Thu, 07 Dec 2023 18:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003226; cv=none;
        d=google.com; s=arc-20160816;
        b=FlAw3ARnFLaKcoxQ82aTSYLumo2W6LbxUP1eYqK+Vb8v/qVZukyxU2UBKML1Du+cWd
         VryuojgExic5aOjk+o3wqwsVAQ6vctzzKt69uGfWr8BQX/ddpC57pkmwR4sKFG+N95qs
         XS4o/A/xzfaTmeIp5fFcqd9iv9z/MUeKhhfjdJQeQdH94PQ1qgvwJNq2FSAj3czBw6I+
         02/Vye4O8IwUiRy/BZcVYZ5VGQ8mlyDxU6hfBIYWYYE9GsZAcO6CJqh83d2LJRZWlyFe
         fVEYzQo/X+1KXzZK9eXJ8ryQ8khjTxJiB/ly3ypFwhlITtcXYHLcmZXZrqA9IYugIhYZ
         bAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wFeuloyQQG/pWB1qNvNMADuHoBFz7/WggqgaHUnwlWg=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=rNJbEXul1TD/sYGHfrnCvUI4TBFNXjAVEkgOPcyLvJzdAGwB2KKsH4zn+jET4SUTWD
         1l1uPYDmU9phyJmjanRkFw9PH8DZBa0LiBq3eEcFw1YD55Dou6c6Mqmp2s/VsUy777pc
         hamshpBpA/8Sgm9oouVLdOPfggA4o7JQEHrwKmjoCnGV7cXYXcM1XTWTVNgn0gMv7xD5
         cPeSskGk+jffPPHXIwOWXPBHHgQ1ZSbH2dXxME4kQYlya8BF1pRTzVKB/mfNWX4Cx8AL
         FHnwK6E39uXfYhLaunqQ1WoWlyN57TX0HWg2Zzc1xZdocmItYkeUD+Si6N9UnVkx7tYN
         lmGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2oCh4To;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff5-20020a05622a4d8500b00423941d3e26si1334271qtb.700.2023.12.07.18.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2oCh4To;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQfW-0004EN-Ne; Thu, 07 Dec 2023 21:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfV-0004DQ-5e; Thu, 07 Dec 2023 21:32:45 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfT-0002U2-AB; Thu, 07 Dec 2023 21:32:44 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so22522041fa.3; 
 Thu, 07 Dec 2023 18:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002761; x=1702607561; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFeuloyQQG/pWB1qNvNMADuHoBFz7/WggqgaHUnwlWg=;
 b=G2oCh4ToxtDpx4+0ClPou+/gYHZTqZkyK8sikUkdjXQr0wPS14fx5fBQbqfkImnv6D
 RyCfi1Eu6lSaTABAQ3QgR77I0ShLCpP4QC6Lbkl/5hHfz0AyOScnY3dhvfhll2zCPYVc
 Vt/1TLQSb9xfq7U+17gvgRmtJP6dcAZQCHKqlvhMMu5WxOFaMk5coOx6ksP5JBTa2YPd
 THUWEY6f6GggPPIJ0cgvvRU9mZL57Xs0NiiYDq81XUOBlCiapVJ91rzwxe9kYibw0zDl
 rHew1bR4x0HJCwk+J9H4WEtcO+oFjFytduQ8hzuClCU5eFeZvvMBjJq4Zd/Db7Ml+OZQ
 NoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002761; x=1702607561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFeuloyQQG/pWB1qNvNMADuHoBFz7/WggqgaHUnwlWg=;
 b=SfUAzHRTGMQPqZdc/nvndHfSUCGRXyjESqg2Wt0JEiBppDQvL9XrN6Ok++l3CHo+So
 x2i4Xkkf2R/85hxTdMcantcbZGrijs2rR4Nkxg5MSEz50ju/C7iMkU5tG+Hf0+h0Wk+X
 /ZyPn0IP9TEAvSOG6LK8M1YHVuF5Cea3Xw8c7F6XRN0yOBC7J2dFztnuIGpvsr6ZyPFi
 eRgI+BVbmPeU9kKeIXVEnJ+HLXWRjEPWEejvwtB04Yk/lncrF+0cPcPgHALmlr+f7FUi
 dzqZJCAgFaoZ0suXWBXjCYgMdMl6mcjrRId8p+n2Nr1NzCGu7kXOVqctJr+IeO+D7gXS
 yfsA==
X-Gm-Message-State: AOJu0YzZxLuPETIAKi2FpjyPWi/IiENISN/DFHXUqju3apt0uaC53i6d
 bsEsgoS54fEGAijzVwoLmbAUtMcacmYqmA==
X-Received: by 2002:a2e:80c4:0:b0:2ca:1bf:dc7e with SMTP id
 r4-20020a2e80c4000000b002ca01bfdc7emr1941413ljg.77.1702002760943; 
 Thu, 07 Dec 2023 18:32:40 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:32:40 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 14/45] Add BCM2838 PCIE Root Complex
Date: Thu,  7 Dec 2023 20:31:14 -0600
Message-Id: <20231208023145.1385775-15-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: bC2j1KWZxd2d

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_pcie.c         | 74 +++++++++++++++++++++++++++++++++++
 hw/arm/meson.build            |  5 ++-
 hw/arm/trace-events           |  4 ++
 include/hw/arm/bcm2838_pcie.h | 53 +++++++++++++++++++++++++
 4 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 include/hw/arm/bcm2838_pcie.h

diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
new file mode 100644
index 0000000000..3b4373c6a6
--- /dev/null
+++ b/hw/arm/bcm2838_pcie.c
@@ -0,0 +1,74 @@
+/*
+ * BCM2838 PCIe Root Complex emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qemu/module.h"
+#include "hw/arm/bcm2838_pcie.h"
+#include "trace.h"
+
+/*
+ * RC root part (D0:F0)
+ */
+
+static void bcm2838_pcie_root_reg_reset(PCIDevice *dev)
+{
+    BCM2838PcieRootState *s = BCM2838_PCIE_ROOT(dev);
+    memset(s->regs, 0xFF, sizeof(s->regs));
+}
+
+static void bcm2838_pcie_root_realize(PCIDevice *dev, Error **errp) {
+    bcm2838_pcie_root_reg_reset(dev);
+}
+
+static void bcm2838_pcie_root_init(Object *obj)
+{
+    PCIBridge *br = PCI_BRIDGE(obj);
+    br->bus_name = "pcie.1";
+}
+
+static void bcm2838_pcie_root_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
+    BCM2838PcieRootClass *brpc = BCM2838_PCIE_ROOT_CLASS(class);
+
+    dc->desc = "BCM2711 PCIe Bridge";
+    /*
+     * PCI-facing part of the host bridge, not usable without the host-facing
+     * part, which can't be device_add'ed.
+     */
+    dc->user_creatable = false;
+    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
+    k->device_id = BCM2838_PCIE_DEVICE_ID;
+    k->revision = BCM2838_PCIE_REVISION;
+    brpc->parent_obj.exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
+    brpc->parent_obj.aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
+    brpc->parent_realize = k->realize;
+    k->realize = bcm2838_pcie_root_realize;
+}
+
+static const TypeInfo bcm2838_pcie_root_info = {
+    .name = TYPE_BCM2838_PCIE_ROOT,
+    .parent = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(BCM2838PcieRootState),
+    .instance_init = bcm2838_pcie_root_init,
+    .class_init = bcm2838_pcie_root_class_init,
+};
+
+static void bcm2838_pcie_register(void)
+{
+    type_register_static(&bcm2838_pcie_root_info);
+}
+
+type_init(bcm2838_pcie_register)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 27e6797de2..b26ed13c6f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -39,7 +39,10 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubi
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
-arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c', 'raspi4b.c'))
+arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files(
+  'bcm2838.c',
+  'bcm2838_pcie.c',
+  'raspi4b.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 4f0167e638..6cfab31539 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,5 +55,9 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# bcm2838_pcie.c
+bcm2838_pcie_host_read(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
+bcm2838_pcie_host_write(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
+
 # bcm2838.c
 bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
diff --git a/include/hw/arm/bcm2838_pcie.h b/include/hw/arm/bcm2838_pcie.h
new file mode 100644
index 0000000000..39828f817f
--- /dev/null
+++ b/include/hw/arm/bcm2838_pcie.h
@@ -0,0 +1,53 @@
+/*
+ * BCM2838 PCIe Root Complex emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2838_PCIE_H
+#define BCM2838_PCIE_H
+
+#include "exec/hwaddr.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/pci/pcie_port.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2838_PCIE_ROOT "bcm2838-pcie-root"
+OBJECT_DECLARE_TYPE(BCM2838PcieRootState, BCM2838PcieRootClass,
+                    BCM2838_PCIE_ROOT)
+
+#define BCM2838_PCIE_VENDOR_ID      0x14E4
+#define BCM2838_PCIE_DEVICE_ID      0x2711
+#define BCM2838_PCIE_REVISION       20
+
+#define BCM2838_PCIE_REGS_SIZE      0x9310
+#define BCM2838_PCIE_NUM_IRQS       4
+
+#define BCM2838_PCIE_EXP_CAP_OFFSET 0xAC
+#define BCM2838_PCIE_AER_CAP_OFFSET 0x100
+
+#define BCM2838_PCIE_EXT_CFG_DATA   0x8000
+#define BCM2838_PCIE_EXT_CFG_INDEX  0x9000
+
+struct BCM2838PcieRootState {
+    /*< private >*/
+    PCIESlot parent_obj;
+
+    /*< public >*/
+    uint8_t regs[BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE];
+};
+
+struct BCM2838PcieRootClass {
+    /*< private >*/
+    PCIERootPortClass parent_obj;
+
+    /*< public >*/
+    void (*parent_realize)(PCIDevice *dev, Error **errp);
+};
+
+
+#endif /* BCM2838_PCIE_H */
-- 
2.34.1

