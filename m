Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2217866lfc;
        Fri, 13 Mar 2020 07:36:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsT/WES6bsiAkRN7Ygn/SDev+4U+9SeZt8aQ/cQ8sLOUzYbf3wVh/2LJy8qA7dC5YnuDvOE
X-Received: by 2002:ac8:24db:: with SMTP id t27mr12990159qtt.49.1584110175167;
        Fri, 13 Mar 2020 07:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110175; cv=none;
        d=google.com; s=arc-20160816;
        b=lAsep5u8W2ZZh2k9PMODB+6t8ZzzUBv0eS91ZRcetvqO0Q3ApkCzeUp3QQsDcK+GsO
         Y6y/8+gELoUF0qDCvO/y6qMWlXLVxBurdBqqLlDSShPZI4KwYwhA8tnZRSFm+U5ZGn0v
         xfd7KaiixMtXV18G9bY3FyFRSH6yAlgLi0sbj1Vx1MhCh4J9fRymanQ1Kn28DVgv4wXe
         JwjEZjuthmWD69nSBWOwulxgc+D4kpEOHZIzxro9UGOVeK3i/L0EZwYJezGgWfM+pBXr
         k7gSjMcAQl4+F5Ot9DVSXYTzFXdq5p7O7EQWi4ei0HtfEvrAGbPboVZ/h0WgoyiBRey6
         8HpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=bxcH3jTGSpUws5gjNrL1mqbtHaE1FJNRhfGJgv67EnU=;
        b=EaOi+X906cVqGcPlUfgc6/4tbr2Y1a3dy/KXs6ly9oTdEEkpB1qg/ULI2uoFFd4Gd+
         lnyhoruuOWZyWZpoTmZyqJW46yEeyqKn5EKDR3fFM6VAMflOyytJEy9Xf4QO++wLsvj8
         jOk6r1/OCBSJBWoQN36k+WdkCIC4+QNbw46LA+TLc+dzM7XcweV0oopq4qsoYG1bGD3s
         7tdsOhwp7r7o39k1l8hjPG638A4Ae9iS4ScG1i+wv6itgiAB2mXS6wj+WXbTq4Zbc0+W
         Vfj5ejuzt1G4hcfRy+uUGsUBV5nwpWMLpqfYhfluYmqlBvRNNopAvakgt1KlwSnRq1Pb
         TY5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=t9QpI4pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si5199100qkb.72.2020.03.13.07.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=t9QpI4pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClQ6-00006I-IW
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY0-0006xv-Ms
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeXz-0004Lh-LN
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:15:56 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:60726
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeXz-0004Io-DC; Fri, 13 Mar 2020 03:15:55 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7AxrS001021; Fri, 13 Mar 2020 00:15:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=bxcH3jTGSpUws5gjNrL1mqbtHaE1FJNRhfGJgv67EnU=;
 b=t9QpI4pf2Wv5JnoPajFxst/CB6PCQa8E7LniZLz4rVpNtMFuXYFbRv+5vE7SZdR9IyGH
 AG8IkTH/7s79yF2wsfm6zslpFiZll6RlWRDEXpEqCRHxLcQ7+2yBAYK0ZFZ5D5aSxUmu
 P0yeYE0jvjNnwSMr38238zkzpqMQPoB+9EmCQLMDOgimZ59tSs4nSAd+TzXpIjzl4mx8
 tx6E2q523OI9azszPelfxRjmkToJI8il+GdOjevol+TKZyWz9uMk8VzB5Ss3YJh8ieHb
 yNrPJ9U7SwUWdGn12/SDm7ITmzkiY9xhZR9b52L0nbU3rTSWzS1u+CA3huyeGUagWPhE aw== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t2s2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:15:52 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:15:50 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:15:50 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:15:45 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v6 3/5] virtio-iommu: Call iommu notifier for attach/detach
Date: Fri, 13 Mar 2020 12:45:30 +0530
Message-ID: <20200313071532.26533-3-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313071532.26533-1-bbhushan2@marvell.com>
References: <20200313071532.26533-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_02:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:46 -0400
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
X-TUID: dERJ+XQanbxa

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

