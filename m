Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1949366lfg;
        Sat, 27 Feb 2021 00:34:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiCItlP1PWuErfJE6KRZAqY3h8aRFMFDLFi+l7ScOPnPG18D2hTbAZCmDxabJB/a7AL5zs
X-Received: by 2002:a5e:8903:: with SMTP id k3mr6090834ioj.54.1614414879323;
        Sat, 27 Feb 2021 00:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614414879; cv=none;
        d=google.com; s=arc-20160816;
        b=O+rE8q3cqt6ekHB9bJbktNfmgZmHH/1q/rspT3IgJZjzhfAe+Al8VKqSxZM8bNF+xP
         eajH4S4OwgiaKkXfK/QLHe/NaU3qAwA5VydU7IUFe3J7APKLtJa37B2H7ROewco5dihA
         3TAHWa2Qjg95e9Mz61cXpVoI/L20RThdEp1dPaNmNh+PQTE5cH3Jz7cYQqUawjOXkjU0
         bZsYr3kv+BZHVqgJbjbs9oCuc4Rgh6NwuyoEXreDLBbkZiw6lscr1MLPAba3XFGYwG79
         GgZx+V1Qm9uSkQf/OD23gGGZwLnykIxE/cxLjOxTwweJW/Wx0WmlwXQgjhasUwawYk/z
         PLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=FMEBHhxl3/rbB7yXKiGhvrst+9mi+NCyCHt6q7T5vCg=;
        b=oGSI2TSSKKj6jkOXiz93IoaifbvRUILwM3u+FQ1RuuvnWC/Vwb/kqVFA5CP0ak55k7
         mcUSYn4iunBSG80qmyG3oFv2xULlDC6GeD6EptpTXNYkMP8ZycmBlsgbgSNVOvgqfiHk
         3tXjBD3BvIKmBCWoiP7s3i10GQ2O3Xo6yVvwxL6WJIi2HTpbwkwvZ80hw6MXwMr91WEv
         9HHsiqtMnwj8g8d6uRnC9qkyt5eat8xkF+/mHWuRUJGwBCGH5uBTDSv3LRvcRXhPtGPf
         6rcOW/ozbw3F9ZlE6DCTentiw90rTqu2Lu4kmqBdAgDlM0FbpuYgo3L6pFtuhAG2xSEP
         mwFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o65si1924192jaa.22.2021.02.27.00.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Feb 2021 00:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFv3e-0004Wk-LR
	for alex.bennee@linaro.org; Sat, 27 Feb 2021 03:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3N-0004Uy-T6; Sat, 27 Feb 2021 03:34:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vz-CC; Sat, 27 Feb 2021 03:34:21 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT4NXMzjSYF;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:33:58 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 1/4] pci: Add PCI_BUS_IOMMU property
Date: Sat, 27 Feb 2021 08:33:48 +0000
Message-ID: <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
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
X-TUID: WMnSgVcOzjMk

From: Xingang Wang <wangxingang5@huawei.com>

This Property can be useful to check whether this bus is attached to iommu.

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

