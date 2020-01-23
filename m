Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp556264lfp;
        Thu, 23 Jan 2020 03:52:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7yR8VBNVyq/Lg6Ds3t+9XHST1S2V++bn5p5g6EqGGPmp4A75n1/TpjkqXohsdBYBUye8/
X-Received: by 2002:a50:9ee8:: with SMTP id a95mr6234032edf.86.1579780343065;
        Thu, 23 Jan 2020 03:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780343; cv=none;
        d=google.com; s=arc-20160816;
        b=O+DJJjnH/M8FgGbhHjUJnPCY4fvffGJBl8vNSjktmHL6GKiarSnJkSdxWKQEX4gr/2
         IMKc5xvE1MuZwQ0ewuloo+aJccV0WjytcABiQeSk7lASKJZForFUlMFVbnZQ6AE+OXah
         dz61ykJqKiHDyH31Bn9xLquZRa3q+fkhQQ+oB3rnnKGUkaN4wsqSE7X7/KQeYn9EPZ2W
         FVSDyMPOGoKSlf5Gsb/Zy4CGdxYWw49ilrLq80MSJBNwAQQ4ZHHpfcr+DqSYFsUKEXj+
         OaufjA6a+HUygFq+nICmv78m1hhQseVlqF0psHLzTjLCrvxY/3LEljn4NtXHQdAS+t0H
         o6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3xUztHR63kOLcbdpCti3IJHlbfyrDfvYrcrhayDACU0=;
        b=ggCoNS8Ut9KU46xsB9dVurBDDxuffRQ7jBsqVa88z8vrKAW3VJiJaFYonzzCYt/Tsm
         cDvoRJixeLspBGInimdeoI9/44L2uKR9pjbtme7gEnKADHef9Ck2SeegTBB7Iwe+58g0
         yPIRXJFwbUv0OxvkKWaxmanKLgojvwKCJ989pt/xfq7fifnonBGy8MY/JmnWFhqFM779
         GBuR24Uw/xwNsPhRvDROj2i0RHXad8KnMmv9036SCg2tIz6ELS/kI/d58ADl8za3q8L5
         8WM8id8zAv1a0UAb5W3Bos16p2zXDrIdd2tVz07EswGF5/Q7TMlSvJlh5XvfDXYbzove
         W1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fH2w+n5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si28201715ejq.412.2020.01.23.03.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:52:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fH2w+n5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub25-0000mm-Jj
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarw-0005dw-L0
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuaru-0004Hz-Ch
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40605
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuaru-0004Hf-8f
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xUztHR63kOLcbdpCti3IJHlbfyrDfvYrcrhayDACU0=;
 b=fH2w+n5LzOiylzG784QUi+9OB53e8RdHQQ73+8iHwZrx2WeQ+uXc1Z16/mSGf5Ro1BAMLx
 ShbnSO4S7E15212aGEkG5+lNaEetWaSwr+iPiktXogI+k9D+ZE9B6/jmpZsFhjLOhU36Vb
 4T/w5OD1x0g7IenhmhUBXBC80g/zJV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-F15-MwtFNAWZIGKLEFKIXw-1; Thu, 23 Jan 2020 06:41:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEB88010C9;
 Thu, 23 Jan 2020 11:41:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CDCC100164D;
 Thu, 23 Jan 2020 11:41:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 18/80] arm/mcimx6ul-evk: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:43 +0100
Message-Id: <1579779525-20065-19-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: F15-MwtFNAWZIGKLEFKIXw-1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D7pJ2jsvr8Lt

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
CC: drjones@redhat.com
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

