Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp588226wrs;
        Mon, 12 Aug 2019 06:56:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuPsVG7oUDQtPuAw4C+eeuywj1sXdxuljnWceFy19W+0ec65C2rkqMNvjiaYIb7B6jWPbK
X-Received: by 2002:aa7:d30b:: with SMTP id p11mr37592591edq.23.1565618178040;
        Mon, 12 Aug 2019 06:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565618178; cv=none;
        d=google.com; s=arc-20160816;
        b=zj2mSdeD3dxL5ZdfShh9yy+xj2KKsFptzwEIMjc9rgg8yX11sOwuEjPbPHCUNHHc3w
         Zm+k2Nwdpc4qQ9cuQwBcRL4Pd2UwQGDU5K8+hAZe8ZAsFzZAGUkY9jVfCzPFoPi8hw63
         YShsXJiTSMh27yFempl0BYORBCR1bhzQn+yLPafVHJjGYGD3zzE6YY4qo44ZK9v2ztIJ
         GAayCCtxieIim0qSrRuH/dzS12oh6ZgA6juX9YuyZPenxf77ro2oDZc7ZnItCpwsPIki
         Je2WtwYSDt0hwbivu5gUuQ9v/kWh+WGPxi2yQhzq1Bmefs0QSD7gHU2IIFmsMDVkW3vh
         Jd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=S7pg5G5dudc/z9BM8u6qrmf34WJenPrugxTzqzZrOns=;
        b=YqilAqsMXmeRCE2vlWQfgQI30S4IROAG50Ns7o8vLCK9HuyaVZafXdfpnX9rcQzb1Z
         3RKWxn69TSAkXrZb6VS5qiXZEtmb0NwCNVLYTYDcUfS85/YKKmHzWHkydDyzvNP/2L/K
         +fPUyIjGJZ3J4yF5dMpV35tsD1COtgoRkHlYU6S/Fa5UrOjk+xt6kwnKmwYr6C3S5nDd
         8rOpiUNTMFdCyPjk+OpjmeMhmEI8xvJboYFDBn7Qy9EinYseyNqqFY5hy4VFiy0sToIM
         cSpaRCL4Me2LUJJTH3n6t8Kp0ZzIdKtymJtAuZxvdangRQFM7m+9s+UkhvmQ78JXWWH6
         K2wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=I9ja2WfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fk23si1396566ejb.138.2019.08.12.06.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=I9ja2WfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxAo5-0001SQ-2g
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 09:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmJ-0006MO-Og
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmI-0008QC-Dp
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47597 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmH-0008N3-8f; Mon, 12 Aug 2019 09:54:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466cld4J7Lz9sNp; Mon, 12 Aug 2019 23:54:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618061;
 bh=qytLL0vxyRiLP/+oym4HdH86cFiEx779GD6u63ggFbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9ja2WfO6cGDy61oVkeBXYf1udNV8UJTZPZKKBNXfgM94x+VQ+zqq+HLHwRioEahB
 u/JRiShyztzjGGfPkCNbkJnZqg4lXY2h+o94hVovIoSWq1yF5yZ8+3RM3t0zpseg5A
 arP5aXq6qFkOE0ztRLLU1Q+0+bwvKmG25UYb9Gyo=
Date: Mon, 12 Aug 2019 20:29:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190812102935.GJ3947@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
 <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
 <20190809055132.GT5465@umbus.fritz.box>
 <5ba72330-dbbc-fdae-d003-9f7d08ba4600@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline
In-Reply-To: <5ba72330-dbbc-fdae-d003-9f7d08ba4600@greensocs.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH v3 08/33] Add function to control reset with
 gpio inputs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d2iRLSKMHBbf


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 10:45:43AM +0200, Damien Hedde wrote:
>=20
>=20
> On 8/9/19 7:51 AM, David Gibson wrote:
> > On Wed, Aug 07, 2019 at 11:37:51AM +0100, Peter Maydell wrote:
> >> On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.a=
u> wrote:
> >>>
> >>> On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
> >>>> It adds the possibility to add 2 gpios to control the warm and cold =
reset.
> >>>> With theses ios, the reset can be maintained during some time.
> >>>> Each io is associated with a state to detect level changes.
> >>>>
> >>>> Vmstate subsections are also added to the existsing device_reset
> >>>> subsection.
> >>>
> >>> This doesn't seem like a thing that should be present on every single
> >>> DeviceState.
> >>
> >> It's a facility that's going to be useful to multiple different
> >> subclasses of DeviceState, so it seems to me cleaner to
> >> have base class support for the common feature rather than
> >> to reimplement it entirely from scratch in every subclass
> >> that wants it.
> >=20
> > Hm, I suppose so.  Would it really have to be from scratch, though?
> > Couldn't some suitable helper functions make adding such GPIOs to a
> > device pretty straightforward?
> >=20
>=20
> This patch does that. A device does have to use the helper to add the
> gpio. Either qdev_init_warm_reset_gpio(...) or
> qdev_init_cold_reset_gpio(...) , like any another gpio.

Ah, sorry, I misunderstood.

That seems ok then.

>=20
> The mechanics to control the reset with gpio change is done in the base
> class and there is some state pre-allocated (and associated vmstate
> description) to it.
>=20
> If that's a problem I can only provide helpers and let devices handle
> state allocation and vmstate addition.
>=20
> Damien
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1RP48ACgkQbDjKyiDZ
s5I4uxAAuusYQL2ECKMDcmeQef6DRKKopUNpbEkJqNYlsxneveDDbkaH2VRVpVMe
hja+wWm+pT1tAdPlMKJM6nUwyOpUvsCBI2FhTn90MST9bT31lhHeozOnoj6TMWnY
OYtMyP9RPHS3ZvW3V1BeAj/xAOXmo9cTvd+WSD1KX639dTz1ZfiIUD1Q6qEC/P0g
t9tO82dUV09nQyCcteb2jWfnHReVeoOwIL1Oc5mZApIhKQ+rUILZ0vAXuhW0BlKu
27arS2IhGcCadra8nApvoo36KfwsfSziLQsYj0RjQxrN85bR1BsyyopResyK+FFX
MkgoK3W/zc4DeXnbCocA6AAkOyocilgdPFwwJ6UYQRJMx9KIljqcdUdPL8DpTDke
5aXKETbE0scojk4lCWgL02YgBzv+XFBk3SMPiZwfe1l8TMQQD+nIEpyyD3fBnm5m
RGzE3sD5hBKIzodpjx12fo+RMQvs/HJAH5e9YEMShldGNi64FKw1BIWOK3wkwJY3
BVfjlfh7VyXv1sPoigdZd/n+1lNDw+s5dNPg8F3BCfPIo4GpJ5Am8aSvGXvJ3Qnw
q50CCfZe4gLIsFyAnzODPt9nyHwjmTYpVIrqx3g9MNZg3boBrrKqPejHsI5WfR6S
n0yJfcSgXSpPw+BhLi4CJO6nsEOxs0hPe21r96d6S2bcPkM9VXE=
=GVlJ
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
