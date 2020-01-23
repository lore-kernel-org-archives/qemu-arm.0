Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp561812lfp;
        Thu, 23 Jan 2020 03:59:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqytmHrMAQHykgP8BwxJybsHG3sMp2XI9b0llG0+lxVA0sJG4Uyj/At26PJ9ObMja0TDTyM4
X-Received: by 2002:a17:906:1d50:: with SMTP id o16mr6305060ejh.111.1579780763329;
        Thu, 23 Jan 2020 03:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780763; cv=none;
        d=google.com; s=arc-20160816;
        b=icu/Ewvr46Hd7GkR26dF7WUD1jVBt91cMX2AQmZn4tkKg3yEBeehD11ZYB4lv+fhAl
         1ZvPwhY94Pm9BLDaia+wLfrBLjnYwU9tr3OaHeO6KUIJ0aSUtqfcrNaWuJwIf53vrp4Q
         EcostbxnacdsgEKOZxoctXsY3O2sIh5P8RcWbWyj8PUCOFCUUQCOY0lt3rzGxPH3vpEc
         3kCYTjYy6fpk4hsT2g34hyrSj8xbhAimH2sjaHT6sYoYdVoGAofrmSnZAKngoO5o8Lsr
         eNtGkj4Obopd4pe98ik/CKEy+XrmMYfKK/3rAkJRIuvl1Uki5SfcfgBOjPro18NdSiSk
         6k7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MrbAHNDp1Kp3NvQXCAH+L04X9w/Fm09aqfx5l9uGx3s=;
        b=kdDFRLjPBCR8dpDogZOglBl8mhaP882gCvM0hzrzsSvm79Nrs26JCExoAPpcVyzSrC
         7r21XepDNlyAF00umm3EdnURbR7damgUghCiSk/vGLshitK5nRNuXKsTjHcImCaz7ahc
         eKxgLgjn1E3/jCI7Lc37eiov3SDXu0t9IjlCN2vvhUR+DRJYqmRx+/1KtTAAuW70TaUR
         QYF+Aua1CmJPly0UhDujl9b7yXsqxC8V2nvUsS3I+fTqAPYLIyVN4VY4ezPLBoiUa5qg
         GFeVdre38Zp29FLiC1GW+ieDDFS7MGTeaPa/rfQscTLb4GFXS1i+1yBdhki+7sAeXFc4
         toDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Klv69Fyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21si28315794eju.417.2020.01.23.03.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:59:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Klv69Fyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub8q-0001cz-7E
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarr-0005Wb-Ev
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarq-0004FY-8n
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59788
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuarq-0004FS-4Q
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrbAHNDp1Kp3NvQXCAH+L04X9w/Fm09aqfx5l9uGx3s=;
 b=Klv69FyclgySCxLuaCL75E4/UjYqTiBjgkFR9Je+efoPkJW3nPrE81gn/bbH8U19vZWtHA
 wgiojZfXKa2eGjM+dUKD7m3lHk8rotboyjLx8i1u7SJBhXyqWpRBWKol65c1+tyKzYfNQ6
 YyT09F6DCIPb/WojN5Q6Ii5mgWTcNew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-lYYUeoV5OdiVVSM47WW9jg-1; Thu, 23 Jan 2020 06:41:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBCAC107ACC9;
 Thu, 23 Jan 2020 11:41:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B4B10016EB;
 Thu, 23 Jan 2020 11:41:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 20/80] arm/mps2-tz: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:45 +0100
Message-Id: <1579779525-20065-21-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: lYYUeoV5OdiVVSM47WW9jg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iemj9JI8XzyF

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 while at it add check for user supplied RAM size and error
 out if it mismatches board expected value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/mps2-tz.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f8b620b..06dacf6 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -39,6 +39,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -79,7 +80,6 @@ typedef struct {
     MachineState parent;
=20
     ARMSSE iotkit;
-    MemoryRegion psram;
     MemoryRegion ssram[3];
     MemoryRegion ssram1_m;
     MPS2SCC scc;
@@ -388,6 +388,13 @@ static void mps2tz_common_init(MachineState *machine)
         exit(1);
     }
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
                           sizeof(mms->iotkit), mmc->armsse_type);
     iotkitdev =3D DEVICE(&mms->iotkit);
@@ -458,9 +465,7 @@ static void mps2tz_common_init(MachineState *machine)
      * tradeoffs. For QEMU they're all just RAM, though. We arbitrarily
      * call the 16MB our "system memory", as it's the largest lump.
      */
-    memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 16 * MiB);
-    memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
+    memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
=20
     /* The overflow IRQs for all UARTs are ORed together.
      * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
@@ -642,6 +647,7 @@ static void mps2tz_class_init(ObjectClass *oc, void *da=
ta)
=20
     mc->init =3D mps2tz_common_init;
     iic->check =3D mps2_tz_idau_check;
+    mc->default_ram_id =3D "mps.ram";
 }
=20
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -657,6 +663,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, vo=
id *data)
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id =3D 0x41045050;
     mmc->armsse_type =3D TYPE_IOTKIT;
+    mc->default_ram_size =3D 16 * MiB;
 }
=20
 static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
--=20
2.7.4

