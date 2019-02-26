Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11494526wrx;
        Tue, 26 Feb 2019 12:52:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib7yvL1YJMWczjk20z3zZ78Qfw/ecUx5HqqHa4yCBiAWpY2cZNQSe/YZ6tCqFgm+cu94xol
X-Received: by 2002:a81:a091:: with SMTP id x139mr20624829ywg.164.1551214370958;
        Tue, 26 Feb 2019 12:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214370; cv=none;
        d=google.com; s=arc-20160816;
        b=Wif2TNOFN16U72Vxq8zZkjH1FYoqH7qPlTrjajl9ZCQlqjWbrYOGjCedBDIyOa6VsP
         WFLiIgCfrTgAq3a3xVMk0ENQRbNptjhPzZSKjw4pT3jokmMa1lHxDdo7ayMNV722zxLW
         VyODkdgSyK8JdIXcclSkvvFRjqm10wofH8yXXE3YsMMbzCScDsGao1z1VD+3FHxayLsr
         CkvTUUnI2K7e3vCXW0dza15bLaugp0I+LIm+06qgOCX89J/q05x96XvLxIQTXYKKwzjZ
         0MUUZuSmcw/kaDQHaJ30r1EiQMo2N0xiV18uASgapPdNNrfUvOIMmifpImgWDXH9fInm
         n5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WMDpaMvl4tUjmJ3nhDInVaHtk7zPMMfGIpgH+P/lChM=;
        b=HROem3A8MkxfH4yObX0f/XL+yvzRBgDZyKua+AgriRs7UbdM9GlqsN/GxzHc73Dsp/
         UC2+EX+kD6dPems5GHlOYFPbgj9dn4eA2dCQsWc+j2bt94l74LHUr1E57WwcNHKkY2rf
         WKHdM6jSysywMkBsVMbFRWsIeTjKrYICfXPYLhovnZXMbaTDak/0SLvVw/xO7Uhd41De
         s8fX6huddSwKgeoQX0cpGg/7ujvxBqMfbryQwfjytKiBzgempYFH79X23j6FhbKJIEz5
         42AjlpXBtgRRUTPYgg7xsRwzXoQpqN50IJ+eyXVMQhvppsTphP4o4C4ZiX0tOQBdLhVL
         uYGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z125si7395273ybc.228.2019.02.26.12.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjic-0002r3-A2
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjbo-0006Fg-4P
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjbj-0000Ko-QR
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:45:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9769)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjbg-0000GF-0m; Tue, 26 Feb 2019 15:45:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5910F30821C0;
	Tue, 26 Feb 2019 20:45:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 702E35D6A6;
	Tue, 26 Feb 2019 20:45:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:30 +0100
Message-Id: <20190226204439.2296-10-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 26 Feb 2019 20:45:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 09/18] hw/arm/virt: Check the VCPU PA range in
 TCG mode
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
X-TUID: jJmrY40gxrOL

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
index b445a13467..acce1f7ce1 100644
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
@@ -1611,6 +1612,22 @@ static void machvirt_init(MachineState *machine)
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

