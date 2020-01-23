Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp556060lfp;
        Thu, 23 Jan 2020 03:52:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwOEE1zGtOaj2IXo1qIHIMmCecFbqqzzhdamZ9gRdWbXS7d8X5o/IsaN3/KsXwNoQOtDIu
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr6781181ejj.6.1579780329429;
        Thu, 23 Jan 2020 03:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579780329; cv=none;
        d=google.com; s=arc-20160816;
        b=eeDswPy0d+EVkqYJPQgBn+8qAYyM0axoi18hF58duzi+Yo+Og7aKvrwzCZkmXxrGj2
         DQs31MTLPiP2aIA4nMJfVWFSTm+lV3pPB0RWrsLengQi9SF1ysqB0MuouoxNe+8N/vpc
         0TXK+7BL4H5nG8v6j34hR0iOxeVIVzRieqiVvWLIgRsr0/bJOVf/XCTsHfr439lo6FJV
         i1WRU+wCgzfWh2pc7deac8F/xjkZGxnrzbaba+4mcyDhzwRYHthDICRnTgA0R4j7aV/G
         S6t2R0Ma/N78zOSkJ6nKb4/OOgzrPU+2IMxAplcA20tgquDs4t+uSaph3QLpB0QzIWc3
         bpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JWpejJMudZ11uDHhWPVse/ceQeCeQV/apVGLS1grbKs=;
        b=g3u0Ec6fL1EKvxHfJn+xxHKCLBdnfY1+SfGoCySB3AHB0eVlNsSqFHRgVBXfNu/IoL
         vlp/5Wnt970oNFJm2gMFndtP4XksRISLiip4z+3UGkyXzuYcjhySYP/3YT/SPHxiDIl0
         by0SxmDFgmdy+RcvJhIRAvXVqdKR6nN6IESo2PiegaxTcdn5ULFpNCIVGYFdmzYmVb8R
         J/PyM3HtvYKASbnYY9O+i1h2GfFGw99fooHSHB0S3QUHa0mjk4s38+FLdZX3wlXD067r
         n1EUcES8mHs7ujz5XiVUaC/waP5ahdY50A9B5DTePy55r/DuIXvRSRqgpBAD/eMj7/zC
         kJTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gOWUdAiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si27608304ejz.397.2020.01.23.03.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gOWUdAiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55369 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iub1r-0000Lt-Sx
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 06:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuaru-0005bU-Hz
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuart-0004H9-6L
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38031
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuart-0004Gv-2c
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWpejJMudZ11uDHhWPVse/ceQeCeQV/apVGLS1grbKs=;
 b=gOWUdAiq1hfEeZrNkDaHPJeJGY+MHAtaiUvd/5pv3JCX/GeKcGagcJQFLi07icodweJpap
 s8Wnkm7fgrLhY2TwbgTbgyrJxtRFjnf9LU964x6CteWc/uuGciUsvB70E85T/3KiROeo2/
 HRfFOXVPjUZrmq1DiO25BI8kgpKJniY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-GruhQUU3PimWAmkY8ngS1g-1; Thu, 23 Jan 2020 06:41:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F075E1005512;
 Thu, 23 Jan 2020 11:41:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6DF10016EB;
 Thu, 23 Jan 2020 11:41:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 21/80] arm/mps2: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:46 +0100
Message-Id: <1579779525-20065-22-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: GruhQUU3PimWAmkY8ngS1g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ba+KyOUGE9lo

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
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/mps2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index d002b12..f246213 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -24,6 +24,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -55,7 +56,6 @@ typedef struct {
     MachineState parent;
=20
     ARMv7MState armv7m;
-    MemoryRegion psram;
     MemoryRegion ssram1;
     MemoryRegion ssram1_m;
     MemoryRegion ssram23;
@@ -118,6 +118,13 @@ static void mps2_common_init(MachineState *machine)
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
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -146,9 +153,7 @@ static void mps2_common_init(MachineState *machine)
      * This is of no use for QEMU so we don't implement it (as if
      * zbt_boot_ctrl is always zero).
      */
-    memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 16 * MiB);
-    memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
+    memory_region_add_subregion(system_memory, 0x21000000, machine->ram);
=20
     switch (mmc->fpga_type) {
     case FPGA_AN385:
@@ -338,6 +343,8 @@ static void mps2_class_init(ObjectClass *oc, void *data=
)
=20
     mc->init =3D mps2_common_init;
     mc->max_cpus =3D 1;
+    mc->default_ram_size =3D 16 * MiB;
+    mc->default_ram_id =3D "mps.ram";
 }
=20
 static void mps2_an385_class_init(ObjectClass *oc, void *data)
--=20
2.7.4

