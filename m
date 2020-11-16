Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3936754lfb;
        Mon, 16 Nov 2020 10:25:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyza+yjEs48N1t+DDaSD90OMWcRu7lzJe+jf4eub/CZQH1FvpKsn7z9e8q++xvhiiE1VYWI
X-Received: by 2002:a5b:f02:: with SMTP id x2mr16507518ybr.424.1605551153428;
        Mon, 16 Nov 2020 10:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605551153; cv=none;
        d=google.com; s=arc-20160816;
        b=uopPZ3E0SUvC91r/tx028InKIYg79M+54rxh59p7w7q1pisQc3nxIp4PD6p25Utljh
         eAcIGcMk18xqy17vcp7ZrEj/QNxDZrdFZxGb4/Eo/A95kvxu0dLlQKeIkrVUkk39odSO
         nnzUd2gljoUIb3UtoabDVUWPdSEu9UeJjDzgW9xu4URwGxvLV6pa+IJ4zF/EeVPRo5ll
         mAxaNe/yDLG22gTixS8psUTgWbmer/4SgzODg7rjj3v1Dt6oXswJgIuTiboL/6lvKhre
         WUMzLpOyLTqmRtLLyu4K/JgH+tA2OkyfI6kydxuIMcDcrXwmx1W08nQcjxPilOOaEgjl
         GwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hGqCfPzDuTwwMxd84IS+Ll2EfpifczWVyWDPmEuST2I=;
        b=vGgjhkmoBpRvkxUZAg7dWCe5l8j2hjXWU8lC7TWdJLaSejGWg5LC2IsXCGD9VDNjIC
         MJaVkkXLXsQmi4abO07NfgNAsWlZKq5fMFwJPY88NydJPPlN8SUulH3d5X6jVPPiKNPi
         7cOTkygyGFUEsTOz1Et/wvajLODsAuawvxWCDqpivomELWZHEhjpD5AskozzCc8gWTtY
         op/HVMbM/mjz4inf6akir4Ex8cgwpZQWegnYbCs9EvXThZhunDvyEj4MkdX6eN9S0gA0
         E9ZD2GDVdOR6bV9ukBq7cvjIPDjtatt5bEgMilrLGw+jGVfQ+BOaSibuXt6sEbTNVnsi
         BLvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EdphUyCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d185si18239435ybh.22.2020.11.16.10.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EdphUyCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejCK-00057H-OJ
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3Z-0001dq-Pf
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3V-0001UK-RY
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGqCfPzDuTwwMxd84IS+Ll2EfpifczWVyWDPmEuST2I=;
 b=EdphUyCM/ZDOplL2dWDtherUsyem8GQ+PgOHmlQF+EvBonM0X1ydI9X5zCRfX7JAPoQTN0
 aNx0rwmkOB57CRnbKIL6zmhPvfrkVqXrBfkmPicVHNtDtP0PLOAMY2bxxlXyiUr4UkC0Wm
 qcdrHzSDlKgT+/54HNQ2U76sKznN6Nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-JP2_66uWNwyNXWCFefhPBQ-1; Mon, 16 Nov 2020 13:16:39 -0500
X-MC-Unique: JP2_66uWNwyNXWCFefhPBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7296D241;
 Mon, 16 Nov 2020 18:16:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 026EA5C1CF;
 Mon, 16 Nov 2020 18:16:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 14/26] vfio: Helper to get IRQ info including capabilities
Date: Mon, 16 Nov 2020 19:13:37 +0100
Message-Id: <20201116181349.11908-15-eric.auger@redhat.com>
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
X-TUID: a5F5oxs94IQI

As done for vfio regions, add helpers to retrieve irq info
including their optional capabilities.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/vfio/vfio-common.h |  7 +++
 hw/vfio/common.c              | 97 +++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 3 files changed, 105 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c61720ccf9..8153cbae92 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -227,6 +227,13 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
                              unsigned int *avail);
 struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
