Received: by 10.25.44.15 with SMTP id s15csp2623938lfs;
        Sun, 9 Jul 2017 13:55:18 -0700 (PDT)
X-Received: by 10.237.53.79 with SMTP id b15mr651098qte.83.1499633718323;
        Sun, 09 Jul 2017 13:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633718; cv=none;
        d=google.com; s=arc-20160816;
        b=wMUMXrivaHMlduLmQgyuv9LjgVBlI8ncwO9XTM88Y0akpXtoKlwRamN2ZQocFmNS7G
         f+hQ+9fzHGjio0c2xeabtKfgqknz6/WCZOO/H/vCi0TcY/GDFWDEyjexTHq11N/cjL8n
         Rk2UN9h2k4L9NhVCzH4Pn3iO8AWwPriWEyrR3GrN/sxb/khhjf3Ja2OPzi8REKpd/vCC
         f8aukXksH6AmTRVqvy7VnkQFA+BW7ymmDoUgc3CVuCDIQyvqJBeo4nSDz/iDxk1jP1b7
         WMeZp2IqTNRVwWxp8WYWtLtihJgsXQZ9buOeGJBQr3++2U15olitRw3WFRVaVlsNws0L
         lgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=v9FofwitaKIuBn9HC8MUEN5+cD2AlYW7KonrltaU59Y=;
        b=Z+19bEH2yVLhmLxNjVwM1aIyxPBky2dAqrvx/MyW4vbJ3dpTFKakZ/QhwjAYEX/IHd
         hQy2XvqKuaUEtlt+8NwkoT8J2KZOgHOhmTeOkgajIq1v2yT4N3Kainq+ukgqHQpbST78
         IheCvK8FWmmAEB3tA02JuRHu+xRNmSCNmJvdC/FLLGwF4I8iBRLjb6p6J0rGY/yc0TLt
         F8LQpMKmYtUf284CYqL/ZnQGqmjQ6cWn3+2HFaFwFJFS2hy3eHCVpIQO6Dsg3qmMYXEJ
         oQ4mbw2r3a/ZGdsn/pgQIubF8WHw/kPI7nkuDQZc7+m1cf2mvwSUHiGIHCbyaOPpwEpv
         Q4pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t11si9458346qti.204.2017.07.09.13.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJEZ-0004Mm-9x
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCP-0002Jy-Eh
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCO-00066Y-MO
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:53:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJCO-00065o-Dc; Sun, 09 Jul 2017 16:53:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F3674E884;
	Sun,  9 Jul 2017 20:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F3674E884
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2F3674E884
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6751E17DCA;
	Sun,  9 Jul 2017 20:52:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:32 +0200
Message-Id: <1499633493-19865-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 09 Jul 2017 20:52:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 7/8] target/arm/kvm: Translate the MSI doorbell
 in kvm_arch_fixup_msi_route
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v6ysrO3onrFy

In case the MSI is translated by an IOMMU we need to fixup the
MSI route with the translated address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

It is still unclear to me if we need to register an IOMMUNotifier
to handle any change in the MSI doorbell which would occur behind
the scene and would not lead to any call to kvm_arch_fixup_msi_route().
---
 target/arm/kvm.c        | 28 ++++++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4555468..630754f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -20,8 +20,13 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "cpu.h"
+#include "trace.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/arm/smmu-common.h"
+#include "hw/arm/smmuv3.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -611,6 +616,29 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUTLBEntry entry;
+    SMMUDevice *sdev;
+    SMMUV3State *s3;
+    SMMUState *s;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, SMMUDevice, as);
+    s3 = sdev->smmu;
+    s = &s3->smmu_state;
+
+    entry = s->iommu_ops.translate(&sdev->iommu, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, sdev->devfn, sdev->iommu.name,
+                                  entry.translated_addr);
+
     return 0;
 }
 
diff --git a/target/arm/trace-events b/target/arm/trace-events
index e21c84f..eff2822 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value %" P
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value %" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value %" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
-- 
2.5.5

