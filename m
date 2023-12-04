Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2385812ejb;
        Sun, 3 Dec 2023 16:28:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ6JaBk0ljc2tNfBlPQ0w156su6XymrUgGbNjpWkTBQDwtOv/gN/FNEXdxTZBbS8BVBEAR
X-Received: by 2002:a05:6808:1d9:b0:3ad:f86a:878e with SMTP id x25-20020a05680801d900b003adf86a878emr2994266oic.13.1701649707351;
        Sun, 03 Dec 2023 16:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649707; cv=none;
        d=google.com; s=arc-20160816;
        b=FhnCskqJj8njI2boHVnbNfPv4VcGhuRurSs6o4lDg1DjZ2+N7yMauXfYZpWkZl3rYI
         cfurt5keBT1PTYkppdMuCVb3uV9TNTc8ugnzZBzXXIKDCK/+FabpzAlQDQSSEXjYIiZd
         NG8PKThYujtDHiYZold2yzTGE9DyuSHt4yl8n8qjJyHhjmQzvVCJ5rJRtLfO7dYq9RmL
         2fCU0hE0Lr+5RCn4Sj0XBzDP34S59V4OoJ6AGsuUeHuN1+U3uzOw7f2myKNCRsL+IFxb
         I6Eh64lK6yYw4y92ie6H0Jm0zzG6x1YvB9pqQvbt3653y6YQZTnfPfUGS/Q3zP48uI/x
         fkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IA89nY8jxlWQU5cEQQofnym1Upjf0MuK6dyCKlAlClw=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Ob7n7xwc5GurfkVgm0cTnEi46of+X5k4k5ZjK4EBKDGe0Mk6S5ZzAIHW+/CcEiiDyj
         KhroQk3LGAaoVhGDihpRnt2x9rEj+pJY+LgJRJE/0yLucupLmRCDgYEFJh4Zdu7cMZHE
         rhA/VyTm/FepfQkGQ8JP2l27X8WFHN0b5N7EypyWmAQnV+6mAHb0iOAZhO+Iziyr6Fqi
         zTLjUx3NTveZpiOBZjtb2v47jjYeNWcffubvPn+dcgpE13WWaC4F6P1CyOU7deWxlQQ9
         B6rLvNYtWAMj4txgNFBqgujjx8N3Eexk/ycRw5vkgSCy9YdHI7mnSgfotVScV/t4NN0M
         nj9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACxL6Ubm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05620a271600b0077f088555b7si2068486qkp.438.2023.12.03.16.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:28:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACxL6Ubm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9wno-0004nb-6e; Sun, 03 Dec 2023 19:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnT-0004YG-79; Sun, 03 Dec 2023 19:26:56 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnN-00009i-Bi; Sun, 03 Dec 2023 19:26:50 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5d719a2004fso5254567b3.3; 
 Sun, 03 Dec 2023 16:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649602; x=1702254402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IA89nY8jxlWQU5cEQQofnym1Upjf0MuK6dyCKlAlClw=;
 b=ACxL6UbmbhO4lzmtVMYzpldFEh2B48EREC6rB689d5xlPWPw+aRXklUm/mdh9wre7T
 54yAbRHWPwam4PeXmcdUyhEgKGwW29Iy1fT21ii0lus4zdmv2kPav1SJ+I1bw8LQwGym
 Kp3xbsEmOa+updlY5KubP0nPItUqPWdVNvHhNaPAJjA7hhbjBFx756eEWc6boM9+uK79
 FJ3Kneh/Q4z5Ha86JhQiGEvoe7FOHK0JBNFPawl7sD7+rBYdiPQry3CVIXgWRzdpXtJy
 +str8068kteuZ24RnWOxBfYchj2+R0QODw5FFD52Ls+51eqYcetwL26bUf1VSIOc46Tf
 BuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649602; x=1702254402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IA89nY8jxlWQU5cEQQofnym1Upjf0MuK6dyCKlAlClw=;
 b=eV0xrwksHLJUgVsB4Zgwd1aqhxkTWs8TVRjmtIsnCM82RmAGnTLy85rKFhffXeRarh
 BNHzABQurc8CB0Lc9ttfTO1ojAJqEMcpyDQ/IjS+ARsYgXiYL3c3LKwF2RjCP4gXXA7w
 HW9wfMuydxd/qAtRW42rP7AQnsPSY/IVFluMJun2Vsn8SLoBnF31ztSZOxr0C7d/FPJl
 0cmcUajYiGl24pkdn2imBNzHDyNoLV8JMf+cAt08AWq2hV81+L4c+rImbGtHAMv+yINX
 AImeCmlcOObHb8gghlYUcnVXd4ocmUQLhfo7N5sJfltAuIkA1/kZpVBoOD8uvFV9Ph0+
 wnlg==
