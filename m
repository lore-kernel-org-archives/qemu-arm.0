Received: by 10.28.71.27 with SMTP id u27csp221491wma;
        Mon, 12 Feb 2018 11:17:07 -0800 (PST)
X-Google-Smtp-Source: AH8x225lvhqAP97ey/a3DRSQH3knmAKJsh6qDT5WLuxdqVOCjJda2AiLSNmZZwR68gtrEUYBogOd
X-Received: by 10.129.200.7 with SMTP id n7mr8466937ywi.316.1518463026928;
        Mon, 12 Feb 2018 11:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518463026; cv=none;
        d=google.com; s=arc-20160816;
        b=YPkEtYfYXxYBjwtobyDE0cj4LEl+YPBTvuqFRDytiaI236curE/MycacD8UhLewQH3
         kHJtGOx7Wfu77MndxZTtPupdFjJtfVyt6A8T5jTxcp0lRcI+RQF8krR95bYQYJDMKOqo
         VGCuFBknADW83zfs7KttkK+KiSRnuzF8J0Wi9qMT26Vi+3rYMO9wxwS2t9qUMvtigX1Z
         pHstgo9OHBq1DQ7DWzIQluXmVAiXATqAY1Lf4r0AD5ZgBjXYxDt8KTTuKl7JfT7SFbja
         GT4qcdsScIJmDdVGSodwloysTK2usi1AIXYeQwkLz2+l6ZvS9Q0Z6DJTezf2wY2LxKtr
         TSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=K20raM31P1vHOywMPXebnUomeKK5/S2+7tzuuZ8Cdjo=;
        b=0c6Do4t46lzV0xD8IUZnGbs2AXPhE4D0X9agV+SmzrjMl19VHI9k2DvCl7YMUUr0EC
         +dLIs8G1IvslTmEveTAcv4sPi1Xoym8OE4nP8k+Du6OZAex2s+/nMkeafjl6qSnQvf6O
         VDxVF2z7FOBjjXGQS/NDhgfQmqCz3Rt+PM+CHFcpsfSehn5iQKzrn2T/kgKeMt09Suq9
         NK8tCHgJ1H0C0RKu+aOPXA7Fjz5owftKwki7v0lEUFsKHe1ffZiVAVYKPobOOE45XQUe
         IDVM6lChS+t2hCithPR0kHZGYDqW9AkgsoThTGMHOixzZ83ejq3MUPhMgdR3ko624wQN
         vBjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z84si1577305ywa.283.2018.02.12.11.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJb8-0006V4-Bq
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:17:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLa-0001vS-Hm
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 14:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLV-0006Go-W1
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 14:01:02 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56028 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJLQ-00069C-KM; Mon, 12 Feb 2018 14:00:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D04040FB633;
	Mon, 12 Feb 2018 19:00:52 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01F491006ED7;
	Mon, 12 Feb 2018 19:00:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:22 +0000
Message-Id: <1518461904-5305-21-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:00:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:00:52 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v6 20/22] hw/vfio/common: Set the
 IOMMUMemoryRegion supported page sizes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4/AbkzS87H9

We store the page_size_mask in the container and on
vfio_listener_region_add(), the information is conveyed
to the IOMMUMemoryRegion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 5 +++++
 include/hw/vfio/vfio-common.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f895e3c..8f3fa0c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -506,6 +506,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
+        IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
 
         trace_vfio_listener_region_add_iommu(iova, end);
         /*
@@ -526,6 +527,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             IOMMU_NOTIFIER_ALL,
                             section->offset_within_region,
                             int128_get64(llend));
+        if (imrc->set_page_size_mask) {
+            imrc->set_page_size_mask(iommu_mr, container->page_size_mask);
+        }
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
 
         memory_region_register_iommu_notifier(section->mr, &giommu->n);
@@ -1053,6 +1057,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             /* Assume 4k IOVA page size */
             info.iova_pgsizes = 4096;
         }
+        container->page_size_mask = info.iova_pgsizes;
         vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
     } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
                ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f3a2ac9..221cc30 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -79,6 +79,7 @@ typedef struct VFIOContainer {
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
     MemoryListener listener;
     MemoryListener prereg_listener;
+    uint64_t page_size_mask; /* page sizes supported for this container */
     unsigned iommu_type;
     int error;
     bool initialized;
-- 
1.9.1

