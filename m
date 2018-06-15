Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp964259wrq;
        Fri, 15 Jun 2018 08:10:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIpAAeKz3dLwbDua8pNnRIvCWU7ajjc29/r3fGU0iMpYxceH/JkM5YV2m62ZUqtkfpDvXbL
X-Received: by 2002:a37:10a4:: with SMTP id 36-v6mr1676555qkq.349.1529075459659;
        Fri, 15 Jun 2018 08:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529075459; cv=none;
        d=google.com; s=arc-20160816;
        b=xVASO8lawMJvnIrTqGWjtIOlJSsSlGUvFhriMk7LyLZ1YjM2eWFk48LW5H/5CuMgBK
         /Q9xHYlC0e/ng9724EEzGzvNZE3EOVnnNZtJ4WMzt76PLZY2wEwg06Ea+woX/XvouiRF
         iSA6v6xBA8IEN/k+tekUvyE6onnwL0uGwcw5Y9UpTm6ZVcK0m168l5S5kZduT/nKZRXT
         5Ml+gMJKsmwiNOnYAuX+/ioU3AcTH65sXB7Hb1PpcF6C6vcIE7htX7H2r1KeHQdd44fW
         nj56ggITxAfW+hkypKfEcWv6wuIfO0LcSwAZTbPRDQS7zHHP2MjYSxEiikIPOWnugoFX
         MJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xqUlMmBFoQinXXW8748no8KmJP1dVrG23VUC5SUrV8Q=;
        b=TyeHE0vmqHvwiCzgiGiBY0qReA9V22zideJ8xspDStBdtuXx9hB9jFgtxff6mT+Qh4
         TwVIbvZDer9A6YYaShUWo06ScPn7b97vzPCgc1kU8WPKKxhVUVgLLWaLV08ey9CIG1Ek
         CRrVhlTXyeRcJ220vpsXPncrR/wYp/7Uc0rwGMy/gvDOnNPCBTDDlyuUO98GmB0EPw/3
         c2hC6jZbcaIsD9VjDnLSdArBq0Rxs9GosHejBerkW6yxmEd1HrjQiboj/II9Z+OgGSZH
         49C7EeZfcF6TgefjzykhoL/GdQQPIIRqfOf4I+dxheIg2qgCjtcsuEPmKRL57qkHa6U5
         J2+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10-v6si2998346qkk.26.2018.06.15.08.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqNP-0007OF-2I
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiY-0004So-UM
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiX-0000ws-G7
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:28:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42534 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpiU-0000sK-2C; Fri, 15 Jun 2018 10:28:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A890402312B;
	Fri, 15 Jun 2018 14:28:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C77DA2026612;
	Fri, 15 Jun 2018 14:28:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:21 +0200
Message-Id: <1529072910-16156-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 14:28:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 14:28:41 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 02/11] target/arm: Allow KVM device address
 overwriting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gnYT6HjMtdq

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

