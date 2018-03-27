Received: by 10.28.71.155 with SMTP id m27csp734401wmi;
        Tue, 27 Mar 2018 07:22:03 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs+OxL7P9dEi5aN/658ugi6tZvBMrEuuM2v/hj+HbHDnvD5Uo1CHFeNDsH3+2P6WPOuzsEq
X-Received: by 10.129.230.3 with SMTP id u3mr26612226ywl.448.1522160523560;
        Tue, 27 Mar 2018 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160523; cv=none;
        d=google.com; s=arc-20160816;
        b=yWNfHBAlkC00ApIMKtspJ3cnkZQDr9k/qxCu7dhq4P9M/OJW0CJ+K2Yaqp11oxA8FH
         R5Pu6Tnc1LhIIyCWUeO9kj0Z9ax2SPDvyNART7M75b+BzXAHuYYv7xMzADlWdgYc8paA
         rbE+pmgtyUlgG+h/uMo5O7wYeWKgMWuyGwXeqJBUDEiUhFWhmDacGSq36gcbx3racI7x
         oaPdpcGOGQWHI5a2b7B/92UfjKzA4DA6GlfMKKxdnyakkYIte8LAwy9dPoKBsY2LIM6O
         0bWssbJSRyVYEWIgmq7zsm66yqP2eiskOcVw52CKsDrwC+iNb+F8iziojfBv+FZ0xp4Z
         sTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9DR87fbig5UCoxteX77qBhxRXKRgFg8k4nF5gAPGF+w=;
        b=f/gFjAheLHnWJWQtv+UtgRxds2jzj2OhC1YeZWAJS0GihZ7TTK7R4nSbp9zFQb19VR
         Fogu278PMGpm+WVYgx5Ax8cajv/76/2vUA7s1pdhmo0jZLGkCleD7uvEq/WnFiXcV+rW
         sVyUwRUk5wrQ55ExwVvBZAVraqmIbUbXZw2mRff+NZ8VRi38d8iLhnroir9SUmJG957L
         9wkXXhA7KHHWnySmPLeYPdQTwGC1all4ZARcwTg9g1gHWa19WWVlBf/bxEBjGaMp3Ftw
         X7g1efUGOHLkmyL3jdYp/WBbEZMqbecciMFCfvQscWbP2SsUvFCgdYgbrIc6oWKmpNRE
         AU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si1452391qkc.154.2018.03.27.07.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pUB-0001ry-2P
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOM-0003Hs-DO
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOJ-0006kn-7V
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:16:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48752 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pOJ-0006kf-2l; Tue, 27 Mar 2018 10:15:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACE7F406DE12;
	Tue, 27 Mar 2018 14:15:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFFDE6F9E6;
	Tue, 27 Mar 2018 14:15:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:22 +0200
Message-Id: <1522160122-10744-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 27 Mar 2018 14:15:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 27 Mar 2018 14:15:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along with
 KVM VGICv3
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S92WmWg7GZWW

With KVM acceleration and if KVM VGICV3 supports to set multiple
redistributor regions, we now allow up to 512 vcpus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 17 ++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8258f6f..cdb1a75 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -149,8 +149,10 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
+    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
+    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
-    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
+    [VIRT_PCIE_MMIO_HIGH] =     { 0x8000000000ULL, 0x8000000000ULL },
 };
 
 static const int a15irqmap[] = {
@@ -553,6 +555,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         agcc->register_redist_region((GICv3State *)gicdev,
                                  vms->memmap[VIRT_GIC_REDIST].base,
                                  vms->memmap[VIRT_GIC_REDIST].size >> 17);
+        if (vms->smp_cpus > 123) {
+            agcc->register_redist_region((GICv3State *)gicdev,
+                     vms->memmap[VIRT_GIC_REDIST2].base,
+                                 vms->memmap[VIRT_GIC_REDIST2].size >> 17);
+        }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
     }
@@ -1284,6 +1291,14 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version == 3) {
         virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
+        if (kvm_max_vcpus(kvm_state) > 255) {
+            /*
+             * VGICv3 KVM device capability to set multiple redistributor
+             * was introduced at the same time KVM_MAX_VCPUS was bumped
+             * from 255 to 512
+             */
+            virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;
+        }
     } else {
         virt_max_cpus = GIC_NCPU;
     }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d168291..801a4ad 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -60,6 +60,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_GIC_REDIST2,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
-- 
2.5.5

