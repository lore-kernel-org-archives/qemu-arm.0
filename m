Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp988612wrv;
        Thu, 11 Jul 2019 10:42:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNfdKJhcLYAu6QJd4PjAYD6L5xIglGPL86L61F/MTTAm6wrOg+jXYak4NwZ1LsC/mcDKze
X-Received: by 2002:a05:6402:1557:: with SMTP id p23mr4729689edx.207.1562866953318;
        Thu, 11 Jul 2019 10:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866953; cv=none;
        d=google.com; s=arc-20160816;
        b=Tfz1ETzmfyl6GYsPVIULRK1XN2D9ZxXZNmj47uqObDvztnxGK54Ttlv4euoSOv7rYu
         QkQMMlCeWZkz8aHrxosqdygX6VBL+54L/arCYeC/l0HKKyA6mxM+BAehB9COn6prNnFQ
         7jtaqyniTOgyKoDXZmyhpK/GyDIo0ATPiiqEgs7TE085WglkZxmRrD4nL9CklIbaIpZl
         2EM5cJVEVNQHfvbJ2BlfjqLv+RvPm5z3vjQy6gwytBGJZdx6Qy1V13uJlnILj/5XGIbv
         UVoLbjCYAK7Np8i7Pmy8CPjpTWNWT3vBJii3fd+rByS7RQde08AOy+W6euv6CH/g9iFb
         DGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sV5A8ao+Z3L2vSbmUeLorNXomjXl2+UzhvQd8iQuEss=;
        b=SC+O/g2b195ySLwu+SXxyzHZBG7cEqT52StJpjToUSVIJAhQVEN81YMvOrpEjgUqlc
         jY6EBCXD7bHG3DCdDuFTxdmPcMIbYz6SsXwqekyChTOyFLpZIgCLFgsZsySlNNsynDqA
         HTUbbhmStKSLaardvcBgyIDDpW0+QavDQdA48in9H3S5nqqmK8FO8GLfaLSRl6cBOe0B
         B62oFMONUFhdhI8Vpq5l78Ll9yWEgsx3LHzfwsmI8mIM9KOvx0DG0xxM7VdIWBrCYFLJ
         2FMFn9Kzk27gQ8jjZZOS6xDDziQCT+YA7VJ0mUSxPE6TVjiUhEaTwUz/CmEkCZpiLPed
         DzSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si3655221eju.217.2019.07.11.10.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld5T-0001Uf-Jq
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld57-00009u-HX
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld50-0005jM-Rx
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4y-0005ap-3K; Thu, 11 Jul 2019 13:42:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B64E30821B2;
 Thu, 11 Jul 2019 17:41:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9ED60600;
 Thu, 11 Jul 2019 17:41:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:24 +0200
Message-Id: <20190711173933.31203-21-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 11 Jul 2019 17:41:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 20/29] vfio/pci: Register handler for iommu fault
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
X-TUID: jETNYZFSklGg

We use the new extended IRQ VFIO_IRQ_TYPE_NESTED type and
VFIO_IRQ_SUBTYPE_DMA_FAULT subtype to set/unset
a notifier for physical DMA faults. The associated eventfd is
triggered, in nested mode, whenever a fault is detected at IOMMU
physical level.

The actual handler will be implemented in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- index_to_str now returns the index name, ie. DMA_FAULT
- use the extended IRQ

v3 -> v4:
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
---
 hw/vfio/pci.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/pci.h |  7 +++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 45e007575e..19702cdbbf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2761,6 +2761,76 @@ static PCIPASIDOps vfio_pci_pasid_ops =3D {
     .set_pasid_table =3D vfio_iommu_set_pasid_table,
 };
