Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp248998lfg;
        Thu, 25 Feb 2021 03:08:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaALqetJIjqhn+hXuFHOc8IyKa12vzZDyM8Qr0OAkahZOCTXv5qnJve7/avgQn5NQiMRVV
X-Received: by 2002:a02:3907:: with SMTP id l7mr2686889jaa.0.1614251339246;
        Thu, 25 Feb 2021 03:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251339; cv=none;
        d=google.com; s=arc-20160816;
        b=qV4hbX9ukjkORDXhDs5iIqd4hya1f33eWme4l+wWJnWvP3Lwldpfag7O7C6xn0I01H
         WqN9l7fy50fqcvfYcgSkptBzQKuNHsfT5houhAtpOwNzGaz6As2+YFo8MK5q93xgx3HD
         wyWNpuGZL+XLHT4t2WmLjzCjb3wgedhJYEN56XVz8c9RjNuYXhOiXAdzYeL1oXkWILU6
         vMtljnH2D1rSMQcr6zGyathkhvKPGf6BTRqMFSbuXkBsBXY73pGGh6k7ba+K2YhV41+R
         M037wvEqhpqbtsnNdGov9BCC/AZLuhUujRg6HNxpR/6C+AE/QQaZc8H5FGj03aWgvHhE
         oaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=16ZRffJs4/uI98bU1xCSDf4BF0jXBo9HDBhwgoo0gJE=;
        b=xzzk0YOeb+Pup36kx4gjelPTncFlNdqQvGuIyBRLOvDYgRuSzRafE/y8x5pfrk111f
         k5zQ8++eqox4oaldOetfpJ3xSNK7o8DfGy6OSyboaIa0zzVQJWVbdRQxR8hk00/GZr6K
         NPW9/x9hxYAldX57y+nVHY/7nGchuqV1OUoxsNmaml6TxsAXapgJT6pTI2VdZMLzzOkE
         me5Fp2saQcYBPHX4TiAoHcxRUmOHW2wTM/pqVzSt41hF5J0YR90+COXZm8JZTWaN4I7G
         ldop0esIkJI2FcW5Pw4UDb62DRjOfM7qfCG3oQP5X3fL+r8C6kU43bRm2N2dqMYFBBgK
         64bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="c/hR0a8e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si2558751jaq.98.2021.02.25.03.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="c/hR0a8e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEVu-0003Zr-Ho
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEJy-0001e1-4t
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:56:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEJu-0006K9-Ud
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16ZRffJs4/uI98bU1xCSDf4BF0jXBo9HDBhwgoo0gJE=;
 b=c/hR0a8eToabY7I6Gb1OtiUYnKtdyEtMf4sYi3DDTwGWtX4SAb3zSc/8pivqXnavanfu0l
 R+LHeJ3/XPeSzFsg/WeQdUCTxq+jU3iSctSVQUOPX7iqInfMvYgUbOsOtUcqfF6UcAgi9S
 Xrgch1tdsuAiLu8Qdjx9Ue+XCaLfXJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-pBf935WYOfeoWQXh2Zm5ww-1; Thu, 25 Feb 2021 05:56:30 -0500
X-MC-Unique: pBf935WYOfeoWQXh2Zm5ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D578801978;
 Thu, 25 Feb 2021 10:56:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 889E95D9D7;
 Thu, 25 Feb 2021 10:56:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 18/28] vfio/pci: Set up the DMA FAULT region
Date: Thu, 25 Feb 2021 11:52:23 +0100
Message-Id: <20210225105233.650545-19-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xhyW5bTIWI7g

Set up the fault region which is composed of the actual fault
queue (mmappable) and a header used to handle it. The fault
queue is mmapped.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- use a single DMA FAULT region. No version selection anymore
---
 hw/vfio/pci.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 65 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index dfce777556..9fbbf88673 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2600,11 +2600,67 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
     return 0;
 }
 
+static void vfio_init_fault_regions(VFIOPCIDevice *vdev, Error **errp)
+{
+    struct vfio_region_info *fault_region_info = NULL;
+    struct vfio_region_info_cap_fault *cap_fault;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    struct vfio_info_cap_header *hdr;
+    char *fault_region_name;
+    int ret;
+
+    ret = vfio_get_dev_region_info(&vdev->vbasedev,
+                                   VFIO_REGION_TYPE_NESTED,
+                                   VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT,
+                                   &fault_region_info);
+    if (ret) {
+        goto out;
+    }
+
+    hdr = vfio_get_region_info_cap(fault_region_info,
+                                   VFIO_REGION_INFO_CAP_DMA_FAULT);
+    if (!hdr) {
+        error_setg(errp, "failed to retrieve DMA FAULT capability");
+        goto out;
+    }
+    cap_fault = container_of(hdr, struct vfio_region_info_cap_fault,
+                             header);
+    if (cap_fault->version != 1) {
+        error_setg(errp, "Unsupported DMA FAULT API version %d",
+                   cap_fault->version);
+        goto out;
+    }
+
+    fault_region_name = g_strdup_printf("%s DMA FAULT %d",
+                                        vbasedev->name,
+                                        fault_region_info->index);
+
+    ret = vfio_region_setup(OBJECT(vdev), vbasedev,
+                            &vdev->dma_fault_region,
+                            fault_region_info->index,
+                            fault_region_name);
+    g_free(fault_region_name);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "failed to set up the DMA FAULT region %d",
+                         fault_region_info->index);
+        goto out;
+    }
+
+    ret = vfio_region_mmap(&vdev->dma_fault_region);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to mmap the DMA FAULT queue");
+    }
+out:
+    g_free(fault_region_info);
+}
+
 static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 {
     VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info) };
+    Error *err = NULL;
     int i, ret = -1;
 
     /* Sanity check device */
@@ -2668,6 +2724,12 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
         }
     }
 
+    vfio_init_fault_regions(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
@@ -3260,6 +3322,7 @@ static void vfio_instance_finalize(Object *obj)
 
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
+    vfio_region_finalize(&vdev->dma_fault_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3280,6 +3343,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_ext_irq_notifiers(vdev);
+    vfio_region_exit(&vdev->dma_fault_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index c5f06f4ae4..d6cc689f5e 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -145,6 +145,7 @@ struct VFIOPCIDevice {
     EventNotifier err_notifier;
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
+    VFIORegion dma_fault_region;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
-- 
2.26.2

