Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp149326lfg;
        Thu, 25 Mar 2021 00:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfjTLTl65EZcBo9JX5Qd7r2FpYAR3ll8dqAq9jkdKvDUHlo9dhCTAoesoJasmwQPkJSQtQ
X-Received: by 2002:a25:81ce:: with SMTP id n14mr2016257ybm.33.1616657134517;
        Thu, 25 Mar 2021 00:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616657134; cv=none;
        d=google.com; s=arc-20160816;
        b=Leyx1j9OOIv/Y5EtTCEBnLXWarqFZFX7Tjo3sryblTvrF9YFHlNuvWpq4YgTTK2ehc
         dQv5bAJURH66629PRxPhatWXoHThXpHZXgzS4g/R9y+PqJ7F3NehfOVmb2L1LJHtXmE2
         cF8DE+snroSa6NvO9JFre1VXGn8i+xh7prvWybY6+r3xLjQNGz91iPuMix623ksk9eXY
         moVJwAo9Aq5AWGUOVX2jK0+2FB/U6l/rUtJISACxwP6mvkjNE4awolxpiu0zjJMXI0dp
         fZRpkEsw7HMhR/OI9E1v4qD7b/w11IVmez06E7wyH6QIoTFEkEkiblaVufWIfZOzyyF0
         bGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=xaCMJS0wxDBjmn483/cJOkkpj80X8i83KmBSDEnE4JY=;
        b=zkiPPV93aSe3ypBPtRbLdZG0k1AMHkwVtMfB8CXGyQK9XIb79RWsMYHm61sIBQV28X
         e9HcB3tTdIGxav4mGyjST2f61ftMRnOkrzm10GnoK8dyvbqmHQD6VUBy+F1Kz2z5SMzn
         P869DR+GXGmfZDQ+g9PkmZywPvI0fmubjAPFFuinqw84zDdT502J/3q9wo4i3XJr/xgg
         kd4gT1yBuH11/JxuXiJVLNBZ9sczf1ElNbXxeE5nOdzkphUZUD+VL8T0T3itVFLtXOxz
         qO3Anu/NCe/x6sQSjArTEfxjfcocNqiBcARhoLjVzkmmhvfca5TqmkK4bg49hpk38Th2
         gW7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si4810651ybr.235.2021.03.25.00.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 00:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPKN3-0006Tm-QU
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 03:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKx-0004Ov-2E; Thu, 25 Mar 2021 03:23:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKt-0002zP-My; Thu, 25 Mar 2021 03:23:22 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5c3F1s9BzrZjc;
 Thu, 25 Mar 2021 15:21:13 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 15:23:05 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC RESEND v2 1/6] hw/pci/pci_host: Add iommu property for pci
 host
Date: Thu, 25 Mar 2021 07:22:40 +0000
Message-ID: <1616656965-23328-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3dni7jMOQ9V2

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
index ac9a24889c..e17aa9075f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -417,6 +417,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
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
@@ -2716,7 +2732,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
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
index 6be4e0c460..718b5a454a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
 
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

