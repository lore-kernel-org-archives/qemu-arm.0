Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1279801wrt;
        Tue, 27 Nov 2018 05:36:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wdje0ir8xeqV5Vq8wi8AWWyfldOYb6sDONEpRnC41E70lVwaNJvDKG/GBTa/YY2nHCCHQ4
X-Received: by 2002:a25:5a04:: with SMTP id o4-v6mr32977119ybb.348.1543325772562;
        Tue, 27 Nov 2018 05:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543325772; cv=none;
        d=google.com; s=arc-20160816;
        b=CtOn1SMqs2ym1o7AjQT+QlFI65uDc9UgquAAnZRNLjehqesZOFu0RHtiqywFuzs6fu
         Z56LKq2AOzTUcox5ygA1wK1X5CnT3Y3x87F9KnSpqKrpRbq7LN7kGEImzvtyxvJIMazp
         l7DhM+kSQ6+1tq+EUWrcs+rVtmX0OUvMxMGDzKTbCao8j0Sf3quh/Nvntc9LBoxTzMuV
         IXT9gxTGyuuibI8RKZtjtToxPyXQkhdIH93J58R3KyI+TmQqrcYbVqY19iO+aIUHAe3H
         jAYIRyhvF5/fY5e1r/tkZIY6O8MBjp+EUeE+HVLlT2AU/uLlYdk00O6pVTZhN39357p+
         DJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=lOIW0JYxdFPkNac6hifmBJFYZggwh7H3uR7Mo9rfGOc=;
        b=sqCKyr2r8va+Kq/KRAfumzCcviczbpbh3H4ieQpEDtE1CN1xzrYFhdvsornlmJ4n2v
         1gepfDDy1WpyAC4CQkVlnIyEHIX58R70U7G3KP9tArVR7CMPDc2dgE1ws2z8A0OinLfE
         SqPrix/F3swp/N3xW7+fBQVSbMKdlbH7Nh+TU9qsBDGqdODfNJkKnzAvImqg2IBZNLIY
         wcJMoJPNPl/TxwBEqP3hDk/0Q2fExrfqAbsP4G79ls7WW5A0gNWvSxkd7qnRwlejNW1u
         73wLoXLsb4fisy67LUErqRrN7WP/HuFKwtqFAGEr0Sqm2OUEpYyLpEZF0NyohrLYjQeT
         +YaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si343543ywe.154.2018.11.27.05.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRdXA-00065y-35
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:36:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRdWw-00064t-GB
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:35:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRdWr-0000CP-J9
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:35:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gRdWr-0000BL-Bh; Tue, 27 Nov 2018 08:35:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA1045F72B;
	Tue, 27 Nov 2018 13:35:51 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 971F6513F5;
	Tue, 27 Nov 2018 13:35:29 +0000 (UTC)
Date: Tue, 27 Nov 2018 11:35:27 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181127133527.GI18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 27 Nov 2018 13:35:52 +0000 (UTC)
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
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWlYgtgW/iWN

On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=E9 Lureau wrote:
> On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.com> w=
rote:
> >
> > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Similarly to accel properties, move compat properties out of global=
s
> > > registration, and apply the machine compat properties during
> > > device_post_init().
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > [...]
> > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > index 7066d28271..3b31b2c025 100644
> > > --- a/hw/core/qdev.c
> > > +++ b/hw/core/qdev.c
> > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > >  }
> > >
> > >  static const GPtrArray *ac_compat_props;
> > > +static const GPtrArray *mc_compat_props;
> > >
> > >  void accel_register_compat_props(const GPtrArray *props)
> > >  {
> > >      ac_compat_props =3D props;
> > >  }
> > >
> > > +void machine_register_compat_props(const GPtrArray *props)
> > > +{
> > > +    mc_compat_props =3D props;
> > > +}
> > > +
> > >  static void device_post_init(Object *obj)
> > >  {
> > >      if (ac_compat_props) {
> > >          object_apply_global_props(obj, ac_compat_props, &error_abo=
rt);
> > >      }
> >
> > Why not just use MACHINE(qdev_get_machine())->accel->compat_props
> > directly?
> >
> > > +    if (mc_compat_props) {
> > > +        object_apply_global_props(obj, mc_compat_props, &error_abo=
rt);
> > > +    }
> >
> > Why not just use MACHINE(qdev_get_machine())->compat_props
> > directly?
>=20
> This was the approach in v3, but Igor didn't quite like referencing
> machine in qdev:
> https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04774.html

I disagree with Igor, here.  Core qdev code already have multiple
references to machine, I don't see any problem with that.

The previous code was clearer and easier to follow, and wasn't
sensitive to subtle changes in initialization ordering (e.g. what
happens if we create a device before *_register_compat_props() is
called?).


>=20
> >
> > >
> > >      qdev_prop_set_globals(DEVICE(obj));
> > >  }
> > [...]
> >
> > --
> > Eduardo

--=20
Eduardo
