Received: by 10.223.172.38 with SMTP id v35csp4650217wrc;
        Tue, 19 Sep 2017 01:00:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAviG01+Q6wo3YohR92RZIbCQgPaZtl3qhyGsouLI29ltPAme3Ks8VOZvywrFfCxGsykwpn
X-Received: by 10.55.159.80 with SMTP id i77mr765196qke.76.1505808050481;
        Tue, 19 Sep 2017 01:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505808050; cv=none;
        d=google.com; s=arc-20160816;
        b=KXb6b35TcqKHF6KwF8lA2636gh2dGmNAttDTI7R2hxfF0f+zVOCe+yXkxMIsOd3rOE
         kC6fmqmy+8txktGYgn+JktF8cmcaH1NSwQe+aBuHFjT/GX5K6nqvOewfYQ0++mG5xvCh
         nlaXrEE93hQ5GywySvgm0mc9jc324379sYg14JABZuMz5ox21eNoggU6IyLJqdQHjnpG
         LVopn0oiTiI80xWY/0aylYr5j7YnhRHqCL6kd+xOdfMJK4LzymKFS7YvPaZ7VV+TC8v/
         3nZQoc8ZlZXTa46VL8Gyb7L+tCEyUoK+ZVzbSlEoNdEmSYG5na/ZjWh0DLqNrIqrYFXT
         El4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=JJ5+KMPLkof8snatfIefMcttPn0IghP1YpS0tplFJcs=;
        b=zh3JaoHHzYJi1aFNcBI/vy8JCWyrN2ZcgzujrbDCFRMrS49Y00EuSisi1nsqyH/7a7
         jqFygOJ/ncLXD3ZjtnNVxdFvbxRB/3DNYkLfkamyIuVH3T3zzAx8EiEH7FgkR114L9Y8
         FDiQqmpBJBfG+EbhdahPQSaDhKky8dor5gNGTyzTd8XpIg5EbtIONjaKbjsq1rRO0RAf
         cZ0YN+LYgO10mxuR1JNCUeYvTfNXy8h6BOLsdGabxE0XilfthNy45YIHrU7yjedUZR6I
         Xl64TWRxswgMCG5Ch05oYHiR8XVOLtZI2MWPDfR9j4+JDiWIS9fbGE3O7MEelbSdVh8M
         fjhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s7si8782071qki.511.2017.09.19.01.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 01:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDSa-0001og-5w
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 04:00:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIX-0001kP-Pt
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIU-0001wm-Cj
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:50:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDIU-0001vz-4a; Tue, 19 Sep 2017 03:50:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D17D85550;
	Tue, 19 Sep 2017 07:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0D17D85550
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81D1F60466;
	Tue, 19 Sep 2017 07:50:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:47 +0200
Message-Id: <1505807208-9063-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 19 Sep 2017 07:50:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 15/16] virtio-iommu: Implement set_page_size_mask
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sZY9MGVLIgGj

We implement the set_page_size_mask callback to allow the
virtio-iommu to be aware of any restrictions on the page size
mask due to an underlying HW IOMMU.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 9ccfad1..2793604 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -48,3 +48,4 @@ virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRI
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
+virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page_size_mask=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 281b0f8..1873b9a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -714,6 +714,21 @@ unlock:
     return entry;
 }
 
+static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
+                                            uint64_t page_size_mask)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+
+    s->config.page_size_mask &= page_size_mask;
+    if (!s->config.page_size_mask) {
+        error_setg(&error_fatal,
+                   "No compatible page size between guest and host iommus");
+    }
+
+    trace_virtio_iommu_set_page_size_mask(mr->parent_obj.name, page_size_mask);
+}
+
 static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
 {
     VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
@@ -881,6 +896,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.5.5

