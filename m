Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3844497wrh;
        Tue, 7 May 2019 09:47:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzsR1cPQX1HAAXUYFJcgyW9IQH0J3u2mqbph4TFbeDRK9aQuphGOV2Ww5UglMkMNITZ/GH
X-Received: by 2002:adf:9c87:: with SMTP id d7mr17692922wre.68.1557247646198;
        Tue, 07 May 2019 09:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247646; cv=none;
        d=google.com; s=arc-20160816;
        b=KULFXqEdTqoyAMq3kglbsWknu9u5LJbF0g4kDDpLVNVQgDRLDyJ/wy+puBhcj5oleQ
         Y07g/Cs3kEeyhm205XrQhui+HMGmkMKuD3o30dlkMUVnplkZSwbZIXEuoc0h3dUZPyPY
         GytuWZesnVlvShNPkfSnzgPWtbZllgpAzkvx2BfBL5d2f5Nw0+2mbBr1WYjTCtM/lv24
         uZQWrKuuv7V6DoBa5ArExO6HPl5Hyu/8QjZoyJgmwDkUHRrNn4JsMdDsZ6X+sQdpeJg1
         alo/ErE0uQuBgA8CL0QqvzPtyoJCpEH+N/wf20JdRU2q1+tO+9cJH+VpY2HXruAQz2Bo
         d35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=msqtcWHcyQkPO8z1vmEZN97GSBDFoKe4iiLjyWHRDd8=;
        b=Sg5L5rbToJHbXwrOEj8sQG2L0/GEtZKV9BcN4fzGb1ROiStErTUV7IyVFfnFS1Nfdy
         VlCruUxEBSkLryOwCsZr+o+zA7vDdto2LXJnXB0oA6bM2AH5zClXZwKmBqNjXj+SunTP
         iEMlmcbX0t823Vhimux6T+h/h2nymCBRIhszuq6LYBR3tbeUIij8QoqO5WGm5Ll7jF0s
         dXspRItPVCi4aBO3Wa+XW+CEz6DaQIzgjQWSPH2GBLABKiaiJJYfBCMeZfqjCevFjTxa
         E3FM5vHMoNClUSyRGXeoeyL5XAZNJal1KVZMs9+FHamNR4h/sfqBhWMCIH/v5Ff0w9J6
         yOPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si9967570wrw.346.2019.05.07.09.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO3FV-0004Bj-86
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:47:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO35K-0002dy-5O
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO35I-0003XU-MA
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:36:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47711)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO35I-0003Wt-Ec; Tue, 07 May 2019 12:36:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F5F6307D91F;
	Tue,  7 May 2019 16:36:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ED6D8165;
	Tue,  7 May 2019 16:36:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:08 +0200
Message-Id: <20190507163416.24647-9-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 07 May 2019 16:36:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 08/16] hw/arm: Use object_initialize_child for
 correct reference counting
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
X-TUID: 60PcAmSwQQf7

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script
(with a bit of manual fix-up for overly long lines):

 @use_object_initialize_child@
 expression parent_obj;
 expression child_ptr;
 expression child_name;
 expression child_type;
 expression child_size;
 expression errp;
 @@
 (
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                           child_type, &error_abort, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 |
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                            child_type, errp, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 )

 @use_sysbus_init_child_obj@
 expression parent_obj;
 expression dev;
 expression child_ptr;
 expression child_name;
 expression child_type;
 expression child_size;
 expression errp;
 @@
 (
 -   object_initialize_child(parent_obj, child_name, child_ptr, child_siz=
e,
 -                           child_type, errp, NULL);
 +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
 +                         child_type);
     ...
 -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
 |
 -   object_initialize_child(parent_obj, child_name, child_ptr, child_siz=
e,
 -                           child_type, errp, NULL);
 +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
 +                         child_type);
 -   dev =3D DEVICE(child_ptr);
 -   qdev_set_parent_bus(dev, sysbus_get_default());
 )

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
v2:
 - Tweaked cocci to improve digic_init (Thomas)
 - Described new use of &error_abort (Markus)
