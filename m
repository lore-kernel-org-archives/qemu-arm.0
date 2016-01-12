Received: by 10.25.159.19 with SMTP id i19csp856899lfe;
        Tue, 12 Jan 2016 18:31:40 -0800 (PST)
X-Received: by 10.107.135.198 with SMTP id r67mr86002339ioi.103.1452652300858;
        Tue, 12 Jan 2016 18:31:40 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org ([2401:3900:2:1::2])
        by mx.google.com with ESMTPS id z6si37666266igl.20.2016.01.12.18.31.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 18:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id EC999140BB3; Wed, 13 Jan 2016 13:31:33 +1100 (AEDT)
Date: Wed, 13 Jan 2016 10:07:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	alex.bennee@linaro.org, thuth@redhat.com,
	crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v2 3/7] device_tree: introduce qemu_fdt_node_path
Message-ID: <20160112230732.GY22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
 <20160111023853.GB22925@voom.redhat.com>
 <56938586.5050503@linaro.org>
 <20160112042856.GQ22925@voom.redhat.com>
 <56953188.3040805@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NJ3GtppTlf/130kA"
Content-Disposition: inline
In-Reply-To: <56953188.3040805@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: YxNjg6ANzOav


--NJ3GtppTlf/130kA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2016 at 06:02:00PM +0100, Eric Auger wrote:
> Hi David,
> On 01/12/2016 05:28 AM, David Gibson wrote:
> > On Mon, Jan 11, 2016 at 11:35:50AM +0100, Eric Auger wrote:
> >> Hi David,
> >> On 01/11/2016 03:38 AM, David Gibson wrote:
> >>> On Wed, Jan 06, 2016 at 03:13:21PM +0000, Eric Auger wrote:
> >>>> This new helper routine returns the node path of a device
> >>>> referred to by its node name and compat string.
> >>>
> >>> What if there are multiple nodes matching the name and compat?
> >> The function would return the first one. I can improve the doc comment.
> >> Do you think it is a problem stopping at the first one? Is it a real
> >> life test case I have to handle here?
> >=20
> > Well, I don't know of a specific system which will have this, but it's
> > absolutely possible to get this situation:  e.g. two different PCI
> > busses, both of which have their own slot 0 populated with different
> > instances of the same device.
> >=20
> > Whether it's possible for platform devices will depend on the
> > platform's specific bus toplogies, but you certainly can't rule it out
> > in general.
> OK I will handle that case then. I hope I will be able to test it.

One case where this might occur in practice for platform devices is if
you have a system built with multiple instances of a SoC.  A
peripheral on SoC 0 is likely to have the same name and compatible as
the same peripheral on Soc 1, just inside a different parent node.

> > I could consider adding a new libfdt function like
> > fdt_node_offset_by_compatible() that searches by name as well.  It's
> > just I'm not sure that matching by name and compatible isn't a sign of
> > a poor approach in the caller.
> well I can't really comment. That looked the most straightforward to me
> given the current libfdt API. But not sure it's worth to invest in a new
> function in libfdt
>=20
> Thanks!
>=20
> Eric
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NJ3GtppTlf/130kA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlYc0AAoJEGw4ysog2bOS3x0QALkseNGWT/rjfma0VHG4Ifew
Tm4g5U+JT9oBT0M6RLNeEuZNC0xp7c7Oib1k/adRbKN+mWoKIffeXS+SMQaMRfVi
dXWx4ekl5Pysj0AYRXcXfuX5+qJa7JUYiVvXCaxQoen2YSscf0pDK8s7PsZ0tVWL
zW4JwSa/9ZqOs9urh2rI121LKpGNluJO2hTOUQQTilypfgwuFGBiqDFWp45j2UuV
OiMShZzaeJBIDUsXFoVCLGufIKNz/bMQZs3GitzQMNcjXZ76gWMJ7kJPR3Ipp5rH
X8iS0iKf3Q5/Do4Hx1fZSnu99d0xJA67+O84Zcl6WmK86g2PgEPO4LIwsj8bn86k
KBy+GDgR8Z5OPb+Sk/aM1rRz1UOrahj7pTfsggjwTHaP5/Eaw1rqCyNOluJen8us
9P9NQIr49Ukf3tzPXZFJn2GnBZFtivGjzJEyh0m3nip5zgavxVxqgxtezzS1HpQE
xPlxJa4e3egtf1LnvKHjnEA55iooBjBVwzX8C3SrnAALAIKw+HVkTz3iuxgfTWZU
Y/Ak0ANe+rpp7SrzgASS0lWQFxgwhhWq4uqsccA/UaXZwCW4EpzJOy5SCRYKdbns
y9M5Bg1zHmpxb1/oUP4VJYxwIV+YEhZ2+GWpmXDU7QXu9pz8uitnwq2WdWdfXETp
+su50FZBJE5A2c+7w/DK
=5H1e
-----END PGP SIGNATURE-----

--NJ3GtppTlf/130kA--
