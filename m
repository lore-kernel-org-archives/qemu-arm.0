Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp384226wrx;
        Fri, 12 Apr 2019 03:29:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNO8uYH8CbCbxYz70C7Plo9FumBwXDVg2juj7A2qbXObS2C/u4DC+tSVtY9zHgxaQ4j2jf
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr9646682wmg.56.1555064970962;
        Fri, 12 Apr 2019 03:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064970; cv=none;
        d=google.com; s=arc-20160816;
        b=p1i5837EZoYv8yA2ZqZIewNk8gxuJJcF7GcjqZ8kbz7iuwT9QCwpT0SmUj4Sqp7wDB
         OTgKvX9Y0v7VxuXXBIp0R4V0KwJ3lToTPfGOtZe/bNQFusgh+2Vj2b/W5iyWEcq+ifSY
         3AaEhK9vZp7YjcIm9mg+31vIK0vleujEKW3rPlAGjrvYc4AZXav0rG6Bvw8ayr7m85e3
         8ObwttRHLVpLEYCUFaaLbNJOEZPJtZZIQaAY/ihV/C3jmXu51KBbJ50OiLnEjg45h8LS
         kD4vCDnD8rRQ5TGLorO22O5OC2VoZe3+feD01w/UEfdH4mmi2ehBpAt8p2pQ2l5pxItp
         8jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YRhfjVjXalHQaaYi8dDtAHbIRjpqNxfQpbuKMLjKMM8=;
        b=WUm4fq/t+/CO1L1t8ILz0t/7YSf7ccdIpMCWSASUO8EX5hhcS5cn87ioISCI60XTmO
         qwoNpr7GsNBSch9AAG7+2vkZCnlcCbb07ckFBbd6y6otijiBOsDOh5kehXbKm+3aitS6
         5ljxP1dADnD/sW9D3Hudy3LxocPdqdHixJYUglzXbjpl1dW6MfHxaFfr4tIayOtyvMOo
         XAWyM5AKySfinOJ3ysMYwfuWjr4ljntK+YbhoeSRf3MHp0l3y3h67/gObANh/0B119ul
         jSkMym9sy8fKyGURiYYwtx96d1D1yFDHmZ6MTIk267+s+OiJxhu2UeeJQdOief7mRCWd
         6y0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si4902899wmd.31.2019.04.12.03.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtR4-00073T-0w
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:29:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt5R-0003bX-NI
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:07:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt5Q-0005lj-NM
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:07:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt5Q-0005l8-DN; Fri, 12 Apr 2019 06:07:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A11BD3145426;
	Fri, 12 Apr 2019 10:07:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52D3B19728;
	Fri, 12 Apr 2019 10:07:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:54 +0200
Message-Id: <20190412100354.6409-28-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 12 Apr 2019 10:07:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 27/27] vfio-pci: Implement the DMA fault handler
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZHpdLT3MwIn

Whenever the eventfd is triggered, we retrieve the DMA faults
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 89399a290f..fcbb92cf27 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2820,10 +2820,63 @@ static void vfio_unregister_req_notifier(VFIOPCID=
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
index 24ec43ac81..aef69c4487 100644
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

