Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4644487wre;
        Wed, 30 May 2018 04:48:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKDqwWqFlj4wHvUFRvMYu4lkkzfx6tQbACWBEKm0Ks6xaZN+gzdNoxy2Rktjn+/lb2l+t+4
X-Received: by 2002:aed:39e6:: with SMTP id m93-v6mr1967919qte.328.1527680923273;
        Wed, 30 May 2018 04:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680923; cv=none;
        d=google.com; s=arc-20160816;
        b=wTPrG3TDzpgwPIQYLlo8lBHGaGgBXV43pZyTpL239EUgBPjZAFvFd8K9doUKU6gOUP
         QwHDducEw/hWll1UACn/EA/dtHswyUbNb44BMcCDIPeVGXu7y2TbNku0HWy33YmBWmad
         DTAbLTpVVrKTjOG7cGiwGrxtbwDBYoxwR+cuKFIVrnrr1nvNe3B24/TAWqMJAXzS9Jz8
         KJfq9gTuUiDqlVGWk0uG12eDZ5FUqqUpRNKDaJ0B4+rvu7jJxsxC9O7a2hN1V+BSf1nn
         +wHTuvMOes3MBfl9DSHk80SxWk6ZDxpZXhJzjrtRPFTzGcpqAtrhpYYRkAgdy8vVwjXN
         EaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7V6rBk4+NPs7isOEuVU7bsQ92N2FhxC8u3hi2CFrjDE=;
        b=zFc+lF/8mRiBJILbNkDGFMM7aC7SiRDpsC1+QYBo+y/8U6mmsgxqojDoCaFNQ5MELv
         07s0XSSrzIDgmtD6bcb/oQUI4Rnq9tzo7j3BjSrBQWngpMuW1+H6LyLha0tPisnQ+1lH
         8SP+MAFfMBmOsJXWZjf7hzqXFMpcBiR7XOhBHia1H+CSeIHcr3Ya9jMK3jhmM8ANlrh6
         d2e62JZZavx9TqqiIkcXFbzQlhPmswuxIFwpr7eFQa/phPBrU516eZ1xj7SJ7gPyBImp
         87BISvgB1v4aB8bdzv1Jld5Gep/58McJYCfx5+/avNyB7fqHeTPo22b8ow3nmMcPNEnM
         8Eew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10-v6si9368149qkk.270.2018.05.30.04.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzas-0006a0-MD
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYL-0004pp-BN
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYK-0005C3-Bk
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38288 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYI-0005AO-0h; Wed, 30 May 2018 07:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 888E15BCBE;
	Wed, 30 May 2018 11:46:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0099E10EE6C1;
	Wed, 30 May 2018 11:45:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:37 +0200
Message-Id: <1527680741-2725-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:46:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:46:01 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v3 4/8] hw/intc/arm_gicv3_kvm: Get prepared to
 handle multiple redist regions
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
Cc: marc.zyngier@arm.com, wei@redhat.com, drjones@redhat.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yb/XPzC5zNYE

Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
If not, we check the number of redist region is equal to 1 and use the
legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
the new attribute and allow to register multiple regions to the
KVM device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v2 -> v3:
- In kvm_arm_gicv3_realize rename val into add_ormask local variable and
  add a comment
- start the redist region registration  from s->nb_redist_regions - 1
  downwards
---
 hw/intc/arm_gicv3_kvm.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 7e76b87..3826ff4 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -714,6 +714,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = KVM_ARM_GICV3(dev);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
+    bool multiple_redist_region_allowed;
     Error *local_err = NULL;
     int i;
 
@@ -750,6 +751,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
 
@@ -759,9 +772,23 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
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

