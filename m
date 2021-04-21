Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp220167lfb;
        Wed, 21 Apr 2021 01:10:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhYn29JGu1owbH54tGprQQz6ywJ3TfKpORfqolx35VzVIQnnBIClinY9TofGHLN2ZP6MBM
X-Received: by 2002:a05:6102:104e:: with SMTP id h14mr19466878vsq.38.1618992645210;
        Wed, 21 Apr 2021 01:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992645; cv=none;
        d=google.com; s=arc-20160816;
        b=CHy0d8uuVTEDpTnxVUwkyqtfD/xSMEdjrtEiBTCgWRraWXzpvQYHPO8556FwWna4Dx
         StCob47kLaOEMiAQsV/Omlvj4QQgNyCcOeRzMpAyKBwuXRCiWZJO4YDj/CvHHXoKdfTU
         dSrnDUpyFvKxQqBffI5KdheH+NYM/QHK0k99m8oXnT2Gpa9O0oxYaet8iHSdM9dtDK0k
         gbXq3ndjEpnuH78WFbHQZ8KE8Y5y4/GavtGzXWfGgcQrMZx51/H7pdCy9kn85T78yptQ
         e7uDdRVTKOKSUNylBO/RhiyIUdbq0FHhC7/ruYnmAUOPTM7WTc5zkNfgu4js/FtYhji0
         kymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=cIeu9AtVckP4D0BV47YVIO9WlJ5wRgbQNv7wfU7eW8A=;
        b=QqELuzTJcilc7Hx9PtnFortezFaBSBxgNSAvzlj0xVATF7vaUEopjxJdWDofaON6i4
         ss75NlPUnZAy6TkRVPgbYwWO34+vRK0cWmkObjaRhhY/6D9Lkm7JXe9V4copsd7cSPzI
         K2UGn8PRO67BLPd+T1M/Foia7JU2dST/yS2by6eeKqY/cS18jpOB1mPzuVbVF8P+XaM+
         8y06pl6Ovl3txUhAOQ1/r8/2LVbxHTvJZ4q/jcEMN1jtRHVWebgCqzktFW6YHQw8HJ2G
         frW7OyggD5VEkDGvdkq2tKjSprypyuIkIiGO/3H7ij+WHyrFFcKymVhp8jpXByEQMoAK
         EfBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si590083vsq.295.2021.04.21.01.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7wa-0007w2-Gq
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7re-0001JC-U1; Wed, 21 Apr 2021 04:05:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rd-0002CI-4P; Wed, 21 Apr 2021 04:05:38 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQCjW6LXtzlYrY;
 Wed, 21 Apr 2021 16:03:27 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:14 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 2/8] hw/pxb: Add a bypass iommu property
Date: Wed, 21 Apr 2021 08:04:57 +0000
Message-ID: <1618992303-19556-3-git-send-email-wangxingang5@huawei.com>
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
X-TUID: 66wtgFANFtzl

From: Xingang Wang <wangxingang5@huawei.com>

This add a bypass_iommu property for pci_expander_bridge.
The property can be used as:
qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..7112dc3062 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,6 +57,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    bool bypass_iommu;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
+    PCI_HOST_BRIDGE(ds)->bypass_iommu = pxb->bypass_iommu;
 
     pxb_register_bus(dev, bus, &local_err);
     if (local_err) {
@@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.19.1

