Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp220144lfb;
        Wed, 21 Apr 2021 01:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYknJIyICiNBE2MqthumbA2rAWJo7uk3Au5IKmUNepxw5OljzKS76TKGkjxlzmoAxCfO/v
X-Received: by 2002:a67:65c6:: with SMTP id z189mr11341355vsb.17.1618992643464;
        Wed, 21 Apr 2021 01:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992643; cv=none;
        d=google.com; s=arc-20160816;
        b=kSOv4rRjj/WB0esSMRZt8jORfpW0U2FP1Sr7CamSWOc80tAQGg2Rd/zmAnNC88jGSs
         bKTjuF2OoLGnd4Ec294Dlic0U3BDU4sxDbznq/hbJkfcnrMRibvfQ1dg1sQtUgw2RS1f
         QXUNgHTa7E57B3wGnFETjhpbPZ03TeV9coLpcsEdKMPML1mx26atk91kS0Y4arGh4VAx
         NojO5Xh9epvFwyuQ8f2CjZQ09tiHTj35kqcCxUMPK//PyRAdlzMEomDGE4S/yWt3U6o1
         NE7lS+yEfc3FgaEmIjqdo9CbuRrKSY5qmIatvc/OOlJxgEwDX1WODaTUisJgLw0UtGco
         pByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Ikvs8YNGqDGi/pJ6zE/dzsCCbjU5EwI3Ytn9W38XtEU=;
        b=gCBoWxOgIriQC+kanX7BlStx8EB/6mjLRM28MZNgwg5oltfc/3mTPuq4+zxv7csaZy
         v7MveDRDPkjmhCQ04srPNLrEIClkIkhdEsLAzc8vFyjdZOeR2vkMhzwKmBmYeWBZRYiQ
         +ueajoSBFZIeMxDV0QDygU1DlD8/aD3ufzZhpgZBpf0fJ08NbqyJNGBp6XP5dJXiHo71
         D/xZddUTEeCPXWW469xqyv2bku996QAqaDVx7AuM3CkGilK4JhU+JrBPO4VrwaN9ZqDi
         iwGJ2+gmB+B0qscShtmCeWbb3JZM/mhOOM86vo/m8DCYAcGd3xsBamHH/B+zeDKTKjOk
         ob+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si547397vkg.88.2021.04.21.01.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7wY-0007sH-Pz
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7ra-00019W-Mj; Wed, 21 Apr 2021 04:05:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rY-00023y-4X; Wed, 21 Apr 2021 04:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQCjW61nrzlYrH;
 Wed, 21 Apr 2021 16:03:27 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:16 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 5/8] hw/pci: Add pci_bus_range to get bus number range
Date: Wed, 21 Apr 2021 08:05:00 +0000
Message-ID: <1618992303-19556-6-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3upjEPFrMJ1T

From: Xingang Wang <wangxingang5@huawei.com>

This helps to get the bus number range of a pci bridge hierarchy.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c         | 15 +++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 301addfb35..2ac3b8d76c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -538,6 +538,21 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
+{
+    int i;
+    *min_bus = *max_bus = pci_bus_num(bus);
+
+    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
+        PCIDevice *dev = bus->devices[i];
+
+        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
+            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
+            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
+        }
+    }
+}
+
 int pci_bus_numa_node(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f4d51b672b..d0f4266e37 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 }
 int pci_bus_num(PCIBus *s);
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
 static inline int pci_dev_bus_num(const PCIDevice *dev)
 {
     return pci_bus_num(pci_get_bus(dev));
-- 
2.19.1

