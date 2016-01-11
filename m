Received: by 10.25.134.130 with SMTP id i124csp1750828lfd;
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
X-Received: by 10.107.47.162 with SMTP id v34mr61948534iov.19.1452487014035;
        Sun, 10 Jan 2016 20:36:54 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id p123si6191747ioe.111.2016.01.10.20.36.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2016 20:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 396F3140323; Mon, 11 Jan 2016 15:36:49 +1100 (AEDT)
Date: Mon, 11 Jan 2016 13:45:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	alex.bennee@linaro.org, thuth@redhat.com,
	crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v2 7/7] hw/arm/sysbus-fdt: remove qemu_fdt_setprop
 returned value check
Message-ID: <20160111024554.GD22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-8-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline
In-Reply-To: <1452093205-30167-8-git-send-email-eric.auger@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: Sipe10C+qnGz


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 03:13:25PM +0000, Eric Auger wrote:
> qemu_fdt_setprop self-exists in case of error hence no need to check
> the returned value.
>=20
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

This change is fine, but in general I'm disinclined to invest too much
in the qemu interfaces for manipulating flattened trees.

I think our device tree manipulation in qemu is now complicated enough
that we should move towards using an unflattened (i.e. pointer based)
DT representation inside qemu, which is generally more suitable for
complex manipulation.

That would then get flattened into a blob for the guest in a single
pass at reset time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWkxdiAAoJEGw4ysog2bOSE28P/1v3FkntvmqnDNNZ2yS0GiKJ
QYB9oP1BP5ZvuzTGcjPP41tSTMCbUy5FqblZz97bIHbxNdIIpcf+YyChruNkRz2D
gqrJ8Efa4E7A7rcNElzPSqXckv8oV20Iq45MfnMfa0Hw5suYY+VDK26nI/X+khcH
xH1a65Kr9q9Tpe3sPI5g9FgACRhDgR1xA8KBik95sCRvnLWFElASTxv9Ci9HXHrb
ixg322mLn7v/1hoZHzJcuI1ZZOfm/Yhg13zKLct9VlO6Kssz8yV9HdCeJ/YcWm3D
rbt3clJRjIOkkWcOl9sS98ZE2a/o5G9uLWVJz7BjOv6TeiFLEAv1DOHirZNZu8lD
5ZHiIzV2k42jWKBNAezfc58hjbgOtZCYuESH1QJ9goo/i/etz1H2hL8ZAIHwVPHA
6AZaKxt7PIgp2mV/QBlRmFwuB+RbZAcAzaXWedPXearEpxDzpXeaIJkOdsrJdun7
DmqYkU9b8aN3kR2HbrgKP4pGx6c5sSBckiwLsMEbrPwXxGkkZ2gWzQbsXzTqfG5R
hd/y+dQsnvBRgRvo0pJdjbypV49kjsOC+VXIArmY46AvnhrUjzacEWj19UvFXBsL
A0G8gilgvnENFKE8Pwn4sDgdPEzlr8wcY5ZmftqoGAaTIdZ7YuRS/IochJsSCxWo
26vNk+U2sMv3iC7sjsWG
=OXVK
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
