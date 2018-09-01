Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp619824wrd;
        Sat, 1 Sep 2018 07:26:08 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdam3qhxQu3XCITUAfcgpj3WCEFRk59X5Mu7gC6rLKWXh0nI5Rhnt58q2h+B39/SqFNoS6X2
X-Received: by 2002:a37:4dc8:: with SMTP id a191-v6mr18615314qkb.181.1535811968866;
        Sat, 01 Sep 2018 07:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535811968; cv=none;
        d=google.com; s=arc-20160816;
        b=LarCp9S+KOmh5udfms/g5bVBWGUnqXr9dZTilDV8XPZT4gmifLrOyso9ZM7iMJ6F+o
         NoiyxPTAna/gcKDP5I3P4zQEFqPi1ipT/ATSF7k9KssOnM6OutJs0XBzSr56x63DSR/3
         bOPVUQ8TaG/U4Vxnwxk80VoiPQKH63ODXg34N0NKtTKEQ/DodH7/42+wQeYhL6O3UVme
         H4T54uSvLKdpx9mgHZrLws8nwZCJViUdjQdiBA9uhFto7Hamx4baspqiZ3PWGJbp6Sjy
         c3vNsfvilefqpFNx6uHdan4W7/O6UDFXl2e1uI25dgjdEVgWfHX+EwaLCRzA4sB7qdbL
         uYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7SrOtJEOi2uFh0qpc0lOCMomY3I7HAW7qNgSNtrNWjY=;
        b=0aAqCyPjrhkOVhiqMwtzpPhQ11/XXOVHfWFpexWELEmFbvP4HG37VxhqRvcNLUJhI+
         MfNtsHQ2KKv7Znyl4SET++IktnjZgQiFpsQTFCqWjGpzlni/KxqsTDCxlSAiC1663Hz9
         F8vgVfm5fGROEdxtNzHxZnM5DNVyHwC/JBGNCVJBIYprebeVAa0oW8p8CUUGBHJa7aCG
         b1cbb01amKesBy5ed1GtlgZbDh4kWIpoET6rc+rJRCbl82BsFxUyOX/Gut1/Wc9EF0cA
         j46Q0nN0ECqc5nyrH+XLvxpYlQZrOEy66ADdvT5bQkB2yZWpZEYYnapHpE5+X4uLHJ9W
         IPhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j49-v6si4678296qtf.239.2018.09.01.07.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:26:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6qm-0006Du-9j
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:26:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6q8-0006BB-90
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6pC-00064Y-DQ
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:24:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57216 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6p6-0005zf-MT; Sat, 01 Sep 2018 10:24:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C97A807689C;
	Sat,  1 Sep 2018 14:24:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 710E22166B41;
	Sat,  1 Sep 2018 14:24:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:09 +0200
Message-Id: <20180901142312.11662-18-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 01 Sep 2018 14:24:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 01 Sep 2018 14:24:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 17/20] hw/vfio/common: Register MAP notifier for
 MSI binding
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KuxCqa481Imd

Register a MAP notifier to propage MSI stage 1 bindings to
the host. When the notifier gets called, we pass the guest
stage 1 MSI binding to the host. The host can then build
a S2 binding whose entry is the guest MSI doorbell GPA.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 49fcbbbc8c..412041593e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -407,6 +407,26 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 }
 
+static void vfio_iommu_msi_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_bind_guest_msi ustruct;
+    int ret;
+
+    ustruct.argsz = sizeof(struct vfio_iommu_type1_bind_guest_msi);
+    ustruct.flags = 0;
+    ustruct.binding.iova = iotlb->iova;
+    ustruct.binding.gpa = iotlb->translated_addr;
+    ustruct.binding.granule = ctz64(~iotlb->addr_mask);
+
+    ret = ioctl(container->fd, VFIO_IOMMU_BIND_MSI , &ustruct);
+    if (ret) {
+        error_report("%s: failed to pass MSI binding (%d)",
+                     __func__, ret);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
@@ -742,6 +762,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
                                       iommu_idx);
             QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
             memory_region_register_iommu_notifier(section->mr, &giommu->n);
+
+            giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+            iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_msi_map_notify,
+                                      IOMMU_NOTIFIER_MAP,
+                                      section->offset_within_region,
+                                      int128_get64(llend),
+                                      iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
+            memory_region_register_iommu_notifier(section->mr, &giommu->n);
         } else {
             /* MAP/UNMAP IOTLB notifier */
             giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
-- 
2.17.1

