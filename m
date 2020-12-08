Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4312247lfb;
        Tue, 8 Dec 2020 11:55:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxySJJ/yEo+j03JETwNHrifi+4hCFWRk4NkjbG9ntYKkOY4IIVLaeiem9iOSiBEDTxAViWZ
X-Received: by 2002:a25:c052:: with SMTP id c79mr18788508ybf.287.1607457301328;
        Tue, 08 Dec 2020 11:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607457301; cv=none;
        d=google.com; s=arc-20160816;
        b=goACDQAZ+bZai/7TXxU+A1SK+KxTr41X2zQ1t+QqTHaccTki4jV0TpLcPV6cGR/jLV
         dyAMC7qJ2WoyGawqkq8qfANqSlfvbVrdQDeQLrxr5OOE69ePdAa01y1rgujxb7xZUL6Y
         xuPqPKJOQlHISa3CgCTq6N1dbNNnXOlUkvthShuadx7vswOZ4pjewO+0n99NYZWwr441
         +yZMMfVa5zv/nqaMsGQgQ+xIjQTMts5S7E8E4pypETU6M35inF+iWFX4FE14hwB9MFON
         5dcEyCLjoxGJ9BH5vt5vhPggK9MCtpjBiFsZeuiDCLl/y8uZDtSrmb2IcMN6xKRPrucV
         fXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
        b=ve7X5GEBSzBAzYkdoGGPxHhZm+jPiej7QK1GmrvbOGEGLTIx7Gzp6Vt3PNDbSyzqbZ
         nJXhdqEHycCaj5+M/mxIWppGKWMhoFTggQ3cRunSBVXU+JQYrjm+QpLCf5ZPYrsWTT2p
         u5UbEC+txAeIvbIdtJqYaT9vSGuEeL6K3wwRIyUp8rgB1fPGdVOy+sI3J7VBGm4hDm6v
         DwM/cgAafhaQERArUQcgMdWfijYQWZFVXk0wHvRkZJRObBe0U1Iap8KW7FnKodJCJugd
         MTV8pjiqqrX1QbMBj67YCK50UcJ+4+/HT/coSzZga20Z+/iSYGwmadIFZucbT4IJx5kI
         S+Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i1Mo7B4v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si15208257ybq.41.2020.12.08.11.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 11:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i1Mo7B4v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmj4e-0007En-Mw
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 14:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmiko-00058q-Ma
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikk-0004qw-Ih
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
 b=i1Mo7B4vtFXjCft/uXFRMsYN9L0TwASXQ30v0gZmO9AR7YzuA0tsswHLrzlJtD5FjbcOH6
 2XZHLu/2XiRytXFLk3dwPf2mQhZ4UA3eRGxpxqGOdsH+uL1GmPfzOiznpccTXDpsVfDHOO
 bWitTbAANMovYl5hnq04PNQbYevvXN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-dOSxjp3VNT245zx9xCmGaw-1; Tue, 08 Dec 2020 14:34:21 -0500
X-MC-Unique: dOSxjp3VNT245zx9xCmGaw-1
Received: by mail-wr1-f69.google.com with SMTP id w8so3196670wrv.18
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
 b=WU4YfQ8ZE3/88suAFgDf7nCjetOB+jyVnHtcn0i6evyyRerWyNwNhZs0Od/lZGjSE3
 Q5VeXcdlE1QYEkLm1oIIzYgqd9+WgmtLOix/lLvRLPHjY4Myd7QGgp1d+TzvLhZ16I9n
 jlGdUHI18cx5KNRVCooNQZTS6qwUaaRih30Inlzsxyc2fqdT2d4cCaScH2fkdglDr85F
 bnQvvrJUOEiM/F5fESjT5UCkGO6QkHKLz9ZqenCp5L3hgAqCD0HnjZKXkyKC7FBA7P41
 IxM/xNapdTjHTlM1e9ItO00BV4ngRwvFwOJ++6nXPvO0qAoWQe169kaLLgdgrYdpJoYN
 mBXA==
