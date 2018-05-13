Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3110136wme;
        Sun, 13 May 2018 07:36:19 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqc3+1otfOyqx+d9HdpbwAaikXYjIwl7lEI3mf7MAFK4I3USvZ+PeeVrFSFuJah5Be8nFXJ
X-Received: by 2002:ac8:8b2:: with SMTP id v47-v6mr5424871qth.350.1526222179387;
        Sun, 13 May 2018 07:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222179; cv=none;
        d=google.com; s=arc-20160816;
        b=qLqeOl1mknQcimIJceOQl1m1TBciEDy4DPNQ7kUdRpzG6TaDu4JpSIOXildJtNO5VX
         41v9DCtF72mHRzkmexvLkC7rj5r2oxeO6/5Y0cH6wkxWrJT6b8bJTAnSDvfniRtyOy1I
         aLXsqJEA0PojCG4xDNDo4Df2Q2agpYkl6t7N21ozXdSyttgyumKgMig6thxP8p2eKvXH
         NDuEpYHV1/dIwMdWrOA8sJlcH7q3DHolVnO+VZdFtZ3LIjGqGfNG4oldZyekp5HJUNnq
         OrJAgGTlfMl2dMHDEct1RTl7kJmWhreBkwxRQe/+1zEvM++Yflzs4Nr+rdQXcmAy9kBZ
         1jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Bsw53uzSp0lsnSaj7aF4Y/D4E0xlicLUPL/JnCKi5sU=;
        b=LZWiXEOzhk2xCi6FBH08LfP/i2qYkLodAERFwcok1oXXyaqdNF3CzUADy2VLsQ+BSR
         oWdQVtJQH0xQnlr6gTl+on+0F9ooDlQKPqtQs/7RKf5lQ74j3iO9xEw/AbL+95izZvre
         tGGVVROETlUzl8qlzSd4Ak8r5b25d8XSD1EUfYk7VmxqTF/vxoGUJCledD/ob6HIthqg
         tEMKjKcPMeLflMiDUVSs//iSjnhdYGZ9uF3flGM/fOpb7hcpxqAUaCi8cCMU8rJ3aj++
         L6qG7GqEpKnpR12NbBy3M/KUrLbPDUXzeabq3lICvnwtdd77FIMtvdezDvLqmCoD18Td
         yOSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w46-v6si7673869qta.376.2018.05.13.07.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs6k-0000AP-RX
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:36:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs60-00080c-LK
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5z-0006PR-RW
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51202 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs5z-0006P5-N4; Sun, 13 May 2018 10:35:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E32EFB646;
	Sun, 13 May 2018 14:35:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BB408445F;
	Sun, 13 May 2018 14:35:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:11 +0200
Message-Id: <1526222114-5324-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sun, 13 May 2018 14:35:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sun, 13 May 2018 14:35:31 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 4/7] hw/intc/arm_gicv3_kvm: Get prepared to
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ESgpymyofGrX

Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
If not, we check the number of redist region is equal to 1 and use the
legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
the new attribute and allow to register multiple regions to the
KVM device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_kvm.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 7e76b87..1b32804 100644
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
 
@@ -759,9 +772,21 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
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
+        for (i = s->nb_redist_regions; i >= 0; i--) {
+            uint64_t val = i | ((uint64_t)s->redist_region_count[i] << 52);
+
+            kvm_arm_register_device(&s->iomem_redist[i], -1,
+                                    KVM_DEV_ARM_VGIC_GRP_ADDR,
+                                    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
+                                    s->dev_fd, val);
+        }
+    }
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
-- 
2.5.5

