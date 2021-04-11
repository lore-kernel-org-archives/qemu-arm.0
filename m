Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3060412lfr;
        Sun, 11 Apr 2021 05:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH9mQC8P7l8A2BrGenHLNoECNfJzSqi2YtElZXfS8BSJlhczh/6qfLJPnYtIdEQJ4ClbhK
X-Received: by 2002:a05:6638:6a8:: with SMTP id d8mr8150452jad.98.1618143831952;
        Sun, 11 Apr 2021 05:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143831; cv=none;
        d=google.com; s=arc-20160816;
        b=QsxSdfi1g+gyp5+ILV+M987a0AgQPnsyPCzISn0S8O5ZU/A15xKi1mPGmDTKlqA71M
         HoNiAOitIPxZwuhjqIlORSnJYQ7s9mZw7se+X9RdfvOt+e0Flj0C+J6ihmtCAryXlRqu
         7/faLZ1IIkGEhyYe0HXVF6DuJB6m7U4JJc2KpXumf/cUeLotZ9njb4oEadTMM+6fszry
         uo+pJjQ/tvVYUjBX93XbTvmhCf5atJrzrNmrQuzM7HApvp3tNk7jzL/VR8+309obSZon
         ttkMJwaZ9QAGJevCTOtKcQlSOnwAgqpvLbo2zG2DKIPvetkm5K1UNEpyfDBS48oT1cN5
         qikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S4i9Hkh2G74vXTt4W6AodigO60TphxXh0mjmMPlypUQ=;
        b=nfb6vZGkUN49DgzW1gW6Cz+wSaSfPGu7d5yD3pZ93aUMdeIeeYzamgXHtIy/Lgpv1K
         XOJ+vgSerQUj17J8u41mrSm8rp3i9unjs2+JWRjdXgviB4uIgi9mBU3JzJLwGFUE+0Mr
         RMAVNvv7tWAIlG/F182UiZHRc2r73KUz3tujBMlJ5QXP9HMNYapnelyFasb2S11UXWVL
         jkQry4xYBoBrVS2mh0BBWjBTV8OeBR/0ul4Hnlfbk5yBVpAi5P5di72XVA932GeI9kJN
         ws6BbWzM6yl1XhOowGUs9ddEed6ILlVqCLCYJlgk0Ji/wNam5IghU6G/KeDPePsE+889
         7Saw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yp0qR04P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si10227614ili.97.2021.04.11.05.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yp0qR04P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZ83-0001zl-5T
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxg-00029B-R5
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxc-0003eC-FW
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4i9Hkh2G74vXTt4W6AodigO60TphxXh0mjmMPlypUQ=;
 b=Yp0qR04PaxI5zZM+Ht3JjtRO+2sJossIa2oC2wl74pKgWQ50/7/zfHLecI1b6mdZE4VY/+
 j8nEEX3DMmS5f61ml4JwGs6w3rN9HOjjs54u9mMZXJTBlbsuSGlyCk8qQkbHmiTZV50+co
 tdhUfguYI3XD7tAT/2CMfzzMb4/lM3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-rhCsI5NxOPu9mtBOh5Vjkg-1; Sun, 11 Apr 2021 08:12:58 -0400
X-MC-Unique: rhCsI5NxOPu9mtBOh5Vjkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4B4981746A;
 Sun, 11 Apr 2021 12:12:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD9010023B2;
 Sun, 11 Apr 2021 12:12:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 18/29] vfio/pci: Register handler for iommu fault
Date: Sun, 11 Apr 2021 14:09:01 +0200
Message-Id: <20210411120912.15770-19-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pd40D2jSzARZ

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
 hw/vfio/pci.h |  7 +++++
 hw/vfio/pci.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 64777516d1..a8b06737fb 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -114,6 +114,12 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
+typedef struct VFIOPCIExtIRQ {
+    struct VFIOPCIDevice *vdev;
+    EventNotifier notifier;
+    uint32_t index;
+} VFIOPCIExtIRQ;
+
 #define TYPE_VFIO_PCI "vfio-pci"
 OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
 
@@ -138,6 +144,7 @@ struct VFIOPCIDevice {
     PCIHostDeviceAddress host;
     EventNotifier err_notifier;
     EventNotifier req_notifier;
+    VFIOPCIExtIRQ *ext_irqs;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a49029dfa4..71b411b61c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2864,6 +2864,76 @@ static PCIPASIDOps vfio_pci_pasid_ops = {
     .set_pasid_table = vfio_iommu_set_pasid_table,
 };
 
+static void vfio_dma_fault_notifier_handler(void *opaque)
+{
+    VFIOPCIExtIRQ *ext_irq = opaque;
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
+    Error *err = NULL;
+    EventNotifier *n;
+    int ret;
+
+    ret = vfio_get_dev_irq_info(&vdev->vbasedev, type, subtype, &irq_info);
+    if (ret) {
+        return ret;
+    }
+    index = irq_info->index;
+    ext_irq_index = irq_info->index - VFIO_PCI_NUM_IRQS;
+    g_free(irq_info);
+
+    vdev->ext_irqs[ext_irq_index].vdev = vdev;
+    vdev->ext_irqs[ext_irq_index].index = index;
+    n = &vdev->ext_irqs[ext_irq_index].notifier;
+
+    ret = event_notifier_init(n, 0);
+    if (ret) {
+        error_report("vfio: Unable to init event notifier for ext irq %d(%d)",
+                     ext_irq_index, ret);
+        return ret;
+    }
+
+    fd = event_notifier_get_fd(n);
+    qemu_set_fd_handler(fd, vfio_dma_fault_notifier_handler, NULL,
+                        &vdev->ext_irqs[ext_irq_index]);
+
+    ret = vfio_set_irq_signaling(&vdev->vbasedev, index, 0,
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
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    Error *err = NULL;
+    int i;
+
+    for (i = 0; i < vbasedev->num_irqs - VFIO_PCI_NUM_IRQS; i++) {
+        if (vfio_set_irq_signaling(vbasedev, i + VFIO_PCI_NUM_IRQS , 0,
+                                   VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
+            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        }
+        qemu_set_fd_handler(event_notifier_get_fd(&vdev->ext_irqs[i].notifier),
+                            NULL, NULL, vdev);
+        event_notifier_cleanup(&vdev->ext_irqs[i].notifier);
+    }
+    g_free(vdev->ext_irqs);
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
@@ -2874,7 +2944,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     ssize_t len;
     struct stat st;
     int groupid;
-    int i, ret;
+    int i, ret, nb_ext_irqs;
     bool is_mdev;
 
     if (!vdev->vbasedev.sysfsdev) {
@@ -2962,6 +3032,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    nb_ext_irqs = vdev->vbasedev.num_irqs - VFIO_PCI_NUM_IRQS;
+    if (nb_ext_irqs > 0) {
+        vdev->ext_irqs = g_new0(VFIOPCIExtIRQ, nb_ext_irqs);
+    }
+
     vfio_populate_device(vdev, &err);
     if (err) {
         error_propagate(errp, err);
@@ -3173,6 +3248,9 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_ext_irq_handler(vdev, VFIO_IRQ_TYPE_NESTED,
+                                  VFIO_IRQ_SUBTYPE_DMA_FAULT,
+                                  vfio_dma_fault_notifier_handler);
     vfio_setup_resetfn_quirk(vdev);
 
     pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
@@ -3215,6 +3293,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_ext_irq_notifiers(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
-- 
2.26.3

