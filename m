Received: by 10.25.44.15 with SMTP id s15csp5139313lfs;
        Tue, 11 Jul 2017 10:34:37 -0700 (PDT)
X-Received: by 10.200.45.182 with SMTP id p51mr1445648qta.208.1499794477493;
        Tue, 11 Jul 2017 10:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794477; cv=none;
        d=google.com; s=arc-20160816;
        b=TL/qBvErlKEWq/SzdF342aAsWml3bvXw0ACsar7GnaPHV4LZIGvEerTgHX9YQTQYXc
         p88uQSLZ0n4ruz5fpomLM11qrQ9lEheL6vo/miA/kHB2eljFkGJmzTQnoG+ORI9k+HNk
         y88qx5t4f+SWfU4zmIJNPdwyO80BHfZpB1p7cj6CMZ/goa1kFWTRZXLZdgYsXwQosrRo
         ZQaJxLyp/AIbac6OdhsXdRkeWgEr0TYlyY3lXZ5D73Z+bNzgx8g7ZqoGzQ55UdcdVJJB
         bBjB7hD0GQHuwn/Co2FCazM0xA5KYDm9V3H1gN6zDn3hdLKXcn2dxcZkvEAWrPA091bP
         XrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=r+S5g49SAfmqpJ4ZNzrlOhUHBz+5CNQhWIbP7WRrUT4=;
        b=hmQqVGBeqc548FbPHSoF98w8HUlVm0DgQCEI5KCCzy1N94GlWUgJ0OAUmZ2UxzlDOh
         9Yb+exADYoK6zMIOq2NMaehb4E+5toB6Oqpxw2jV4zJXnUn8Iuo1IvmC2fDV3yR+zm/M
         0WXwKq5cwv6mBsb+FpYOqbHC03LRKrj+A3WAcrot0Ie124ZL0AcAGZMh/svogXbfVrBH
         fWfugRS7wu1Uz/3Gwu66dUvxNIFjytzK1YqznEWpA/dc2yFF4QJD75QeBi4cLyWxjcI3
         v8Z49ZeGNB2czqRup//0hQP2etj4nALyFcq1plwhCc10zCVbpz5142Jm41NHjBAASLGb
         cDKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v44si489261qtc.157.2017.07.11.10.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz3S-0002ji-Mw
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:34:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUykn-0002Ox-SC
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUykj-0002hw-Qu
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:15:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1dUykg-0002eN-MV; Tue, 11 Jul 2017 13:15:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85AB38E751;
	Tue, 11 Jul 2017 17:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 85AB38E751
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mlureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 85AB38E751
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E4B1729C9;
	Tue, 11 Jul 2017 17:15:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BB0A261;
	Tue, 11 Jul 2017 17:15:09 +0000 (UTC)
Date: Tue, 11 Jul 2017 13:15:08 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1158652012.49603326.1499793308542.JavaMail.zimbra@redhat.com>
In-Reply-To: <1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.112.26, 10.4.195.17]
Thread-Topic: qdev: support properties which don't set a default value
Thread-Index: MU0GF+8E7Epter2mN3Z9Olf2oHrGJw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 11 Jul 2017 17:15:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] qdev: support properties which don't
 set a default value
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IpTwz0KoEN4W

Hi

----- Original Message -----
> In some situations it's useful to have a qdev property which doesn't
> automatically set its default value when qdev_property_add_static is
> called (for instance when the default value is not constant).
>=20
> Support this by adding a flag to the Property struct indicating
> whether to set the default value.  This replaces the existing test
> for whether the PorpertyInfo set_default_value function pointer is
> NULL, and we set the .set_default field to true for all those cases
> of struct Property which use a PropertyInfo with a non-NULL
> set_default_value, so behaviour remains the same as before.
>=20
> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
> of wanting to set an integer property with no default value.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

minor comment below

