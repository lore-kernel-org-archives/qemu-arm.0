Received: by 10.28.91.67 with SMTP id p64csp3787099wmb;
        Tue, 20 Mar 2018 05:48:21 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsUvlZyI7G8tDGUbwprc8S0IES4neuw98Iss44v0jS89Vhy4xXsShtQEwQe+qt2UAIXGNPg
X-Received: by 10.237.47.1 with SMTP id l1mr24420415qtd.10.1521550101235;
        Tue, 20 Mar 2018 05:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521550101; cv=none;
        d=google.com; s=arc-20160816;
        b=bP5vaJcAGBbvu66CzRijGNUYEbrMfGShTkvEusVi78vTAuJJaiZ3fsxTfc0HAC3bZE
         ueBH9vTrxAJnzDB2KH0Q8e0NDtCQCgWjv10W1QxhcU2I/pVA5KvUBMsM/1Z+9XRLjgvy
         rlDBpCz8BhEzOM1zmIt4kK7jIOBV0r4nwrfQlQzo/bjt6KI6oczJXtq4r5lwzDsjvFj/
         vQ6MHfflhxEYwy9IKFiTuz0W6jFUNJ3HuYuJzvgT/GWzM1k5zUM1Bc89KMBXkN1hGhXZ
         PDIrxOEtM9+X/121nzwnNwyOF9siSXLWAu2ETP6wnjn6zj+gVvjBKNYLsGLEAmTcjvgc
         fuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Qq6MGBT6UKzNqBHOTShRrt3PO1b7XkdPV7OMK4j2Un4=;
        b=YZrgUlmJqOt5Qao66aiHBR8FIbysEMA+fwHFDGnlPCE3SmsRZByQTxM1Vl89NgsMUa
         W7C6KbnH660XWuZcYmhyVXT6d6JwpqlY5ccxilCppHICHX3rlsNKJEun0YMCotc6s/vo
         l/wtXpVrdUXF5yVezVPyrG67yMBUVoDvtsJOLE2vn+IA7nKz/PTIFjGOVL4Xk66b+CPp
         QaPmXPEHNJxPs+eq0XYid9uvxyJLVi/FWGe4PlmcbkB2uBZQ2U0TlllNiJwjmXeQ4cxw
         TT7egyVGtvN8Cqa5/qsVK64jOf3S5qGjQqzTOzPADFTUf27SrrtJ8Zlq7/oO2sM4HXfI
         i35A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17si1931120qtv.276.2018.03.20.05.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGge-0007wl-NF
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXU-000844-CS
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXT-0003le-5U
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39150 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGXS-0003lN-Vz; Tue, 20 Mar 2018 08:38:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72914406804F;
	Tue, 20 Mar 2018 12:38:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A53294583;
	Tue, 20 Mar 2018 12:38:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:33 +0100
Message-Id: <1521549456-14072-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:38:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:38:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 11/14] target/arm/kvm: Translate the MSI
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
X-TUID: 0rIsHq5da/t8

In case the MSI is translated by an IOMMU we need to fixup the
MSI route with the translated address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

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

