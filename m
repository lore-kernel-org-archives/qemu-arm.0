Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp552822lfp;
        Thu, 23 Jan 2020 03:48:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9w15ZOFx+ns1qSf9lEeXV9r6lqq58QgqsJKKuRv2XMkXAIoJtUulrKB98Ao19GmlFitGU
X-Received: by 2002:a17:906:8510:: with SMTP id i16mr6446173ejx.360.1579780093612;
        Thu, 23 Jan 2020 03:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780093; cv=none;
        d=google.com; s=arc-20160816;
        b=MClT44phVtcIZtau6MXkZ+83RhZblVVQOYc67Gg3w7Irkdtkp51U33zpCDRcGn9qzc
         C0lK1WyFr79hN4bnSnCXJ/s5dbKUPGAaz3TBOg7Zo65iy5U5DwteiknSu+ZVqYssMvIm
         uXL5OQYnPUqcvNtY0l7ouvRNE0+20qY3ejcRxqpc3iHAz4pf0N5tkq8GJ24XIvGBmsS6
         brM2LrFqmcq63N4b3ibwwYYzhbnhVEDaiq6VvxKRGqJsYifzWCz4c/PXv79n495JlyrR
         wgHYd9uHV4Ucy0+Kxr7tabSTopPpwDyslL6Gy6vqApUx3D2AqtpPUIoDyIqItSf93nuL
         MWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RqPslU1pskq+5TMyivwvech8YOcenwFLj4JMRLF7Elk=;
        b=XGoAn9hNcgQ8C8ju+6eEUcNO34Ux9VYbhOV8FRRHDTqetn29CyxEefdi0ZhkjTebO/
         bU9jVRDDWqqQbM3uEIw0aGjB25Io4sa0vkPZW1OrlUc0Mz1nudw0j4ea+yXcrPDYBlYv
         KB+UyLGShfHA2gh8aOsUhjRmaoPfVEQIoCy2X/UwB7ayzb1cHRmY6yEKmaJkHg6VGB9d
         koOfZTa7tL6EWhdrXG5sO1JyluDg5u4grfXYeKRNDQEYdhHprIB7/nCdTbaqjYErG24/
         d/MPC+SXfzSfMh1BMmxtsPrcjTukcGP1cG+RAJ7H98/rc/I+7U4EpcEShCWNU8z28bPf
         /Ofg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aAujvEbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cw16si995946edb.37.2020.01.23.03.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:48:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aAujvEbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuay4-0004nx-49
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarm-0005Oj-Vk
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarl-0004BY-Sl
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:42 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56973
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuarl-0004As-PA
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqPslU1pskq+5TMyivwvech8YOcenwFLj4JMRLF7Elk=;
 b=aAujvEbgfaxVM1W+yS/ONiE18yPmjQ2BhP6eWJDp4xUyjjL3JlAvq539jWeVqDAlTwKkAc
 2vsiB2tL46pA3z8/xDXeMUmhbz3UoviGJOlHhtJ54PNP94vIY1wndHLh6ONyT55kxkteKZ
 mUxPbzxw6ReGoJoTZj4E9PeBBFN/ngA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Iz86Z36TMvqvbLM9I14rDQ-1; Thu, 23 Jan 2020 06:41:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBA27DBBC;
 Thu, 23 Jan 2020 11:41:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0E83100164D;
 Thu, 23 Jan 2020 11:41:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 17/80] arm/kzm: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:42 +0100
Message-Id: <1579779525-20065-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Iz86Z36TMvqvbLM9I14rDQ-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5gp16yY3lPyZ

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
---
CC: peter.chubb@nicta.com.au
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/kzm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 94cbac1..34f6bcb 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -52,7 +52,6 @@
=20
 typedef struct IMX31KZM {
     FslIMX31State soc;
-    MemoryRegion ram;
     MemoryRegion ram_alias;
 } IMX31KZM;
=20
@@ -85,10 +84,8 @@ static void kzm_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_SDRAM0_ADDR=
,
-                                &s->ram);
+                                machine->ram);
=20
     /* initialize the alias memory if any */
     for (i =3D 0, ram_size =3D machine->ram_size, alias_offset =3D 0;
@@ -108,7 +105,8 @@ static void kzm_init(MachineState *machine)
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
@@ -140,6 +138,7 @@ static void kzm_machine_init(MachineClass *mc)
     mc->desc =3D "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init =3D kzm_init;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "kzm.ram";
 }
=20
 DEFINE_MACHINE("kzm", kzm_machine_init)
--=20
2.7.4

