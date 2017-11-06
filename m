Received: by 10.223.150.237 with SMTP id u100csp2799359wrb;
        Mon, 6 Nov 2017 08:04:48 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SdAcZNZxGGQWPQyOKNYfYdbWyP13YQtpatR5W/myTNsPt56a7wKIa0V5XeTGoi1pmQHUd3
X-Received: by 10.37.133.79 with SMTP id f15mr10149965ybn.435.1509984288034;
        Mon, 06 Nov 2017 08:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984288; cv=none;
        d=google.com; s=arc-20160816;
        b=p2WVKPNz0LYATiH3seehT/sEZotnTtpUrKs3q/2O27aT0XVPdl83/XndAh6l6Gc71p
         2xStdGc5ah/Zw5lA8gJLAjz8UFgpl1cdCmICLypVxcGK85PJeitHagjhFgaDYuJh1ysr
         qd0o+JsQbRUtnBqMg1mGx6I7xXDxesiOjKlglPWCmT+BUVC/LDPF3zY4IQBw2GRv16a7
         xRoc2JBBCYpCLbkh0N6kPfPwexe2qO3zPGcDjJARuHG1VbeNwg6/KPG9HxuxpkyTv7eo
         dC3F+lihMokhHfT5H+HBP8bgFMfMioNUqQGSi516Kud3iq27kZ8XgQg2Ep/vv4tR2cnu
         sh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=NEdOaiV9N/PQFqPtM8WgLWm56m+TB16r6oCtWCBn/XM=;
        b=HyqxZkQIJSR4hI5xlfOc++XdGarCj4zATjy5Z5TRWwicvTrkS3z1z7rhl39W+AHRe0
         l706wUTHiZ/5TZNeBNUHVCsvRKHiQC/Sf6dZgtoOD5+/UimlGmWyw7FuwMzkJnsQfCWv
         8ndvcZxfZ3QQXEC/P+223yKphPJbWcOr5Sr5BnDZw1fdc5ucScUv+XMn5pMQ+QhgMRrk
         JZxsh0mAEB3l95fCgw9iwumOAN6t55HbchdLz1GMM1yJdrp5HqXNEYuVZdHmhGPl79Zz
         +kGIJwOuXLzKaUgRXUw3aV8OFJser45zzHYYuMm9KnT5jE1IRGp/tJUXHN+gajHhWvU0
         jsDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sbZWOdpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16si2891701ywh.568.2017.11.06.08.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:04:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sbZWOdpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjtH-00049e-C5
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:04:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdy-0007RG-0w
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdv-0000eO-2f
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:58 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:45191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdu-0000dr-Os; Mon, 06 Nov 2017 10:48:54 -0500
Received: by mail-pg0-x242.google.com with SMTP id b192so8516360pga.2;
	Mon, 06 Nov 2017 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NEdOaiV9N/PQFqPtM8WgLWm56m+TB16r6oCtWCBn/XM=;
	b=sbZWOdptAVBFfORyzksCzgEU4NlGK7zXfT49wT/JHKXEtTQKtyNsxAiUjUNkzrRCCn
	B7nJn1Z3DCV75Nt/7DG881fXxgCqxkpW0bvVMwRJ4xQQlgF0B7eHEqgExwq8jZgdwAuv
	3Pt/HYMVkZsri7r4mS5mJCbL6bLJV8Kvh9aKJetFZg/v1wa4lfK0mlXfED5BpET7p9hS
	Z93ThY3QEvKcXZYVoIe/MW+FFRFYXDy9CRbo6GvYwM5excUmEgl9M5Q1oFENxfopam2I
	jWA/IODTQfPqtWLZv5uhvi6GmuDarMKxuNGx0vXOxcyoWdUSLx7X40NPcj8g0WZuUrXN
	vPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NEdOaiV9N/PQFqPtM8WgLWm56m+TB16r6oCtWCBn/XM=;
	b=IVFMwr7QVHqEbizFF8wfidsXzh4otRCJOIpN5gubc/cRwGQbVFd3mpPPk/hJ7V+fwB
	PA2d8FtKHwgA3oR042TBOXt3rc0FpeHA5qYS0FFW6YWu2zDDNusNl71VQtRAuwCDbDIC
	o3B2GFfLyNNgWJ5o/QIZaXl4aY9A0uk4w7aLQ7RIEuridns4Ck3zGtGResZ936X2teQQ
	zTH2HQCjFo4UlNOzUQBhryeWaJBbEsKNh7j92n3CnUs7fQgyMYCT8TNyuuAzUaJeKFxI
	uQ7ecBTKY8xVMDm1NMAlb9aXfaVWPOuew4arEEYcHyMsBjkZou/n8TgCUDKAtBvwOiRl
	wxtg==
