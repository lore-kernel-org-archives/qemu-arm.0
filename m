Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1335864wrt;
        Wed, 28 Nov 2018 09:49:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VK5uOKMnH0sz+P6jopOFjHnxCOzceCbYqjIYiXMm+jVExL8BdAM/1plQCJSBAhZVZM/5kr
X-Received: by 2002:a81:b101:: with SMTP id p1mr30558438ywh.454.1543427363286;
        Wed, 28 Nov 2018 09:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543427363; cv=none;
        d=google.com; s=arc-20160816;
        b=WZfz2LjjlUpHb4c2+WFN+kMD7vJesuGafYYF7vL6DsonTX9U4BZr+30AEIuoW8Athi
         YvKL2ECqWYFWTrjKayk5m0LmPaSTpODu4XGbV3l26Jrdcsytq9HxVDAkqr5EBBRZy1bS
         X6uHfLNTl8dwZm5lguolZIY5cfVMwsKl1L+nmLVj0XgArqbUtTiBuEQAyLoU4IerWYPn
         US+1ewEUnuQjuMS7Qk7YNci9ZD7AdCPrQYk6vxBCdA75HD1V0bdYaKFXWytKcanMTiGt
         Sjni4ysj1zOABtCA09GfwwyT9LT2LptzDcWHiSBvP9voLC/GS0Neld+q2Dl2hzESLC48
         2M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=lnZYO5/tkw++etkLhTg1oVu6dZea4uM2RskNFLoQpU8=;
        b=U/isCzbjMS57ByYuWthiEX/KOCmhpvVeEMaMFi22mwTjgMIqg5ZCDF8BVyH/7CzKEr
         AKDm0YbxcYLbFFYpVq3OAv+R+LZgr5cctPx0E8S80tJjS+EHuUDMbB+a78/6IAYIGwKn
         WTguagxMBJL6XQBC2MYkench4Q1ViBQ+ILWzVkU1zp4bGdvGhuUzIyCkuRQ8Z7uvCk7C
         4DEDVA7QRajWqmYB36jKoDBrhaPnqdGcxNryQo9uCQTV7+HB9geDroqkqVwebP257tqr
         0+OHlVSkIg73KpsLDLrPUlrk7Y4cdiLvpWOXrQTmjo+riC0D8jqZPHIBeLxVfEilGsBH
         +hzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si5746871ywc.104.2018.11.28.09.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 09:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS3xi-0001oh-Ln
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 12:49:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gS3wu-0000wS-LQ
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 12:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gS3pd-0005KX-5j
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 12:41:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gS3pc-0005FE-Un; Wed, 28 Nov 2018 12:41:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3766E89AE9;
	Wed, 28 Nov 2018 17:40:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36624D1DF;
	Wed, 28 Nov 2018 17:40:29 +0000 (UTC)
Date: Wed, 28 Nov 2018 18:40:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181128184027.7d584eaa@redhat.com>
In-Reply-To: <20181127133527.GI18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 28 Nov 2018 17:40:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v4 16/28] hw: apply machine compat
 properties without touching globals
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
	"Michael S . Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
	David Hildenbrand <david@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, borntraeger@de.ibm.com,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Bonzini,
	Paolo" <pbonzini@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	david@gibson.dropbear.id.au, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hW6d4lktVgY8

On Tue, 27 Nov 2018 11:35:27 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.com> w=
rote: =20
> > >
> > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e: =20
> > > > Similarly to accel properties, move compat properties out of globals
> > > > registration, and apply the machine compat properties during
> > > > device_post_init().
> > > >
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=
 =20
> > > [...] =20
> > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > index 7066d28271..3b31b2c025 100644
> > > > --- a/hw/core/qdev.c
> > > > +++ b/hw/core/qdev.c
> > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > >  }
> > > >
> > > >  static const GPtrArray *ac_compat_props;
> > > > +static const GPtrArray *mc_compat_props;
why you didn't use just 'compat_props' for both?
(it would be cleaner have single registry for compat
properties, and the place that takes care of registration
will take care of necessary ordering)

> > > >
> > > >  void accel_register_compat_props(const GPtrArray *props)
> > > >  {
> > > >      ac_compat_props =3D props;
> > > >  }
> > > >
> > > > +void machine_register_compat_props(const GPtrArray *props)
> > > > +{
> > > > +    mc_compat_props =3D props;
> > > > +}
> > > > +
> > > >  static void device_post_init(Object *obj)
> > > >  {
> > > >      if (ac_compat_props) {
> > > >          object_apply_global_props(obj, ac_compat_props, &error_abo=
rt);
> > > >      } =20
> > >
> > > Why not just use MACHINE(qdev_get_machine())->accel->compat_props
> > > directly?
> > > =20
> > > > +    if (mc_compat_props) {
> > > > +        object_apply_global_props(obj, mc_compat_props, &error_abo=
rt);
> > > > +    } =20
> > >
> > > Why not just use MACHINE(qdev_get_machine())->compat_props
> > > directly? =20
> >=20
> > This was the approach in v3, but Igor didn't quite like referencing
> > machine in qdev:
> > https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04774.html =
=20
>=20
> I disagree with Igor, here.  Core qdev code already have multiple
> references to machine, I don't see any problem with that.
(There are only 3 calls to qdev_get_machine() in core qdev.c
blame me for adding one there. Which were hacks so we won't
have to re-factor core qdev code. But that doesn't justify adding more.)

This patch is an interim one and later in 25/28
device_post_init() content is moved to a more generic compat interface
implementation. That intended for use with types derived from Object
(i.e. not only qdev stuff). Hence I'd like to decouple it from
machine as a standalone feature as much as possible. So that
machine (or whatever else) will opt in in using facility.

> The previous code was clearer and easier to follow, and wasn't
> sensitive to subtle changes in initialization ordering (e.g. what
> happens if we create a device before *_register_compat_props() is
> called?).
Indeed It seems clearer to follow (that was my first impression as well),
until I went through whole series and thought it's basically the same,
So my choice was to use cleaner approach that we won't have to rewrite
in near future.

Thanks for bringing up ordering issue, we probably have one in this series.

But beside possible issue here, even with v3 variant we would still have
issues if objects are created before machine and accelerator instances are
created.
More correct way could be to register compat properties right away at
select_machine() time, we don't really need an instance for that, just acce=
ss
to machine_class and do the same for 'accel' option. (that's probably doable
within this series) + some time later (on top of this series) a check that
no TYPE_COMPAT_PROPS were created at the moment compat properties are regis=
tered
so we would notice when we write something wrong.

If it's too much of refactoring (series is already big as it is), I would
compromise on qdev_get_machine() and adding TODO comments (or a series on t=
op)
to make it correct and "race-resistant".

Marc are you sure it actually will work as expected with Object derived typ=
es?
   register_global_properties()
is being called after
   qemu_opts_foreach(... user_creatable_add_opts_foreach, object_create_ini=
tial ...)
so there is no compat properties registered when objects are created.
=20
> >  =20
> > > =20
> > > >
> > > >      qdev_prop_set_globals(DEVICE(obj));
> > > >  } =20
> > > [...]
> > >
> > > --
> > > Eduardo =20
>=20

