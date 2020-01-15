Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7052238lff;
        Wed, 15 Jan 2020 07:20:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOjNsVzGaXhU4xiSwRhINb6As73fBgcn1S0P606B6wVez61Sstw38d/XS90hWPhyvE7/J+
X-Received: by 2002:a17:906:3046:: with SMTP id d6mr9488146ejd.329.1579101612634;
        Wed, 15 Jan 2020 07:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101612; cv=none;
        d=google.com; s=arc-20160816;
        b=hd25LXhDMStx+emVKNdYFZBEwVM9vJmXkw+w006e14XGvr/uuPoM6VBw+wU+3whu8U
         3IThPv78PRZOhQuC/UIZd6Iz5+hEsHukfefRU8EIknd01MENvj9oX8JC79Cz+4o+6Tit
         QIB/lryTvsHiOKM2EI4wuzqAvPATdtAY7K7ri600pYbMRqNV6adAQkPiuyqBg4babA51
         cakpaLmLMthXF8zpO4rsFsof+z/8RWjzWupVVfoO8w4EERcdthUcn/qft6oBn8cBQ1Vg
         DCyK7Cg2MlkmvbeTePUU7gQuT8pWzuUmwuT6HHrql2Pmih8u0kqXh5joNcw+aq3eIlTZ
         NmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mTuMoXmoMaCPb4eB1ejoUR1uYIcyvf+72g20PKYllXE=;
        b=kjmgEK+B0U/xyUDZzOhYL1sZRQkuCLr1es2cNOU2twvdaGfLNZl45xH+qjhmF1ewZu
         OnjQwJxKZEDajJK5uQeSBrtjOI+wmKU/z4M52MtbTEo83CFk9YnBkavBvOUGAjrfAeZ5
         5tRgnMw2Dt1y0ZiWdQlpkUWrLcO7FLKPegE/Qa3GHSBP4SyYdtes+3/nt5Zl/mptSlZQ
         iTM/KFOdb/VYDZBw/Ehyzw++ZctXzzQHx+re3OLNXLJpkIqeliZaN2PY6fi/OubdBh+f
         bysz0Tu4W9ikvQO0I0WHuvVi3tifF1d8L2jNK1943FN3Pqsm1xKE5EOvcsFhnm15rabC
         TZ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tv9eJ3zQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si11964568edv.243.2020.01.15.07.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tv9eJ3zQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkSo-00031v-Rk
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJz-0007ZF-ML
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJy-00085J-9u
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50278
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJy-000847-5a
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTuMoXmoMaCPb4eB1ejoUR1uYIcyvf+72g20PKYllXE=;
 b=Tv9eJ3zQb+way+Rv/palTkQjuYTTqIM2luXiwxStN6PRPCpAVV5UyKyqbxWJxXIedy9mM0
 NeV8Aq3dYZzurf6tq4qNz4YS2L49F3IfeeMDPzRkH8aCeDwZq/45OgkCur7BiSruvAxuMI
 IciCep1kUJ2SPBQAeqZayP7JzwBgaC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-ueF_zfzeNfiarOfskqZWcA-1; Wed, 15 Jan 2020 10:10:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9003C10CA9EB;
 Wed, 15 Jan 2020 15:10:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3216619757;
 Wed, 15 Jan 2020 15:10:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/86] arm:integratorcp: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:32 +0100
Message-Id: <1579100861-73692-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ueF_zfzeNfiarOfskqZWcA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hK2VfACLCvAb

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.chubb@nicta.com.au
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/integratorcp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 5249708..89c223b 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -585,7 +585,6 @@ static void integratorcp_init(MachineState *machine)
     Object *cpuobj;
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ram_alias =3D g_new(MemoryRegion, 1);
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
@@ -605,14 +604,13 @@ static void integratorcp_init(MachineState *machine)
=20
     cpu =3D ARM_CPU(cpuobj);
=20
-    memory_region_allocate_system_memory(ram, NULL, "integrator.ram",
-                                         ram_size);
     /* ??? On a real system the first 1Mb is mapped as SSRAM or boot flash=
.  */
     /* ??? RAM should repeat to fill physical memory space.  */
     /* SDRAM at address zero*/
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
     /* And again at address 0x80000000 */
-    memory_region_init_alias(ram_alias, NULL, "ram.alias", ram, 0, ram_siz=
e);
+    memory_region_init_alias(ram_alias, NULL, "ram.alias", machine->ram,
+                             0, ram_size);
     memory_region_add_subregion(address_space_mem, 0x80000000, ram_alias);
=20
     dev =3D qdev_create(NULL, TYPE_INTEGRATOR_CM);
@@ -660,6 +658,7 @@ static void integratorcp_machine_init(MachineClass *mc)
     mc->init =3D integratorcp_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_id =3D "integrator.ram";
 }
=20
 DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
--=20
2.7.4

