Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2218245lfc;
        Fri, 13 Mar 2020 07:36:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvrrsExhU4yHBIlNESauhKvTfDMlQQUs39GXV6FEasBttkYOiV4sWxvUOkBjBx1oZO7q8qW
X-Received: by 2002:ad4:4527:: with SMTP id l7mr12569272qvu.221.1584110195469;
        Fri, 13 Mar 2020 07:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110195; cv=none;
        d=google.com; s=arc-20160816;
        b=vTBlWDtch3HKdI21yWEfVOH03vApkX0/DI52cyTpZI+VyiNO5+wxXnfaeA/g6EQ81P
         k1mEPXTx9RWIVFpKCeT+FMd9m2w2aLwV0NGuc6TiMNlln0uTEKzuxBYaKSd9EOm2EcUM
         99sGpNTsRHfYcTX+xrCb2MKVC1gNNWh4LXchAPGMJaOTX13ChCGIuWdvR/BB0pRqz1X4
         dTNG6jhzh+7B4oMyfI654lb9mYj6K/thikx1L7xA06F5fn+/WLGYWxkCiA50E6K+K6v4
         8d1b5hLxGyPxskCKJw7mvNNHS+h8jnFNxF4VksOf53T32Ak42ix29l7s5qvOcE/DcckM
         4ATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=bxcH3jTGSpUws5gjNrL1mqbtHaE1FJNRhfGJgv67EnU=;
        b=nI+NZln28Ul96gawnn3a9NGx/nO6zFw7SMCJ9oPbINycRgX5MsjBM2e/R4yf2wpt85
         KpfK+ZKGWQqmqd1uFypbqHlnPJOJBxkHyrWCxk2a0onZaxaDrXn633Uxagt3eh8AKSDj
         9DU6n8LNaG981rCKidIvVa7MmZcTCPtkpTGORwO1t1Pyu/a9fW43s5bc0OcDpQF6qt+1
         ILxB1RYnfY8/Jhyx7Z74ggJ3hOuFJ+uclQxUuEsujY7EjNxh0IBGl/CS5Oq/4rm69Nl3
         L7OcZgQRowB/6Z0DTD6e5Rb8bDNi5GYUP9LRW32qne1j/L2AHWVfyk7JQwRFsQxRXxBf
         o5Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=gUTAH0FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si4407589qvr.129.2020.03.13.07.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=gUTAH0FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClQQ-0000ug-SA
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3f-0005ve-Ba
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3e-0001yB-5V
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:39 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:17458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3e-0001xF-14; Fri, 13 Mar 2020 03:48:38 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7kDwP020331; Fri, 13 Mar 2020 00:48:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=bxcH3jTGSpUws5gjNrL1mqbtHaE1FJNRhfGJgv67EnU=;
 b=gUTAH0FIpQieLuDSAKYaFVFa7hz2J2C/cyf2vb0dlt6KXtQsHUpH5rMxP4GH9URgialX
 bFun9ehjw2XUuAdACD0ck8J11Ap7IPB22wGjcvtrUEz+D5Sw3AJUULRLhh4U6FUyHGR8
 E7lQz0IfQCCeOoeJab/GIdvldWRF8StdhnQaKzGTNm2c/ggPWk8uQNLklzjtV6sPTous
 PCXCaUDhO0rMCWVc2//8Mb2svqlP4mGeuizMX0+VqUtyLfdUWHRz5iMZ0mnULsb3Rkjz
 /Js8wQq7iYdQ+O1ZI6P4pNRPnSQaEBTqH81MtWUKEOzIY4AFcnKRE3k4/XGyAIJ8+Y+D sw== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2vpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:36 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:48:34 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:48:33 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:29 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for attach/detach
Date: Fri, 13 Mar 2020 13:18:09 +0530
Message-ID: <20200313074811.27175-4-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313074811.27175-1-bbhushan2@marvell.com>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_03:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:47 -0400
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QLaoKdon3Ro

iommu-notifier are called when a device is attached
or detached to as address-space.
This is needed for VFIO.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e51344a53e..2006f72901 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -49,6 +49,7 @@ typedef struct VirtIOIOMMUEndpoint {
     uint32_t id;
     VirtIOIOMMUDomain *domain;
     QLIST_ENTRY(VirtIOIOMMUEndpoint) next;
+    VirtIOIOMMU *viommu;
 } VirtIOIOMMUEndpoint;
 
 typedef struct VirtIOIOMMUInterval {
@@ -155,8 +156,44 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
     memory_region_notify_iommu(mr, 0, entry);
 }
 
+static gboolean virtio_iommu_mapping_unmap(gpointer key, gpointer value,
+                                           gpointer data)
+{
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_unmap(mr, interval->low,
+                              interval->high - interval->low + 1);
+
+    return false;
+}
+
+static gboolean virtio_iommu_mapping_map(gpointer key, gpointer value,
+                                         gpointer data)
+{
+    VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    virtio_iommu_notify_map(mr, interval->low, mapping->phys_addr,
+                            interval->high - interval->low + 1);
+
+    return false;
+}
+
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
+    VirtioIOMMUNotifierNode *node;
+    VirtIOIOMMU *s = ep->viommu;
+    VirtIOIOMMUDomain *domain = ep->domain;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        if (ep->id == node->iommu_dev->devfn) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_unmap,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     if (!ep->domain) {
         return;
     }
@@ -178,6 +215,7 @@ static VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     }
     ep = g_malloc0(sizeof(*ep));
     ep->id = ep_id;
+    ep->viommu = s;
     trace_virtio_iommu_get_endpoint(ep_id);
     g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
     return ep;
@@ -272,6 +310,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    VirtioIOMMUNotifierNode *node;
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUEndpoint *ep;
 
@@ -299,6 +338,14 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 
     ep->domain = domain;
 
+    /* Replay existing address space mappings on the associated memory region */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        if (ep_id == node->iommu_dev->devfn) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_map,
+                           &node->iommu_dev->iommu_mr);
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
-- 
2.17.1

