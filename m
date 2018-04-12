Received: by 10.28.71.155 with SMTP id m27csp1607016wmi;
        Thu, 12 Apr 2018 00:42:45 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+Brw5ysyssF97NksPjH/tHi5QM7OWPNHsBXqt6itOaPZF3aLRHiEdBt5wn8Vr6UM6K977r
X-Received: by 10.200.7.69 with SMTP id k5mr12104062qth.165.1523518965632;
        Thu, 12 Apr 2018 00:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523518965; cv=none;
        d=google.com; s=arc-20160816;
        b=0oNQ9QJs5YavMbx3ztJzowXT9/o7c4K0gfBfuPAmoGbNYk8xtLDH+YcMuidjXBl1k+
         b/VcVUKNTEqYAzCmrKQn7JRg8+FnJWwHVxFaIqew3wHbSNCkOjNCPf49OYphyMpN+bBt
         cinCw8d92/3z5rfMhqv5IYE3J47mYAm2hTSeZ/k2F/1O0mD43XSLNmXTFA05qInEJJa4
         JFpSUSiPy/BUgBZo9NSOV2bUNQH9vVOUhCztcdsFU8FVyEbUbmJS1GY21qNMef/sBd6t
         75t073Ckhd7lG/ZlyfyiPHvteUv24mzF04G6Qkpob3VV9DU0IfsIv+U+lBprZ8ilqgup
         MtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a/avb07Ps2eu1iDrBVdZPtAg2Sc3MZWxJSfc6Uaypn8=;
        b=JVKW5MbzthBstt2cP0FElH3ljSHCVz1xn3nnKzZT+b2jvTWQNiGRAmjj7xNHs7PpAC
         +wLzJd6vabRi/zO7zLiHdby935BZofBLYEoUH/45iRod+rPwSPBe4MsN1Y6NPl5Ms+gf
         PTRvq89Ub4kNhr65133EfwOrRXEeSENRk1CFwt/dNKL5vpjLV5hP8JIw11MyC7IOrq8K
         QTsshORtuOmgDNe1ELgg75v52Z7kPJF5tyDe1TZXDWLtMZ6h9cw4fV+CkO8zu4dEp6Rb
         em1R4R5L/gP90dLDjKMX68D0uETcqbPDlG88zbDUfwzSulgpnGxd2zM0xDbmdQ/Wm17s
         4QGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si3829716qkm.97.2018.04.12.00.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 00:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6WsX-000226-4S
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 03:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Wor-0006rV-5N
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Woq-0003Iz-7T
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:38:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51388 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6Woq-0003IL-0Z; Thu, 12 Apr 2018 03:38:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C5BE4023BAD;
	Thu, 12 Apr 2018 07:38:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0C81215CDC6;
	Thu, 12 Apr 2018 07:38:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Thu, 12 Apr 2018 09:38:02 +0200
Message-Id: <1523518688-26674-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 12 Apr 2018 07:38:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 12 Apr 2018 07:38:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v11 11/17] target/arm/kvm: Translate the MSI
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
X-TUID: S6vtBMV2Jaod

In case the MSI is translated by an IOMMU we need to fixup the
MSI route with the translated address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>

---
v9 -> v10:
- use address_space_translate

v5 -> v6:
- use IOMMUMemoryRegionClass API
---
 target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ecc39ac..c6f6aa8 100644
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
@@ -649,6 +651,31 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    hwaddr xlat, len, doorbell_gpa;
+    MemoryRegionSection mrs;
+    MemoryRegion *mr;
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
+        return 1;
+    }
+    mrs = memory_region_find(mr, xlat, 0);
+    doorbell_gpa = mrs.offset_within_address_space;
+    rcu_read_unlock();
+
+    route->u.msi.address_lo = doorbell_gpa;
+    route->u.msi.address_hi = doorbell_gpa >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
+
     return 0;
 }
 
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

