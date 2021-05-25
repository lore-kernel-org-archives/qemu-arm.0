Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4107245lfm;
        Mon, 24 May 2021 20:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrVZLPhlkowW45Yv0pOcS3+xW+YHPqISgbW0wjTivoctMCOaal6yk9253tczlpNdMC1rwp
X-Received: by 2002:a05:6638:775:: with SMTP id y21mr18399694jad.115.1621914644062;
        Mon, 24 May 2021 20:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914644; cv=none;
        d=google.com; s=arc-20160816;
        b=wRFec2FlHqftr1AXmXrEuObJ/aCGLgIFmThqmKvWy/s3IsjoMd29xFjRhPz45nggnQ
         sJnunnV+DDLmqngw+P5SqsinPPpmnH33XPFT5azdBNhdNGOS3Fm5OfxLKp3ZUWDlTdPN
         iPXtsfscbd1Raio7qzGQ6eQwGvCV3VSZrt7rvtsIZhEpFW2yNYn6xtvSn+QWTO4EXTT+
         LqwIkH8AcXdJREdXahSaTRDdIbzbECy/bk1sZs3f3lgibB2md1lguJDIhPoKpByTsYx4
         VEVUAaOVn0S5PBpFReqNoVF+zAUkykDuylf/LvaMAkTzefsaJUtJnOZVZ1oDGHaDlOys
         VhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=5gvbLBcM2WX63xP0E4zZD91eWteoQgf1xN24Fppy9lo=;
        b=Jj9Pq9PLRk2l20irZgPk1OlBGQc4ygnNlX+mWYSPh8SVNcn3tsNVhts44b6Z8uF+j5
         2tqPhhpQU7T/nQ2g7e+0sOQLdJm++uUBPBzAqc1FchlJMjEXqi4MshwK+jwFv2qrP+nM
         Sm/GiR4oyY5rbfOM8NPFUd+hBjZAsffFcI1QPR7QbU6dJoRkr+hF3MwF+ZgTZBpwLiT5
         XELN9WqgEdVWO88iWobJAw6saQ22DyS+l7A36YzrHpoSn+3z4H0sml4pZokvC0SuWElZ
         9g8PSnKwnFCDzoK4+50dPvXi9+ntmfY6kv7oJDt4qcbmswCj4dWrNtMik5vsqsD7x70z
         ZBTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si14605406jab.92.2021.05.24.20.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO5b-0006RO-Cs
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5K-0006NA-Vl; Mon, 24 May 2021 23:50:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5H-0001ki-KW; Mon, 24 May 2021 23:50:26 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq0Qx0GlwzmbJK;
 Tue, 25 May 2021 11:47:53 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:13 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:12 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 2/8] hw/pxb: Add a bypass iommu property
Date: Tue, 25 May 2021 03:49:59 +0000
Message-ID: <1621914605-14724-3-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wv2UFHFsuoR8

From: Xingang Wang <wangxingang5@huawei.com>

This add a bypass_iommu property for pci_expander_bridge.
The property can be used as:
qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
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

