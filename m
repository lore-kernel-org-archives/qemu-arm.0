Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3451016wrx;
        Mon, 4 Mar 2019 02:20:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfAYuPD5id1tBCO3xfxefHpy9boDJ2ILjmlrRiZt9HCnTOEXQtW00fTItqJbueDFMmA+8H
X-Received: by 2002:a81:788c:: with SMTP id t134mr13606815ywc.167.1551694858647;
        Mon, 04 Mar 2019 02:20:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694858; cv=none;
        d=google.com; s=arc-20160816;
        b=bLcFemHoIbwcvybXSCMY7hSyJeYFzdJRjGxKJmRwZHOerh85YYfu05qN1G0FQ/SFNl
         OYjutgaUZJC/dl1aFWJInEaNHBr+8s2iiQpYMqkxPpXjyOIzJE7O+HbZaW3jMHdVpDhS
         XMKX87yrJPc1snUZ0h21pSlEYOwXFCQSCKsvSEyjRJrvYeZpoiUWQEBqr35sY4Vf47Vz
         KOnXhgBhPVAIwOUMm5eBYTxsBmG7zAmuKRjViyu2rnMU3N9h1Pp9mvH5ZLr4sTn3pt9I
         On/0UjhkJeMkV17ZSPHTiIS22wc9Ai+3YTGasSxzRzvQoKSMvLQAatH3lMwKH+D4bVu1
         eidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4BKmi/31KXCuCkR4KIc4R8PGMBGQGof+8vXeJOOV6aw=;
        b=SqBIR07bA7VFCm93IMSd5JNQsMxAi+LmFMIE8O4LApJ6U5ObLgolPNTCMDjSwNRRHp
         La9ccoCpqKjU14oUZVay95JR/3gqeHEGiexj1hhajJewYYZF/kAtk7m5qeQE/ioI68qe
         qicoWNd95QgNQXqRqQHJY1D1++f4cMw4PK/euJCXLrsO0lVm7X4t3DKCbM7qT7rGWCcn
         a0vyA/NdcONcnti1silPYMaREDKEh01gcmWJJCc4x/rPabEpdAja0StPUAhL4Tpqby+R
         Q5y+No3HJj5S77TLlCvHXerKKPWWfEdJNW1X8U2YPu0pw3DpCdGUVj2ZRQA6MUvE6mKR
         GaKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i207si2941322ywa.448.2019.03.04.02.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:20:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kiQ-00068K-43
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcw-0002LQ-P5
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:15:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcu-00013B-KU
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:15:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kcs-0000zj-DP; Mon, 04 Mar 2019 05:15:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 445143082129;
	Mon,  4 Mar 2019 10:15:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 297FA51F00;
	Mon,  4 Mar 2019 10:14:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:38 +0100
Message-Id: <20190304101339.25970-10-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 04 Mar 2019 10:15:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v12 09/10] hw/arm/virt: Check the VCPU PA range
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
X-TUID: OKrT8jTYDuXE

We are about to allow the memory map to grow beyond 1TB and
potentially overshoot the VCPU AA64MMFR0.PARANGE.

In aarch64 mode and when highmem is set, let's check the VCPU
PA range is sufficient to address the highest GPA of the memory
map.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3ac6b152f5..d725daefdf 100644
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
@@ -1608,6 +1609,22 @@ static void machvirt_init(MachineState *machine)
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

