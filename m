Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4107243lfm;
        Mon, 24 May 2021 20:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3nP/e69YxwKRZXXycVnzTFIx9rXONk1aPPBwVq+33DLoJHkBzSx/lBeBMl8vOqpgyTTRU
X-Received: by 2002:a5d:9a97:: with SMTP id c23mr18722313iom.38.1621914643890;
        Mon, 24 May 2021 20:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914643; cv=none;
        d=google.com; s=arc-20160816;
        b=MudNUStYXMJ6RiiD29JMRJsMcHAyDlQJCA2LiVLoFyGFHH9hpaNOo5l128ighVgpec
         1DcZpNERgEm42eHjdr2jzCBZlwFkhRm7UJIbaqbj6KGt5OBmDOqNHk0PtIMmlyFf8UMB
         PHBWecRTk6IIMl+4o+tP2eLXPDLZ0zNoQSSZaao9II0yUWkL49GGlmihLbkFcgL7hxQ3
         3N7YTC5z2IJupatX3K7+Bz+kTIHujLEnQchVHwHZcoX5W4CSOYOB4HocbMod4J2fLIno
         qDI2oBnXzmEv3qBgZ+Dj9OOZjrxcgVwLW+D9BEtJirRgtmpsyoqsd0WvzEShoZ1IamKU
         Bp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=x3ztTNwnEVDR1zX0ncgI5HmZ/rS46TaKV507kJXXJHo=;
        b=iEoeuIsz97pyiYhkFgzVoS/EvErK8buipZPk0hOe8nmX0BjPN6R/7cecfwQ50qvEne
         4Y67YqmNZ0NjAq93Yt4BftiaFq2fwnKm9jOisLERKWh4rd/89T3ohUGBc9w41zGdT5fJ
         /7nKf8EBvDdYIOdBh9rCMNEJiVUhWHL5nXFqNCAQJybyWdZ2zs50zvBBB6lIWTNKwZyP
         yM3lr1W3rVM36CTXttnWy6bDnyJwHs/hkQjLDObAEd58exTmH8S2tPt8tv2pwk+bfXAi
         R1cXmXwY5fdCSYo4gHODPO4W/Ym6EPDbhpkPa4tXJaAXZu58NQQXGCcoKhSjgIHk9nee
         9k3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si16791994ilg.96.2021.05.24.20.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO5b-0006Rc-5N
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5L-0006Of-O0; Mon, 24 May 2021 23:50:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5H-0001lO-Ht; Mon, 24 May 2021 23:50:27 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq0PV6RKqzP0HX;
 Tue, 25 May 2021 11:46:38 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:14 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:14 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 5/8] hw/pci: Add pci_bus_range to get bus number range
Date: Tue, 25 May 2021 03:50:02 +0000
Message-ID: <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7Ngsc1VuEDV

From: Xingang Wang <wangxingang5@huawei.com>

This helps to get the bus number range of a pci bridge hierarchy.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/pci/pci.c         | 15 +++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 27d588e268..7f18ea5ef5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,21 @@ int pci_bus_num(PCIBus *s)
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

