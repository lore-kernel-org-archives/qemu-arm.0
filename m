Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7058278lff;
        Wed, 15 Jan 2020 07:24:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1tczfjj52+YOmYcopLPsqJ11jkZbw82yWccQpiJNqwb1IZp7RdR+bFZzzez3T5ZfNoTpM
X-Received: by 2002:ac8:36f5:: with SMTP id b50mr4138351qtc.268.1579101889683;
        Wed, 15 Jan 2020 07:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101889; cv=none;
        d=google.com; s=arc-20160816;
        b=YO60tR7gRP/mwE1D2Q0JJQ6SroJ5CzP5u3ErKWT53CkXRbAu3ooXswqiXRKrQsJ5Ba
         6FwDnzuUbXyXAX/WAJYjY6LP/ilWjcXtyGg5DOj5by5FAutAmWPlpuyywodpQvEx6Lcx
         hOiQVF9c3jmMp0zjFN80mdo2KQlO/6f8CWi1wKdurFTm6pAMroeWWFki/e3j8NTmgEgB
         /rg0K5pZbKsU/ldk9bv9zuLrLfO3LBt7BmpmKJ7xMNTbtOPUwNWMRu2voX/3I+HAfv/x
         8ubTbxsBeSVxMSnvdUWULfiaxljO9Y4m4PopCQ+yiyt/aEDPaQ33SIGWKIC18VU9jZsa
         sdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mjhNeOxzFmw/KojHCMftR2PI3KvB4+7SrYeo68TVYPw=;
        b=KExgiTI7xMKbO82oqivtyq3Q4UnH+6kebxnGyRziyQ0YDFmbhxaikFNCY4MNh81wy7
         8aHagqviMynhHpGlYQ6VeHCqDVDmJ4sStkR+ebi/bxbMd+3TTMV8AhfJtwLGovapHqO0
         6WDKtgRbuayK8M7v/0s3yLjdgs03xlKT8Sn/P1b+BfnZfVMn0nRmN0+92YA9EQFJ2PWl
         thQVW9DGwmdtU2kBmQWIC2G0hl7xM47VxdY8qHw4G7jQtRHn2LJlAxx1mmC7E1uIcDyQ
         murJyU+Rfh5qh9x/tztrQQdmSsyT2FwV3xn1E2xDIWTHABhHFneaHrKo5qS6Uigf8SAI
         vyMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QfIPqUzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si11081099qkm.183.2020.01.15.07.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QfIPqUzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkXI-00036E-WE
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK3-0007fp-Js
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK2-0008Ai-8q
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21006
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK2-0008AE-5C
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjhNeOxzFmw/KojHCMftR2PI3KvB4+7SrYeo68TVYPw=;
 b=QfIPqUzBVdEzKob0GfpFUUQa4lVNAzk7Ot/Cgd5NpBqs4A6gEYaPcoeFsniiWUe9p+Ck00
 JFgwvrj8ITSlF9HEtBtLwkuoonsz+aHXbZ8tPJ/J7EPz4Rb1lxxNQ9JuEjtMXQSSJd0jT1
 qPuB+AGyEumEOtw+ms/WgkmhOsnAn/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-S5NP_bKkN02pxjCvYp_dMw-1; Wed, 15 Jan 2020 10:11:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7201932945;
 Wed, 15 Jan 2020 15:11:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB9B28984;
 Wed, 15 Jan 2020 15:11:00 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/86] arm:mcimx6ul-evk: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:35 +0100
Message-Id: <1579100861-73692-21-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: S5NP_bKkN02pxjCvYp_dMw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptRgimIQF1pR

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
  remove no longer needed MCIMX6ULEVK

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: jcd@tribudubois.net
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/mcimx6ul-evk.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index e90b393..23a71ed 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -19,15 +19,10 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
=20
-typedef struct {
-    FslIMX6ULState soc;
-    MemoryRegion ram;
-} MCIMX6ULEVK;
-
 static void mcimx6ul_evk_init(MachineState *machine)
 {
     static struct arm_boot_info boot_info;
-    MCIMX6ULEVK *s =3D g_new0(MCIMX6ULEVK, 1);
+    FslIMX6ULState *s;
     int i;
=20
     if (machine->ram_size > FSL_IMX6UL_MMDC_SIZE) {
@@ -43,15 +38,12 @@ static void mcimx6ul_evk_init(MachineState *machine)
         .nb_cpus =3D machine->smp.cpus,
     };
=20
-    object_initialize_child(OBJECT(machine), "soc", &s->soc,  sizeof(s->so=
c),
-                            TYPE_FSL_IMX6UL, &error_fatal, NULL);
-
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fat=
al);
+    s =3D FSL_IMX6UL(object_new(TYPE_FSL_IMX6UL));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
+    object_property_set_bool(OBJECT(s), true, "realized", &error_fatal);
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx6ul-evk.ram"=
,
-                                         machine->ram_size);
-    memory_region_add_subregion(get_system_memory(),
-                                FSL_IMX6UL_MMDC_ADDR, &s->ram);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
+                                machine->ram);
=20
     for (i =3D 0; i < FSL_IMX6UL_NUM_USDHCS; i++) {
         BusState *bus;
@@ -61,7 +53,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
=20
         di =3D drive_get_next(IF_SD);
         blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
-        bus =3D qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
+        bus =3D qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev =3D qdev_create(bus, TYPE_SD_CARD);
         qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
         object_property_set_bool(OBJECT(carddev), true,
@@ -69,7 +61,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
=20
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &boot_info);
+        arm_load_kernel(&s->cpu, machine, &boot_info);
     }
 }
=20
@@ -78,5 +70,6 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
     mc->desc =3D "Freescale i.MX6UL Evaluation Kit (Cortex A7)";
     mc->init =3D mcimx6ul_evk_init;
     mc->max_cpus =3D FSL_IMX6UL_NUM_CPUS;
+    mc->default_ram_id =3D "mcimx6ul-evk.ram";
 }
 DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)
--=20
2.7.4

