Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6321912wrg;
        Mon, 27 May 2019 05:01:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRa+DwVWK+fRojDsunt9wgZKJGO4RpxQZMmjkD3CcIzprbBMgxrhP8+qw/pMe351LixY5W
X-Received: by 2002:aed:3686:: with SMTP id f6mr77895715qtb.30.1558958462430;
        Mon, 27 May 2019 05:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958462; cv=none;
        d=google.com; s=arc-20160816;
        b=ChFB0Dfy6kepZruEzpVo2HBFVqUpUo86lTlUArUcY0U2h9F9ahAlySd48/A+EAZYR+
         tIuBhRSuzFUwT0X6El3fBI+f1MjcXjTp/OjySz+COEnCMT51VXrVg4qdLhRTSMWjgwGL
         4C9az0CbKG7tForeKNAWb3iQSACmefIHqMY9GhpeUXOd9Mbe7IAD6AGjjCF5JZUHg1Tr
         yQkzxO+NFmqR/MES7/WHtFv7j+O8LmsKY5GhcoOEVamG8Tc1zoH1g8QOoiE/jCoBiJ1d
         GlELNVeZAssg8Ga5c5ujGxKX123FuxD5K1nOH5wSSkt/Ayb/vLCj5T66DmL+WAqIcuRr
         cI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=W8kg9y67npvKeFFlJokIY7XfKm5nD76ldWNwTyuvj5w=;
        b=su9+TJvqGK7L8CLNcIdBO1vjz5evBh9RBhSdUg1DWxMNtrlfs4kDHO6M98DpWikDzf
         8bOrxNM8oIGJwtmvCi/V3rR6w1pvmT0s3vQjEXosBRbpmsIrFAFV899bdet8v/WVjs7j
         FcVSaCH44D9endjCCSxkLk4v951LkL7aM1GkeCYAE2sHLVsebKWAIFnQdh0S1YnyBwJa
         ntzjpokAu7XF37AweLofgQ+POt83As+w+ynMRDP532tJv+/FWqjtRJw20dMZovd571tl
         GP4EYhDgqkrMzvfwKOQ/Fj7Iqkrr0CvUmB6ExnOa8h1yCDHKzEIKGCkBPQXpkM1mkPXj
         wxkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c51si5429985qtb.330.2019.05.27.05.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 05:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEJJ-00009R-Rx
	for alex.bennee@linaro.org; Mon, 27 May 2019 08:01:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4b-0005Xs-N6
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4a-0005dt-Ek
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE4U-0005AU-Ql; Mon, 27 May 2019 07:45:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42C3046202;
	Mon, 27 May 2019 11:45:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25F3D5D962;
	Mon, 27 May 2019 11:45:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:42:01 +0200
Message-Id: <20190527114203.2762-26-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 27 May 2019 11:45:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 25/27] vfio-pci: register handler for iommu
 fault
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5pJSB8qoCAvD

We use the VFIO_PCI_DMA_FAULT_IRQ_INDEX "irq" index to set/unset
a notifier for physical DMA faults. The associated eventfd is
triggered, in nested mode, whenever a fault is detected at IOMMU
physical level.

As this is the first use of this new IRQ index, also handle it
in irq_to_str() in case the signaling setup fails.

The actual handler will be implemented in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
---
 hw/vfio/common.c |  3 +++
 hw/vfio/pci.c    | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h    |  1 +
 3 files changed, 56 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 532ede0e70..cf0087321e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -130,6 +130,9 @@ static char *irq_to_str(int index, int subindex)
     case VFIO_PCI_REQ_IRQ_INDEX:
         str =3D g_strdup_printf("REQ-%d", subindex);
         break;
+    case VFIO_PCI_DMA_FAULT_IRQ_INDEX:
+        str =3D g_strdup_printf("DMA-FAULT-%d", subindex);
+        break;
     default:
         str =3D g_strdup_printf("index %d (unknown)", index);
         break;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index b613b20501..29d4f633b0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2736,6 +2736,56 @@ static void vfio_unregister_req_notifier(VFIOPCIDe=
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
+    struct vfio_irq_info irq_info =3D { .argsz =3D sizeof(irq_info),
+                                      .index =3D VFIO_PCI_DMA_FAULT_IRQ_=
INDEX };
+    Error *err =3D NULL;
+    int32_t fd;
+
+    if (ioctl(vdev->vbasedev.fd,
+              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count=
 < 1) {
+        return;
+    }
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
@@ -3035,6 +3085,7 @@ static void vfio_realize(PCIDevice *pdev, Error **e=
rrp)
=20
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_dma_fault_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
=20
     return;
@@ -3073,6 +3124,7 @@ static void vfio_exitfn(PCIDevice *pdev)
=20
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_dma_fault_notifier(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     vfio_disable_interrupts(vdev);
     if (vdev->intx.mmap_timer) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index cfcd1a81b8..96d29d667b 100644
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