=20
+static void vfio_dma_fault_notifier_handler(void *opaque)
+{
+    VFIOPCIExtIRQ *ext_irq =3D opaque;
+
+    if (!event_notifier_test_and_clear(&ext_irq->notifier)) {
+        return;
+    }
+}
+
+static int vfio_register_ext_irq_handler(VFIOPCIDevice *vdev,
+                                         uint32_t type, uint32_t subtype=
,
+                                         IOHandler *handler)
+{
+    int32_t fd, ext_irq_index, index;
+    struct vfio_irq_info *irq_info;
+    Error *err =3D NULL;
+    EventNotifier *n;
+    int ret;
+
+    ret =3D vfio_get_dev_irq_info(&vdev->vbasedev, type, subtype, &irq_i=
nfo);
+    if (ret) {
+        return ret;
+    }
+    index =3D irq_info->index;
+    ext_irq_index =3D irq_info->index - VFIO_PCI_NUM_IRQS;
+    g_free(irq_info);
+
+    vdev->ext_irqs[ext_irq_index].vdev =3D vdev;
+    vdev->ext_irqs[ext_irq_index].index =3D index;
+    n =3D &vdev->ext_irqs[ext_irq_index].notifier;
+
+    ret =3D event_notifier_init(n, 0);
+    if (ret) {
+        error_report("vfio: Unable to init event notifier for ext irq %d=
(%d)",
+                     ext_irq_index, ret);
+        return ret;
+    }
+
+    fd =3D event_notifier_get_fd(n);
+    qemu_set_fd_handler(fd, vfio_dma_fault_notifier_handler, NULL,
+                        &vdev->ext_irqs[ext_irq_index]);
+
+    ret =3D vfio_set_irq_signaling(&vdev->vbasedev, index, 0,
+                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err);
+    if (ret) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        qemu_set_fd_handler(fd, NULL, NULL, vdev);
+        event_notifier_cleanup(n);
+    }
+    return ret;
+}
+
+static void vfio_unregister_ext_irq_notifiers(VFIOPCIDevice *vdev)
+{
+    VFIODevice *vbasedev =3D &vdev->vbasedev;
+    Error *err =3D NULL;
+    int i;
+
+    for (i =3D 0; i < vbasedev->num_irqs - VFIO_PCI_NUM_IRQS; i++) {
+        if (vfio_set_irq_signaling(vbasedev, i + VFIO_PCI_NUM_IRQS , 0,
+                                   VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err=
)) {
+            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name)=
;
+        }
+        qemu_set_fd_handler(event_notifier_get_fd(&vdev->ext_irqs[i].not=
ifier),
+                            NULL, NULL, vdev);
+        event_notifier_cleanup(&vdev->ext_irqs[i].notifier);
+    }
+    g_free(vdev->ext_irqs);
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
@@ -2771,7 +2841,7 @@ static void vfio_realize(PCIDevice *pdev, Error **e=
rrp)
     ssize_t len;
     struct stat st;
     int groupid;
-    int i, ret;
+    int i, ret, nb_ext_irqs;
     bool is_mdev;
=20
     if (!vdev->vbasedev.sysfsdev) {
@@ -2859,6 +2929,11 @@ static void vfio_realize(PCIDevice *pdev, Error **=
errp)
         goto error;
     }
=20
+    nb_ext_irqs =3D vdev->vbasedev.num_irqs - VFIO_PCI_NUM_IRQS;
+    if (nb_ext_irqs > 0) {
+        vdev->ext_irqs =3D g_new0(VFIOPCIExtIRQ, nb_ext_irqs);
+    }
+
     vfio_populate_device(vdev, &err);
     if (err) {
         error_propagate(errp, err);
@@ -3060,6 +3135,9 @@ static void vfio_realize(PCIDevice *pdev, Error **e=
rrp)
=20
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_ext_irq_handler(vdev, VFIO_IRQ_TYPE_NESTED,
+                                  VFIO_IRQ_SUBTYPE_DMA_FAULT,
+                                  vfio_dma_fault_notifier_handler);
     vfio_setup_resetfn_quirk(vdev);
=20
     pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
@@ -3100,6 +3178,7 @@ static void vfio_exitfn(PCIDevice *pdev)
=20
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_ext_irq_notifiers(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     vfio_disable_interrupts(vdev);
     if (vdev->intx.mmap_timer) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 834a90d646..893d074375 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -113,6 +113,12 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
=20
+typedef struct VFIOPCIExtIRQ {
+    struct VFIOPCIDevice *vdev;
+    EventNotifier notifier;
+    uint32_t index;
+} VFIOPCIExtIRQ;
+
 typedef struct VFIOPCIDevice {
     PCIDevice pdev;
     VFIODevice vbasedev;
@@ -134,6 +140,7 @@ typedef struct VFIOPCIDevice {
     PCIHostDeviceAddress host;
     EventNotifier err_notifier;
     EventNotifier req_notifier;
+    VFIOPCIExtIRQ *ext_irqs;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1

