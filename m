Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3937147lfb;
        Mon, 16 Nov 2020 10:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3HEncu9Dq6L7HdGlsxCGTNTDIAuCEi73oADSbG7cNQnyRXiX4Ii6HoCLS0x2zqR9PAQRY
X-Received: by 2002:a25:9746:: with SMTP id h6mr18782200ybo.222.1605551182541;
        Mon, 16 Nov 2020 10:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605551182; cv=none;
        d=google.com; s=arc-20160816;
        b=SdQVJfsqGCzljLNA1QtXIdUiGYrE5azF6SzWwqzaWy3anGD1g664lSmAVIQ8buT6tZ
         pY0D35bUUwYRL7agI83oBMuaJq5CO/OlPVJkvMwssDKOPnDrG2E4GuPblq5VapBg1UJD
         4HTgGT2MP5ARInV8eWQrS6qRnIzsvaHm3cvQI+EcG+dg+DxVg90uT2/dzTAteGT+Rx63
         nGz2y5XOycMfYoi3YinPlXbVSySpyxGB/r793XDmSntiwuqEuFKp8zcAXoQZN05iSHVN
         PDK6WsCnsdX1bPms7FgymoCrz/CVtLPBWb+LMVE3HiShDGF6E65fiYJLBRWwVhktR0oU
         CHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lYmgpWoinfUpvC2UiHMacxC64ouah1wgLKcypEX+e6k=;
        b=HGQj/8uxDvqJMH792W/XQkuSj1yHjZDuPo78bsX6YwKo+yevE5E6/XjZ+fp/zzxoLP
         vpUCQuPQeJuAv6IH5cjN3GPYiTz3nElOkkRLuYjxbPa3lKH/MeL4K/Zhe5gu11rDlx87
         RcdMiHMHdtBirM+PKQBcmN4PwOL+nAWy7m9G8lw3kGC3EoZf3LMH/CCF4HmlXF+B0yV+
         DQRrptSCngek3H/JpwcT/HzLtEIovXL9EFYIYmwL3GVGzKF8mgi77qi5BpVOw4E1zBoI
         qYRhbLWsZTv6IJr80WAKBNPjJVpw3HjfHQcbRLhkC/G/4rHCGakYn0G5BQDcjN7aBKnt
         kxnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S7/L49qT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d35si19590150ybi.158.2020.11.16.10.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S7/L49qT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejCn-0005jS-Sw
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3v-0001rn-Vn
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3r-0001af-Ts
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYmgpWoinfUpvC2UiHMacxC64ouah1wgLKcypEX+e6k=;
 b=S7/L49qTtMV7RR4i2cMsGn62ePGHkmy+M+CCV/PfjktfW34plaFN47Gpe2wQ/Vx/079NNK
 G+LXeFzCFb0tUcIgfnCd2W0rZ5qsatIF3GqvvDm0qTGKVAUebXcW+bJ5aKvS4PlLL2iaJU
 FPnZGBGq/hVkFxBelrHlEtsWgV7TCYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-ngGcn1viN-CooEeQ2r9ENQ-1; Mon, 16 Nov 2020 13:17:01 -0500
X-MC-Unique: ngGcn1viN-CooEeQ2r9ENQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F67835B48;
 Mon, 16 Nov 2020 18:16:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C715C1CF;
 Mon, 16 Nov 2020 18:16:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 17/26] vfio/pci: Implement the DMA fault handler
Date: Mon, 16 Nov 2020 19:13:40 +0100
Message-Id: <20201116181349.11908-18-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hhD8B7FzdTuJ

Whenever the eventfd is triggered, we retrieve the DMA fault(s)
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.h |  1 +
 hw/vfio/pci.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index d6cc689f5e..350e9e9005 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -146,6 +146,7 @@ struct VFIOPCIDevice {
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
     VFIORegion dma_fault_region;
+    uint32_t fault_tail_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 35551bfd1d..4e3495bb60 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2891,10 +2891,60 @@ static PCIPASIDOps vfio_pci_pasid_ops = {
 static void vfio_dma_fault_notifier_handler(void *opaque)
 {
     VFIOPCIExtIRQ *ext_irq = opaque;
+    VFIOPCIDevice *vdev = ext_irq->vdev;
+    PCIDevice *pdev = &vdev->pdev;
+    AddressSpace *as = pci_device_iommu_address_space(pdev);
+    IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    struct vfio_region_dma_fault header;
+    struct iommu_fault *queue;
+    char *queue_buffer = NULL;
+    ssize_t bytes;
 
     if (!event_notifier_test_and_clear(&ext_irq->notifier)) {
         return;
     }
+
+    bytes = pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->dma_fault_region.fd_offset);
+    if (bytes != sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)",
+                     __func__, bytes);
+        return;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue = (struct iommu_fault *)vdev->dma_fault_region.mmaps[0].mmap;
+    if (!queue) {
+        size_t queue_size = header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling",
+                     vdev->vbasedev.name);
+
+        queue_buffer = g_malloc(queue_size);
+        bytes =  pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                       vdev->dma_fault_region.fd_offset + header.offset);
+        if (bytes != queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return;
+        }
+
+        queue = (struct iommu_fault *)queue_buffer;
+    }
+
+    while (vdev->fault_tail_index != header.head) {
+        memory_region_inject_faults(iommu_mr, 1,
+                                    &queue[vdev->fault_tail_index]);
+        vdev->fault_tail_index =
+            (vdev->fault_tail_index + 1) % header.nb_entries;
+    }
+    bytes = pwrite(vdev->vbasedev.fd, &vdev->fault_tail_index, 4,
+                   vdev->dma_fault_region.fd_offset);
+    if (bytes != 4) {
+        error_report("%s unable to write the fault region tail index (0x%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
 }
 
 static int vfio_register_ext_irq_handler(VFIOPCIDevice *vdev,
-- 
2.21.3