X-Gm-Message-State: AOJu0YyMdZQ121Fn5ww7xMaRCkfGFCTKQFfjPcZXz4fexcME+VSRMxMd
 MNdnbNDSithszq4548dGZ7OuqGEp6dGD9Q==
X-Received: by 2002:a81:b049:0:b0:5d2:913a:640d with SMTP id
 x9-20020a81b049000000b005d2913a640dmr822205ywk.47.1701649602626; 
 Sun, 03 Dec 2023 16:26:42 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:42 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 15/45] Add BCM2838 PCIE host
Date: Sun,  3 Dec 2023 18:25:49 -0600
Message-Id: <20231204002619.1367044-16-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112a.google.com
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
X-TUID: tCNoKDbXlcSA

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_pcie.c         | 216 +++++++++++++++++++++++++++++++++-
 include/hw/arm/bcm2838_pcie.h |  22 ++++
 2 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
index 3b4373c6a6..75146d6c2e 100644
--- a/hw/arm/bcm2838_pcie.c
+++ b/hw/arm/bcm2838_pcie.c
@@ -12,11 +12,222 @@
 #include "hw/irq.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
-#include "migration/vmstate.h"
-#include "qemu/module.h"
 #include "hw/arm/bcm2838_pcie.h"
 #include "trace.h"
 
