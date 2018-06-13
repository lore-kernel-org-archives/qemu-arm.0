Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp408149wrq;
        Wed, 13 Jun 2018 01:54:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLTO16QRKr/RRfOZ5v504J7T2CKaIgCFRXQoiBo01vVdNfS473v2t/2F8iieQD4c2oXyOo1
X-Received: by 2002:a37:cf0d:: with SMTP id e13-v6mr3357372qkj.203.1528880081436;
        Wed, 13 Jun 2018 01:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528880081; cv=none;
        d=google.com; s=arc-20160816;
        b=FxTPc+/tYXy9ciWEWq4DzVYTHvZmrUh6cCY6/Abp3fQrC/MFCIkB3eRFKySxfwW+t5
         bWY1Jo2U2psF6QCPgXAMNcE/p1Zf4iY94FaE+sFr6S9EUbXjeJQuwt434TjOzRRxhFU8
         TgCHkZpqz9EMSdv/mJyBeKbiuEUj30Xs6vfoV9jdRGLbUZCrUydUW3JAOe5MNZveVRw9
         RsCfoZ8dUljziTim4JjumtYdqAGRSuuRf3ah0XqHr8XpIrsMAF8gvxzMeSR69tkfOQ0E
         P9IM88Tmjymysf4TNqYpnMkNg/fq1WGrylON9rQ3qaYL+DV8nvN/Xd+ArglmEzKHmc9A
         kxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ubK62LLjY059Yu0LnNqXiuX3hQBay7d2cXeQfypJKtU=;
        b=qqV2Ob6OqVwVz4W/wKQwQMT0Fab3KR5TDyTrd05hP4MfcmjEfCx8oLQIDb7BIPsqP1
         EG8it3B9Azu1xS2sUDyPQw4gSxIU16J47Atwzv2qKAKxmfvFY8FFYNnusWv9Dre9PNwT
         V4m1dneh543ttuK+5amXENiSzHFR5f/UAaA0Q8C0bbFwlyxzYlkW8okuWvj66NUVUzlp
         Eq6/B//ZxieOYUdBg2GqSoI8IGEalw2hj123PYPoZkhLaNeKYWMhiZdg5QW4MXV1faC5
         6MFWa6CwqSoWHJk9YsxMw3C7pbiZtyGdrJzBFdQE9x4YHzHBxFGmsm/ko+5mhLXxpFP7
         8SyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t15-v6si1466630qvm.111.2018.06.13.01.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Y8-0006sP-Uj
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Su-0002Nu-Ot
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sr-0003wB-Ma
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38396 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sr-0003w0-HZ; Wed, 13 Jun 2018 04:49:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CCEA7D84D;
	Wed, 13 Jun 2018 08:49:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D55C21116703;
	Wed, 13 Jun 2018 08:49:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:41 +0200
Message-Id: <1528879723-24675-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 08:49:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 08:49:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 7/9] hw/arm/virt: Register two redistributor
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
X-TUID: fK/Eq7f+5J0G

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
index 5c02cc5..2a1c0fb 100644
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

