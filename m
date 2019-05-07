Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3835349wrh;
        Tue, 7 May 2019 09:37:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKayi4gJFuFJg8OQ2F85vtdskAzxO8+8h9gUULEw6Xyus/mye5EYamK2sH1uOKqI/qJ3q7
X-Received: by 2002:a7b:cb16:: with SMTP id u22mr21668144wmj.60.1557247071455;
        Tue, 07 May 2019 09:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247071; cv=none;
        d=google.com; s=arc-20160816;
        b=eT/guEU080ZxZ4nT6FDA9gDwTBq2vsEwgH8JQAAUagO/oIOPrD9taZ/UGoQ8j3DTcV
         Os73weutrI1J6qL8A2XS4vs07PCtiHn16LwXW9I4PHORO9OHDz7a2LeDTM+YPfWMyp6A
         V7+LVKuCQ6vPxSgYcNxVbV0S/kF9VpYvwLkM9hxinzBNvADUhuSZ0orIK5akbMriyFlm
         GfuqG+hh9VJ/YPOuX6g2pMyIDvl/YNWXyHz0tDImfPxOtYo71ItKb3LXMCeVIHx04t+O
         I0cpEbmYkCzjkAQqFNcu+7Dv3yP4mTop3aVZTwQWQuMffE96VGrQsksv/UtRcGbpZ5V4
         Fd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8x/cuLbfeMZfcYmk864T0+9qUoNrxEJ8guk/jkN2hX0=;
        b=JGfNBq/z232aaAagpcDoDJdVst8EgKHO7rTLxk1xjZUUARs84CAiCCfpfV8/G94JTa
         suhofFVS4JEDWgGcmNY4yL1LyYlpC5F/1KOXfgeugxYuMc0J4LTb+jQ7GKggTmbqOpxt
         0snT/c1d6FEPPxZ1QRBOMD/6LtXx0IFxlPVhZ7wOzt06J2FO3XkhgokHncE3Q4n0rCW6
         shPCB2xdlyQGCetHP7CFX+amWwX04sYCX39thQFaHcNw6z6qzgKfWzRTcVVo4/6jWkDi
         OSne5ruuOYr7eVQdkyPJ2kUaE7X5K6BnhH8o4Z5PMbHvubwPrwR86VvoUFG7OqG3UcUj
         yz6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si5006469wri.181.2019.05.07.09.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO36E-0003Rz-AW
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:37:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO35i-0002z9-4r
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO35g-00044D-Q2
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:37:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO35g-00043G-Hm; Tue, 07 May 2019 12:37:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A3C688305;
	Tue,  7 May 2019 16:37:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06493DA5;
	Tue,  7 May 2019 16:37:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:10 +0200
Message-Id: <20190507163416.24647-11-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 07 May 2019 16:37:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 10/16] hw/mips: Use object_initialize_child
 for correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eliqmwsb/o/T

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script:

 @use_sysbus_init_child_obj_missing_parent@
 expression child_ptr;
 expression child_type;
 expression child_size;
 @@
 -   object_initialize(child_ptr, child_size, child_type);
     ...
 -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
     ...
 ?-  object_unref(OBJECT(child_ptr));
 +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
 +                         child_size, child_type);

We let the Malta/Boston machines adopt the CPS child, and similarly
the CPS adopts the ITU/CPC/GIC/GCR children.

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.
This choice also matches when using sysbus_init_child_obj(),
since its code is:

  void sysbus_init_child_obj(Object *parent,
                             const char *childname, void *child,
                             size_t childsize, const char *childtype)
  {
      object_initialize_child(parent, childname, child, childsize,
                              childtype, &error_abort, NULL);

      qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
  }

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/boston.c     |  4 ++--
 hw/mips/cps.c        | 20 ++++++++------------
 hw/mips/mips_malta.c |  4 ++--
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index cb3ea85fdc1..1ffccc8da92 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -455,8 +455,8 @@ static void boston_mach_init(MachineState *machine)
=20
     is_64b =3D cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
=20
-    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
-    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
+    sysbus_init_child_obj(OBJECT(machine), "cps", OBJECT(&s->cps),
+                          sizeof(s->cps), TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), machine->cpu_type, "cpu-typ=
e",
                             &err);
     object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index fc97f59af4c..649b35a76c5 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -94,9 +94,8 @@ static void mips_cps_realize(DeviceState *dev, Error **=
errp)
=20
     /* Inter-Thread Communication Unit */
     if (itu_present) {
-        object_initialize(&s->itu, sizeof(s->itu), TYPE_MIPS_ITU);
-        qdev_set_parent_bus(DEVICE(&s->itu), sysbus_get_default());
-
+        sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu=
),
+                              TYPE_MIPS_ITU);
         object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
         object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &=
err);
         object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-pr=
esent",
@@ -115,9 +114,8 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
     }
=20
     /* Cluster Power Controller */
-    object_initialize(&s->cpc, sizeof(s->cpc), TYPE_MIPS_CPC);
-    qdev_set_parent_bus(DEVICE(&s->cpc), sysbus_get_default());
-
+    sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
+                          TYPE_MIPS_CPC);
     object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
     object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err=
);
     object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
@@ -130,9 +128,8 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cp=
c), 0));
=20
     /* Global Interrupt Controller */
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_MIPS_GIC);
-    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
-
+    sysbus_init_child_obj(OBJECT(dev), "gic", &s->gic, sizeof(s->gic),
+                          TYPE_MIPS_GIC);
     object_property_set_int(OBJECT(&s->gic), s->num_vp, "num-vp", &err);
     object_property_set_int(OBJECT(&s->gic), 128, "num-irq", &err);
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
@@ -147,9 +144,8 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
     /* Global Configuration Registers */
     gcr_base =3D env->CP0_CMGCRBase << 4;
=20
-    object_initialize(&s->gcr, sizeof(s->gcr), TYPE_MIPS_GCR);
-    qdev_set_parent_bus(DEVICE(&s->gcr), sysbus_get_default());
-
+    sysbus_init_child_obj(OBJECT(dev), "gcr", &s->gcr, sizeof(s->gcr),
+                          TYPE_MIPS_GCR);
     object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
     object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
     object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err)=
;
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 04f2117d71e..aff8464f2ac 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1151,8 +1151,8 @@ static void create_cps(MaltaState *s, const char *c=
pu_type,
 {
     Error *err =3D NULL;
=20
-    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
-    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
+    sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps), sizeof(s->c=
ps),
+                          TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), cpu_type, "cpu-type", &err)=
;
     object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
     object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
--=20
2.20.1

