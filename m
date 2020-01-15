Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7049153lff;
        Wed, 15 Jan 2020 07:17:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzczBzit1olh0/aIQ3Km/MLgi3ExgyNYjQ4TyTkf/QOkzKK6smnINGY4kRtcHqVckWimuZm
X-Received: by 2002:a17:906:ce38:: with SMTP id sd24mr27190253ejb.237.1579101467310;
        Wed, 15 Jan 2020 07:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101467; cv=none;
        d=google.com; s=arc-20160816;
        b=vip/qhp3hLT9ouHqlsAWKISZBunkfshEF8OzuXRMcQvACO4ZLJN3YxpxnrM/lc2dq6
         tF8cgW8nayj64aEBC9o0NU2qvn7QCqMQl8D5yGKuRu/pHU9z1Tz0MJ47SaedWKW2MUu3
         asVMtxPLbTz/AJGf7HLdhVYrMUn8exqnukLAuOlyp6xaJQO33scfEnRz6Y+2OlugJOCZ
         piwqzdm5bH+/+LEyaiblIdh7qFR840ujgKjugnelwHvYs/NHThXpkRlrMxW/mTf9zdqe
         X3yJcv02Pq+iIrcVlol0Sea7gNyWe5fmDISAnHyMyje2OjjxVBLPSOxrLH8SgTPfRKxP
         p4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rUlnYNueS8jddAQ+SP4gjg91935JfzLTka12JcrM6P0=;
        b=v0Au2bpmzVATYtz1yI44S0BHjA1s9xRzOY9qSsAX1aklwO/HTDa28M5NYBxHhS1mKX
         zX0iqMUkZhjcI6PnuuIAROUc83RbL8Swq0IJCR4K8SWND4KqD8XjNyubktzYMSlsIcZh
         /tWuaRmrJ1lsAbalhwwtD8LS8ioHwaO4CT6Shn+kJm6YcYZu8c6VjSMyMZyT1cl3pu0Y
         hwMDeJGKg2ypskw3bErfvxt3FnM1g73kPLbLtroZTyDoc+fMTw3oXGDaSqIFoEkmKMZJ
         35xezhPxFAFHaY+zOQuSI3V1MaV9MFLsqEcGwK9SkzKduAmVodRGgdIbMesO60Ou3M5D
         x2pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zji1QqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si12838289edw.272.2020.01.15.07.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zji1QqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkQT-0000Wr-PI
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJs-0007Qr-Fu
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJr-00081a-8v
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45315
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJr-000814-4w
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUlnYNueS8jddAQ+SP4gjg91935JfzLTka12JcrM6P0=;
 b=Zji1QqJrwElgtDhHL6GLXGGZXygMMprJO5FZLCTjx+Ktj88AaIx+jhZrp/z8GuvYYZuAy4
 Pfn2XNhOhlnIS8YaHfR2BsZifUBFV0GPgL92nWzG4kiN2WYEepPKpgsOzGt5QhGonLlC4P
 tM8pmRnaEzoK5tBS/M7FQvNT/ztlKcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-lqhQ8JvyMounTqkBd2ihfQ-1; Wed, 15 Jan 2020 10:10:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D2EC8DDCC6;
 Wed, 15 Jan 2020 15:10:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564A6289A3;
 Wed, 15 Jan 2020 15:10:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/86] arm:cubieboard: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:27 +0100
Message-Id: <1579100861-73692-13-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: lqhQ8JvyMounTqkBd2ihfQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gLTbbXznPfv

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
While at it, get rid of no longer needed CubieBoardState wrapper.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: b.galvani@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/cubieboard.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 6dc2f1d..089f9a3 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -28,52 +28,42 @@ static struct arm_boot_info cubieboard_binfo =3D {
     .board_id =3D 0x1008,
 };
=20
-typedef struct CubieBoardState {
-    AwA10State *a10;
-    MemoryRegion sdram;
-} CubieBoardState;
-
 static void cubieboard_init(MachineState *machine)
 {
-    CubieBoardState *s =3D g_new(CubieBoardState, 1);
+    AwA10State *a10 =3D AW_A10(object_new(TYPE_AW_A10));
     Error *err =3D NULL;
=20
-    s->a10 =3D AW_A10(object_new(TYPE_AW_A10));
-
-    object_property_set_int(OBJECT(&s->a10->emac), 1, "phy-addr", &err);
+    object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set phy address: ");
         exit(1);
     }
=20
-    object_property_set_int(OBJECT(&s->a10->timer), 32768, "clk0-freq", &e=
rr);
+    object_property_set_int(OBJECT(&a10->timer), 32768, "clk0-freq", &err)=
;
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set clk0 frequency: ");
         exit(1);
     }
=20
-    object_property_set_int(OBJECT(&s->a10->timer), 24000000, "clk1-freq",
-                            &err);
+    object_property_set_int(OBJECT(&a10->timer), 24000000, "clk1-freq", &e=
rr);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set clk1 frequency: ");
         exit(1);
     }
=20
-    object_property_set_bool(OBJECT(s->a10), true, "realized", &err);
+    object_property_set_bool(OBJECT(a10), true, "realized", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't realize Allwinner A10: ");
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(&s->sdram, NULL, "cubieboard.ram"=
,
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
-                                &s->sdram);
+                                machine->ram);
=20
     /* TODO create and connect IDE devices for ide_drive_get() */
=20
     cubieboard_binfo.ram_size =3D machine->ram_size;
-    arm_load_kernel(&s->a10->cpu, machine, &cubieboard_binfo);
+    arm_load_kernel(&a10->cpu, machine, &cubieboard_binfo);
 }
=20
 static void cubieboard_machine_init(MachineClass *mc)
@@ -84,6 +74,7 @@ static void cubieboard_machine_init(MachineClass *mc)
     mc->block_default_type =3D IF_IDE;
     mc->units_per_default_bus =3D 1;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "cubieboard.ram";
 }
=20
 DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
--=20
2.7.4

