Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp366189lfg;
        Wed, 24 Mar 2021 06:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WKXsMatfNGhKH0DWLoKuJSWjQzJXIT0BOyj2B+7pPOeyhKD9t+6j7KzqFNSvXo0gC+yC
X-Received: by 2002:a05:6e02:1a89:: with SMTP id k9mr2590054ilv.29.1616591874794;
        Wed, 24 Mar 2021 06:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616591874; cv=none;
        d=google.com; s=arc-20160816;
        b=Mzp3CNIMDgcK3B//O3b+X3mwCUubjRj0kw40oI/kZzLxzWPQINKMJkHn8t3cocWn3G
         7XwABtQTzjG8AuyvJ7RD6qEfhojhNxUHn39fFgnF4ScPSDw3sE9+IoPXfOm2HeiyHNNi
         OM5PD6iCf9lb4/FOCVom+fky/0d5w8iCARth7T4FmxQ7NKXcK9+GXlBW7WljQRbKh01E
         Zj1PQhErQHVIeymMRbqG1KVZiUqp2lvcPVeQlkGc8DDZgLHfpOlg0hklJzvzwIwkYkZL
         eY+++oLGDi/WQvDqbx8iADovCEWdmtNwU2pOCREZXekQaeMG8zKr/PKfLe8TQ7urEyfh
         wYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=qSh0vkdMIHe4sQ6WQV9JhTvExPxM7UsMBUgdCnmssAw=;
        b=vNbapgNRvXoM2gZZInW7vQbzNZgHhxInc5UNI/A6R40HYRDe5pl6IoOGebg1EfOoIW
         /RGNOQ8XLEoCWtrg7GW2R/ZXJZB6JQ3zzqcLMeTGmNW+0C+eIGQ6JAY8Kjcxjo5l1rhz
         LUh3lmZERUDj4V2saKAUe21S3Wz9GY2RxxUvNCPEj17d78cGPFQfl9ZuxY7qSEYKPrFc
         rL+BDNr8+7F4OIkuFJ/xazTfVgku+jR9Oq0/Lt9fhRdeNetawOwymzj1nqDcxOhDOl/I
         oLykAWL1cUDMAVDeMqPehx72qBqcNooj1CkPVb+o9RcyTtTjTaFZRExYkc9HI6m4wTGH
         CGlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n82si1638120iod.64.2021.03.24.06.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 06:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lP3OU-0006YZ-2p
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 09:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nm-0006W3-4i; Wed, 24 Mar 2021 09:17:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Ni-0005UT-2a; Wed, 24 Mar 2021 09:17:09 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F57x954m7znW29;
 Wed, 24 Mar 2021 21:14:21 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:46 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 1/6] hw/pci/pci_host: Add iommu property for pci host
Date: Wed, 24 Mar 2021 13:16:30 +0000
Message-ID: <1616591795-2056-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
References: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 shannon.zhaosl@gmail.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uDuKDzWnX/jR

From: Xingang Wang <wangxingang5@huawei.com>

The pci host iommu property is useful to check whether
the iommu is enabled on the pci root bus.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c              | 18 +++++++++++++++++-
 hw/pci/pci_host.c         |  2 ++
 include/hw/pci/pci.h      |  1 +
 include/hw/pci/pci_host.h |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0eadcdbc9e..b82f39af10 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
     return rootbus->qbus.name;
 }
 
+bool pci_root_bus_has_iommu(PCIBus *bus)
+{
+    PCIBus *rootbus = bus;
+    PCIHostState *host_bridge;
+
+    if (!pci_bus_is_root(bus)) {
+        rootbus = pci_device_root_bus(bus->parent_dev);
+    }
+
+    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
+
+    assert(host_bridge->bus == rootbus);
+
+    return host_bridge->iommu;
+}
+
 static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
                               MemoryRegion *address_space_mem,
                               MemoryRegion *address_space_io,
@@ -2715,7 +2731,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (pci_root_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..92ce213b18 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
+    DEFINE_PROP_BOOL("pci-host-iommu-enabled", PCIHostState,
+                     iommu, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1bc231480f..300332bc2c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -479,6 +479,7 @@ void pci_for_each_bus(PCIBus *bus,
 
 PCIBus *pci_device_root_bus(const PCIDevice *d);
 const char *pci_root_bus_path(PCIDevice *dev);
+bool pci_root_bus_has_iommu(PCIBus *bus);
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
 int pci_qdev_find_device(const char *id, PCIDevice **pdev);
 void pci_bus_get_w64_range(PCIBus *bus, Range *range);
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 52e038c019..64128e3a19 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -43,6 +43,7 @@ struct PCIHostState {
     uint32_t config_reg;
     bool mig_enabled;
     PCIBus *bus;
+    bool iommu;
 
     QLIST_ENTRY(PCIHostState) next;
 };
-- 
2.19.1

