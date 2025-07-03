Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp392142dyc;
        Thu, 3 Jul 2025 01:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDRA5MTa+CnwTI14kQmog9FcZuuKOywixvGm6SEdiJlGoiZlDMw/jPyQVY5YQ+xLsDkGMkTSW1JOY/Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFkB+GCLRdRSxdL5tELWxX4FZ1bRtHaSjOSFvYQGACIuBPSddgLyGYEF52B1C7lycNcb62E
X-Received: by 2002:a05:620a:19a6:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d5c470411dmr844676785a.29.1751532522854;
        Thu, 03 Jul 2025 01:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751532522; cv=none;
        d=google.com; s=arc-20240605;
        b=EeaoOZi3N/fYf/zrX4i06Tn7iSvwRQenrYjrdBFk1WTZDkpvKjAd4ev9ftUHIUw6gC
         8OXuTlHXTfK9m2QTqhm7DnUyvOX0hZRLseoAMSD46zjOPNd5BTjngq8qPAdzvav1sgl8
         Ggw8XUo/W2oHh/I+epLKwXkN6S9X7I9g8Se24HgFAAtXOBkDHyLc8cXwVV2UUtFimWF8
         lmFMFC9k2sUDgdBNvy3g89D2qlyUCD8j//dECqlijUmFdzZ6oshAX9NwLIlE5cvr3ypV
         /P28OhNj+c/ketcE2NiaiGM7JtNd5J3aK46RZj2r3HBiNxJK/4uQwyYQrIfO9E+KmQtR
         eH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=iWjrqDikZhXVixk4CRucePJEj7QfLFI2N9OgQfn3zcc=;
        fh=K6DRGZ9v0QUPI5y28IyZ3JGzxcTK+mf/rR6Wgk4w8yA=;
        b=BDlSveCzYCe9rDV3d+L2SYwHgb+i4s41lY4SBubPYuozx3Ln3AW5KN/GJr2EhmiLSy
         MWiNHoeAC6rPeZ4ryhwGTctu4bsfUzVO2CTkqSnz8dcviyUvNEg5cvNKtABCAKu1zM7/
         nVKfNML6Jkbzday7QCKguobXAgiibS6fCHFfu455evz+Ntzz6mo8Gl01x6EKJ2hojqyh
         dlzH8G9MHdOoBDmO09ejo0gB5AGtE8Mb5ozreFrBT6plEdsqvMUAOej8tcY5u92jFyWE
         HgaJGfvjdPoq6I0FkqkS7Km1crUkaqetwCXx/gDhjESc2m6aCtE38A4n5WM1fsiSbRfH
         FgGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443193084si1520725385a.38.2025.07.03.01.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 01:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFbn-0006e3-KW; Thu, 03 Jul 2025 04:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFbf-0006cG-P6; Thu, 03 Jul 2025 04:47:47 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFbZ-0003yt-GJ; Thu, 03 Jul 2025 04:47:47 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXr3x0zS5z6L5Ds;
 Thu,  3 Jul 2025 16:47:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id A57671402F3;
 Thu,  3 Jul 2025 16:47:37 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 10:47:28 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v6 02/12] hw/arm/smmu-common: Check SMMU has PCIe Root Complex
 association
Date: Thu, 3 Jul 2025 09:46:33 +0100
Message-ID: <20250703084643.85740-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aXrC/Eqay7MT

We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
root complexes to be associated with SMMU.

Although this change does not affect functionality at present, it is
required when we add support for user-creatable SMMUv3 devices in
future patches.

Note: Added a specific check to identify pxb-pcie to avoid matching
pxb-cxl host bridges, which are also of type PCI_HOST_BRIDGE. This
restriction can be relaxed once support for CXL devices on arm/virt
is added and validated with SMMUv3.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Nathan Chen <nathanc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmu-common.c                | 29 ++++++++++++++++++++++++++---
 hw/pci-bridge/pci_expander_bridge.c |  1 -
 include/hw/pci/pci_bridge.h         |  1 +
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f39b99e526..b15e7fd0e4 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "hw/core/cpu.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/jhash.h"
@@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
     SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
+    PCIBus *pci_bus = s->primary_bus;
     Error *local_err = NULL;
 
     sbc->parent_realize(dev, &local_err);
@@ -937,11 +939,32 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
                                      g_free, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
-    if (s->primary_bus) {
-        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
-    } else {
+    if (!pci_bus) {
         error_setg(errp, "SMMU is not attached to any PCI bus!");
+        return;
+    }
+
+    /*
+     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
+     * root complexes to be associated with SMMU.
+     */
+    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
+        object_dynamic_cast(OBJECT(pci_bus)->parent, TYPE_PCI_HOST_BRIDGE)) {
+        /*
+         * For pxb-pcie, parent_dev will be set. Make sure it is
+         * pxb-pcie indeed.
+         */
+        if (pci_bus->parent_dev) {
+            if (!object_dynamic_cast(OBJECT(pci_bus), TYPE_PXB_PCIE_BUS)) {
+                goto out_err;
+            }
+        }
+        pci_setup_iommu(pci_bus, &smmu_ops, s);
+        return;
     }
+out_err:
+    error_setg(errp, "SMMU should be attached to a default PCIe root complex"
+               "(pcie.0) or a pxb-pcie based root complex");
 }
 
 /*
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 3a29dfefc2..1bcceddbc4 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -34,7 +34,6 @@ typedef struct PXBBus PXBBus;
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
                          TYPE_PXB_BUS)
 
-#define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_PCIE_BUS,
                          TYPE_PXB_PCIE_BUS)
 
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 8cdacbc4e1..a055fd8d32 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -104,6 +104,7 @@ typedef struct PXBPCIEDev {
     PXBDev parent_obj;
 } PXBPCIEDev;
 
+#define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
 #define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
 #define TYPE_PXB_DEV "pxb"
 OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)
-- 
2.34.1

