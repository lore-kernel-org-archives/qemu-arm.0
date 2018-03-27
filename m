Received: by 10.28.71.155 with SMTP id m27csp731732wmi;
        Tue, 27 Mar 2018 07:19:37 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuIQk/CfU8IK1rcD79FifUuaOBZffZHZwql4e1tG+HdDGcSnf4xIO1Z40gBnPT6XtdhtwZ+
X-Received: by 2002:a25:d755:: with SMTP id o82-v6mr14060361ybg.222.1522160377257;
        Tue, 27 Mar 2018 07:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160377; cv=none;
        d=google.com; s=arc-20160816;
        b=zQnjZTiECPwocskTReQ76aKvlv/+aY4u3NnbYrUqOdQnLgPuVPGyYVdSIKWhtPRI57
         V0weRjMF4XkI1CMO4S+GLQQPGLjIpOt/Q19gWAzrDX3/jJAYWXR5opw0agsZUDMa+zSC
         5WB2NGdSeJXvTlDgSCbeks/csNDvGrYuSQ/SDoKuJr2XZvVl0hAIncInir+UAaJBYGhd
         MirihJa+P55LgBdBHIrb4FUDcx9IMpH/aVFw4VSaP6ne8DCfzNHEfLeEADBShWyM+eyc
         ZBoCbqL4tcTEzWeUT1aB4jZCm9d4zCzJ31YYj68h5G0BPJaGObDRhP5YCNhumBcUHVcP
         lLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ac6xLpWbpwtUGmScjim/FucZ5AtNw6hu5HI5z8yofac=;
        b=P+E2W9OqS0GQwyU0FB0FFexyEpA7JBLHz+ubIuaaz/wZv47hj26vQ575sexRvZmf6r
         C91PDioWHPEmjVSEgWQJBj2GFM2o/L3F748UNK9rmOOBYqhA8TSMtph05VU9pP9aTu6C
         L1BFPm4HdvREBbTQjjRPEdjRR4Ckt0nHJbfLoVLysD4mnuiikN/0LFD8ITsOvYutY7kJ
         WRD+JgSJG2wg+jPsJzEXurEEy0GQjNN7h1lg4698MaU4lD/RejluVoH+x48YTtny7C0q
         Gml/yHxHiGV6U7wzKh5/PZ17Ml0rT5wjJIrrWoIfYVWjAnBDZNnkoItxoqNv8PSGN1Cs
         ZdGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si1460860qke.357.2018.03.27.07.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pQP-0005Tq-Bt
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:18:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOJ-0003Ek-1Y
	for qemu-devel@nongnu.org; Tue, 27 Mar 2018 10:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOH-0006k9-Vq
	for qemu-devel@nongnu.org; Tue, 27 Mar 2018 10:15:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51278 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pOA-0006cI-9j; Tue, 27 Mar 2018 10:15:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC2DE722C5;
	Tue, 27 Mar 2018 14:15:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 482C16F9E6;
	Tue, 27 Mar 2018 14:15:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:19 +0200
Message-Id: <1522160122-10744-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 5/8] hw/intc/arm_gicv3_kvm: Allow multiple
 redistributor regions
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
Cc: wei@redhat.com, marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2cl09C9ElCZ

If the host kernel supports it, let's allow the regitration of more
than one redistributor region through the new GICv3 group/attribute:
KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION.

In that case we don't use kvm_arm_register_device anymore. this latter
registers the kvm device memory listener which resolves the absolute
gpa of the base address in kvm_arm_devlistener_add(). Then
kvm_arm_set_device_addr() is called on machine init done and invokes
the ioctl with the resolved absolute GPA.

In our case we know the absolute GPA at registration time and the
attribute value needs to be combined with the region index and
size of the region. So this does not nicely fit the current
infrastructure.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_kvm.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index b6a3faf..811d809 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -789,14 +789,21 @@ static int kvm_arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
                                                 uint32_t count)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+    bool multiple_redist_region_allowed;
     int n = s->nb_redist_regions;
+    Error **local_err = NULL;
     char *name;
+    int ret;
 
     if (!s->dev_fd) {
         return -ENODEV;
     }
 
-    if (n > 0) {
+    multiple_redist_region_allowed =
+        kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+                              KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
+
+    if (n > 0 && !multiple_redist_region_allowed) {
         return -EINVAL;
     }
 
@@ -808,15 +815,28 @@ static int kvm_arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
                           NULL, s, name, count * 0x20000);
     sysbus_init_mmio(sbd, &s->redist_region[n].mr);
 
-    kvm_arm_register_device(&s->redist_region[n].mr, -1,
-                            KVM_DEV_ARM_VGIC_GRP_ADDR,
-                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
-
+    if (!multiple_redist_region_allowed) {
+        /* use the legacy API */
+        kvm_arm_register_device(&s->redist_region[n].mr, -1,
+                                KVM_DEV_ARM_VGIC_GRP_ADDR,
+                                KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
+    } else {
+        uint64_t val = base | n;
+
+        val = deposit64(val, 52, 12, count);
+        ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+                                KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
+                                &val, true, local_err);
+        if (ret) {
+            goto out;
+        }
+    }
     sysbus_mmio_map(sbd, n + 1, base); /* first region is DIST */
 
     s->nb_redist_regions++;
+out:
     g_free(name);
-    return 0;
+    return ret;
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
2.5.5

