Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp978218wrq;
        Fri, 15 Jun 2018 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLidk3uN6N9dEzr/UbUr+ES6qAkQIYLl/BG94CKsvmcvXP6qpV1/X5VVQhQ1Npe8t56lPkm
X-Received: by 2002:a37:7346:: with SMTP id o67-v6mr1678334qkc.137.1529076214421;
        Fri, 15 Jun 2018 08:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076214; cv=none;
        d=google.com; s=arc-20160816;
        b=h6mSQi8nWqlkZKqUwR9qCHg02BZVymihYIIMln6/E1g/GrlPzOCCnV5qyLzwBvnOJE
         3CTErZtIzPGmf8JRajVpzPz64JxLEaYEvS69GEp/bnzClDJ/HBFkPsmG5BTuts3vxfYv
         Zzn90yYkOhnCu6I7JvBSm0BsJF0YX1gwdP6hYvcuES1K7iokdibkIe0frOUs7LLqvLdg
         +sr6viEM5s7TZ5Brs+0VmeRKoPTkPwS+T+gbo1Rdat6ErgpmEfP90fFKKjhIfDMNQFcv
         MDjhdWCaBivQ8MeXsTgbqp2C9nCb+rAYdVExeWGSEOVvKGl15PmW3OLyUvqCndUoaMWv
         0LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cfHGNoapJu6v3LhMQu+Q5DZT+ihKYqZf2jvyVAgnH0k=;
        b=iMRjoCvZO2T80tBQoUf7BKXvSdnDjA6jdntAq+X2a74kGH7BpmZ5WSWRqpmDcy9qRz
         LZYUeTF0dIfYgY3oyOBv4N7Lnp5G7JQrFBQf6PBh9Rae0zzgEgbsR6JWRIT2HvrE0ufG
         8t7DIt52xsJt6xIBexNNBtxhuQn2mvGiUiYS/zBV6pj0Or/VGfVCnnHbOiK7+GO4zTZk
         Fzi3abW4KG6TNC6FDzUGI7dGVcdXkppWWLzICnkwV355SEPr6ewU0EOpkxKPWJ87pcXt
         ghsaqvqH3YPR7uIhgzSrRPpVR317GVbLoKj3/9Ki6vUI8KkCzIVLcgXh/jFUW22h/4St
         Ziog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z25-v6si192193qki.7.2018.06.15.08.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqZZ-0001fP-SZ
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:23:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiZ-0004Vn-V4
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiY-0000zX-MG
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41234 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpiY-0000yX-H3; Fri, 15 Jun 2018 10:28:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1548F4067720;
	Fri, 15 Jun 2018 14:28:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45A692026DEF;
	Fri, 15 Jun 2018 14:28:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:23 +0200
Message-Id: <1529072910-16156-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 04/11] hw/intc/arm_gicv3_kvm: Get prepared to
 handle multiple redist regions
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
X-TUID: 1LSzrjDBb+Hh

Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
If not, we check the number of redist region is equal to 1 and use the
legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
the new attribute and allow to register multiple regions to the
KVM device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v1 (virt3.0)-> v2
- added a comment to explain why the regions are registered in
  reverse order

v2 -> v3:
- In kvm_arm_gicv3_realize rename val into add_ormask local variable and
  add a comment
- start the redist region registration  from s->nb_redist_regions - 1
  downwards
---
 hw/intc/arm_gicv3_kvm.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ed7b719..5cb94fc 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -753,6 +753,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = KVM_ARM_GICV3(dev);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
+    bool multiple_redist_region_allowed;
     Error *local_err = NULL;
     int i;
 
@@ -789,6 +790,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    multiple_redist_region_allowed =
+        kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+                              KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
+
+    if (!multiple_redist_region_allowed && s->nb_redist_regions > 1) {
+        error_setg(errp, "Multiple VGICv3 redistributor regions are not "
+                   "supported by this host kernel");
+        error_append_hint(errp, "A maximum of %d VCPUs can be used",
+                          s->redist_region_count[0]);
+        return;
+    }
+
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS,
                       0, &s->num_irq, true, &error_abort);
 
@@ -798,9 +811,27 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
-    kvm_arm_register_device(&s->iomem_redist[0], -1,
-                            KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
+
+    if (!multiple_redist_region_allowed) {
+        kvm_arm_register_device(&s->iomem_redist[0], -1,
+                                KVM_DEV_ARM_VGIC_GRP_ADDR,
+                                KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
+    } else {
+        /* we register regions in reverse order as "devices" are inserted at
+         * the head of a QSLIST and the list is then popped from the head
+         * onwards by kvm_arm_machine_init_done()
+         */
+        for (i = s->nb_redist_regions - 1; i >= 0; i--) {
+            /* Address mask made of the rdist region index and count */
+            uint64_t addr_ormask =
+                        i | ((uint64_t)s->redist_region_count[i] << 52);
+
+            kvm_arm_register_device(&s->iomem_redist[i], -1,
+                                    KVM_DEV_ARM_VGIC_GRP_ADDR,
+                                    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
+                                    s->dev_fd, addr_ormask);
+        }
+    }
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
-- 
2.5.5

