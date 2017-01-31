Received: by 10.25.77.65 with SMTP id a62csp1737338lfb;
        Mon, 30 Jan 2017 19:52:53 -0800 (PST)
X-Received: by 10.55.191.6 with SMTP id p6mr24736622qkf.79.1485834773299;
        Mon, 30 Jan 2017 19:52:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si11051254qki.207.2017.01.30.19.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jan 2017 19:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYPUy-0000ou-Ox
	for alex.bennee@linaro.org; Mon, 30 Jan 2017 22:52:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cYPTq-0000nR-Jh
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 22:51:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cYPTp-0001Wo-EW
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 22:51:42 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:51475)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1cYPTo-0001Up-7t; Mon, 30 Jan 2017 22:51:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vCC453H9Pz9sf9; Tue, 31 Jan 2017 14:51:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1485834693;
	bh=6TlK5xm4M+LXoZ6A5E4j5AZZ/Xsf3B+G4rx/VfsfQy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiW/7PhTKkqvs54Zd7BpbItVkF5NiaU4a5cWmQb4URywim12X3DoPDnlyjKrJjBP5
	52vvsBtu6L+PX+90vs8qmpqrqVt2JsQ9/ylypBxGReDWlI6zR5ABlKo5sE42XGsznr
	DuUlbdnaQM2vSwLAubyJ7/ZblvlGfjg5HD77FC8A=
Date: Tue, 31 Jan 2017 13:55:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20170131025524.GI14879@umbus.fritz.box>
References: <1485534415-20887-1-git-send-email-mst@redhat.com>
	<1485534415-20887-3-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <1485534415-20887-3-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH 3/3] ppc: switch to constants within
 BUILD_BUG_ON
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WUEWT+AtsDqy


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 06:27:16PM +0200, Michael S. Tsirkin wrote:
> We are switching BUILD_BUG_ON to verify that it's parameter is a
> compile-time constant, and it turns out that some gcc versions
> (specifically gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609) are
> not smart enough to figure it out for expressions involving local
> variables. This is harmless but means that the check is ineffective for
> these platforms.  To fix, replace the variable with macros.
>=20
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied to ppc-for-2.9, thanks.

> ---
>  hw/ppc/spapr.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a642e66..b81f2ac 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2630,8 +2630,8 @@ static void spapr_phb_placement(sPAPRMachineState *=
spapr, uint32_t index,
>       * 1TiB 64-bit MMIO windows for each PHB.
>       */
>      const uint64_t base_buid =3D 0x800000020000000ULL;
> -    const int max_phbs =3D
> -        (SPAPR_PCI_LIMIT - SPAPR_PCI_BASE) / SPAPR_PCI_MEM64_WIN_SIZE - =
1;
> +#define SPAPR_MAX_PHBS ((SPAPR_PCI_LIMIT - SPAPR_PCI_BASE) / \
> +                        SPAPR_PCI_MEM64_WIN_SIZE - 1)
>      int i;
> =20
>      /* Sanity check natural alignments */
> @@ -2640,12 +2640,14 @@ static void spapr_phb_placement(sPAPRMachineState=
 *spapr, uint32_t index,
>      QEMU_BUILD_BUG_ON((SPAPR_PCI_MEM64_WIN_SIZE % SPAPR_PCI_MEM32_WIN_SI=
ZE) !=3D 0);
>      QEMU_BUILD_BUG_ON((SPAPR_PCI_MEM32_WIN_SIZE % SPAPR_PCI_IO_WIN_SIZE)=
 !=3D 0);
>      /* Sanity check bounds */
> -    QEMU_BUILD_BUG_ON((max_phbs * SPAPR_PCI_IO_WIN_SIZE) > SPAPR_PCI_MEM=
32_WIN_SIZE);
> -    QEMU_BUILD_BUG_ON((max_phbs * SPAPR_PCI_MEM32_WIN_SIZE) > SPAPR_PCI_=
MEM64_WIN_SIZE);
> +    QEMU_BUILD_BUG_ON((SPAPR_MAX_PHBS * SPAPR_PCI_IO_WIN_SIZE) >
> +                      SPAPR_PCI_MEM32_WIN_SIZE);
> +    QEMU_BUILD_BUG_ON((SPAPR_MAX_PHBS * SPAPR_PCI_MEM32_WIN_SIZE) >
> +                      SPAPR_PCI_MEM64_WIN_SIZE);
> =20
> -    if (index >=3D max_phbs) {
> +    if (index >=3D SPAPR_MAX_PHBS) {
>          error_setg(errp, "\"index\" for PAPR PHB is too large (max %u)",
> -                   max_phbs - 1);
> +                   SPAPR_MAX_PHBS - 1);
>          return;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj/ybAAoJEGw4ysog2bOSficP/3+f7TdH9iw7CGx5su8KQGoj
TnrcpqqW/NWF9jstWrYAodp2C/7OLEIVxyZYBXk+NCtLCCeM+H6T5ZD/u57/1oQW
oEGjK5D0G2h4G5MD+THjZqTDiVfFOm91RWTsVzphe0oOLBbOUaqzrb6rO9gipOGa
VS/xzY/DA1Jvg+tIRBGejg95w5YcPV6t4hS4tUebiZbWJ5ouJqNP/1vFAtFfsu+F
TH84n8zE+0PGEJDPeES1Vhh6JuCM1rKOnWxFPn0sLydVXJxwg8dNsAeh1qDritxT
RzNWnFiS3qvAT29Der8wB667+G3Ctl4CAQ6/0TUT+fc3WnIh9oBIWft8PeHoV3xd
eFitTjTzrsbg8/nM3/4o2y3TPN+TX+RqFLsdrct+1mApLuwCJxjv+hvjH993r003
3WT2Eb74RaVsmzYfXMjeMF7bdA7M8dZTMY6SuZTltTSHiGzPiSzqbHtVhNidRwqT
pqjxkvaMs9Q7QUIRJ4C9PC2/u+lIq5gRA3ONFUCNlqhqZHWajyXHcqz2kDFXJkZ7
2aNerh+M41LiOSIvdP1Iqm3bG+XDdh8VR0OXOH5IqoulLXZ5Ii/ho9Am0F8eM3cu
jhR4ankpxQeYS3Ns8O3nUeVJg1Iw3huyvypQ/Ctb5eByaVcZNUWsLDAZqd8CNHDn
q4/AThioX/X83b/G8xNG
=ifgb
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
