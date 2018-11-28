Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1340745wrt;
        Wed, 28 Nov 2018 09:53:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XXnn9to6D/H2juW5KzHMtz1SjfLKSdgfYPvK8Jmb3FhL09NU9iN7B9TLJT2SnyOMdMI5/d
X-Received: by 2002:a25:1a57:: with SMTP id a84-v6mr39771686yba.502.1543427639456;
        Wed, 28 Nov 2018 09:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543427639; cv=none;
        d=google.com; s=arc-20160816;
        b=W7To0dEo7iE29nVB6xvOpXCZKRruyn+ZRBw/sXtzCjoDm+Voj3FdCSmXar3yuC5OCv
         nH1DvuOBMCPkY0RdNunt5nWSkZjPPkjTxxZFizpYU8JIrC13PtmR9ooXbClm++zoAiVQ
         1J2OAKqG3IRBc2nzcCM5YaTa0ptyNfdYr0/+Fd5qvRsS8+qyVU/KbhGOEcWcRVsbYWnl
         18NWogGfMw9cyJRw3z6QsuC9Tn5Pax7U/zKOZsMnQAkJHiMF/1iECplajTLRx0USExgJ
         89yNanrmf96Flmd48Sk7TMAEodDe0KQY5hjUarxRcFlIKhsBXk1DT2qZyNOw6+aTzARh
         Lc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=LlXfA6L9L1w/0riIiOHmNC9fPEPKX2dcS1ZEINWyJds=;
        b=nKs+A4yEDPDyyqILgK77hnNClwf9ywfe0zq+YHjdZS8Ss2q4eCBdTmE+NI5omJZwzz
         5bwuhonMHj0YLsBAWbJcai6fXr9xSRr0rjrtvesLz1faF0y1Hlxjy+Onv1T7uW8Du/tw
         XFvBEi6XeGIIQMuJXgtRmCyDIxbJw5BJLq9hg474096CZK3P+Ke4mIzzrszJK6Rmr1n8
         KoE1iiLRxJJUlUIbDUvqCihLSWjOZ0GELwzus3l3OPdSDWY1MCZr2xwqLuk4hEBeOB4B
         KnMI2E3KQFMT0xGp+Sm1pwlVkofSDTzfpNQKXdGnOfWoYahzJYqJtX/4FWZy5y/Ici6D
         6t7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si5420123ywf.225.2018.11.28.09.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 09:53:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS42A-0000Qr-Pi
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 12:53:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gS41t-0000Nm-SC
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 12:53:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gS41q-00038Y-4r
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 12:53:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gS41p-0002HP-Ns; Wed, 28 Nov 2018 12:53:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFB253004427;
	Wed, 28 Nov 2018 17:53:19 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F69C1F2;
	Wed, 28 Nov 2018 17:53:10 +0000 (UTC)
Date: Wed, 28 Nov 2018 15:53:09 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181128175309.GY18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181128184027.7d584eaa@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 28 Nov 2018 17:53:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	david@gibson.dropbear.id.au, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uo0TM17RxAM3

