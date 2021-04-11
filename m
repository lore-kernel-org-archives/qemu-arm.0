Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3062692lfr;
        Sun, 11 Apr 2021 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPcph3k933CZGnlwPIAwrC0dhRMWpzIImXbsKACDOEOYgjnsAoNWFN8+e/qkj/aZreZs4
X-Received: by 2002:a02:ccda:: with SMTP id k26mr24106711jaq.136.1618144096169;
        Sun, 11 Apr 2021 05:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144096; cv=none;
        d=google.com; s=arc-20160816;
        b=xQivZcDgOxJ2ZATz5OQ753Hom3s6bt6W9l26bUxP3uFn3+BbsNnxQR3N2HSlH0T53W
         1iAz7ZB3Osx/6JuTRlX3bMKVAyXgfSSuGwjK4Jwp0y0GAL4fjf/6UVIJ0cLXsJ6wpyGR
         rgF/48g5U/lXY28pDEJlHG9SeHegd0u8kU/F4vhjgYgql7WnKLRfvqjH5bSubNJh1uTS
         iABDHZUUNuyYG+i1HlBKvFbQmvW5hxUbxdkPweq8uc6I0EsdQXpo1+8Kv8dOs588Jzg9
         Y8KNaLJU2yNCaNyN4flSKoiwRszJ9Bq/3mBtZwlDpoL/ABJX4kAuecZuHJn5Bcd5Fdpd
         76oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tYY2lwJzMVP3dsI9agRJshSGuhbviCWjgh9orvz3pHI=;
        b=fpMiV/re4YkvsyyR/md6ldk5xojxDN4qGwa6gQO8bUsaB7l8o1Qk8B3hCXZpgLf75/
         hZUeNwUqA3eZQxfTvAYeZY4dnc/7qmojcFPOFEHXIX3dm+ziHIpCKASDPGRgCr6vKn6K
         NvhyfdH3rEmUdrEcugGCptmtKVklQ1dL/yhI/Yvysat4fCMkuO4+neQloXfPGJ3x4WT9
         xPkWhiGNLn8sgUNqfjT8xNxdfDMONXMLviQ8VJ/QR/pNYflNIc2rR6F/6EZyJMcOO0ic
         T0kWRZ0TJ9irqFawa3cum/+YzYTUJseSt4kDcwHMCELuW0QjmBs20vtzj56YzZ4keCih
         YV5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CFa00GEB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si10254272ilv.101.2021.04.11.05.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CFa00GEB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZCJ-0005tD-Gu
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYy1-0002XU-VY
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxu-0003lM-EL
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYY2lwJzMVP3dsI9agRJshSGuhbviCWjgh9orvz3pHI=;
 b=CFa00GEBWuC3nYGAaXTg+S8vGA3bbnlU/dyrAKcE4lNJLkd6UBoR72DEyZzwF923kULykn
 q4gYfY/tQb3hoqai4xrovqzeg06d53hbAxbkySVqFOwzlZ0xGei5mNTnNFAISPy+Qscp3i
 ReI2119S0uUJAuso7rP343vQ1CdtGlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-771NO4dHNoe_KqC9uOZ2jA-1; Sun, 11 Apr 2021 08:13:19 -0400
X-MC-Unique: 771NO4dHNoe_KqC9uOZ2jA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D574781746A;
 Sun, 11 Apr 2021 12:13:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB3D10023B2;
 Sun, 11 Apr 2021 12:13:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 20/29] vfio/pci: Implement the DMA fault handler
Date: Sun, 11 Apr 2021 14:09:03 +0200
Message-Id: <20210411120912.15770-21-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WdpnvJ5aD1PY

Whenever the eventfd is triggered, we retrieve the DMA fault(s)
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.h |  1 +
 hw/vfio/pci.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index eef91065f1..03ac8919ef 100644
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
index 9d4e020b97..d7e563859f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2929,10 +2929,60 @@ static PCIPASIDOps vfio_pci_pasid_ops = {
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
2.26.3

