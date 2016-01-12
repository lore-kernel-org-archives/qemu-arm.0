Received: by 10.25.159.19 with SMTP id i19csp288521lfe;
        Mon, 11 Jan 2016 20:31:15 -0800 (PST)
X-Received: by 10.107.2.65 with SMTP id 62mr97735991ioc.78.1452573075063;
        Mon, 11 Jan 2016 20:31:15 -0800 (PST)
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id 100si5721456ioh.107.2016.01.11.20.31.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 20:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 72B371402F0; Tue, 12 Jan 2016 15:31:12 +1100 (AEDT)
Date: Tue, 12 Jan 2016 15:31:08 +1100
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
Message-ID: <20160112043108.GR22925@voom.redhat.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-8-git-send-email-eric.auger@linaro.org>
 <20160111024554.GD22925@voom.redhat.com>
 <56938FA3.5070600@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABd7dauUP597Mpr3"
Content-Disposition: inline
In-Reply-To: <56938FA3.5070600@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: vqugrkekSNnD


--ABd7dauUP597Mpr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2016 at 12:18:59PM +0100, Eric Auger wrote:
> Hi David,
> On 01/11/2016 03:45 AM, David Gibson wrote:
> > On Wed, Jan 06, 2016 at 03:13:25PM +0000, Eric Auger wrote:
> >> qemu_fdt_setprop self-exists in case of error hence no need to check
> >> the returned value.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> >=20
> > This change is fine, but in general I'm disinclined to invest too much
> > in the qemu interfaces for manipulating flattened trees.
> >=20
> > I think our device tree manipulation in qemu is now complicated enough
> > that we should move towards using an unflattened (i.e. pointer based)
> > DT representation inside qemu, which is generally more suitable for
> > complex manipulation.
> OK. Is there any user-space library available for un-flattened tree
> manipulation? I only found references to kernel unflattened tree
> manipulations (drivers/of/fdt.c, include/linux/of.h) and dtc flattree.c.

Not that I'm aware of.  I've sometimes thought of making one as
another companion project to dtc.  Or it would be reasonably
straightforward to build a qemu specific one using qemu's existing
list routines.

> Besides the indicated direction do I understand correctly that you do
> not reject the series?

Yes, that's correct.  I think working with unflattened trees is
something we should head towards somewhere in the future, but that's
certainly not a reason to hold up real improvements based on the
existing flattened tree code.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABd7dauUP597Mpr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlIGLAAoJEGw4ysog2bOSHWEP/jyLnEyVV3LzeSRlSZLb9F7V
ePGRGTS+8bSAt1efjDiN0gc6Bc7dEvG6tWHVF6C9pfy0x47POXCr8EPsnj2Te8zE
KTOO8QXTzUYLS5HeCw+tkJeaiyjolW9OvhuzPglH5OI7jVXXRhsQ8krRGMt+STb5
S6GoqjSveqxkQqGPU87GRpgCg0DMExiQfmlrb0itDQRvx07f92kRdO8+iW0Og3Nf
//Ic9Y7O5VAIQFZwdE/oXAXY0+UjVwfMhask5pTiZepxiHQdqs77HBCitXwyDD4K
xTfXLqA0KGDudrpnQXy4ydtIfKUpc7J08f7qjJkwpwGHfUnuPapROFVm6rbKJTxH
IAviu88Xmw1Z9VpGJm3sYhgt9tbXnrgyBDmXPmstYWfYDS2UToeM7ckTms29+zLn
bLxW8cLQQKMPur8+uoxvVtzC5Erj2rhEamjx8RyV7Ab956/6gGJid/gkMqCtUq58
L19NORbOYeFwPFaNLj4a9sGZa8toCUmYx+TOSEMR0V5I82haNcQpVnTm85Ea9JXq
Tkeve7j3LAaxfaR/jbpRZv85fBmmpsUUN3RDEEhF9efdaqqcBb2yVc9IkHBXEhue
YDDv9J8cIk7qTvUBYnaKmiFsKwBJ1hbDrg+ralP45+SWVYSHYHH44lzt5i/YkTjw
nmZQJK6bABaTj8kvtGpY
=Llqg
-----END PGP SIGNATURE-----

--ABd7dauUP597Mpr3--
