Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4645441wre;
        Wed, 30 May 2018 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKII2YRfxRHzZkX9LdX50VTFMqFfGYH7gEOig/NtxvtjuUC73FLNft+vVXH7cPCYF9LrlO+L
X-Received: by 2002:a0c:bfaa:: with SMTP id s39-v6mr2098543qvj.2.1527681003290;
        Wed, 30 May 2018 04:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527681003; cv=none;
        d=google.com; s=arc-20160816;
        b=wBaHRz1OHjFsCBMVu23nzRjsIj2X/JI0qVEoGo5aUlchLTEljMiQjOLH2RfEOL1ydn
         RLkENZVElbvimBF4NkicspGBFHJIO7ESrcoVYbYe5aHXv1GWiCCOdGc6MWCB1nF08E2L
         n3uUgDkehdxHr4vcDrRMtkzGhwnp9Y/1vIdeYSXN7RTgcTFo63zIweOcC/pIOSnwuSyW
         F8zBplMFE5ACXad/RpUi7+fxhRjCX20K7mFmhcgaAIJBgqb6Y7ndQh+1UxIyghMbrWmJ
         nqrrn2NXhpc8Pxz/FVb4+qvYmZyGM1wTbzsLbzexPljNExwVLudeQPYhSwZUmvXrwWbh
         pZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kFS7buDDlVSkSqBJcAMQNVeQaIVzUMI8An7Kv/F70TM=;
        b=miWA4IYaM+FI0OqB0+nZLetOrXDQxV2akpgjX24LevzoJMj4q5RZcAGtxKVQuMtfhn
         laTV+SouMNC3dYquamUoQQ1iKL35ABRXKdayqs+m8IjKUdC9y0z0nEnGVLr1ZkfL8Vqg
         qi+3Rjg4v4xNWexA39e/VrSz11RZapS5bomYsjKNLLudbFW3B4q73XcqixvFZgkbNhDH
         N2eNzWKmUVxric8hD6DHekVfkamxRzCxejcvNmnIMiaRSCxjzn7ncGVZGUylMEKJT8dm
         DC704dodWUz8HCwE4QjTTYmUhvBPKTkv1LPnaurn8J/gALHPNxYJVV26HXWHG0CAPApK
         XaDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v89-v6si22418169qte.69.2018.05.30.04.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzcA-0007kx-OU
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:50:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYY-00051r-8g
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYX-0005Oh-FI
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41420 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYS-0005IP-8E; Wed, 30 May 2018 07:46:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B68284000B6E;
	Wed, 30 May 2018 11:46:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58E4B10EE6C1;
	Wed, 30 May 2018 11:46:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:40 +0200
Message-Id: <1527680741-2725-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 11:46:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 11:46:11 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v3 7/8] hw/arm/virt: Register two redistributor
 regions when necessary
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
X-TUID: Dr50XW9c5Yz1

With a VGICv3 KVM device, if the number of vcpus exceeds the
capacity of the legacy redistributor region (123 redistributors),
we now attempt to register a second redistributor region. Up to
512 redistributors can fit in this latter on top of the 123 allowed
by the legacy redistributor region.

Registering this second redistributor region is possible if the
host kernel supports the following VGICv3 KVM device group/attribute:
KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION.

In case the host kernel does not support the registration of several
redistributor regions and the requested number of vcpus exceeds the
capacity of the legacy redistributor region, the GICv3 device
initialization fails with a proper error message and qemu exits.

At the moment the max number of vcpus still is capped by the
virt machine class max_cpus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- remove spare space
---
 hw/arm/virt.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3018ec2..c00f47d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -529,6 +529,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     SysBusDevice *gicbusdev;
     const char *gictype;
     int type = vms->gic_version, i;
+    uint32_t nb_redist_regions = 0;
 
     gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
 
@@ -548,14 +549,28 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
                     vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
 
-        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+        nb_redist_regions = virt_gicv3_redist_region_count(vms);
+
+        qdev_prop_set_uint32(gicdev, "len-redist-region-count",
+                             nb_redist_regions);
         qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+
+        if (nb_redist_regions == 2) {
+            uint32_t redist1_capacity =
+                        vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
+
+            qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
+                MIN(smp_cpus - redist0_count, redist1_capacity));
+        }
     }
     qdev_init_nofail(gicdev);
     gicbusdev = SYS_BUS_DEVICE(gicdev);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
     if (type == 3) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
+        if (nb_redist_regions == 2) {
+            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].base);
+        }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
     }
@@ -1351,6 +1366,7 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version == 3) {
         virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
     } else {
         virt_max_cpus = GIC_NCPU;
     }
-- 
2.5.5

