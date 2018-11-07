Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2084839wrw;
        Wed, 7 Nov 2018 04:41:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5etGX3fxiBNB3vaBM/4GHY+w3GbnkBrq8YLZXUoM5cG7+9/jwT0M0Ayrdoed7diXPANXezZ
X-Received: by 2002:a37:6b42:: with SMTP id g63mr20978qkc.297.1541594475499;
        Wed, 07 Nov 2018 04:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594475; cv=none;
        d=google.com; s=arc-20160816;
        b=n3MtL95Wjpne5Y2cklIL/TE8ipHLix4ZDar7bvScYfBQfvbLgK6mugQPbrVqEnLWuf
         pu6umkKvUZ1N8QGWDj44a/1XlZNGETffn3K7BK7xK2+tJVOC0iGOeLLvSCkgXzPl7Vt3
         gLN4MoqLLTGx5KzqBx5ipGjsEGvKaKFM0IZcZVm/r6xoblODDciIw51Fpy2SNl5kZZc0
         JBtAT9uj+zOtwSHEdgebKfp7co7m4RK3Dj+9lecnKQXF612V+dknbuJAo+MVzsHS25R6
         e61YH3B1eHZKmibk0EAL9Z1zGZjYrITBQzpbdPrT/sdLsnHkdTYt4FuTNGLMdKia6r6I
         5zDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qM4PYM/NnOL8J+1z3wmNRRAUmaCEUmfuvqdOC8fiX7o=;
        b=jJDkB5Kkcs+RGQ733xb9be9bjpfW8n3h05AVzeBSviebivxca8VLykXsepfFu+9Hje
         qc+T38LKnvqTBO8M/PCZCkYK3XUT7rFLPCE8SkiC7Ohn8LQqYw5t8myWaV3VJuQLsjz1
         1qtnR3p5Ct99MM3iR0bvMg0LDJeontkvap9QVORZkJxfeEurjEgEbe3Ev4b0uPRkypN9
         cBJMKBqKixtzM0KnXvtpnKxG4GkDqJR6Fmpnp2e42XDhX8pYppuB1ABqCFi8klJTL4dz
         6FaB5sqPGFUudl4n7GkZ/X9zTRyMZtTW9iybNt2bdr1yk0MV1vwneBr6SfqMYYXwrOLb
         PChA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c143si424297qka.3.2018.11.07.04.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:41:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN90-0001En-Ud
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:41:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5z-0006LH-UK
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:38:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5y-0006iw-UX
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:38:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN5y-0006id-Mr; Wed, 07 Nov 2018 07:38:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D968E30D4DA0;
	Wed,  7 Nov 2018 12:38:05 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 897D14D730;
	Wed,  7 Nov 2018 12:37:58 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:45 +0400
Message-Id: <20181107123652.23417-8-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 07 Nov 2018 12:38:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 07/14] qdev: all globals are now
 user-provided
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
X-TUID: 8NVZ7KqlFur8