+int vfio_get_irq_info(VFIODevice *vbasedev, int index,
+                      struct vfio_irq_info **info);
+int vfio_get_dev_irq_info(VFIODevice *vbasedev, uint32_t type,
+                          uint32_t subtype, struct vfio_irq_info **info);
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int irq, uint16_t cap_type);
+struct vfio_info_cap_header *
+vfio_get_irq_info_cap(struct vfio_irq_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ab7dd36ead..8700d2b9d6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1379,6 +1379,25 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
     return true;
 }
 
+struct vfio_info_cap_header *
+vfio_get_irq_info_cap(struct vfio_irq_info *info, uint16_t id)
+{
+    struct vfio_info_cap_header *hdr;
+    void *ptr = info;
+
+    if (!(info->flags & VFIO_IRQ_INFO_FLAG_CAPS)) {
+        return NULL;
+    }
+
+    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
+        if (hdr->id == id) {
+            return hdr;
+        }
+    }
+
+    return NULL;
+}
+
 static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
                                           struct vfio_region_info *info)
 {
@@ -2311,6 +2330,33 @@ retry:
     return 0;
 }
 
+int vfio_get_irq_info(VFIODevice *vbasedev, int index,
+                      struct vfio_irq_info **info)
+{
+    size_t argsz = sizeof(struct vfio_irq_info);
+
+    *info = g_malloc0(argsz);
+
+    (*info)->index = index;
+retry:
+    (*info)->argsz = argsz;
+
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, *info)) {
+        g_free(*info);
+        *info = NULL;
+        return -errno;
+    }
+
+    if ((*info)->argsz > argsz) {
+        argsz = (*info)->argsz;
+        *info = g_realloc(*info, argsz);
+
+        goto retry;
+    }
+
+    return 0;
+}
+
 int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
                              uint32_t subtype, struct vfio_region_info **info)
 {
@@ -2346,6 +2392,42 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
     return -ENODEV;
 }
 
+int vfio_get_dev_irq_info(VFIODevice *vbasedev, uint32_t type,
+                          uint32_t subtype, struct vfio_irq_info **info)
+{
+    int i;
+
+    for (i = 0; i < vbasedev->num_irqs; i++) {
+        struct vfio_info_cap_header *hdr;
+        struct vfio_irq_info_cap_type *cap_type;
+
+        if (vfio_get_irq_info(vbasedev, i, info)) {
+            continue;
+        }
+
+        hdr = vfio_get_irq_info_cap(*info, VFIO_IRQ_INFO_CAP_TYPE);
+        if (!hdr) {
+            g_free(*info);
+            continue;
+        }
+
+        cap_type = container_of(hdr, struct vfio_irq_info_cap_type, header);
+
+        trace_vfio_get_dev_irq(vbasedev->name, i,
+                               cap_type->type, cap_type->subtype);
+
+        if (cap_type->type == type && cap_type->subtype == subtype) {
+            return 0;
+        }
+
+        g_free(*info);
+    }
+
+    *info = NULL;
+    return -ENODEV;
+}
+
+
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
 {
     struct vfio_region_info *info = NULL;
@@ -2361,6 +2443,21 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
     return ret;
 }
 
+bool vfio_has_irq_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
+{
+    struct vfio_region_info *info = NULL;
+    bool ret = false;
+
+    if (!vfio_get_region_info(vbasedev, region, &info)) {
+        if (vfio_get_region_info_cap(info, cap_type)) {
+            ret = true;
+        }
+        g_free(info);
+    }
+
+    return ret;
+}
+
 /*
  * Interfaces for IBM EEH (Enhanced Error Handling)
  */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 63c3e08725..447b7ed9f5 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -117,6 +117,7 @@ vfio_region_unmap(const char *name, unsigned long offset, unsigned long end) "Re
 vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Device %s region %d: %d sparse mmap entries"
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
+vfio_get_dev_irq(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
 vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64_t nb_granules, bool leaf) "nested IOTLB invalidate asid=%d, addr=0x%"PRIx64" granule_size=0x%"PRIx64" nb_granules=0x%"PRIx64" leaf=%d"
 vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=%d"
-- 
2.21.3

