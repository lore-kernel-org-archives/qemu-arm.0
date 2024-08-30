Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp125494njf;
        Thu, 29 Aug 2024 21:17:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS8DfZ1n4Nn9tZinDm1t0vMMWIqFwOrFODts9Y0BGEugw9P7Qhj9gh7ntERV3uj9x9XXoP75wLBJYpoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnGFrQR6cWy3CihmJ/h8Bppi8pq94xflznn+CDxj70wRUpfbrc+IHGmsO67cE4nFf06RW2
X-Received: by 2002:a05:6214:5bc5:b0:6b5:61:53a9 with SMTP id 6a1803df08f44-6c33e629f7cmr60350896d6.28.1724991444798;
        Thu, 29 Aug 2024 21:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724991444; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ6p94vrkqL9p/P0GbHu0VA4CZTmnMQNY/PyjCAGlEUCGt8ZOkUdZXKTFYsBy5tEIC
         XZF8iqgkPWGXCgiEjPtHuxPgVbONJuuT80bOG0XUinRdadaZUH2ISL8b0n5W9OAsZdmH
         mluFfoShU/1dYsocddS/DWV7RmWr6g7bR3nWLxeFncuSV0UjcvIrzAqNryQ6pP0pOWfQ
         cb3x0Sj4gAOFonfzu1hJY/eWq81hRGrVrU3JV9JQoqifp5y0loZa2JW+w/nyhCzGGeUH
         qlouXAoKOXIxEajZyldk/d6dUtIXeOxahUVVvnfSd5uSYdgjvj0Zw10F2nvAn45FzExp
         l2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TKaPO5r3baP9uVIgLbWIZzwFodx5FbH5S7f5bOHfguY=;
        fh=/h09bVioAV4yu/E3g+1edoyb8Le1SBCky9cY4Yrmy7Q=;
        b=nMMOwdf2P4gmQtKZqSgqcQNWsbzUpRE89vu8AW95bAtnBFC8ek2CafcvWJgmi63ARp
         IeJLglOrdcDwSS/NPDZHE+LfFn3KsPhwa0/X5Rxt4BfPHKpa0TaAqior/wyshzB9r6h9
         RKaJ6HttbL49rAnOelva1Uebhz4CeDJOibXHPsyiYYx4B7lr/K8V/7GKOAzh5gknCMyQ
         SYWPqObiZnh9Iu6vPCVd72efCwxblQymx3kJvzp6hxgzgS4t3HgR3MBnH3BHcU8e8ixj
         epWfembIwKsCYrUrc2s0Jm8dz6O1W93tP1Khjw9Vg/6lCc0YgjPl8whDNcVbZ63euUYt
         r5dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340dbfbbesi30502556d6.584.2024.08.29.21.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 21:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjt3z-0005qs-4G; Fri, 30 Aug 2024 00:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1sjt3s-0005g7-AX; Fri, 30 Aug 2024 00:16:36 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1sjt3q-0001hF-7s; Fri, 30 Aug 2024 00:16:36 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwCHjSGWR9Fmws5CAg--.63162S2;
 Fri, 30 Aug 2024 12:16:22 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwC34bGOR9FmmakpAA--.16568S4;
 Fri, 30 Aug 2024 12:16:21 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: Jonathan.Cameron@Huawei.com, quic_llindhol@quicinc.com,
 peter.maydell@linaro.org, marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 chenbaozi@phytium.com.cn, wangyinfeng@phytium.com.cn,
 shuyiqi@phytium.com.cn, Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [RFC PATCH 1/2] hw/arm/sbsa-ref: Enable CXL Host Bridge by pxb-cxl
