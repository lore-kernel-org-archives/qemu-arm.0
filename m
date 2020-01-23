Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp559922lfp;
        Thu, 23 Jan 2020 03:56:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7HQ1DnbTVOqLDmldQv9zOz61gqG1YKGVTUhRMo7OOP/8RWz/Hzv6qj9SGCucRQFn9HSsA
X-Received: by 2002:a05:6402:797:: with SMTP id d23mr6681964edy.138.1579780612750;
        Thu, 23 Jan 2020 03:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780612; cv=none;
        d=google.com; s=arc-20160816;
        b=0M0IP+U+ii6SFP8nxD3MDMF664IOwMVnmhlKAo17uprAMSRpwHc+nAaNxxZhN/zbbe
         q0d18rb6TSs4Oref6VJh26ok2r3Bl/T2QizJFoenv6ryBv76UuXNuZte/2wtd57UwWNC
         sl8SIItgDMRmIBOjHdT5nAGgOdY6i1Y2YL8vqkqKqbhEZNBQbNO+76pcUGosgaFnm9zV
         nuImTVGwQA8tXg9GWFDIM6geNb+cik3LnZVxrtmZ/6DsWPQzHKkBNjMW2igdfEalpUui
         zYic9eyc8AWx8gaDyBGK8NOcXcsYnJn2wbGLdvwL678AhJG7jkYTJ1Bvd+BQPOv4n961
         eSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8y8D9EhmjB3XxaRrfjVHkrdLSjL3RXOaGcDAKZPCyKs=;
        b=n+9YcLsFmplUaIlKv1T+QlJI4yMu2NLuWDNsNlevHAbusuOrMNIrRBE2RAZHp4uCYr
         T8Gh15H8DUZawAiD/IrSvPjBiyr6XxVJgeeSJRcWBBVzMl/0HOQ5WcB7vl/oYJeB9NVY
         ApSBv9vFPbxE1Rvl1AjuK5RCueh7P/JpjohN5kYJhZFN9GNphSkcUk5gZTg2blo8OM+F
         Hkz9i+YXg8J3LKr+3BTjbTGL2VVNJ9GjR5+hf/y3y4z/cIrxaSesB0YF5KO7R0RZabdg
         bWp9MyaOb0lzNDAzi2rSa1BqDrEjwW21+Kj+h0tCZ/0fNZZo4bQOFjanjq1gONmYBhwT
         B7ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gArgIlEc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si908715eds.28.2020.01.23.03.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gArgIlEc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub6P-0006Oe-PH
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuas1-0005ok-Lt
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuas0-0004LT-9C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:57 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46406
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuas0-0004LJ-5C
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8y8D9EhmjB3XxaRrfjVHkrdLSjL3RXOaGcDAKZPCyKs=;
 b=gArgIlEcLMMojRij1dGmvWU8eUAgLn5M4uxRHS6mE1UJsrepigr/uFOwtQnvp/14JYVitC
 wez+oeI2ax8KpSkIK4usZYAZ/ObtEClwFjlN7tqZN9jUxoibAUoQTJgVv2JxcTGn5ptbPs
 9Lx4L0xJioe60tEaYHYiNo0KC8DUA3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Sw_vEIhgPa-U57wPYpMTOw-1; Thu, 23 Jan 2020 06:41:54 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E83CADBA7;
 Thu, 23 Jan 2020 11:41:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E678D10016E8;
 Thu, 23 Jan 2020 11:41:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 24/80] arm/omap_sx1: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:49 +0100
Message-Id: <1579779525-20065-25-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Sw_vEIhgPa-U57wPYpMTOw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rdvIeU5jlOwG

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
 hw/arm/omap_sx1.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index be24571..2bebab4 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -35,6 +35,7 @@
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
+#include "qemu/cutils.h"
=20
 /*************************************************************************=
****/
 /* Siemens SX1 Cellphone V1 */
@@ -102,8 +103,8 @@ static struct arm_boot_info sx1_binfo =3D {
 static void sx1_init(MachineState *machine, const int version)
 {
     struct omap_mpu_state_s *mpu;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *address_space =3D get_system_memory();
-    MemoryRegion *dram =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *cs =3D g_new(MemoryRegion, 4);
     static uint32_t cs0val =3D 0x00213090;
@@ -115,15 +116,20 @@ static void sx1_init(MachineState *machine, const int=
 version)
     uint32_t flash_size =3D flash0_size;
     int be;
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
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
@@ -223,6 +229,8 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D sx1_init_v2;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("ti925t");
+    mc->default_ram_size =3D sdram_size;
+    mc->default_ram_id =3D "omap1.dram";
 }
=20
 static const TypeInfo sx1_machine_v2_type =3D {
@@ -239,6 +247,8 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, =
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

