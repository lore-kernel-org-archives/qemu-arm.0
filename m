Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp560267lfp;
        Thu, 23 Jan 2020 03:57:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVdKfi6+qRYHfN4KHZ4v/KmCY7q3NUak5pQ+OPogVeyk4VJSedwD15YiW6ILVtHt1WB0KB
X-Received: by 2002:a17:906:6855:: with SMTP id a21mr6460712ejs.11.1579780638868;
        Thu, 23 Jan 2020 03:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780638; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1rN/b4JnpTJcaYBeZNUXh41XKFv7mH9JWMo9KBAHo+aj07mjxAPm3mStfVZOBfxOV
         EZ0mViA1V4g/CrJjc4654cPCLfn9jY+6o9IuB9uiR8fKgPuRE/BQk1VCFecezEb9O/Tt
         ZL8mGvyVduGUd5re55V6BqTuxMlnVXLPMP5PvJry4Bbto9gfUhoYnxgQk5Y8P+T8k8qX
         3B7T5tH6j4X5PKEZWeVhhr4N4XoXehwLmJoVoyP6hfIbcM16o4E2N8myNobjdJdAQceY
         6snigbsgtZ95JcDHQBYCtPdijNtXEeMahSWNRs0QeMoZ0V55Qt8Vor18HOYUzLPJ6bXQ
         TxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V/wrov4O4wn7GL/SGFlz2u8WrJvONHS8pnZqMiaNP7E=;
        b=feB/KCl0Mn/SjYxUxz+43SkjfjfREIZUTlxONSKuq19ooD6toOaRqmYTbdJZ1NY+X+
         sSquN9pdd5GrPJ+r/PQpxKQs3eTdGYZEVRjdDP34DTBv8Kx3vVVTmYIkFxjAHS1zwPe5
         PzTohHXc4PSJ4XG0kVV6bLgliEL9ORnGfdBMTyN3UwdWdVv7xY44w7veNXlUz+f/HUaJ
         CKQb/Fb2ubGJpmnYF65d2jHzF/8TmqcKpNBGNZOfsVksXxScWlFxepVrx1iZSxgiWego
         9ORpE/y9C7S9KrYVeItIky3kSm8mqwkfYSoSjJkArTQIuOXWN+xn+hL/0uLY6a+7KqB0
         EMBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQA8aY74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26si28650647ejc.471.2020.01.23.03.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:57:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQA8aY74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub6r-0007S6-C2
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarv-0005ch-7B
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuaru-0004Hp-2D
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23738
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuart-0004HM-U4
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/wrov4O4wn7GL/SGFlz2u8WrJvONHS8pnZqMiaNP7E=;
 b=RQA8aY74PSIg8IKAfjFvN9yz4vQBh7JtDJUNAeKCjhpiC8e0AalPOxEzLRxCa24qhKvXj/
 YU5nob9FSVlAP6tFZKV3ZN5WFLx6UF3SYGMy3f+xsApOePj0R0GNavQu1H6y5MkPDZqn9F
 dBkr4NtiK+OoCB8mG3tsEp4XC99xjVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-AFK1qEqXPh63efE0MrAX1A-1; Thu, 23 Jan 2020 06:41:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80DC8107ACC4;
 Thu, 23 Jan 2020 11:41:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FA8510842A9;
 Thu, 23 Jan 2020 11:41:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 19/80] arm/mcimx7d-sabre: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:44 +0100
Message-Id: <1579779525-20065-20-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: AFK1qEqXPh63efE0MrAX1A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: andrew.smirnov@gmail.com, peter.maydell@linaro.org, drjones@redhat.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dvtRTvmofKo3

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 remove no longer needed MCIMX7Sabre

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: andrew.smirnov@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/mcimx7d-sabre.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 0d1f62d..de1e264 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -21,15 +21,10 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
=20
-typedef struct {
-    FslIMX7State soc;
-    MemoryRegion ram;
-} MCIMX7Sabre;
-
 static void mcimx7d_sabre_init(MachineState *machine)
 {
     static struct arm_boot_info boot_info;
-    MCIMX7Sabre *s =3D g_new0(MCIMX7Sabre, 1);
+    FslIMX7State *s;
     int i;
=20
     if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
@@ -45,15 +40,12 @@ static void mcimx7d_sabre_init(MachineState *machine)
         .nb_cpus =3D machine->smp.cpus,
     };
=20
-    object_initialize_child(OBJECT(machine), "soc",
-                            &s->soc, sizeof(s->soc),
-                            TYPE_FSL_IMX7, &error_fatal, NULL);
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fat=
al);
+    s =3D FSL_IMX7(object_new(TYPE_FSL_IMX7));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
+    object_property_set_bool(OBJECT(s), true, "realized", &error_fatal);
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram=
",
-                                         machine->ram_size);
-    memory_region_add_subregion(get_system_memory(),
-                                FSL_IMX7_MMDC_ADDR, &s->ram);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_MMDC_ADDR,
+                                machine->ram);
=20
     for (i =3D 0; i < FSL_IMX7_NUM_USDHCS; i++) {
         BusState *bus;
@@ -63,7 +55,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
=20
         di =3D drive_get_next(IF_SD);
         blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
-        bus =3D qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
+        bus =3D qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev =3D qdev_create(bus, TYPE_SD_CARD);
         qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
         object_property_set_bool(OBJECT(carddev), true,
@@ -71,7 +63,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
=20
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu[0], machine, &boot_info);
+        arm_load_kernel(&s->cpu[0], machine, &boot_info);
     }
 }
=20
@@ -80,5 +72,6 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->desc =3D "Freescale i.MX7 DUAL SABRE (Cortex A7)";
     mc->init =3D mcimx7d_sabre_init;
     mc->max_cpus =3D FSL_IMX7_NUM_CPUS;
+    mc->default_ram_id =3D "mcimx7d-sabre.ram";
 }
 DEFINE_MACHINE("mcimx7d-sabre", mcimx7d_sabre_machine_init)
--=20
2.7.4

