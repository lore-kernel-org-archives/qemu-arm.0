Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp685433wrx;
        Thu, 28 Feb 2019 07:09:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ+pMRC6q8T6iZ9HTiPU/sd5NNIWRtUtJ9HrG8yXAqQ5sqbH0ct1k+w+jgwPnhldKwMEbQL
X-Received: by 2002:a25:3783:: with SMTP id e125mr7080924yba.362.1551366561881;
        Thu, 28 Feb 2019 07:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366561; cv=none;
        d=google.com; s=arc-20160816;
        b=wnjGG+MCP8tjrJMSQGNe/WOkHCHKBKB8/RXQTdoTM7/PlkkUiF8KGdsNPfzVVGmDIZ
         whSNz+sG1Hns9BiPRZi12hueX5gGsOPMtwntWxSuLJlrXRihDGNm2LrXulMNEBWntOzh
         kVRwbv6zDu/OX2fMuN/5nhfewSXuqC6gyhhM2VFThJ9u9QqFXiFQXeeNCZhwI4bLr9iM
         xsZQcjnJsfWKXleQZcl5s1zxsv5K0NzGk7DQ2iRld1z0JOl2YxUHYadVFKmamLuTDZOP
         xNK6+GO/AtAeOzv4TM2VNmR1nrLlm/FwERz6Uo2BM+O/8bZXY1qH8CYjtIab1ioZw4eo
         O3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=E/n8IFMZVwkNUzYVoxoJdWxVLUV+wup/T1iOJo0pNwM=;
        b=ZP0+b6yPkCwjrwHweFcDlfLNCQhrsdGnVBpJjWoGXaIZsoWxMBIcUO2oXc2hcok38c
         bYLhX7deCgCCjceeECknHVAe/nkCfuklLBZ+fkeLszMC+9luXe0gb/JZ0cn70nJLaOYx
         RnPbVEjzMJTiN3g0JWRt5yoHG/dJGgwggt6aBn8uXG28Gx6TIzvW2sp33Rk/M0VB5K60
         WqUdrJXlknl1r6lUFpM6z0dKCv/iX/nz6MdYkWAVwgbksv55n2k//fjOPUo/e5132+NE
         16V55WtBbU+Aeu5GdkPFj1zPrqOLeVr2165bP6wQcmcZEFsP5YMuys4DtpwcoSAdwdmb
         dFGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q205si8678932ywq.437.2019.02.28.07.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNJJ-0005dq-Bl
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNFK-0002WL-0D
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:05:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNFF-0004eK-MP
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:05:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNFD-0004Xb-A4; Thu, 28 Feb 2019 10:05:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98E14308D3ED;
	Thu, 28 Feb 2019 15:04:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19E7D19C5B;
	Thu, 28 Feb 2019 15:04:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:24 +0100
Message-Id: <20190228150324.25973-11-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 28 Feb 2019 15:04:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 10/10] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h15dVXUl9Rlb

Now we have the extended memory map (high IO regions beyond the
scalable RAM) and dynamic IPA range support at KVM/ARM level
we can bump the legacy 255GB initial RAM limit. The actual maximum
RAM size now depends on the physical CPU and host kernel, in
accelerated mode. In TCG mode, it depends on the VCPU
AA64MMFR0.PARANGE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- TCG PAMAX check moved in a separate patch

v6 -> v7
- handle TCG case
- set_memmap modifications moved to previous patches
---
 hw/arm/virt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a3da75a5ae..a45f0fcf79 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -95,21 +95,8 @@
=20
 #define PLATFORM_BUS_NUM_IRQS 64
=20
-/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
- * RAM can go up to the 256GB mark, leaving 256GB of the physical
- * address space unallocated and free for future use between 256G and 51=
2G.
- * If we need to provide more RAM to VMs in the future then we need to:
- *  * allocate a second bank of RAM starting at 2TB and working up
- *  * fix the DT and ACPI table generation code in QEMU to correctly
- *    report two split lumps of RAM to the guest
- *  * fix KVM in the host kernel to allow guests with >40 bit address sp=
aces
- * (We don't want to fill all the way up to 512GB with RAM because
- * we might want it for non-RAM purposes later. Conversely it seems
- * reasonable to assume that anybody configuring a VM with a quarter
- * of a terabyte of RAM will be doing it on a host with more than a
- * terabyte of physical address space.)
- */
 #define RAMBASE GiB
+/* Legacy RAM limit in GB (< version 4.0) */
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
@@ -1515,12 +1502,6 @@ static void machvirt_init(MachineState *machine)
=20
     vms->smp_cpus =3D smp_cpus;
=20
-    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM",
-                     LEGACY_RAMLIMIT_GB);
-        exit(1);
-    }
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
--=20
2.20.1

