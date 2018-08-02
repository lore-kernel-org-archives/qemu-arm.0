Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1636340wru;
        Wed, 1 Aug 2018 23:47:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd+hoDUAC1MvD/hNKSEfrgo4aI6Nn8GR+QFAkVTouNZ7A/g93Sq9aFn5m6riD2VX7GsxrMS
X-Received: by 2002:a0c:b792:: with SMTP id l18-v6mr1406034qve.110.1533192469610;
        Wed, 01 Aug 2018 23:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533192469; cv=none;
        d=google.com; s=arc-20160816;
        b=O5C6kRMx0w0i1G7zEzD4U0F9Iv/wJtSUqTBdMStF/nqc4/wRAoE4kaF9usmPvgxHlb
         sMFRFHprJp28ZyUSHBYPT8jaqpbjQSj/pZtcR+GAPm9+1iqfLguJm9cL3VBfIE1aXwXs
         K5Fhwz09TN9/vNFXaS6/GP/X2CMPkS9JjyGsUtA7jYoN6UDrFqpu6t5v3tj4hB8XPcoZ
         0ByGzwBpp2Nz8ibCQYBteL6RvMf6LEX3T21bSNX2juiel0GFteJxZUXOZ7emkxxf+SRA
         SoOoFwDjebJ/ez7ZzPr4tcK/5NIS2o+DyFEL3NchleZhaEop6RB4/0SysByFyllQJJPR
         W9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=OnKHyuvQwPpkGeY+W2VIiAGZCNc08RukCsi2Caww7PU=;
        b=XP8PFIXhJeWmJEh/VDByBIRudHg+Gqw47/K61tRx8QGF/9X4WSzEydMZKxxaQVB74j
         G3l0gD7gQxBcMyh2+h16x9Kr15OSDZ1UqnlL5be7TzMh2yB5UAk1cxxQKQpkC8Q9FbcG
         AyGXxgk7zKOuadaALfWhNltq564xAviMoFBH2e7qSMEGbNmiEj1S3y7ca0ux4tKooa8S
         /nJrruwxhPeOMHEb3e8S0uqD7LDad/fs54G3/hUH0SUOkYARXzKiXlJ+FvyFFOnA0L7j
         HZYvy1aXfeYBxcYr2XoZWXZrgiC3OFFiFDxXZ2BXyPUNau+CTL3V9ohBfOpPJLbWSKFq
         tpXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fcwMllVE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si1145146qtk.181.2018.08.01.23.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 23:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fcwMllVE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fl7On-0006X8-69
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 02:47:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7OW-0006X3-I6
	for qemu-devel@nongnu.org; Thu, 02 Aug 2018 02:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7OT-0001Mn-GM
	for qemu-devel@nongnu.org; Thu, 02 Aug 2018 02:47:32 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:51096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fl7OT-0001M1-8J; Thu, 02 Aug 2018 02:47:29 -0400
Received: by mail-wm0-x243.google.com with SMTP id s12-v6so1180925wmc.0;
	Wed, 01 Aug 2018 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OnKHyuvQwPpkGeY+W2VIiAGZCNc08RukCsi2Caww7PU=;
	b=fcwMllVEfjwwK6QuVopt7sJ6KRqyUl2RqkNNuTTuIlZoPf0DJ76D81b9COsRvqu7X4
	e+T2fu2bv6Gez8xfmNQsDoHGdr99Yy3nqovDEqv5hfomnOJAhg8BEY/KzPgYJovGW74H
	05xrHraQvqvxeZu5KpyXT358bEwDqed6hmy2tECuyKzyF5RXfJmsCTeLn/0nl3YxcO96
	akwK8c0HSmNPe9K4Rw8lU6UR+4i47YsQuD7amCqOfS+YWb2xx7oe53uKfNc9DBYXOYM3
	pMat47qvNXZpFYfCRjSYVXcwTBEWg9Mn7GbXWvA/Yc+a0wFiRgpIL0kNx7C4ZWwloG0X
	lF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OnKHyuvQwPpkGeY+W2VIiAGZCNc08RukCsi2Caww7PU=;
	b=bcoFH4T3Nm6RHnBkkL+pZGLHqMALKHBG8jbMh/4npj2tuhoQbuyzBzf7kzQ+3hObpr
	tyM5C0GQQqnWHGX2K4XboTIsxwdR4sVlJGswh5FGPH9ghF8fnyidWCcHbV+U6ihqFwA/
	igSnjgQyJ4j7hccpFsdZ4IEnKfT2JnEBWIzqTNn1MNLuPql0Zw+2pp4pCQk3bLDmzXCF
	saXP0KyX2CM93QZMTI8c6hw8PZfOaPe33J7OhVfiX6x2UYJrB2s56Q/F8J5MHmbJ4eFD
	ROO+Jts7fVeR0azzMsJ6oUvLT59G6k3mAq1WkvZCGo4FQEttLb+K4tRCNPu0/SMOn5Wa
	0JVQ==
X-Gm-Message-State: AOUpUlFB/woU85PAZjoRqSIFWoRX/uwy4HCfq94/y2A7kTVuHfHOF4FF
	wYrB9gt8Mm4yyq5WlJhRJos=
X-Received: by 2002:a1c:888e:: with SMTP id
	k136-v6mr1100799wmd.6.1533192447974; 
	Wed, 01 Aug 2018 23:47:27 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	m68-v6sm1307970wmb.10.2018.08.01.23.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 23:47:26 -0700 (PDT)
Date: Thu, 2 Aug 2018 07:47:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180802064725.GA13481@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-5-stefanha@redhat.com>
	<CAFEAcA92R=_aLRSJ0Jqsir8kmcFExNUUhZgyw0PSDuSc--GD6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <CAFEAcA92R=_aLRSJ0Jqsir8kmcFExNUUhZgyw0PSDuSc--GD6Q@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU
 model
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v4Irrl6skqOU


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 06:52:29PM +0100, Peter Maydell wrote:
> On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Define a "cortex-m0" ARMv6-M CPU model.
> >
> > Most of the register reset values set by other CPU models are not
> > relevant for the cut-down ARMv6-M architecture.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  target/arm/cpu.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 3848ef46aa..7e477c0d23 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
> >      cpu->reset_auxcr =3D 1;
> >  }
> >
> > +static void cortex_m0_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +    set_feature(&cpu->env, ARM_FEATURE_V6);
> > +    set_feature(&cpu->env, ARM_FEATURE_M);
> > +
> > +    cpu->midr =3D 0x410cc200;
> > +}
>=20
> We have all the patches for turning off not-v6M bits of
> behaviour either in master or in target-arm.for-3.1 already,
> right?

Yes.  I've sent this series because Julia's work is now in
target-arm.for-3.1.

Stefan

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbYqj9AAoJEJykq7OBq3PItk4IAIO0i0O1ZEqBFIllq904rqau
SumY/XwrBtplyUvVrHLIGThHP4KyehoMXajT1M45ddvOT/vAZzAZNpPu2VzkO1Yi
jM3eCBNDN4X7qqUvIdRLj3AMLPn6fiJMvalzI9JGeUPoEUafdeMm4hv5KKNA/43z
B4h9SrGB/Z5xfHa6f9eSUFAD1Ofx9MIK25UrKq9kGNZSM3mMnQau15mNBDXOOWNy
w4VV5jGmYx5d/BqmjrL0JDzlt8OJ6K77Q+SCbDyriqXn2Nbz9XoxoCT2ICLtS916
vojRG+qvecbGE7Tlz44/zu8QK+8hJJSIIBsmPYH8iSJO0Vn1y2bsG+D22+798bU=
=PHIx
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
