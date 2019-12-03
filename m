Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp756075lfc;
        Mon, 2 Dec 2019 16:22:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjNp/bFo32EFz3gx02cNPhFA28eu4UgkH/xizOoEXjWxa8rLjLlU6HiBbFgnmWkLas811X
X-Received: by 2002:a37:814:: with SMTP id 20mr2161911qki.314.1575332568042;
        Mon, 02 Dec 2019 16:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575332568; cv=none;
        d=google.com; s=arc-20160816;
        b=zjCPzeGxtXGkFM26r5NYHA87B9Gt4KDwyFbWdFYtkhNTKY2hhuXL8r2U9a86Ai9pPk
         7bIGOCTAgyodB4hHfk7XXoWScHPOyRcssJntIfYI/I0xfKpb/SMmioVEf9bvQwb6o5xl
         JWrxSKpFYBUyKvX4xq1rKj9ekbcORP1Yyq+uRNp4lZV+ialfxnXWe0/QgcXYIYZ85oRi
         JveIA9njFHOfA4w+3XcVtszyQQ6tAW1LcHvP8GveqodktaRmYA39lH9XCYMiK3BXUFxW
         tDj2gOWZ1gfByDlJUsTCHmlp3Eflmv5p0r6C0nffnFhgjjMuriBrvW7hORQzxvSyMvNQ
         lXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=gUs1aHIhkAYyNC/LCrpFW0gUfErLk49ve4CMZBaHA0w=;
        b=rrH8wN68Rv+em3A5kQ4KJjabscEAyua9jBDijZVSBJpHnwuuzYTbvQ3hGAdhEgbabQ
         CPwNAIh66S/mrNwuS7PuFEHnQOYcFF6vUcJJHyYcsAUWrsO8CJu9EJ5SFEogT0qb7aPT
         rlnhnmdJZhQt/3HwMIJb9Pgv5eRalvqdjzm+pqLL/VTp6rKQDk1AQNng0hDIZiFrxuNv
         HkvfX+081AKacaLRcNTmdqj0WEMyeE7UsvWFzzGIIgPzXsEM4kiQTF043c0z1ZmgeN1S
         +ABZqOYvnhbK4Bj7drUpwUfGDI2BJEANiiMhuH51U9HvvhqTWA05is2GBZnl6oJOiyEZ
         bZLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YVqPCs+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si900920qtb.110.2019.12.02.16.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 16:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YVqPCs+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibvxn-0002uo-0A
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 19:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ibvxE-0002rI-LA
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 19:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ibvxA-0001iz-LD
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 19:22:10 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:38763)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ibvx4-0001b3-JL; Mon, 02 Dec 2019 19:22:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47RjN22lNWz9sPL; Tue,  3 Dec 2019 11:21:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575332514;
 bh=UtK4MZTFX5Ll0DXboYjXPnFFAe2D7Fp1y5zVX5+Q3ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YVqPCs+L2aR5OdrZPNE1791xeM+P8UTLF2nm6pneJP2rtg06ktc2HWlx6Sw+NS5Jh
 QxcZnlr9OcZj7PqR6TarySOK4U8byKmNkvs7ZfXtd6X23AbY5p8f9w8XsdAj/NztrK
 OcjB1Nxe+TmTvSxBM/XL3atLc+Tb9DQEJLMXsjTE=
Date: Tue, 3 Dec 2019 11:21:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCHv3] exynos4210_gic: Suppress gcc9 format-truncation warnings
Message-ID: <20191203002143.GD37909@umbus.fritz.box>
References: <20191202060806.77968-1-david@gibson.dropbear.id.au>
 <8b490fbe-2b09-2a2c-16a8-6739ce6a847d@linaro.org>
 <CAFEAcA-W74ZGVEat3A1cmgCGrGY9gF_7T-w9DK0TSPEXc4Cm_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-W74ZGVEat3A1cmgCGrGY9gF_7T-w9DK0TSPEXc4Cm_g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0sCk3TE+pG9x


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2019 at 05:44:11PM +0000, Peter Maydell wrote:
> On Mon, 2 Dec 2019 at 16:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 12/1/19 6:08 AM, David Gibson wrote:
> > >
> > > -    for (i =3D 0; i < s->num_cpu; i++) {
> > > +    /*
> > > +     * This clues in gcc that our on-stack buffers do, in fact have
> > > +     * enough room for the cpu numbers.  gcc 9.2.1 on 32-bit x86
> > > +     * doesn't figure this out, otherwise and gives spurious warning=
s.
> > > +     */
> > > +    assert(n <=3D EXYNOS4210_NCPUS);
> > > +    for (i =3D 0; i < n; i++) {
> > > +
> > >          /* Map CPU interface per SMP Core */
> >
> > Watch out for the extra line added at the start of the block.  Otherwis=
e,
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> I thought about putting this in rc4 but eventually decided
> against it. Queued for 5.0 (with the stray extra blank line
> removed).

Great!

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3lqpUACgkQbDjKyiDZ
s5KuEg//UFgKQhzaHfjvcBROlr7x4twHsRWOLWgBcDPDwdlpNTIjs1PBdgOtMs7/
VsBl2BmLDsOFqrZ5ZRdXCnEkqqTnwDiDJOSDBd/RDm+TE+HSFXOZ8sgi1N8BPeee
Pwnu/bCDt4OkfkZc6iIE4QWE0zbz7GwLZG7B+9S43Ymoc0lnEukXHRab35sasw4W
vUU9CFosmI8X8jS2eH39HLr8eBgjktmq8wnmK9kY8FobcUWuX/vWtk19ivpMjuER
KcsOUywiDTCk64XcForkJwRym0s3R+8DivVYk2r17YDq1bA5Bk9mluRsJz/BEJ60
aPu7CfO7vBfKNgNyhfX0y8dps83ghK3sdKJKwDlPvg61l3/b5uxGHWBV5n3tXpLP
oEmgSpMJUCO395ONvCD6l9gjZARUHiRodk4uoQD9R5y1ripqFqA3zp0F9fixfHgX
3dp8u80HnZz992SZOjBVTy5O4lL5Ne2enDNMBowAkEFS2hJs/qYO22wOag4C0lrI
HR82DNuy38oRvbTsQ8O4VDPO3G1v24QB7Gcz1EqsJNSeJ4MrkoxfaPxwi+uvYsrW
72ULRh2h2yDfyt1Lea8V4Gd1oGVPrXUQ8KqgYl0NSMePgmKztqvuTgyCk5Kvnopy
GpvzBpHrOGxas/+G8bnpjhnYvaBEVYMgeT2SUaAe63zBnOhkpHM=
=jc2+
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
