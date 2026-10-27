Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3EA606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVZq2hTz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLiCU-0007IQ-8k; Tue, 27 Oct 2026 10:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCP-0007HE-FY
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:30:50 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCM-00056o-Gy
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:30:49 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-93f2493c28bso342554185a.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111444; x=1793716244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=14aWNNnR1/y2mmJmL8h7ZXsP00Bu6qGUU+2xcAqlzq0=;
 b=CVZq2hTzztBGpSQN6K8oRTMVltPEdh5JeW7vPHdZWQYvYZasmK4rzBNxkWDvpLb+4K
 PzdiP6m42O8CIVNwIRdYll7K9aFqPizIvrRp3zzG0GiOPHWQLNo1UyccxuDZ/JoKZHLD
 2JXbXnU+5bM1k8OdAxBUN957zM46zWrN4SIpHCQua0uR8Hcup8HpLlxUTwONVTZzfZzm
 aak0Kvp1NDefuGhifFaPt82dzMKtMc/Na4FLobaO/Hp0/ymtM1O7MOJ9P4k9Og6uOE7G
 jkcg1qpfNWOPb/GpSl3rGcxtekXJ8Fkt5BnzfWa/HnvxYsrgGAvfjfxzSN7giFZJ52cR
 DuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111444; x=1793716244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=14aWNNnR1/y2mmJmL8h7ZXsP00Bu6qGUU+2xcAqlzq0=;
 b=AcTphKtFf/29MLpJhcHWuo6HIje8z5FgVg+TLsJbq1lpGg1AWZFfS8KlS+F2W/g+EM
 knY1OSmbgk09jJI1aMFhF7LhqGoTY9/g+eJAkchaDLWZ9VuZBT7Rgh0VGXM4glwLasKl
 xYIk7tgav/iGrnqJ6G2yL3GFzSzfYS6hPmX/BtUOfuqhwIblDzegnt4nB8h19s6G7gaF
 vjaP+LaiLybSP8lU7pRH7lr6qjGvHEZq9W2Nhidunz0XMi69gAK08RBNgk6iSnqFPaSe
 h3HhilS66E/Xq9ngCAxJP8ZEqyAYQiYD6EkH4Pc7AW6sISzuBKahMVN5uArFe+0BChgx
 TAWw==
X-Gm-Message-State: AFq9FYJxTbXM2cRxSy67ND7i1I/EbY5+spv+K5FlErJcy+vr7ckrIbh7
 Yxnpoc2V40ukFuAiaX8RRJUSXZvE2lfDneH5DJWAc43LpHnyjjUlHpbc5thDa5tr
X-Gm-Gg: AYBFou2BUkEnYa91p8exKUT/m9RqVpC8k+ia552I8oWPiz9fH9k0rQ4J+MHIqNHZ/40
 XOHqksoirbnckZlLTdZOuWU+fJ6g4d5lo+QIfObfm7lml64LiFWOGJkEL/pVBTQZ7lzjwbjKV2D
 FvugX4hqtgE8YMCQUWNV515fq388DFnBpouf3LKXLFMLwXJFccM5gB/MekiCPGaEpfEVdu7tBJu
 XFZXNdaJXEHXHOZeqz4DF2jNDlxVK0p7hbpHdTwokqpwP0NcaPkDJ+J/P62gwgcmj3M23BD5DZ5
 I+uhc/KQ6g3zV6SWoW/06K9JtoXr5gk8pdw8Q/zHn1CIKf40YfgqvpcCaGx3fauOyCAQpcMYp1x
 23pwjrglCcE82e0OExUsAm/kw5QdNPJ03agpfOf72yl4Fb+rE6AQWcTKj1HuIVCmQMoXiiRXI7m
 3xevT23vZWJ9dwtBhVc3+tjS8Wm5WqX4d5avh02CEl1hNKj9lm5cUngR9FfJDTQMj/veTgLF5dD
 3FHqURKfizteuHjANVkLDan2k39NyYgeUhAcNudeAHZ1qDRRZeD1t/1NLGx5/5yr3tBqZzd5dWD
 1REO0Kx+PQVa4FEbQukcvjjdBx9c9/J78V0SNydqxbS9TOFax+lSSxt40XQewh06ZBmy0aFQCSj
 lv5DddfpRJgu2kEUb5rf9NOQYQmabsCYv0v6u0QoxwnwbJQ==
X-Received: by 2002:a05:620a:3183:b0:93f:34c9:925e with SMTP id
 af79cd13be357-940ef913c6fmr1605860185a.19.1793111442766; 
 Tue, 27 Oct 2026 07:30:42 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:9872:3600:589:5f3a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a78c06sm986400885a.35.2026.10.27.07.30.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 07:30:41 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v6 01/17] hw/arm/bcm2838_pcie: add BCM2838 PCIe Root Complex
Date: Tue, 27 Oct 2026 10:30:20 -0400
Message-ID: <20261027143036.44973-2-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x729.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2838_pcie.c         | 101 ++++++++++++++++++++++++++++++++++
 hw/arm/meson.build            |   4 +-
 include/hw/arm/bcm2838_pcie.h |  54 ++++++++++++++++++
 3 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 include/hw/arm/bcm2838_pcie.h

diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
new file mode 100644
index 0000000000..edd174c376
--- /dev/null
+++ b/hw/arm/bcm2838_pcie.c
@@ -0,0 +1,101 @@
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
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_aer.h"
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
+static const VMStateDescription vmstate_bcm2838_pcie_root = {
+    .name = "bcm2838-pcie-root",
+    .priority = MIG_PRI_PCI_BUS,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = pcie_cap_slot_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj.parent_obj.parent_obj, PCIESlot),
+        VMSTATE_STRUCT(parent_obj.parent_obj.parent_obj.exp.aer_log,
+                       PCIESlot, 0, vmstate_pcie_aer_log, PCIEAERLog),
+        VMSTATE_UINT8_ARRAY(regs, BCM2838PcieRootState,
+                            BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2838_pcie_root_class_init(ObjectClass *class, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
+
+    dc->desc = "BCM2711 PCIe Bridge";
+    dc->vmsd = &vmstate_bcm2838_pcie_root;
+
+    resettable_class_set_parent_phases(rc, NULL,
+                                       bcm2838_pcie_root_port_reset_hold,
+                                       NULL, &rpc->parent_phases);
+
+    /*
+     * PCI-facing part of the host bridge, not usable without the host-facing
+     * part, which can't be device_add'ed.
+     */
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
index 0000000000..cb95c65331
--- /dev/null
+++ b/include/hw/arm/bcm2838_pcie.h
@@ -0,0 +1,54 @@
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
+    /* Controller registers above the 4KB config space; little-endian bytes */
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


