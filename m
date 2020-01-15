Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7063080lff;
        Wed, 15 Jan 2020 07:28:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyZ0vQi0aKTC5Sdp6IodhdclHtJbt837T89lvwTan7tnYGams4Thn8lvOTl/pMgtKRLqA0
X-Received: by 2002:aed:3fce:: with SMTP id w14mr4288611qth.0.1579102131920;
        Wed, 15 Jan 2020 07:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102131; cv=none;
        d=google.com; s=arc-20160816;
        b=U/EnLnbenPzfLSFkv5g8wflSVIjGavxeCxMon+JWNkHhA7IBnycrSf+8bW6xgB3bRF
         ZZ9P20/0vwbtN7NjrrKzT1kxXaSkGAxU23UJBh/lUFwAEuGjPy6Ozkzko2rQIHRNA1Au
         P6IKUOeUMQDET9QDkdgi2LyKj3fUyhBAgSIM5j/gUNdrMeStn4Aam10Mv9o1EbUkCcE+
         vInRPGKLvqc3hyD+W5a2Kx+Mcbq/k8oJ4QpBQN2XzfHmDCe9HOyZDKsTnRReBVcT6diQ
         eU9iuKsPXov755oz0L/p0ymLpl8l4T6KJ2KH5XMNAcxUVtjEciH0hvjwxAkGmFVKuprs
         /1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YtRixZyMNmJYO/GV/o6RNrIXM6zEc5jMhQzXa13JNIs=;
        b=uVuLI7mAzNr1w7rqhQ9Lf9P9YGHSOires3j+B7gwnLKA8dJry+MfjFXQb7nOdNCeic
         S6qsOySafQGsmeMXLM3fVJlW7RsM3stdYQ1jD9/ll7unRFG9zTyuWIv/JU0CRfscRsf+
         bXruGTtmyPBHmrsorgSltKu8xsYHTXzjnbFEjAiL6Svlxg9GxPOKRmFx35mBKRfyzelN
         TnAsQUfqNQTqupnItEevR0FugDJAxXbYbNBUXAO79pEKmFLUEsM+VB10uIHfTSoccQoI
         wTOO7nFi1rCi/DbdCr2TmppSsrZVlye2LIP2kgkmPx83emRb59pobm/jW0JJkRB+Q7yz
         nwug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AI2wFcGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i49si10908821qte.223.2020.01.15.07.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AI2wFcGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkbC-0001Iv-Pq
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKD-0007zw-Sx
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKC-0008KL-Jb
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKC-0008Jz-Et
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtRixZyMNmJYO/GV/o6RNrIXM6zEc5jMhQzXa13JNIs=;
 b=AI2wFcGaLpbT94S3/+DLkuRjh0GevnZMwJZ0VQL6Z4cG8Lnqe06JFSihZw8FO9yt4ll6Oh
 R6hhCrR4Wv4SoMoj+9XxtXSMyA9cb1R/BI0QnSyTtrK0aMRKfZaCZk5cI5UZSgtylN14Xy
 nSWp1cPWaXOOOanrhzSUI5W7NaqTUwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176--be1hCcYObCLy_-WRnb9Rg-1; Wed, 15 Jan 2020 10:11:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A439B8FD40F;
 Wed, 15 Jan 2020 15:11:11 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4058B196AE;
 Wed, 15 Jan 2020 15:11:10 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/86] arm:raspi: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:43 +0100
Message-Id: <1579100861-73692-29-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -be1hCcYObCLy_-WRnb9Rg-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D8CNOivKhvyj

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 remove no longer needed RasPiState

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Andrew.Baumann@microsoft.com
CC: philmd@redhat.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/raspi.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6a510aa..33ace66 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -32,11 +32,6 @@
 /* Table of Linux board IDs for different Pi versions */
 static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3] =
=3D 0xc44};
=20
-typedef struct RasPiState {
-    BCM283XState soc;
-    MemoryRegion ram;
-} RasPiState;
-
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] =3D {
@@ -166,7 +161,7 @@ static void setup_boot(MachineState *machine, int versi=
on, size_t ram_size)
=20
 static void raspi_init(MachineState *machine, int version)
 {
-    RasPiState *s =3D g_new0(RasPiState, 1);
+    Object *soc;
     uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
@@ -179,30 +174,26 @@ static void raspi_init(MachineState *machine, int ver=
sion)
         exit(1);
     }
=20
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
-                            version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836=
,
-                            &error_abort, NULL);
+    soc =3D object_new(version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
+    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal);
=20
-    /* Allocate and map RAM */
-    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-                                         machine->ram_size);
     /* FIXME: Remove when we have custom CPU address space support */
-    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0=
);
+    memory_region_add_subregion_overlap(get_system_memory(), 0,
+                                        machine->ram, 0);
=20
     /* Setup the SOC */
-    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram)=
,
+    object_property_add_const_link(soc, "ram", OBJECT(machine->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&s->soc), machine->smp.cpus, "enabled-c=
pus",
+    object_property_set_int(soc, machine->smp.cpus, "enabled-cpus",
                             &error_abort);
     int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;
-    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-                            &error_abort);
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abo=
rt);
+    object_property_set_int(soc, board_rev, "board-rev", &error_abort);
+    object_property_set_bool(soc, true, "realized", &error_abort);
=20
     /* Create and plug in the SD cards */
     di =3D drive_get_next(IF_SD);
     blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
-    bus =3D qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
+    bus =3D qdev_get_child_bus(DEVICE(soc), "sd-bus");
     if (bus =3D=3D NULL) {
         error_report("No SD bus found in SOC object");
         exit(1);
@@ -211,8 +202,7 @@ static void raspi_init(MachineState *machine, int versi=
on)
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fat=
al);
=20
-    vcram_size =3D object_property_get_uint(OBJECT(&s->soc), "vcram-size",
-                                          &error_abort);
+    vcram_size =3D object_property_get_uint(soc, "vcram-size", &error_abor=
t);
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
=20
@@ -233,6 +223,7 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->min_cpus =3D BCM283X_NCPUS;
     mc->default_cpus =3D BCM283X_NCPUS;
     mc->default_ram_size =3D 1 * GiB;
+    mc->default_ram_id =3D "ram";
     mc->ignore_memory_transaction_failures =3D true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
@@ -255,6 +246,7 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->min_cpus =3D BCM283X_NCPUS;
     mc->default_cpus =3D BCM283X_NCPUS;
     mc->default_ram_size =3D 1 * GiB;
+    mc->default_ram_id =3D "ram";
 }
 DEFINE_MACHINE("raspi3", raspi3_machine_init)
 #endif
--=20
2.7.4

