Received: by 10.25.0.144 with SMTP id 138csp58661lfa;
        Thu, 20 Apr 2017 18:59:25 -0700 (PDT)
X-Received: by 10.200.34.162 with SMTP id f31mr11724149qta.65.1492739965816;
        Thu, 20 Apr 2017 18:59:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k92si7903761qtd.313.2017.04.20.18.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 18:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1Nr3-0002nf-BO
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 21:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d1Nqy-0002mc-I2
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 21:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d1Nqx-0006S8-BE
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 21:59:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55507)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d1Nqw-0006Qa-Td; Thu, 20 Apr 2017 21:59:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3w8JnW5vZbz9s2s; Fri, 21 Apr 2017 11:59:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1492739951;
	bh=tI4k36mCmJrSpgc7JnQAGcQiSmUby8Ho9+lWvintJBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+Vv2RSoPGufc58wuaW4+HkuS2W8OnDDC9fpxiTBNWVmIEj90d4ML7/SQEfAi/CeL
	9H9Yge/TLswGbn0Lw8Q9x3DRnEYBkTvXBpQjiJDvA21JPJJpdfYwIh+XJHJ25iiN6F
	gtxRY/+FlW7/RZVh8ATqRo2wKDjvEUosJzY+Sfco=
Date: Fri, 21 Apr 2017 11:45:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20170421014535.GF13992@umbus.fritz.box>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<CAFEAcA-NTpaXL9foLOqZ1AyBOcFokKfJGMxicQFXeAzkMATfBA@mail.gmail.com>
	<871ssn9ijk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline
In-Reply-To: <871ssn9ijk.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/4] qdev: remove all
 remaining cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGsARKqqQHQ4


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 05:59:27PM +0200, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
> > On 14 April 2017 at 09:37, Laurent Vivier <lvivier@redhat.com> wrote:
> >> This series removes all the remaining uses of
> >> cannot_destroy_with_object_finalize_yet to finally remove
> >> the flag itself.
> >>
> >> The ARM patch has already been sent alone and reviewed by Markus.
> >> I have tested the ppc one on ppc64 machine with KVM and using
> >> QDM device-list-properties command.
> >>
> >> For the versatile one, the flag allowed to workaround a problem
> >> in the bus unparent function: the bus unparent is trying to
> >> unparent all the children of the bus. To do that, it has a list
> >> of the children of the bus, and calls object_unparent() for each
> >> child, and object_unparent() calls object_property_del_child() if
> >> obj->parent is not NULL.  As qdev_set_parent_bus() set only
> >> parent_bus and the list of children, parent is NULL and the child
> >> is never deleted.  We can avoid the problem by moving the
> >> qdev_set_parent_bus() to the realize part.
> >>
> >> I've tested all the changes with "make check" (including
> >> device-introspect-test). I've booted a versatilepb machine
> >> with a 3.16.0-4 debian installer kernel.
> >>
> >> Laurent Vivier (4):
> >>   arm: remove remaining cannot_destroy_with_object_finalize_yet
> >>   ppc: remove cannot_destroy_with_object_finalize_yet
> >>   versatile: remove cannot_destroy_with_object_finalize_yet
> >>   qdev: remove cannot_destroy_with_object_finalize_yet
> >
> > Markus -- are you planning to take this whole series through
> > your tree? I'm happy with the ARM patches but I guess we
> > should keep the whole series together since patch 4 depends
> > on the other 3...
>=20
> We have no qdev maintainer.  David, you wrote you applied PATCH 2.  Are
> you okay with me taking all four?  If yes, would you like me to add your
> Acked-by or Reviewed-by to PATCH 2?

That's fine by me.  I've sent an Acked-by for that patch.

>=20
> > I guess that means
> > Acked-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Noted.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY+WQ/AAoJEGw4ysog2bOSSxYQAJfBVEKB4um+V7uAXvoghEFY
hy5Bc+P31v9EDzvZELl/Bfx5Foio+C3BW/3RUhgjtXo/JuQwIUOzFfWn7ScSIR54
1hJIYx+JnjEmZ4NW/6qOODx7YvmZrZaX5UUMn7MJ5XIPip62HSvgvNfywS+myOQa
jK/i8RigAqw7uiNAbxz4bDsb8dmAycPPZ5XfSKKB0ifcgDAZiGL+H/dpoQ5UNRKl
uRwuTJDtzsYojO2LPcOpX+lkna9wHcisoNxXD6Bc3Ukqlp3uWqfxsn3OIjwAP2oq
zSmo/aAsUbRWz7TGE854lbCntgV6HTKkw0Gi3q7u2C4BcRTWvEoOtihyKH1cXBwh
44b45SAYt5j2C2yOUnt0GJBQw+TyqxwIKZN/JtPI87vVoqdJaW2xVvKVGI2GsFHB
RPxrHxmOyrIy7pbPFCCHYdgtc/D7WtBCulI+7vzwTLlCTi6vSWb6iVqtoEtceN52
sAqEjVTkYHLZnu1x4r51GIqiiRFs5bojvEEmWCrirLcTfYZo7ZIBg3yNjDqplek/
p3OwwevSafuNJErc87g5bkfOSU4DsD/4H8BKlkZbTBjC1u71XkkU4dP66HN+zHWT
PWMWoW/7JGXOHaIZh+DNiK+uNwhXOLV/HP2PeYIfskZ/ATLMeAqELYkzP4px30pt
XcWtaL4ditfA2MlOAMyX
=YSgt
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--
