Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7049635lff;
        Wed, 15 Jan 2020 07:18:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2Md2YeoS3bcyVEr+a/sRXUx4jOYydltPMI2Ty53ZqgHrcxJVnI3RNB6xGO80DTOTwNQVv
X-Received: by 2002:a17:906:ad93:: with SMTP id la19mr29040914ejb.54.1579101485207;
        Wed, 15 Jan 2020 07:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101485; cv=none;
        d=google.com; s=arc-20160816;
        b=E77201yBl5vO/rjj4W62XE4PwHev9p23N5H/k676Zj5odDAbqL0Hz/K2thRYMcZgbG
         ZaSmCnY49nAhwvRRae6QZ0xLnzlkDnIihszAlo8/Ipcm1pBg5wXeckaIutAuS/AorQqc
         LODCOw2ZN2Rpr0twVvmYPMiNvy3Udx+k/gASJqXV/3HN2cgqDvDVIB5rYi5NJnL2uH+D
         +kLYN4qgioFyfT4GSRGeOb8wEj9Cw1xcMc98HLNUNxgv5gBZ2CsYccwEn8my8TgsJRhc
         dqhd2Hh05CdCzpLFfpIapb6oVGVNn6rc+BVXkK8WF8j4cCQT9iH+qb6ksdkrvseByzVX
         N53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LTrBzTc2TMtid2u0PggUbIze7d3VHHkRtmTLCmvzIMs=;
        b=cT8fV74yZQbTTnrRQsBJSPf0JAP6wOYz5/iN8ckcNw0vcNg49mNOyQaRyzmsz1+X9J
         bxdGAsObqA+C54TXiW0S/EEFahXQiKs7tR8rPUJUclc3CgH2IOrypTK1Ao1lIa5C5E+F
         zRrmDZCbPx/hWOHu/pa+TSK/d1MGcd1P23BiQOTd2DEMIBlzzOypYGR2TPx1qujbWeD7
         28O5+4OzIj04+WY+oBYI4L3RdtL+P2AtMPg6TVNyJj199zNBcJqsZt3C2jGj0yntKfAa
         bAyY2By2Z0GdQz3BsgtAReejFYuqPNfGtEt9aqJHwfwmrG+znaJhuPXHROnp/O5Xu89c
         mNxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YK/UH4nP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si12164215eje.13.2020.01.15.07.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YK/UH4nP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkQl-0000u8-Gh
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJy-0007Wf-BX
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJu-00083U-22
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49410
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJt-00083B-Uc
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTrBzTc2TMtid2u0PggUbIze7d3VHHkRtmTLCmvzIMs=;
 b=YK/UH4nPIhEmShQlYvQM5cv/e36hn1c0nOxDDxx6wLtQbbSeR9MRc+JqxwwVX7PReDT8pL
 /sAFUMcBx8rSnRNnbJUuz9DBYwIgSmMEinGItHQ1szEJVp2POAdXswoXgD6l80zMoJB0lT
 fX+lMWSdf+IS8U3/vDQMYmjM66B9ODg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-oRx6S2yaOW25-L_PhSIg2w-1; Wed, 15 Jan 2020 10:10:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EA78DBF10;
 Wed, 15 Jan 2020 15:10:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3945473D9;
 Wed, 15 Jan 2020 15:10:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/86] arm:highbank: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:29 +0100
Message-Id: <1579100861-73692-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: oRx6S2yaOW25-L_PhSIg2w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IrQQzT3/2/c7

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: robh@kernel.org
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/highbank.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 518d935..ac9de94 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -236,7 +236,6 @@ enum cxmachines {
  */
 static void calxeda_init(MachineState *machine, enum cxmachines machine_id=
)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     DeviceState *dev =3D NULL;
     SysBusDevice *busdev;
     qemu_irq pic[128];
@@ -247,7 +246,6 @@ static void calxeda_init(MachineState *machine, enum cx=
machines machine_id)
     qemu_irq cpu_virq[4];
     qemu_irq cpu_vfiq[4];
     MemoryRegion *sysram;
-    MemoryRegion *dram;
     MemoryRegion *sysmem;
     char *sysboot_filename;
=20
@@ -290,10 +288,8 @@ static void calxeda_init(MachineState *machine, enum c=
xmachines machine_id)
     }
=20
     sysmem =3D get_system_memory();
-    dram =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(dram, NULL, "highbank.dram", ram_=
size);
     /* SDRAM at address zero.  */
-    memory_region_add_subregion(sysmem, 0, dram);
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     sysram =3D g_new(MemoryRegion, 1);
     memory_region_init_ram(sysram, NULL, "highbank.sysram", 0x8000,
@@ -387,7 +383,7 @@ static void calxeda_init(MachineState *machine, enum cx=
machines machine_id)
=20
     /* TODO create and connect IDE devices for ide_drive_get() */
=20
-    highbank_binfo.ram_size =3D ram_size;
+    highbank_binfo.ram_size =3D machine->ram_size;
     /* highbank requires a dtb in order to boot, and the dtb will override
      * the board ID. The following value is ignored, so set it to -1 to be
      * clear that the value is meaningless.
@@ -430,6 +426,7 @@ static void highbank_class_init(ObjectClass *oc, void *=
data)
     mc->units_per_default_bus =3D 1;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "highbank.dram";
 }
=20
 static const TypeInfo highbank_type =3D {
@@ -448,6 +445,7 @@ static void midway_class_init(ObjectClass *oc, void *da=
ta)
     mc->units_per_default_bus =3D 1;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "highbank.dram";
 }
=20
 static const TypeInfo midway_type =3D {
--=20
2.7.4

