Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp552451lfp;
        Thu, 23 Jan 2020 03:47:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwl5+mE8W/00wPvdc+Nglu6pOogXEimUaOo+PDHE3TOY8jKkt8J4eenGY2EkMvqDvzHJuT2
X-Received: by 2002:aa7:d50e:: with SMTP id y14mr6520452edq.265.1579780070485;
        Thu, 23 Jan 2020 03:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780070; cv=none;
        d=google.com; s=arc-20160816;
        b=d2DzwPEEhTln2+Voxxjkx5Am4NmvfYwUS7nbNwyl7OLa9tVODWTqH4yK45Mzbt2rz8
         z/QdDOWHACA9i60gUpg4ZMbN9eZIaqkvLCBIgq6tIw/MPTiWmTKYdfMuWBrMd9M6ccs0
         Ec+Vi3fQbCN0f9HUbJQ8aTeBGFrMWAaUfI8XEvIQe+y490jIfxMnyyt+dCmC97VbSO0u
         j5Up+WzFxvZs/X9lM5OsQtkJsU1R5SgLrwW8YBRlG1qtzRCwEvR7GOWFnr0P4R9uzWFv
         pFfW3nUFtcXOAoA/93aO8EbteSVAszj8AVEyC7PR/TOJaq4pOHgW33bpiKLhiR5Nz/eV
         eCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pNKaRhvwcPNdcC2PK7VmvTFNa0mZzHAVa1ykXY9Pd5U=;
        b=yuNoKVicCsJSKtlvwPhOGbXEstisvR5hozXNv4Y4M2Q9pzWEkzwHD+YYdCnU1bPCOl
         BeINc8zC8smPR+YSoM8GMt+Y837L/wZTjeyKTFis+8bYsvCh4AzBocKsDCHf4oAKlx86
         txk4DL4JnnnZ1JWYVDzUOsG2VSxjBJU5/FIiE1qOa2xBFUvGDfHzBpiuKxr+T5c59JYX
         45INSqXDvLE+7c1Z9lfPRxmG64ZQ5e+5MLUwUBpRZBgwI/L54dlT9QKC5OyUdk5JnclK
         sWDoPStZ1cuypgtOTMCrqIU/3jO/PmQcWNUq2pC4yrD3WBeKj4DfXnmzLuN4YRFR0SaE
         lD5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DrxFDqmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id df26si1077058edb.393.2020.01.23.03.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DrxFDqmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuaxg-0004Sk-Ts
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarh-0005HF-UC
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarg-000461-Qh
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:37 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24123
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuarg-00045w-OD
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNKaRhvwcPNdcC2PK7VmvTFNa0mZzHAVa1ykXY9Pd5U=;
 b=DrxFDqmt6pBg8HAsz+XOgem8dwqXkb93fpHTskKYVhGO7bc5/V402YJgc98xFvkT1u6QbC
 OfhtbXBhuiFmVcYk2KpAbq/yJYUGfX97errmCwZlmLTPtka0NOzAEVb2ZHRhql19Q+ImFR
 hOmSCYvjx0zECXriQQNeRe1z9A+EafI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-bQ3XtN_WOtyBzpzIACJXxA-1; Thu, 23 Jan 2020 06:41:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB8B88010F0;
 Thu, 23 Jan 2020 11:41:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87599100164D;
 Thu, 23 Jan 2020 11:41:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 14/80] arm/imx25_pdk: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:39 +0100
Message-Id: <1579779525-20065-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: bQ3XtN_WOtyBzpzIACJXxA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hRo3XdYPbVwv

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
CC: jcd@tribudubois.net
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/imx25_pdk.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index a2b7b35..9087fcb 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -58,7 +58,6 @@
=20
 typedef struct IMX25PDK {
     FslIMX25State soc;
-    MemoryRegion ram;
     MemoryRegion ram_alias;
 } IMX25PDK;
=20
@@ -84,10 +83,8 @@ static void imx25_pdk_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_SDRAM0_ADDR=
,
-                                &s->ram);
+                                machine->ram);
=20
     /* initialize the alias memory if any */
     for (i =3D 0, ram_size =3D machine->ram_size, alias_offset =3D 0;
@@ -107,7 +104,8 @@ static void imx25_pdk_init(MachineState *machine)
=20
         if (size < ram[i].size) {
             memory_region_init_alias(&s->ram_alias, NULL, "ram.alias",
-                                     &s->ram, alias_offset, ram[i].size - =
size);
+                                     machine->ram,
+                                     alias_offset, ram[i].size - size);
             memory_region_add_subregion(get_system_memory(),
                                         ram[i].addr + size, &s->ram_alias)=
;
         }
@@ -135,6 +133,7 @@ static void imx25_pdk_machine_init(MachineClass *mc)
     mc->desc =3D "ARM i.MX25 PDK board (ARM926)";
     mc->init =3D imx25_pdk_init;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "imx25.ram";
 }
=20
 DEFINE_MACHINE("imx25-pdk", imx25_pdk_machine_init)
--=20
2.7.4