Date: Fri, 30 Aug 2024 12:15:56 +0800
Message-Id: <20240830041557.600607-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830041557.600607-1-wangyuquan1236@phytium.com.cn>
References: <20240830041557.600607-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwC34bGOR9FmmakpAA--.16568S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQANAWbQ2MkCWwAAsz
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr48Jr1UGFy5KFWrJFyrZwb_yoWrXFyUpF
 45ur95CrW8GF17ArZ3Z347GF45Wayvkayjyry7Cr9YyF17Gr1Fq3ykK3WUKa47JFWDt34j
 9FZxZr1fWr17AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: f7J+46b8V8GU

The memory layout places 1M space for 16 host bridge register regions
in the sbsa-ref memmap. In addition, this creates a default pxb-cxl
(bus_nr=0xfe) bridge with one cxl-rp on sbsa-ref.

Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 54 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ae37a92301..dc924d181e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -41,7 +41,10 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/usb/xhci.h"
@@ -52,6 +55,8 @@
 #include "qom/object.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
+#include "hw/cxl/cxl.h"
+#include "hw/cxl/cxl_host.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
@@ -94,6 +99,7 @@ enum {
     SBSA_SECURE_MEM,
     SBSA_AHCI,
     SBSA_XHCI,
+    SBSA_CXL_HOST,
 };
 
 struct SBSAMachineState {
@@ -105,6 +111,9 @@ struct SBSAMachineState {
     int psci_conduit;
     DeviceState *gic;
     PFlashCFI01 *flash[2];
+    CXLState cxl_devices_state;
+    PCIBus *bus;
+    PCIBus *cxlbus;
 };
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
@@ -132,6 +141,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
     [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
+    /* 1M CXL Host Bridge Registers space (64KiB * 16) */
+    [SBSA_CXL_HOST] =           { 0x60120000, 0x00100000 },
     /* Space here reserved for other devices */
     [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
     /* 32-bit address PCIE MMIO space */
@@ -631,6 +642,26 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     }
 }
 
+static void create_pxb_cxl(SBSAMachineState *sms)
+{
+    CXLHost *host;
+    PCIHostState *cxl;
+
+    sms->cxl_devices_state.is_enabled = true;
+
+    DeviceState *qdev;
+    qdev = qdev_new(TYPE_PXB_CXL_DEV);
+    qdev_prop_set_uint32(qdev, "bus_nr", 0xfe);
+
+    PCIDevice *dev = PCI_DEVICE(qdev);
+    pci_realize_and_unref(dev, sms->bus, &error_fatal);
+
+    host = PXB_CXL_DEV(dev)->cxl_host_bridge;
+    cxl = PCI_HOST_BRIDGE(host);
+    sms->cxlbus = cxl->bus;
+    pci_create_simple(sms->cxlbus, -1, "cxl-rp");
+}
+
 static void create_pcie(SBSAMachineState *sms)
 {
     hwaddr base_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
@@ -682,12 +713,25 @@ static void create_pcie(SBSAMachineState *sms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    sms->bus = pci->bus;
+
+    pci_init_nic_devices(sms->bus, mc->default_nic);
 
-    pci_init_nic_devices(pci->bus, mc->default_nic);
+    pci_create_simple(sms->bus, -1, "bochs-display");
 
-    pci_create_simple(pci->bus, -1, "bochs-display");
+    create_smmu(sms, sms->bus);
 
-    create_smmu(sms, pci->bus);
+    create_pxb_cxl(sms);
+}
+
+static void create_cxl_host_reg_region(SBSAMachineState *sms)
+{
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *mr = &sms->cxl_devices_state.host_mr;
+
+    memory_region_init(mr, OBJECT(sms), "cxl_host_reg",
+                       sbsa_ref_memmap[SBSA_CXL_HOST].size);
+    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_CXL_HOST].base, mr);
 }
 
 static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
@@ -823,6 +867,10 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_pcie(sms);
 
+    create_cxl_host_reg_region(sms);
+
+    cxl_hook_up_pxb_registers(sms->bus, &sms->cxl_devices_state, &error_fatal);
+
     create_secure_ec(secure_sysmem);
 
     sms->bootinfo.ram_size = machine->ram_size;
-- 
2.34.1

