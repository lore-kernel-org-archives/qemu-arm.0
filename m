Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1949743lfg;
        Sat, 27 Feb 2021 00:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQdZBT7oYjWDHio4Za34RBQajMR8rR7fUM6Tfeq4yN74HDlxrnBCZwF9gc7D2rVmH2L5UW
X-Received: by 2002:a25:86ca:: with SMTP id y10mr10224955ybm.431.1614414935038;
        Sat, 27 Feb 2021 00:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614414935; cv=none;
        d=google.com; s=arc-20160816;
        b=yFZocev2DZ8ki+8qIKMeH93jowogfQwGYy2VWQXG05fGceFBLItFIG1HThGx/rgllU
         /7vKbO3WddFZM1wG41Hp7zxBM4CrqzOsCfRzZiVKcoqgvKXs1z9T16QZdAIVwr+MyfIc
         w13cZ1l4xYQSRbh1mN8PIWOwB7sGdtoCfC2M6yG/OIVHnwwUUH3o9sqY3RrPbIF4A9a9
         QyH+2kpuOaDE+HMs6a2rEj/agi9QyQkfc3byLGVPzlsOz8WBGxu+QcKCH41Yp90fb+PT
         /xk/WQkTi6kV6BKHeGx3zbLktyVul5zTMYdvEddmUbGnGEcYvAIzf2rr/aWoz1HGZgt2
         xMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=NQ/yIixLZVbKC4+Wi9PZ2LRq2vSgMrtFwIAgtPaSzdU=;
        b=vTtbDKiog7qpravUfnIKJEouIRjszypzxPUH9RlJ4qUUhAWtiSgXDq1PI6HVRk7JV2
         dfYNoB6oMKKw7ngNaflIL06T4NnLTGXewRO4ROfLq9cqL8vHSrEpzN5m2ZkYniEiGQl2
         5xBv89HPIwr6H0OFIx/eU9SB1YwEvfDC/E3Kh3xUSAyebWN4paup5CNgHZzeOe5ljr0K
         pMnh5B/rJUA7R3qdsYj628BEm10RjqDePp3LEGbrddtvDrAO2Cz/PX/CgYbdBFOI9oEn
         cpzM2NBa0WwhHt0T18CBTifKfwE4hZmD4V791UybnPPRnMIj94hTDxJugXCwwVZ1B+Ef
         IkDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j187si10578419ybg.401.2021.02.27.00.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Feb 2021 00:35:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFv4Y-00050O-Bv
	for alex.bennee@linaro.org; Sat, 27 Feb 2021 03:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3O-0004Vo-SV; Sat, 27 Feb 2021 03:34:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vy-Fm; Sat, 27 Feb 2021 03:34:22 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT3tdBzjRyZ;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:34:00 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 3/4] hw/pci: Add pci_root_bus_max_bus
Date: Sat, 27 Feb 2021 08:33:50 +0000
Message-ID: <1614414831-39712-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mt3qVbYP3x1v

From: Xingang Wang <wangxingang5@huawei.com>

This helps to find max bus number of a root bus.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dc969989c9..ed92ce0971 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -516,6 +516,39 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+int pci_root_bus_max_bus(PCIBus *bus)
+{
+    PCIHostState *host;
+    int max_bus = 0;
+    int type;
+    int devfn;
+
+    if (!pci_bus_is_root(bus)) {
+        return 0;
+    }
+
+    host = PCI_HOST_BRIDGE(BUS(bus)->parent);
+    max_bus = pci_bus_num(host->bus);
+
+    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
+        PCIDevice *dev = host->bus->devices[devfn];
+
+        if (!dev) {
+            continue;
+        }
+
+        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+        if (type == PCI_HEADER_TYPE_BRIDGE) {
+            uint8_t subordinate = dev->config[PCI_SUBORDINATE_BUS];
+            if (subordinate > max_bus) {
+                max_bus = subordinate;
+            }
+        }
+    }
+
+    return max_bus;
+}
+
 int pci_bus_numa_node(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1bc231480f..238b91817a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -449,6 +449,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 }
 int pci_bus_num(PCIBus *s);
+int pci_root_bus_max_bus(PCIBus *bus);
 static inline int pci_dev_bus_num(const PCIDevice *dev)
 {
     return pci_bus_num(pci_get_bus(dev));
-- 
2.19.1

