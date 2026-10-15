Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FEAC2D0A6
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 18:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHPvS-0001Np-2k; Thu, 15 Oct 2026 14:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvN-0001Ge-Cw
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:29 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvK-0001Rv-Kq
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:28 -0400
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-53506b44151so72984381cf.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792087885; x=1792692685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s2UvpvDX9ejIgABxm9OON8dWOXW2neu5g/bj+TjWyx4=;
 b=ITHjrSG80cOc67Imippj7pxr3F/JmKpSOcGHZ28k/ncQS5cbfQyzOicixmhnRX/lXf
 sSgUuD/vlsDTAcu1v87AbVQwTjyGi02nbm3SZ4MdbDCHPz72DOJXcQKg2UBjZGPQV1aC
 rOTblXDprSqCFs8lCZWlhXdK9Yb/nV4Q9jjcGx/VqkpiBprT2mnOfZGhKrRTCuLVA/Bv
 ozTcdIa/vxSIXXNd8rfG/whVIOlkcPz2ha//bFJePm+CvpPO/q93GEo0FgwcxrIxv2mj
 PO7MMmn2lbKA3nSw2BsMHmjGxy6NRfVR+EtoMSLevegKlNaoIrRDdZDyNqUXqK2h8SKE
 Fv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792087885; x=1792692685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=s2UvpvDX9ejIgABxm9OON8dWOXW2neu5g/bj+TjWyx4=;
 b=D1NWH4eKY9dyrk/k9SMsQs1t90JJaTYrgqocT6lGB2lZ/BL8ZIIeRNFb0h0S1jf83k
 G5Qfquk6GDDcHcSujLbVVwi73cR/3CWJXFTPWZ1qEENqZXAd2q6Daqce+9jqb33r8FJT
 vo2p+dHP/nczYfP7MmFSj75MpGx1eU8TlTmcjiXuZ6kMmM6Qf9TblOEQ3wdeTCmEJQJB
 p9pSouUAGwhN8bOoPJGAGzu/BM6FeokDuIVS3PAcIzcZw1Q189AQrZ4jUB/Wop3gnT7v
 m08e9MyKqnpvqABgPjgqLYXh3PvVhls4tiig8V5/6asHJQDFrKkyr3g1JlZdMtfC+TXG
 iuPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxM7yAw5swl/rb6GzKEJxN//pEvCL+bTWG2zgifOozKE4sANegzISdb4Z8nqTETz6MrFjAh3KQsNA==@nongnu.org
X-Gm-Message-State: AFq9FYKPAJovYe4w7Q4j1PNehBDx+v1/90IjOEXFV6sHnM9t1cPvDzaE
 GOaK50SCo4Gh45lgD0vnDm2JacECxEjNhOO9JSCtNLAQ8OqcNhit85Lg
X-Gm-Gg: AYBFou0U907VnIfZJx9ah4PS/o4YeDHVAudGUjMtqcwcidFhRWhyZWPArECC2ZamjOI
 2EZmb/5iBUvSYDy9iLC4tNQAsoH9K+cD1FGeOnGD4zbxPGFSLxQoDkVcaFR1Aiy2YQ9MIbIOcDL
 bycS2X0bMTEii/tr1hQI1E+CaTBDP9bAurQEpoEznpmCA1b66AVWa/ARhdUP+DA0O1bLUgMc5Zu
 /nvDLFjwfMz86CufNkbWt5T17z3ZbhyYU230TrUoDLnHlhqkaPGWrG9IWBFb/YYTkNPpxR3xuEe
 htVG/dk31Tj5fCS9fdhJlY7uU/FkaAzuT5kRjTdp9Mf3YfA3hC7g+xZE0PFj+RTQQHJKreHHyBJ
 wo4OWXj3q5oWZHn+Np24+9qmRhJfioKswhEiA3OTYhObCedD2ie9sE+xXi4nQC5sQoFUzuT+bgF
 2SgvKaUY0lYCbEdv2Mic/MkuCjNMqNjvVKSgPMVtVnnW2PDyKR7/CddOM8fc5iOr8dHJQlzzY6N
 xPLCYXdqxi23Ryia81oIAkTwBTVpYjO1IuwXqC33tD0pcS8XSGvKZ48MC5bJRaDcnbOXgY=
