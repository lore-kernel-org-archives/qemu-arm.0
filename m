Received: by 10.28.71.27 with SMTP id u27csp851217wma;
        Fri, 19 Jan 2018 07:10:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBov6tMZKFwrV5t/67Kh+rjF25VGGb70u5pc4jK1Kj1q9EgvCAxOkgvFrPHMhBGy33ackb5js
X-Received: by 10.37.53.213 with SMTP id c204mr26271183yba.70.1516374616074;
        Fri, 19 Jan 2018 07:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374616; cv=none;
        d=google.com; s=arc-20160816;
        b=txZ15+Y51QYZzz589HlUVguRs5cGHxCrKmmGL1t6RsGr+ofWvbLAszPrGrvWHMZj1s
         y8GguMrk5DpOuHRpMH5EF2/I7LlHP7IxdSFELHSFHeJZbSsZ8R6aqVja8wfgc5rEDzPL
         Ss0hrnPZn4H/47V7l8AJrISWinzQY6ZI67BkikADz4QVWp5+oL2cZJxELnrXHUaOI9ex
         EJXC8UnrI4L1vBIBpRYptvVJhIITD0WzbeJ3/FfwByjJyhYVJ47BXN8IDPQQtQbtwtgI
         XsVeOXXV8OueXqdB+2bdBzPeEfaIKS7CuV7blSchWcyGcEI1h1I4d7mehrl4fkE51cWi
         lCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hoD1srCwlsTsGn+LtHigI4jn2mel6UcIZAT8gyV9axI=;
        b=KYZR9so+wgvuC71NbpRrWg6bBFalhli88ZNZo1xC+mhTg3yX0RbnIUg1Y7num5YMbP
         M/c5Yc57srNZoO1IGEVwejEHgg4vI7Be78mnIHcWr2A4CdbbEhBH6ySwdCgdizkadBz1
         MP7u+bl4dsZETI1vDGqcJ+ul9dU7F9ymCUulxdoUT+YnsrRiEVA1jKtBNjTGrkQUDAfN
         cWMSBtMB6m2lGTPe/rCfPPYZOveYc0Y0A/V6tsmmXACaEXB35e7zuVFkFwmtKlDpN5GV
         nAHo456wQgbCo8xCPUxhKeJHU+BPDzC6jp6vs4YQbSyWx+86uY2XPz74f95iD85xH5jl
         Fakw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i185si2278328ywg.162.2018.01.19.07.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYJ5-0004ez-Fv
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:10:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYEf-0000h2-PQ
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:05:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYEc-0001R3-HQ
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:05:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYEc-0001QI-B3; Fri, 19 Jan 2018 10:05:38 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DB352D59F5;
	Fri, 19 Jan 2018 15:05:37 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2C35C1B7;
	Fri, 19 Jan 2018 15:05:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:09 +0000
Message-Id: <1516373355-305-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 19 Jan 2018 15:05:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 16/22] virtio_iommu: Handle reserved regions in
 translation process
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
X-TUID: GkwiSQrL/rLk

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ec5cfce..9996ab8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -748,6 +748,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     viommu_mapping *mapping;
     viommu_interval interval;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -773,6 +774,22 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto unlock;
     }
 
+    reg = g_tree_lookup(ep->reserved_regions, (gpointer)(&interval));
+    if (reg) {
+        switch (reg->subtype) {
+        case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+            entry.perm = flag;
+            break;
+        case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+        default:
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                      0, sid, addr);
+            entry.perm = IOMMU_NONE;
+            break;
+        }
+        goto unlock;
+    }
+
     if (!ep->domain) {
         error_report("%s %02x:%02x.%01x not attached to any domain", __func__,
                      PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
-- 
1.9.1

