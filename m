Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7058660lff;
        Wed, 15 Jan 2020 07:25:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSgfinL6CF3tFtJNElwEtjg8qXOJjuCTqIlD/RpgsmRYFj35tE5Gl+U56ntyjSjLc2DLjO
X-Received: by 2002:a05:620a:78a:: with SMTP id 10mr23597269qka.392.1579101907336;
        Wed, 15 Jan 2020 07:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101907; cv=none;
        d=google.com; s=arc-20160816;
        b=qF5yCwZyXXrbQX1BUPQDoOE5Wc8zhjuwZNe5pBqDLWvad/lxn+6vJg3FiJvsao01CC
         dc93kGgRJTzcSsySYPb6y3Ps8b4vChDQxqVi/2pq7Ne7gw58LtJpdBeArhWGKUT1+0dZ
         fTHMmuy4up0AXr8cvLBAZ+BEDuAapz6N7Nk4ghUfi73WKo+74zFjaZ4GMb6GC6eSYWry
         HF7Er/IAUy9ZhDP5dx+Znfbvnq/zmQ9ILCnx/8zO5hFGWHpVCfVgKD0wnjrGlynGXh4i
         stsc1WqDHpoZhtAUZFLiY8sOEAiQgxYYvYN2PAvZJgxyjyxdaacU6+4cfT8OaMtKSXDE
         iu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hDEANZanCM18fCOMPvecURmao9TtpO7YbZwXSr1ItX8=;
        b=r92KZ8axYGez/Lzte9BSkmqyyLWhRm8wxeek3xwV7fLOgM3b2BCph7Co5lx/4mbTdP
         JclzUQ9ZXWoRWIBD/DWQNpRfxx+9pv1noUGw6cIvDYNd2YvVjTtZqQdll56B/jma0MrJ
         YPY77KKHp7AiVj+51qMo6tsMfXFwyjLttsPqhFNu8i8N6/A8PP5Jod/q1+h6f6yVAjE1
         9zF0NqFfFHDxdlHXgzeiNcvk0JsVCuCx8I1yGsrNGjRB4opwQQoppOTD8F+O+atpfxj5
         FP5WHYgi4c3w1NZo8jUIErzieI4nmlVi3yMFCcUQQrl4j0Tg3uPenQSzMpGALTinjZ1l
         MgOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QtKWhGNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si10824793qkf.364.2020.01.15.07.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QtKWhGNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkXa-0003Xc-29
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKA-0007rf-0Q
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK8-0008FW-LR
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22426
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK8-0008FG-Hb
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDEANZanCM18fCOMPvecURmao9TtpO7YbZwXSr1ItX8=;
 b=QtKWhGNAxiVDVs6y6OgEimErqVfHS+2DNQfE/1W8EwNjQVnnht0dXo3/2cGZsYWGKDtH45
 woiFFXa8Us/OgeNRhJuWG9+P5HKxmIAEoJSVr0SxtJCwZdgoaGfq1hLaCatWzQEVS7b31x
 2DoCfno+QlN+Mm4a7+r97pSg7u1gQew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-jmS-KDC8MLqiOq-BZvkI6g-1; Wed, 15 Jan 2020 10:11:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C83711083DF;
 Wed, 15 Jan 2020 15:11:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D82D19757;
 Wed, 15 Jan 2020 15:11:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/86] arm:nseries: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:40 +0100
Message-Id: <1579100861-73692-26-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jmS-KDC8MLqiOq-BZvkI6g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, balrogg@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TTSDyzM+1gwT

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

CC: balrogg@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/nseries.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 3fd196f..f797e69 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -47,7 +47,6 @@
=20
 /* Nokia N8x0 support */
 struct n800_s {
-    MemoryRegion sdram;
     struct omap_mpu_state_s *mpu;
=20
     struct rfbi_chip_s blizzard;
@@ -1311,13 +1310,18 @@ static void n8x0_init(MachineState *machine,
                       struct arm_boot_info *binfo, int model)
 {
     struct n800_s *s =3D (struct n800_s *) g_malloc0(sizeof(*s));
-    uint64_t sdram_size =3D binfo->ram_size;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
=20
-    memory_region_allocate_system_memory(&s->sdram, NULL, "omap2.dram",
-                                         sdram_size);
-    memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE, &s->sd=
ram);
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be " RAM_ADDR_UFMT " Bytes"=
,
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
+
+    memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE,
+                                machine->ram);
=20
-    s->mpu =3D omap2420_mpu_init(&s->sdram, machine->cpu_type);
+    s->mpu =3D omap2420_mpu_init(machine->ram, machine->cpu_type);
=20
     /* Setup peripherals
      *
@@ -1383,9 +1387,8 @@ static void n8x0_init(MachineState *machine,
          *
          * The code above is for loading the `zImage' file from Nokia
          * images.  */
-        load_image_targphys(option_rom[0].name,
-                            OMAP2_Q2_BASE + 0x400000,
-                            sdram_size - 0x400000);
+        load_image_targphys(option_rom[0].name, OMAP2_Q2_BASE + 0x400000,
+                            machine->ram_size - 0x400000);
=20
         n800_setup_nolo_tags(nolo_tags);
         cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
@@ -1395,16 +1398,12 @@ static void n8x0_init(MachineState *machine,
=20
 static struct arm_boot_info n800_binfo =3D {
     .loader_start =3D OMAP2_Q2_BASE,
-    /* Actually two chips of 0x4000000 bytes each */
-    .ram_size =3D 0x08000000,
     .board_id =3D 0x4f7,
     .atag_board =3D n800_atag_setup,
 };
=20
 static struct arm_boot_info n810_binfo =3D {
     .loader_start =3D OMAP2_Q2_BASE,
-    /* Actually two chips of 0x4000000 bytes each */
-    .ram_size =3D 0x08000000,
     /* 0x60c and 0x6bf (WiMAX Edition) have been assigned but are not
      * used by some older versions of the bootloader and 5555 is used
      * instead (including versions that shipped with many devices).  */
@@ -1431,6 +1430,9 @@ static void n800_class_init(ObjectClass *oc, void *da=
ta)
     mc->default_boot_order =3D "";
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm1136-r2");
+    /* Actually two chips of 0x4000000 bytes each */
+    mc->default_ram_size =3D 0x08000000;
+    mc->default_ram_id =3D "omap2.dram";
 }
=20
 static const TypeInfo n800_type =3D {
@@ -1448,6 +1450,9 @@ static void n810_class_init(ObjectClass *oc, void *da=
ta)
     mc->default_boot_order =3D "";
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm1136-r2");
+    /* Actually two chips of 0x4000000 bytes each */
+    mc->default_ram_size =3D 0x08000000;
+    mc->default_ram_id =3D "omap2.dram";
 }
=20
 static const TypeInfo n810_type =3D {
--=20
2.7.4

