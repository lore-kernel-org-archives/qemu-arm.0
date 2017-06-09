Received: by 10.25.0.23 with SMTP id 23csp3114855lfa;
        Fri, 9 Jun 2017 08:53:10 -0700 (PDT)
X-Received: by 10.237.51.197 with SMTP id v63mr41147293qtd.199.1497023590871;
        Fri, 09 Jun 2017 08:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497023590; cv=none;
        d=google.com; s=arc-20160816;
        b=v6I/9kXVNJuqZUTMHYfIebUJVVDUtrjBCIe29WeWiGblwiDlMT97UdeuVfeg4HRhBT
         VV+3L8PkD8XweQjRbfhKkyLQ3efeWCn8Ldu/YXq1YzRhtKLParhxBeoFbtrDtyWH47G7
         eD6zD4MfbeHXKQSsbdeDGCEOTeV8rbU+jer6C/y6RZyaXGaRg/iPizTJapJYUE2RWNm9
         c3PrN7fnIdzpjLK7b62gxHSnsrZ3GGNGm9NofaxzwppJzC4hmPqpTjYWb97kBVakZBTS
         kYCYZ+I68R7wZYmcn250C/6tuF2pn1B6u9CSW0J4oVuc97L85bqHmNB1OL5GTEl2z6z7
         GtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=kCb4HorSQgb5WUldFtZ2thjcCNnWMQ0jOtH9cAsp500=;
        b=ji+UFJcRzm/NhPdGCuCxRSZZhr8uIJw4YU10aTnfVyYHjMPdBczulm9NC6DYipmhdZ
         Fjz5HwwbA5VK65RjPm4RzjhoGgATwz5dEbv/hAuonvYRLcZykkC5sYbAvrXn1NzcHBr5
         MhPCecuEGYh57Jh2tda/8ZoxqQkBjbeduZk8Askj4h0/EDxz+7pMOwNvp5jdeSVsA0hK
         vIsfiVXndgnKojCQOxd9V2DA+JfH6dUKU3iPjrXj4S3XfFdqtNa7AAPfrTyvhDCNxgUl
         7smFJy8Z/jlN9oA8vUWH57E7g6uWnvsf+UUZcqZgA9JCD1fX2UbS9g6Osuilu4jzhgO/
         14iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o187si1338746qkc.332.2017.06.09.08.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 08:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJMDk-00037T-39
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 11:53:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDc-000362-8v
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDa-0004wM-Us
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJMDa-0004vv-Lx; Fri, 09 Jun 2017 11:52:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C5AD20B1C;
	Fri,  9 Jun 2017 15:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6C5AD20B1C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6C5AD20B1C
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6032955A2;
	Fri,  9 Jun 2017 15:52:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  9 Jun 2017 17:52:30 +0200
Message-Id: <1497023553-18411-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 09 Jun 2017 15:52:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 1/4] kvm-all: Pass an error object to
 kvm_device_access
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emWTMRKmMSjg

In some circumstances, we don't want to abort if the
kvm_device_access fails. This will be the case during ITS
migration, in case the ITS table save/restore fails because
the guest did not program the vITS correctly. So let's pass an
error object to the function and return the ioctl value. New
callers will be able to make a decision upon this returned
value.

Existing callers pass &error_abort which will cause the
function to abort on failure.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gic_kvm.c       |  9 +++++----
 hw/intc/arm_gicv3_its_kvm.c |  2 +-
 hw/intc/arm_gicv3_kvm.c     | 14 +++++++-------
 include/sysemu/kvm.h        | 11 +++++++----
 kvm-all.c                   | 13 +++++++------
 5 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index af5cd36..ae095d0 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -100,14 +100,14 @@ static void kvm_gicd_access(GICState *s, int offset, int cpu,
                             uint32_t *val, bool write)
 {
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
-                      KVM_VGIC_ATTR(offset, cpu), val, write);
+                      KVM_VGIC_ATTR(offset, cpu), val, write, &error_abort);
 }
 
 static void kvm_gicc_access(GICState *s, int offset, int cpu,
                             uint32_t *val, bool write)
 {
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_REGS,
-                      KVM_VGIC_ATTR(offset, cpu), val, write);
+                      KVM_VGIC_ATTR(offset, cpu), val, write, &error_abort);
 }
 
 #define for_each_irq_reg(_ctr, _max_irq, _field_width) \
