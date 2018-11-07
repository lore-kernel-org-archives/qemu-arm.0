Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2084246wrw;
        Wed, 7 Nov 2018 04:40:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5fe9n7sSFsug5HOqDkFD+Tpzq42wzkKa7rcG81+z80SonIMhRksSj2REHmjaiSrX3ODK4L6
X-Received: by 2002:a37:4dc5:: with SMTP id a188-v6mr45999qkb.326.1541594437863;
        Wed, 07 Nov 2018 04:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594437; cv=none;
        d=google.com; s=arc-20160816;
        b=grtI2siNNxLZov61vZBkGLpgVXNX4IZUYA71dWmerTvWYZ3KGb9FSYngQent2bcqYV
         J0L1LOWr38q6XiFfv3yC3Y7aqJ+ch/+yyrCooHQuVDoCsr5dZloPTPgpD1G4e71g2STR
         8ndCyJCvPqTF7CZv54OXE6QW6Xr+PdWQ49CHOChc06UEhHkppB6L2bthX/d0q5sqa3cg
         GCnawRDTw1Rr+VKsNdFsyhdN+LbQfns13PrxPDWzNAc9yNvWv6BzhJgXEF4rR7z18Xmp
         R0LrXhx6vqzKIW4x6nCudtwpIH5uPM9oXLwu0YSvHHf1v2fzQ4IgiOjh0CIH0NvUuIEg
         mHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZZgiNb7LenDczZMTuOeqomxQx2stBhEOcZw1nlEkG7I=;
        b=PcPKl0XMAxENsmRpdRWQA9aZgauP8IpkWlz9IRcGkMEd8lqO8N1Aj2S/V/vZnoa1Ll
         9ypZ7zana1Z9PskfyA5joLe8ADSGfdIeDe0dWLmzhY66hWrAYqkiw8lAxAS6WZvLjwAS
         VE2xbN+a5I0CEJNm420XUNZ79EKa2b5Kr+AOsM9uchYACdy+46ggDqbkNLNymjHeSwhT
         C10GAzH9vKJ2sWPrCLOevcPxT+ccLjYfwx3d/Cy9Y0VVXHceUsIojMVZ4lrgHIKzt5NU
         mhItdDBR+0rFBEl67Z3hllDexinwiFtK5SzDz5yE4mZiypdSu4zyZ4WBVCaeB1yh4hf1
         ptOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si356084qtb.373.2018.11.07.04.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN8P-0000j8-Cn
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:40:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5i-00053f-4p
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5f-0006QE-0f
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN5a-0006EM-RO; Wed, 07 Nov 2018 07:37:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 851E3144043;
	Wed,  7 Nov 2018 12:37:26 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2E05D6AA;
	Wed,  7 Nov 2018 12:37:20 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:41 +0400
Message-Id: <20181107123652.23417-4-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 07 Nov 2018 12:37:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 03/14] qom: make
 user_creatable_complete() specific to UserCreatable
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
X-TUID: RlVfGTENopGM

Instead of accepting any Object*, change user_creatable_complete() to
require a UserCreatable*. Modify the callers to pass the appropriate
argument, removing redundant dynamic cast checks in object creation.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/qom/object_interfaces.h |  4 ++--
 hw/misc/ivshmem.c               |  2 +-
 hw/virtio/virtio-rng.c          |  2 +-
 qom/object.c                    | 12 ++++++++----
 qom/object_interfaces.c         | 14 +++-----------
 5 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfa=
ces.h
index 652a16d2ba..682ba1d9b0 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -51,14 +51,14 @@ typedef struct UserCreatableClass {
=20
 /**
  * user_creatable_complete:
- * @obj: the object whose complete() method is called if defined
+ * @uc: the user-creatable object whose complete() method is called if d=
efined
  * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Wrapper to call complete() method if one of types it's inherited
  * from implements USER_CREATABLE interface, otherwise the call does
  * nothing.
  */
-void user_creatable_complete(Object *obj, Error **errp);
+void user_creatable_complete(UserCreatable *uc, Error **errp);
=20
 /**
  * user_creatable_can_be_deleted:
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index f88910e55c..478f41044c 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1279,7 +1279,7 @@ static void desugar_shm(IVShmemState *s)
     object_property_set_bool(obj, true, "share", &error_abort);
     object_property_add_child(OBJECT(s), "internal-shm-backend", obj,
                               &error_abort);
-    user_creatable_complete(obj, &error_abort);
+    user_creatable_complete(USER_CREATABLE(obj), &error_abort);
     s->hostmem =3D MEMORY_BACKEND(obj);
 }
=20
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 855f1b41d1..30493a2586 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -191,7 +191,7 @@ static void virtio_rng_device_realize(DeviceState *de=
v, Error **errp)
     if (vrng->conf.rng =3D=3D NULL) {
         vrng->conf.default_backend =3D RNG_RANDOM(object_new(TYPE_RNG_RA=
NDOM));
=20
-        user_creatable_complete(OBJECT(vrng->conf.default_backend),
+        user_creatable_complete(USER_CREATABLE(vrng->conf.default_backen=
d),
                                 &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
diff --git a/qom/object.c b/qom/object.c
index 547dcf97c3..eb770dbf7f 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -417,6 +417,7 @@ void object_initialize_childv(Object *parentobj, cons=
t char *propname,
 {
     Error *local_err =3D NULL;
     Object *obj;
+    UserCreatable *uc;
=20
     object_initialize(childobj, size, type);
     obj =3D OBJECT(childobj);
@@ -431,8 +432,9 @@ void object_initialize_childv(Object *parentobj, cons=
t char *propname,
         goto out;
     }
=20
-    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
-        user_creatable_complete(obj, &local_err);
+    uc =3D (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE=
);
+    if (uc) {
+        user_creatable_complete(uc, &local_err);
         if (local_err) {
             object_unparent(obj);
             goto out;
@@ -590,6 +592,7 @@ Object *object_new_with_propv(const char *typename,
     Object *obj;
     ObjectClass *klass;
     Error *local_err =3D NULL;
+    UserCreatable *uc;
=20
     klass =3D object_class_by_name(typename);
     if (!klass) {
@@ -612,8 +615,9 @@ Object *object_new_with_propv(const char *typename,
         goto error;
     }
=20
-    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
-        user_creatable_complete(obj, &local_err);
+    uc =3D (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE=
);
+    if (uc) {
+        user_creatable_complete(uc, &local_err);
         if (local_err) {
             object_unparent(obj);
             goto error;
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 97b79b48bb..db85d1eb75 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -8,18 +8,10 @@
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
=20
-void user_creatable_complete(Object *obj, Error **errp)
+void user_creatable_complete(UserCreatable *uc, Error **errp)
 {
+    UserCreatableClass *ucc =3D USER_CREATABLE_GET_CLASS(uc);
=20
-    UserCreatableClass *ucc;
-    UserCreatable *uc =3D
-        (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE);
-
-    if (!uc) {
-        return;
-    }
-
-    ucc =3D USER_CREATABLE_GET_CLASS(uc);
     if (ucc->complete) {
         ucc->complete(uc, errp);
     }
@@ -89,7 +81,7 @@ Object *user_creatable_add_type(const char *type, const=
 char *id,
         goto out;
     }
=20
-    user_creatable_complete(obj, &local_err);
+    user_creatable_complete(USER_CREATABLE(obj), &local_err);
     if (local_err) {
         object_property_del(object_get_objects_root(),
                             id, &error_abort);
--=20
2.19.1.708.g4ede3d42df

