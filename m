Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp575925lfp;
        Thu, 23 Jan 2020 04:11:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwr76VCwROxOlqP6cVd0Te+3vyDv7GQxlLYSSWb4gQ7pNjVwt892yuEoW+NoieY+sDhe780
X-Received: by 2002:ac8:84:: with SMTP id c4mr15216002qtg.289.1579781516620;
        Thu, 23 Jan 2020 04:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579781516; cv=none;
        d=google.com; s=arc-20160816;
        b=h9CaikxiqD/3Ti/78+7XHcKR3ikNWAh1wWryUQf6FMiyR5pP3lbgX/4Nr5BDJGLgah
         kE/wyr02SZr5iGiR/hq0J6y/Y99xQv9XtqsHSoF1Q47pidEAE6JfCJm2hjgiAn8jvPeK
         wOF3aNLti4drVSDom0U+Zj/xbPIcfKc0WpVM/Sa72Ij/EYUnb+m3/BxJLZ2fEyCxlIyI
         +yOVjc5VLJEE9QOMEDUhjHICC83H8a62WQylpZnkcTao1FyVsJcdc1zOe9vj3pZQgnmN
         Gf8SQLxHCXplfSprLUPChxKm3KXSba1tRNrlb4gC+GB6//L7e4yZ6a2YFyGe+lFNak/U
         UGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c0gkWUiObsqwTUDdT2evm4rXxm+VLf+YDiLlCzzIjb4=;
        b=PYXDEst019j1l5kZU9sl4NQdcbjwk7ljGico1JDVltkTLEhBiX7FiUy1CZ6tCO9+YZ
         Z5LKW9PCA0lmVEna4NP03ylx82b09h/LNSEdYD1VaKM5nDnQDnepcWmzXNCDjanyBHJG
         93g7rcIVLcrfyXvmOpifixXcTUmFsXzjiKQKY8Ib3grOb9LEYKS+3yzsuMXmvPuq4T2q
         vmZTEFfxXFsP3UCnV0c+XiFWqm5mXzIwqQh0gpoga6IoNW/psk/hOSM8/YThbIHqGTB0
         PN1drJ7pSeEzEgc9cV+3+JIXj/1YM0puKNha7mTu42GsQS9tjR39oGDwl8pd6tI+kcfB
         y1gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f3jAeczN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m94si1245167qtd.295.2020.01.23.04.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f3jAeczN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iubL1-0000J6-P0
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 07:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasO-0006Cz-AX
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasN-0004Vn-5n
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36637
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasN-0004Vi-23
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 06:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c0gkWUiObsqwTUDdT2evm4rXxm+VLf+YDiLlCzzIjb4=;
 b=f3jAeczNIpIfNdsM530Yg78JBhtZpxZ8usmk919V80zvKUpCabrGUg74xVN90nsqpjHLzj
 NA0T37kcBjeMMVwtTP28Xi2hgdk/8NdNT/udJHxCNExWxmD6knzbLgTEoKCyJYoFAtBWmc
 Wi43+J2CRl7UbfL4P5UPMHQ52qqA8ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-X_9dxrOVNA-3HfwQRZWFVA-1; Thu, 23 Jan 2020 06:42:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E7E18C8C00;
 Thu, 23 Jan 2020 11:42:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D463F10016EB;
 Thu, 23 Jan 2020 11:42:11 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 33/80] arm/xilinx_zynq: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:58 +0100
Message-Id: <1579779525-20065-34-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X_9dxrOVNA-3HfwQRZWFVA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sL3BqUXechXP

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
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: edgar.iglesias@gmail.com
CC: alistair@alistair23.me
---
 hw/arm/xilinx_zynq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index df950fc..0ef9688 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -160,7 +160,6 @@ static void zynq_init(MachineState *machine)
 {
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
     DeviceState *dev;
     SysBusDevice *busdev;
@@ -190,9 +189,7 @@ static void zynq_init(MachineState *machine)
     object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
=20
     /* DDR remapped to address zero.  */
-    memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(address_space_mem, 0, ext_ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* 256K of on-chip memory */
     memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
@@ -318,6 +315,7 @@ static void zynq_machine_init(MachineClass *mc)
     mc->no_sdcard =3D 1;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->default_ram_id =3D "zynq.ext_ram";
 }
=20
 DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
--=20
2.7.4

