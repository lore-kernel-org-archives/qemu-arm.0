Received: by 10.223.172.38 with SMTP id v35csp3589685wrc;
        Tue, 26 Sep 2017 06:32:44 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCFQUOdUoc9vii4mM562ydinHIVnTKnQ9FNF7hifc3+odwQgTBB1zEfyut6wCZSWGvSZbxM
X-Received: by 10.55.59.136 with SMTP id i130mr13849962qka.99.1506432764567;
        Tue, 26 Sep 2017 06:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506432764; cv=none;
        d=google.com; s=arc-20160816;
        b=L1S5qGJOIMCSwQlk2DHrbPPRPj1iWjmIglLAosrYinr3Tua4uh4x/jC16o5yXy+cH9
         +LWG4waIWgI9HM0h9vnIfm+OLyJq2dWVG27bKsM8lMqisR5Q4FjVP44KYzNP4Hgb60Bb
         VJvR1Hxp/opUbe3z+MbXhQWcEGM8pQAn1EYfrULmfdKw1eWM8TcFxgwFTnEouDH6G12W
         uqCkWZ5TcfaI6xpuTVL8AlxO6VW+1WSw06cMCYFz8q8TpgezhOwe8zc6c3fsQ+yhKsAB
         IhAcFq8YbCImPqxKVl/4Y0KykzY5DOIbjQAmAkFGPOxhS/xm+6Ns0Yuf7OVzzJtDlwHX
         AHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dmarc-filter:arc-authentication-results;
        bh=Bk48noHBpNwNN1+hI6B6ZNNUHxMc0ahxlyxVoxSfKJU=;
        b=p+aGSupGWSP4HIKOmKSYZpaJpV2z+vp6b8qVGU9RbK9RA5Zf11qh1iaC+gpsqhVhza
         AocxWEJP0XcekpbDvM9Nz2o8TRC7JwO/ppzU56+NW1F5YaUxjQrB0jmYwV/ogtnbMC1V
         esWzjl+cAV09zbrCeKg3NF8qbSxBqC/SlMPyPtO2gA49ngdqWeR9RYHoZtyuuhbHKFNt
         ahql6D7nBRvj97nQEJa1l7+OqNGkN/qO1pBRiZJ7V0M/KIrKCkmnsiCushX36RDt0t8c
         zGy5kHhf+BumSCPnvNGWIDGIk74b+45Y7liAuKK1SKarEXyJYNY7ZHdqazbW6KJcLJk8
         4VkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x197si446868qkx.191.2017.09.26.06.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 06:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwpyc-0003OA-BH
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 09:32:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwpyO-0003O1-Ms
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 09:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwpyL-0004dC-F2
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 09:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dwpyL-0004ch-5Z; Tue, 26 Sep 2017 09:32:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10879C047B8C;
	Tue, 26 Sep 2017 13:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 10879C047B8C
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA9A2757CD;
	Tue, 26 Sep 2017 13:32:10 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
Date: Tue, 26 Sep 2017 08:32:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jvVlmhcp7cUHL8p1XvQEu8e63pbwj1G79"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 26 Sep 2017 13:32:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/8] Replace all occurances
 of __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	armbru@redhat.com, Anthony Perard <anthony.perard@citrix.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, alistair23@gmail.com,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xYXzbkw5LDXD

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jvVlmhcp7cUHL8p1XvQEu8e63pbwj1G79
Content-Type: multipart/mixed; boundary="ifO5XP2I1LfeEKExpro2aBmEtB2FvPAiU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
 qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 armbru@redhat.com, Yongbok Kim <yongbok.kim@imgtec.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>, alistair23@gmail.com,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1 1/8] Replace all occurances of
 __FUNCTION__ with __func__
References: <cover.1506384414.git.alistair.francis@xilinx.com>
 <e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
In-Reply-To: <e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>

--ifO5XP2I1LfeEKExpro2aBmEtB2FvPAiU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/25/2017 07:08 PM, Alistair Francis wrote:
> Replace all occurs of __FUNCTION__ except for the check in checkpatch
> with the non GCC specific __func__.
>=20
> One line in hcd-musb.c was manually tweaked to pass checkpatch.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com> (supporter:Block
> Cc: Fam Zheng <famz@redhat.com> (supporter:Block

That looks funny, with no closing ).  Something's breaking down between
get_maintainers.pl and your eventual email, although it's not fatal.

> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> ---
>=20

>  65 files changed, 273 insertions(+), 273 deletions(-)

Big but mechanical, so I'm okay without splitting it further.

>=20
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 5bcb1c60e1..543b1bd8d5 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src=
, int len)
>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
> =20
>  #if defined _MSC_VER || defined __GNUC__
> -#define AUDIO_FUNC __FUNCTION__
> +#define AUDIO_FUNC __func__
>  #else
>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>  #endif

This can be further simplified.  We really aren't using _MSC_VER as our
compiler (can anyone prove me wrong?), and we DO require a C99 compiler
(per C99 6.4.2.2, __func__ support is mandatory), so we don't really
need the #else branch (or, for that matter, we probably don't even need
AUDIO_FUNC).  But to keep this patch mechanical, that can be a separate
followup.

> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 58005b6619..32687afced 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -463,7 +463,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t c=
md, int len)
>      uint8_t ret;
> =20
>      if (len > 9) {
> -        hw_error("%s: FIXME: bad SPI word width %i\n", __FUNCTION__, l=
en);
> +        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);=


Not this patch's problem, but it would probably be simpler if hw_error()
were a macro that automatically prefixed __func__, rather than making
every caller have to supply it themselves.

> +++ b/hw/arm/omap1.c

