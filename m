Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11095541wrx;
        Tue, 26 Feb 2019 05:55:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia0YDTCDkFOGJjccyZrIjr+46MBb8bS6VtfahvM4H2ymCWKyopc6wj8bGy6b7uIG+el5wNi
X-Received: by 2002:a81:28c3:: with SMTP id o186mr17593688ywo.309.1551189332211;
        Tue, 26 Feb 2019 05:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189332; cv=none;
        d=google.com; s=arc-20160816;
        b=SaLEo0dKqGJNTG0QL8WLU50hcnvl4430RKBAK3iuvTdOpq715Mf9XF9dYE53yRRlDk
         nVahkKXYG1vXSCAuw600P+E4XCd+lPzpISLCCXrQgG5F3di7FtMwOKWds8uyfpiwOB4T
         1sJ3jmanwdKCndq0zeA1pieM7jPcxfmyrx7WW2cajouhMIc5MpWUFL6gZr7lNGOaVW+a
         JhSH5mrVfZKJLzpPz3454jp+yCkUHILUs9o5pc1Gp/HKAyZe4gA0IeXko6kUjaD/Mwii
         dRrarDkAfV1FsrXwcYTltoZcayNzstYzzy5PCS88za+rlAF/45ShJzOUiGSoH5tPFkU7
         af0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oLipzDizDWA9wFpY6XWDylTdgqBiDrPtbPqnB+F3RuI=;
        b=G7+nM0z5umXUa9+L16V4rNqzXCq82Kh8Ake1Pjxsu/PInLB3+PqnZk4rUfbLN5dnKM
         MUK/4RrvGXnbPbJRBnQ14xacch/QAfVpVdrABoCfvOIq292IgJH+0+Xk4s0ob0Ii3LN5
         GmTe/E1qy9x8uv8XINxsBbGabtRdbQpAwg7k4U2OJHW+hg2lut2hjGfbDibhzNC1DK95
         pfrKZ2xgGqE3kKcwZGFqaad0X1RzrvZvQykkmz8zCr+PDo60ObdZAcEo5EZW/6Pezk4X
         SdZwaC9HBsqjtWbNfdiIwmuZhCXM9g/DJEirmKUjNAtAxot7XXi9a+TyVnU5L/MonTBR
         Of9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si2943365ybo.222.2019.02.26.05.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydCl-0002xX-LI
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:55:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8f-0000J0-3J
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8e-0007Ep-2q
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8a-0007Am-Ra; Tue, 26 Feb 2019 08:51:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28DEC6DDD4;
	Tue, 26 Feb 2019 13:51:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A51D5E1BD;
	Tue, 26 Feb 2019 13:51:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:05 +0100
Message-Id: <20190226135014.31854-10-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 26 Feb 2019 13:51:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 09/18] hw/arm/virt: Check the VCPU PA range
 in TCG mode
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gNhJxIH+kD2p

We are about to allow the memory map to grow beyond 1TB and
potentially overshoot the VCPU AA64MMFR0.PARANGE.

In aarch64 mode and when highmem is set, let's check the VCPU
PA range is sufficient to address the highest GPA of the memory
map.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3981916931..17a34574ae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -60,6 +60,7 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "target/arm/internals.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1603,6 +1604,22 @@ static void machvirt_init(MachineState *machine)
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
=20
+   if (!kvm_enabled()) {
+        ARMCPU *cpu =3D ARM_CPU(first_cpu);
+        bool aarch64 =3D object_property_get_bool(OBJECT(cpu), "aarch64"=
, NULL);
+
+        if (aarch64 && vms->highmem) {
+            int requested_pa_size, pamax =3D arm_pamax(cpu);
+
+            requested_pa_size =3D 64 - clz64(vms->highest_gpa);
+            if (pamax < requested_pa_size) {
+                error_report("VCPU supports less PA bits (%d) than reque=
sted "
+                            "by the memory map (%d)", pamax, requested_p=
a_size);
+                exit(1);
+            }
+        }
+    }
+
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram)=
;
--=20
2.20.1

