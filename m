Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp301547lfg;
        Thu, 8 Jul 2021 06:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw18/ddQRa2S+SdKX1aO3/bod9g1D+Moo/yKBjo0DX5hxBCAFumNEA5QOXu8wLlKD8qfki
X-Received: by 2002:a17:906:32d8:: with SMTP id k24mr30920060ejk.422.1625749286853;
        Thu, 08 Jul 2021 06:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625749286; cv=none;
        d=google.com; s=arc-20160816;
        b=qgDCm3Hf9fboIsuA8WEi3v1cqoZKXsjLmrP2P2/hytrNtGXr3VOiU4kaaeOjrCNC5W
         V/ITudDK8ovj0ccEvK6aLRY+m4fBtwjUB2kdZPyn/1t1bH5zMY+229Djw/AE/t8kuqA3
         ZL3hYLZ9mF3efnyW2/bJxY8nhX8KxWCK1rAGuFRJvxlCKqUF4WvGQ80uhzIHuqwA/l9D
         U7nH1cjl5SprPn6lCFJaDYmcINehnjbprd5MsD4qKXkW4RGmkaRrJJFj6W/TNqX3Q/XZ
         uwkQcDn1XBDMUkNjVJWd5YI7qf8QFG3/hgWZVLQWFcFPphGsydxhUS7GE6a2YzxyDxcY
         DM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=29YkgGqNHkGIE/T5V8uCM/HeBuvPyMNB9/jYVOXgQHY=;
        b=KQjTVmbrZHAaoIj3aOZ6sQRH9SwCnsn+N/1OThki+ExYdJ0L+sZirwWuzaGV98fSUT
         E7kTKfM/boaBxj3yImzBtAkmx1f71lYeE/AWy6ZNW4onimTzJRsNAd+bM9AkQLyZesDq
         /Wg1UHmD5JAQOmT2x0qpxrWaRAsILOOMeDdJBloefqQ2rxRBBMaqYhwmqOUm8M0IgvrI
         r/FseC/1HNaJq2ZT0r4ho0ArcCokkWxN7AKNULqDjQ8dRhiHbw8AlZ3PfNCG6p5F/Fk+
         BJkLS2JFmLBlB1/WtfK19QGDsifbgN5AV34Off3p5++MQEPjDOu9MXSzgXZbwNzCOHyw
         hWag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si2492167ejr.686.2021.07.08.06.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 06:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Tef-0005qE-AI
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 09:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZL-0004Pz-Oq; Thu, 08 Jul 2021 08:55:55 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005Z4-8s; Thu, 08 Jul 2021 08:55:55 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GLGN55CtTzXpf0;
 Thu,  8 Jul 2021 20:49:57 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:28 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:27 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 1/9] hw/pci/pci_host: Allow PCI host to bypass iommu
Date: Thu, 8 Jul 2021 12:55:11 +0000
Message-ID: <1625748919-52456-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangxingang5@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oFcOrA0ygM7Z

From: Xingang Wang <wangxingang5@huawei.com>

Add a new bypass_iommu property for PCI host and use it to check
whether devices attached to the PCI root bus will bypass iommu.
In pci_device_iommu_address_space(), check the property and
avoid getting iommu address space for devices bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci/pci.c              | 18 +++++++++++++++++-
 hw/pci/pci_host.c         |  1 +
 include/hw/pci/pci.h      |  1 +
 include/hw/pci/pci_host.h |  1 +
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 377084f1a8..27d588e268 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
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
@@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..cf02f0d6a5 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -222,6 +222,7 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
+    DEFINE_PROP_BOOL("bypass-iommu", PCIHostState, bypass_iommu, false),
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

