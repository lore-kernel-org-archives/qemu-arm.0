Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1083653lfg;
        Fri, 26 Feb 2021 00:54:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrh+nOk9xLd6ATpyYCPZTbp2JeOlvsjrGDbnA/Oy7TvW3VWtZie7PhvSMvObrVk5zbH6R0
X-Received: by 2002:a25:2b88:: with SMTP id r130mr2978621ybr.460.1614329644049;
        Fri, 26 Feb 2021 00:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614329644; cv=none;
        d=google.com; s=arc-20160816;
        b=kV+s9DA/Vvufe3fcNeZ1pAsV2awr5TzJqDj3SnGOv5NFdMjDkgVPfvlKWcFqX1QHY7
         k5wcugVafF9ltEYv3AcDEtz4jqKcgrsjZ/JDaX9XjQOKqYqyJacsNjIjrNN13I7pLFOq
         vSDT5Mu/LxPFSe2jypzSLrK7/NdbSgNPObXnNF1F9zj6tDaY5XXvagCjy2fC191Qrehi
         cYBTx/l9SgwEsnkuZsAs+V251NOXnRr+l5OqFvUPVnZ20jdCt7m1V/GNI+p4eRoAMWVe
         gzzO09+U3n0v2VaKQ8WNg8p8E/00aHiVG4uhFJguGtECbtTUdF8AEEcErMruJckBDqQ6
         jdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=NQ/yIixLZVbKC4+Wi9PZ2LRq2vSgMrtFwIAgtPaSzdU=;
        b=VdPPhn6+XL+FByT9twkRHLWua0oRX3C1kOuOW3ZuS8GEHdTSbNzJ14qweS95IVRRZY
         vWX7vXCn6ug7phIER3VeV3r4xT21aXjYDmPxuampfV/wnmIK6TgHXG7xiCV/ycTPIHA/
         YTC2hOU908+QlKW4YQ+zQbpetbiTqh/ZoH2OQGrGjNVrX11T1OxzINpkaYgzh3sEqwye
         iip9igZzYcZU5qHKZ9vuUAnZsbBVS8LMaNaijP+yAAgeuw4bCU4IE4KukwSI92WY02rG
         OZY4xPsSZJlLN7BssHM+Fho0/Ahha0HardJq26wjR5/bZgIXkeAOzSEL9iRf1lsXQDe5
         QyIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si8571525ybc.372.2021.02.26.00.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 00:54:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFYss-0000IB-H1
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 03:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYoo-0004uV-Pj; Fri, 26 Feb 2021 03:49:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYoj-0003b6-K7; Fri, 26 Feb 2021 03:49:50 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dn3FL0vpBzMfBM;
 Fri, 26 Feb 2021 16:47:34 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Feb 2021
 16:49:27 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/4] hw/pci: Add pci_root_bus_max_bus
Date: Fri, 26 Feb 2021 08:49:12 +0000
Message-ID: <1614329353-2124-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
References: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqCk/wphjhsC

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

