Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp367347lfg;
        Wed, 24 Mar 2021 06:19:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtZ6jSA4EILU34dxZXvxPHj1IXhbeulC/+lRBDAAe4MZthlvbojUvyp23XbKVr8IwkGO3C
X-Received: by 2002:a02:a691:: with SMTP id j17mr2907470jam.14.1616591961786;
        Wed, 24 Mar 2021 06:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616591961; cv=none;
        d=google.com; s=arc-20160816;
        b=HI7vPnbpcl/9B4s3u+BFIK9KpEY0kUHGMeoLNQbrJ8Eq58/nCdCXga7B9BtglgsEht
         l1+X6mRs9GLA0iqbHsaed+KouQr98BjiBdWTx0LtQDCe/Q8fMD3pbetxpd2YAlsjOaE0
         qfT3dQmTOIV38S2ZJcI1dolqLUGDnWIG1/7xvnAIbOaBTW2mnLJlOHLwsf6vl+/lQFS5
         TAik2OA1Mv+EWJs5eILv5LlAaeXIzSRYAVLLKQE8bdgCYtI+dM3uqNauLqY4mHzP3wdQ
         SC+lAE+8+KctPhavqv3aj1f0gXuZ9gCsQ1aIGe5lxMcVehfPaFHwo9Ck7ksZrXtjgQ4o
         /OaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=VUgUlFjOlJOL6YjlkI/65JipPMTvMCVdkfMOvOQRSag=;
        b=lKEviDDTSZfx4yqUOp4y3FDmZwWMbT+T5gliASaxrBlplGhyjVVZPbsmuQk/WKER7l
         NclbuCDuOLOGOFefNKE/aeskMtdgFcEnetIC2B9JCuHhqFdmmZiP/1QPtwafd/VsPMgu
         jgXbmO1ghCX7juLpRRLF2h4MWZY6sSF1+wVuSVvXtnbWAkGWVoVHaZXNrAH5JHtr/vmC
         hsZCKLb475CdN/r0tT2EFobvq18aEdnpbr0wzjTJWlgygKR2OvnEbaOvsyBIqrr5c2Ma
         1JdPsQEkQUoYXXrjSlkQZCNmpyGupbdpQKlTUp2HoeWrr1M5laW6ey+zC3ZWLHad0kfa
         u+lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si1631192ioi.40.2021.03.24.06.19.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 06:19:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lP3Ps-0000SV-U5
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nm-0006WQ-Io; Wed, 24 Mar 2021 09:17:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nj-0005X9-Ny; Wed, 24 Mar 2021 09:17:10 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F57xt6C7Mz19Hqn;
 Wed, 24 Mar 2021 21:14:58 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:48 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 3/6] hw/pci: Add pci_root_bus_max_bus
Date: Wed, 24 Mar 2021 13:16:32 +0000
Message-ID: <1616591795-2056-4-git-send-email-wangxingang5@huawei.com>
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
X-TUID: JSnIOfWor7OZ

From: Xingang Wang <wangxingang5@huawei.com>

This helps to find max bus number of a root bus.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b82f39af10..ca26ab7750 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,40 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+int pci_root_bus_max_bus(PCIBus *bus)
+{
+    PCIHostState *host;
+    PCIDevice *dev;
+    int max_bus = 0;
+    int type, devfn;
+    uint8_t subordinate;
+
+    if (!pci_bus_is_root(bus)) {
+        return 0;
+    }
+
+    host = PCI_HOST_BRIDGE(BUS(bus)->parent);
+    max_bus = pci_bus_num(host->bus);
+
+    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
+        dev = host->bus->devices[devfn];
+
+        if (!dev) {
+            continue;
+        }
+
+        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+        if (type == PCI_HEADER_TYPE_BRIDGE) {
+            subordinate = dev->config[PCI_SUBORDINATE_BUS];
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
index 300332bc2c..96adf0220a 100644
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

