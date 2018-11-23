Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2094962wrt;
        Fri, 23 Nov 2018 06:20:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5eOoDzoZNVNg/aZkEH76DwKeCsWr3P+2uMWHlJ0/R+Z/NiHp5CG9LqarrKQ7Str09OiRwG0
X-Received: by 2002:a25:44d:: with SMTP id 74-v6mr16484809ybe.173.1542982847490;
        Fri, 23 Nov 2018 06:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542982847; cv=none;
        d=google.com; s=arc-20160816;
        b=bE4FaqMhJyv+wcrGQVExZRjPm0uDxsrbUcuJ0iureotrY4KiuXQ3HEvOz+VFWDtDQV
         pK5KKIYJBvAcomqFUSIItaIaa7sWq0GXpeiLasxNg89dY1zwwMuL1vgCR8Fdq1acn0Sm
         a9d8VIuKHRY5E686qGGau4kxZRdECqSqMnvV9Ca+RfPRH0prB/nNmCecRLvowqV+Kf2B
         Q9XiZk22JWWJtfbuJQ1V25FI32DldAWX4Rdjb9pKTdrgqrt6d/fYnmQ1k4rCYAZJy2D7
         2yhrDBHJ54UmC93SuDdJgYEXJuWiVww0pdZ8QYwXn/OD2K76al+rz1uJ7jaeDJgDnrEf
         h6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7fOoWIXioNFKmu8j9K9kGA/Tq6o9nJvJrfPDve9zveM=;
        b=rKWsgCYCcJ3h/+zvtGshiTmmW0FwDBsh/erX90YK+hpd0KjjsJgUJ2v/eFXix7qySZ
         Z6SJN2jPRbTq96/jXxOGM+tIucchORQwBX9UqMjT3S4jvg2HeITJ0rJ3dC1m0e80XWjK
         KxPgF2i0i9CpTo6TisEw0EZosluAqsUS6k8U8OzbC1/BzaxENQjnomt6d9e4Dx2liTnH
         LeJ5zw71NWYHzZmOfL3Ilgk26rARTpIF/VdLPcpzInzXIH60PUXIQBY4Ladder4cauSL
         vwMosVlHKJr2nPYHSi118rSbfpXw1rMvLp4igNbkyuHPckUF5JUXhPZzktOGq+90Eh9r
         iz6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o129-v6si12984287ybc.218.2018.11.23.06.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 06:20:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQCK6-0005jW-2c
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 09:20:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQCJy-0005jP-Ak
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:20:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQCJv-0003lY-4V
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:20:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gQCJu-0003g6-TH; Fri, 23 Nov 2018 09:20:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2694368E7;
	Fri, 23 Nov 2018 14:20:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45DCC1981E;
	Fri, 23 Nov 2018 14:20:24 +0000 (UTC)
Date: Fri, 23 Nov 2018 15:20:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181123152022.2a07375b@redhat.com>
In-Reply-To: <20181107123652.23417-8-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-8-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 23 Nov 2018 14:20:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 07/14] qdev: all globals are now
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
X-TUID: 35UjXBq0BGER

On Wed,  7 Nov 2018 16:36:45 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Considering that CPU features are provided via command line, the
I can guess what it is about once I recall how -cpu foo,+-feat works,
but without that knowledge I don't get meaning behind the sentence.
Could you rephrase it?

