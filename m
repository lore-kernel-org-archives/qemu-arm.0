Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1082880lfg;
        Fri, 26 Feb 2021 00:52:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz2Zo5Vs+MKudyTNAHNix6lD5wFYtvMlQHcVkZqUiP4bbIsJOX1LWF9gvC7GIJE32S68v/
X-Received: by 2002:a25:5051:: with SMTP id e78mr3038866ybb.386.1614329523604;
        Fri, 26 Feb 2021 00:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614329523; cv=none;
        d=google.com; s=arc-20160816;
        b=rrkJDpyUtk2eSXg8iuf9AYWEtGJNVceapPVmDzbK4PtAhqVkn4IKgji+Ro4bYH7Gwi
         RY36vxGVUZVqMULaNSUP3oXF7eB6byLBX6WbMKQHba8EoKVJ8InYwU+1S0btOKii09yX
         h3euGHXe7WNE1uP+Ef+Njtm6QHH1YNl/OxdxzhC5LFN6jto2CHapbUhEEOHiEQeU2wFi
         nu02LhaQwPYcPSqfbkKxSlihTOb67LU/b/qlCWOeinUoCs09NnW1G4uZSABtimp2tmgk
         dXV0Z9FaOL6HRsuhX7PyhIo0RX4lGLT70nzsJBF5cSImqGhvg42A/2Bt+YxDVJTyFPq2
         XcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=FylAKnGbTJlfVFVZqEQSO3LAKrD/JuyF9BY5MPgF2IQ=;
        b=HzZsz89DDHimnTDxghiSBVDGIdmYziW047WlxU0Y/KCKiA5OisY2JiAkzVIgRE3YgB
         pEtDPsuApBDrWGKk9WEmpNRGrfs+RbvbRgL7+gbbSLBrIHSfrwcGBx+tqOeSXE/vqqgu
         SkBVR+m83ri81S81zE/W5F59+aBcjwyt8t/miQySqOlj/BpGhppuWIQB5fvLqfTkBBPL
         o8OE5iyqZo2ETvtR2yKLaukn8yGa7N6gftAeADWgfluAAMK1iimCLuvijkya5dN5oi4d
         pnnWnsnOxmr7G3YXZ5X8Ak1OesHM0DzkIqbtBPBALYsldd7gSh8PjolbbpxBJjN8D2G9
         W2GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z131si6566286yba.182.2021.02.26.00.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 00:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFYqw-0006Eh-Uq
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 03:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYol-0004rN-G2; Fri, 26 Feb 2021 03:49:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYoj-0003Yr-Aj; Fri, 26 Feb 2021 03:49:47 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dn3Fl0XCCz164BW;
 Fri, 26 Feb 2021 16:47:55 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Feb 2021
 16:49:25 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/4] pci: Add PCI_BUS_IOMMU property
Date: Fri, 26 Feb 2021 08:49:10 +0000
Message-ID: <1614329353-2124-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
References: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITq5queJFweU

From: Xingang Wang <wangxingang5@huawei.com>

This property can be useful to check whether this bus is attached to iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 include/hw/pci/pci_bus.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..42109e8a06 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -24,6 +24,8 @@ enum PCIBusFlags {
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
+    /* Iommu is enabled on this bus */
+    PCI_BUS_IOMMU                                           = 0x0004,
 };
 
 struct PCIBus {
@@ -63,4 +65,15 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
 }
 
+static inline bool pci_bus_has_iommu(PCIBus *bus)
+{
+    PCIBus *root_bus = bus;
+
+    while (root_bus && !pci_bus_is_root(root_bus)) {
+        root_bus = pci_get_bus(root_bus->parent_dev);
+    }
+
+    return !!(root_bus->flags & PCI_BUS_IOMMU);
+}
+
 #endif /* QEMU_PCI_BUS_H */
-- 
2.19.1

