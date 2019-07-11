Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990206wrv;
        Thu, 11 Jul 2019 10:44:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlHxFj2MwiYAXzMuTDIpCyf9fkbj9Dkk5wKxiNpD2HEGcxUYt7D0dJ2RPbFY/L/p5CrS1v
X-Received: by 2002:a17:906:78c7:: with SMTP id r7mr4373752ejn.147.1562867053851;
        Thu, 11 Jul 2019 10:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867053; cv=none;
        d=google.com; s=arc-20160816;
        b=f5f8XOz3214sti957iyNC1/KY9t3X+q5XkXgTXDLHFT4gzdgGBwp4Ko6lzU3V47r4r
         nvjO5pvJa4V1Xpheib2T9hfBMVlE5k5q29rFclXRO2AAfOujwOL9wwiFtgIB+WINew4I
         ZkOQV48FpbiFogpVW1HKUMi516M8sE2pcGPc8oiCDqeZm1DwQ8NsLrm5K+YBGxPxhMqm
         sYNyLjZUeJkzoUJcuMKZyfGm1tR8KuSE9CJC/2vIUjGrOVUz7zF+IKxF6FZDiQIS9/sc
         RimGoxFcJm4DMQsaIZKAy7BVVMCGfKA2bKJYLEs8ZCsYI7HSZy6IhFLlGPnIoOnpQiVx
         Zz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zcTaZjjSeG+c+krj6oTa0Mw4h+HJcHhAK0oJk8QOVJ4=;
        b=CWlkYob2+7L+xpMqYJr2eC2NITssc8W5maSw0DxLohnc6fZFA6Ge1gVEhR9sAXl8fS
         o5xajPeG+69Ajy7o2o1ut1OFrU3hPOQZzMRLVOsKsLFKrujWzh78t3h7TFTFgB3j1wNV
         b8wFVvuChsKkQn98jO2ogPHZmE0q4BuvfD6I6zg6kf6aqLAaEURWpad9IfABYZucI3O+
         mLlrJEtg08YD1qPfkKJjQzoZrjk3hq0trU8e5/uyOzlOezFrRgiWdK/PEZWjle8Vab7K
         osyM6xqKtiWiGOHJIT/JY4Ds/rvxOpHPDAhDS9XnKx4kyvDs+idp/t2rNBzxF84IHHC1
         ZNJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si3524533ejb.187.2019.07.11.10.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld75-0000VF-VW
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39043)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5X-00027O-Gz
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5W-0006DI-2e
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41032)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5U-0005xU-Tc; Thu, 11 Jul 2019 13:42:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA62D30C2533;
 Thu, 11 Jul 2019 17:42:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF52E60603;
 Thu, 11 Jul 2019 17:42:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:26 +0200
Message-Id: <20190711173933.31203-23-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 17:42:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 22/29] vfio/pci: Implement the DMA fault handler
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h59St1Jo2GVV

Whenever the eventfd is triggered, we retrieve the DMA fault(s)
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 51 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8c8647c4b5..081e964788 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2826,10 +2826,60 @@ static PCIPASIDOps vfio_pci_pasid_ops =3D {
 static void vfio_dma_fault_notifier_handler(void *opaque)
 {
     VFIOPCIExtIRQ *ext_irq =3D opaque;
+    VFIOPCIDevice *vdev =3D ext_irq->vdev;
+    PCIDevice *pdev =3D &vdev->pdev;
+    AddressSpace *as =3D pci_device_iommu_address_space(pdev);
+    IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
+    struct vfio_region_dma_fault header;
+    struct iommu_fault *queue;
+    char *queue_buffer =3D NULL;
+    ssize_t bytes;
=20
     if (!event_notifier_test_and_clear(&ext_irq->notifier)) {
         return;
     }
+
+    bytes =3D pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->dma_fault_region.fd_offset);
+    if (bytes !=3D sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)"=
,
+                     __func__, bytes);
+        return;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue =3D (struct iommu_fault *)vdev->dma_fault_region.mmaps[0].mmap=
;
+    if (!queue) {
+        size_t queue_size =3D header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling=
",
+                     vdev->vbasedev.name);
+
+        queue_buffer =3D g_malloc(queue_size);
+        bytes =3D  pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                       vdev->dma_fault_region.fd_offset + header.offset)=
;
+        if (bytes !=3D queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return;
+        }
+
+        queue =3D (struct iommu_fault *)queue_buffer;
+    }
+
+    while (vdev->fault_tail_index !=3D header.head) {
+        memory_region_inject_faults(iommu_mr, 1,
+                                    &queue[vdev->fault_tail_index]);
+        vdev->fault_tail_index =3D
+            (vdev->fault_tail_index + 1) % header.nb_entries;
+    }
+    bytes =3D pwrite(vdev->vbasedev.fd, &vdev->fault_tail_index, 4,
+                   vdev->dma_fault_region.fd_offset);
+    if (bytes !=3D 4) {
+        error_report("%s unable to write the fault region tail index (0x=
%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
 }
=20
 static int vfio_register_ext_irq_handler(VFIOPCIDevice *vdev,
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 815154656c..e31bc0173a 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -142,6 +142,7 @@ typedef struct VFIOPCIDevice {
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
     VFIORegion dma_fault_region;
+    uint32_t fault_tail_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1

