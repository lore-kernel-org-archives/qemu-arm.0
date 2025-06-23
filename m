Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2434853dyb;
        Mon, 23 Jun 2025 02:44:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW+sbfuaiTRKn74b3GrkZF0JFOpeBdnMVJ3MonCyhpUhfqaOTY3NG2rnO6pcjVgQz8ibgNQdaHRY7b5A==@linaro.org
X-Google-Smtp-Source: AGHT+IElzRzKaPkh+KKcTcgkr3KLwQd1yzh/2lCo2DC3oX2jgOWPf+Z7uBDUUu3ifO+rlLzozsCg
X-Received: by 2002:a05:622a:246:b0:4a6:c5ea:6fc with SMTP id d75a77b69052e-4a77a246283mr133490951cf.42.1750671873561;
        Mon, 23 Jun 2025 02:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750671873; cv=none;
        d=google.com; s=arc-20240605;
        b=hbSJ6ISPKiJwP7K5IB/m40atYlyiY0zf4M1IDD76palU7Jq2WSi7P4CjTlRS+hGMrh
         WsWLvxfiM9z9jAbzqTfebMV1Hm26uo7UznhX6SLA9WMRc8gAyHwjfNsWrug4rfCnr5tM
         kvBY3xCIoAqM4/zxHElYLIM3D+Q04G87FtY887wchO59QieO0fk4yRPNSV3I+yxKr0ig
         FTa0gTD5xBYnR8LNCHu8WxeOvnzfGBRDUC1tjGw81US/Y6kYnfT8c/NzCuaHJyfA8rVQ
         c77B++k8rjXWJIhpA3vzsISV9EaaTuBvNxjuI9gL1qLTFkqNTKAsjOegJjNw35GR8m3p
         hIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=7mqpsaIgArTVND7ZiH97zVJAMmrTeqQex96+4WY+nOM=;
        fh=y6a9dndW+0CJHcvYdghYwLzdcwMeXoOVhEZ+ThybITY=;
        b=cMOBQuWHL/0zcSgL1EmqQm0/1lM/C6LNSOTW02+TKg6drFRW8uT2DUlCJ+OQ0cJZb2
         LLA7uonBr13erayuBpGIuo8saQ3Upt0voFdkB9NHyoF+MBilF8ZzTCnD/vgNPPstUuw2
         UN6ZFrqN/Ln2/0nDQXS1QnSq5QQf4au10a4VnBeZmNJJirobP8IoqzD+tMQTTz0Lw/Wq
         vcSwsiCRoVyowKRquICdKwgtoqp84NHGy1rXAWe8jndglRhDRstqs4hovr9nsBN1YVKC
         4TRewPge4sdS/rJ+6nusVw9yaikxYbJQwv4BCtD0rjiQqj2Om0RzrVmDI3IoALrKNOx6
         Jk3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0b6843si79533371cf.382.2025.06.23.02.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 02:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTdiu-00052q-0m; Mon, 23 Jun 2025 05:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdim-0004zR-8O; Mon, 23 Jun 2025 05:44:12 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdik-0002fX-3b; Mon, 23 Jun 2025 05:44:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQjnS0RR2z6M52q;
 Mon, 23 Jun 2025 17:43:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 8B93E1402F4;
 Mon, 23 Jun 2025 17:44:06 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Jun 2025 11:43:57 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v5 06/11] hw/pci: Introduce pci_setup_iommu_per_bus() for
 per-bus IOMMU ops retrieval
Date: Mon, 23 Jun 2025 10:42:25 +0100
Message-ID: <20250623094230.76084-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: d6pDPE/k3uuQ

Currently, pci_setup_iommu() registers IOMMU ops for a given PCIBus.
However, when retrieving IOMMU ops for a device using
pci_device_get_iommu_bus_devfn(), the function checks the parent_dev
and fetches IOMMU ops from the parent device, even if the current
bus does not have any associated IOMMU ops.

This behavior works for now because QEMU's IOMMU implementations are
globally scoped, and host bridges rely on the bypass_iommu property
to skip IOMMU translation when needed.

However, this model will break with the soon to be introduced
arm-smmuv3 device, which allows users to associate the IOMMU
with a specific PCIe root complex (e.g., the default pcie.0
or a pxb-pcie root complex).

For example, consider the following setup with multiple root
complexes:

-device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0 \
...
-device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
-device pcie-root-port,id=pcie.port1,bus=pcie.1 \
-device virtio-net-pci,bus=pcie.port1

In Qemu, pxb-pcie acts as a special root complex whose parent is
effectively the default root complex(pcie.0). Hence, though pcie.1
has no associated SMMUv3 as per above, pci_device_get_iommu_bus_devfn()
will incorrectly return the IOMMU ops from pcie.0 due to the fallback
via parent_dev.

To fix this, introduce a new helper pci_setup_iommu_per_bus() that
explicitly sets the new iommu_per_bus field in the PCIBus structure.
Update pci_device_get_iommu_bus_devfn() to use this when determining
the correct IOMMU ops, ensuring accurate behavior for per-bus IOMMUs.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
Please refer cover letter for more details on the issue that
this is trying to fix.
---
 hw/pci/pci.c             | 25 +++++++++++++++++++++++++
 include/hw/pci/pci.h     |  2 ++
 include/hw/pci/pci_bus.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c70b5ceeba..e1940c05d9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2909,6 +2909,19 @@ static void pci_device_get_iommu_bus_devfn(PCIDevice *dev,
             }
         }
 
+        /*
+         * When multiple PCI Express Root Buses are defined using pxb-pcie,
+         * the IOMMU configuration may be specific to each root bus. However,
+         * pxb-pcie acts as a special root complex whose parent is effectively
+         * the default root complex(pcie.0). Ensure that we retrieve the
+         * correct IOMMU ops(if any) in such cases.
+         */
+        if (pci_bus_is_express(iommu_bus) && pci_bus_is_root(iommu_bus)) {
+            if (!iommu_bus->iommu_per_bus && parent_bus->iommu_per_bus) {
+                break;
+            }
+        }
+
         iommu_bus = parent_bus;
     }
 
@@ -3169,6 +3182,18 @@ void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
     bus->iommu_opaque = opaque;
 }
 
+/*
+ * This is same as pci_setup_iommu() except it sets the iommu_per_bus
+ * to true indicating the iommu is specific to this bus and
+ * not applicable to any parent or child.
+ */
+void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
+                             void *opaque)
+{
+    pci_setup_iommu(bus, ops, opaque);
+    bus->iommu_per_bus = true;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index df3cc7b875..a3e0870a15 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -764,6 +764,8 @@ int pci_iommu_unregister_iotlb_notifier(PCIDevice *dev, uint32_t pasid,
  */
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque);
 
+void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque);
+
 pcibus_t pci_bar_address(PCIDevice *d,
                          int reg, uint8_t type, pcibus_t size);
 
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 2261312546..c738446788 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -35,6 +35,7 @@ struct PCIBus {
     enum PCIBusFlags flags;
     const PCIIOMMUOps *iommu_ops;
     void *iommu_opaque;
+    bool iommu_per_bus;
     uint8_t devfn_min;
     uint32_t slot_reserved_mask;
     pci_set_irq_fn set_irq;
-- 
2.34.1