+/*
+ * RC host part
+ */
+
+static uint64_t bcm2838_pcie_host_read(void *opaque, hwaddr offset,
+                                       unsigned size) {
+    hwaddr mmcfg_addr;
+    uint64_t value = ~0;
+    BCM2838PcieHostState *s = opaque;
+    PCIExpressHost *pcie_hb = PCIE_HOST_BRIDGE(s);
+    PCIDevice *root_pci_dev = PCI_DEVICE(&s->root_port);
+    uint8_t *root_regs = s->root_port.regs;
+    uint32_t *cfg_idx = (uint32_t *)(root_regs + BCM2838_PCIE_EXT_CFG_INDEX
+                                     - PCIE_CONFIG_SPACE_SIZE);
+
+    if (offset < PCIE_CONFIG_SPACE_SIZE) {
+        value = pci_host_config_read_common(root_pci_dev, offset,
+                                            PCIE_CONFIG_SPACE_SIZE, size);
+    } else if (offset - PCIE_CONFIG_SPACE_SIZE + size
+               <= sizeof(s->root_port.regs)) {
+        switch (offset) {
+        case BCM2838_PCIE_EXT_CFG_DATA
+            ... BCM2838_PCIE_EXT_CFG_DATA + PCIE_CONFIG_SPACE_SIZE - 1:
+            mmcfg_addr = *cfg_idx
+                | PCIE_MMCFG_CONFOFFSET(offset - BCM2838_PCIE_EXT_CFG_DATA);
+            value = pcie_hb->mmio.ops->read(opaque, mmcfg_addr, size);
+            break;
+        default:
+            memcpy(&value, root_regs + offset - PCIE_CONFIG_SPACE_SIZE, size);
+        }
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
+
+    trace_bcm2838_pcie_host_read(size, offset, value);
+    return value;
+}
+
+static void bcm2838_pcie_host_write(void *opaque, hwaddr offset,
+                                    uint64_t value, unsigned size) {
+    hwaddr mmcfg_addr;
+    BCM2838PcieHostState *s = opaque;
+    PCIExpressHost *pcie_hb = PCIE_HOST_BRIDGE(s);
+    PCIDevice *root_pci_dev = PCI_DEVICE(&s->root_port);
+    uint8_t *root_regs = s->root_port.regs;
+    uint32_t *cfg_idx = (uint32_t *)(root_regs + BCM2838_PCIE_EXT_CFG_INDEX
+                                     - PCIE_CONFIG_SPACE_SIZE);
+
+    trace_bcm2838_pcie_host_write(size, offset, value);
+
+    if (offset < PCIE_CONFIG_SPACE_SIZE) {
+        pci_host_config_write_common(root_pci_dev, offset,
+                                     PCIE_CONFIG_SPACE_SIZE, value, size);
+    } else if (offset - PCIE_CONFIG_SPACE_SIZE + size
+               <= sizeof(s->root_port.regs)) {
+        switch (offset) {
+        case BCM2838_PCIE_EXT_CFG_DATA
+            ... BCM2838_PCIE_EXT_CFG_DATA + PCIE_CONFIG_SPACE_SIZE - 1:
+            mmcfg_addr = *cfg_idx
+                | PCIE_MMCFG_CONFOFFSET(offset - BCM2838_PCIE_EXT_CFG_DATA);
+            pcie_hb->mmio.ops->write(opaque, mmcfg_addr, value, size);
+            break;
+        default:
+            memcpy(root_regs + offset - PCIE_CONFIG_SPACE_SIZE, &value, size);
+        }
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
+}
+
+static const MemoryRegionOps bcm2838_pcie_host_ops = {
+    .read = bcm2838_pcie_host_read,
+    .write = bcm2838_pcie_host_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {.max_access_size = sizeof(uint64_t)},
+};
+
+int bcm2838_pcie_host_set_irq_num(BCM2838PcieHostState *s, int index, int spi)
+{
+    if (index >= BCM2838_PCIE_NUM_IRQS) {
+        return -EINVAL;
+    }
+
+    s->irq_num[index] = spi;
+    return 0;
+}
+
+static void bcm2838_pcie_host_set_irq(void *opaque, int irq_num, int level)
+{
+    BCM2838PcieHostState *s = opaque;
+
+    qemu_set_irq(s->irq[irq_num], level);
+}
+
+static PCIINTxRoute bcm2838_pcie_host_route_intx_pin_to_irq(void *opaque,
+                                                            int pin)
+{
+    PCIINTxRoute route;
+    BCM2838PcieHostState *s = opaque;
+
+    route.irq = s->irq_num[pin];
+    route.mode = route.irq < 0 ? PCI_INTX_DISABLED : PCI_INTX_ENABLED;
+
+    return route;
+}
+
+static int bcm2838_pcie_host_map_irq(PCIDevice *pci_dev, int pin)
+{
+    return pin;
+}
+
+static void bcm2838_pcie_host_realize(DeviceState *dev, Error **errp)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    BCM2838PcieHostState *s = BCM2838_PCIE_HOST(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    int i;
+
+    memory_region_init_io(&s->cfg_regs, OBJECT(s), &bcm2838_pcie_host_ops, s,
+                          "bcm2838_pcie_cfg_regs", BCM2838_PCIE_REGS_SIZE);
+    sysbus_init_mmio(sbd, &s->cfg_regs);
+
+    /*
+     * The MemoryRegions io_mmio and io_ioport that we pass to
+     * pci_register_root_bus() are not the same as the MemoryRegions
+     * io_mmio_window and io_ioport_window that we expose as SysBus MRs.
+     * The difference is in the behavior of accesses to addresses where no PCI
+     * device has been mapped.
+     *
+     * io_mmio and io_ioport are the underlying PCI view of the PCI address
+     * space, and when a PCI device does a bus master access to a bad address
+     * this is reported back to it as a transaction failure.
+     *
+     * io_mmio_window and io_ioport_window implement "unmapped addresses read as
+     * -1 and ignore writes"; this is a traditional x86 PC behavior, which is
+     * not mandated properly by the PCI spec but expected by the majority of
+     * PCI-using guest software, including Linux.
+     *
+     * We implement it in the PCIe host controller, by providing the *_window
+     * MRs, which are containers with io ops that implement the 'background'
+     * behavior and which hold the real PCI MRs as sub-regions.
+     */
+    memory_region_init(&s->io_mmio, OBJECT(s), "bcm2838_pcie_mmio", UINT64_MAX);
+    memory_region_init(&s->io_ioport, OBJECT(s), "bcm2838_pcie_ioport",
+                       64 * 1024);
+
+    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                            &unassigned_io_ops, OBJECT(s),
+                            "bcm2838_pcie_mmio_window", UINT64_MAX);
+    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                            &unassigned_io_ops, OBJECT(s),
+                            "bcm2838_pcie_ioport_window", 64 * 1024);
+
+    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+    sysbus_init_mmio(sbd, &s->io_mmio_window);
+    sysbus_init_mmio(sbd, &s->io_ioport_window);
+
+    for (i = 0; i < BCM2838_PCIE_NUM_IRQS; i++) {
+        sysbus_init_irq(sbd, &s->irq[i]);
+        s->irq_num[i] = -1;
+    }
+
+    pci->bus = pci_register_root_bus(dev, "pcie.0", bcm2838_pcie_host_set_irq,
+                                     bcm2838_pcie_host_map_irq, s, &s->io_mmio,
+                                     &s->io_ioport, 0, BCM2838_PCIE_NUM_IRQS,
+                                     TYPE_PCIE_BUS);
+    pci_bus_set_route_irq_fn(pci->bus, bcm2838_pcie_host_route_intx_pin_to_irq);
+    qdev_realize(DEVICE(&s->root_port), BUS(pci->bus), &error_fatal);
+}
+
+static const char *bcm2838_pcie_host_root_bus_path(PCIHostState *host_bridge,
+                                                   PCIBus *rootbus)
+{
+    return "0000:00";
+}
+
+static void bcm2838_pcie_host_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(class);
+
+    hc->root_bus_path = bcm2838_pcie_host_root_bus_path;
+    dc->realize = bcm2838_pcie_host_realize;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->fw_name = "pci";
+}
+
+static void bcm2838_pcie_host_initfn(Object *obj)
+{
+    BCM2838PcieHostState *s = BCM2838_PCIE_HOST(obj);
+    BCM2838PcieRootState *root = &s->root_port;
+
+    object_initialize_child(obj, "root_port", root, TYPE_BCM2838_PCIE_ROOT);
+    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
+    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
+}
+
+static const TypeInfo bcm2838_pcie_host_info = {
+    .name       = TYPE_BCM2838_PCIE_HOST,
+    .parent     = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(BCM2838PcieHostState),
+    .instance_init = bcm2838_pcie_host_initfn,
+    .class_init = bcm2838_pcie_host_class_init,
+};
+
 /*
  * RC root part (D0:F0)
  */
