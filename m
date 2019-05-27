Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6322700wrg;
        Mon, 27 May 2019 05:01:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyd+PDmCu7ZAQEcn/YjZUcnK5acJStGsWBViIeJiUsI7zP1TS6RRgMhQGjd0ddckIB+6wbc
X-Received: by 2002:aed:3fd8:: with SMTP id w24mr95568624qth.64.1558958500203;
        Mon, 27 May 2019 05:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958500; cv=none;
        d=google.com; s=arc-20160816;
        b=fmpP4WkU1MYbj0NqzztK5bq8YC11ul/Dv9muYPBNmpYRRNhL1ZbOmFt+gZhn9Ojm9u
         OYtYSGR68uzigV8rRzeTu3zRv1ccU86tOyGKwyiWQc40to0qow57bXZunOP5d8bYShcX
         +alWQp7OxGUnD2tyhF1SoQWSdLS6pIali9oxqtwhiSxMGv7h5qiF0FPJ5alzdTjYZQ1y
         nP5VbcyJw85cBx8PrnXqPScC1AJKsPaJltpg9nQEqCbdSTvBrfFM5Gqv4DtVUjKgrTfZ
         WdVx4UHC8+N9Q7bKXPxY98pzx8dOK2xqEXK+D4SzccB6IkYExf9olOfyh4XH9g06DO+Y
         n1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vi/ef3baG3cQsM7LWl2IFoywQIkyvlz6BpgDa+4AFDw=;
        b=Eop1muom6b6EzTI0GrIXCRH+Du9NgdtnOVcVmHiQRfv2QkqxxaMbBuKTyo+tEkHt76
         tOBN2rA59r1vWFDr0qzE7av6XZYO+T29NzG+M5Knzh+dVKRl1FvGHWU6wZ00APrhrimm
         nxxxjdpJV1+6kmV1N9QzjQ+epXvAMeT2mbhrpdedbqKCFvFFpupo9u0FrDrqIU1PhmMt
         eebsp4XambTqFOvOppoUcI7hYnF2f6IHucdqRxlQHlh/vs/8tWHaz9QRGDFIVg7RT6Qe
         6iy46ouDzIz8hpVCjEIvlBEMnkrwKc5C/TErQsHkc1kwsQ1M4lHPy2yyVPOORx05b679
         emSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27si970840qtd.10.2019.05.27.05.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 05:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEJv-0001Ft-LX
	for alex.bennee@linaro.org; Mon, 27 May 2019 08:01:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4W-0005T1-FP
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:45:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4V-0005Wr-7Q
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:45:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE4U-0005Kr-NU; Mon, 27 May 2019 07:45:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1936A3082B15;
	Mon, 27 May 2019 11:45:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD055D962;
	Mon, 27 May 2019 11:45:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:42:03 +0200
Message-Id: <20190527114203.2762-28-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 27 May 2019 11:45:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 27/27] vfio-pci: Implement the DMA fault handler
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZsL9ybw1uqJJ

Whenever the eventfd is triggered, we retrieve the DMA faults
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8208171f92..a07acf98c7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2834,10 +2834,63 @@ static void vfio_unregister_req_notifier(VFIOPCID=
evice *vdev)
 static void vfio_dma_fault_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev =3D opaque;
+    PCIDevice *pdev =3D &vdev->pdev;
+    AddressSpace *as =3D pci_device_iommu_address_space(pdev);
+    IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
+    struct vfio_region_fault_prod header;
+    struct iommu_fault *queue;
+    char *queue_buffer =3D NULL;
+    ssize_t bytes;
=20
     if (!event_notifier_test_and_clear(&vdev->dma_fault_notifier)) {
         return;
     }
+
+    if (!vdev->fault_prod_region.size || !vdev->fault_cons_region.size) =
{
+        return;
+    }
+
+    bytes =3D pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->fault_prod_region.fd_offset);
+    if (bytes !=3D sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)"=
,
+                     __func__, bytes);
+        return;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue =3D (struct iommu_fault *)vdev->fault_prod_region.mmaps[0].mma=
p;
+    if (!queue) {
+        size_t queue_size =3D header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling=
",
+                     vdev->vbasedev.name);
+
+        queue_buffer =3D g_malloc(queue_size);
+        bytes =3D  pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                       vdev->fault_prod_region.fd_offset + header.offset=
);
+        if (bytes !=3D queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return;
+        }
+
+        queue =3D (struct iommu_fault *)queue_buffer;
+    }
+
+    while (vdev->fault_cons_index !=3D header.prod) {
+        memory_region_inject_faults(iommu_mr, 1,
+                                    &queue[vdev->fault_cons_index]);
+        vdev->fault_cons_index =3D
+            (vdev->fault_cons_index + 1) % header.nb_entries;
+    }
+    bytes =3D pwrite(vdev->vbasedev.fd, &vdev->fault_cons_index, 4,
+                   vdev->fault_cons_region.fd_offset + 4);
+    if (bytes !=3D 4) {
+        error_report("%s unable to write the fault region cons index (0x=
%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
 }
=20
 static void vfio_register_dma_fault_notifier(VFIOPCIDevice *vdev)
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ee64081b47..01737d9372 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -138,6 +138,7 @@ typedef struct VFIOPCIDevice {
     EventNotifier dma_fault_notifier;
     VFIORegion fault_prod_region;
     VFIORegion fault_cons_region;
+    uint32_t fault_cons_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1

