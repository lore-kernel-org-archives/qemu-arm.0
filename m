Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp570679lfp;
        Thu, 23 Jan 2020 04:07:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZph82V64fBV+/J9duyG5p3cszlUY1cOK36AFE2PnvSoEXZIJra6iA71x4jxPNTJrLdXBx
X-Received: by 2002:a05:620a:12d5:: with SMTP id e21mr15662454qkl.44.1579781223759;
        Thu, 23 Jan 2020 04:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579781223; cv=none;
        d=google.com; s=arc-20160816;
        b=B67EkE658T5eSqfY5SC3JahRMYKAu1j/blXtVIXs9MhX4llRZsMVrrwKhS+PqpGw4H
         yXWmwvhx4HTUNFo2Hh2fK6Sge1HdrOG93HI8iT8Pa6uu6ChbPXNGVkUIarS3jn/rXops
         XCkbdz1qigdLjITng8jl+GDVu+ny3zUeO4mzGFZ5Gpzydwz+E3TaZEKIvN0MFLkEjQeF
         XBCMZjO8coRXpxMMGjeBoio63y/m1rM2dSyebBGRFE207raL8F1L//Igrx1aS5T7UacM
         T8I9iU5W7Pas5nRnzx3Fn+hVsVSrN944DL1yUV8lf1iNG28HmZO5L3lUM/89/3nzdF1q
         ZZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CgDkMDU9I/V0rpGXWiH372N5eIehhdVauWqhAVRQ1p4=;
        b=zz5oZ15cvgV6+jxcw+eR87QQn0W5WGXD+2YTop4fx7bzoJooy7qFn2BvEZUx4LIf6C
         Qp+vPQOGL6EOKRMnFjEkNgqW4l8sDYzaKJAaAD8oVstIapYP00kFJ2cV9sLBXryCd+C5
         9dSzi0rIKAy5fBesRDBGmLzk443EbJEP1Wvgea14SJltWM5m4cMZgoCDIE8Ts7x6Ss1r
         Q0Qo+H42OhpfWu7b3V0Kq16EBDkSmBIWNwdpEWrXOa8av/RCDkI70ju9JUJnNTydaRNY
         6j8vy8P6NzLcgzOZzZX8NUDpIGJ1TN4/K7xR25Z/mb7h0Ihnfv6YqdebqjmAxkCUjGXq
         5rKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fwTd8HrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si1122792qtj.376.2020.01.23.04.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fwTd8HrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iubGI-0001wA-Lv
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 07:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasP-0006FG-Kz
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasO-0004Wf-J9
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53129
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasO-0004WV-Fc
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgDkMDU9I/V0rpGXWiH372N5eIehhdVauWqhAVRQ1p4=;
 b=fwTd8HrRE6SJrINlbFIqxC3A+gmigQ1cqTOZpreBk+NdXP02Bkr3TO4+Yb7P4Vn+rk55gh
 7aAd0j876LkQ2L3lvVGORCqCtPxcUSAu+2nTqDsSizvEDOETrZLT3LMW0llL9LRelqT0Pr
 9c5IS0B0xtzm12UsNBGU0W0ulslPGVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-M56JsD3qO_-XZl4QY27M3g-1; Thu, 23 Jan 2020 06:42:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F34BDBAB;
 Thu, 23 Jan 2020 11:42:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0C510016E8;
 Thu, 23 Jan 2020 11:42:13 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 35/80] arm/xlnx-zcu102: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:00 +0100
Message-Id: <1579779525-20065-36-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: M56JsD3qO_-XZl4QY27M3g-1
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
Cc: alistair@alistair23.me, qemu-arm@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vvfGP7b/Zt8Y

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
CC: alistair@alistair23.me
CC: edgar.iglesias@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/xlnx-zcu102.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 53cfe7c..bd645ad 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -28,7 +28,6 @@ typedef struct XlnxZCU102 {
     MachineState parent_obj;
=20
     XlnxZynqMPState soc;
-    MemoryRegion ddr_ram;
=20
     bool secure;
     bool virt;
@@ -87,13 +86,10 @@ static void xlnx_zcu102_init(MachineState *machine)
                  ram_size);
     }
=20
-    memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
-                                         ram_size);
-
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_XLNX_ZYNQMP, &error_abort, NULL);
=20
-    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
+    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
                          "ddr-ram", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
                              &error_fatal);
@@ -211,6 +207,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass =
*oc, void *data)
     mc->ignore_memory_transaction_failures =3D true;
     mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
     mc->default_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
+    mc->default_ram_id =3D "ddr-ram";
 }
=20
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {
--=20
2.7.4

