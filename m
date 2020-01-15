Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7061906lff;
        Wed, 15 Jan 2020 07:27:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxflFISweNnNCXJIFaz9xI5DxWARXJAiD76STSTKwtSsoHt0joVCcHjXaFS0J26n61eYrWB
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr28470821ejm.305.1579102068990;
        Wed, 15 Jan 2020 07:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102068; cv=none;
        d=google.com; s=arc-20160816;
        b=s2EXOoZaRPcEGOrk4drSNEwWJ8HF5Z0doYUmNT/PrJgx+YFQnn9GOcD4Io3zg/5pMj
         g+AgSdYMG9Llch+JcyrCbFh9vkBE/V1gp5y14s9j0Pke5pYpCCPDEiYVI23Bpw8atjzl
         AasqhikkhuHykhB3O2NDO0o/rk7HNGwc7W32bP+wiR21u99NRUjYJxUN00x+wxfQNfhW
         k2WBQdSYZnmx81d3udRzCnm4pozPIRI+IZyHyE+daigDK4x6wk4rqMp5h3av3BxPHnpV
         ejxDUP1Q5lbb2LknQVTkpA5zWpM21VbfdsbwaxFuCDC9na26eHHoGrGvi0igtFl7CI1g
         E95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=61J64vuDAvyeQzaX6DS9AU5yNodmPost1Jj/GcCddi0=;
        b=C63JL4r7BkVnpatxdyB8/wp9BufiPlZ9HUJsPwgtyLZd2Qv1AINtkn6W2nsqMU/E+Q
         XfD71Pjw0yzgFTDF4160p3/ggOfId4oi3cXOPySXIU3rAsDKuGk0JZyCPd5sMfpCGpDL
         adchFSgWev1L+GOFogT1Xl03QfWtJV89pHdQbjEhh2VXqePPSfV+YY3cB/8JKY5tcuu0
         ZiOG2XJ6in2b03AHqIfeXNN0rtrP+BrRlXsrOkIhvTlVBM1RMq7bkfAKCJRpJ2tqPSee
         wfJqsC2+cFrg9+S1Jcp2dbC0trhPsCHHaXm+x1+PydIspyfbreYmQfd2qpu/L6YE6JVb
         pWVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/ljhicX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si11468349ejv.124.2020.01.15.07.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/ljhicX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkaB-0007VA-I1
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK8-0007pG-So
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK7-0008Eb-KB
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59285
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK7-0008EI-Gt
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61J64vuDAvyeQzaX6DS9AU5yNodmPost1Jj/GcCddi0=;
 b=S/ljhicXi7BETpQxmsfqJ+1eOIfywQIuH/kmVd0avC/P0vzmo3nSONqTp900FFjRCB9pa8
 e/5zPZ9ucJiQJOrm8qfqb3ASTpN05pgiQImOi6dETC81mnhiDCYZhmHy4GmqI6MXMw0No6
 4LZoxDdEZp+wHJ34//ezuwvrnHu2Ex0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-zaHveoMjPmuAwhGsSyMsFQ-1; Wed, 15 Jan 2020 10:11:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475DE8F13F5;
 Wed, 15 Jan 2020 15:11:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B309194B2;
 Wed, 15 Jan 2020 15:11:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/86] arm:musicpal: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:39 +0100
Message-Id: <1579100861-73692-25-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zaHveoMjPmuAwhGsSyMsFQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHT4XZ3DiNxe

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

CC: jan.kiszka@web.de
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/musicpal.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index f68a399..4242c4a 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1589,16 +1589,20 @@ static void musicpal_init(MachineState *machine)
     int i;
     unsigned long flash_size;
     DriveInfo *dinfo;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
+    /* For now we use a fixed - the original - RAM size */
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be " RAM_ADDR_UFMT " Bytes"=
,
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
+
     cpu =3D ARM_CPU(cpu_create(machine->cpu_type));
=20
-    /* For now we use a fixed - the original - RAM size */
-    memory_region_allocate_system_memory(ram, NULL, "musicpal.ram",
-                                         MP_RAM_DEFAULT_SIZE);
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     memory_region_init_ram(sram, NULL, "musicpal.sram", MP_SRAM_SIZE,
                            &error_fatal);
@@ -1714,6 +1718,8 @@ static void musicpal_machine_init(MachineClass *mc)
     mc->init =3D musicpal_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_size =3D MP_RAM_DEFAULT_SIZE;
+    mc->default_ram_id =3D "musicpal.ram";
 }
=20
 DEFINE_MACHINE("musicpal", musicpal_machine_init)
--=20
2.7.4

