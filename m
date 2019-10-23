Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1395341wrq;
        Wed, 23 Oct 2019 13:45:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaNFtqzSRMv9Sz/kDWqeGGXot2+sJfLEh05MVXMbw4eRTsEHWBBIP8Jx0Kps+BTP3p7sta
X-Received: by 2002:a50:cbcd:: with SMTP id l13mr39406509edi.18.1571863535533;
        Wed, 23 Oct 2019 13:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571863535; cv=none;
        d=google.com; s=arc-20160816;
        b=YbIDim1N9GpRYdmVk/njA++ISZuXqQrQOIuhpWf9fdwNdxxBNCxdkANHmHgOeprqzX
         GKbyt3BWWvht/vXBND3iaGYCG15xqe0NSB5VYzD8EYT/3ALprTQi0Q6+CztXVFgpj7D8
         LSIqZD4/yewWEItvh80B3vWs7adDg0Veza8h2URdmzyRV6Huw+6Ic0GVT8tWuJz+Y2tc
         9SVRZwgqQB8A6kJVSdYnvrrgR9l+FYcu7TMoKqIrvidzJWqFqNP2Q5S+VRZmPSAxxc45
         s8Jnv7/PZ6amOwe7P2sBghJbY/R4bOJWHcABbA2vy0abCdV7VzPpgTHuSVfFDaFVl8PF
         Ec4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JJt9Sa9skKiK7edLIsleYQhCTRfndzE6Q5jXitwYJIw=;
        b=KqqRubSbPhow8eID/XQ/1vU+8rmTd/ZI/CnMz0bSUa+vMsEJcOOFn19hQ/WF2Rud8c
         JNDCA09IV0/JiA77qLqpm5SG57H8OGbQmCtqY7R8lKFexkyvUHoo8NfF5y/AN8G0/lSQ
         3npyL3HzeTHEw2pduUwA0ULDnImaqmmEOvKG1jYUXbwCEskB5E/zjS1Ub3J+G/LsTZfb
         l1lPQJILvdrio2p600swfJnPP5+s3OFq5wXWxbSaLSaeZcdTKogeBOUZ/kRIgoU/UPV/
         spF2ZBP8hri9i6N9Ukd2Q4Xy/HHJmJDdqo29E7stJOYnVvVuCAikQ+qufjcr7+68KKUR
         Y6AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NleZmgtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si5789596edb.164.2019.10.23.13.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 13:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NleZmgtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNNVd-0004sH-N2
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 16:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKX9-0005Pm-Ql
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKX8-0002M4-97
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53525
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKX6-0002Js-8F
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJt9Sa9skKiK7edLIsleYQhCTRfndzE6Q5jXitwYJIw=;
 b=NleZmgtWK5tho6hLfp/kMtTieii9rrrV4hA/CCtKkxV7B1xCeZH+XNEDhQcNBwj7vmgbdZ
 tRDO5MhAmWLdHT4Zsly3gPuhBvkG+KmH+vqzia43I0+ZJrXtMGoz3s9eDCN9gG4/KrW5HZ
 EAKwqjRu8PhrGgI2AGwFi399X3pcKA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-f-_paHCAMdG3C6mWgTRfXw-1; Wed, 23 Oct 2019 13:34:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 340E91800E01;
 Wed, 23 Oct 2019 17:34:43 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 619F0100EBA4;
 Wed, 23 Oct 2019 17:34:37 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/33] leon3: use qemu_irq framework instead of callback as
 property
Date: Wed, 23 Oct 2019 19:31:45 +0200
Message-Id: <20191023173154.30051-25-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: f-_paHCAMdG3C6mWgTRfXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8bwUiMbLgs3

"set_pin_in" property is used to define a callback mechanism where the
device says "call the callback function, passing it an opaque cookie
and a 32-bit value". We already have a generic mechanism for doing
that, which is the qemu_irq. So we should just use that.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/intc/grlib_irqmp.c | 35 ++++-------------------------------
 hw/sparc/leon3.c      |  9 +++++----
 target/sparc/cpu.h    |  1 +
 3 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index bc78e1a14f..794c643af2 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -25,6 +25,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "cpu.h"
