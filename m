Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7063124lff;
        Wed, 15 Jan 2020 07:28:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNonjj50OJx+IziO+G5dzPHs39idevbaS67+CY4F1yctr4yP67e5BcIMjO0ou6a++PkQ5b
X-Received: by 2002:a0c:e80e:: with SMTP id y14mr22848447qvn.139.1579102134563;
        Wed, 15 Jan 2020 07:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102134; cv=none;
        d=google.com; s=arc-20160816;
        b=1GZQSMy3lIO6eFgegxSKmikw1AcM3kgpqnEt1+lGYfBOObMcGsu7/zunZW5kRVkeXi
         oTIho19AYSP/ER+qX0rGPh7pPJhU3rPuXuECw/oKAC2klvpB3kR8vEGR6LutFjFjAJcO
         sL4ZlxYz1LuMJkPyZnN62stAsI+S2qv0beQJHY8vAlrDnQHVpIdsj1yfCnluFKxaNZ60
         mt3JcilqONFkaC/vm/ngoTR5n97eGnOZ200Jw0ZeHQbYDfX3p+PqxH4+1Trw7C+rEgOR
         9Mxq9SiuSlZ51VFg9mHvynqGdzH9XPrwOJ0AIhUt13gWjLaxV00ncMuPyzN6tgFY7FlI
         A5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iiEXAdrzwjiPxpq67tHjzLZaWVOBT3FPKLXiRWkpzvM=;
        b=fEYJzbEYDJsUkwVO6L5HTAFtaWr4l7ecmhXpnu/UkhtdOIYMQu2egshnz7a5JacfdY
         OfvVLW4+Eu4WdePjJ03+0cdoQdP2fdteWjSjK3atZaTPb0i21ktw+AffH0Te882s0j/u
         R+fru9hi19rmLFYMXzyJOdkSV0pl2wzpOT3S9kjiiNMcRxm6NTjwzAh6MpV/E/KT0rjo
         YN1g+skZTUXPDVtt8f5DCPFw98qdA0ug0SzzWM1N+iK4pKdnWYY9ukBGEhZqDT6sAxXM
         jFQiI7PR5Fgi5jO7Ry4mq2BdWx0tXQiIMri7ZwuFqhjOwqx9QCGzr89FE1isZRXpUwvJ
         rsJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDlO9I5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si10532749qvo.39.2020.01.15.07.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:28:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDlO9I5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkbF-0001Mf-IT
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKA-0007tF-Nk
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK9-0008GX-Gq
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24977)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK9-0008Fv-Cj
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiEXAdrzwjiPxpq67tHjzLZaWVOBT3FPKLXiRWkpzvM=;
 b=bDlO9I5jWZzfHLCXvdE6xZ5h+lHyEtJ+0biHnvlzHio9T8mZMOE2i1t5sTxto6XqH0qznB
 6iQKBE8sFrJ/vuJJ03YKE1Q+xiv4E+Wt3dD9MSR/oVAhnEMXEx/Zfl3o8/BaJ+lD+tWUF4
 cVs+sldqXw6jKrxZTbEOSW2CEYCTPE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-f2B04zepPpipZAlrF5V3tA-1; Wed, 15 Jan 2020 10:11:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A87E98F73BC;
 Wed, 15 Jan 2020 15:11:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D267119757;
 Wed, 15 Jan 2020 15:11:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/86] arm:omap_sx1: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:41 +0100
Message-Id: <1579100861-73692-27-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: f2B04zepPpipZAlrF5V3tA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xqSfUb2XBWHI

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

CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/omap_sx1.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index be24571..aa1831b 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -102,8 +102,8 @@ static struct arm_boot_info sx1_binfo =3D {
 static void sx1_init(MachineState *machine, const int version)
 {
     struct omap_mpu_state_s *mpu;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *address_space =3D get_system_memory();
-    MemoryRegion *dram =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *cs =3D g_new(MemoryRegion, 4);
     static uint32_t cs0val =3D 0x00213090;
@@ -115,15 +115,19 @@ static void sx1_init(MachineState *machine, const int=
 version)
     uint32_t flash_size =3D flash0_size;
     int be;
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be " RAM_ADDR_UFMT " Bytes"=
,
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
+
     if (version =3D=3D 2) {
         flash_size =3D flash2_size;
     }
=20
-    memory_region_allocate_system_memory(dram, NULL, "omap1.dram",
-                                         sx1_binfo.ram_size);
-    memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, dram);
+    memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, machine->r=
am);
=20
-    mpu =3D omap310_mpu_init(dram, machine->cpu_type);
+    mpu =3D omap310_mpu_init(machine->ram, machine->cpu_type);
=20
     /* External Flash (EMIFS) */
     memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_size,
@@ -223,6 +227,8 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D sx1_init_v2;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("ti925t");
+    mc->default_ram_size =3D sdram_size;
+    mc->default_ram_id =3D "omap1.dram";
 }
=20
 static const TypeInfo sx1_machine_v2_type =3D {
@@ -239,6 +245,8 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D sx1_init_v1;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("ti925t");
+    mc->default_ram_size =3D sdram_size;
+    mc->default_ram_id =3D "omap1.dram";
 }
=20
 static const TypeInfo sx1_machine_v1_type =3D {
--=20
2.7.4

