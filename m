Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2217490lfc;
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs3ykC8FeSZ04ibI6xqxl9MW5bFHfc8+lhfNgKAyFQ3cVDqRDCz1PkldAptWioBrW8CRfC8
X-Received: by 2002:ac8:735a:: with SMTP id q26mr12781882qtp.286.1584110156152;
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110156; cv=none;
        d=google.com; s=arc-20160816;
        b=kCyerEifWPyHVWKfDiqSc0hbVZEKiliIkwGjBRvKHty5G3SDpbhas5vcRmKotRMwGp
         097EfiGmLRdtJhUJRrpjpGSEibYyJNItpztuI5PR3pUYyULuNYxnWZ6G5FiZ4EZxHnym
         GmkEn6J7z3ebyHUkV6mlgJ1xrl5byhxMiiGFoPcIxjz02IXbRi+offtsjJlhZL3aXS42
         HfnVxf0qA078maF0mkCMgRikyKa8bSRxEAV9Agajup8ZbDtzTL1UVQFZo0bzseJteK9d
         Omo21e4ChFRXm7EVYGiKhdqWisvvqKeB9trMpG4ekURdYju98oy1BTw+bLNyDhacWNz1
         vlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=d2iWCXJz4dJ2g2X4/WjavG5MxgCZeaMWghSwegVnILA=;
        b=Av2bQbNbJUOpwfOwx5bTsxZFNs3E5gA+mWUXfK9x2CaYGzFl5j4d8jDCvFIBMu+n2u
         kwDYd4dFd6y4tirFpJPgW1knDqRD/CELMDwX0i3WbMhAxLLE4VGS1CbdWhNHQoYp3YNR
         XnVqTKKHC+HFGJULbgBvjX9Ca1iunknARan2l80yJdASMVFFcLYi/5jX1p+BUG2dWNN0
         wz5EBaM05x1GS/KnY3g8cQAnSt0GrBjd+BHolomWCG/x4AQXvHuGZTlEOz9zGIXDRqi1
         eWNGpUjbplyRQ2KS9J/EIutMZ6OodPOVpNBvwr17VHcph0EZevGL2QxFuYB/esmj/Byh
         LEGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="PArd/K+B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si5111962qvk.155.2020.03.13.07.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="PArd/K+B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClPn-0007tR-GO
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY9-00074a-DY
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY8-0004ki-AF
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:16:05 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:20854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeY8-0004k4-5R; Fri, 13 Mar 2020 03:16:04 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D79r9J009668; Fri, 13 Mar 2020 00:16:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=d2iWCXJz4dJ2g2X4/WjavG5MxgCZeaMWghSwegVnILA=;
 b=PArd/K+BkD/XsObelYEAfWosEeMZz1gcSAQ8drWcaPIpaWJZD78821PON1ooeMvKtyyp
 AOEPT/xXKwhq3PUxu1n6XWhLO0UH9uFkwy0mUl2ub0W/rdpo/jVSCCIgW+WlNsMa1X09
 jj/BfEZfQ+Eb2EzDaKP1wBg1GZB1/bAafObBTAGpFZ123Klx6KWd4f8aUI02Dbwk3JU5
 yPI2x63mqGlpAKhm7sFAAwhT6Vhc0aVMLKus6JP5RTYPjybMCPKcG/4/hvBD01wL54rl
 xS8x7WxtWNm46nO9Q7ao5ZykO1WqnAEbk4D1e498qXDyuV1X7Vr06kdC9UQKNeGSe1Q9 QA== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2s70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:16:02 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:15:59 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:15:56 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v6 5/5] virtio-iommu: add iommu notifier memory-region
Date: Fri, 13 Mar 2020 12:45:32 +0530
Message-ID: <20200313071532.26533-5-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313071532.26533-1-bbhushan2@marvell.com>
References: <20200313071532.26533-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_02:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
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
X-TUID: rMzlECQb46J8

Finally add notify_flag_changed() to for memory-region
access flag iommu flag change notifier

Finally add the memory notifier

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/trace-events   |  2 ++
 hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8bae651191..a486adcf6d 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -76,3 +76,5 @@ virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uin
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
 virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index bcc9895b76..7744410f72 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -803,6 +803,37 @@ unlock:
     qemu_mutex_unlock(&s->mutex);
 }
 
+static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new,
+                                             Error **errp)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtioIOMMUNotifierNode *node = NULL;
+    VirtioIOMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        node = g_malloc0(sizeof(*node));
+        node->iommu_dev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return 0;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+        }
+    }
+    return 0;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1020,6 +1051,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = virtio_iommu_translate;
     imrc->replay = virtio_iommu_replay;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1