X-Gm-Message-State: AMCzsaUSC1GbGM+d7wtJoszEQlCnLt806jfZda2vZu8N8M2gXCG7zodl
	pXc7gYxl12EnA/1N3LggKZuSFmw1Qgk=
X-Received: by 10.159.254.1 with SMTP id r1mr15415339pls.186.1509983333361;
	Mon, 06 Nov 2017 07:48:53 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:52 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:05 -0800
Message-Id: <20171106154813.19936-23-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v3 22/30] pci: Add support for Designware IP block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nJHu9gajBsUg

Add code needed to get a functional PCI subsytem when using in
conjunction with upstream Linux guest (4.13+). Tested to work against
"e1000e" (network adapter, using MSI interrupts) as well as
"usb-ehci" (USB controller, using legacy PCI interrupts).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 default-configs/arm-softmmu.mak  |   2 +
 hw/pci-host/Makefile.objs        |   2 +
 hw/pci-host/designware.c         | 614 +++++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/designware.h |  92 ++++++
 include/hw/pci/pci_ids.h         |   2 +
 5 files changed, 712 insertions(+)
 create mode 100644 hw/pci-host/designware.c
 create mode 100644 include/hw/pci-host/designware.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index bbdd3c1d8b..225ebbd90a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -129,3 +129,5 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+
+CONFIG_PCI_DESIGNWARE=y
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
index 9c7909cf44..0e2c0a123b 100644
--- a/hw/pci-host/Makefile.objs
+++ b/hw/pci-host/Makefile.objs
@@ -17,3 +17,5 @@ common-obj-$(CONFIG_PCI_PIIX) += piix.o
 common-obj-$(CONFIG_PCI_Q35) += q35.o
 common-obj-$(CONFIG_PCI_GENERIC) += gpex.o
 common-obj-$(CONFIG_PCI_XILINX) += xilinx-pcie.o
