Received: by 10.28.71.27 with SMTP id u27csp853757wma;
        Fri, 19 Jan 2018 07:12:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBouTTTfBRcpL8vBzkxXbDGvIfBODyPBVztLqkCd1522TBK7l/s1tH4y8VF9dBuch5tweMW1U
X-Received: by 10.37.216.85 with SMTP id p82mr19362307ybg.173.1516374746519;
        Fri, 19 Jan 2018 07:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374746; cv=none;
        d=google.com; s=arc-20160816;
        b=oCgqT9kBUXd+RXakKNkj0KqFTUZ6X4A1674SX9sW95XNRSZLvlbxXz2TH1FtQ97hPK
         SHL7/+kNnyO6yYd66pkDDbjR//xebiGerjMDBRs/QlsK/Jf0HgU6yg+2c1h+x88jgn4u
         quQrLyLlaQSjIIL4Fj41/WJ5tdtkgkYrK5WHhRXrotlbgyMs4VVikInEPU2m5zE9GmQI
         rKvRCiwqzJXp5SEI8WhtokJT8ERmKBz8KVhbxkx1IizmOwiFTDloC13KMLLW5WgPSHj6
         8K98A4qwlpHaCHPyUATkKZ+fXsc6q8PdSiZu0D+NxRNahsBeviWEFsT+/q5cs/VuMErt
         DkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lbmLapopR3rBryzyBwybP7vlHh1/OTlkrPZGFwYJHak=;
        b=sMqDeNnKQu2qCTK04zwRmdVTSPYISmruIDt/ptanHcewXTkksLoS52PTOKTHxYF8ZH
         mASR6ZynLv+4xWfPGG+MzSWdMWkENDgK3YDuwqTS7QAU9VvrWrz782Nd2dzTM1JKzDt3
         3ZoUWXO1cffCrxdX6yGlQNNnTs83zKhUn7KZd0xnFVWhbKvSzCn4rdpwXzTNUwmrTU1q
         WxNq9NNI9LBXyRXFH1xh0sa0zlhw4XNH7KTwtGRKQLLm1qmYWxEvEG0mh7UXyNp/XCDF
         4D9XXoKMSCzMoHjqJ1zaHlZhDqrwImhrsWgp+8DPxIbyUxNcyJz1r8bz90BZkW39tUB3
         MO6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si2182830ywq.674.2018.01.19.07.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYLB-0006yS-ST
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:12:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGK-0002Fi-Mw
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGH-0005Hb-DX
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYGH-0005Gj-7m; Fri, 19 Jan 2018 10:07:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 644922FA0;
	Fri, 19 Jan 2018 15:07:20 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 461805C1B7;
	Fri, 19 Jan 2018 15:06:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:13 +0000
Message-Id: <1516373355-305-21-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 19 Jan 2018 15:07:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 20/22] hw/vfio/common: Set the IOMMUMemoryRegion
 supported page sizes
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
X-TUID: Vab7JprNIs04

We store the page_size_mask in the container and on
vfio_listener_region_add(), the information is conveyed
to the IOMMUMemoryRegion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 5 +++++
 include/hw/vfio/vfio-common.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b77be3a..35b83fe 100644
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
@@ -1027,6 +1031,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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

