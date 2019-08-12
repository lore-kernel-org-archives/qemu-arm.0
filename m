Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp586582wrs;
        Mon, 12 Aug 2019 06:54:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoDRZUHPoEzmTtenXketm3/hdltJH2IuaYjtbBf/Rp5oK2GODWXJ7RvFVqGbjTLOfI6oCp
X-Received: by 2002:a37:a492:: with SMTP id n140mr27789747qke.137.1565618075050;
        Mon, 12 Aug 2019 06:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565618075; cv=none;
        d=google.com; s=arc-20160816;
        b=H2PKc/WlgC8IP7oyls9aMOSzQ71OVW9RbOoTnKrlS0IIjdD/gJ/zyPQE1zY6o8b4O/
         kNGJRvFcOCSDVfSWlCKTbLM7xwWQSxtRqjlmjyb8vu3q9S4KSPuPBLxeoj4IGZ7qJGd7
         Ug4hJlgNM49ffsoaRHWpetbSQ5URZR7BUt3pLP4Sjd0lHFAaD1eYsA9maTCF8WDnqqiD
         EaRljrSAcjyEz6ERO+rfYqSxeaC+XNhqfgevqX1m7zwYEq5MZ2sYl4McCevpeOEUenQZ
         Z62KIjYjg2ht0YYl4G87svqF8QyePpRD+4UrjDIu2yV6qS6+Q3po33nL/YZ9hV2jFXV4
         EuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=mQhA2aY3CuquEUaLnzDG1k0KP2GYq3gSUoGhfeVzJS4=;
        b=WNy57FJshOe583ov8MXQ33WWbZQtKpiGZdE8sxaBIZdqFhv1v7wFd/bcK8fNivIQaI
         MC8OwGAZchE2vzdJNiaavOYIjun71KYM61X9p5Yb7VRb1A7Eb/g+HrlOr8nBo2sX9iWI
         dUMGFyewYqH0jz4k8ozDPAVUiowk+IdnabDcO4LWQFELAM/TyRW+lbtFH5qj1BqTr2Dv
         ZcyoCIsd4v/qr1t54+j8LEZhvIWd1TsTSh+HA+BCBsK5RaBH3YH4ZWJUpG0qCp+w2dE0
         xhu8n/gTZO4xa2OSiUxD+JuRV7dEOBCKLtgsFUw6eiq0bi0OxL7aHVt6zbgxNWYLeopQ
         Qeqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QdvOCA9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si3783429qve.9.2019.08.12.06.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QdvOCA9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxAmQ-0006NC-Iw
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 09:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmJ-0006MP-VT
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmI-0008QG-E2
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53173 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmH-0008N6-5y; Mon, 12 Aug 2019 09:54:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466cld39L0z9sP8; Mon, 12 Aug 2019 23:54:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618061;
 bh=p0zKZ0oqRCQOxt10uMnafHngiiXzV6qoJ9pUWo6KwL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdvOCA9UkgWMuQl7qg0T4BAxuQbhEt6XJkqwY76EeygqAlMZK8XFA/gt4MGR5J197
 +KdP5z1J7aRCyjzXRhMe+xjCI4JkCdStGN4Ret8YC9JUeZ+3q8li07sTWrAM5jaKeT
 hTsaSmVBYBQoZDOP6FMALlTjkvm4h0In0r3kHXI8=
Date: Mon, 12 Aug 2019 20:15:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190812101512.GG3947@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-10-damien.hedde@greensocs.com>
 <20190731063044.GG2032@umbus.fritz.box>
 <CAFEAcA97PbDP3XrtHCXuiwZorC7B8hY_EGL+iRLsJeC=L=kekw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <CAFEAcA97PbDP3XrtHCXuiwZorC7B8hY_EGL+iRLsJeC=L=kekw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH v3 09/33] add doc about Resettable interface
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
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
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oK77ShuxzULW


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 05:01:42PM +0100, Peter Maydell wrote:
> On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Mon, Jul 29, 2019 at 04:56:30PM +0200, Damien Hedde wrote:
> > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > > +For Devices and Buses there is also the corresponding helpers:
> > > +void device_reset(Device *dev, bool cold)
> > > +void bus_reset(Device *dev, bool cold)
> >
> > What's the semantic difference between resetting a bus and resetting
> > the bridge device which owns it?
>=20
> We should definitely explain this in the documentation, but
> consider for instance a SCSI controller. Resetting the
> SCSI controller puts all its registers back into whatever
> the reset state is for the device, as well as resetting
> everything on the SCSI bus. Resetting just the SCSI bus
> resets the disks and so on on the bus, but doesn't change
> the state of the controller itself, which remains programmed
> with whatever state the guest has set up.
>=20
> PCI has a similar distinction between resetting the controller
> and resetting the bus.
>=20
> Note that we have this distinction in the current APIs too:
> qbus_reset_all() vs qdev_reset_all().

Yeah, sorry, I didn't express my concern very well... and now I've
kind of forgotten the details of it.  I think the oddities you also
pointed out with the state saving made me think the two were
sorta equivalent in this patchset, but the interface suggested otherwise.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1RPDAACgkQbDjKyiDZ
s5KNphAAt7gS5uzipD+JYovvdN+zvCpyBahjgREC+PpQfUg67snMTvJh1KNRlYA4
muZlHe/paQDCEMWDp+XbfpAr0mKbyQvwPVZXoll2a4Zh6wFnhP8glulq+s7nB9bo
e716vPs+vrhZPWfpcrqd4+1wb3VJr8TUvEZf7g568ll9b+5v67BTDLdibSGbq5OU
iIHmL4seY4DiaitPPqaCW4ahFeK5qAwsYGPiPrNE5jT8huLPNZl/zkU2VBNtzPgh
COdUOaa8sSsu3/ocxnQ1IPBodAvvqTtI6WJvwQJIoqenwyq0pyy6zURMUlJHCxhy
FlMDmhGLBuw7lyv8utegH/VoSuglkmlYOdIoyXKQkXm50kJJoo8KOyAi5olIAiLD
B9EI+lpcU2VPshWBHsFETdEoSsg5VHEJsY3h7TAO7zyHzfp1/avL2MnAjijx5WWJ
/iHwh4G/zTVxB2Nxiw+aieVTB2LQKZAPKOeUH93BAeWLmyBRsmlXZLnqGOAOtqTx
e8JJvhlLTsTa2CZlZv/lgbNys2R0xPp8WtLiZ6sujO8AKIlyXvXFdSjNjlpD3XdZ
RKG0V8dvZlvJP12gK2tj9Wc6xDeIRTnjNZYk2yCz2IQ9z7aY4avMb9nMsFthgU37
v4Y/5aoeejZzA81K4ZPjk8JsT/YpWwQysQtIgfOGefuGl8W74+M=
=pC2r
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
