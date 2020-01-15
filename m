Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7059334lff;
        Wed, 15 Jan 2020 07:25:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpMb+aDNv6oMQE/JRKdmo4P4Jjl/QBD1z0L0SChMQs8tgUK6VOzhJZBK1sedfvjdD8ICdo
X-Received: by 2002:ae9:ea08:: with SMTP id f8mr26187018qkg.489.1579101936452;
        Wed, 15 Jan 2020 07:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101936; cv=none;
        d=google.com; s=arc-20160816;
        b=kmFMI/W1520GGhGV+IHA/2k5uZ8IAzZEspxoK7xreD22hIDy5Mk+w9gmM1gnDtTqoK
         azekbtw+hgVw89UeQi8yRX1+ylNijfcRbHq8gR+9hRr1j2b3YGnvovqOsvqhgvNOkQNW
         kOYkX15WeyMJJWHMsHCb9Qay2RIfXLFFvmXEQ2ppl3zQpcDIaX5j//uWFVIE7moygEF6
         7xFomFoP/2vRA9P4OOj+THXFuXxP1AzJXptEv7+iZ/1ZVBbQTVfQJ+5+T/pWuZAu+T3E
         SpbWLx10N9rz78X68d9gAV1GrBKvMdZzT/jraNqB+ofQaUnoxmeJOwda8c6nUBd77dPS
         0nDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WGir6q82slFOjFYnkUiU9sNv5trsbaAGmoJhvyA1yqo=;
        b=mAbEbS4gn4ilp0TVwu9t5wizJwtPWCclOj1unLmcc9wok8zbyPKVBELh4AkJPT4qpb
         ps3R3MSCayHrc6Yxa7dQHScJOVnJ5RYiA32IKVjgqucAhPagS+BSKtYH6eL5EPeSg+CJ
         Js/bnjAtv9uNqGZHs8kPTCDzKTDnMJ6Z2S0GrLpczru4R1UB1lU4PyZ9WZSrjZtdV6tO
         Nhe9Gg7MJ4IHJte3yHgJCRGVNHhCoHL/0MG3UmAbUBZiXpvFqXq3bTzttqn0cNj4YWUM
         4SaqLba/Oa3SlocQrJKtBIN1oLcU1PvbxUPEl6nwWWY+hBZa6vr69EIDcCaQoe2yIGOz
         vl8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dIikPrFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si10624006qvv.210.2020.01.15.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dIikPrFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkY3-0004Ju-9n
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJz-0007Z0-Jq
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJy-000858-7e
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45379
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJy-00083y-1i
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGir6q82slFOjFYnkUiU9sNv5trsbaAGmoJhvyA1yqo=;
 b=dIikPrFWhGq5Y5F46wjCpWc3O4Y+MUtn7pmvNAj5t4CFImCeJPf+E1xPI6HQtyD7qpxSpY
 61H7+dRrGDlgLVceXlz6McUO0ZHYxDjPJpld8R4cnis6vzrm9tcdqdyXHrqn3Mku46UI5E
 H8C49gyQnmURviFVn5R2Gv0KxXy7pEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-oaXu1JnUMSy_u25b0yjgUw-1; Wed, 15 Jan 2020 10:10:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCC758E4DA0;
 Wed, 15 Jan 2020 15:10:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5FA819757;
 Wed, 15 Jan 2020 15:10:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/86] arm:imx25_pdk: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:31 +0100
Message-Id: <1579100861-73692-17-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: oaXu1JnUMSy_u25b0yjgUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: Gd7xGc/pSWj2

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
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

