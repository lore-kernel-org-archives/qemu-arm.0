Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4642743wre;
        Wed, 30 May 2018 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK03RTG4mP4eZNlgyVu4bG8IiJLM+inhiEDOV/jqPp8kbRODPqZlpyDYmEKy9y28H69wQ8R
X-Received: by 2002:ac8:1aa5:: with SMTP id x34-v6mr2015673qtj.327.1527680789849;
        Wed, 30 May 2018 04:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680789; cv=none;
        d=google.com; s=arc-20160816;
        b=dOiSwKfqCnTpRfQnrHjkfX7JrOgZ8DjPIwCOY0uu224WI2cnNdysH90a2NSnJGyC0Z
         4FfMPZNq9CnJb6fnIOJq8qEnXTI/Pi7vsXcF69IQENA9vvHgvqP0Kr5q/e9DYs4qqx6U
         8JBP/rkEBSd8cByg2VtSNfyewyO44aacfv0iVhVKBvNkmi1Ef6lAOejxW71WtEqc7qws
         5B8jWcW0yE0x8yzOzO8BaqOOt2cNT7L6NQxqDeDhuWLXTNRvVCw9Fp3MyjCrp2+CDfW4
         p1e6V5AaPmpHJf4bjdVNDzunV12Xi8ffqeAb5VsKuujSfd4FzMuiDJxEo4YMpOu3PbHX
         Cvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gzgAamjzgbJZLYqHtkzlz8NRG7iCT4cB93VSvRUeXI0=;
        b=BPfYgUjDVznA1/kqEYMTPwPmA1V+KlmrFZxgy0Tg1zc0+eRXBmYad1jma54Gagty0D
         OT6syccCyTaydH9kMH6zoU3gW5Rg+sWlNCxyWYNcJXACTfAqNuJT0mkXYY3QrwbcOu86
         gVMlGr3+eReDJj9LRaaZtxuG90IhQCZ+pawZ1XZgyUfqFvN9q8RWCJZno1GoAp7mocYn
         LkYi8ksUNdkevlIjjPY/dxh0l+p3EzapTqP/NA8RuJqYAVwRSWkJteJf9QxpHkXy0rFo
         HNJKAPq3E2bhyoewxz6GgM4yslixHukCuRXY+LrY2ll6UXb/KD++91dAHqTfRYsWR2x1
         rxwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20-v6si5715651qtq.80.2018.05.30.04.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzYj-00051S-7X
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYF-0004kY-OQ
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYD-00057v-Ns
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:45:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38280 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYD-00057a-Hs; Wed, 30 May 2018 07:45:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02534BB405;
	Wed, 30 May 2018 11:45:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A88C10EE95B;
	Wed, 30 May 2018 11:45:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:35 +0200
Message-Id: <1527680741-2725-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:45:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:45:57 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 2/8] target/arm: Allow KVM device address
 overwriting
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JlWraJ7jd+DK

for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION attribute, the attribute
data pointed to by kvm_device_attr.addr is a OR of the
redistributor region address and other fields such as the index
of the redistributor region and the number of redistributors the
region can contain.

The existing machine init done notifier framework sets the address
field to the actual address of the device and does not allow to OR
this value with other fields.

This patch extends the KVMDevice struct with a new kda_addr_ormask
member. Its value is passed at registration time and OR'ed with the
resolved address on kvm_arm_set_device_addr().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v2 -> v3:
- s/addr_fixup/add_ormask
- Added Peter's R-b
---
 hw/intc/arm_gic_kvm.c       |  4 ++--
 hw/intc/arm_gicv3_its_kvm.c |  2 +-
 hw/intc/arm_gicv3_kvm.c     |  4 ++--
 target/arm/kvm.c            | 10 +++++++++-
 target/arm/kvm_arm.h        |  3 ++-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 6f467e6..eb9664e 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -558,7 +558,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
                             | KVM_VGIC_V2_ADDR_TYPE_DIST,
                             KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V2_ADDR_TYPE_DIST,
-                            s->dev_fd);
+                            s->dev_fd, 0);
     /* CPU interface for current core. Unlike arm_gic, we don't
      * provide the "interface for core #N" memory regions, because
      * cores with a VGIC don't have those.
@@ -568,7 +568,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
                             | KVM_VGIC_V2_ADDR_TYPE_CPU,
                             KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V2_ADDR_TYPE_CPU,
-                            s->dev_fd);
+                            s->dev_fd, 0);
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index eea6a73..271ebe4 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -103,7 +103,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     /* register the base address */
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd);
+                            KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
     gicv3_its_init_mmio(s, NULL);
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ec37177..93ac293 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -754,9 +754,9 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                       KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
+                            KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
     kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
+                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5141d0a..6a4324a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -184,10 +184,15 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
  * We use a MemoryListener to track mapping and unmapping of
  * the regions during board creation, so the board models don't
  * need to do anything special for the KVM case.
+ *
+ * Sometimes the address must be OR'ed with some other fields
+ * (for example for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION).
+ * @kda_addr_ormask aims at storing the value of those fields.
  */
 typedef struct KVMDevice {
     struct kvm_arm_device_addr kda;
     struct kvm_device_attr kdattr;
+    uint64_t kda_addr_ormask;
     MemoryRegion *mr;
     QSLIST_ENTRY(KVMDevice) entries;
     int dev_fd;
@@ -234,6 +239,8 @@ static void kvm_arm_set_device_addr(KVMDevice *kd)
      */
     if (kd->dev_fd >= 0) {
         uint64_t addr = kd->kda.addr;
+
+        addr |= kd->kda_addr_ormask;
         attr->addr = (uintptr_t)&addr;
         ret = kvm_device_ioctl(kd->dev_fd, KVM_SET_DEVICE_ATTR, attr);
     } else {
@@ -266,7 +273,7 @@ static Notifier notify = {
 };
 
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
-                             uint64_t attr, int dev_fd)
+                             uint64_t attr, int dev_fd, uint64_t addr_ormask)
 {
     KVMDevice *kd;
 
@@ -286,6 +293,7 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
     kd->kdattr.group = group;
     kd->kdattr.attr = attr;
     kd->dev_fd = dev_fd;
+    kd->kda_addr_ormask = addr_ormask;
     QSLIST_INSERT_HEAD(&kvm_devices_head, kd, entries);
     memory_region_ref(kd->mr);
 }
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 1e23640..863f205 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -34,6 +34,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
  * @group: device control API group for setting addresses
  * @attr: device control API address type
  * @dev_fd: device control device file descriptor (or -1 if not supported)
+ * @addr_ormask: value to be OR'ed with resolved address
  *
  * Remember the memory region @mr, and when it is mapped by the
  * machine model, tell the kernel that base address using the
@@ -45,7 +46,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
  * address at the point where machine init is complete.
  */
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
-                             uint64_t attr, int dev_fd);
+                             uint64_t attr, int dev_fd, uint64_t addr_ormask);
 
 /**
  * kvm_arm_init_cpreg_list:
-- 
2.5.5