Considering that CPU features are provided via command line, the
global_props are now all user-provided globals. No need to track this
anymore for qdev_prop_check_globals().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/qdev-core.h         |  3 --
 hw/core/qdev-properties.c      |  4 ---
 tests/test-qdev-global-props.c | 57 ++++------------------------------
 vl.c                           |  1 -
 4 files changed, 6 insertions(+), 59 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index a24d0dd566..baaf097212 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -249,8 +249,6 @@ struct PropertyInfo {
=20
 /**
  * GlobalProperty:
- * @user_provided: Set to true if property comes from user-provided conf=
ig
- * (command-line or config file).
  * @used: Set to true if property was used when initializing a device.
  * @errp: Error destination, used like first argument of error_setg()
  *        in case property setting fails later. If @errp is NULL, we
@@ -262,7 +260,6 @@ typedef struct GlobalProperty {
     const char *driver;
     const char *property;
     const char *value;
-    bool user_provided;
     bool used;
     Error **errp;
 } GlobalProperty;
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index bd84c4ea4c..43c30a57f4 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1192,9 +1192,6 @@ int qdev_prop_check_globals(void)
         if (prop->used) {
             continue;
         }
-        if (!prop->user_provided) {
-            continue;
-        }
         oc =3D object_class_by_name(prop->driver);
         oc =3D object_class_dynamic_cast(oc, TYPE_DEVICE);
         if (!oc) {
@@ -1233,7 +1230,6 @@ void qdev_prop_set_globals(DeviceState *dev)
             if (!dev->hotplugged && prop->errp) {
                 error_propagate(prop->errp, err);
             } else {
-                assert(prop->user_provided);
                 warn_report_err(err);
             }
         }
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
index 3a8d3170a0..f49a1b70b5 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -215,12 +215,12 @@ static void test_dynamic_globalprop_subprocess(void=
)
 {
     MyType *mt;
     static GlobalProperty props[] =3D {
-        { TYPE_DYNAMIC_PROPS, "prop1", "101", true },
-        { TYPE_DYNAMIC_PROPS, "prop2", "102", true },
-        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103", true },
-        { TYPE_UNUSED_HOTPLUG, "prop4", "104", true },
-        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105", true },
-        { TYPE_NONDEVICE, "prop6", "106", true },
+        { TYPE_DYNAMIC_PROPS, "prop1", "101", },
+        { TYPE_DYNAMIC_PROPS, "prop2", "102", },
+        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103", },
+        { TYPE_UNUSED_HOTPLUG, "prop4", "104", },
+        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105", },
+        { TYPE_NONDEVICE, "prop6", "106", },
         {}
     };
     int global_error;
@@ -255,46 +255,6 @@ static void test_dynamic_globalprop(void)
     g_test_trap_assert_stdout("");
 }
=20
-/* Test setting of dynamic properties using user_provided=3Dfalse proper=
ties */
-static void test_dynamic_globalprop_nouser_subprocess(void)
-{
-    MyType *mt;
-    static GlobalProperty props[] =3D {
-        { TYPE_DYNAMIC_PROPS, "prop1", "101" },
-        { TYPE_DYNAMIC_PROPS, "prop2", "102" },
-        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103" },
-        { TYPE_UNUSED_HOTPLUG, "prop4", "104" },
-        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105" },
-        { TYPE_NONDEVICE, "prop6", "106" },
-        {}
-    };
-    int global_error;
-
-    register_global_properties(props);
-
-    mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
-    qdev_init_nofail(DEVICE(mt));
-
-    g_assert_cmpuint(mt->prop1, =3D=3D, 101);
-    g_assert_cmpuint(mt->prop2, =3D=3D, 102);
-    global_error =3D qdev_prop_check_globals();
-    g_assert_cmpuint(global_error, =3D=3D, 0);
-    g_assert(props[0].used);
-    g_assert(props[1].used);
-    g_assert(!props[2].used);
-    g_assert(!props[3].used);
-    g_assert(!props[4].used);
-    g_assert(!props[5].used);
-}
-
-static void test_dynamic_globalprop_nouser(void)
-{
-    g_test_trap_subprocess("/qdev/properties/dynamic/global/nouser/subpr=
ocess", 0, 0);
-    g_test_trap_assert_passed();
-    g_test_trap_assert_stderr("");
-    g_test_trap_assert_stdout("");
-}
-
 /* Test if global props affecting subclasses are applied in the right or=
der */
 static void test_subclass_global_props(void)
 {
@@ -344,11 +304,6 @@ int main(int argc, char **argv)
     g_test_add_func("/qdev/properties/dynamic/global",
                     test_dynamic_globalprop);
=20
-    g_test_add_func("/qdev/properties/dynamic/global/nouser/subprocess",
-                    test_dynamic_globalprop_nouser_subprocess);
-    g_test_add_func("/qdev/properties/dynamic/global/nouser",
-                    test_dynamic_globalprop_nouser);
-
     g_test_add_func("/qdev/properties/global/subclass",
                     test_subclass_global_props);
=20
diff --git a/vl.c b/vl.c
index 2aea884c9d..d11b070e70 100644
--- a/vl.c
+++ b/vl.c
@@ -2931,7 +2931,6 @@ static int global_init_func(void *opaque, QemuOpts =
*opts, Error **errp)
     g->driver   =3D qemu_opt_get(opts, "driver");
     g->property =3D qemu_opt_get(opts, "property");
     g->value    =3D qemu_opt_get(opts, "value");
-    g->user_provided =3D true;
     g->errp =3D &error_fatal;
     qdev_prop_register_global(g);
     return 0;
--=20
2.19.1.708.g4ede3d42df

