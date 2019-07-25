Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11560237wrv;
        Fri, 26 Jul 2019 00:30:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUaWwe169u8a6qdbOoK8bPGDtMD3RqrewOVasZMuIbGT4u5x34NDxBehHszNA7TvxpR+Eu
X-Received: by 2002:aa7:c2c8:: with SMTP id m8mr80686725edp.63.1564126233549;
        Fri, 26 Jul 2019 00:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564126233; cv=none;
        d=google.com; s=arc-20160816;
        b=KUbvsNkVMh1FKXirDpFgJA5EXJxlkhHKOB4dApGBJ84hm0W94z6nlP60GiZOKay+Mq
         UfHnsnKCoOVAelzJMPiQPmIYm0y5eYwX/l9w0YwXG843jW758lhS4kgs+Y9fRwx4eIDP
         C/j1FlD3EMqu+ljbu1CK0n9AxN0/wgTScwyoXHd8yuYNN8C306qVWo0v6HJibJ4hgFgr
         d3osu77aUFIKoZh2zfMZ5h4ryrE40/zzDJuzSaESOwmhxdIU3dJlhMaLhEPMOKh/po5t
         6ghMmTnVLjchfYV84ufX/OWoKenpO7PgVTd1Le6KyHd45NdZJ+MK0iMIhLP83U6J1abQ
         ZiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=XCG1XsX5TULoX97moVf5NJrMaQ1SNpb6Uo710ySNGvk=;
        b=GQtcbm1AsSD3LuFuCCvJCe1Id0DbPOqxlziyumvCMs2AQOFNvOplYMqIAm78NCZFHA
         Pb7hOHCnAlvYvfFDSxlYnE5DyBJ9gV0E8pTTGE8iS2RhthO+B0uRmh9jsLpK0yv7Jrmz
         R17F1Cxg9/VQYFNALae5Hh6E39VRO0nXyrTzQKAC61hbFnMo4NBShfzwB/rT8jEv885B
         zezXv/LyNRMcvxB92RksFmTcUnaA0SyYNtLohZfErmLlOjOvpco1IvvlImjEijrSeHn5
         T+o8SqrZSY/YYkIgmNNJDnowlpsefbQMrGzcCjO/GjZPiu9nC6R2VnQ32y9q1oePa04y
         aWtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=cM3cEF3k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z40si12039779edc.260.2019.07.26.00.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 00:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=cM3cEF3k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqugP-0002jo-QD
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 03:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hquff-0000e9-18
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:29:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hqufb-0005JH-T3
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:29:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57821)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hqufV-0004YD-O7; Fri, 26 Jul 2019 03:29:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45w11J1rBVz9sBZ; Fri, 26 Jul 2019 17:29:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564126164;
 bh=Pzy0vgp7asCKngwZxuCI/GX0nFz5gexF168CIHS12QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cM3cEF3kSx4cIt5EdGv0JEujelGn0qn2+GWRCIGLIzFUaVQzS067m0Xt26WEL/3H4
 q2ePNxshd4E5vZmqpVoCmi0eRnvg3cmFl98VgXzH9czLWjN1k9GYgqkyUQGxi8s6k0
 urybRMKo5oOdWa7fAvU4dCq9Jyf15eeYi/zrJfNo=
Date: Thu, 25 Jul 2019 13:31:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190725033145.GC28601@umbus>
References: <20190724103524.20916-1-cohuck@redhat.com>
 <20190724135017.GK11469@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline
In-Reply-To: <20190724135017.GK11469@habkost.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH for-4.2] hw: add compat machines for 4.2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPohvbO74l1M


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 10:50:17AM -0300, Eduardo Habkost wrote:
> On Wed, Jul 24, 2019 at 12:35:24PM +0200, Cornelia Huck wrote:
> > Add 4.2 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > For i440fx and q35, unversioned cpu models are still translated
> > to -v1, as 0788a56bd1ae ("i386: Make unversioned CPU models be
> > aliases") states this should only transition to the latest cpu
> > model version in 4.3 (or later).
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>=20
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>=20
> I plan to queue it for 4.2, but I think it's OK to queue this in
> parallel through other trees if necessary (so patches that depend
> on the new machine types can be queued too).

Yeah, I've put it into my ppc-for-4.2 tree, expecting to resolve a
minor conflict once the 4.2 tree opens.

Oh, and, ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl05IqEACgkQbDjKyiDZ
s5K5ExAAhRGVya8wcftc9LiL/mNmXmFUYSmGnNwyXUJtRFYrsgu3Plv4ADd1x7tA
kQiARmhTeuRwoSRKEXMWnL3dbJQXpOcc0+vjac2MOkI2DwPkTIvbiU3InlieTeBu
GS4jgaZ30lx8q4Yjsye8G21mciHPyC6p5vjeWG/1+wU5fmtFtiHNI/4I77B00z5R
s+N7JRKNySdXIkcFDOY0dxxPxwjcfowgL5enQo9JGJ/iPqzibJZKep3qRHAwfQOa
uzUMvyHlfpuePUng7mzO0ZwOBxa7mkyIvyfajAU5GBQinT7hU2dD0sxuDZFKtI8y
YiV3BySga09ROdTdAQEfqmqf9det+9uGPVaTrcKuvyODGxqS8w52afWPpQ9lzvvM
5j8anj6ml/qbd6epCdGfHredbvPw1HEECnAgIjK5Df0RfSoR4O8bzLaMW3fszLFb
L/dpGPYy3VyeiaQS2qqSQc3Y+1RdKdudifjFBD47pRMi2Dedl3eBiAV3l4FS6ggi
RcbMbdJ/03nb0ucgSGNDtgyOXtasvEqm1Slo7sAtJ0n7fKHeSuFCj4UcNHoeXlTD
N+3uIpFMnlhe5k6vWZIjYjj5agvLYOrb7im4Ck9sl6ZPYFJqennoRrJWhgPhUkC+
hpxsvQarGmnOF5Bcgu0Iwfwgo/G1T84qovP1VpL8/FRMk3aNW3w=
=H05V
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
