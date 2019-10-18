Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1095802wrm;
        Fri, 18 Oct 2019 08:51:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzO90gBwnUuMnH72PgQFpR5fLs6KfqWAlbq3W/nIhu8f2A3DBCRyN6a9nAAtTsrkoyMKl85
X-Received: by 2002:a17:906:1c87:: with SMTP id g7mr1673618ejh.189.1571413863109;
        Fri, 18 Oct 2019 08:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413863; cv=none;
        d=google.com; s=arc-20160816;
        b=tJTAWzhGCUpJRScYMYND0KcUm1xQYJPnLa1/q4pl8Mi2I1k4fbYCGBk0RPAqg1fmKf
         747rcFexnJOfc0YhYio216GQz6a6Jk09zRyW7J7M4fYtYF2Gwgr/ge+WkTLsq/U37116
         h4a9I/zKuH/93efBTe7EpNZPfZlVbdbTOa+CeiSIdHoxUMAMDuPuhGO6O4uN33u6l/Nu
         cBu9oXfYkJOo97xYEYfif4GU31g5GuXTyLSJtIoNydheFgiE2GfORzpBMptrUqhOIFUh
         qt9xb0Nc2OwZap5iPyCuHTrvQLMWALC9TbBgYv2ZA3KLQJTj3+1YozWcZkg6ZT7eM2pU
         t7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=P6psQpMwo1JxEQADy5Pts65XLoj0nzNveBfRNCiwcmE=;
        b=oXEPq/zL4XIVEaxSvJr+LC7ARknx+k+rgZyf42F0UAuzzYagMjNh2yAOcEv15IkP8v
         YJ/Ng8QBorRCth6c4cgZq+Sa1kMbTND6XDAkDkcI3DGSk9u1OuXMV0OcGz0LiRkf9xT3
         Swm/P2MeCSNkb1mRgSs3MC9oqQjPkpqfL8STuGtQIr1Ak1eksNwLJgiZpPf5OmKxCm3R
         mVXXS4GHKR5KuIjxopKmI49QQmE0hxbP7fMRrM0TxviGwYjaMpqo6M30vnIXQc8C0p15
         g03TO5zPg+/xcC6cBVPOBLJAU2SyFZ2qT9EXovNNPM7892nEmKU2VwvMvW5OyicI8LCw
         2iUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q30si4436931eda.5.2019.10.18.08.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUWr-0008GG-Cq
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPH-0000YD-GZ
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPG-0006uJ-8L
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38886)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUPG-0006tX-0U; Fri, 18 Oct 2019 11:43:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E58E18CCEE0;
 Fri, 18 Oct 2019 15:43:08 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55DFE5C1B5;
 Fri, 18 Oct 2019 15:42:51 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] leon3: replace PROP_PTR with PROP_LINK
Date: Fri, 18 Oct 2019 17:42:04 +0200
Message-Id: <20191018154212.13458-7-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 18 Oct 2019 15:43:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: yjzwjtKjtMzW

"set_pil_in" and "set_pil_in" are used to set a callback, but have a
single user and cannot be modified by the user.

Simplify the code by calling directly into leon3_set_pil_in(), and use
a "cpu" link property.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/intc/grlib_irqmp.c | 20 ++++++--------------
 hw/sparc/leon3.c      |  7 +++----
 target/sparc/cpu.h    |  1 +
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index bc78e1a14f..34b7e1b4e1 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -58,10 +58,8 @@ typedef struct IRQMP {
=20
     MemoryRegion iomem;
=20
-    void *set_pil_in;
-    void *set_pil_in_opaque;
-
     IRQMPState *state;
+    SPARCCPU *cpu;
 } IRQMP;
=20
 struct IRQMPState {
@@ -82,7 +80,6 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     uint32_t      pend   =3D 0;
     uint32_t      level0 =3D 0;
     uint32_t      level1 =3D 0;
-    set_pil_in_fn set_pil_in;
=20
     assert(state !=3D NULL);
     assert(state->parent !=3D NULL);
@@ -97,13 +94,11 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     trace_grlib_irqmp_check_irqs(state->pending, state->force[0],
                                  state->mask[0], level1, level0);
=20
-    set_pil_in =3D (set_pil_in_fn)state->parent->set_pil_in;
-
     /* Trigger level1 interrupt first and level0 if there is no level1 *=
/
     if (level1 !=3D 0) {
-        set_pil_in(state->parent->set_pil_in_opaque, level1);
+        leon3_set_pil_in(state->parent->cpu, level1);
     } else {
-        set_pil_in(state->parent->set_pil_in_opaque, level0);
+        leon3_set_pil_in(state->parent->cpu, level0);
     }
 }
=20
@@ -348,14 +343,13 @@ static void grlib_irqmp_realize(DeviceState *dev, E=
rror **errp)
     IRQMP *irqmp =3D GRLIB_IRQMP(dev);
=20
         /* Check parameters */
-    if (irqmp->set_pil_in =3D=3D NULL) {
-        error_setg(errp, "set_pil_in cannot be NULL.");
+    if (irqmp->cpu =3D=3D NULL) {
+        error_setg(errp, "cpu cannot be NULL.");
     }
 }
=20
 static Property grlib_irqmp_properties[] =3D {
-    DEFINE_PROP_PTR("set_pil_in", IRQMP, set_pil_in),
-    DEFINE_PROP_PTR("set_pil_in_opaque", IRQMP, set_pil_in_opaque),
+    DEFINE_PROP_LINK("cpu", IRQMP, cpu, TYPE_SPARC_CPU, SPARCCPU *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -365,8 +359,6 @@ static void grlib_irqmp_class_init(ObjectClass *klass=
, void *data)
=20
     dc->reset =3D grlib_irqmp_reset;
     dc->props =3D grlib_irqmp_properties;
-    /* Reason: pointer properties "set_pil_in", "set_pil_in_opaque" */
-    dc->user_creatable =3D false;
     dc->realize =3D grlib_irqmp_realize;
 }
=20
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index c5f1b1ee72..fa32936ca4 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -143,9 +143,9 @@ void leon3_irq_ack(void *irq_manager, int intno)
     grlib_irqmp_ack((DeviceState *)irq_manager, intno);
 }
=20
-static void leon3_set_pil_in(void *opaque, uint32_t pil_in)
+void leon3_set_pil_in(SPARCCPU *cpu, uint32_t pil_in)
 {
-    CPUSPARCState *env =3D (CPUSPARCState *)opaque;
+    CPUSPARCState *env =3D &cpu->env;
     CPUState *cs;
=20
     assert(env !=3D NULL);
@@ -225,8 +225,7 @@ static void leon3_generic_hw_init(MachineState *machi=
ne)
=20
     /* Allocate IRQ manager */
     dev =3D qdev_create(NULL, TYPE_GRLIB_IRQMP);
-    qdev_prop_set_ptr(dev, "set_pil_in", leon3_set_pil_in);
-    qdev_prop_set_ptr(dev, "set_pil_in_opaque", env);
+    object_property_set_link(OBJECT(dev), OBJECT(cpu), "cpu", &error_abo=
rt);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
     env->irq_manager =3D dev;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 778aa8e073..5f8e6ec6e8 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -592,6 +592,7 @@ void cpu_check_irqs(CPUSPARCState *env);
=20
 /* leon3.c */
 void leon3_irq_ack(void *irq_manager, int intno);
+void leon3_set_pil_in(SPARCCPU *cpu, uint32_t pil_in);
=20
 #if defined (TARGET_SPARC64)
=20
--=20
2.23.0.606.g08da6496b6

