Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp382234wrx;
        Fri, 12 Apr 2019 03:27:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzk5g+clGOKNrf7YTS35Agd3z+8pA6ArDxj5Wt3Uvx4+sNpWyPXmEbnvSCp9+tw5UcGHARb
X-Received: by 2002:a1c:9dc8:: with SMTP id g191mr10792662wme.132.1555064839923;
        Fri, 12 Apr 2019 03:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064839; cv=none;
        d=google.com; s=arc-20160816;
        b=iramsBxwONiORxUakw3Y7vpQA0tcTn3V2WaDyXCox57vC6D8HzXjqMO9n7LFBSkZzA
         6sQOhOTeR/3NS7926B5tLfWELxsMLb3A3HxFLIXzEpzSGce4Mrl3QqZBvTg5WHYeoagx
         EoFIH8jeLiMb+tv3jykhBgMdDc71nJmEJ10NXQKpWTTXnDPZdJxU70b2XErWo2juQwn9
         AZCgMD6QxTn1i2+F4mZY43hco3iRcnML0wS7Uw5qxF9KPY+XeGMGxlMovvKzVXXEehkO
         8BAkw/7TDJmbF+mlwF7FQTEs95MaDUDXlJV1g7BEbd8HwDhrayUm2QFgQoaAW76jOOcd
         BDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CumuodO/gw38jFMbCN9UrLQ40qY6zy4+mY74bIBqsnU=;
        b=rWTORyf5pXp2ySDbRCOEzxW91iQTV8DwFtAzSFIlKO+dHiWYT47Unx02xk3mr5EjcZ
         47y/MCdCForJrDSgpvAUDIR8p0Uiuzst65su/Gn1MSBFKagp6D37L6LuW26bt6ewn1Q/
         CGzGnZzMp0t3Gc2msK78QpEUrIFwvedAZsKfwvxbcaduYus8MGw5bM2yl8Wh8mqMZROH
         qR9O+dpn9Z3OJt2n6j0HYdA/ejlmyvVMQlb9NVxCm8Culri9+vwvvjK+b7bv0KIA0z9j
         ofPzQ6tT0OZ1luXvDp96it6CogKRmCjy5MmtMHEsZBUw5ix9R515zcNoEtkcW/I5xRsX
         BZrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si26233502wrs.258.2019.04.12.03.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtOw-0005Zi-VA
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:27:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt59-0003Nw-LJ
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt58-0005T1-LV
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt58-0005SY-BO; Fri, 12 Apr 2019 06:06:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 944D93082208;
	Fri, 12 Apr 2019 10:06:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0968319C65;
	Fri, 12 Apr 2019 10:06:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:52 +0200
Message-Id: <20190412100354.6409-26-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 12 Apr 2019 10:06:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 25/27] vfio-pci: register handler for iommu fault
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
X-TUID: N05DVzAubB/3

We use the VFIO_PCI_DMA_FAULT_IRQ_INDEX "irq" index to set/unset
a notifier for physical DMA faults. The associated eventfd is
triggered, in nested mode, whenever a fault is detected at IOMMU
physical level.

The actual handler will be implemented in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/vfio/pci.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 46 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index aeb4dfa388..91714cea84 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2722,6 +2722,49 @@ static void vfio_unregister_req_notifier(VFIOPCIDe=
vice *vdev)
     vdev->req_enabled =3D false;
 }
=20
+static void vfio_dma_fault_notifier_handler(void *opaque)
+{
+    VFIOPCIDevice *vdev =3D opaque;
+
+    if (!event_notifier_test_and_clear(&vdev->dma_fault_notifier)) {
+        return;
+    }
+}
+
+static void vfio_register_dma_fault_notifier(VFIOPCIDevice *vdev)
+{
+    Error *err =3D NULL;
+    int32_t fd;
+
+    if (event_notifier_init(&vdev->dma_fault_notifier, 0)) {
+        error_report("vfio: Unable to init event notifier for dma fault"=
);
+        return;
+    }
+
+    fd =3D event_notifier_get_fd(&vdev->dma_fault_notifier);
+    qemu_set_fd_handler(fd, vfio_dma_fault_notifier_handler, NULL, vdev)=
;
+
+    if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_DMA_FAULT_IRQ_I=
NDEX, 0,
+                           VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        qemu_set_fd_handler(fd, NULL, NULL, vdev);
+        event_notifier_cleanup(&vdev->dma_fault_notifier);
+    }
+}
+
+static void vfio_unregister_dma_fault_notifier(VFIOPCIDevice *vdev)
+{
+    Error *err =3D NULL;
+
+    if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_DMA_FAULT_IRQ_I=
NDEX, 0,
+                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
+    qemu_set_fd_handler(event_notifier_get_fd(&vdev->dma_fault_notifier)=
,
+                        NULL, NULL, vdev);
+    event_notifier_cleanup(&vdev->dma_fault_notifier);
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
@@ -3007,6 +3050,7 @@ static void vfio_realize(PCIDevice *pdev, Error **e=
rrp)
=20
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_dma_fault_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
=20
     return;
@@ -3045,6 +3089,7 @@ static void vfio_exitfn(PCIDevice *pdev)
=20
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_dma_fault_notifier(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     vfio_disable_interrupts(vdev);
     if (vdev->intx.mmap_timer) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index c11c3f1670..55b14a1ece 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -135,6 +135,7 @@ typedef struct VFIOPCIDevice {
     PCIHostDeviceAddress host;
     EventNotifier err_notifier;
     EventNotifier req_notifier;
+    EventNotifier dma_fault_notifier;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1

