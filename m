Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3114234wme;
        Sun, 13 May 2018 07:42:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq90z+yrcWUtxkAfvUlY5uAROOtTKDAKBfQaIDmeRLjur8fgXCEt571AVuFg4lrfK9QevPz
X-Received: by 2002:a0c:a9de:: with SMTP id c30-v6mr5424043qvb.53.1526222544434;
        Sun, 13 May 2018 07:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222544; cv=none;
        d=google.com; s=arc-20160816;
        b=nmmpw62NlHLSOhbqqygCztn4h91LcZ6GicFDPQxTlEXGET1nRFzugXFG641RqUlCML
         N7C1POoJJPVunuvaii2SUS7D39kO9eo8xC545Pux88JUV8v1fcaBiFxSyx4vAqLe+Vx4
         pjvrgcIk08CaioSsm/U/e9IvmZfF5261jjXWb5V+rv3sQfkDIt1FVcZcUC2h9ZPA4mb/
         HVTW7QYeRetpJqp1OiGyJp0/XoNeOdy88kPd9QOTYP1wOMGyvbtVV5txSXDRDYDvKMsH
         NoLP98UC/wrc7WJGAuxG7PJi6rKm+IdEHviCVbhlA2NBY05PewfV+L3VSO2nkY1FIEdO
         1sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=jXQi425TGPO65l3pM5aKCOrgFXqsW4RJp3pulz7a7wY=;
        b=oG8ROltPPYkqHM/O3qTak0LpBnLgycE1njKdMugGga4VbYRO56xDCmg1LDUJUPAONv
         PPy/XDb7uFn9waQ7m6Eoqq+fJNvBemEgE4nKZcHPQFk0bnbixWeGlonoz2yasXa4OOFo
         ZyjdtD8x1RuBgP2iM3OLI5yz3pZ81i9sEbdW5u/+OHTNNWvl9Rn5feAwmHoMObtEx5tD
         R3S7xiTPYMyWl0CKXZXkgRiOVJwnh8Y377NUVt9UgBpKZ0fxfQPxqWTuaR8PCYRDs/IL
         MSTvkvdQa3MNJrgg60FGUq5i7ir2PH4ljRb8UlMh1cSckVO9tfqq3MesJPmi8uEohS/c
         r3Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y58-v6si583860qtb.234.2018.05.13.07.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHsCd-0001Mv-Vl
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs66-00088I-6q
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs65-0006Sa-Bf
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41580 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs65-0006ST-6E; Sun, 13 May 2018 10:35:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB7AC4075757;
	Sun, 13 May 2018 14:35:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 255358445A;
	Sun, 13 May 2018 14:35:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:14 +0200
Message-Id: <1526222114-5324-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:36 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 7/7] hw/arm/virt: Register two redistributor
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K9Xz8dh1vsr3

With a VGICv3 KVM device, if the number of vcpus exceeds the
capacity of the legacy redistributor region (123 redistributors),
we now attempt to register the second redistributor region. This
extends the number of vcpus to 512 assuming the host kernel supports:
- up to 512 vcpus
- VGICv3 KVM device group/attribute:
  KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION

In case the host kernel does not support the registration of several
redistributor regions, the GICv3 device initialization fails
with a proper error message and qemu exits.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f35962a..8d43c51 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -531,6 +531,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     SysBusDevice *gicbusdev;
     const char *gictype;
     int type = vms->gic_version, i;
+    uint32_t nb_redist_regions = 0;
 
     gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
 
@@ -546,15 +547,26 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     }
 
     if (type == 3) {
-        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+        nb_redist_regions = virt_gicv3_redist_region_count(vms);
+
+        qdev_prop_set_uint32(gicdev, "len-redist-region-count",
+                             nb_redist_regions);
         qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
                              vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
+
+        if (nb_redist_regions == 2) {
+            qdev_prop_set_uint32(gicdev , "redist-region-count[1]",
+                                 vms->memmap[VIRT_GIC_REDIST2].size / 0x20000);
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
@@ -1346,6 +1358,7 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version == 3) {
         virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
+        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;
     } else {
         virt_max_cpus = GIC_NCPU;
     }
-- 
2.5.5

