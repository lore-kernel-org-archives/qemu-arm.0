Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp405983wrq;
        Wed, 13 Jun 2018 01:52:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLHkQ3ahSNG5pYG6FIhWD+uKC7pVQLTe5fGDOYwpbk3GLdNJSH+OepF19Y1PNz98l3AtQbg
X-Received: by 2002:ae9:ef52:: with SMTP id d79-v6mr3573902qkg.336.1528879927747;
        Wed, 13 Jun 2018 01:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879927; cv=none;
        d=google.com; s=arc-20160816;
        b=UkDkFqMyf29vpIOWg3VyrXUoWB3bEy4GBDIBlKFu3w74lJCdx730RxKDgmBdaN1Krm
         M0Jo1PqZPLFMUI5Wr1zf2Oc0BSqbyd/Aj4Nkz+tehz5+xFxICUv3Oc15/1eoEpIMyZnC
         Cs9+b2SWmQvadgl47r6orTI90yTSSfMr6879sqODWoibB8BwU85FJK0FpAYBnB/Nn1QT
         uOaau2BfvLsXBb/xnDa6IFosI2qzRc61x75PddyMCG52T0yUhxht+zCA5iXLBb1kmb2G
         mAPtVJcwBzGNQ3slOwab9V1idHEh0Bo+9EAKdT5mbtChtNHldmdeCg7snUiQId5z/c/7
         KuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xqUlMmBFoQinXXW8748no8KmJP1dVrG23VUC5SUrV8Q=;
        b=xVfXhMXDlpCvl8tTc46S/foHVgdqpEpM0Dh/bttY4wpTN9jY8yxawwqtYy7Bl6heyj
         9XjerQUNfzUP1gFMEvpbmL0nEMyiNBybkyurNnUIMYHogrO07Jftx6zlC4YyIvSHgXlL
         6MwItKxBsv5R0G4HUuyJc8WldZ+r1D5ZePKFtohk/jHG6VHXFDbgPkDqAVUrwHFGvCqL
         Zrqm+xp5c3jk8IRsHIvo+4XclTwdKAm8sxI3bIqipuCcz8eyfl/g0S95M3vSZX46iRKk
         NHijD6ocWtmmzIGWXeo/pCRdtoy3M2toeL/Zvqvkkfr8izUge8p2tsrFRv0bkx7iw9Em
         KaJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12-v6si1721006qtp.371.2018.06.13.01.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Vf-0004hk-5M
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Se-00027P-Mr
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sd-0003qJ-DU
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35480 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sd-0003q5-7b; Wed, 13 Jun 2018 04:48:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 615CE87A82;
	Wed, 13 Jun 2018 08:48:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD361116703;
	Wed, 13 Jun 2018 08:48:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:36 +0200
Message-Id: <1528879723-24675-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:48:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:48:58 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/9] target/arm: Allow KVM device address
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0EHyiAZv6tNO

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
index 204369d..8666508 100644
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
index 5649cac..46d9afb 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -793,9 +793,9 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
index 98f5006..867fef8 100644
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