X-Gm-Message-State: AOAM531np2HSfhtO1nrdHioYQ5t6k9H26i3251YyMRloP2+knYUHGg9X
 CjPoFPVcdNI9T2qOBTZgTz9qxpCEPPfO5Q/O+MDD+2vI4V+DXhY//D+jbfBl7WpG44cs4mUjONc
 FWMFC8ggUA2EEHcgVlcUtGLc7AJ4KRN5CaeOFxFYcjXNM0Fr3Nkp15muywwwP
X-Received: by 2002:a1c:6383:: with SMTP id x125mr5271899wmb.46.1607456059126; 
 Tue, 08 Dec 2020 11:34:19 -0800 (PST)
X-Received: by 2002:a1c:6383:: with SMTP id x125mr5271880wmb.46.1607456058870; 
 Tue, 08 Dec 2020 11:34:18 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id n12sm12363033wrg.76.2020.12.08.11.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:18 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/66] acpi/gpex: Build tables for pxb
Message-ID: <20201208193307.646726-13-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yubo Miao <miaoyubo@huawei.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kq7wfDBlTiXj

From: Yubo Miao <miaoyubo@huawei.com>

The resources of pxbs are obtained by crs_build and the resources
used by pxbs would be moved from the resources defined for host-bridge.

The resources for pxb are composed of following two parts:
1. The bar space of the pci-bridge/pcie-root-port behined it
2. The config space of devices behind it.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-6-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci-host/gpex.h |  1 +
 hw/arm/virt-acpi-build.c   |  6 +++--
 hw/pci-host/gpex-acpi.c    | 54 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d52ea80d4e..d48a020a95 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -59,6 +59,7 @@ struct GPEXConfig {
     MemMapEntry mmio64;
     MemMapEntry pio;
     int         irq;
+    PCIBus      *bus;
 };
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9747a6458f..e0bed9037c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -153,7 +153,8 @@ static void acpi_dsdt_add_virtio(Aml *scope,
 }
 
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
-                              uint32_t irq, bool use_highmem, bool highmem_ecam)
+                              uint32_t irq, bool use_highmem, bool highmem_ecam,
+                              VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(highmem_ecam);
     struct GPEXConfig cfg = {
@@ -161,6 +162,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .pio    = memmap[VIRT_PCIE_PIO],
         .ecam   = memmap[ecam_id],
         .irq    = irq,
+        .bus    = vms->bus,
     };
 
     if (use_highmem) {
@@ -609,7 +611,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem, vms->highmem_ecam);
+                      vms->highmem, vms->highmem_ecam, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 32a9f2796d..7f20ee1c98 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -1,6 +1,10 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/arm/virt.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pcie_host.h"
 
 static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
@@ -124,7 +128,57 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 {
     int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
     Aml *method, *crs, *dev, *rbuf;
+    PCIBus *bus = cfg->bus;
+    CrsRangeSet crs_range_set;
 
+    /* start to construct the tables for pxb */
+    crs_range_set_init(&crs_range_set);
+    if (bus) {
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            uint8_t bus_num = pci_bus_num(bus);
+            uint8_t numa_node = pci_bus_numa_node(bus);
+
+            if (!pci_bus_is_root(bus)) {
+                continue;
+            }
+
+            /*
+             * 0 - (nr_pcie_buses - 1) is the bus range for the main
+             * host-bridge and it equals the MIN of the
+             * busNr defined for pxb-pcie.
+             */
+            if (bus_num < nr_pcie_buses) {
+                nr_pcie_buses = bus_num;
+            }
+
+            dev = aml_device("PC%.02X", bus_num);
+            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
+            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
+            aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
+            if (numa_node != NUMA_NODE_UNASSIGNED) {
+                aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
+            }
+
+            acpi_dsdt_add_pci_route_table(dev, cfg->irq);
+
+            /*
+             * Resources defined for PXBs are composed by the folling parts:
+             * 1. The resources the pci-brige/pcie-root-port need.
+             * 2. The resources the devices behind pxb need.
+             */
+            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
+            aml_append(dev, aml_name_decl("_CRS", crs));
+
+            acpi_dsdt_add_pci_osc(dev);
+
+            aml_append(scope, dev);
+        }
+    }
+    crs_range_set_free(&crs_range_set);
+
+    /* tables for the main */
     dev = aml_device("%s", "PCI0");
     aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
-- 
MST

