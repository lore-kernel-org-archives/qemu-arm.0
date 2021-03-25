Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp148163lfg;
        Thu, 25 Mar 2021 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2LTjoHOPlkuVypMhgQzCKFxUseB5ha586s0DDkEh4SaO/2LrDbSOhzXik/N/dTbK921TZ
X-Received: by 2002:a25:dc4c:: with SMTP id y73mr10046536ybe.346.1616657012476;
        Thu, 25 Mar 2021 00:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616657012; cv=none;
        d=google.com; s=arc-20160816;
        b=qpl6fbBxVDKI57x329fGdtudIT4tsLY/O0v9gBmUs/DDtST7g9bU41IFvyq51hAVCV
         a3nolUFfQOsiQH2KSciTv2rePKtxzl5VysaFcn3ndisVJrfvVtmXUUv/1jbL7+U1M/+r
         kyPOT4Z3HxIV8jQs/RiEWjXs8KNBRcqiV4uMOYDZB/dUU8J7X1HAaEJ4OFZxa0tw/5fV
         WtXTIyHFQXG5xdafZQl3z74BNku44LDFfTR505U6ruizjeniLruj7CsU13yfR4nC553S
         +hH5KRKzvkqUFntZXEaOz1zqnRrJR2rPTG1Dwq4Gt8QrzpgCgfLNtg7lp7uaJNdHXN/S
         Qt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=KlQh9U+Jtz7PRBKDFGRObftLIj0Gk5UlG9eG7VvJYFQ=;
        b=v4MR9PRPiNe6RMBb6188GLyqEJh5mDTw0kYxdxQtzo0DC5OmhPkHWOMbbe7Z3Sx2dN
         vX8XpH1diI9fIxVGBj6fLG3qktPt8iDmu/A4/oYvs1S7xdhgbzeDOlBulZKqUDdP2JnZ
         AOG0V0vLSaGs1II+2BawjSQmnSL7hJRkVElAjntvXA4tgfUmYPhcRWiekmB2h8SUYHH3
         rtrw6nQRvyncME6FuOEkT8FECJPCCjZHh9EeaAwTXqraEiko6AOlEJX6Arjw2OK2THd+
         K7MPgPsocPkjm2awk0uivhBHThZBe1Csc+3lQ3Y2W2YLAR/PbKMWUAgsXDyoIfA6yOLk
         WFOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i135si4200742yba.163.2021.03.25.00.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 00:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPKL5-0004On-Nu
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 03:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKv-0004Nd-As; Thu, 25 Mar 2021 03:23:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKs-0002zN-5b; Thu, 25 Mar 2021 03:23:21 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5c3F1TLwzrZjb;
 Thu, 25 Mar 2021 15:21:13 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 15:23:07 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC RESEND v2 3/6] hw/pci: Add pci_root_bus_max_bus
Date: Thu, 25 Mar 2021 07:22:42 +0000
Message-ID: <1616656965-23328-4-git-send-email-wangxingang5@huawei.com>
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
X-TUID: 84rf22qx2i+b

From: Xingang Wang <wangxingang5@huawei.com>

This helps to find max bus number of a root bus.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e17aa9075f..c7957cbf7c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -538,6 +538,40 @@ int pci_bus_num(PCIBus *s)
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
index 718b5a454a..e0c69534f4 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 }
 int pci_bus_num(PCIBus *s);
+int pci_root_bus_max_bus(PCIBus *bus);
 static inline int pci_dev_bus_num(const PCIDevice *dev)
 {
     return pci_bus_num(pci_get_bus(dev));
-- 
2.19.1

