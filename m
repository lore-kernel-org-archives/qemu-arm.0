Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp686640wrx;
        Thu, 28 Feb 2019 07:10:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iao8qU/WrUby/3B/65mguMIuicAAQbicmajiupUZp2g0tqZPrzvE8zFMDaZ0eq5PNrWXQr7
X-Received: by 2002:a0d:ca07:: with SMTP id m7mr5777166ywd.192.1551366622365;
        Thu, 28 Feb 2019 07:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366622; cv=none;
        d=google.com; s=arc-20160816;
        b=tuc0J6D/UMxbLnHBqOKDaKlsLfObLFZpOp1v9+ko24mp3q9HDS3699tPWgSl1RYsew
         /GjWjncMSMHE9hcHKSPwn4eIk2c5gDHvx7hFlXDPtchx2K2eYAMNQRRgCqwDpbrA1bTT
         sYY5FV1W9/TubSxiqfyD814znl/OS2RxJLWTtIGFWy/AkPKEbE+YUNr/GQeGV9xX+rT4
         cyuZUIOIZ2I3lZZ4dy8lHQnfD+SbByj2UBp2+cM05TH6OuYqS+hma4/aYjIlurooam+A
         q8VfTiYOWDbMWbvmeRkD7ZTHaAi/m+Q29eHIiF4ygjZXPecXGsPfmxa+kgOc+FE9XWo9
         g6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GfjYsodqPRMsv9bJ3+Dii0rgSCFqiphknZtX0syJ3hs=;
        b=SvakAbqzAMql6YmUpYowReknSndZs7O9NOiFuIMuEIDvDldn86Pb7UMObg4fSYYWVJ
         nb/0NhNLjxWyUqyiQQieJWKhVzVYKNMNQQLeuxt8yujxJmIrlhx08NT/sjVVqmVVBear
         lut46GTo+gSR4wrZIHCFL+8bukTNgfGPMkqrAR+orZxPXGxAXihDP7JXX/+am045T+uW
         OFIZlgMkM0Ki8iEYHIw168MhZEJMSkO0dUn9N19IW8ExIwvgZQb00yZ2X+KNo0clNBWm
         jn/PnB4Idsehki8rNKZBtgYHE8+DnSZlpR2Sbw0y1mextAM7Jq974DWDjCT1azJBX+6U
         ft2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j125si6133882ybj.405.2019.02.28.07.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNKH-0005xD-MW
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNFV-0002eB-In
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNFT-0004pk-NH
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:05:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNFG-0004WE-DZ; Thu, 28 Feb 2019 10:05:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B90EDBCFED;
	Thu, 28 Feb 2019 15:04:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A219619C5B;
	Thu, 28 Feb 2019 15:04:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:23 +0100
Message-Id: <20190228150324.25973-10-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 28 Feb 2019 15:04:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v10 09/10] hw/arm/virt: Check the VCPU PA range
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
X-TUID: XAuVJM0P14P3

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
index 7a158571b7..a3da75a5ae 100644
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
@@ -1607,6 +1608,22 @@ static void machvirt_init(MachineState *machine)
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