@@ -538,13 +538,14 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
         if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS, 0)) {
             uint32_t numirqs = s->num_irq;
             kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS, 0,
-                              &numirqs, true);
+                              &numirqs, true, &error_abort);
         }
         /* Tell the kernel to complete VGIC initialization now */
         if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                                   KVM_DEV_ARM_VGIC_CTRL_INIT)) {
             kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                              KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
+                              KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true,
+                              &error_abort);
         }
     } else if (ret != -ENODEV && ret != -ENOTSUP) {
         error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index a0441d6..340c2b0 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -78,7 +78,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     /* explicit init of the ITS */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
 
     /* register the base address */
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 4ee2baa..b70ee27 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -93,7 +93,7 @@ static inline void kvm_gicd_access(GICv3State *s, int offset,
 {
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
                       KVM_VGIC_ATTR(offset, 0),
-                      val, write);
+                      val, write, &error_abort);
 }
 
 static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
@@ -101,7 +101,7 @@ static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
 {
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_REDIST_REGS,
                       KVM_VGIC_ATTR(offset, s->cpu[cpu].gicr_typer),
-                      val, write);
+                      val, write, &error_abort);
 }
 
 static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
@@ -109,7 +109,7 @@ static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
 {
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
                       KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
-                      val, write);
+                      val, write, &error_abort);
 }
 
 static inline void kvm_gic_line_level_access(GICv3State *s, int irq, int cpu,
@@ -119,7 +119,7 @@ static inline void kvm_gic_line_level_access(GICv3State *s, int irq, int cpu,
                       KVM_VGIC_ATTR(irq, s->cpu[cpu].gicr_typer) |
                       (VGIC_LEVEL_INFO_LINE_LEVEL <<
                        KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT),
-                      val, write);
+                      val, write, &error_abort);
 }
 
 /* Loop through each distributor IRQ related register; since bits
@@ -630,7 +630,7 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     /* Initialize to actual HW supported configuration */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
                       KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
-                      &c->icc_ctlr_el1[GICV3_NS], false);
+                      &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
 
     c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
@@ -717,11 +717,11 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     }
 
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS,
-                      0, &s->num_irq, true);
+                      0, &s->num_irq, true, &error_abort);
 
     /* Tell the kernel to complete VGIC initialization now */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a45c145..1e91613 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -294,12 +294,15 @@ int kvm_device_check_attr(int fd, uint32_t group, uint64_t attr);
  * @attr: the attribute of that group to set or get
  * @val: pointer to a storage area for the value
  * @write: true for set and false for get operation
+ * @errp: error object handle
  *
- * This function is not allowed to fail. Use kvm_device_check_attr()
- * in order to check for the availability of optional attributes.
+ * Returns: 0 on success
+ *          < 0 on error
+ * Use kvm_device_check_attr() in order to check for the availability
+ * of optional attributes.
  */
-void kvm_device_access(int fd, int group, uint64_t attr,
-                       void *val, bool write);
+int kvm_device_access(int fd, int group, uint64_t attr,
+                      void *val, bool write, Error **errp);
 
 /**
  * kvm_create_device - create a KVM device for the device control API
diff --git a/kvm-all.c b/kvm-all.c
index 494b925..2f9d605 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -23,6 +23,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -2214,8 +2215,8 @@ int kvm_device_check_attr(int dev_fd, uint32_t group, uint64_t attr)
     return kvm_device_ioctl(dev_fd, KVM_HAS_DEVICE_ATTR, &attribute) ? 0 : 1;
 }
 
-void kvm_device_access(int fd, int group, uint64_t attr,
-                       void *val, bool write)
+int kvm_device_access(int fd, int group, uint64_t attr,
+                      void *val, bool write, Error **errp)
 {
     struct kvm_device_attr kvmattr;
     int err;
@@ -2229,11 +2230,11 @@ void kvm_device_access(int fd, int group, uint64_t attr,
                            write ? KVM_SET_DEVICE_ATTR : KVM_GET_DEVICE_ATTR,
                            &kvmattr);
     if (err < 0) {
-        error_report("KVM_%s_DEVICE_ATTR failed: %s",
-                     write ? "SET" : "GET", strerror(-err));
-        error_printf("Group %d attr 0x%016" PRIx64 "\n", group, attr);
-        abort();
+        error_setg_errno(errp, -err,
+                         "KVM_%s_DEVICE_ATTR failed: Group %d attr 0x%016"PRIx64,
+                         write ? "SET" : "GET", group, attr);
     }
+    return err;
 }
 
 /* Return 1 on success, 0 on failure */
-- 
2.5.5