> @@ -1716,7 +1716,7 @@ static void omap_clkm_write(void *opaque, hwaddr =
addr,
>      case 0x18:	/* ARM_SYSST */
>          if ((s->clkm.clocking_scheme ^ (value >> 11)) & 7) {
>              s->clkm.clocking_scheme =3D (value >> 11) & 7;
> -            printf("%s: clocking scheme set to %s\n", __FUNCTION__,
> +            printf("%s: clocking scheme set to %s\n", __func__,
>                              clkschemename[s->clkm.clocking_scheme]);

Worth fixing the indentation while you are here?

> @@ -2473,7 +2473,7 @@ static void omap_pwt_write(void *opaque, hwaddr a=
ddr,
>      case 0x04:	/* VRC */
>          if ((value ^ s->vrc) & 1) {
>              if (value & 1)
> -                printf("%s: %iHz buzz on\n", __FUNCTION__, (int)
> +                printf("%s: %iHz buzz on\n", __func__, (int)
>                                  /* 1.5 MHz from a 12-MHz or 13-MHz PWT=
_CLK */
>                                  ((omap_clk_getrate(s->clk) >> 3) /
>                                   /* Pre-multiplexer divider */

Likewise?

> @@ -3330,13 +3330,13 @@ static void omap_mcbsp_writeh(void *opaque, hwa=
ddr addr,
>          s->mcr[1] =3D value & 0x03e3;
>          if (value & 3)					/* XMCM */
>              printf("%s: Tx channel selection mode enable attempt\n",
> -                            __FUNCTION__);
> +                            __func__);
>          return;
>      case 0x1a:	/* MCR1 */
>          s->mcr[0] =3D value & 0x03e1;
>          if (value & 1)					/* RMCM */
>              printf("%s: Rx channel selection mode enable attempt\n",
> -                            __FUNCTION__);
> +                            __func__);

and again


> +++ b/hw/arm/omap2.c
> @@ -1312,7 +1312,7 @@ static void omap_prcm_apll_update(struct omap_prc=
m_s *s)
> =20
>      if (mode[0] =3D=3D 1 || mode[0] =3D=3D 2 || mode[1] =3D=3D 1 || mo=
de[1] =3D=3D 2)
>          fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
> -                        __FUNCTION__);
> +                        __func__);

More of the same. I'll quit pointing it out.


> +++ b/hw/block/onenand.c
> @@ -661,12 +661,12 @@ static uint64_t onenand_read(void *opaque, hwaddr=
 addr,
>      case 0xff02:	/* ECC Result of spare area data */
>      case 0xff03:	/* ECC Result of main area data */
>      case 0xff04:	/* ECC Result of spare area data */
> -        hw_error("%s: imeplement ECC\n", __FUNCTION__);
> +        hw_error("%s: imeplement ECC\n", __func__);

Should we fix the typo while here? s/imeplement/implement/

> +++ b/hw/isa/vt82c686.c
> @@ -30,7 +30,7 @@
>  //#define DEBUG_VT82C686B
> =20
>  #ifdef DEBUG_VT82C686B
> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __FUNCTION__, ##=
__VA_ARGS__)
> +#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA=
_ARGS__)
>  #else
>  #define DPRINTF(fmt, ...)
>  #endif

Not this patch's problem, but I hate bit-rottable statements.  This
should be fixed separately into a form that always evaluates under
-Wformat (guarded by an if(0) in normal builds).

> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index e8b2eef688..41a7690560 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -33,7 +33,7 @@
>  //#define DEBUG
> =20
>  #ifdef DEBUG
> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __FUNCTION__, ##=
__VA_ARGS__)
> +#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA=
_ARGS__)
>  #else
>  #define DPRINTF(fmt, ...)
>  #endif

Ditto.


> +++ b/hw/usb/hcd-musb.c
> @@ -253,8 +253,8 @@
>  /* #define MUSB_DEBUG */
> =20
>  #ifdef MUSB_DEBUG
> -#define TRACE(fmt,...) fprintf(stderr, "%s@%d: " fmt "\n", __FUNCTION_=
_, \
> -                               __LINE__, ##__VA_ARGS__)
> +#define TRACE(fmt, ...) fprintf(stderr, "%s@%d: " fmt "\n", __func__, =
\
> +                                __LINE__, ##__VA_ARGS__)
>  #else
>  #define TRACE(...)
>  #endif

and again

My comments were either about things for separate patches, or things
that are trivial if you choose to touch them up, so:

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--ifO5XP2I1LfeEKExpro2aBmEtB2FvPAiU--

--jvVlmhcp7cUHL8p1XvQEu8e63pbwj1G79
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnKVtkACgkQp6FrSiUn
Q2qeOQf8C9QDtC9z27RGtuiDAeN4pBKh+nmPCRAt+sIW1JGMiGUkfdgoLC3vStmV
MfEda0cGe+QEMTSwtDQNuIppN8RdmrYG8L+KM86RWmLH0fVlsdHbawPBhujJaeIi
0xxL5NQ3E/QALMY0AnOIFb5dFz9MDebrzZVr1wkqlv2PKbaycPiMtpi73sxfRIAm
vUhHLYhx9xdId+j40lrGzKtVW78HYFa6rjtdDE2eP+HCflyD00C7ztFF/v4EG6PZ
ANEcXqqP1k9YYaqEDHleBNg/6ls+t4qFemVO9mhF5NjTNvxLCRYdldK2H+MNxdua
aD4O5f1HCCqVEtGxDaejNTLgbE2vJA==
=dRLs
-----END PGP SIGNATURE-----

--jvVlmhcp7cUHL8p1XvQEu8e63pbwj1G79--
