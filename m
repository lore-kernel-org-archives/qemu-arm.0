Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2088300wrw;
        Wed, 7 Nov 2018 04:45:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5dGT2Hw+LfVWxSFy4b46PHJoDJQwd8DpVcCVxwrPnafVneu0h6mrbvzeqUwhxG11GKluNVr
X-Received: by 2002:ac8:2a81:: with SMTP id b1mr69781qta.110.1541594708485;
        Wed, 07 Nov 2018 04:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594708; cv=none;
        d=google.com; s=arc-20160816;
        b=Iq7VPjQiLXcL7wnAf5NstoFZBuSN0cNsQyFFn8hUhe755E12pa30Gk9j5SdLIW3Xc4
         Nn/b7mp7FMC6TtTugDshAzoYXU5iV3jcy+3BX+q/IbZ+aKcJ6XLtYhw+sDNJUNDIokRy
         2suFK4Psb0iC/+9yp5QSyrXjJ36fscCmzDj4yn5AUN5abM/KiGteQ6m4Ek7NW7u9vIOy
         5K1FmQ/UotJgGJRwiVtPLlHzOzg9YXakTr8r0Et2HWFvb28jAYhqhackGT8y6/n5Uojo
         YLRvylK4jaQLwCesQj+vvLf1cM18VRqu0Jmpo6itaEm6Cttoevi2SU+8zf76ugEzIHUB
         Hwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=V74nTbJnk4Ro9LlTq094o3Jdml4Mdjl/KeIBk1lPOJ0=;
        b=bX5EjXmrVUEcHp3nqYXmS4956QbR4fUgaE43tfwjkY0pObPmj1jAnqXjMUMMA7M8B+
         Xtm5WgOY4uIMuayrEtn2A9Vqlje+HTGimipvEl33rzUYDhAy8l12TMXkN+gpJI5kyoFz
         7V7TxwRuOdBjtWf6xS0pw7dioRLrRCwVFQVygbsaO2V+ETCefp5phJ7t9JfnZ1qRmlEW
         IJ5NYF7UYnLm116QxC1+iXFj7ybA3zEvcjsW7ogoCmDS3dVi5rQe0iPyoFs+UnTsjQC2
         zQPgpyUur0pjmHvcrxzCOVlsE3PjKP/P7Yewf2QkAMPEgq8s9mYkV7yvWFkbxF1MF5Zr
         6CcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36si392448qvf.4.2018.11.07.04.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:45:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKNCl-0006he-Rz
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:45:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN70-0007wU-9B
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6z-0007EO-3Y
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN6x-000713-4i; Wed, 07 Nov 2018 07:39:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 775F930B7DE6;
	Wed,  7 Nov 2018 12:38:40 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 245F126328;
	Wed,  7 Nov 2018 12:38:32 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:49 +0400
Message-Id: <20181107123652.23417-12-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 07 Nov 2018 12:38:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 11/14] qom: teach interfaces to
 implement post-init
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
X-TUID: 4ZHRB5sPLe89

The following patches are going to implement post_init callbacks for
settings properties. The interface post_init are called before the
instance post_init, so the default interface behaviour can be
overriden if necessary.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qom/object.c                |  8 +++++++-
 tests/check-qom-interface.c | 23 +++++++++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index b1a7f70550..980eeb8283 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -290,7 +290,6 @@ static void type_initialize(TypeImpl *ti)
         assert(ti->instance_size =3D=3D 0);
         assert(ti->abstract);
         assert(!ti->instance_init);
-        assert(!ti->instance_post_init);
         assert(!ti->instance_finalize);
         assert(!ti->num_interfaces);
     }
@@ -363,6 +362,13 @@ static void object_init_with_type(Object *obj, TypeI=
mpl *ti)
=20
 static void object_post_init_with_type(Object *obj, TypeImpl *ti)
 {
+    GSList *e;
+
+    for (e =3D ti->class->interfaces; e; e =3D e->next) {
+        TypeImpl *itype =3D OBJECT_CLASS(e->data)->type;
+        object_post_init_with_type(obj, itype);
+    }
+
     if (ti->instance_post_init) {
         ti->instance_post_init(obj);
     }
diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
index 2177f0dce5..cd2dd6dcee 100644
--- a/tests/check-qom-interface.c
+++ b/tests/check-qom-interface.c
@@ -31,9 +31,27 @@ typedef struct TestIfClass {
     uint32_t test;
 } TestIfClass;
=20
+typedef struct DirectImpl {
+    Object parent_obj;
+
+    bool if_post_init;
+} DirectImpl;
+
+#define TYPE_DIRECT_IMPL "direct-impl"
+#define DIRECT_IMPL(obj) \
+    OBJECT_CHECK(DirectImpl, (obj), TYPE_DIRECT_IMPL)
+
+static void test_if_post_init(Object *obj)
+{
+    DirectImpl *d =3D DIRECT_IMPL(obj);
+
+    d->if_post_init =3D true;
+}
+
 static const TypeInfo test_if_info =3D {
     .name          =3D TYPE_TEST_IF,
     .parent        =3D TYPE_INTERFACE,
+    .instance_post_init =3D test_if_post_init,
     .class_size =3D sizeof(TestIfClass),
 };
=20
@@ -47,11 +65,10 @@ static void test_class_init(ObjectClass *oc, void *da=
ta)
     tc->test =3D PATTERN;
 }
=20
-#define TYPE_DIRECT_IMPL "direct-impl"
-
 static const TypeInfo direct_impl_info =3D {
     .name =3D TYPE_DIRECT_IMPL,
     .parent =3D TYPE_OBJECT,
+    .instance_size =3D sizeof(DirectImpl),
     .class_init =3D test_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { TYPE_TEST_IF },
@@ -70,10 +87,12 @@ static void test_interface_impl(const char *type)
 {
     Object *obj =3D object_new(type);
     TestIf *iobj =3D TEST_IF(obj);
+    DirectImpl *d =3D DIRECT_IMPL(obj);
     TestIfClass *ioc =3D TEST_IF_GET_CLASS(iobj);
=20
     g_assert(iobj);
     g_assert(ioc->test =3D=3D PATTERN);
+    g_assert(d->if_post_init =3D=3D true);
     object_unref(obj);
 }
=20
--=20
2.19.1.708.g4ede3d42df

