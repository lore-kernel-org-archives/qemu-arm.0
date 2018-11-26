Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5583960wrt;
        Mon, 26 Nov 2018 05:47:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5fd9HScfU1o5mnpzx9iclv9ZyooO+th3hNE6scEwkP6GSgYregEOT3mcEP5obfjY9gOCsSA
X-Received: by 2002:ac8:2211:: with SMTP id o17mr26443656qto.170.1543240022758;
        Mon, 26 Nov 2018 05:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543240022; cv=none;
        d=google.com; s=arc-20160816;
        b=majhWME3wpyE99oPQHO0vCq9YAoP63nGEoJxwvijJBNW45OQPoaoESU2WK4kMs7IPW
         ZKy4i6JJ5ZXYymMpehBEBxnf1GvT14ueCjVfqPXxk53E0YZPotHlhWYZAeEXt88Sm5+0
         T+VtxBcB32mVnaj5KHkEtWskCFeyAsYG0/Pg0LCLcfRKCQvW7XmcJZgRs+Re9D/MVJTf
         KKPt+0D8kUKri/MOgkvfHuc4Tn2GBZWDEbfbpiyEUrivcdPD8FoaG+J7MLFb4dvXbGeM
         Hre+WUUGHM9/TSH3a19ywi7GfZ9ySPJQflBZsNySbKqRJe027XyPId1w672Bv4aaE5Kc
         8jYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=HoaYAvBM9Oi5nEVbbcoftWC5UO2dg8OIic0YkIT8ubc=;
        b=vAtxYoKJivya8DM2PYA25kYRw4LfW3R8ARXKmpkETvbuMHO4Aefv32WC33zQyX9Ayp
         aTLxYnJ1f643Yc3W9kNZfVrFAU/v8/Ny24IfYp0feQKJTi1LSqDcRTnP5So9VXE1QD9C
         vl3tRPy6pOljR7uSLoVj3s0Pq9+vikGdTfyezFljrYOvYWHEO9z4CX0C8Ic5sDBvtB3A
         kdufbbkzeG3WDapZtZdclQQ+QTJTuuUFztvQTH8E13unf1mOyNWaPXJIS6dlkpiK2Woa
         /7ILI2Dz1g2qsonWPCXyaUOa0I1bZcc/aRtMuF1ffGFMjQFZYjglU/BxyD9Jb/5jxd1m
         uvVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si260601qvn.177.2018.11.26.05.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRHE6-0004PG-6l
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:47:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRHDs-0004Oy-H0
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRHDp-0003ky-8b
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:46:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRHDo-0003kZ-Vu; Mon, 26 Nov 2018 08:46:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C72CF30821E5;
	Mon, 26 Nov 2018 13:46:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C82285C1B2;
	Mon, 26 Nov 2018 13:46:41 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:46:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181126144640.361f21f0@redhat.com>
In-Reply-To: <20181107123652.23417-12-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-12-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 26 Nov 2018 13:46:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 11/14] qom: teach interfaces to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, peter.crosthwaite@xilinx.com,
	qemu-devel@nongnu.org, julian@codesourcery.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com, greg.bellows@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mawgN/kOHQ9v

On Wed,  7 Nov 2018 16:36:49 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> The following patches are going to implement post_init callbacks for
> settings properties. The interface post_init are called before the
> instance post_init, so the default interface behaviour can be
> overriden if necessary.


CCing ARM guys who touched arm_cpu_post_init() in the past,
pls provide feedback if suggested below approach is acceptable.


> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qom/object.c                |  8 +++++++-
>  tests/check-qom-interface.c | 23 +++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/qom/object.c b/qom/object.c
> index b1a7f70550..980eeb8283 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -290,7 +290,6 @@ static void type_initialize(TypeImpl *ti)
>          assert(ti->instance_size =3D=3D 0);
>          assert(ti->abstract);
>          assert(!ti->instance_init);
> -        assert(!ti->instance_post_init);
>          assert(!ti->instance_finalize);
>          assert(!ti->num_interfaces);
>      }
> @@ -363,6 +362,13 @@ static void object_init_with_type(Object *obj, TypeI=
mpl *ti)
> =20
>  static void object_post_init_with_type(Object *obj, TypeImpl *ti)
>  {
> +    GSList *e;
> +
> +    for (e =3D ti->class->interfaces; e; e =3D e->next) {
> +        TypeImpl *itype =3D OBJECT_CLASS(e->data)->type;
> +        object_post_init_with_type(obj, itype);
> +    }
isn't arm_cpu_post_init() issue[1] still valid here?
1) http://patchwork.ozlabs.org/patch/969002/

probably cleanest/easiest way is to get rid of arm_cpu_post_init()
by calling it from leaf classes and then drop device_post_init()
along with switching to interface approach.

CCing guys who touched arm_cpu_post_init() in the past

>      if (ti->instance_post_init) {
>          ti->instance_post_init(obj);
>      }
> diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
> index 2177f0dce5..cd2dd6dcee 100644
> --- a/tests/check-qom-interface.c
> +++ b/tests/check-qom-interface.c
> @@ -31,9 +31,27 @@ typedef struct TestIfClass {
>      uint32_t test;
>  } TestIfClass;
> =20
> +typedef struct DirectImpl {
> +    Object parent_obj;
> +
> +    bool if_post_init;
> +} DirectImpl;
> +
> +#define TYPE_DIRECT_IMPL "direct-impl"
> +#define DIRECT_IMPL(obj) \
> +    OBJECT_CHECK(DirectImpl, (obj), TYPE_DIRECT_IMPL)
> +
> +static void test_if_post_init(Object *obj)
> +{
> +    DirectImpl *d =3D DIRECT_IMPL(obj);
> +
> +    d->if_post_init =3D true;
> +}
> +
>  static const TypeInfo test_if_info =3D {
>      .name          =3D TYPE_TEST_IF,
>      .parent        =3D TYPE_INTERFACE,
> +    .instance_post_init =3D test_if_post_init,
>      .class_size =3D sizeof(TestIfClass),
>  };
> =20
> @@ -47,11 +65,10 @@ static void test_class_init(ObjectClass *oc, void *da=
ta)
>      tc->test =3D PATTERN;
>  }
> =20
> -#define TYPE_DIRECT_IMPL "direct-impl"
> -
>  static const TypeInfo direct_impl_info =3D {
>      .name =3D TYPE_DIRECT_IMPL,
>      .parent =3D TYPE_OBJECT,
> +    .instance_size =3D sizeof(DirectImpl),
>      .class_init =3D test_class_init,
>      .interfaces =3D (InterfaceInfo[]) {
>          { TYPE_TEST_IF },
> @@ -70,10 +87,12 @@ static void test_interface_impl(const char *type)
>  {
>      Object *obj =3D object_new(type);
>      TestIf *iobj =3D TEST_IF(obj);
> +    DirectImpl *d =3D DIRECT_IMPL(obj);
>      TestIfClass *ioc =3D TEST_IF_GET_CLASS(iobj);
> =20
>      g_assert(iobj);
>      g_assert(ioc->test =3D=3D PATTERN);
> +    g_assert(d->if_post_init =3D=3D true);
>      object_unref(obj);
>  }
> =20

