Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1132413lfe;
        Fri, 20 Mar 2020 10:05:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvUAO8f1fQ88OrQswRhWAvEGNECUGLgjBD+L/lLWJhB12rVIlOy7ojo3lDuh3fRM+A9obIK
X-Received: by 2002:ac8:24db:: with SMTP id t27mr9506639qtt.49.1584723936491;
        Fri, 20 Mar 2020 10:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723936; cv=none;
        d=google.com; s=arc-20160816;
        b=aE71/IJHMshA3H2rvYhWkg8GSZZ1laxQ+8zPZjir5Ewb+InvbNNqQxv1syM7LYnAqm
         R3G1dOjjm7bqW+QsH4Ba6v10rwPdDOTFFhN74dibtzVTEexhZPBgD9cvcaDEo+88ZhEy
         eLe/Ybr3i2gJGtjH6B9cdyNZpVH15sDiwLVBmuCC9rHywP7o/TxD45IpyZgbF0my+qlk
         OnZPkvyY0HQQSA7YXAWec4QfsE3WqV51jnv5f4vosNdwgQQoWQnbHbqqSkySToBVgVyd
         UCHWvJwA3SSvtYQjlU4dqxs1iMgB4Z5ZmQygnNFvpVSRFUoW6OazKQo9Vpjb0+S/JQmE
         v2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DD005dd9XYq9ejeZfv7EejWiYQNyMFKKOlHMcCHP6e8=;
        b=QIjdtyGx/CfXGB000piiLDs7xnmgsGGdPm71KXEypZPQWul8dx0SC2FsiVqg9/7FlR
         y0g38e8L4R0yuGX6xZJB3kEO2V6/4BOOQuRpt++hbran0tZirE3hKE1xjClJn0xkdPA9
         s8f3nS39am3UGFn5bqRytQYOPY5rNQSIPsYphNOodEBAuiB1o/x9MeBT1eLalC6F35kZ
         lQ3VhdCy7ORCr+tp/UGHRAjwBbpdcWlGcYC1wnliiW2VmgofbuSL4hTPCkljkqFubriO
         WTiY3wZliZ1ppjMfACm0ujOA7mYESjNyJXV7pHv+zgd2LCPsyOVAlQyZ8KO3/eEhY0UY
         Cn1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hJINlfe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o51si3805695qtj.187.2020.03.20.10.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hJINlfe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL5T-0003Rf-MB
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL2t-0008Tm-6q
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL2r-00086i-K6
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41223)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL2r-00086T-Fi
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DD005dd9XYq9ejeZfv7EejWiYQNyMFKKOlHMcCHP6e8=;
 b=hJINlfe5a61C25a/EaVU5UTa3QO7XFfL9PO75V4nTc8uZsQUZOj3QZj95Ufb+Hd2F9+jBb
 8k40IddcE4DEvS0nHp2pE8ArBYS++QMXKAoRqJPUPa+HLKETIDtIeViQ8fYvjN4/VHvd0n
 gsIIs2oLDQ4MIx3GqxtDCYg1fKrO9mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-P2-9E2bsOc2yW9dalUZa4Q-1; Fri, 20 Mar 2020 13:02:51 -0400
X-MC-Unique: P2-9E2bsOc2yW9dalUZa4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B8F801F85;
 Fri, 20 Mar 2020 17:02:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4343216D22;
 Fri, 20 Mar 2020 17:02:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 15/24] vfio/pci: Register handler for iommu fault
Date: Fri, 20 Mar 2020 17:58:31 +0100
Message-Id: <20200320165840.30057-16-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBZhYNtRkceb

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
index 6f2d5696c3..7579f476b0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2780,6 +2780,76 @@ static PCIPASIDOps vfio_pci_pasid_ops =3D {
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
+                                         uint32_t type, uint32_t subtype,
+                                         IOHandler *handler)
+{
+    int32_t fd, ext_irq_index, index;
+    struct vfio_irq_info *irq_info;
+    Error *err =3D NULL;
+    EventNotifier *n;
+    int ret;
+
+    ret =3D vfio_get_dev_irq_info(&vdev->vbasedev, type, subtype, &irq_inf=
o);
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
+        error_report("vfio: Unable to init event notifier for ext irq %d(%=
d)",
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
+                                   VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err))=
 {
+            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        }
+        qemu_set_fd_handler(event_notifier_get_fd(&vdev->ext_irqs[i].notif=
ier),
+                            NULL, NULL, vdev);
+        event_notifier_cleanup(&vdev->ext_irqs[i].notifier);
+    }
+    g_free(vdev->ext_irqs);
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
@@ -2790,7 +2860,7 @@ static void vfio_realize(PCIDevice *pdev, Error **err=
p)
     ssize_t len;
     struct stat st;
     int groupid;
-    int i, ret;
+    int i, ret, nb_ext_irqs;
     bool is_mdev;
=20
     if (!vdev->vbasedev.sysfsdev) {
@@ -2890,6 +2960,11 @@ static void vfio_realize(PCIDevice *pdev, Error **er=
rp)
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
@@ -3094,6 +3169,9 @@ static void vfio_realize(PCIDevice *pdev, Error **err=
p)
=20
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_ext_irq_handler(vdev, VFIO_IRQ_TYPE_NESTED,
+                                  VFIO_IRQ_SUBTYPE_DMA_FAULT,
+                                  vfio_dma_fault_notifier_handler);
     vfio_setup_resetfn_quirk(vdev);
=20
     pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
@@ -3145,6 +3223,7 @@ static void vfio_exitfn(PCIDevice *pdev)
=20
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_ext_irq_notifiers(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier)=
;
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 0da7a20a7e..56f0fabb33 100644
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

