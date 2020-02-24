Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp797850lfg;
        Mon, 24 Feb 2020 13:27:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0PShRWDQDgjpX1GV8oxdxZuDpU1nh4YArm0WktLwP+RQJ+QcS+2XwFbo3CBKjzR+QrVs2
X-Received: by 2002:aed:3841:: with SMTP id j59mr50402432qte.220.1582579626629;
        Mon, 24 Feb 2020 13:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579626; cv=none;
        d=google.com; s=arc-20160816;
        b=D4ciEELkE0lUqlHNB/LwwxXVK6fdg+N2D+TqsjdZ+ytusnhcuu6nbOaV9kDWNwy+/q
         4nz1JxRJHJ3ldk2xxaouOJ4od+UWcLGtQFSiABYUfGNG2V60Yj6u+g/1yjQRiZVEHJ0m
         46eGzTrwqYB8D2oNkqwd7xI4OFelFyGiMBiVs1iLCirl63Je+4CbmL+lqONYEYJJaaN2
         aXK7rBsIYHc3k6yc98j9+Au/N3xyLR0Om/+cVM768b9Uik/PShj6Di48j3Nxg+Wer2Sb
         ylGgiC9TvsETS7wXe7tfy8C8DsqS1B+l3RAfwu96hWZeRCljaxuDItr6Imc9daWSnuat
         LArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lSVtvfrX1T1hW1+GelbNbTHoIYbtGWi72bTWri8Gs/8=;
        b=Lx4lcx6Dq9WsEWbDTJIDGwyQ26E/nqvEpF+Leoa2KKpMEazgznhtpsNhBETc2rg1zw
         fOVTqW6/kaWveuKBcaPVU2mn2I9Dp01psphM3861dXzFN4pQVdln013LxukH6FavOAzg
         VyeA9MTzm/9V2aybrH3d5/Xod9+DAEuMCNM6O9V0zTUmy0XvIdeJWa72Z6rahe4PTrsF
         MCc/DNcb7xiXXlIZv3evb+jNLDWeptOKMV6WCYocUE0JqlPxw8NL3Si1FcU5K0tXI+hX
         hKNmZjWaUQERz8E4kW56HToqBc5ZaCpeHYLILWnQdm05gIp7ckz3oQgH3BdAlZ0QNJQg
         N/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XSBCnjIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si6296365qto.69.2020.02.24.13.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:27:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XSBCnjIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LFp-0000J1-2j
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KpR-00049X-Po
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KpP-0006DN-SZ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42472
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KpP-0006Cv-Ml
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSVtvfrX1T1hW1+GelbNbTHoIYbtGWi72bTWri8Gs/8=;
 b=XSBCnjIyEIp9IlPSCn6Sz8L+ECXAxZfbt0LRLc5Uf9Ir8uQatXufNndjF1T48QGSaNbiYv
 19VmFHV/s+lNxRQjbM74rL3dm7y3YbADYdeZ3FfJxIGmwQacHg5TEUc56XrUNAJKwSCiua
 pU5POEzX6FddBS/K18+yVToJUeoBAFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-21bPmpMIOFiU2zTeKeBseA-1; Mon, 24 Feb 2020 15:59:45 -0500
X-MC-Unique: 21bPmpMIOFiU2zTeKeBseA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD12107ACC4;
 Mon, 24 Feb 2020 20:59:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E005C21B;
 Mon, 24 Feb 2020 20:59:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 16/32] hw/arm/stm32: Use memory_region_init_rom()
 with read-only regions
Date: Mon, 24 Feb 2020 21:55:17 +0100
Message-Id: <20200224205533.23798-17-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fIv/eGF/pchy

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:./hw/arm/stm32f205_soc.c::face=3Dovl-face1::linb=3D96::colb=
=3D4::cole=3D26][potential use of memory_region_init_rom*() in  ./hw/arm/st=
m32f205_soc.c::96]]
* TODO [[view:./hw/arm/stm32f405_soc.c::face=3Dovl-face1::linb=3D98::colb=
=3D4::cole=3D26][potential use of memory_region_init_rom*() in  ./hw/arm/st=
m32f405_soc.c::98]]

We can indeed replace the memory_region_init_ram() and
memory_region_set_readonly() calls by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/stm32f205_soc.c | 4 +---
 hw/arm/stm32f405_soc.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 627fd446f5..2de56275b7 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -93,12 +93,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
=20
-    memory_region_init_ram(flash, NULL, "STM32F205.flash", FLASH_SIZE,
+    memory_region_init_rom(flash, NULL, "STM32F205.flash", FLASH_SIZE,
                            &error_fatal);
     memory_region_init_alias(flash_alias, NULL, "STM32F205.flash.alias",
                              flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(flash, true);
     memory_region_set_readonly(flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 9bcad97853..b8fca13f95 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -95,7 +95,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     Error *err =3D NULL;
     int i;
=20
-    memory_region_init_ram(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
+    memory_region_init_rom(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
                            &err);
     if (err !=3D NULL) {
         error_propagate(errp, err);
@@ -103,8 +103,6 @@ static void stm32f405_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     }
     memory_region_init_alias(&s->flash_alias, NULL, "STM32F405.flash.alias=
",
                              &s->flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(&s->flash, true);
     memory_region_set_readonly(&s->flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->fla=
sh);
--=20
2.21.1

