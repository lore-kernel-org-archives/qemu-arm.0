Received: by 10.28.71.155 with SMTP id m27csp727427wmi;
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELun/8CoFSaqyidUt3kUqIuHoQL2dN24bYm2oFS/34OGtdYWqDPn5Bm58bSIGSsPkMwN/HpR
X-Received: by 10.129.238.15 with SMTP id l15mr25509992ywm.32.1522160159037;
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160159; cv=none;
        d=google.com; s=arc-20160816;
        b=0oiXbsy9q1xQVgssnUd+5QXNnpXmmP2yUERLGe8kOzHiYy/MVfHNvmP9+m++P5wXKY
         AQ/CHGcKrzmrE/QgwmYjL4+3mEvKbVwj/ZiCTY0DW5SkLcT0gXJg07WE+MaJ7RUDkmtb
         fBjcgDndSQEf2tEBU1/z59lxVo1H6hTjqZ+YjvBUU8ArlmGe3APYqrMF65RR/FdS1bVc
         jHgGuPTxzct7sWzODlNDktRAMW5lDAiUKWCDgw5ecVx5yJNUDMxyhAsFVlAmMtQS+ynQ
         Xs8lhUgmBpFP37shdPzIiKLTXlXqL4AnvUbKhx0TkAI+nv5bSAA2o34ZFD9u516Jmjxj
         36JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yY+AzxMVyBNd670IrkrUVsHjNRNgvUL86TvZ3Oeh8I8=;
        b=mxPo+mLTrTg5cNANnflW2zOhO6R1mQL12XnNY99NMjAsTIdqm3mXywEDl3nMSvbvwk
         GMXfM3CZ7Ekjanfrkhspkkv87dteRxaHq1CO9eF7UeA79wEaCI9pJQSRkcIGkj38A3tI
         6jgd0EuNLkjCA9f/HJZs9BCYWmVCVZdGStKbwYNe0CMhWgfVA7L59ab/s1YKyY69bgMr
         ptyVBWvE8KbpGUrPjpW0holemM17LM7V6kUANd+Tw5XosXJgR60ApRPuRylAU2YbwzMD
         aSVDBLKUq5YWm1I3tjfl+AOYOEMoE8ZRJjyFB1LU8CRphw6+9qY8jl57O1FCU9TPRtu6
         gLaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47si1544322qta.320.2018.03.27.07.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pOI-000331-JF
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:15:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO4-000315-Lb
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO2-0006Pe-AN
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51248 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pO2-0006OH-3e; Tue, 27 Mar 2018 10:15:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9524D722C6;
	Tue, 27 Mar 2018 14:15:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B14CB8442C;
	Tue, 27 Mar 2018 14:15:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:16 +0200
Message-Id: <1522160122-10744-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:40 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 2/8] hw/intc/arm_gicv3: Use an array of
 redistributor regions
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ibb5g1OB9VOY

In the prospect to support multiple redistributor regions,
let's introduce a GICv3RDISTRegion struct datatype and a
statically sized array of those. For the time being, only
one redistributor region is used.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_common.c         |  5 +++--
 hw/intc/arm_gicv3_kvm.c            |  3 ++-
 include/hw/intc/arm_gicv3_common.h | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..cb4ee0e 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -199,11 +199,12 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
     memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
                           "gicv3_dist", 0x10000);
-    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
+    memory_region_init_io(&s->redist_region[0].mr, OBJECT(s),
+                          ops ? &ops[1] : NULL, s,
                           "gicv3_redist", 0x20000 * s->num_cpu);
 
     sysbus_init_mmio(sbd, &s->iomem_dist);
-    sysbus_init_mmio(sbd, &s->iomem_redist);
+    sysbus_init_mmio(sbd, &s->redist_region[0].mr);
 }
 
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ec37177..a07bc55 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -755,7 +755,8 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
-    kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
+    kvm_arm_register_device(&s->redist_region[0].mr, -1,
+                            KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
 
     if (kvm_has_gsi_routing()) {
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index bccdfe1..3cf132f 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -137,12 +137,20 @@ typedef struct GICv3CPUState GICv3CPUState;
 #define GICV3_S 0
 #define GICV3_NS 1
 
+#define GICV3_MAX_RDIST_REGIONS 8
+
 typedef struct {
     int irq;
     uint8_t prio;
     int grp;
 } PendingIrq;
 
+typedef struct GICv3RDISTRegion {
+    hwaddr base;
+    uint32_t count; /* number or redistributors */
+    MemoryRegion mr;
+} GICv3RDISTRegion ;
+
 struct GICv3CPUState {
     GICv3State *gic;
     CPUState *cpu;
@@ -210,7 +218,8 @@ struct GICv3State {
     /*< public >*/
 
     MemoryRegion iomem_dist; /* Distributor */
-    MemoryRegion iomem_redist; /* Redistributors */
+    GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
+    uint32_t nb_redist_regions;
 
     uint32_t num_cpu;
     uint32_t num_irq;
@@ -288,6 +297,8 @@ typedef struct ARMGICv3CommonClass {
 
     void (*pre_save)(GICv3State *s);
     void (*post_load)(GICv3State *s);
+    /* register an RDIST region at @base, containing @pfns 64kB pages */
+    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);
 } ARMGICv3CommonClass;
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-- 
2.5.5