@@ -69,6 +280,7 @@ static const TypeInfo bcm2838_pcie_root_info = {
 static void bcm2838_pcie_register(void)
 {
     type_register_static(&bcm2838_pcie_root_info);
+    type_register_static(&bcm2838_pcie_host_info);
 }
 
 type_init(bcm2838_pcie_register)
diff --git a/include/hw/arm/bcm2838_pcie.h b/include/hw/arm/bcm2838_pcie.h
index 39828f817f..58c3a0efe7 100644
--- a/include/hw/arm/bcm2838_pcie.h
+++ b/include/hw/arm/bcm2838_pcie.h
@@ -16,6 +16,9 @@
 #include "hw/pci/pcie_port.h"
 #include "qom/object.h"
 
+#define TYPE_BCM2838_PCIE_HOST "bcm2838-pcie-host"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838PcieHostState, BCM2838_PCIE_HOST)
+
 #define TYPE_BCM2838_PCIE_ROOT "bcm2838-pcie-root"
 OBJECT_DECLARE_TYPE(BCM2838PcieRootState, BCM2838PcieRootClass,
                     BCM2838_PCIE_ROOT)
@@ -50,4 +53,23 @@ struct BCM2838PcieRootClass {
 };
 
 
+struct BCM2838PcieHostState {
+    /*< private >*/
+    PCIExpressHost parent_obj;
+
+    /*< public >*/
+    BCM2838PcieRootState root_port;
+
+    MemoryRegion cfg_regs;
+    MemoryRegion io_ioport;
+    MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
+
+    qemu_irq irq[BCM2838_PCIE_NUM_IRQS];
+    int irq_num[BCM2838_PCIE_NUM_IRQS];
+};
+
+int bcm2838_pcie_host_set_irq_num(BCM2838PcieHostState *s, int index, int spi);
+
 #endif /* BCM2838_PCIE_H */
-- 
2.34.1