> ---
> Since the previous patch fixed the only case that was
> using a default value but not explicitly setting .defval.[ui],
> this patch is a bit easier to review: .set_default =3D true
> is added in exactly the places that initialize .defval.[ui].
> ---
>  include/hw/qdev-core.h       |  1 +
>  include/hw/qdev-properties.h | 20 ++++++++++++++++++++
>  hw/core/qdev.c               |  2 +-
>  3 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 9d7c1c0..d110163 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -226,6 +226,7 @@ struct Property {
>      PropertyInfo *info;
>      ptrdiff_t    offset;
>      uint8_t      bitnr;
> +    bool         set_default;
>      union {
>          int64_t i;
>          uint64_t u;
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 36d040c..66816a5 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -43,15 +43,24 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      =3D &(_prop),                                        =
  \
>          .offset    =3D offsetof(_state, _field)                         =
  \
>              + type_check(_type,typeof_field(_state, _field)),           =
\
> +        .set_default =3D true,                                          =
  \
>          .defval.i  =3D (_type)_defval,                                  =
  \
>          }
> =20
> +#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type=
) {
> \
> +        .name      =3D (_name),                                         =
  \
> +        .info      =3D &(_prop),                                        =
  \
> +        .offset    =3D offsetof(_state, _field)                         =
  \
> +            + type_check(_type, typeof_field(_state, _field)),          =
\
> +        }
> +
>  #define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval) {  \
>          .name      =3D (_name),                                    \
>          .info      =3D &(qdev_prop_bit),                           \
>          .bitnr    =3D (_bit),                                      \
>          .offset    =3D offsetof(_state, _field)                    \
>              + type_check(uint32_t,typeof_field(_state, _field)), \
> +        .set_default =3D true,                                     \
>          .defval.u  =3D (bool)_defval,                              \
>          }
> =20
> @@ -60,15 +69,24 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      =3D &(_prop),                                        =
  \
>          .offset    =3D offsetof(_state, _field)                         =
  \
>              + type_check(_type, typeof_field(_state, _field)),          =
\
> +        .set_default =3D true,                                          =
  \
>          .defval.u  =3D (_type)_defval,                                  =
  \
>          }
> =20
> +#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _ty=
pe)
> { \
> +        .name      =3D (_name),                                         =
  \
> +        .info      =3D &(_prop),                                        =
  \
> +        .offset    =3D offsetof(_state, _field)                         =
  \
> +            + type_check(_type, typeof_field(_state, _field)),          =
\
> +        }
> +
>  #define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval) {       =
\
>          .name      =3D (_name),                                         =
  \
>          .info      =3D &(qdev_prop_bit64),                              =
  \
>          .bitnr    =3D (_bit),                                           =
  \
>          .offset    =3D offsetof(_state, _field)                         =
  \
>              + type_check(uint64_t, typeof_field(_state, _field)),       =
\
> +        .set_default =3D true,                                          =
  \
>          .defval.u  =3D (bool)_defval,                                   =
  \
>          }
> =20
> @@ -77,6 +95,7 @@ extern PropertyInfo qdev_prop_arraylen;
>          .info      =3D &(qdev_prop_bool),                          \
>          .offset    =3D offsetof(_state, _field)                    \
>              + type_check(bool, typeof_field(_state, _field)),    \
> +        .set_default =3D true,                                     \
>          .defval.u    =3D (bool)_defval,                            \
>          }
> =20
> @@ -110,6 +129,7 @@ extern PropertyInfo qdev_prop_arraylen;
>                            _arrayfield, _arrayprop, _arraytype) {        =
\
>          .name =3D (PROP_ARRAY_LEN_PREFIX _name),                        =
  \
>          .info =3D &(qdev_prop_arraylen),                                =
  \
> +        .set_default =3D true,                                          =
  \
>          .defval.u =3D 0,                                                =
  \
>          .offset =3D offsetof(_state, _field)                            =
  \
>              + type_check(uint32_t, typeof_field(_state, _field)),       =
\
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 849952a..96965a7 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -793,7 +793,7 @@ void qdev_property_add_static(DeviceState *dev, Prope=
rty
> *prop,
>                                      prop->info->description,
>                                      &error_abort);
> =20
> -    if (prop->info->set_default_value) {
> +    if (prop->set_default) {

Not sure if it's worth to have an assert(prop->info->set_default_value), pr=
obably not necessary.

>          prop->info->set_default_value(obj, prop);
>      }
>  }
> --
> 2.7.4
>=20
>=20
