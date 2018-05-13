Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3109934wme;
        Sun, 13 May 2018 07:36:02 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqBhKHAkwwrZrVXrXsLec2iyex+aEQOuD36i2cMImcBN2PEWjpGVeZ/lJwmLe5gj73NZysp
X-Received: by 2002:aed:22b6:: with SMTP id p51-v6mr5641254qtc.222.1526222162893;
        Sun, 13 May 2018 07:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222162; cv=none;
        d=google.com; s=arc-20160816;
        b=sWg5QsdC8sqgEa5GdG3O5+tv++NWf/E1iepijFpvBY/OJ71NEH+OUwz7EQJuQmosaN
         /5J4V4E1rpN75gSS9v4Pm6HtgONhA60OBvx0zlmh8TNJAFJtTAoLcr/oqnuwDOVKD2c7
         xQxYpN2Uxtbukwqo/5av5nLoGRIBAaSvTktkMjUSTo8U3ukCeBm1BDWR7+O7B1hzhFgq
         A0+y6jhED5TX6s2FaEpm8uU9S8EqWrc7UOL1nfIzjocA+klBndcVdgCoN+HQNk9NN+7t
         XOyAc569bjD0u76NfGPbP1SoagM8vTTZzEs3SN0Hv/tkzD2PZGjuWF775zQHPc4nsdIi
         LUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+me/TD8skWWJP1itN3o1lscExnDGd6WAqEeo0rYwStU=;
        b=FSMF/4O6k/eoHr4zl4FEcM9OME6DPY1uYbjgkLHX6zwzixumd0AJK2EkCbrf+J3Bjv
         mdP8Mo66yISsef1UpRHd1A0bxZH+UBFaIL8LyYI0nKtoAdE9nUnn9Sv/Pkg8Lzeu+OIJ
         MNxXxe0P2N91sAXW1yLYCJY0+ku6gASicOY0V/bHzW5riLtWFa2bW9OJuWvVBVKQcggT
         PHYjw3FOgkJMrxkDqUEQ+jQl4fEJNQcyfKKSMOnkhg+b5G0qq4LWyv7AnwBHetD2Ndsf
         oGo4Rlz9DWaTvRux3msKDp44yLRJoP1nW7KekZikdq1+QuCm0OT2y1+WJpegKrH6Omww
         4PaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25-v6si7168124qve.4.2018.05.13.07.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs6U-0008IC-BI
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:36:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5x-0007yT-HK
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5w-0006No-5v
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51192 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs5w-0006Nk-1w; Sun, 13 May 2018 10:35:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95EAF10D45E;
	Sun, 13 May 2018 14:35:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 128618445B;
	Sun, 13 May 2018 14:35:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:09 +0200
Message-Id: <1526222114-5324-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sun, 13 May 2018 14:35:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sun, 13 May 2018 14:35:27 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 2/7] target/arm: Allow KVM device address
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
X-TUID: 3xjbIt/XevJa

for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION attribute, the attribute
data pointed to by kvm_device_attr.addr is a OR of the
redistributor region address and other fields such as the index
of the redistributor region and the number of redistributors the
region can contain.

The existing machine init done notifier framework sets the address
field to the actual address of the device and does not allow to OR
this value with other fields.

This patch extends the KVMDevice struct with a new kda_addr_fixup
member. Its value is passed at registration time and OR'ed with the
resolved address on kvm_arm_set_device_addr().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
index 5141d0a..7eed8d4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -184,10 +184,15 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
  * We use a MemoryListener to track mapping and unmapping of
  * the regions during board creation, so the board models don't
  * need to do anything special for the KVM case.
+ *
+ * Sometimes the address must be OR'ed with some other fields
+ * (for example for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION).
+ * @kda_addr_fixup aims at storing the value of those fields.
  */
 typedef struct KVMDevice {
     struct kvm_arm_device_addr kda;
     struct kvm_device_attr kdattr;
+    uint64_t kda_addr_fixup;
     MemoryRegion *mr;
     QSLIST_ENTRY(KVMDevice) entries;
     int dev_fd;
@@ -234,6 +239,8 @@ static void kvm_arm_set_device_addr(KVMDevice *kd)
      */
     if (kd->dev_fd >= 0) {
         uint64_t addr = kd->kda.addr;
+
+        addr |= kd->kda_addr_fixup;
         attr->addr = (uintptr_t)&addr;
         ret = kvm_device_ioctl(kd->dev_fd, KVM_SET_DEVICE_ATTR, attr);
     } else {
@@ -266,7 +273,7 @@ static Notifier notify = {
 };
 
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
-                             uint64_t attr, int dev_fd)
+                             uint64_t attr, int dev_fd, uint64_t addr_fixup)
 {
     KVMDevice *kd;
 
@@ -286,6 +293,7 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
     kd->kdattr.group = group;
     kd->kdattr.attr = attr;
     kd->dev_fd = dev_fd;
+    kd->kda_addr_fixup = addr_fixup;
     QSLIST_INSERT_HEAD(&kvm_devices_head, kd, entries);
     memory_region_ref(kd->mr);
 }
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 1e23640..4050017 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -34,6 +34,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
  * @group: device control API group for setting addresses
  * @attr: device control API address type
  * @dev_fd: device control device file descriptor (or -1 if not supported)
+ * @addr_fixup: value to be OR'ed with resolved address
  *
  * Remember the memory region @mr, and when it is mapped by the
  * machine model, tell the kernel that base address using the
@@ -45,7 +46,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
  * address at the point where machine init is complete.
  */
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
-                             uint64_t attr, int dev_fd);
+                             uint64_t attr, int dev_fd, uint64_t addr_fixup);
 
 /**
  * kvm_arm_init_cpreg_list:
-- 
2.5.5

