Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1175917lfi;
        Mon, 23 Mar 2020 01:47:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv22LAtas9P5hMWNzpd6qIDT+7MCMmts+0Fi6vj63sk0XwDUtnUe4esZzjhn5j9shG4rd13
X-Received: by 2002:ac8:7293:: with SMTP id v19mr5053942qto.133.1584953261821;
        Mon, 23 Mar 2020 01:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953261; cv=none;
        d=google.com; s=arc-20160816;
        b=GAjKjojsWIJ5n+HBso2uycy6AdSSa/E4G5MHKStK37W1Xi+VjaCrweR5Vz3EwftGlM
         pkqPlmOn6SguA3qdkrsXAT2ExO1xkcqDr9QdlpQ40Pj+3oZwwD1NGJa6xhTu5j7Ac5gA
         XB5omISxQx64lfIVl6QfzdNqxEi7V250iCRyz9pSSsD47skU3xEiGxlIyw9iyBuevUjQ
         5CFShCBi7GXsECOIRUw5MoYwk3e02pTs6duJ5reyxzTaB25rQg7YghHyuCV4Dncf+d0/
         lfuamEa0Gqb1UbQzyyYHnx+40jvw2GOQRYJ/h/MReaotyJxNtBBLZ7CQWLsQ6em3FNT+
         Emaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=5VTq8e0BSvrMkvHbeSM4C11NEHq1CPgbCZcb3DuRCxY=;
        b=DbwGeiSMTpKxtLHydauZjoGe8O7+YZ63czRIuT9g4sskRVlRDxlu7nAOJ1YUrxs6Rj
         9qteeD+j5K7X/63h5mfEwOHEo6N+494YKrEdNgsbp8KIpaTElgXaYTjrd3fx1MFHDXsS
         Nrp3YWrS3qj9EiKgrQXBJ0KqF3xWFrYGhoMM0Q/aMPv9kKaae7Yf3qWtXJooBaVV6QNt
         tTjJpRoZEBVFS9lzw7PLQUmAqxrGWEUUO9yVwmGocvJNRH+ButiqCyjm5WpXl5flEby5
         B6zgNYqLU40A2lZUgsQ79ezaiAFnEayoUlwWYVO9Vadi+kYzcKZ0DR4mB4AQvZ/3RuH4
         2oCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=DReW+a55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si8391098qtn.29.2020.03.23.01.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=DReW+a55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIkH-0000b2-7Q
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIk6-0000Vv-BQ
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIk1-0003LT-D3
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:47:29 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:61632
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjy-0003Jy-Fh; Mon, 23 Mar 2020 04:47:22 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8dp6q010660; Mon, 23 Mar 2020 01:47:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=5VTq8e0BSvrMkvHbeSM4C11NEHq1CPgbCZcb3DuRCxY=;
 b=DReW+a55AYrVaKcxG1LS5CFy/bOsAFdDsatQM6+9vXnnij6G/3LAN378XuCffyfZyizm
 KNDnZmTxF801KKD7i494uf3Wq7k5WM+YLUeQkw94+DIxRCukaD5vNMnkUl5jOG0GlAKE
 4GPDPZPyc9TZm64bBzN5vqleRr6OAVFv1EVsIrtvP5wALtzkXyD67Tr6XrhYNg9AOxjt
 T1/zNh4rUdjpHaDAymhxqDd4eCqqdtjOqK5ErdZqb6vd2KBSG9ofzD8pW+7juDfwP8wy
 n7ELydL6WnqCDivblf9fJ8x1IXB5YCz6ijMvA/XQ2+KqHFqKOLdpJDic20nR5XCTa95l lw== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:47:20 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:47:18 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:47:14 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 9/9] virtio-iommu: add iommu notifier memory-region
Date: Mon, 23 Mar 2020 14:16:17 +0530
Message-ID: <20200323084617.1782-10-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
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
X-TUID: IGRHonbI3VLr

Finally add notify_flag_changed() to for memory-region
access flag iommu flag change notifier

Finally add the memory notifier

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 22 ++++++++++++++++++++++
 hw/virtio/trace-events   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 63fbacdcdc..413792b626 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -966,6 +966,27 @@ unlock:
     qemu_mutex_unlock(&s->mutex);
 }
 
+static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new,
+                                             Error **errp)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        QLIST_INSERT_HEAD(&s->notifiers_list, sdev, next);
+        return 0;
+    }
+
+    if (new == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+        QLIST_REMOVE(sdev, next);
+    }
+    return 0;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1187,6 +1208,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = virtio_iommu_translate;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
     imrc->replay = virtio_iommu_replay;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index b0a6e4bda3..6b7495ac3d 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -78,3 +78,5 @@ virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "m
 virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
 virtio_iommu_fill_pgsize_mask_property(uint32_t devid, uint64_t pgsize_mask, size_t filled) "dev= %d, pgsize_mask=0x%"PRIx64" filled=0x%lx"
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
-- 
2.17.1

