Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp403650wrq;
        Wed, 13 Jun 2018 01:49:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKinFYF7+dVAYilBIxjq9MmIqTPP1IDvG8AcUlh0e4WA/fGyaAo1R9y1SaA+A2pJGq5+ibu
X-Received: by 2002:a37:5687:: with SMTP id k129-v6mr3634957qkb.163.1528879762201;
        Wed, 13 Jun 2018 01:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879762; cv=none;
        d=google.com; s=arc-20160816;
        b=R/7UaYvVHiRfiTIy5sW8vY+1nA0neKOnosrju88QMz1YveToGOV674MB+MFPsrfHaG
         5gsSuotNXHYcdHy5MauRyFjFElhkF+mX5yuarVP8H6IlJW6JjIrtNuImDiK30wrwSP6M
         5zv8RfCc04LNsm8EcLFCqLV1EAhnnF4Leid3CZdEMVMqcH65VmUBclOUeINhfwF/+Gu/
         3Fpnp3mBj03UHYtwzi4Hu8yDd9qnkjJArPHCFD8XMBGweHXUrQJQMacNjxqRTZFcdhBs
         ZkcYSAVCD7683xSXKeZMmw4EYpx+d4yh2hgQyG1Yzy0C4nFiPZnJql4LK6MGXp2ASob/
         FSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=An8l0BjhRSu6NhAMIdvqi9KK8DEAY3SLB1+/c3U8npU=;
        b=nh8cfAJqyTggJFbcXgMCK4c70BERWWN67K+4omT66Tqx1c+FDB2BNXXRwe5UD9A+25
         aYqg63GqRSowdGRYj4/2bkPrKsHou6VYKBENeBQ1K4P2qnlJK1kyeaW2gc+YltGBNdN7
         3+QwgFbyYsfSC0VFkZWfOfmgACFz/57LI1vUqb499+OSV0HCtBZcV2asrsc1dAEIXHvB
         irWBKNCeu8ZMZA7h6aIxDZ9qy/l+tfQwxayZodHFFowK4f5qKFOS7TbOpMZva92tTlFx
         IHmd4Ip6GEasHh7pS7Bf/m4LLXv5/o6Azuq35I+4krSWdICyL81XMgJbVRlttmbBB10f
         K98w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si2081197qve.239.2018.06.13.01.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Sz-0002HJ-IE
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:49:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Si-0002A2-5F
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sh-0003si-65
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51082 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sh-0003sQ-1R; Wed, 13 Jun 2018 04:49:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BBD7401EF05;
	Wed, 13 Jun 2018 08:49:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A72DE1116703;
	Wed, 13 Jun 2018 08:49:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:38 +0200
Message-Id: <1528879723-24675-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 08:49:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 08:49:02 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 4/9] hw/intc/arm_gicv3_kvm: Get prepared to
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
X-TUID: 1eIWxknizRTZ

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
index ed7b719..52e6e70 100644
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
 
@@ -798,9 +811,23 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
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

