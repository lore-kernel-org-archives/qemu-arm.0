Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp907914lfp;
        Thu, 23 Jan 2020 09:12:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8KnvfBLQ1X2VhgSHhHI/r+Iw+Bs8aSIA1euVbrNdbIR39sLVwK7V0hy7sOC7MSiAlI7dS
X-Received: by 2002:ad4:45ae:: with SMTP id y14mr17208321qvu.158.1579799568765;
        Thu, 23 Jan 2020 09:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579799568; cv=none;
        d=google.com; s=arc-20160816;
        b=vUne7jqBuKF+wzqRudZNXq0DnAJfUtLjJpBfZkE1vxw4tzuB9KHjPJuVjicWNnsV+5
         Ot0QZhEfwAOi3ZtkFK2GkuY7Q1DJDfXFdcpGyT0jIctMkHpOS9MlM5hbkoJxiNe5Q2jG
         mRjz4Vw4WH4PTldqGNDZgUOTTeGd0SnHmANXkGt8TYP424X8ZgI7TxeHpMf/rTZ087VA
         aN9guPlYaqYSDDgxBw3sUXyaGvGchPtGhHFGK3q0HG5+0Qa5Re+K1VPcjMuh3fne+04W
         gMbORNwczeY26tr7W0tcqqqujp+JC5e5TygFBrmFhgjydKLfr4girqF+8Hel5E/a3Ihw
         L3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ARjGzn8oBsyoJqyF3PPQneWx7B2B2Pwm/46hhCqnWtg=;
        b=sLlx2AtRR0h5fnTzzXw6zDYo5b2r9a9DwA3TDvL/xSBrIo2BAWHOgIq6X/7fmEhA0n
         K80ydl+hiBFt8XwwCew2RvV7EJdE4RC80orjzcYSJjEq9ks+7NVYNK13WiUR7FHaZZe8
         0soKT1UqnowIZ/2MEqui9vR7Mr0HeCSrN7V4nMw9AU3oT+9wanZBnegFMZpvfjFhDEU5
         2DJSWoGO9MK2zSw1lacotEtYzeRAioJazdVh5ajB7KuUZMX5p8yzWcqVECD89lxB9avs
         TFb6UMQqlmvR+X2bReaeWD06Vjznp17f433/ZymYcBvU2zCtPXDC37xRU54kN7Kump+l
         Fspw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/v4hHUU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si1653700qtm.60.2020.01.23.09.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 09:12:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/v4hHUU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iug2B-0008K2-P1
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 12:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuddy-0004BE-G4
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:39:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuddx-0004Mg-6z
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:39:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuddx-0004Ly-3r
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579790376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARjGzn8oBsyoJqyF3PPQneWx7B2B2Pwm/46hhCqnWtg=;
 b=S/v4hHUUiI4m7jGmtvom3Jpk7CknajQKVWD5ye/AYXAQOe/+oDtpRP+LLeul8bFnkMX7QR
 VVN5OEUohyRtltXPrF8beB/QxwPBUyTVpabrJXbmIKGqWHWbdHb/QirSm9iAVOSovdUnpm
 0HeVsX+rzigiyPmAeYstId/zQcQgKws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-09I6mRr0Ose7D2HJMntAVQ-1; Thu, 23 Jan 2020 09:39:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E914E8005B4;
 Thu, 23 Jan 2020 14:39:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F15E885753;
 Thu, 23 Jan 2020 14:39:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/80] arm/mps2-tz: use memdev for RAM
Date: Thu, 23 Jan 2020 15:37:11 +0100
Message-Id: <1579790231-26731-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-21-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 09I6mRr0Ose7D2HJMntAVQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: alTT0B9edfZV

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
v4:
  * move default_ram_size to mps2tz_class_init()
    (Andrew Jones <drjones@redhat.com>)

CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org

mps2-tz
---
 hw/arm/mps2-tz.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f8b620b..a8dea7d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -39,6 +39,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -79,7 +80,6 @@ typedef struct {
     MachineState parent;
=20
     ARMSSE iotkit;
-    MemoryRegion psram;
     MemoryRegion ssram[3];
     MemoryRegion ssram1_m;
     MPS2SCC scc;
@@ -388,6 +388,13 @@ static void mps2tz_common_init(MachineState *machine)
         exit(1);
     }
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
                           sizeof(mms->iotkit), mmc->armsse_type);
     iotkitdev =3D DEVICE(&mms->iotkit);
@@ -458,9 +465,7 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -642,6 +647,8 @@ static void mps2tz_class_init(ObjectClass *oc, void *da=
ta)
=20
     mc->init =3D mps2tz_common_init;
     iic->check =3D mps2_tz_idau_check;
+    mc->default_ram_size =3D 16 * MiB;
+    mc->default_ram_id =3D "mps.ram";
 }
=20
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
--=20
2.7.4

