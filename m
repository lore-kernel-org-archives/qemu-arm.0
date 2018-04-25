Received: by 10.28.4.212 with SMTP id 203csp882481wme;
        Wed, 25 Apr 2018 07:26:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48q9s4Yb0UFWI1o7lYH8QDcTXOkZXDdvWRViLcSh74ui5GVnZz18tMu+YlkjxHCsdqnPj4X
X-Received: by 10.55.31.24 with SMTP id f24mr31624753qkf.442.1524666371930;
        Wed, 25 Apr 2018 07:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666371; cv=none;
        d=google.com; s=arc-20160816;
        b=ppH6K0pec88MeJUqknSZhcF36wsXj/Yb3nyrd/fvHaXRn9yKkaVc2GrYMcfANnvA5i
         ULdmdBFrzqy0ZV0/mBjD1bZfRAHTcnuwuDWScRLs803b2Il4B5kQy98gKY406r6Ipfgq
         5MHMnoukQvFpKGoAuTOms/7RK1wygbGB+6BOTJ7HeIpUTvr/6Lx8JKNMvLhtKwhzaZV2
         lvAy+/YZUTGSXQrC9frTCb2uOyEEPUkw0WC7O5+2K3BsY2uUsKqcEHbebDGVre3x5wTB
         qIrjbZB1+Jzicupt0Z2oTNr7xjcJS9X2js8tAP6Ewcsp1Ecscxq+2GKHY6H/GaDob1fs
         0iTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=j1+S0EL4tJsibBASJm1MS2IktXvIqBPKmLrAP6o5Tqs=;
        b=zPxJY9LvC8QGQFQqwGKgI3YeTB2+qmkrbCeeWE8fElIVI+cX33zdkvbMb1R2BmdiE9
         WTglpWU50aDyE6kriXSLUVnpJgNz2AfJCKBE05q4aBWYMePEmpvOe3/UCBGKA2owz2H0
         bfYpx4pqcz1DDNkeAoCtUfms5qASsarzmuV2xANbr7pLt3Z2rEmZW+kiIiZaTYIEVyZH
         l1h/6q1/3RXahmYKkRTl7jciI274Ev1l5rEryNw3rXpjU095BRw8SzH4+P0Eic+37qgh
         GbCaCuwliVO7Epj2T8a3oZwMOVthoPb9R0OmZjoUg3az4vsPgp9+N2yBeYSi9zpUNz4e
         LxoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j130si4336714qkj.78.2018.04.25.07.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLN5-00080r-AZ
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:26:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDy-0000lO-WE
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDx-00061T-Uq
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39820 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDx-00061E-PR; Wed, 25 Apr 2018 10:16:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65047406EA4F;
	Wed, 25 Apr 2018 14:16:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D21372023239;
	Wed, 25 Apr 2018 14:16:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:56 +0200
Message-Id: <1524665762-31355-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 25 Apr 2018 14:16:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 25 Apr 2018 14:16:45 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 11/17] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GI8uIs1TiixU

In case the MSI is translated by an IOMMU we need to fixup the
MSI route with the translated address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>

---
v11 -> v12:
- fix rcu_read_lock and mr ref leaks
- check mrs.mr

v9 -> v10:
- use address_space_translate

v5 -> v6:
- use IOMMUMemoryRegionClass API
---
 target/arm/kvm.c        | 38 +++++++++++++++++++++++++++++++++++++-
 target/arm/trace-events |  3 +++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ecc39ac..5141d0a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -20,8 +20,10 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "cpu.h"
+#include "trace.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -649,7 +651,41 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
-    return 0;
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    hwaddr xlat, len, doorbell_gpa;
+    MemoryRegionSection mrs;
+    MemoryRegion *mr;
+    int ret = 1;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+
+    rcu_read_lock();
+    mr = address_space_translate(as, address, &xlat, &len, true);
+    if (!mr) {
+        goto unlock;
+    }
+    mrs = memory_region_find(mr, xlat, 1);
+    if (!mrs.mr) {
+        goto unlock;
+    }
+
+    doorbell_gpa = mrs.offset_within_address_space;
+    memory_region_unref(mrs.mr);
+
+    route->u.msi.address_lo = doorbell_gpa;
+    route->u.msi.address_hi = doorbell_gpa >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
+
+    ret = 0;
+
+unlock:
+    rcu_read_unlock();
+    return ret;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 9e37131..6b759f9 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%"
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
-- 
2.5.5

