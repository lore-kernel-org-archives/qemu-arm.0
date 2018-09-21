Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2866624wrd;
        Fri, 21 Sep 2018 01:36:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62qUYqD/kpCCwr1D+56Gm8ZiOMjB2dE/YnwK9LxCd4ri9o8XV5S77P1NGux2KHQgF2K1ASK
X-Received: by 2002:aed:3e4d:: with SMTP id m13-v6mr541706qtf.99.1537518972465;
        Fri, 21 Sep 2018 01:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518972; cv=none;
        d=google.com; s=arc-20160816;
        b=HhTtwAR53Q0nmR34M0v2NkocjGUGSKr7XEN6VIOGdF0/o02BOIfjnZOSZxvqAaxiFy
         igfmKZJJ0ZfhYRuXtzJTZQFb6IiP1T16jxDPI0yREWc36SEwjurlWgK6h3+Vo4e258Fq
         Q1Ak11KogthdLLS0A1CDDiiEtAShqr9nQncbX1Sojs/8DTqVQaKl98ThYIiUxVwb2Tv7
         e1z6NNGH3mchLvmHXUnn0PZkyq5HOKXRHH+WHpTifgwi7D3aR9lCpBSiIw+dkAC6t9Mi
         EbO6QAGxOnyZbEZ0F1mm30Mx0zNtWG3nxIJ8ZdfjFcnS0ejVz7OcefadMe62mxavJ7r4
         bfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2DFiN3Vvfmxu45A1nfprxy6HgDXtS1oeXdIUrFScx/A=;
        b=tw9KgZDX5c2fHJeC2Nm7GpsJa01OSlkv+TXytFX7gcz5pmYLNUYtGybSiY68Qd7ZL4
         CtmsekigIZ7OyLegWOA23dDtVxcPqpX84bW/2Zr9C1vHcnYqA5ADEoUG2pK+TjhDIKQb
         oObgQ0fY2X17j70jclQutyg18GLjoY5B78a7sd62f0kuJWzG2QV0ZBLgLcl3vOqiyIOm
         /Gbwyk1ecwacXisFx31SK/fuw8TAzUj2GfxRIkzAHB0x9T98XdhOJ4wVsTRpPc2CI7xr
         koSnpP3pTLFxU5WC08xKzf34f3XjEuxfRiesgeFCvEKaOJy1LY0MJZUkjhcD+BioC0y4
         kf+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si10075313qvm.245.2018.09.21.01.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gv6-0003AE-0L
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggk-0005cK-FA
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggi-00072Q-TK
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Ggh-0006qF-2y; Fri, 21 Sep 2018 04:21:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8791E86672;
	Fri, 21 Sep 2018 08:21:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06B287D904;
	Fri, 21 Sep 2018 08:21:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:12 +0200
Message-Id: <20180921081819.9203-22-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 21 Sep 2018 08:21:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 21/28] target/arm/kvm: Notifies IOMMU on MSI
 stage 1 binding
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KZhQovbHP/Ey

When the MSI route is setup, we know the MSI IOVA and
the doorbell GPA . At that point we can communicate this guest
stage 1 binding to the host. Then the host will be able
to construct a stage 2 binding taking as input address the
doorbell GPA.

We also directly use the iommu memory region translate() callback
as the addr_mask is returned in IOTLB entry. address_space_translate
does not return this information.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

TODO: access to as->root field may be cleaned later on
---
 target/arm/kvm.c | 46 ++++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 65f867d569..6f905215b8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -661,41 +661,35 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
     AddressSpace *as = pci_device_iommu_address_space(dev);
-    hwaddr xlat, len, doorbell_gpa;
-    MemoryRegionSection mrs;
-    MemoryRegion *mr;
-    int ret = 1;
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUMemoryRegion *iommu_mr;
+    IOMMUTLBEntry entry;
 
     if (as == &address_space_memory) {
         return 0;
     }
 
+    iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
+
     /* MSI doorbell address is translated by an IOMMU */
 
     rcu_read_lock();
-    mr = address_space_translate(as, address, &xlat, &len, true,
-                                 MEMTXATTRS_UNSPECIFIED);
-    if (!mr) {
-        goto unlock;
-    }
-    mrs = memory_region_find(mr, xlat, 1);
-    if (!mrs.mr) {
-        goto unlock;
-    }
-
-    doorbell_gpa = mrs.offset_within_address_space;
-    memory_region_unref(mrs.mr);
-
-    route->u.msi.address_lo = doorbell_gpa;
-    route->u.msi.address_hi = doorbell_gpa >> 32;
-
-    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
-
-    ret = 0;
-
-unlock:
+    entry = imrc->translate(iommu_mr, address, IOMMU_WO, 0);
     rcu_read_unlock();
-    return ret;
+
+    if (entry.perm == IOMMU_NONE) {
+        return -ENOENT;
+    }
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    memory_region_iotlb_notify_iommu(iommu_mr, 0, entry);
+
+    trace_kvm_arm_fixup_msi_route(address, entry.translated_addr);
+
+    return 0;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
-- 
2.17.1

