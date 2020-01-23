Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp573299lfp;
        Thu, 23 Jan 2020 04:09:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkXb5jQZ0UZ+mpYFKryLF0VWRyYhuYj7rhOLDbc6f4FAIcRakiGQvtEeAcPt/lsCfSIx3/
X-Received: by 2002:aed:22c8:: with SMTP id q8mr16332249qtc.133.1579781372251;
        Thu, 23 Jan 2020 04:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579781372; cv=none;
        d=google.com; s=arc-20160816;
        b=jo8+ezY8P4AYhfDfnj6P2e45iK3fU6KcKVY0TGFmUNUXjVXagqdHrstf8qGq/xmj5s
         m1Ka1g+S66PFu9h5mrj2t9NnXl2QGR2lTWQAish07NPhAogn2+4CclhbkqSO1etCZMr1
         ZiQ42ZiSMPEaUPSYSZ8jyE8XgWsEDSz7BmgnYaX3+YW20NzvkCiQ3tu++WKumnfiKkwE
         6b0IdJnKXdsPePRgJDBXOw4jjC8XZsM8U9OZ3CsqnRxsfzp1v0IrKrNONiI+gPY8EI4k
         rJdzYCdhRIqLmXDhaZ41zmE51L0WO6+PQGB6gRAR3jwf/vFrGf3J5w5T9KeU5sX9jimZ
         50bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4L/2EhRKX14eEOxhP5m3kAqbNnyuq9D1SRiL4gZz0d4=;
        b=nrBUHMFBaqEGWNs+h61/Ox4Uw46nNm7xrYjNlDohFFeYBS6/luRWuhDtZLJcimet76
         u4Dw9dhGtSoBFvp4ycvvm+d0xM3FFLovIltaLmi3nQaeyaZ/qt3VTdKepFg9Idp6zO8M
         PgxQVwAZvY1aQ6QQpAELm0JaeRczmrZv1yy22NvOEGkwcurqpEzHl5zs8Hn/CNAI/WOe
         UasnqxDTCkPkKnSZvV+3NuXBGGq17qu9QV9f98UXVJSH0VnP4yhSy0QS8J/x9GwhasqP
         nszpv44mhDClS8uzQ6yrZFuXlQiciDxHJ7G9hv2CwRk/Z91RgniSFslL/7NN3rFT4Kpt
         TkWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cCni+FRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si1101211qvz.184.2020.01.23.04.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:09:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cCni+FRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iubIh-0005O7-Bm
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 07:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasD-00066J-UQ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasB-0004RQ-HM
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasA-0004Qp-RQ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4L/2EhRKX14eEOxhP5m3kAqbNnyuq9D1SRiL4gZz0d4=;
 b=cCni+FRZgT58ekqV9jwd2CottdkPBJOei93eHU2HhEt0CUKy4UFrxkRhB8mkO6x/Rl7KvN
 loVK0hdGXQRfpdzt1V4f9cNy5SC9QpKUsR5/OQi44fZq4sFpjkx35S2QMmCj6WF7dg64QY
 At7j7J4xAOUH9XXjwOQ3lITMGLxHq2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-n2NTaKw8NQSmMVoJKn1D6g-1; Thu, 23 Jan 2020 06:42:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD090100550E;
 Thu, 23 Jan 2020 11:42:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1071B10016E8;
 Thu, 23 Jan 2020 11:42:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 29/80] arm/versatilepb: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:54 +0100
Message-Id: <1579779525-20065-30-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: n2NTaKw8NQSmMVoJKn1D6g-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5nGYj18Y6R2

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
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/versatilepb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index e86af01..f3c4a50 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -184,7 +184,6 @@ static void versatile_init(MachineState *machine, int b=
oard_id)
     Object *cpuobj;
     ARMCPU *cpu;
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     qemu_irq pic[32];
     qemu_irq sic[32];
     DeviceState *dev, *sysctl;
@@ -220,11 +219,9 @@ static void versatile_init(MachineState *machine, int =
board_id)
=20
     cpu =3D ARM_CPU(cpuobj);
=20
-    memory_region_allocate_system_memory(ram, NULL, "versatile.ram",
-                                         machine->ram_size);
     /* ??? RAM should repeat to fill physical memory space.  */
     /* SDRAM at address zero.  */
-    memory_region_add_subregion(sysmem, 0, ram);
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     sysctl =3D qdev_create(NULL, "realview_sysctl");
     qdev_prop_set_uint32(sysctl, "sys_id", 0x41007004);
@@ -398,6 +395,7 @@ static void versatilepb_class_init(ObjectClass *oc, voi=
d *data)
     mc->block_default_type =3D IF_SCSI;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_id =3D "versatile.ram";
 }
=20
 static const TypeInfo versatilepb_type =3D {
@@ -415,6 +413,7 @@ static void versatileab_class_init(ObjectClass *oc, voi=
d *data)
     mc->block_default_type =3D IF_SCSI;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_id =3D "versatile.ram";
 }
=20
 static const TypeInfo versatileab_type =3D {
--=20
2.7.4

