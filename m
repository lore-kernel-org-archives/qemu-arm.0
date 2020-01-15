Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7059128lff;
        Wed, 15 Jan 2020 07:25:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwQODDMz5u4BSD+dWqoO7v5yMksX4g9ZXLuooswUFN73WqN3CblB1NOxjhRR/Jb8c11ayv
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr25704701qkl.119.1579101926625;
        Wed, 15 Jan 2020 07:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101926; cv=none;
        d=google.com; s=arc-20160816;
        b=O0aoTGA7gszTnQ7gGIDARmX1fN5drPHFzmkP0LAKND9+pTtTc4PtiYvA3ivqPbCDhu
         vIZtHV2wNDfnWFGWvFCk3A8NsUk+rUrffiAYfD1njAJTMgehw0n1o+jnH1R6dN1/MBhL
         tKLVUrRDaRoy/Q4KXakMGHjkujpFNZP3ozlJoV2HqKWHBGDo7xyHmfoFDmT762EoJUsi
         +yyerOisvmEizUs00qNS+h+tDGQ9iZBD+7JhNXybQ2p6HAzl1EC8fvMWmbSjnYKeGs9q
         1KD6sVlMPcQpY9Daw6/3brbSj+ALo4aweqkT1xI/WGsWgQjFzOc7BJoDyKurPlA4FM5B
         /b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ovi4L6r2hJG1Juwt0b2mvX98jB4EFXKWukA8YL8rU1I=;
        b=Qhoj8IYl5X8QF3nuWqO7VvLqAF61dvNCisMejbV4JKjUFSHACJcKeRxf2oUQZ/luLA
         rl3OTK35fhr79ZGgfz5PSbX9jC2hWNGFXwi0MnThN4fzqoOHie18VBa/fdpZ3rSqrTfO
         0xhNWcB4epsse2jEYzjliPaq9g/iMAnXBWd5EEpF+lNlX2pnEJqfKLcvJqrjrD9o6EcW
         g7LOI+EKCR3Q2fmS6xcbMyfrnMoWORYHSLdWTskFuweYL35RiOGVUkFEJETBxCHAPGjf
         sFSBB6H6mc1NI2ttwVPt4v6iWndv+zstrckfs0Qcp9Kl8IY9NehvNejewEUrq/gAMnLh
         7esQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XFSQA7Ei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si10679716qki.168.2020.01.15.07.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:25:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XFSQA7Ei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkXt-0003zq-Jo
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKJ-000865-4R
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKH-0008P5-KB
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26212
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKH-0008OG-H4
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovi4L6r2hJG1Juwt0b2mvX98jB4EFXKWukA8YL8rU1I=;
 b=XFSQA7EiK2LZYkAdIB4WShEXEgAKCeylv3JJymSt5y5A8ogB0VvGTyk1sQTNnZdTK84Tah
 iPxzo2SsWWrvazbbK2CQYD9Wkm00v0squGjtpFgtWZuiSLEJWQ12972P0X5+dD6Lk/xj/7
 6xOdLzzYdwgZ+emAslTYlVmA7vtbL7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-ZtmZj0d2NyqwpKIziK3Vtw-1; Wed, 15 Jan 2020 10:11:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6F21098D1D;
 Wed, 15 Jan 2020 15:11:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF91196AE;
 Wed, 15 Jan 2020 15:11:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/86] arm:vexpress: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:47 +0100
Message-Id: <1579100861-73692-33-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ZtmZj0d2NyqwpKIziK3Vtw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLpLD72sC93m

replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/vexpress.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 4673a88..ed683ee 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -273,7 +273,6 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
 {
     MachineState *machine =3D MACHINE(vms);
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *lowram =3D g_new(MemoryRegion, 1);
     ram_addr_t low_ram_size;
=20
@@ -283,8 +282,6 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
-                                         ram_size);
     low_ram_size =3D ram_size;
     if (low_ram_size > 0x4000000) {
         low_ram_size =3D 0x4000000;
@@ -293,9 +290,10 @@ static void a9_daughterboard_init(const VexpressMachin=
eState *vms,
      * address space should in theory be remappable to various
      * things including ROM or RAM; we always map the RAM there.
      */
-    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", ram, 0, low_=
ram_size);
+    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", machine->ram=
,
+                             0, low_ram_size);
     memory_region_add_subregion(sysmem, 0x0, lowram);
-    memory_region_add_subregion(sysmem, 0x60000000, ram);
+    memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
=20
     /* 0x1e000000 A9MPCore (SCU) private memory region */
     init_cpus(machine, cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic,
@@ -360,7 +358,6 @@ static void a15_daughterboard_init(const VexpressMachin=
eState *vms,
 {
     MachineState *machine =3D MACHINE(vms);
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
     {
@@ -375,10 +372,8 @@ static void a15_daughterboard_init(const VexpressMachi=
neState *vms,
         }
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
-                                         ram_size);
     /* RAM is from 0x80000000 upwards; there is no low-memory alias for it=
. */
-    memory_region_add_subregion(sysmem, 0x80000000, ram);
+    memory_region_add_subregion(sysmem, 0x80000000, machine->ram);
=20
     /* 0x2c000000 A15MPCore private memory region (GIC) */
     init_cpus(machine, cpu_type, TYPE_A15MPCORE_PRIV,
@@ -795,6 +790,7 @@ static void vexpress_class_init(ObjectClass *oc, void *=
data)
     mc->init =3D vexpress_common_init;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "vexpress.highmem";
 }
=20
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
--=20
2.7.4

