Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp523991wrt;
        Wed, 23 Jan 2019 02:23:53 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4vq07tpKubCx46riD2lBEUYLkwlPA4dBf+3EDGTcs/RJBKtKRaGPgjvmvbdd3FOrZE1fR1
X-Received: by 2002:adf:8506:: with SMTP id 6mr2107053wrh.128.1548239033446;
        Wed, 23 Jan 2019 02:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548239033; cv=none;
        d=google.com; s=arc-20160816;
        b=nH1dedaWw5yoA4TorTkvV1YB2+fC8YsZPKiHeMUk7Tsad48Vt6+k6JmF6/SbAUM8dx
         LqgO7iIpJpcQUNHbLNITrOC0khEcXsg7fNAqebTn48YPQ9nyV7wTiB82aUDa1G0MQtsy
         Laja5SJm2GT06xHdkTCaQRKtPkX2GHkTmzgEiZ/qPYuqsLwM7dluXuYmGdR151t/A/Z5
         B0G1rxlDoax7LWPtG5UZXt1kY/Lw4A0zVTkdenRkVo27TRlWjlkhU1knch1Fk+dhwxLa
         +jTydcy8LwXA3zSYZiImFSKMLV7NVJjrnPQJT0rIZnV5HQWnGNI1Wry+lX0IQwGQ4IPu
         mByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Yqtayh3iDsDa4Go0I7m/nf5sN8oDKVt4t5iGr4lTpV0=;
        b=ro4sMGLi0C/2kG0eYXDeYqUCwCjVzGcC1ub/S3yJoaVaUGy6P2unpVkEZqDnjIuJ8l
         z2WYYRkBuik3h/e2yJ4nzd8yJSQwqy1MqoEhih8GkwIUznFuOidCHh8eBmW5lkvxhiFE
         MNpU/HJSPoayhxqIkKMGUtJeN0qDCyVH0qHH3EsAl+HXkbVqTAv/lQJHcOfyWgVFM9fJ
         xYM+qHAL2MEJWhVOzaWUlku+KIWkvJcSCx+xHpAFA196d/9GfEzTq1SiO34QczqtoIDh
         +CVQwcZ/tqvLsbo9rlfIlKsB4No2fnhWojua0A1kxEKBuiP+Tve1wgXHjH6iY6JrnjrB
         GKHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si35811329wmu.42.2019.01.23.02.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFhI-0007GK-GZ
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZn-0001ls-8M
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 05:16:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZm-0007W4-5O
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 05:16:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZf-0007Nj-S1; Wed, 23 Jan 2019 05:16:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 072B280F6D;
	Wed, 23 Jan 2019 10:15:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D29A60192;
	Wed, 23 Jan 2019 10:15:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:50 +0100
Message-Id: <20190123101458.12478-11-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 23 Jan 2019 10:15:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 10/18] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KhfHsUVhdVbI

Now we have the extended memory map (high IO regions beyond the
scalable RAM) and dynamic IPA range support at KVM/ARM level
we can bump the legacy 255GB initial RAM limit. The actual maximum
RAM size now depends on the physical CPU and host kernel.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a89ffbf4d7..61c3bb1cef 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -93,22 +93,9 @@
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
-#define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+/* Legacy RAM limit in GB (< version 4.0) */
+#define LEGACY_RAMLIMIT_GB 255
+#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such =
as UEFI.
@@ -149,7 +136,7 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_PCIE_MMIO] =3D          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
-    [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+    [VIRT_MEM] =3D                { 0x40000000, LEGACY_RAMLIMIT_BYTES },
 };
=20
 /* Memory map beyond the RAM */
@@ -1456,8 +1443,9 @@ static void machvirt_init(MachineState *machine)
=20
     vms->smp_cpus =3D smp_cpus;
=20
-    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM", RAMLI=
MIT_GB);
+    if (!vms->extended_memmap && machine->ram_size > LEGACY_RAMLIMIT_GB)=
 {
+        error_report("mach-virt: cannot model more than %dGB RAM",
+                     LEGACY_RAMLIMIT_GB);
         exit(1);
     }
=20
--=20
2.20.1

