Received: by 10.223.172.38 with SMTP id v35csp4648905wrc;
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBMYjOx+b0N/ZlJxabM9WLOzOEQn+RmY132Zg0qtE/CeTCtbTjfDohBN0pcoltC7zDgdgPv
X-Received: by 10.55.104.131 with SMTP id d125mr666817qkc.37.1505807960249;
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807960; cv=none;
        d=google.com; s=arc-20160816;
        b=J6o+rpTkM/hqZVa35C8HjbHdPp7crjqVaq4BPZg0sBgV/Gx+dGqgCgLm0tJ6g06gpW
         3Rt5Q3DCCvE52hX7uAGU2G8oSbzMXy9x9hoOANP8eBa6F8FFVexx6LUQxznMbaZkYs7U
         tFKsTcESrWPsIxx6Q+64H5VyH6+kCCr2k2FG3T5e9rwIQ/uu4QzIaGAAJMl6ItR7c7yF
         FTS09NiW8zUJV2y7zmsdmnnO1iX7af2K6F7LIz3EE2T1l+ESta+Qozjuba+SyV380BYK
         3KBtj6Vbh9JpGZwtgKihw+7J84a0KdzWjr7wgbrIAYz4PXigphWEye3dohnDVShuD1fD
         VRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=H8elKKCAUt3e+EbEVLGioGhYqXD9VzdfCWpMKexAegY=;
        b=iJnSbOi1F9T+tlfYxHI07riBftINZzXhSpT9Z2N5bEX1YY0OEKOeBLWO8RN2NBZbJW
         Y/bhm+TjfZ1+wyqkOEQQ8QAClpcBzKiYzHVsU+kIzCLyA07ubjmlebiQtsvtKdcXYDqe
         V3KOB+cpPfP6WFKD4ow2OovyVWzfCpT/YFANtOw+Yl3zxsPUMfXc7HiYFS2OISNntD9q
         xTp8UYmZv9LRuB0bcZehzQSrbZc8UPR8Tgo761S7FZgwMahAz8bH2wtzhsRNp7+qZgnq
         yUbeZDBrOW+89/1N3NEfI3M8k6xDiJ7LM2a86RpyX7MtmS8jI9j3iFb32sHIzMVJ12z2
         h/5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q46si9157402qtq.235.2017.09.19.00.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDR8-0000Bi-0V
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIZ-0001lv-69
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIY-0001yc-0y
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDIM-0001qs-6r; Tue, 19 Sep 2017 03:50:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A53F356F6;
	Tue, 19 Sep 2017 07:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2A53F356F6
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6E9261342;
	Tue, 19 Sep 2017 07:49:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:46 +0200
Message-Id: <1505807208-9063-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 19 Sep 2017 07:50:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 14/16] hw/vfio/common: Set the
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
X-TUID: RO5fHrVhgTb3

We store the page_size_mask in the container and on
vfio_listener_region_add(), the information is conveyed
to the IOMMUMemoryRegion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 5 +++++
 include/hw/vfio/vfio-common.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7b2924c..468a259 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -480,6 +480,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
+        IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
 
         trace_vfio_listener_region_add_iommu(iova, end);
         /*
@@ -500,6 +501,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             IOMMU_NOTIFIER_ALL,
                             section->offset_within_region,
                             int128_get64(llend));
+        if (imrc->set_page_size_mask) {
+            imrc->set_page_size_mask(iommu_mr, container->page_size_mask);
+        }
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
 
         memory_region_register_iommu_notifier(section->mr, &giommu->n);
@@ -1024,6 +1028,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
2.5.5

