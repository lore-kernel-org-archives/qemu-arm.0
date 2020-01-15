Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7062805lff;
        Wed, 15 Jan 2020 07:28:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3B4Fo/ZW4pcomNfgaV5S1RBLR9fctjuh9Pa3HvhB8eXd/dQdmgMw3lhSOybsIrxnjO8U0
X-Received: by 2002:a37:a953:: with SMTP id s80mr23249559qke.81.1579102116114;
        Wed, 15 Jan 2020 07:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102116; cv=none;
        d=google.com; s=arc-20160816;
        b=PivvvhgIJdqX5hJ5b0gBoUeEiqvxqlEnPkOje558nJuJws6M5AvPq3X8CcMWyyEsT2
         N6niM6oH7inhkhhGR/HqpkIP9tNWTLsh2nX9/qF1V1P9l6+nPnAuzdlzJOGmrsr4PfRq
         HhKr2bXrNTZiq43kyCrHtY+3Ath1h4lKKQuyanubvcT04I6rsLcSmfbd0JNMw4jMiTDn
         JETjXqOhvH4q2eAt7Zbh9cM45gEIfJ2GcaGzuN/S6+oAwREWhQwrm8fPUF3E9EN46wBh
         Uq0FFFHVJ8pPNnHryYoUzLCOlHfB/I6SImrajbvff7VEvmM9/JDSoGsBnF3aAJBVEONV
         2Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4FqwaN6O6lywVVDJ6ZH/e88v63Xf1y3pfwE5yxDo6jw=;
        b=ZDBcODXqPRhvKSSqiStExuwxYuC9ljoNh7Ef0N10a7TW4U1lNPwacLlrPJzCRt7/MK
         nu7PsahGJAAGd0zNyhepCs0MrIgsaqzDlKEWdaTR5L8r/g3Lh9FM3+98Y0eS575xRz7F
         pL7s7kgEGCRwat28THPJMXPz6y5bqzsHiQfnvmRP3qdzw0/mJogThMl42alb5kciTBL/
         BIZ8ZHZLYAaEpK4USdQ/EihgOVGPyZQEtlA6Kr0LGkoUp6Xu8DAP/sUUql2ZS7CfCcRy
         YHwiG3G6AVMWx6Z4SnNhP2CE3YFC0NFTegkjndXRhdZqpx704/34fK2HOfavEfQlTgPh
         9iwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zw6Cg+hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si10950499qtp.51.2020.01.15.07.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zw6Cg+hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkax-0000x0-FD
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK9-0007r1-Ov
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK4-0008Ce-L3
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38495
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK4-0008CE-Gm
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FqwaN6O6lywVVDJ6ZH/e88v63Xf1y3pfwE5yxDo6jw=;
 b=Zw6Cg+hwgvSEy1SIUedvfcBqUTzPIwvfomNwXXmr6I/2GCFVwN+PnI4MzVJ8sU26Yw0ZHv
 1LFVDMs038tGZ4kZ72DevIA7xvIHP48Q14FoXqvWa4s5eqm0dbYCDsMiT7luhJG9pZB8Bn
 AZMs9GKTelxDMLgBt+l+qP4hRyo+t4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-E00zJlLAOkOs1mpk5FoCGg-1; Wed, 15 Jan 2020 10:11:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA3E48DC638;
 Wed, 15 Jan 2020 15:11:03 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 013C1196AE;
 Wed, 15 Jan 2020 15:11:02 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/86] arm:mps2-tz: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:37 +0100
Message-Id: <1579100861-73692-23-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: E00zJlLAOkOs1mpk5FoCGg-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJFFEdtdEtyH

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
 hw/arm/mps2-tz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f8b620b..ac03142 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -79,7 +79,6 @@ typedef struct {
     MachineState parent;
=20
     ARMSSE iotkit;
-    MemoryRegion psram;
     MemoryRegion ssram[3];
     MemoryRegion ssram1_m;
     MPS2SCC scc;
@@ -388,6 +387,12 @@ static void mps2tz_common_init(MachineState *machine)
         exit(1);
     }
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be " RAM_ADDR_UFMT " Bytes"=
,
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
+
     sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
                           sizeof(mms->iotkit), mmc->armsse_type);
     iotkitdev =3D DEVICE(&mms->iotkit);
@@ -458,9 +463,7 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -642,6 +645,7 @@ static void mps2tz_class_init(ObjectClass *oc, void *da=
ta)
=20
     mc->init =3D mps2tz_common_init;
     iic->check =3D mps2_tz_idau_check;
+    mc->default_ram_id =3D "mps.ram";
 }
=20
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -657,6 +661,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, vo=
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

