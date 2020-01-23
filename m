Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp561776lfp;
        Thu, 23 Jan 2020 03:59:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5wB0zwW4M0jfMu8rPLQ2wMl7Z9TyxWQL+a/T1xSaDYu4X1OlLUa2t2B5eHuPdm3BpVoYQ
X-Received: by 2002:a05:6402:3d0:: with SMTP id t16mr6720541edw.331.1579780758775;
        Thu, 23 Jan 2020 03:59:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780758; cv=none;
        d=google.com; s=arc-20160816;
        b=X54sq4MEsA7XBrlzkkik32WcOy2PTlPmZXr1FW0JqvQh9iatKZPq5brtqdfVLEitYC
         zxZ0uSt6DpLuktfXg7FaZgrRUbDnAqEBzKN0SHyrOL5Npt0Jsynu0XeU+XpgqSkXk4w2
         Fqi0nh22D76AmXkUsjJHreZf8g4uoeivGibfAEuDTFbmAUWjfB9h97T+lXlIijDO5aFk
         HHLb/OnAUOXmYnJEpsQjM5WzaUqJfy0XDXaCrp//W10q5OqglORUVBj6jbpqhxUcCDNy
         4iWXrZDHnxvpI9xFtlP6xefQl79Kv4jIOn4ZT1Yxqg4UL69NUJLATuiAXwKJ6HTAxVgo
         4ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Dz70oqDjFQy03gviNg94YnDsOuTXGG0wlC186/lFKRU=;
        b=RDElYmk65qHoLeKyhJxkgf6XPRaoDMI5e4Im25uACE/S7ss567Aa50Ffgu3CXlTjnN
         f6iUIZKAIM/MhY6uQOcn7fuyiNm3sbJx4DMTCRAui13Qx0WMpf8pn7/FYERGw5C0cW4r
         yVM9TFLypugeN5ITMNYOiqIKvViq9G3h234Kg5yt9K4nmxZhX7885WpRW/e1x3WeReM2
         tBVzwCtBiKzy180S6+TXAz23y9mWrC7H/itLCfkf5NcbbXizSGRIZZY7gwfHI6KPEDHJ
         20nHYiddAxRYaNhEqT6DJ+vVHY00xglQIauasbq8VdUouEsr1cf84U5DWyDiSYLGG3Kc
         aJKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+6xuxy3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ss2si29894899ejb.84.2020.01.23.03.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+6xuxy3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub8n-0000z6-Eo
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarx-0005ei-0o
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuaru-0004IR-Qv
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46229
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuaru-0004IK-Nb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dz70oqDjFQy03gviNg94YnDsOuTXGG0wlC186/lFKRU=;
 b=b+6xuxy3eS1vPCgIttMs+hZQP/RQ4kFx9yHO9/WIq3QaOVeqZCkz4nGkH0D3D7wZ0nz9hZ
 bGM1kYHEFQXUrghxCMbCGo8fBneWB+4pIKG8aUwSkiafpzgnQRdj2c2wZ8JQX9FhZxfHF7
 sMaNpIXtobLbywN6oAqaak03hJQijjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-sHAtqkXqN8q0Td_nSc1jAQ-1; Thu, 23 Jan 2020 06:41:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C1C800D5C;
 Thu, 23 Jan 2020 11:41:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43AD81001DD7;
 Thu, 23 Jan 2020 11:41:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 22/80] arm/musicpal: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:47 +0100
Message-Id: <1579779525-20065-23-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: sHAtqkXqN8q0Td_nSc1jAQ-1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o07kqHxdS3ON

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
CC: jan.kiszka@web.de
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/musicpal.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index f68a399..c6418b0 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -32,6 +32,7 @@
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
 #include "ui/pixel_ops.h"
+#include "qemu/cutils.h"
=20
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
@@ -1589,16 +1590,21 @@ static void musicpal_init(MachineState *machine)
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
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
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
@@ -1714,6 +1720,8 @@ static void musicpal_machine_init(MachineClass *mc)
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

