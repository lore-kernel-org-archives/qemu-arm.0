Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp984899wrq;
        Fri, 15 Jun 2018 08:30:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJfkt9zHWTQltlbOISIq8Tffm2uSan6LYZxobykR2em5diUjb3DURw9Ze30Ze5MnWsB7+2l
X-Received: by 2002:a0c:af08:: with SMTP id i8-v6mr1830504qvc.244.1529076601588;
        Fri, 15 Jun 2018 08:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076601; cv=none;
        d=google.com; s=arc-20160816;
        b=Wm/Se2Ih0c4dUE8sdYiP5+mlpZz7eOIHVA7CIpwxaM1bQZMV+zSkM3kVa5tXAnxWZR
         l83lHsI4z0226X30Ho0MiDj2pso9nf1izGHG48sst2u7CeyOOfgOKy3do1S6EN+tQPdN
         +nOpzgvTVW70M8MDD2mn0jy0Nc9yWyQAPDihSDZV/UCkOeYLrY2ErJJ4QoOSXmy023vp
         j3LhgOk8KDI3VRWkLAkW6baL8fpq3ESV4IDQtvSZ/MNYta7XNTWlXeZUn004vWnbRB1r
         /xbPr36tc49b1rYfinVrAHszC6t764HN984+HT3VxJN+C4HjsrW7ELZQ4RP5ZZKawAat
         dosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Ev2sClU1LjATYLDp4jbDweeqLGj26vsjXK10X1478fM=;
        b=rqFHVHxUnCpyGOM+EqkT2wAkD5C7nJbO1uK6mYuUiRcefqqE5Bg+mglTBhY2a58lBD
         EC3TdJV03dubZs4CQFMbBiE/OPmGP7B5U8oPuor/3583wFZ60K/ftpXj0cGjfrn7BCrm
         48IJlh21t8RC413tj5X9d0MiQbUE32PUlEY7lzgFIldRHZj4nicsDY422ms++3K5dBWE
         SW3sBEEKfs1bZi3aB1BZZaL8fdwBhjNGAVulAm3dzwy5Ss8L1fuJK3Wq6gIYQ9+dYsiv
         4e3Y07iL1s/TMxeKKGyEq2rf9w2dFCReGRCbevEQixBjA6q9j6P04O/QOdXf9x2Llgxd
         d0Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37-v6si1831277qtn.360.2018.06.15.08.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqfo-0007Zu-W3
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:30:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpig-0004cu-AP
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpif-00017q-37
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41250 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpie-000171-Tj; Fri, 15 Jun 2018 10:28:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54ABD4067720;
	Fri, 15 Jun 2018 14:28:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66892202660D;
	Fri, 15 Jun 2018 14:28:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:26 +0200
Message-Id: <1529072910-16156-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 07/11] hw/arm/virt: Register two redistributor
 regions when necessary
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
X-TUID: glKxA59ODWpG

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
Reviewed-by: Andrew Jones <drjones@redhat.com>

---

v2 -> v3:
- remove spare space
---
 hw/arm/virt.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d9f72eb..936cb3a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -528,6 +528,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     SysBusDevice *gicbusdev;
     const char *gictype;
     int type = vms->gic_version, i;
+    uint32_t nb_redist_regions = 0;
 
     gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
 
@@ -547,14 +548,28 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
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
@@ -1350,6 +1365,7 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version == 3) {
         virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
     } else {
         virt_max_cpus = GIC_NCPU;
     }
-- 
2.5.5

