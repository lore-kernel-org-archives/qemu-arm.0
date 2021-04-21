Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp217860lfb;
        Wed, 21 Apr 2021 01:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRGcxU6PqC57t6veSoh9yAhNkwYVyS/e//ZqlyznlcS7kuUtgi6nAPVxJjVRkthtHpZ4eK
X-Received: by 2002:a67:8007:: with SMTP id b7mr23429651vsd.29.1618992450563;
        Wed, 21 Apr 2021 01:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992450; cv=none;
        d=google.com; s=arc-20160816;
        b=YK4/tIzje+dn+EB6KxJQT0huY4PIEnOEr6PNS9Q7AZd0RXOY9tcVj/VUZJRcDqsMOt
         yxdYlOhJ199e86KFWKWbTuJlN6tBH05K5E3kPWEUz70O/5OFzLAfLSJ+K0g0zNRZX61d
         5sOoF0uLA81JuIOOYLXCSrS2UGAcwQIcFGcCtzFYS07OApQV6HGQfhLqrz/0JexQZFRC
         QJLqnN4qCPpeBBa5D0I9ECpH+SsswcaWnPTKwj+qew72/liJat15c0IyRl7hSUpL8DKV
         KwGGEOJpnPGtGD+YWbiK6vVbw0NR2n8JT5aMdlukLHc09JC/vUfgid4UqQpguZZ6fw+k
         P/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=SwGuPGkovXpkgJZ/lKT+UV2C720S44Dfgq7rt43w9mI=;
        b=T2F6C3+RU89nKNSmzpvJdfDXHBhh/BR3w1GMqm5kMSkal5a9FhzR5aECQngrvpxas+
         w+Oyoj6LziPjfvb7NRY3tH7Wh46sTwniHp3L1wleCE2JXX+y5fjYo9mJrnVfBKgc7q8/
         +sOcqwUGc8AQTQhNoFozruYyJ9eDgKv6J9c7XFuxUPcZOgBxlyq8PrwxVLOu+ojwYHuI
         Z6vuff4MEamOCd82vBLCexCTuGSGLTJv37INA/8Woy/s5grBXzZBETBF9GqBvSpuPCXY
         mLoV4yoRPYAeLuFsSBlc4OvbxBIjsxIe/gvhdrZM7DXmpZVY0pov7nlvjHWlIryimkvd
         JM8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f189si482322vkh.85.2021.04.21.01.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7tR-0002vv-MQ
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rZ-00018a-Pq; Wed, 21 Apr 2021 04:05:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rW-0001xu-QX; Wed, 21 Apr 2021 04:05:33 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQChB2Z4xzPrbG;
 Wed, 21 Apr 2021 16:02:18 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:13 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 1/8] hw/pci/pci_host: Allow bypass iommu for pci host
Date: Wed, 21 Apr 2021 08:04:56 +0000
Message-ID: <1618992303-19556-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MnKA7IgjaGYI

From: Xingang Wang <wangxingang5@huawei.com>

This add a bypass_iommu property for pci host, which indicates
whether devices attached to the pci root bus will bypass iommu.
In pci_device_iommu_address_space(), add a bypass_iommu check
to avoid getting iommu address space for devices bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c              | 18 +++++++++++++++++-
 hw/pci/pci_host.c         |  2 ++
 include/hw/pci/pci.h      |  1 +
 include/hw/pci/pci_host.h |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8f35e13a0c..301addfb35 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -417,6 +417,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
     return rootbus->qbus.name;
 }
 
+bool pci_bus_bypass_iommu(PCIBus *bus)
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
+    return host_bridge->bypass_iommu;
+}
+
 static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
                               MemoryRegion *address_space_mem,
                               MemoryRegion *address_space_io,
@@ -2719,7 +2735,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..2768db53e6 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
+    DEFINE_PROP_BOOL("pci-host-bypass-iommu", PCIHostState,
+                     bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..f4d51b672b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
 
 PCIBus *pci_device_root_bus(const PCIDevice *d);
 const char *pci_root_bus_path(PCIDevice *dev);
+bool pci_bus_bypass_iommu(PCIBus *bus);
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
 int pci_qdev_find_device(const char *id, PCIDevice **pdev);
 void pci_bus_get_w64_range(PCIBus *bus, Range *range);
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 52e038c019..c6f4eb4585 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -43,6 +43,7 @@ struct PCIHostState {
     uint32_t config_reg;
     bool mig_enabled;
     PCIBus *bus;
+    bool bypass_iommu;
 
     QLIST_ENTRY(PCIHostState) next;
 };
-- 
2.19.1

