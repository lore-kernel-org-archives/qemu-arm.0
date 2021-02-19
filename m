Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9259203lfc;
        Fri, 19 Feb 2021 10:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLEXWU3twSF5jk1eOjaX6GJVEGYNm3E9wzDHHDP+xkPQDrEf3RInBgp0SqYwrzwoZnxw6t
X-Received: by 2002:a17:906:654d:: with SMTP id u13mr9722809ejn.299.1613761146033;
        Fri, 19 Feb 2021 10:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613761146; cv=none;
        d=google.com; s=arc-20160816;
        b=BVYzVPBzvbC1LwqsP9c/6eD3xuUWZprufJ/nBrpg+4LgWExvzrDN+bFQmdWhY2luQM
         keeB/J+xPac0N0PH0Pl+6/IOqPFt05PR+OEu6O8aFg6jTCq8kHlzJXc+GurYFnOlVCUX
         vdrFLGGtSfKz4g84JdhdgiPVlMJLEFUIcE6J7wLSslgaaGdgb9+Y29fcLveSV81kYFbc
         Doqy4hbR6gZ2z9WQ+RolL50FME88VNncyL+KyPQdF/e04l10rQg7ffL0q9W23o+P/4dc
         c9fZsxnlsSlCS3iGjhP/FoMtQ2baey57uuPlMnv+4HQ9nkQoR8u8W0xExshlYeDbh9CR
         LegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mrtLKwySMOFm14Rd5nOFINDtx5JqFBLBgMJ4Heu3Gpc=;
        b=Wr1UA6lKjBd863MDzrVlaKDjeMo+X2E6zN2PxOHwpHZuFoO8CtkJHshbBvvoY496x+
         F1JRQjiSZcIcD7zDtYwrEzR+o+JmNrFtrC1gU7ynIsdeoC7L7bPcWWopehDNGeGXeG+4
         jCzKrcXK/EHi0r9ymoSSiNnXXGHci77zBtBWpjfWvygUqSlv+j/Bht/DE4LpX/imXIQ0
         1ybW6+HRHc27Tj9xG7n0NlsbGyvmiRhDu6T4b7WJIiQrd0ARg3sfY6b+zREGyEJs5Dw9
         G+Su9rHmaIY/kRobUDOEFRWfcilOBOtkwbQ1zLW9XOuS+0vB8IMyktNv7xTYeD7XV2uA
         qzuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VWufO0hc;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x11si6308163edl.220.2021.02.19.10.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 10:59:06 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VWufO0hc;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613761145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrtLKwySMOFm14Rd5nOFINDtx5JqFBLBgMJ4Heu3Gpc=;
	b=VWufO0hcAO5MkOtZxkvgBM/6WoJTubnmKQi9hzdT9/Y29aQbBxiM5igI2zgfU+flzn51YT
	y/ya6C2uQRNaqrJAsUixasGe8nZY03qrRp9yUpGY5hZ185i/UPwe4uF7tnTPGZS7M7gWY1
	ZCkKzFnaLwmpY7bcpYFC75lFeHoxdgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-j5bB5UguP_ecZTCWaZDlUg-1; Fri, 19 Feb 2021 13:59:01 -0500
X-MC-Unique: j5bB5UguP_ecZTCWaZDlUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDC3107ACFE;
	Fri, 19 Feb 2021 18:58:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BF405C1BB;
	Fri, 19 Feb 2021 18:58:57 +0000 (UTC)
Date: Fri, 19 Feb 2021 13:58:55 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, peter.maydell@linaro.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	f4bug@amsat.org, b.galvani@gmail.com, qemu-arm@nongnu.org,
	Pavel.Dovgaluk@ispras.ru,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
Message-ID: <20210219185855.GA619233@localhost.localdomain>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
 <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
 <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
X-TUID: AYxwrvKOVzqA

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 07:24:01PM +0100, Philippe Mathieu-Daud=E9 wrote:
>=20
> I hope you understand the concern I have is not with you in particular,
> and I used your case to start a discussion with the QEMU community.
>=20
> FWIW I missed the URL change because I still have the image cached in
> Avocado so my testing ran fine. Which makes me wonder...
>=20
> Cleber, Willian, should Avocado display information about cached
> artifacts? Such "Using artifact downloaded 7 months ago".
>

As of Avocado 85.0 (currently used in QEMU), it's possible to set the
"expire" parameter to "fetch_asset", see:

  https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#av=
ocado.Test.fetch_asset

In this case, if we want assets to not be used if they're are 30 days
or older, that could be set to 86400.  The expired asset not being used,
and then not being able to be fetched again, would cause a test to be
canceled.

Cache browsing/listing/manipulation using the "avocado assets" command
is planned for Avocado 86.0, see:

  https://github.com/avocado-framework/avocado/issues/4311

> > So what I can do
> > instead is:
> >=20
> > =A0 - update the patch to use github to store the artifacts, and their
> > licenses (other tests also use github)
>=20
> Until there is better solutions, this is the option I prefer.
>

+1.

Regards,
- Cleber.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAwCm0ACgkQZX6NM6Xy
CfOqXg/+OedAWfYGLoW0Ff6Cs2CXBP3yLGWZHKCy0k1/jwghzV9Ve/LEsW6+oXeA
FKNQ6VIc6pultpz6VXeb7jxcUPezn4JmOhcY2OrRfJqJLs18g9+iYMNlMBdaVOAY
fU0R9Ou1IhpflJTTO3mE/ruCtiM5MS1swnfr9xbVNmimJ9v+i9Y7526RTtcLRrOE
zEBjvK/I27mOfSUKNC3kWBlGjG5FuL6ZZMoDDQcc79wxxCtjaqlrsCO0WxY/+BOv
kyza8Lqm/DniYMpys996Bm7fqsYgElfrqHTKLkQn5yIifFu8B8ZB3OKL/LZLwBTM
pJrn9N3J/ZVQVYzK+TB1f3JwDVlHac6f0YtzWiTOvoQuAkV+vBnTVAjSWsHowOST
mRIZlRQB2k6QHvaeExRWWSUykXDYdxd4w+PgTsrCHei7CBrOLwMeuprdYUQ8D0/K
KAAbbf+wkLC0PHRBIYpxeK6/rndSO3tl8KvidilgPdik8p6+lzf2LtcKI/AC5ajL
OxVj9flUdIdTnfvi3ciVIwH9L/YuzKDjfXc6N/BaTvcRsQ1YaHhE95WQgyLVNTnT
523Q7wMK9ZDKg5WSR8SAYM9nN0LaeV4e97NXRSqnTPnwg6k1Oafnft4e3OVb6VIK
LLpMpBTNrSEHEueK7PJpnd0WeCQxqANcQX+a2dZycRYBmVoqmP4=
=i7jE
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
