Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2086086wrw;
        Wed, 7 Nov 2018 04:42:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5dU9BJTpdfXPSabcjvtQD2CZTw+M0wkJ7jyzAB1wCcdWmS+gIFoC/mlF0nw4IwohCQcSOET
X-Received: by 2002:ac8:51d4:: with SMTP id d20mr14173qtn.365.1541594557428;
        Wed, 07 Nov 2018 04:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594557; cv=none;
        d=google.com; s=arc-20160816;
        b=08whOHLfX8SFNM0db/1zeig5dfu+7oKysGfEbW32ZI2YqvshqWzNPYvAz1D0fqc+yu
         ceJCSKmAoyfZo1MHmPeB5tc1vVWYGmqu+efYJ4dWv2zT7QKTgsRCZ+AnBdnpQwOF4IYB
         8ffca1IpeWIWhpQ6jIQr456mUzIWJljjD8JmzWo+GXV8M86f8dZO1vAUvx77/T2SGJrw
         a75RGj+RiQssDiMK6hDACFAMXVJgzzbX7OadQAo6xwHYTtxMjDYOWiniwcgSjSqHvFLY
         U2FOnpu3mo+hz1mPoZfrDeNkmn7jaBuvuYOrQc4v0GsNQu3GWJV4yE1jL4dilbXh2bmI
         XM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=l0LVm0Z/7LdACOMvkcpUYu47gflMJcBVXeto2C1hHMA=;
        b=yr9fxSKF2H1ucoOn5oz6OlQUTykTceYYqakqcPpqVoPjFNbftoQNIlUClWYlzy4v3Z
         Hvv37iWj0t8X+5XLx0M6RgJ9Pkf4bFaqdlEBctUy2u21rE+Ohhdee8dDlfv0d8xl5q2I
         nhoJy0YuyKLdZvjXe7vJh8d6ayi2lYovGqdylgKyeVCA+8xNwVBfZgKTEZsmzX78URlk
         T864x5Gr7ipSo3nxFeTAhrfmRApoXPc+udGYoRiYVPijbrOSoh1aZeMIdOmnXnKjOB92
         dXFBfbhMqi1jt7AZjSsL2VTp6GRYekWp3X3Aa2/MuUnsRQkTKsaGNQhd/Dqc3kam3HN5
         09FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d65-v6si390647qkf.59.2018.11.07.04.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:42:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKNAK-0002Ll-TA
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:42:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN7A-00086C-KE
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN70-0007K4-Kt
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN70-00075y-6j; Wed, 07 Nov 2018 07:39:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9182D30084CB;
	Wed,  7 Nov 2018 12:38:51 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 375C060F89;
	Wed,  7 Nov 2018 12:38:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:50 +0400
Message-Id: <20181107123652.23417-13-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 07 Nov 2018 12:38:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 12/14] machine: add compat-props
 interface
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
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>,
	Amit Shah <amit@kernel.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	dgilbert@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GFtTf7N1T6d7

Let's make compatiblity properties an interface, so that objects other
than QDev can benefit from having machine compatiblity properties.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/boards.h    |  2 ++
 hw/core/compat-props.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c         | 12 ++++--------
 MAINTAINERS            |  1 +
 hw/core/Makefile.objs  |  1 +
 tests/Makefile.include |  1 +
 6 files changed, 52 insertions(+), 8 deletions(-)
 create mode 100644 hw/core/compat-props.c

diff --git a/include/hw/boards.h b/include/hw/boards.h
index c02190fc52..e09cbe70a4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -9,6 +9,8 @@
 #include "qom/object.h"
 #include "qom/cpu.h"
=20
+#define TYPE_COMPAT_PROPS "compat-props"
+
 /**
  * memory_region_allocate_system_memory - Allocate a board's main memory
  * @mr: the #MemoryRegion to be initialized
diff --git a/hw/core/compat-props.c b/hw/core/compat-props.c
new file mode 100644
index 0000000000..1edeadb6a3
--- /dev/null
+++ b/hw/core/compat-props.c
@@ -0,0 +1,43 @@
+/*
+ * QEMU Machine compat properties
+ *
+ * Copyright (C) 2018 Red Hat Inc
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+#include "qapi/error.h"
+
+typedef struct CompatProps CompatProps;
+
+typedef struct CompatPropsClass {
+    InterfaceClass parent_class;
+} CompatPropsClass;
+
+static void compat_props_post_init(Object *obj)
+{
+    if (current_machine) {
+        MachineClass *mc =3D MACHINE_GET_CLASS(current_machine);
+        AccelClass *ac =3D ACCEL_GET_CLASS(current_machine->accelerator)=
;
+
+        object_apply_global_props(obj, mc->compat_props, &error_abort);
+        object_apply_global_props(obj, ac->compat_props, &error_abort);
+    }
+}
+
+static void compat_props_register_types(void)
+{
+    static const TypeInfo cp_interface_info =3D {
+        .name          =3D TYPE_COMPAT_PROPS,
+        .parent        =3D TYPE_INTERFACE,
+        .class_size =3D sizeof(CompatPropsClass),
+        .instance_post_init =3D compat_props_post_init,
+    };
+
+    type_register_static(&cp_interface_info);
+}
+
+type_init(compat_props_register_types)
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 30890f2c8d..b0ee05f837 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -972,14 +972,6 @@ static void device_initfn(Object *obj)
=20
 static void device_post_init(Object *obj)
 {
-    if (current_machine) {
-        MachineClass *mc =3D MACHINE_GET_CLASS(current_machine);
-        AccelClass *ac =3D ACCEL_GET_CLASS(current_machine->accelerator)=
;
-
-        object_apply_global_props(obj, mc->compat_props, &error_abort);
-        object_apply_global_props(obj, ac->compat_props, &error_abort);
-    }
-
     qdev_prop_set_globals(DEVICE(obj));
 }
=20
@@ -1112,6 +1104,10 @@ static const TypeInfo device_type_info =3D {
     .class_init =3D device_class_init,
     .abstract =3D true,
     .class_size =3D sizeof(DeviceClass),
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_COMPAT_PROPS },
+        { }
+    }
 };
=20
 static void qdev_register_types(void)
diff --git a/MAINTAINERS b/MAINTAINERS
index 0499e11593..60af287386 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1024,6 +1024,7 @@ Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
+F: hw/core/compat-props.c
 F: hw/core/machine.c
 F: hw/core/null-machine.c
 F: include/hw/boards.h
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a799c83815..f15b3c970a 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,5 +1,6 @@
 # core qdev-related obj files, also used by *-user:
 common-obj-y +=3D qdev.o qdev-properties.o
+common-obj-y +=3D compat-props.o
 common-obj-y +=3D bus.o reset.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 074eece558..4bfde2e7b0 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -565,6 +565,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qde=
v-global-props.o \
 	hw/core/irq.o \
 	hw/core/fw-path-provider.o \
 	hw/core/reset.o \
+	hw/core/compat-props.o \
 	$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
 	migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
--=20
2.19.1.708.g4ede3d42df

