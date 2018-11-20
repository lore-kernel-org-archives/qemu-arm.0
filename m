Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp777639wrt;
        Tue, 20 Nov 2018 08:41:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5eiJHl3fQxwyTbMQcM4iAUgmiL/6FKb/a8W8D58+AKp5jfghMREu+kiG5PgsSUV8HmH47El
X-Received: by 2002:a0d:ec45:: with SMTP id v66mr2540206ywe.419.1542732076950;
        Tue, 20 Nov 2018 08:41:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542732076; cv=none;
        d=google.com; s=arc-20160816;
        b=smGgDPra4vBm2lxW8w+Byu+5N8wSzR5FtF+Vrfi7UBh6h/cz7W3lQu5R8jKKHY9UFt
         Fuh3BhtUD/zXyzHh8F+7QZgtTm0RbbpXQmDRA9yJ5vp1W+cdLNNJnsKqr/SbQY6LEtE1
         rGSzLBpAkqEj4me9jexYgcmZ5ifwSSI3Ux3odtGaQb52KRNEyNJFXJuCCLde6tV+v40C
         PQRVvw2yKxLd4ZdJpyPXD7Cj0aj6aZnGaKjLOGBQANR3Wr92/G8rYfqjXqBAp50VZSXX
         Xhga7lfISygwY3Hj9faZnAutWNx8qrbfboO5VouiRtyPur7iDc4l8Ry4Tcu67IO4VlqX
         DgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=k6HuroxOlsnzKKIJe3WFsmxk+IjgXh8pOMg6m4qv99M=;
        b=Y0dyWYa3UjIVrF6q8QGwfppSZYWRZnU9FZGiTgLyIwSSfs590AD7rI5Dy6xhiqDSer
         PhZwDNwZt1mrIPW+//2m/7io8v6sFGJuljc6x2G0bWgYQwfaDADdUMtA3D+aQBn1ym1K
         T57vho4vT2eosIqekMl5vLp4+S9tAr8VYdoG5tBc8Ms4xVi0i3F2qn6w+oVUyzFTk3L0
         t1ok3T1qfYUSDuxVhusqK/4yWhQPoH6P/aONQiBGZ/5BDbNWeZ1C3Lno/k99+6e/YqsJ
         77Fj7I5xJWRXvegfzS4ZgkOz7Uu3PjXKTNXGsPL4adPhHxuEvaQIa2JslFlesp8bdUdL
         Zxvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6-v6si28422097ybh.166.2018.11.20.08.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 08:41:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP95Q-0000B0-G0
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 11:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP94q-00008e-Vn
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 11:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP94m-0005Mr-B0
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 11:40:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP94c-000563-7w; Tue, 20 Nov 2018 11:40:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8473F307DAA8;
	Tue, 20 Nov 2018 16:40:24 +0000 (UTC)
Received: from localhost (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD9368D4C;
	Tue, 20 Nov 2018 16:40:11 +0000 (UTC)
Date: Tue, 20 Nov 2018 17:40:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181120174010.3999adda@redhat.com>
In-Reply-To: <20181107123652.23417-6-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 20 Nov 2018 16:40:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-3.2 v3 05/14] qdev: move
 qdev_prop_register_global_list() to tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zGD0Zcyw1LiR

On Wed,  7 Nov 2018 16:36:43 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> The function is only used by a test, move it there.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/qdev-properties.h   |  1 -
>  hw/core/qdev-properties.c      |  9 ---------
>  tests/test-qdev-global-props.c | 18 ++++++++++++++----
>  3 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index a95f4a73eb..3ab9cd2eb6 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -249,7 +249,6 @@ void qdev_prop_set_enum(DeviceState *dev, const char =
*name, int value);
>  void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
> =20
>  void qdev_prop_register_global(GlobalProperty *prop);
> -void qdev_prop_register_global_list(GlobalProperty *props);
>  int qdev_prop_check_globals(void);
>  void qdev_prop_set_globals(DeviceState *dev);
>  void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *=
dev,
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index ab61d502fd..bd84c4ea4c 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1180,15 +1180,6 @@ void qdev_prop_register_global(GlobalProperty *pro=
p)
>      global_props =3D g_list_append(global_props, prop);
>  }
> =20
> -void qdev_prop_register_global_list(GlobalProperty *props)
> -{
> -    int i;
> -
> -    for (i =3D 0; props[i].driver !=3D NULL; i++) {
> -        qdev_prop_register_global(props+i);
> -    }
> -}
> -
>  int qdev_prop_check_globals(void)
>  {
>      GList *l;
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index ccdf6c57c1..b1eb505442 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c
> @@ -89,6 +89,16 @@ static void test_static_prop(void)
>      g_test_trap_assert_stdout("");
>  }
> =20
> +static void register_global_properties(GlobalProperty *props)
> +{
> +    int i;
> +
> +    for (i =3D 0; props[i].driver !=3D NULL; i++) {
> +        qdev_prop_register_global(props + i);
> +    }
> +}
> +
> +
>  /* Test setting of static property using global properties */
>  static void test_static_globalprop_subprocess(void)
>  {
> @@ -98,7 +108,7 @@ static void test_static_globalprop_subprocess(void)
>          {}
>      };
> =20
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
> =20
>      mt =3D STATIC_TYPE(object_new(TYPE_STATIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -216,7 +226,7 @@ static void test_dynamic_globalprop_subprocess(void)
>      };
>      int global_error;
> =20
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
> =20
>      mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -261,7 +271,7 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
>      };
>      int global_error;
> =20
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
> =20
>      mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -299,7 +309,7 @@ static void test_subclass_global_props(void)
>          {}
>      };
> =20
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
> =20
>      mt =3D STATIC_TYPE(object_new(TYPE_SUBCLASS));
>      qdev_init_nofail(DEVICE(mt));

