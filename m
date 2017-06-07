Received: by 10.25.0.23 with SMTP id 23csp1978639lfa;
        Wed, 7 Jun 2017 01:40:59 -0700 (PDT)
X-Received: by 10.55.164.79 with SMTP id n76mr15284224qke.208.1496824859724;
        Wed, 07 Jun 2017 01:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824859; cv=none;
        d=google.com; s=arc-20160816;
        b=LZKYZrxL2uLccVc7gWH3KYbIXXo+M1oQ/JDDFexrfmA/7qw0fN8wVsS4WvgKlj9Igw
         QGxa80UHBUNr2kwzOim4e7SSWJgKyjwTIvoaXx4SYyFkNMK7TsSwnHBnm+FxkhI9+/yS
         9oe0nH/U3c9mO6p3lG0NUhGPK1B7aG7GlbnB0ao4jl9RHqtHaz/yCeQ8GTMdQqyd1/oK
         3A227uH0Wynl0lFSz5DSGQoXEH1nFQTzW3++u4YKKv7NPjxyD/umN4EuA2jS0U6ndyti
         ayvNk5YUJOQKN2vpHPJ/bq2fUcpoLZJb6sTZTNNIHK1BIZAYxAEIYgW2U4/SFXbvIwOJ
         JiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=si7o2iq8dRV/ScbdQRTbOOHDYJaMYof7hT6ti+86JX0=;
        b=eT1iWUPx5XIrxTe6ybmqlgJwbu3FxawQw5db3M3Ji6djTdOKGZ8XTSLJcgzNcapVM1
         u7KZhP8xCGnKvqHdGp1wYGSydcsjTR8QNABhlkdRCvMPIgrynCDamMV/qhkpFpAKVdgn
         tw4svCFtf0jlMf6onzQ+8kMBeyaHlwCoP8ug8wBY3lIvPhO6c3XZPedWwv4nKv+3hhc2
         CrbH+CM5CY7tGfGAGe5/nj+kan4uhBkjGU/9lGVE69IBYdX1LZMgXysUDqjWfYhpOeiI
         5JjQaHSKYdf6yXFkhCsGcg6SGEmmRyU7tJlRyKPbvPeuDJDxnzCdE1GVWmriW+jE0+JT
         lk2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64si1250704qka.249.2017.06.07.01.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWWP-0007ET-0E
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:40:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSf-0003jh-SE
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSe-0001AA-Co
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:37:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWSe-0001A2-6n; Wed, 07 Jun 2017 04:37:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AEE080C01;
	Wed,  7 Jun 2017 08:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0AEE080C01
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0AEE080C01
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A977A1837C;
	Wed,  7 Jun 2017 08:36:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:55 +0200
Message-Id: <1496824556-1883-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 07 Jun 2017 08:37:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 7/8] hw/arm/virt: Add 2.10 machine type
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uzij14NSMTOQ

The new machine type allows virtio-iommu instantiation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

a Veuillez saisir le message de validation pour vos modifications. Les lignes
---
 hw/arm/virt.c         | 24 ++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 010f724..6eb0d2a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1639,7 +1639,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_9_instance_init(Object *obj)
+static void virt_2_10_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1699,10 +1699,30 @@ static void virt_2_9_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_10_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
+
+#define VIRT_COMPAT_2_9 \
+    HW_COMPAT_2_9
+
+static void virt_2_9_instance_init(Object *obj)
+{
+    virt_2_10_instance_init(obj);
+}
+
 static void virt_machine_2_9_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_2_10_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
+
+    vmc->no_iommu = true;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+DEFINE_VIRT_MACHINE(2, 9)
+
 
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..ff27551 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -84,6 +84,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_iommu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
2.5.5

