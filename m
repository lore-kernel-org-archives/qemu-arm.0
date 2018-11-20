Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp776262wrt;
        Tue, 20 Nov 2018 08:39:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5ccR75ZsJTgkSnXXVYONKzP0I9rjaVW9Db+lTTpRGe18oCjj43vqQ14NlTxSMVz0m5Wfy+Y
X-Received: by 2002:a81:3e14:: with SMTP id l20mr2243227ywa.396.1542731999491;
        Tue, 20 Nov 2018 08:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542731999; cv=none;
        d=google.com; s=arc-20160816;
        b=OXH1cxI0txAKYiGfqMHSDo3SVFZddgfAwLrlUhX+qUGNU4Cfkqmqd+K59F472VVBzY
         z/OV+5K7UR5lbLR8KX2EODOsZFbOe8m79Hs7U7imFYTDWWkDOceBiJj5hhgO7ZIuTCer
         r/NRHVe+c5gIH+eiAplPGaZIVRhUqkmBoRc4x1j3t+0XmGQ6u0+BG5wFuWdmlVCrUQ3l
         RYj6j3ITa5atRA4dQsMq3rrx+TbilMdT+wX0a2rgx7I2pW5ZWUeJAwWhtFCVzZ0mGjiS
         dCkmt4N3voyAUbnRdUtlJ7JW8Y7rVjhDcc095x2hHoIdgLiJQDOU6feSUe2gr6xp/HMV
         zLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=wX7gG+XItr5BT+F0Imm4I9+slISm8Ujqz/8ShLURAmM=;
        b=LkVt1HW7SuSz7rDCJvDDGcjMnXQD9HMkB5rd6j+u8Sx06bGXI61eazygNTUDZpzxwd
         koMUInPvXz5UauJ8pYGCKo+UWuyheVK/5gTrRjndD2zx9y1Z/rI30mGNVdNj7uIJ1mJP
         9ZzNjL9iDCdt1LJwz3tDxGZGOmntfyJMbsor/bV6gGKR5Ht87RItz8nrbT9zAdkWVpxX
         gcykAEGNdYlYvyFl7RVVhgsiUa5ruNRAupklQLUI/ohS7T3m4k72vDDFyU4n96Kr/3tf
         MgbsPz8pyEb4Ur7kQs+gcHa2jc2LUZweWIEbZnf34heNnSTwL28C2LZA9XWzcEI4WLIv
         X08g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13-v6si27124025ybk.45.2018.11.20.08.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 08:39:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP94A-0007rL-N4
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 11:39:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP93s-0007qw-Aa
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 11:39:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP93p-0004bD-Kw
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 11:39:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP93n-0004Xf-M2; Tue, 20 Nov 2018 11:39:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E704658E22;
	Tue, 20 Nov 2018 16:39:33 +0000 (UTC)
Received: from localhost (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9C985D6A9;
	Tue, 20 Nov 2018 16:39:25 +0000 (UTC)
Date: Tue, 20 Nov 2018 17:39:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181120173924.0131a3e4@redhat.com>
In-Reply-To: <20181107123652.23417-4-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 20 Nov 2018 16:39:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 03/14] qom: make
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1XwFeAPxUUe

On Wed,  7 Nov 2018 16:36:41 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Instead of accepting any Object*, change user_creatable_complete() to
> require a UserCreatable*. Modify the callers to pass the appropriate
> argument, removing redundant dynamic cast checks in object creation.

