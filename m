Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7059088lff;
        Wed, 15 Jan 2020 07:25:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxi9SiPKALMp4jLbqDuoyyO/cA7wT3l2ERVfI0IksYENRrTnW5Y05zp3zHpNTIUVbXqRwJ6
X-Received: by 2002:aed:21b6:: with SMTP id l51mr4131090qtc.22.1579101924680;
        Wed, 15 Jan 2020 07:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101924; cv=none;
        d=google.com; s=arc-20160816;
        b=Jp8S5ovfmuEarby6Q4P8KOOS2VhW2mhu2XQe8dzQFszlZucH7h2absxI/kpBnBivMv
         zOi0x98cynSJeUWY00EJeutdzYy4oOxYu1Kr3xeikR7tfjgnqOYRQGn8iBOTZPGwZMg2
         mAGRdSmmlbjEbuO/JGPVTVJYzkC0kh7HrLVvFB93Lb7wjdlNpz5ph6BfYA2ZJXAGji3/
         LxrAeNS1NmQLJMu5CcW/RWXDb4oBxBtbjXBl81Z3kVu6Tue8mU5+pGMhDSqPEZY854jz
         BKUu0K4ewSbxZiNMrqCEHGHuR4UOfFFs9ZhhXrrpXvLASaQPwibTO45phHugL59uqLS4
         FW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uWOpD/aoY4fXorgKNs+vyJw/zhhYEsGITG7A1PU04eI=;
        b=ILKgu1qEiBTG/YDG7520giGP9ya+0NVX1S3+29ES4mNCqVtLySqJx0AEdICqSoh0fm
         UxWlAs7ptG1EfC7jotRKY/i6rTzB3kkyOOLFy+2JjpDb0dLErl+S+96z3g/47yMnA2WQ
         Lf2RozcvGbh7iwEdM6yaockqaToHDm2ubY+uTgAb4DEkeK6AJvOR67Yaf8ExLJtLwk66
         aaAdXLt40F1gSM/A5pMRP/u32I47lSujdbfN/2V4WdfUjRUwGMeHx6dnC8Eof+J6sUp2
         X/RjhgkT4zg4GATGDd1Be3ymtG5D2Z+vv2g5tTCV2J5bUAe+X0SeQDDSRi/vUZ8oH49h
         7bww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NEx/xv9T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o124si10876425qkc.47.2020.01.15.07.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NEx/xv9T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkXr-0003uw-HG
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK5-0007i6-3V
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK3-0008Bd-Mc
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:08 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58233
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK3-0008BD-Hz
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWOpD/aoY4fXorgKNs+vyJw/zhhYEsGITG7A1PU04eI=;
 b=NEx/xv9T3v+GMb6G6zOp5B5K1wZ0ZEYKvIu4VoVpn2D2nd/DLDZ82SehbpfTyf6bAnrtLY
 MEZo4JCcVBjI1aV9RXPenQ3TTAtlN3YoK/XzDXTXqwufOZG+0VcNXs9Pq/3HbnSjdMcsB9
 /o/vtOCuualCacSxgYJ8dWhkMC+xpMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-qsWZ5dXTNs2B_s5Uy3YZdQ-1; Wed, 15 Jan 2020 10:11:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6816189F7A5;
 Wed, 15 Jan 2020 15:11:04 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E4D3196AE;
 Wed, 15 Jan 2020 15:11:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/86] arm:mps2: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:38 +0100
Message-Id: <1579100861-73692-24-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qsWZ5dXTNs2B_s5Uy3YZdQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2SOhbc74vfsh

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
 hw/arm/mps2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index d002b12..5867ff0 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -55,7 +55,6 @@ typedef struct {
     MachineState parent;
=20
     ARMv7MState armv7m;
-    MemoryRegion psram;
     MemoryRegion ssram1;
     MemoryRegion ssram1_m;
     MemoryRegion ssram23;
@@ -118,6 +117,12 @@ static void mps2_common_init(MachineState *machine)
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
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -146,9 +151,7 @@ static void mps2_common_init(MachineState *machine)
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
@@ -338,6 +341,8 @@ static void mps2_class_init(ObjectClass *oc, void *data=
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

