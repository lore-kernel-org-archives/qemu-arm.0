Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp616233lfe;
        Wed, 18 Mar 2020 03:15:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtD4UYeEaRLTmspaqlYlL9qDgyq6kQhNT+P1EMUpgYng+o78XEWM9Zpha5Ml2Av6f4l0UCo
X-Received: by 2002:a0c:cd8d:: with SMTP id v13mr3277028qvm.189.1584526547227;
        Wed, 18 Mar 2020 03:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526547; cv=none;
        d=google.com; s=arc-20160816;
        b=wRb934zgvVbBwhTtzlCOGBajr78jiMOyca+99bkGs7RXA3NMuHsBpLOrid+kmJ0vE3
         9JPrIPCc8cTrc3VU/W8VoWDUIEdW1ny+tumg/B+6GeGYrTqilTyOviPg9/GJM6YI3Vh5
         KXB0dqhM2tnXRnVb10F4em1vWpXgPAZQoj43GGzsO0rL2ogSBgUX0k83JFGJNSk2hVrX
         Mv5eV8ge7ukid4FHxW1gi2U3wWHJIJLcVCpkJj/sZrto5gl5xs6dpxMhgf6nWIAsORDR
         xA1EH/DvPjsPXd9FbVjtR7rdILc4rlizcBKeeEbkzoxSp+IeUl0dhbwibD1oEuRVoZ49
         8lNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=EPTWRH4j/7+vQYg4JTRs7Id0RV8zi4mhxOYnQxamw9E=;
        b=XlKJNCBgMfrGlpDNYC3+NQgJnxJaPW+kVVtgt6OjntiIb2yaF0zw8agLZZagg7L+a6
         Ihbb2uwL/pcrX5OVsfsRVH6g0Cm6/61h8ajBIh9PS0933tdWKKo8VzsDhU/80y2N1+VB
         RUx5Cb6FkKjyGsbQx4G1umxC1bWhX2oQ6Prl3G4xU2sG73RGKFvYWPgw2EyiI3b/PHlA
         X2dBSgYZcC685E060lFiidPLQqsPKQtWhS6TV9yvQ1JB+UMBJ3FkUJy4TUI2Ie/qi5NX
         JamDk1zMvbbauH84UCjLXqLVH5WROvPpx6WKPR62bc9XoXsFXUCTb0p+aZJbEjtT7mgp
         dQDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=WknkTaD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w54si3605529qtb.103.2020.03.18.03.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=WknkTaD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVjm-0007VR-L0
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgy-0002tf-F0
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgx-00059J-An
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:52 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:50972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgu-00055J-QP; Wed, 18 Mar 2020 06:12:48 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABn5a030628; Wed, 18 Mar 2020 03:12:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=EPTWRH4j/7+vQYg4JTRs7Id0RV8zi4mhxOYnQxamw9E=;
 b=WknkTaD9KiEVbj4ysm+kpXckxeLvVwT+/C1G9Ww3cj2J8pu0BwQpnfIO6xHIv2hiYNXq
 TVbO4nhjq6MZszgcvV+aWbL1yDWyXEir3VoESYKga3dLOGIMeu0YKipRgYN404nJVJmu
 0vVaNm6DML6J/HtxXV4UIjRxfZ1Nt4mPVjq+/sU7dmp1u4uRbTCB6IKcHunS8x7TFMUU
 kSo7H+zB9Ld8o3/zQAXGVZtLqh2RoM5COwbLKTeMPZyPfi3kQHk3OC1XnoGekiiKRis0
 sudlzQd3QSwOZB5b64B1cGMgI2I6RurEPkfAW4LfekeMtgcIp6KjsZSpH4Yr3CB3NDAt rQ== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tvp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:46 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:41 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:37 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 6/8] virtio-iommu: Call iommu notifier for attach/detach
Date: Wed, 18 Mar 2020 15:41:57 +0530
Message-ID: <20200318101159.8767-7-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318101159.8767-1-bbhushan2@marvell.com>
References: <20200318101159.8767-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
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
X-TUID: F7TpjwBTqWFj

iommu-notifier are called when a device is attached
or detached to as address-space.
This is needed for VFIO.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 623b477b9c..4d522a636a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -49,6 +49,7 @@ typedef struct VirtIOIOMMUEndpoint {
     uint32_t id;
     VirtIOIOMMUDomain *domain;
     QLIST_ENTRY(VirtIOIOMMUEndpoint) next;
+    VirtIOIOMMU *viommu;
 } VirtIOIOMMUEndpoint;
 
 typedef struct VirtIOIOMMUInterval {
@@ -155,11 +156,48 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
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
+    VirtIOIOMMU *s = ep->viommu;
+    VirtIOIOMMUDomain *domain = ep->domain;
+    IOMMUDevice *sdev;
+
     if (!ep->domain) {
         return;
     }
+
+    QLIST_FOREACH(sdev, &s->notifiers_list, next) {
+        if (ep->id == sdev->devfn) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_unmap,
+                           &sdev->iommu_mr);
+        }
+    }
+
     QLIST_REMOVE(ep, next);
     ep->domain = NULL;
 }
@@ -178,6 +216,7 @@ static VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     }
     ep = g_malloc0(sizeof(*ep));
     ep->id = ep_id;
+    ep->viommu = s;
     trace_virtio_iommu_get_endpoint(ep_id);
     g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
     return ep;
@@ -274,6 +313,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t ep_id = le32_to_cpu(req->endpoint);
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUEndpoint *ep;
+    IOMMUDevice *sdev;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
@@ -299,6 +339,14 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 
     ep->domain = domain;
 
+    /* Replay domain mappings on the associated memory region */
+    QLIST_FOREACH(sdev, &s->notifiers_list, next) {
+        if (ep_id == sdev->devfn) {
+            g_tree_foreach(domain->mappings, virtio_iommu_mapping_map,
+                           &sdev->iommu_mr);
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
@@ -873,6 +921,7 @@ static gboolean reconstruct_endpoints(gpointer key, gpointer value,
 
     QLIST_FOREACH(iter, &d->endpoint_list, next) {
         iter->domain = d;
+        iter->viommu = s;
         g_tree_insert(s->endpoints, GUINT_TO_POINTER(iter->id), iter);
     }
     return false; /* continue the domain traversal */
-- 
2.17.1