> global_props are now all user-provided globals. No need to track this
> anymore for qdev_prop_check_globals().
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/qdev-core.h         |  3 --
>  hw/core/qdev-properties.c      |  4 ---
>  tests/test-qdev-global-props.c | 57 ++++------------------------------
>  vl.c                           |  1 -
>  4 files changed, 6 insertions(+), 59 deletions(-)
>=20
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index a24d0dd566..baaf097212 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -249,8 +249,6 @@ struct PropertyInfo {
> =20
>  /**
>   * GlobalProperty:
> - * @user_provided: Set to true if property comes from user-provided conf=
ig
> - * (command-line or config file).
>   * @used: Set to true if property was used when initializing a device.
>   * @errp: Error destination, used like first argument of error_setg()
>   *        in case property setting fails later. If @errp is NULL, we
> @@ -262,7 +260,6 @@ typedef struct GlobalProperty {
>      const char *driver;
>      const char *property;
>      const char *value;
> -    bool user_provided;
>      bool used;
>      Error **errp;
>  } GlobalProperty;
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index bd84c4ea4c..43c30a57f4 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1192,9 +1192,6 @@ int qdev_prop_check_globals(void)
>          if (prop->used) {
>              continue;
>          }
> -        if (!prop->user_provided) {
> -            continue;
> -        }
>          oc =3D object_class_by_name(prop->driver);
>          oc =3D object_class_dynamic_cast(oc, TYPE_DEVICE);
>          if (!oc) {
> @@ -1233,7 +1230,6 @@ void qdev_prop_set_globals(DeviceState *dev)
>              if (!dev->hotplugged && prop->errp) {
>                  error_propagate(prop->errp, err);
>              } else {
> -                assert(prop->user_provided);
>                  warn_report_err(err);
>              }
>          }
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index 3a8d3170a0..f49a1b70b5 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c
> @@ -215,12 +215,12 @@ static void test_dynamic_globalprop_subprocess(void)
>  {
>      MyType *mt;
>      static GlobalProperty props[] =3D {
> -        { TYPE_DYNAMIC_PROPS, "prop1", "101", true },
> -        { TYPE_DYNAMIC_PROPS, "prop2", "102", true },
> -        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103", true },
> -        { TYPE_UNUSED_HOTPLUG, "prop4", "104", true },
> -        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105", true },
> -        { TYPE_NONDEVICE, "prop6", "106", true },
> +        { TYPE_DYNAMIC_PROPS, "prop1", "101", },
> +        { TYPE_DYNAMIC_PROPS, "prop2", "102", },
> +        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103", },
> +        { TYPE_UNUSED_HOTPLUG, "prop4", "104", },
> +        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105", },
> +        { TYPE_NONDEVICE, "prop6", "106", },
>          {}
>      };
>      int global_error;
> @@ -255,46 +255,6 @@ static void test_dynamic_globalprop(void)
>      g_test_trap_assert_stdout("");
>  }
> =20
> -/* Test setting of dynamic properties using user_provided=3Dfalse proper=
ties */
> -static void test_dynamic_globalprop_nouser_subprocess(void)
> -{
> -    MyType *mt;
> -    static GlobalProperty props[] =3D {
> -        { TYPE_DYNAMIC_PROPS, "prop1", "101" },
> -        { TYPE_DYNAMIC_PROPS, "prop2", "102" },
> -        { TYPE_DYNAMIC_PROPS"-bad", "prop3", "103" },
> -        { TYPE_UNUSED_HOTPLUG, "prop4", "104" },
> -        { TYPE_UNUSED_NOHOTPLUG, "prop5", "105" },
> -        { TYPE_NONDEVICE, "prop6", "106" },
> -        {}
> -    };
> -    int global_error;
> -
> -    register_global_properties(props);
> -
> -    mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
> -    qdev_init_nofail(DEVICE(mt));
> -
> -    g_assert_cmpuint(mt->prop1, =3D=3D, 101);
> -    g_assert_cmpuint(mt->prop2, =3D=3D, 102);
> -    global_error =3D qdev_prop_check_globals();
> -    g_assert_cmpuint(global_error, =3D=3D, 0);
> -    g_assert(props[0].used);
> -    g_assert(props[1].used);
> -    g_assert(!props[2].used);
> -    g_assert(!props[3].used);
> -    g_assert(!props[4].used);
> -    g_assert(!props[5].used);
> -}
> -
> -static void test_dynamic_globalprop_nouser(void)
> -{
> -    g_test_trap_subprocess("/qdev/properties/dynamic/global/nouser/subpr=
ocess", 0, 0);
> -    g_test_trap_assert_passed();
> -    g_test_trap_assert_stderr("");
> -    g_test_trap_assert_stdout("");
> -}
> -
>  /* Test if global props affecting subclasses are applied in the right or=
der */
>  static void test_subclass_global_props(void)
>  {
> @@ -344,11 +304,6 @@ int main(int argc, char **argv)
>      g_test_add_func("/qdev/properties/dynamic/global",
>                      test_dynamic_globalprop);
> =20
> -    g_test_add_func("/qdev/properties/dynamic/global/nouser/subprocess",
> -                    test_dynamic_globalprop_nouser_subprocess);
> -    g_test_add_func("/qdev/properties/dynamic/global/nouser",
> -                    test_dynamic_globalprop_nouser);
> -
>      g_test_add_func("/qdev/properties/global/subclass",
>                      test_subclass_global_props);
> =20
> diff --git a/vl.c b/vl.c
> index 2aea884c9d..d11b070e70 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2931,7 +2931,6 @@ static int global_init_func(void *opaque, QemuOpts =
*opts, Error **errp)
>      g->driver   =3D qemu_opt_get(opts, "driver");
>      g->property =3D qemu_opt_get(opts, "property");
>      g->value    =3D qemu_opt_get(opts, "value");
> -    g->user_provided =3D true;
>      g->errp =3D &error_fatal;
>      qdev_prop_register_global(g);
>      return 0;

