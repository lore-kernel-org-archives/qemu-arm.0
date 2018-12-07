Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp11297421wrt;
        Thu, 6 Dec 2018 16:47:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V/zJ6sX5i+cyBu3pR/qESm7Yn4I9EYBsmTs4fdxtKi74rOnEh1e1Tl7m1e6JuXYD/kcMGg
X-Received: by 2002:aed:2b64:: with SMTP id p91mr126881qtd.94.1544143658217;
        Thu, 06 Dec 2018 16:47:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544143658; cv=none;
        d=google.com; s=arc-20160816;
        b=bCqpFxU5QVzREQa4aJjrECFaUnYJKfxHLh+75TB9bOR4p0EZnt4GJFfKuJdDBM0BRa
         +9VVwBe6ozrlrqbDUt651C0KfZQ7ffOaasf1f3vnNupllvtdMQa79m/Sbi4kVLIeCDu2
         E/fCVU3Yv/CNw2/jjW+5j1acrXh7S33SKVHN9lbbGJmlNQTLk94bPs9Ov4sfpDN4BIBG
         ErRejP9osF+b6+D/nd9YmmJY9ySiFgiyWA3TWu2dD2rq4kFQD5YIM8Ku6esBXrKeVG1G
         fH+D4hAKwdcpV0BBZ+F8V6WfhvC0f+NBTez9NhO7jf7Y17voFEaGa0CplkQWfCPtZNmu
         PZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ZeBIOq0WQ0A/0GRLXQyKK74YKZ2F85SRF7fOP7eAti4=;
        b=QdrtF/KwIN9CTx6MnjTJg9AdCro8RoQ8xMusCQTP57eOlHGq1vuSJtpiFwB4HbWiRl
         zawrzOEIfQv9Znv3Acf5sFFuLbWbmpjBhDUixMbbEqdxYmSbyHdCcOK089WhPaKB+9Fw
         8ZU/KrQ/AGJgDl6Tx9KvBYEbs249y8vfYbjh6k6ySdWr9rJRoS83q6m7AkJsVq+mC252
         HQLBSk05mB9rYPtAyjY+RSKKLQGWsFxuOXzSBgOblTl5iMTtKoeEbX6wktCUtzcriPgS
         m5rCyvONNfMmbAkzBgGo+aMH/vSloutZJ31I9L9pGQoZC87TW2Y2/4SzStHWDvyIpr3Q
         4t4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JhpCXq2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si1146998qvd.103.2018.12.06.16.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 16:47:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JhpCXq2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gV4Ir-0001XU-OU
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 19:47:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gV4Id-0001X7-PC
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 19:47:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gV4IY-0005yc-OJ
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 19:47:23 -0500
Received: from ozlabs.org ([203.11.71.1]:49123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gV4IY-0005wo-0H; Thu, 06 Dec 2018 19:47:18 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 439v1s5MpHz9s47; Fri,  7 Dec 2018 11:47:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1544143633;
	bh=N7obwgUbmkbVIpJxJXPKyQpd9XyKgVx/eiGaRvqyUtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhpCXq2qcngVGprUU52UliaVx4IiIvKvWt23N4EnWAvzBES/d4T7Jehq4nNmQQEab
	i1sf2USIGjlrevzV+tzyidZxy83XLMFNwYtDxV0nsbnaAst4TbT7EB4tZesynb2RDQ
	2uZmreRlhqQmcOfZDdp1s1TdXHwozPLNrerTvUzQ=
Date: Fri, 7 Dec 2018 11:22:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181207002221.GR768@umbus.fritz.box>
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-5-ehabkost@redhat.com>
	<20181205223035.GH768@umbus.fritz.box>
	<20181206124851.GV18284@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9lPOKfY2vCV97ybw"
Content-Disposition: inline
In-Reply-To: <20181206124851.GV18284@habkost.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH for-4.0 4/5] spapr: Delete instance_options
 functions
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OmvWfyHIrpCz


--9lPOKfY2vCV97ybw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 10:48:51AM -0200, Eduardo Habkost wrote:
> On Thu, Dec 06, 2018 at 09:30:35AM +1100, David Gibson wrote:
> > On Wed, Dec 05, 2018 at 06:58:26PM -0200, Eduardo Habkost wrote:
> > > Now that all instance_options functions for spapr are empty,
> > > delete them.
> > >=20
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >=20
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> Thanks!
>=20
> >=20
> > Do you want me to stage the ppc patches in my ppc-for-4.0 tree, or
> > would you prefer to keep your series together to go in via your tree?
>=20
> I wouldn't mind to get this queued through the ppc tree, but
> maybe it will be easier to get them through the machine tree
> because of the dependency on the 4.0 machine-type patch.

Sure.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9lPOKfY2vCV97ybw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwJvTkACgkQbDjKyiDZ
s5JaghAAhKcGrt7aBXNqx4UXLbb0LMsZpUMoCradgpxn4ODRk5bJ0pIS/gL+PVPK
zKBLmax+rjBe6qsZF2PykW4EEuC1alUdndLgu5hyRleB0LfSz+0U6NlQes3tggF8
GfrPser7BL5vTE3sBBgLbmePx7A+Ua6m0UFzULxLV9P9MbAsqTmIEb9RlWKWbDV/
xC83qWdcTJjV4VFDscRMBp11opjzh1FOU5gkUdF49oTViIrcgJQSOc8pKH4vkFvM
S5sqWKGl5DXA7g7p/VLSpNvqgvgG4S3OM3RfB5Z/FDcw3bEEqTSuKSDqMXaKq7+R
CeiNJGU5BE7rPFRZXLfdMGx9EQoYzudSYDosgW9RcKBe/DWt4XtpAjb++bgMdi5Y
sErPcgWy1Tebh8xBTEN0JaFEyGZM7OVjdiOSds7jjc3DNM4usJMsSY0UyI/QeJpT
IrusUuEyescCemAXJnNVrwsaAwrerRWEEAC6ZGtZWZfM3++83VLgd26W0vaTOup+
3DrPCIJUvm8oJaT55NDmiOLVeJ6PSa3nZ7KcAqNjrbniRag1C/c71yRvJmBgvCws
XdJADz57QawUAu4HSpAT3pkq85kXCDUOg7G0rLiKqrmHZBqBbkQr2AlVVYKUjQZR
2w7ReZVIJAceWZ1CHovBdxGO9zfXgNpvAoraaTbj6NA8TXknNbE=
=/+Pl
-----END PGP SIGNATURE-----

--9lPOKfY2vCV97ybw--