On Wed, Nov 28, 2018 at 06:40:27PM +0100, Igor Mammedov wrote:
> On Tue, 27 Nov 2018 11:35:27 -0200
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>=20
> > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=E9 Lureau wrote:
> > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.co=
m> wrote: =20
> > > >
> > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lureau wro=
te: =20
> > > > > Similarly to accel properties, move compat properties out of gl=
obals
> > > > > registration, and apply the machine compat properties during
> > > > > device_post_init().
> > > > >
> > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com=
> =20
> > > > [...] =20
> > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > index 7066d28271..3b31b2c025 100644
> > > > > --- a/hw/core/qdev.c
> > > > > +++ b/hw/core/qdev.c
> > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > > >  }
> > > > >
> > > > >  static const GPtrArray *ac_compat_props;
> > > > > +static const GPtrArray *mc_compat_props;
> why you didn't use just 'compat_props' for both?
> (it would be cleaner have single registry for compat
> properties, and the place that takes care of registration
> will take care of necessary ordering)
>=20
> > > > >
> > > > >  void accel_register_compat_props(const GPtrArray *props)
> > > > >  {
> > > > >      ac_compat_props =3D props;
> > > > >  }
> > > > >
> > > > > +void machine_register_compat_props(const GPtrArray *props)
> > > > > +{
> > > > > +    mc_compat_props =3D props;
> > > > > +}
> > > > > +
> > > > >  static void device_post_init(Object *obj)
> > > > >  {
> > > > >      if (ac_compat_props) {
> > > > >          object_apply_global_props(obj, ac_compat_props, &error=
_abort);
> > > > >      } =20
> > > >
> > > > Why not just use MACHINE(qdev_get_machine())->accel->compat_props
> > > > directly?
> > > > =20
> > > > > +    if (mc_compat_props) {
> > > > > +        object_apply_global_props(obj, mc_compat_props, &error=
_abort);
> > > > > +    } =20
> > > >
> > > > Why not just use MACHINE(qdev_get_machine())->compat_props
> > > > directly? =20
> > >=20
> > > This was the approach in v3, but Igor didn't quite like referencing
> > > machine in qdev:
> > > https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04774.h=
tml =20
> >=20
> > I disagree with Igor, here.  Core qdev code already have multiple
> > references to machine, I don't see any problem with that.
> (There are only 3 calls to qdev_get_machine() in core qdev.c
> blame me for adding one there. Which were hacks so we won't
> have to re-factor core qdev code. But that doesn't justify adding more.=
)
>=20
> This patch is an interim one and later in 25/28
> device_post_init() content is moved to a more generic compat interface
> implementation. That intended for use with types derived from Object
> (i.e. not only qdev stuff). Hence I'd like to decouple it from
> machine as a standalone feature as much as possible. So that
> machine (or whatever else) will opt in in using facility.

Why do you want to decouple that from machine?  The whole purpose
of the code being added by this patch (and of TYPE_COMPAT_PROPS)
is to have objects being affected by machine-provided and
accel-provided compat properties.  Having a dependency on
machine+accel is part of its specification.


>=20
> > The previous code was clearer and easier to follow, and wasn't
> > sensitive to subtle changes in initialization ordering (e.g. what
> > happens if we create a device before *_register_compat_props() is
> > called?).
> Indeed It seems clearer to follow (that was my first impression as well=
),
> until I went through whole series and thought it's basically the same,
> So my choice was to use cleaner approach that we won't have to rewrite
> in near future.

Why you think it is cleaner?  Copying data around to static
variables isn't cleaner and it's more fragile.

>=20
> Thanks for bringing up ordering issue, we probably have one in this ser=
ies.
>=20
> But beside possible issue here, even with v3 variant we would still hav=
e
> issues if objects are created before machine and accelerator instances =
are
> created.
> More correct way could be to register compat properties right away at
> select_machine() time, we don't really need an instance for that, just =
access
> to machine_class and do the same for 'accel' option. (that's probably d=
oable
> within this series) + some time later (on top of this series) a check t=
hat
> no TYPE_COMPAT_PROPS were created at the moment compat properties are r=
egistered
> so we would notice when we write something wrong.

What problem you are trying to solve with this extra complexity,
exactly?

>=20
> If it's too much of refactoring (series is already big as it is), I wou=
ld
> compromise on qdev_get_machine() and adding TODO comments (or a series =
on top)
> to make it correct and "race-resistant".

It's not clear to me what the TODO comment would say.  What's the
issue you're trying to solve?


>=20
> Marc are you sure it actually will work as expected with Object derived=
 types?
>    register_global_properties()
> is being called after
>    qemu_opts_foreach(... user_creatable_add_opts_foreach, object_create=
_initial ...)
> so there is no compat properties registered when objects are created.
> =20
> > >  =20
> > > > =20
> > > > >
> > > > >      qdev_prop_set_globals(DEVICE(obj));
> > > > >  } =20
> > > > [...]
> > > >
> > > > --
> > > > Eduardo =20
> >=20
>=20

--=20
Eduardo