Looks like it doesn't apply to current HEAD anymore
=20
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/qom/object_interfaces.h |  4 ++--
>  hw/misc/ivshmem.c               |  2 +-
>  hw/virtio/virtio-rng.c          |  2 +-
>  qom/object.c                    | 12 ++++++++----
>  qom/object_interfaces.c         | 14 +++-----------
>  5 files changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfa=
ces.h
> index 652a16d2ba..682ba1d9b0 100644
> --- a/include/qom/object_interfaces.h
> +++ b/include/qom/object_interfaces.h
> @@ -51,14 +51,14 @@ typedef struct UserCreatableClass {
> =20
>  /**
>   * user_creatable_complete:
> - * @obj: the object whose complete() method is called if defined
> + * @uc: the user-creatable object whose complete() method is called if d=
efined
>   * @errp: if an error occurs, a pointer to an area to store the error
>   *
>   * Wrapper to call complete() method if one of types it's inherited
>   * from implements USER_CREATABLE interface, otherwise the call does
>   * nothing.
>   */
> -void user_creatable_complete(Object *obj, Error **errp);
> +void user_creatable_complete(UserCreatable *uc, Error **errp);
> =20
>  /**
>   * user_creatable_can_be_deleted:
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index f88910e55c..478f41044c 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -1279,7 +1279,7 @@ static void desugar_shm(IVShmemState *s)
>      object_property_set_bool(obj, true, "share", &error_abort);
>      object_property_add_child(OBJECT(s), "internal-shm-backend", obj,
>                                &error_abort);
> -    user_creatable_complete(obj, &error_abort);
> +    user_creatable_complete(USER_CREATABLE(obj), &error_abort);
>      s->hostmem =3D MEMORY_BACKEND(obj);
>  }
> =20
> diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> index 855f1b41d1..30493a2586 100644
> --- a/hw/virtio/virtio-rng.c
> +++ b/hw/virtio/virtio-rng.c
> @@ -191,7 +191,7 @@ static void virtio_rng_device_realize(DeviceState *de=
v, Error **errp)
>      if (vrng->conf.rng =3D=3D NULL) {
>          vrng->conf.default_backend =3D RNG_RANDOM(object_new(TYPE_RNG_RA=
NDOM));
> =20
> -        user_creatable_complete(OBJECT(vrng->conf.default_backend),
> +        user_creatable_complete(USER_CREATABLE(vrng->conf.default_backen=
d),
>                                  &local_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
> diff --git a/qom/object.c b/qom/object.c
> index 547dcf97c3..eb770dbf7f 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -417,6 +417,7 @@ void object_initialize_childv(Object *parentobj, cons=
t char *propname,
>  {
>      Error *local_err =3D NULL;
>      Object *obj;
> +    UserCreatable *uc;
> =20
>      object_initialize(childobj, size, type);
>      obj =3D OBJECT(childobj);
> @@ -431,8 +432,9 @@ void object_initialize_childv(Object *parentobj, cons=
t char *propname,
>          goto out;
>      }
> =20
> -    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
> -        user_creatable_complete(obj, &local_err);
> +    uc =3D (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE=
);
> +    if (uc) {
> +        user_creatable_complete(uc, &local_err);
>          if (local_err) {
>              object_unparent(obj);
>              goto out;
> @@ -590,6 +592,7 @@ Object *object_new_with_propv(const char *typename,
>      Object *obj;
>      ObjectClass *klass;
>      Error *local_err =3D NULL;
> +    UserCreatable *uc;
> =20
>      klass =3D object_class_by_name(typename);
>      if (!klass) {
> @@ -612,8 +615,9 @@ Object *object_new_with_propv(const char *typename,
>          goto error;
>      }
> =20
> -    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
> -        user_creatable_complete(obj, &local_err);
> +    uc =3D (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE=
);
> +    if (uc) {
> +        user_creatable_complete(uc, &local_err);
>          if (local_err) {
>              object_unparent(obj);
>              goto error;
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 97b79b48bb..db85d1eb75 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -8,18 +8,10 @@
>  #include "qapi/opts-visitor.h"
>  #include "qemu/config-file.h"
> =20
> -void user_creatable_complete(Object *obj, Error **errp)
> +void user_creatable_complete(UserCreatable *uc, Error **errp)
>  {
> +    UserCreatableClass *ucc =3D USER_CREATABLE_GET_CLASS(uc);
> =20
> -    UserCreatableClass *ucc;
> -    UserCreatable *uc =3D
> -        (UserCreatable *)object_dynamic_cast(obj, TYPE_USER_CREATABLE);
> -
> -    if (!uc) {
> -        return;
> -    }
> -
> -    ucc =3D USER_CREATABLE_GET_CLASS(uc);
>      if (ucc->complete) {
>          ucc->complete(uc, errp);
>      }
> @@ -89,7 +81,7 @@ Object *user_creatable_add_type(const char *type, const=
 char *id,
>          goto out;
>      }
> =20
> -    user_creatable_complete(obj, &local_err);
> +    user_creatable_complete(USER_CREATABLE(obj), &local_err);
>      if (local_err) {
>          object_property_del(object_get_objects_root(),
>                              id, &error_abort);