X-Received: by 2002:a05:622a:4086:b0:535:231d:653e with SMTP id
 d75a77b69052e-5359fb8efc9mr293050681cf.45.1792087885529; 
 Thu, 15 Oct 2026 11:11:25 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:919:5388:4e10:5949])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536127efe4asm32130611cf.19.2026.10.15.11.11.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Oct 2026 11:11:25 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v3 01/16] hw/arm/bcm2838_pcie: add BCM2838 PCIe Root Complex
Date: Thu, 15 Oct 2026 14:11:06 -0400
Message-ID: <20261015181122.60608-2-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015181122.60608-1-marcelomanzo@gmail.com>
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the PCI-facing "root" part (D0:F0) of the BCM2838 (Raspberry Pi
4B / BCM2711) PCIe Root Complex: a PCIe root port with the vendor's
device/vendor IDs and capability offsets, not usable on its own
without the host-facing part added in the next patch.

Adapted from patch 13/41 of Sergey Kambalin's "Raspberry Pi 4B
machine" series (patchwork series 829638, posted to qemu-devel in
2024 but never merged) against current QEMU master; the surrounding
PCIe/GENET networking support for raspi4b was left unmerged upstream
(base scaffolding aside), so this and the following patches complete
and debug that series to get real networking working under
raspi4b.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/arm/bcm2838_pcie.c         | 82 +++++++++++++++++++++++++++++++++++
 hw/arm/meson.build            |  4 +-
 include/hw/arm/bcm2838_pcie.h | 53 ++++++++++++++++++++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 include/hw/arm/bcm2838_pcie.h

diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
new file mode 100644
index 0000000000..96a45c1863
--- /dev/null
+++ b/hw/arm/bcm2838_pcie.c
@@ -0,0 +1,82 @@
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
+#include "hw/core/irq.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/core/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qemu/module.h"
+#include "hw/arm/bcm2838_pcie.h"
+#include "trace.h"
+
+/*
+ * RC root part (D0:F0)
+ */
+
+static void bcm2838_pcie_root_port_reset_hold(Object *obj, ResetType type)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(obj);
+    PCIDevice *dev = PCI_DEVICE(obj);
+    BCM2838PcieRootState *s = BCM2838_PCIE_ROOT(dev);
+
+    if (rpc->parent_phases.hold) {
+        rpc->parent_phases.hold(obj, type);
+    }
+
+    memset(s->regs, 0xFF, sizeof(s->regs));
+}
+
+static void bcm2838_pcie_root_init(Object *obj)
+{
+    PCIBridge *br = PCI_BRIDGE(obj);
+    br->bus_name = "pcie.1";
+}
+
+static void bcm2838_pcie_root_class_init(ObjectClass *class, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
+
+    dc->desc = "BCM2711 PCIe Bridge";
+    /*
+     * PCI-facing part of the host bridge, not usable without the host-facing
+     * part, which can't be device_add'ed.
+     */
+
+    resettable_class_set_parent_phases(rc, NULL,
+                                       bcm2838_pcie_root_port_reset_hold,
+                                       NULL, &rpc->parent_phases);
+
+    dc->user_creatable = false;
+    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
+    k->device_id = BCM2838_PCIE_DEVICE_ID;
+    k->revision = BCM2838_PCIE_REVISION;
+
+    rpc->exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
+    rpc->aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
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
index bcc068de04..f3c1b0e00f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -104,7 +104,9 @@ arm_common_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 arm_common_ss.add(when: 'CONFIG_MAX78000FTHR', if_true: files('max78000fthr.c'))
 arm_common_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
-arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_peripherals.c'))
+arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files(
+    'bcm2838_peripherals.c',
+    'bcm2838_pcie.c'))
 arm_common_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_common_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_common_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
diff --git a/include/hw/arm/bcm2838_pcie.h b/include/hw/arm/bcm2838_pcie.h
new file mode 100644
index 0000000000..fe7a6cff19
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
+#include "hw/core/sysbus.h"
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
2.55.0


