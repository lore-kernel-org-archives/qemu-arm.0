Received: by 10.25.0.144 with SMTP id 138csp1526542lfa;
        Mon, 17 Apr 2017 20:29:10 -0700 (PDT)
X-Received: by 10.55.112.6 with SMTP id l6mr10620319qkc.187.1492486150666;
        Mon, 17 Apr 2017 20:29:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e49si12720223qtf.126.2017.04.17.20.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 20:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0JpF-0003yi-VL
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 23:29:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d0Jp3-0003xR-94
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 23:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d0Jp2-0007Je-2M
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 23:28:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41163)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d0Jp1-0007G6-D5; Mon, 17 Apr 2017 23:28:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3w6VwL3t2nz9s2s; Tue, 18 Apr 2017 13:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1492486130;
	bh=4OTDnMbETpnRVghMjfwRTUgtSnhpPLXMeQXyeXAueg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m526/Kghxa/7vwHjn1VrwDOUA/yCBoBDT/is1Y/QB3LHK4H2uCTTzr72znsWbiKQo
	uZrYlht8KVLPkJUcl55BVDc8GE73j6P3V7tbQpzZpLwcOzAgMPm76krj38rtS1oEJU
	DZ6rIqw7pNKbrCojcDffbzN6PlsX5iReWo4Ueg8Q=
Date: Tue, 18 Apr 2017 13:09:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170418030950.GE12235@umbus.fritz.box>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<20170414083717.13641-3-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <20170414083717.13641-3-lvivier@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 2/4] ppc: remove
 cannot_destroy_with_object_finalize_yet
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
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tBQJHZRl0Kfo


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 10:37:15AM +0200, Laurent Vivier wrote:
> This removes the assert(kvm_enabled()) from kvmppc_host_cpu_initfn()
>=20
> This assert can never be triggered as the function is only registered
> when KVM is available (see also 4c315c2
> "qdev: Protect device-list-properties against broken devices").
>=20
> So we can remove the cannot_destroy_with_object_finalize_yet from
> kvmppc_host_cpu_class_init() without fear and beyond reproach.
> (as it has already be done for i386 with 771a13e "i386: Unset
> cannot_destroy_with_object_finalize_yet on "host" model" and
> e435601 "target-i386: Remove assert(kvm_enabled()) from
> host_x86_cpu_initfn()")
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Applied to ppc-for-2.10 (fixing a contextual conflict on the way).


> ---
>  target/ppc/kvm.c | 10 ----------
>  1 file changed, 10 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 9f1f132..64017ac 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2245,14 +2245,8 @@ static void alter_insns(uint64_t *word, uint64_t f=
lags, bool on)
>      }
>  }
> =20
> -static void kvmppc_host_cpu_initfn(Object *obj)
> -{
> -    assert(kvm_enabled());
> -}
> -
>  static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
>  {
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
>      uint32_t vmx =3D kvmppc_get_vmx();
>      uint32_t dfp =3D kvmppc_get_dfp();
> @@ -2279,9 +2273,6 @@ static void kvmppc_host_cpu_class_init(ObjectClass =
*oc, void *data)
>      if (icache_size !=3D -1) {
>          pcc->l1_icache_size =3D icache_size;
>      }
> -
> -    /* Reason: kvmppc_host_cpu_initfn() dies when !kvm_enabled() */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  bool kvmppc_has_cap_epr(void)
> @@ -2333,7 +2324,6 @@ static int kvm_ppc_register_host_cpu_type(void)
>  {
>      TypeInfo type_info =3D {
>          .name =3D TYPE_HOST_POWERPC_CPU,
> -        .instance_init =3D kvmppc_host_cpu_initfn,
>          .class_init =3D kvmppc_host_cpu_class_init,
>      };
>      PowerPCCPUClass *pvr_pcc;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY9YN7AAoJEGw4ysog2bOSYKkP/izHdQiPyoXpTMUu31HgUO6w
p5mqU4/9CJVyceyPniQkiF6Ju5W1qkUVcOfXfxIzzzU5zjKvx/WvzV7MeUDdymw6
V6V8W9A1EMzO71A341veLC1vkMNlANO3ENaF8Kzqu+MFFb8c9XYI1A2Te4rtN10e
LPDBd3j8nKlH6qFjtZRtyQkguR3n7h0T3UYjz5giw0AOV2i0QkCfpy2ba/Jly1nk
IMnyW23jp17bXBAzEvHhRLLZOnrdxDs4UBMWR+XxFWbMsCZeQ0+OZWaFiqaqhQP/
GxLSCXeD6A66DZaHDE5kf8WHD938GP4/tNHmBm+rJHbiBiwPMAXPapNExXaEEfT/
A7sXhty6bSBq7eiBf44PTNVR3VOmaC+4d5+QolXp0z3Hke5nMK27tfdB2VNZKmQM
R2QVXIBxnvNXnH0+MKJ39yVhbldd6Q8SfArhyJLGhiEdf3DQUh5fljbmbfTJ5sJ4
tl2dDckJjsPiC4OfJxmhFBFQ/l4WMTEh+/rMZOY6uqsYNPFBp3E5TPnQ1rxju84g
fmx6NSM9bGk9Fn2CRhW3SscNnCtcp0myqKrnWex5Ay5G6ed79qlkbJNuDnjR7oxM
C1xfymQT5HKkxc4uxf/2jGus6u2tOuhp6kHsGq+Xsdr+hgt5EfkqizSSZvpmj7z9
8pK+TprQ8Y+Peh4wVz/Y
=mACH
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
