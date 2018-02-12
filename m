Received: by 10.28.71.27 with SMTP id u27csp230758wma;
        Mon, 12 Feb 2018 11:28:08 -0800 (PST)
X-Google-Smtp-Source: AH8x224DyhqH82IwkjimE9UgiKYhA3KOvhu1wFZWsDL88HYhkACRjysK79GywWWcNoo0s1uTEmji
X-Received: by 10.37.36.213 with SMTP id k204mr5813815ybk.296.1518463688776;
        Mon, 12 Feb 2018 11:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518463688; cv=none;
        d=google.com; s=arc-20160816;
        b=traLQX0Sa7ZJcgxCQLIIFECAzsi3pHyd7CzA8oBVgmVIXLfKJcRNZSCFWy7FW180pM
         jDLP40t6vGli8mzuN+WiBLn7/f7bc8CkwnBGHuinbBmlcEaGIC1ebSb+aLSvZKZe5aZw
         3R4vgCHLpi2w3GNC+2zh+BRwKqL/WuFOEjE8Yc2pbDYmYtQB968hu9eN794vf0lPA8k2
         qCHca46UcPf0M1zDiPlfiHpr8O3FZFSEanUgn3eXize/6bEu8jQlM1LKqweBgoX9t2xn
         G5i4GnV42uSksiYQ5w6kLJnEcBrBWwptUFlPIfwiUvjLDtWtJNMMZoAOPbiTtYAV1LhV
         zpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QytgcuWZDCttKMWNtRVgdtDWdd9X2q5hmozHDTebvAU=;
        b=rqiDJ1eURpo8IHQCD/xCcFH4bRnOKDcRXb6uLduVGVJodFK0ZxoP0diVCBlW4N8twi
         WTlet8/0AXoRq5tQdhxspiX5g0j22SJYtUUKYnqu5LSFYjv1irBuVKm1FYbwwto5T2DO
         PSHKxpqwECO9dbzg7zZSOOBUIBp/1WCG7M8gpfIUgppy8sZ7SLI+7f+x2HBsqnr0sbKn
         v9BteEojHwKW8+7P54ELSj4Lldu0K7U7fc6tGHQ5sZNBm0YFX0dwld3g1QAvtrFaK69P
         l+f7USOJU5yPi3bbvK9R3nOWYuxDljc0C/MFvCa1hW5QF0xWmjt1bcW+UPc9OdZEisVj
         K4fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15si348329ybj.430.2018.02.12.11.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:28:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJlo-0000bk-7v
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:28:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLa-0001vN-HG
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLX-0006Jt-NG
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:01:02 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56046 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJLX-0006JC-II; Mon, 12 Feb 2018 14:00:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAFAE40FB633;
	Mon, 12 Feb 2018 19:00:58 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52DA9100858F;
	Mon, 12 Feb 2018 19:00:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:23 +0000
Message-Id: <1518461904-5305-22-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:00:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:00:59 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 21/22] virtio-iommu: Implement set_page_size_mask
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
X-TUID: BgYrEMh6rnPT

We implement the set_page_size_mask callback to allow the
virtio-iommu to be aware of any restrictions on the page size
mask due to an underlying HW IOMMU.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index ce718e8..1145995 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -55,3 +55,4 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page_size_mask=0x%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index a8fabef..1a15ccc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -837,6 +837,21 @@ unlock:
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
@@ -1027,6 +1042,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
1.9.1

