Received: by 10.28.71.27 with SMTP id u27csp850977wma;
        Fri, 19 Jan 2018 07:10:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBouMfk84DroY9Krf3Cizzui1MIOPaVKC7whEkqT3XRE+jGjxYk+8y+vs51LPO6VFfNMOCegm
X-Received: by 10.13.209.5 with SMTP id t5mr8301521ywd.277.1516374605939;
        Fri, 19 Jan 2018 07:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374605; cv=none;
        d=google.com; s=arc-20160816;
        b=wzeiN4sustN9ZmQ9IoLJwmgk5teebNDuFegNIKka+SkZO8bKb9QUoJ+xuRNTI+5DRP
         UDii1pakCCPHVwI+6Ja0v5JPuNbVbWAhGWaR8tBht0/A4Ccwd2QWlaT0jvyRqaj+Yl9o
         VBACdnt/QPIta6XOvuATjgejBp8PVD9mlWFCj4A5QNLaICEhXOj+hOYoS1WK4lCJbVXE
         OagAt3RR3qN9ZsYQjs1CGfyBAZZ9CisIpBB+Cg+q1KLv0FQcTTKPnLdoqWG/mxroAhbC
         FEWgwKfCAWITz7YWSIwglrTZgZDAoopk7hNil3uhozHwKWemFA5lVv/AkqLv1K4VDfz3
         WmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/w5lAXqw6rC07p+oTaXEjyHu8lH5+uIZnmxYVwStmes=;
        b=zKzTyk6ObrRe7BhQiV7tQBAT87J0KxZQfJtB6z3Z9KnN2iDnkT4waSf38rNcND/QPT
         EREHnWmv332Ie9Y85cOLJjTY80AmsykB1Ij/2mVtTLxRtIDnVIgBrSI1eBjllKVV1yKo
         xPgqg29ciM7F3YIeZaYqwSPAlgSgd+8yo6MdTLv8oQbErlRx4XJ5f1gTC4702GkiBskg
         5GpbKioWHwvG97MLB58GRQLwIprQ8GCDROvS+RgKR4cqkEYnc2d6gt0zK5aZaHjVxmcl
         KeuYw2EwvXoU+QxPTbacXxnWaoJRDW02H//SLGSXj3LP4nEzZNwE7cMdnfxzJCegN/Kz
         B3Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si647855ybj.525.2018.01.19.07.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYIv-0004X1-Ca
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:10:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGg-0002Zk-50
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGc-0005YY-RD
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYGc-0005Y0-MH; Fri, 19 Jan 2018 10:07:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5FAD62E8D;
	Fri, 19 Jan 2018 15:07:41 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBC875C1B7;
	Fri, 19 Jan 2018 15:07:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:14 +0000
Message-Id: <1516373355-305-22-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 19 Jan 2018 15:07:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 21/22] virtio-iommu: Implement set_page_size_mask
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
X-TUID: 5F19z6VxJnWG

We implement the set_page_size_mask callback to allow the
virtio-iommu to be aware of any restrictions on the page size
mask due to an underlying HW IOMMU.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index b6f1812..e514f86 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -49,3 +49,4 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page_size_mask=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 9996ab8..f262f3f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -831,6 +831,21 @@ unlock:
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
@@ -1021,6 +1036,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
1.9.1

