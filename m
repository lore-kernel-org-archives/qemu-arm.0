Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5184863lfb;
        Wed, 9 Dec 2020 10:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrMnMdK5HRgAwYICNHIgFTSiSaMjbz8Q49Ku5+unyMeHRgNFDHROpRu9ngLIHhTlGACSot
X-Received: by 2002:a25:374c:: with SMTP id e73mr5707578yba.376.1607538203041;
        Wed, 09 Dec 2020 10:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607538203; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrOOaVhKfd5iO4GVjbN/H9l+pPg7mk4CswJhbsS1rCoZZj+GKEmBpRmxHlkK5x/Fwa
         zXW867iaiER6SfCwAdTQtTl/BCb6mdMTLMFUl4ASBdh6RTFcIc7Fmh+EcS8fIST0Mw/3
         VAtz0rQZ50/8heouI4uKkqsUxTwkTi21DI+v0uDJ2Ai5766R4wZcqRSslnDi4yEJeCFl
         OZyI/MzQtbTGHUStIw/DkfNdxRnxawEx1zpIjhHhjP3voT+sp8H7iBywF4d3VUCev2aq
         31uVLnJMNL9gMnxbQm5LAn4b9BZRFZ9xw7VDC3y8peGsm59ZhZIkJMi/WiKD7kMQrd4+
         3lEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
        b=Mqe03aOhR3k/CAzsHo2V5QrSLGzpnrfaSk3zq2G0ivDBcnPvas2QpYyLkh32K2737O
         EGp6MgFsnNIBkuVWVoY8brCh1BPFKaeXFIbMrka/0n/xrb69OoPLFhdHXGFqvY7XxiRd
         Vo2aCgSMOZPfDzymPcrQg1QD4Ei5T2WsiJJfjfqeVg7h8vY3QOtfiV4RBE/qvxiS8AV8
         SMU5l45Hsb2GFcqgsRG09Ns7PGvk2CieFZavAXUcxkxEnX4kTQUj+6XG8QHL0xyXeMD1
         mXpw6hdIcrZ/Ut+Jx6WDEoxtJJoUw0l+QoHEXHywzz7BH3AbZZ0LpLg7Y/H1+Yazuzrn
         zVRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hj57EKP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si2676366ybd.53.2020.12.09.10.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 10:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hj57EKP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn47W-0006L4-DC
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 13:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sb-0001yC-Bq
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:08:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sS-0007vZ-TP
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
 b=hj57EKP+KjprEcy3z2asr1Kv3UjXQNXo8GEG1jY9iub1A6HJrqUzF6ijAdWHoSSxU+PZvm
 4Cjjdezs3TSZCGFRPiTuabEArAkY/DxPON7qERi5MuW7j46sLB1Z7R0wdWyxqrOU8h30t1
 Bg6UHMZgU3Wt3UBKAi1F2x+wDYwLOc0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-O_ZsA0VHOVuHMadlOd10zg-1; Wed, 09 Dec 2020 13:07:46 -0500
X-MC-Unique: O_ZsA0VHOVuHMadlOd10zg-1
Received: by mail-wm1-f70.google.com with SMTP id z12so863350wmf.9
 for <qemu-arm@nongnu.org>; Wed, 09 Dec 2020 10:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mzQ1+jPNPrN4c5K1M4rWE8GS0J7EkEqlO41LOzITqvE=;
 b=SUkiOhHil5UX3PA9shlFxL0y8jE3zl13CTaUcgQrAPEVJvyPndbQom9y4XGGViKcYN
 uQJKzSlybqpXY0jMlHo5AeeXS3yeycqbRbmTBb6/09sLnnDkgOZblf8CoX22ay8bD+dY
 Slqji3PtLDm9VVIJV+beJQAeS5dQn17CE4IrjFfc9ynFw4sl/5WpHhMh/rdGVmTb4czm
 qMH46wPa9KDKazgdP4JUryQqo67nLaRxm/kHuMkC0wMUZYAB0kTYPHNDtO4ptifqbcvw
 OgBfX7NvJjqj4GhSvvNeCqgSd3Jjw95RF+quNr2xpCo244bmFP/04Hfy9yMnOC3aKYue
 ej9A==
X-Gm-Message-State: AOAM533p4fIuHtUiN6bg+DVhFj6NG3Y77FcQHsP5V2TKb7rlzd9HZ4Ah
 fd8i/SUn6YRoqfHfmA+6ZKcEIWqilLYIZuaNFFeCU1DYmVJoJA4x3IrdtgoTiwMlYLEuemtNhXf
 c2Y4yuY0GHN9E
X-Received: by 2002:adf:e704:: with SMTP id c4mr4059582wrm.355.1607537265029; 
 Wed, 09 Dec 2020 10:07:45 -0800 (PST)
X-Received: by 2002:adf:e704:: with SMTP id c4mr4059563wrm.355.1607537264865; 
 Wed, 09 Dec 2020 10:07:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a21sm4561894wmb.38.2020.12.09.10.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:44 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/65] acpi/gpex: Build tables for pxb
Message-ID: <20201209180546.721296-13-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yubo Miao <miaoyubo@huawei.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ul/FmFiqIxli

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