+
+common-obj-$(CONFIG_PCI_DESIGNWARE) += designware.o
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
new file mode 100644
index 0000000000..7ae4126d96
--- /dev/null
+++ b/hw/pci-host/designware.c
@@ -0,0 +1,614 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * Designware PCIe IP block emulation
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
+#include "hw/pci-host/designware.h"
+
+#define PCIE_PORT_LINK_CONTROL          0x710
+
+#define PCIE_PHY_DEBUG_R1               0x72C
+#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
+
+#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
+
+#define PCIE_MSI_ADDR_LO                0x820
+#define PCIE_MSI_ADDR_HI                0x824
+#define PCIE_MSI_INTR0_ENABLE           0x828
+#define PCIE_MSI_INTR0_MASK             0x82C
+#define PCIE_MSI_INTR0_STATUS           0x830
+
+#define PCIE_ATU_VIEWPORT               0x900
+#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
+#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
+#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
+#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
+#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
+#define PCIE_ATU_CR1                    0x904
+#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
+#define PCIE_ATU_TYPE_IO                (0x2 << 0)
+#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
+#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
+#define PCIE_ATU_CR2                    0x908
+#define PCIE_ATU_ENABLE                 (0x1 << 31)
+#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
+#define PCIE_ATU_LOWER_BASE             0x90C
+#define PCIE_ATU_UPPER_BASE             0x910
+#define PCIE_ATU_LIMIT                  0x914
+#define PCIE_ATU_LOWER_TARGET           0x918
+#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
+#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
+#define PCIE_ATU_UPPER_TARGET           0x91C
+
+static DesignwarePCIEHost *
+designware_pcie_root_to_host(DesignwarePCIERoot *root)
+{
+    BusState *bus = qdev_get_parent_bus(DEVICE(root));
+    return DESIGNWARE_PCIE_HOST(bus->parent);
+}
+
+static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
+                                           uint64_t val, unsigned len)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
+    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
+
+    root->msi.intr[0].status |= (1 << val) & root->msi.intr[0].enable;
+
+    if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
+        qemu_set_irq(host->pci.irqs[0], 1);
+    }
+}
+
+const MemoryRegionOps designware_pci_host_msi_ops = {
+    .write = designware_pcie_root_msi_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
+
+{
+    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
+    MemoryRegion *address_space = &host->pci.memory;
+    MemoryRegion *mem = &root->msi.iomem;
+    const uint64_t base = root->msi.base;
+    const bool enable = root->msi.intr[0].enable;
+
+    if (memory_region_is_mapped(mem)) {
+        memory_region_del_subregion(address_space, mem);
+        object_unparent(OBJECT(mem));
+    }
+
+    if (enable) {
+        memory_region_init_io(mem, OBJECT(root),
+                              &designware_pci_host_msi_ops,
+                              root, "pcie-msi", 0x1000);
+
+        memory_region_add_subregion(address_space, base, mem);
+    }
+}
+
+static DesignwarePCIEViewport *
+designware_pcie_root_get_current_viewport(DesignwarePCIERoot *root)
+{
+    const unsigned int idx = root->atu_viewport & 0xF;
+    const unsigned int dir = !!(root->atu_viewport & PCIE_ATU_REGION_INBOUND);
+    return &root->viewports[dir][idx];
+}
+
+static uint32_t
+designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(d);
+    DesignwarePCIEViewport *viewport =
+        designware_pcie_root_get_current_viewport(root);
+
+    uint32_t val;
+
+    switch (address) {
+    case PCIE_PORT_LINK_CONTROL:
+    case PCIE_LINK_WIDTH_SPEED_CONTROL:
+        val = 0xDEADBEEF;
+        /* No-op */
+        break;
+
+    case PCIE_MSI_ADDR_LO:
+        val = root->msi.base;
+        break;
+
+    case PCIE_MSI_ADDR_HI:
+        val = root->msi.base >> 32;
+        break;
+
+    case PCIE_MSI_INTR0_ENABLE:
+        val = root->msi.intr[0].enable;
+        break;
+
+    case PCIE_MSI_INTR0_MASK:
+        val = root->msi.intr[0].mask;
+        break;
+
+    case PCIE_MSI_INTR0_STATUS:
+        val = root->msi.intr[0].status;
+        break;
+
+    case PCIE_PHY_DEBUG_R1:
+        val = PCIE_PHY_DEBUG_R1_XMLH_LINK_UP;
+        break;
+
+    case PCIE_ATU_VIEWPORT:
+        val = root->atu_viewport;
+        break;
+
+    case PCIE_ATU_LOWER_BASE:
+        val = viewport->base;
+        break;
+
+    case PCIE_ATU_UPPER_BASE:
+        val = viewport->base >> 32;
+        break;
+
+    case PCIE_ATU_LOWER_TARGET:
+        val = viewport->target;
+        break;
+
+    case PCIE_ATU_UPPER_TARGET:
+        val = viewport->target >> 32;
+        break;
+
+    case PCIE_ATU_LIMIT:
+        val = viewport->limit;
+        break;
+
+    case PCIE_ATU_CR1:
+    case PCIE_ATU_CR2:          /* FALLTHROUGH */
+        val = viewport->cr[(address - PCIE_ATU_CR1) / sizeof(uint32_t)];
+        break;
+
+    default:
+        val = pci_default_read_config(d, address, len);
+        break;
+    }
+
+    return val;
+}
+
+static uint64_t designware_pcie_root_data_read(void *opaque,
+                                               hwaddr addr, unsigned len)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
+    DesignwarePCIEViewport *viewport =
+        designware_pcie_root_get_current_viewport(root);
+
+    const uint8_t busnum = PCIE_ATU_BUS(viewport->target);
+    const uint8_t devfn  = PCIE_ATU_DEVFN(viewport->target);
+    PCIBus    *pcibus    = PCI_DEVICE(root)->bus;
+    PCIDevice *pcidev    = pci_find_device(pcibus, busnum, devfn);
+
+    if (pcidev) {
+        addr &= PCI_CONFIG_SPACE_SIZE - 1;
+
+        return pci_host_config_read_common(pcidev, addr,
+                                           PCI_CONFIG_SPACE_SIZE, len);
+    }
+
+    return UINT64_MAX;
+}
+
+static void designware_pcie_root_data_write(void *opaque, hwaddr addr,
+                                            uint64_t val, unsigned len)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
+    DesignwarePCIEViewport *viewport =
+        designware_pcie_root_get_current_viewport(root);
+    const uint8_t busnum = PCIE_ATU_BUS(viewport->target);
+    const uint8_t devfn  = PCIE_ATU_DEVFN(viewport->target);
+    PCIBus    *pcibus    = PCI_DEVICE(root)->bus;
+    PCIDevice *pcidev    = pci_find_device(pcibus, busnum, devfn);
+
+    if (pcidev) {
+        addr &= PCI_CONFIG_SPACE_SIZE - 1;
+        pci_host_config_write_common(pcidev, addr,
+                                     PCI_CONFIG_SPACE_SIZE,
+                                     val, len);
+    }
+}
+
+const MemoryRegionOps designware_pci_host_conf_ops = {
+    .read = designware_pcie_root_data_read,
+    .write = designware_pcie_root_data_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
+                                            DesignwarePCIEViewport *viewport)
+{
+    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
+
+    MemoryRegion *mem     = &viewport->memory;
+    const uint64_t target = viewport->target;
+    const uint64_t base   = viewport->base;
+    const uint64_t size   = (uint64_t)viewport->limit - base + 1;
+    const bool inbound    = viewport->inbound;
+
+    MemoryRegion *source, *destination;
+    const char *direction;
+    char *name;
+
+    if (inbound) {
+        source      = &host->pci.address_space_root;
+        destination = get_system_memory();
+        direction   = "Inbound";
+    } else {
+        source      = get_system_memory();
+        destination = &host->pci.memory;
+        direction   = "Outbound";
+    }
+
+    if (memory_region_is_mapped(mem)) {
+        /* Before we modify anything, unmap and destroy the region */
+        memory_region_del_subregion(source, mem);
+        object_unparent(OBJECT(mem));
+    }
+
+    name = g_strdup_printf("PCI %s Viewport %p", direction, viewport);
+
+    switch (viewport->cr[0]) {
+    case PCIE_ATU_TYPE_MEM:
+        memory_region_init_alias(mem, OBJECT(root), name,
+                                 destination, target, size);
+        break;
+    case PCIE_ATU_TYPE_CFG0:
+    case PCIE_ATU_TYPE_CFG1:    /* FALLTHROUGH */
+        if (inbound) {
+            goto exit;
+        }
+
+        memory_region_init_io(mem, OBJECT(root),
+                              &designware_pci_host_conf_ops,
+                              root, name, size);
+        break;
+    }
+
+    if (inbound) {
+        memory_region_add_subregion_overlap(source, base,
+                                            mem, -1);
+    } else {
+        memory_region_add_subregion(source, base, mem);
+    }
+
+ exit:
+    g_free(name);
+}
+
+static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
+                                              uint32_t val, int len)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(d);
+    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
+    DesignwarePCIEViewport *viewport =
+        designware_pcie_root_get_current_viewport(root);
+
+    switch (address) {
+    case PCIE_PORT_LINK_CONTROL:
+    case PCIE_LINK_WIDTH_SPEED_CONTROL:
+    case PCIE_PHY_DEBUG_R1:
+        /* No-op */
+        break;
+
+    case PCIE_MSI_ADDR_LO:
+        root->msi.base &= 0xFFFFFFFF00000000ULL;
+        root->msi.base |= val;
+        break;
+
+    case PCIE_MSI_ADDR_HI:
+        root->msi.base &= 0x00000000FFFFFFFFULL;
+        root->msi.base |= (uint64_t)val << 32;
+        break;
+
+    case PCIE_MSI_INTR0_ENABLE: {
+        const bool update_msi_mapping = !root->msi.intr[0].enable ^ !!val;
+
+        root->msi.intr[0].enable = val;
+
+        if (update_msi_mapping) {
+            designware_pcie_root_update_msi_mapping(root);
+        }
+        break;
+    }
+
+    case PCIE_MSI_INTR0_MASK:
+        root->msi.intr[0].mask = val;
+        break;
+
+    case PCIE_MSI_INTR0_STATUS:
+        root->msi.intr[0].status ^= val;
+        if (!root->msi.intr[0].status) {
+            qemu_set_irq(host->pci.irqs[0], 0);
+        }
+        break;
+
+    case PCIE_ATU_VIEWPORT:
+        root->atu_viewport = val;
+        break;
+
+    case PCIE_ATU_LOWER_BASE:
+        viewport->base &= 0xFFFFFFFF00000000ULL;
+        viewport->base |= val;
+        break;
+
+    case PCIE_ATU_UPPER_BASE:
+        viewport->base &= 0x00000000FFFFFFFFULL;
+        viewport->base |= (uint64_t)val << 32;
+        break;
+
+    case PCIE_ATU_LOWER_TARGET:
+        viewport->target &= 0xFFFFFFFF00000000ULL;
+        viewport->target |= val;
+        break;
+
+    case PCIE_ATU_UPPER_TARGET:
+        viewport->target &= 0x00000000FFFFFFFFULL;
+        viewport->target |= val;
+        break;
+
+    case PCIE_ATU_LIMIT:
+        viewport->limit = val;
+        break;
+
+    case PCIE_ATU_CR1:
+        viewport->cr[0] = val;
+        break;
+    case PCIE_ATU_CR2:
+        viewport->cr[1] = val;
+
+        if (viewport->cr[1] & PCIE_ATU_ENABLE) {
+            designware_pcie_update_viewport(root, viewport);
+         }
+        break;
+
+    default:
+        pci_bridge_write_config(d, address, val, len);
+        break;
+    }
+}
+
+static int designware_pcie_root_init(PCIDevice *dev)
+{
+    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
+    PCIBridge *br = PCI_BRIDGE(dev);
+    DesignwarePCIEViewport *viewport;
+    size_t i;
+
+    br->bus_name  = "dw-pcie";
+
+    pci_set_word(dev->config + PCI_COMMAND,
+                 PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
+
+    pci_config_set_interrupt_pin(dev->config, 1);
+    pci_bridge_initfn(dev, TYPE_PCI_BUS);
+
+    pcie_port_init_reg(dev);
+
+    pcie_cap_init(dev, 0x70, PCI_EXP_TYPE_ROOT_PORT,
+                  0, &error_fatal);
+
+    msi_nonbroken = true;
+    msi_init(dev, 0x50, 32, true, true, &error_fatal);
+
+    for (i = 0; i < DESIGNWARE_PCIE_NUM_VIEWPORTS; i++) {
+        viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][i];
+        viewport->inbound = true;
+    }
+
+    /*
+     * If no inbound iATU windows are configured, HW defaults to
+     * letting inbound TLPs to pass in. We emulate that by exlicitly
+     * configuring first inbound window to cover all of target's
+     * address space.
+     *
+     * NOTE: This will not work correctly for the case when first
+     * configured inbound window is window 0
+     */
+    viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
+    viewport->base   = 0x0000000000000000ULL;
+    viewport->target = 0x0000000000000000ULL;
+    viewport->limit  = UINT32_MAX;
+    viewport->cr[0]  = PCIE_ATU_TYPE_MEM;
+
+    designware_pcie_update_viewport(root, viewport);
+
+    return 0;
+}
+
+static void designware_pcie_set_irq(void *opaque, int irq_num, int level)
+{
+    DesignwarePCIEHost *host = DESIGNWARE_PCIE_HOST(opaque);
+
+    qemu_set_irq(host->pci.irqs[irq_num], level);
+}
+
+static const char *designware_pcie_host_root_bus_path(PCIHostState *host_bridge,
+                                                      PCIBus *rootbus)
+{
+    return "0000:00";
+}
+
+
+static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+
+    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
+    k->device_id = 0xABCD;
+    k->revision = 0;
+    k->class_id = PCI_CLASS_BRIDGE_HOST;
+    k->is_express = true;
+    k->is_bridge = true;
+    k->init = designware_pcie_root_init;
+    k->exit = pci_bridge_exitfn;
+    dc->reset = pci_bridge_reset;
+    k->config_read = designware_pcie_root_config_read;
+    k->config_write = designware_pcie_root_config_write;
+
+    /*
+     * PCI-facing part of the host bridge, not usable without the
+     * host-facing part, which can't be device_add'ed, yet.
+     */
+    dc->user_creatable = false;
+}
+
+static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
+                                               unsigned int size)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
+    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
+
+    return pci_host_config_read_common(device,
+                                       addr,
+                                       pci_config_size(device),
+                                       size);
+}
+
+static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
+                                            uint64_t val, unsigned int size)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
+    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
+
+    return pci_host_config_write_common(device,
+                                        addr,
+                                        pci_config_size(device),
+                                        val, size);
+}
+
+static const MemoryRegionOps designware_pci_mmio_ops = {
+    .read       = designware_pcie_host_mmio_read,
+    .write      = designware_pcie_host_mmio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
+                                                    int devfn)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(opaque);
+
+    return &s->pci.address_space;
+}
+
+static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    size_t i;
+
+    for (i = 0; i < ARRAY_SIZE(s->pci.irqs); i++) {
+        sysbus_init_irq(sbd, &s->pci.irqs[i]);
+    }
+
+    memory_region_init_io(&s->mmio,
+                          OBJECT(s),
+                          &designware_pci_mmio_ops,
+                          s,
+                          "pcie.reg", 4 * 1024);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    memory_region_init(&s->pci.io, OBJECT(s), "pcie-pio", 16);
+    memory_region_init(&s->pci.memory, OBJECT(s),
+                       "pcie-bus-memory",
+                       UINT64_MAX);
+
+    pci->bus = pci_register_bus(dev, "pcie",
+                                designware_pcie_set_irq,
+                                pci_swizzle_map_irq_fn,
+                                s,
+                                &s->pci.memory,
+                                &s->pci.io,
+                                0, 4,
+                                TYPE_PCIE_BUS);
+
+    memory_region_init(&s->pci.address_space_root,
+                       OBJECT(s),
+                       "pcie-bus-address-space-root",
+                       UINT64_MAX);
+    memory_region_add_subregion(&s->pci.address_space_root,
+                                0x0, &s->pci.memory);
+    address_space_init(&s->pci.address_space,
+                       &s->pci.address_space_root,
+                       "pcie-bus-address-space");
+    pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
+
+    qdev_set_parent_bus(DEVICE(&s->root), BUS(pci->bus));
+    qdev_init_nofail(DEVICE(&s->root));
+}
+
+static void designware_pcie_host_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
+
+    hc->root_bus_path = designware_pcie_host_root_bus_path;
+    dc->realize = designware_pcie_host_realize;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->fw_name = "pci";
+}
+
+static void designware_pcie_host_init(Object *obj)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(obj);
+    DesignwarePCIERoot *root = &s->root;
+
+    object_initialize(root, sizeof(*root), TYPE_DESIGNWARE_PCIE_ROOT);
+    object_property_add_child(obj, "root", OBJECT(root), NULL);
+    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
+    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
+}
+
+static const TypeInfo designware_pcie_root_info = {
+    .name = TYPE_DESIGNWARE_PCIE_ROOT,
+    .parent = TYPE_PCI_BRIDGE,
+    .instance_size = sizeof(DesignwarePCIERoot),
+    .class_init = designware_pcie_root_class_init,
+};
+
+static const TypeInfo designware_pcie_host_info = {
+    .name       = TYPE_DESIGNWARE_PCIE_HOST,
+    .parent     = TYPE_PCI_HOST_BRIDGE,
+    .instance_size = sizeof(DesignwarePCIEHost),
+    .instance_init = designware_pcie_host_init,
+    .class_init = designware_pcie_host_class_init,
+};
+
+static void designware_pcie_register(void)
+{
+    type_register_static(&designware_pcie_root_info);
+    type_register_static(&designware_pcie_host_info);
+}
+type_init(designware_pcie_register)
+
+/* 00:00.0 Class 0604: 16c3:abcd */
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
new file mode 100644
index 0000000000..c1eabfa16b
--- /dev/null
+++ b/include/hw/pci-host/designware.h
@@ -0,0 +1,92 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * Designware PCIe IP block emulation
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef DESIGNWARE_H
+#define DESIGNWARE_H
+
+#include "hw/hw.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_host.h"
+
+#define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
+#define DESIGNWARE_PCIE_HOST(obj) \
+     OBJECT_CHECK(DesignwarePCIEHost, (obj), TYPE_DESIGNWARE_PCIE_HOST)
+
+#define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
+#define DESIGNWARE_PCIE_ROOT(obj) \
+     OBJECT_CHECK(DesignwarePCIERoot, (obj), TYPE_DESIGNWARE_PCIE_ROOT)
+
+typedef struct DesignwarePCIEViewport {
+    MemoryRegion memory;
+
+    uint64_t base;
+    uint64_t target;
+    uint32_t limit;
+    uint32_t cr[2];
+
+    bool inbound;
+} DesignwarePCIEViewport;
+
+typedef struct DesignwarePCIERoot {
+    PCIBridge parent_obj;
+
+    uint32_t atu_viewport;
+
+#define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
+#define DESIGNWARE_PCIE_VIEWPORT_INBOUND     1
+#define DESIGNWARE_PCIE_NUM_VIEWPORTS        4
+
+    DesignwarePCIEViewport viewports[2][DESIGNWARE_PCIE_NUM_VIEWPORTS];
+
+    struct {
+        uint64_t     base;
+        MemoryRegion iomem;
+
+        struct {
+            uint32_t enable;
+            uint32_t mask;
+            uint32_t status;
+        } intr[1];
+    } msi;
+} DesignwarePCIERoot;
+
+typedef struct DesignwarePCIEHost {
+    PCIHostState parent_obj;
+
+    bool link_up;
+
+    DesignwarePCIERoot root;
+
+    struct {
+        AddressSpace address_space;
+        MemoryRegion address_space_root;
+
+        MemoryRegion memory;
+        MemoryRegion io;
+
+        qemu_irq     irqs[4];
+    } pci;
+
+    MemoryRegion mmio;
+} DesignwarePCIEHost;
+
+#endif  /* DESIGNWARE_H */
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 3752ddc93a..e2816d054f 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -264,4 +264,6 @@
 #define PCI_VENDOR_ID_TEWS               0x1498
 #define PCI_DEVICE_ID_TEWS_TPCI200       0x30C8
 
+#define PCI_VENDOR_ID_SYNOPSYS           0x16C3
+
 #endif
-- 
2.13.6