---
 hw/arm/digic.c       | 17 ++++++-----------
 hw/arm/imx25_pdk.c   |  5 ++---
 hw/arm/kzm.c         |  5 ++---
 hw/arm/raspi.c       |  7 +++----
 hw/arm/sabrelite.c   |  5 ++---
 hw/arm/xlnx-zcu102.c |  5 ++---
 hw/arm/xlnx-zynqmp.c |  8 ++++----
 7 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 726abb9b485..6ef26c6bac3 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -32,27 +32,22 @@
 static void digic_init(Object *obj)
 {
     DigicState *s =3D DIGIC(obj);
-    DeviceState *dev;
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), "arm946-" TYPE_ARM_CPU);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL);
=20
     for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
 #define DIGIC_TIMER_NAME_MLEN    11
         char name[DIGIC_TIMER_NAME_MLEN];
=20
-        object_initialize(&s->timer[i], sizeof(s->timer[i]), TYPE_DIGIC_=
TIMER);
-        dev =3D DEVICE(&s->timer[i]);
-        qdev_set_parent_bus(dev, sysbus_get_default());
         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
-        object_property_add_child(obj, name, OBJECT(&s->timer[i]), NULL)=
;
+        sysbus_init_child_obj(obj, name, &s->timer[i], sizeof(s->timer[i=
]),
+                              TYPE_DIGIC_TIMER);
     }
=20
-    object_initialize(&s->uart, sizeof(s->uart), TYPE_DIGIC_UART);
-    dev =3D DEVICE(&s->uart);
-    qdev_set_parent_bus(dev, sysbus_get_default());
-    object_property_add_child(obj, "uart", OBJECT(&s->uart), NULL);
+    sysbus_init_child_obj(obj, "uart", &s->uart, sizeof(s->uart),
+                          TYPE_DIGIC_UART);
 }
=20
 static void digic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 9f3ee147390..eef1b184b0d 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -72,9 +72,8 @@ static void imx25_pdk_init(MachineState *machine)
     unsigned int alias_offset;
     int i;
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX25);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
+                            TYPE_FSL_IMX25, &error_abort, NULL);
=20
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_f=
atal);
=20
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 139934c4ecf..44cba8782bf 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -71,9 +71,8 @@ static void kzm_init(MachineState *machine)
     unsigned int alias_offset;
     unsigned int i;
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX31);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
+                            TYPE_FSL_IMX31, &error_abort, NULL);
=20
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_f=
atal);
=20
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 66899c28dc1..0a6244096cc 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -175,10 +175,9 @@ static void raspi_init(MachineState *machine, int ve=
rsion)
     BusState *bus;
     DeviceState *carddev;
=20
-    object_initialize(&s->soc, sizeof(s->soc),
-                      version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
+                            version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM28=
36,
+                            &error_abort, NULL);
=20
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram"=
,
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index ee140e5d9eb..f1b00de2294 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -55,9 +55,8 @@ static void sabrelite_init(MachineState *machine)
         exit(1);
     }
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX6);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
+                            TYPE_FSL_IMX6, &error_abort, NULL);
=20
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &err);
     if (err !=3D NULL) {
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index b6bc6a93b89..c802f26fbdf 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -91,9 +91,8 @@ static void xlnx_zcu102_init(MachineState *machine)
     memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
                                          ram_size);
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
+                            TYPE_XLNX_ZYNQMP, &error_abort, NULL);
=20
     object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
                          "ddr-ram", &error_abort);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4f8bc41d9d4..6e991903022 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -191,10 +191,10 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
     for (i =3D 0; i < num_rpus; i++) {
         char *name;
=20
-        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
-                          "cortex-r5f-" TYPE_ARM_CPU);
-        object_property_add_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
-                                  OBJECT(&s->rpu_cpu[i]), &error_abort);
+        object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
+                                &s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
+                                "cortex-r5f-" TYPE_ARM_CPU, &error_abort=
,
+                                NULL);
=20
         name =3D object_get_canonical_path_component(OBJECT(&s->rpu_cpu[=
i]));
         if (strcmp(name, boot_cpu)) {
--=20
2.20.1