=20
@@ -58,10 +59,8 @@ typedef struct IRQMP {
=20
     MemoryRegion iomem;
=20
-    void *set_pil_in;
-    void *set_pil_in_opaque;
-
     IRQMPState *state;
+    qemu_irq irq;
 } IRQMP;
=20
 struct IRQMPState {
@@ -82,7 +81,6 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     uint32_t      pend   =3D 0;
     uint32_t      level0 =3D 0;
     uint32_t      level1 =3D 0;
-    set_pil_in_fn set_pil_in;
=20
     assert(state !=3D NULL);
     assert(state->parent !=3D NULL);
@@ -97,14 +95,8 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     trace_grlib_irqmp_check_irqs(state->pending, state->force[0],
                                  state->mask[0], level1, level0);
=20
-    set_pil_in =3D (set_pil_in_fn)state->parent->set_pil_in;
-
     /* Trigger level1 interrupt first and level0 if there is no level1 */
-    if (level1 !=3D 0) {
-        set_pil_in(state->parent->set_pil_in_opaque, level1);
-    } else {
-        set_pil_in(state->parent->set_pil_in_opaque, level0);
-    }
+    qemu_set_irq(state->parent->irq, level1 ?: level0);
 }
=20
 static void grlib_irqmp_ack_mask(IRQMPState *state, uint32_t mask)
@@ -335,6 +327,7 @@ static void grlib_irqmp_init(Object *obj)
     IRQMP *irqmp =3D GRLIB_IRQMP(obj);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
=20
+    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
     memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
=20
@@ -343,31 +336,11 @@ static void grlib_irqmp_init(Object *obj)
     sysbus_init_mmio(dev, &irqmp->iomem);
 }
=20
-static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
-{
-    IRQMP *irqmp =3D GRLIB_IRQMP(dev);
-
-        /* Check parameters */
-    if (irqmp->set_pil_in =3D=3D NULL) {
-        error_setg(errp, "set_pil_in cannot be NULL.");
-    }
-}
-
-static Property grlib_irqmp_properties[] =3D {
-    DEFINE_PROP_PTR("set_pil_in", IRQMP, set_pil_in),
-    DEFINE_PROP_PTR("set_pil_in_opaque", IRQMP, set_pil_in_opaque),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void grlib_irqmp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->reset =3D grlib_irqmp_reset;
-    dc->props =3D grlib_irqmp_properties;
-    /* Reason: pointer properties "set_pil_in", "set_pil_in_opaque" */
-    dc->user_creatable =3D false;
-    dc->realize =3D grlib_irqmp_realize;
 }
=20
 static const TypeInfo grlib_irqmp_info =3D {
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index c5f1b1ee72..6db6ea9b5c 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -143,9 +143,10 @@ void leon3_irq_ack(void *irq_manager, int intno)
     grlib_irqmp_ack((DeviceState *)irq_manager, intno);
 }
=20
-static void leon3_set_pil_in(void *opaque, uint32_t pil_in)
+static void leon3_set_pil_in(void *opaque, int n, int level)
 {
-    CPUSPARCState *env =3D (CPUSPARCState *)opaque;
+    CPUSPARCState *env =3D opaque;
+    uint32_t pil_in =3D level;
     CPUState *cs;
=20
     assert(env !=3D NULL);
@@ -225,8 +226,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate IRQ manager */
     dev =3D qdev_create(NULL, TYPE_GRLIB_IRQMP);
-    qdev_prop_set_ptr(dev, "set_pil_in", leon3_set_pil_in);
-    qdev_prop_set_ptr(dev, "set_pil_in_opaque", env);
+    env->pil_irq =3D qemu_allocate_irq(leon3_set_pil_in, env, 0);
+    qdev_connect_gpio_out_named(dev, "grlib-irq", 0, env->pil_irq);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
     env->irq_manager =3D dev;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 778aa8e073..709215f8c1 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -508,6 +508,7 @@ struct CPUSPARCState {
 #endif
     sparc_def_t def;
=20
+    qemu_irq pil_irq;
     void *irq_manager;
     void (*qemu_irq_ack)(CPUSPARCState *env, void *irq_manager, int intno)=
;
=20
--=20
2.23.0.606.g08da6496b6

