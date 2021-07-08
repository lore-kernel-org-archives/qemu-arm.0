Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp297483lfg;
        Thu, 8 Jul 2021 05:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtlKgvVWmYCVcbBeBUH7Ex0ZysHHiW/LMPbyc9ptUHXPZhvR19au5WHQDllUlhDZBpbHqZ
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr31149244eju.295.1625748970953;
        Thu, 08 Jul 2021 05:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625748970; cv=none;
        d=google.com; s=arc-20160816;
        b=xoVTWlwMazyErMIMs6Sqto69czBOqta/P7EGnkOL45J76S6iXR+ZgupIN+sQjqsvM0
         iFC6qC+sa3gHsXouF+654VPlCWkHsQwD3LDdgouL6JvqRS/2H1s3GFvLgLguPfl6daZ6
         OywgQaVGLk1l9l1Xm5F8Klj5V4ZSpg7AE/hrQpb0iG0PSZQGZiz4qav3hQKMxjs1ADds
         aXZLyFWeJP3+hVpqoO1ENV+zaNomMBsuJTSajgU7Ig6Kk7OeY0z+UEruxdzv2H9r4/wN
         mpjPy65mcz1euL8BYicR7FeUaAAJGAynVEpHnmdzRYyE9NXDaO96wOOwn/RJ4eKHk74n
         nhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=SdfYf+SCilV6edgiiLgBVYZIMFMEVRiguiR4ZtcZxeE=;
        b=DVK3BY8LFVQgCjjXduEME7KcA0Iw3uhJbX7SDagXAgSCOax6GUrrCd6VNLYcKYCy3A
         TnMi5PfSAyMlUIX2pmcC8CdAkaxpVrb5AH7WhD/SkZ0zDwVGPqN4oKmCpKflg3KMEQ/w
         AA3JKnOdkU1PaWhF2nDyRsCiF7toamU7ReVs/oYx0mOEghRltbHFPxyRUnlw4nD68ub4
         PlIhlQjyCvrZ6mwLWfOlxbuaSnDJTYb3hNQIiznTq0n/OHareHL64FjRbx40xmPxe2a+
         zQ1XA622GIJf6ICprelgZuaTLdrldfmlvFzItPRP2DyQ09VexYK/h0KvIO1cPTFXiski
         igSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hq18si2930917ejc.5.2021.07.08.05.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1TZZ-0004P5-Uh
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZI-0004LF-6Y; Thu, 08 Jul 2021 08:55:52 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZE-0005Z2-Jx; Thu, 08 Jul 2021 08:55:51 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GLGQm05h5zbbYg;
 Thu,  8 Jul 2021 20:52:16 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:28 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:28 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 2/9] hw/pxb: Add a bypass iommu property
Date: Thu, 8 Jul 2021 12:55:12 +0000
Message-ID: <1625748919-52456-3-git-send-email-wangxingang5@huawei.com>
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
X-TUID: /lJ3KoiT0Uzh

From: Xingang Wang <wangxingang5@huawei.com>

Add a bypass_iommu property for pci_expander_bridge, the property
is used to indicate whether pxb root bus will bypass iommu. By
default the bypass_iommu is disabled, and it can be enabled with:
qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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

