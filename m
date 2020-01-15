Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7061233lff;
        Wed, 15 Jan 2020 07:27:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEi++Okb+NboSmHdZb0PTkk8aqyyyG/VK/nbkgbmWcobeLXWiF/VgnYDarhe3PxdWgizFy
X-Received: by 2002:a05:6402:3132:: with SMTP id dd18mr29807644edb.118.1579102032982;
        Wed, 15 Jan 2020 07:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102032; cv=none;
        d=google.com; s=arc-20160816;
        b=gzE88zPFxF0W5RbgRnCePyNRVTSga+RJ+HMh1SWYbpzUhYnpOCknz6+WgJVH6x3/Za
         2p9VvyOn6SMHYFWCM/VOcYIwr0vdXPbmEJLY9iv/S9KReZm2qCdac/lSrx7QZIPPwfyG
         yi/H1s6yKZ9bEZrdkoT4OV0Ha2xhSyeLjemi8wtsOdQra4WrFBOAXseRRGW/9BSYeuH5
         8yDX02NZPevRr05Oyb6ITnyjnLaPQ+haBN+KQy/k+O2Vaufj2sjJ/VofqBrHWK3+jDuN
         MLs2PSCwiMNI8M8oqsbaDE5GP3O/sdUmSihRRNj058Djhdc+Q2fvSvJH3q0xkUm5A7hJ
         fOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rWMmi0Hts7cYNo6XMA6kcCw4MSmg8lf+QwcfJ79TYwo=;
        b=dSL0dAAw67QN2peh4DL4pkf0yGePfM6xaDSbA4z51gyct/tknu6KgHHSff/KsGO0qF
         5P0URYN/BBFh3l0x1QARV1mBKLdbrvjO0OhufntsPUxCdVKzeGK0veUTh6ZCa8ktytWT
         cz/hN05xh/d6jr8eNVKeQ4z8ineTPEVG649uCRdIt/xaLA4KMgEX3Ozj8FCIReoUG7OE
         FDpsZSRcyy3BMLhKCS96EWnjeoEqxgU6LUwJ8NzojJYNNmZ5YpFDupxAuX8/ZbFvAlli
         HBsINTrsCCdehZXyBTRmZOhWgxffZXraEvMMcejxj6JRuGxbBHnAyXBqrbMol5TySUZ2
         VCEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/b6jp2j";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si11643175ejx.420.2020.01.15.07.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:27:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="S/b6jp2j";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkZb-0006QQ-CO
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKL-0008BR-T4
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKK-0008SW-J7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKK-0008SK-FI
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWMmi0Hts7cYNo6XMA6kcCw4MSmg8lf+QwcfJ79TYwo=;
 b=S/b6jp2jDKN+uiLZaJmBvsaQpSUKZmK/UkGprPweDJLZNDK2otHh+YRIhwNfI7EiEq//Qc
 fw/A+xR+4+ZNIjY/WTNsgO+xI20d0OhlXmVdsiItkxZEoBa9iaclwspULJZMorQOE7H5V5
 RTb2+Iq7A/5InQY8cejtqOYb5mjCmrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-z8TYTEaYPJm_U70iT170ug-1; Wed, 15 Jan 2020 10:11:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6602318A0796;
 Wed, 15 Jan 2020 15:11:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39C1119757;
 Wed, 15 Jan 2020 15:11:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/86] arm:xilinx_zynq: drop RAM size fixup
Date: Wed, 15 Jan 2020 16:06:49 +0100
Message-Id: <1579100861-73692-35-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: z8TYTEaYPJm_U70iT170ug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bUJ3omFNYQPn

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: edgar.iglesias@gmail.com
CC: alistair@alistair23.me
---
 hw/arm/xilinx_zynq.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3a0fa5b..df950fc 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -158,7 +158,6 @@ static inline void zynq_init_spi_flashes(uint32_t base_=
addr, qemu_irq irq,
=20
 static void zynq_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
@@ -168,6 +167,12 @@ static void zynq_init(MachineState *machine)
     qemu_irq pic[64];
     int n;
=20
+    /* max 2GB ram */
+    if (machine->ram_size > 0x80000000) {
+        error_report("RAM size more than %d is not supported", 0x80000000)=
;
+        exit(EXIT_FAILURE);
+    }
+
     cpu =3D ARM_CPU(object_new(machine->cpu_type));
=20
     /* By default A9 CPUs have EL3 enabled.  This board does not
@@ -184,14 +189,9 @@ static void zynq_init(MachineState *machine)
                             &error_fatal);
     object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
=20
-    /* max 2GB ram */
-    if (ram_size > 0x80000000) {
-        ram_size =3D 0x80000000;
-    }
-
     /* DDR remapped to address zero.  */
     memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
-                                         ram_size);
+                                         machine->ram_size);
     memory_region_add_subregion(address_space_mem, 0, ext_ram);
=20
     /* 256K of on-chip memory */
@@ -300,7 +300,7 @@ static void zynq_init(MachineState *machine)
     sysbus_connect_irq(busdev, 0, pic[40 - IRQ_OFFSET]);
     sysbus_mmio_map(busdev, 0, 0xF8007000);
=20
-    zynq_binfo.ram_size =3D ram_size;
+    zynq_binfo.ram_size =3D machine->ram_size;
     zynq_binfo.nb_cpus =3D 1;
     zynq_binfo.board_id =3D 0xd32;
     zynq_binfo.loader_start =3D 0;
--=20
2.7.4

