Received: by 10.28.71.27 with SMTP id u27csp2725949wma;
        Mon, 5 Feb 2018 08:57:03 -0800 (PST)
X-Google-Smtp-Source: AH8x2244v9lqtg5tt0kOpmp4iIrlTN0ro00LFkbYYJwx8qW4+eEpuVfaWmwV5OthxFGiwEoYRJuB
X-Received: by 10.37.111.138 with SMTP id k132mr9479755ybc.121.1517849823386;
        Mon, 05 Feb 2018 08:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517849823; cv=none;
        d=google.com; s=arc-20160816;
        b=ppvPok/mbPyyG3fE1CLcFMntXBR4ldVvPkH985+hRZQW1Ij26TLrrLvxxSFnsC/DVg
         xsYD3+zVV1uu6CoUSD1PAAgvHLbojgxe9HzLQneVdwhJARdgGaDSzvZqp/6fccRQG6Vb
         wpDidIlpAb0leitfw2HvMcQXYfq/OXnPheY3nweaIt5QBNKKSXOu7BwsCCSxQXUy6fAA
         QY37NDb1LQgqX7CYe0CLFvZj7tAoOsuVskE2GWV2wmZ/K4k0F9+OupSIE4j81VnRCTJ4
         UomsOaHWTH2W13Aqi2JnW+K++0kwf6YH4QVFQhN2kYgmvg0QdQgYyUM94MeHR/jjEPAZ
         6j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4+HhMuTIWcHewxcqMFe8Yx/0Ya2aTZMT+XYOEDfYPD4=;
        b=WOSDEpfEBobXu8DLyc3qfRxf87ltBkYeRooHUOsP1B58Fd7WSHeAZ4HZP+pPMVE4NY
         X3opSkOSs0jhkqT/TGPsMQmmzSvvUGDzyQygLKycMoekcgcUNEy+O9AenvK7dqnTCiKx
         uApVKJSOnBo+OWW+x0mxgEqCSiwQE864UD88LB0/tGB2z2nWfm+KzHVq45Ch7vSWzuzJ
         THG0SNeTAjQJ5cEPZ7jWvYmLUAE0hzIy/nV7n3hnHf2wIMS2bT3evLgMsccnfXPxd7hy
         pFKJxbeGgd3NtPTNr5bamCN99/tNvfyegbk9vv/6rXKR/7pqcm4/dvPwEEDFTeSdraEN
         BKeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=GRIL/Hc/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o142si1517728yba.186.2018.02.05.08.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 08:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=GRIL/Hc/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eik4k-0008Ty-RT
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 11:57:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eijRa-0006ic-Sy
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 11:16:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eijRW-00041b-Ki
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 11:16:34 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:42918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eijRW-000404-CC; Mon, 05 Feb 2018 11:16:30 -0500
Received: by mail-qk0-x242.google.com with SMTP id f68so12932518qke.9;
	Mon, 05 Feb 2018 08:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=eYSbsyZEuVSsMJNkSF24hylnGMzgHUTX+T3JLV58Ej8=;
	b=GRIL/Hc/zULzyynknF7uMbHgyk6qrY0iunPO5xJ1LlNYUJ2cJZtB+QtxZ16eTZ/z9p
	3wNToHqITK1lN6+0Bsa1he+dv+UzFP5MNHiJTNKZDx07WqfdljyJHjc36+MAba2YgLa2
	JPwiAugMJrgG2iLModv/H+JJGK4jvdHDUrihuz8tXRg9QViXAUBzegEUDdbj4NJfv9Kt
	3W/UQNi3AN4Z9pd96aiM3we7CFTDcA17JSFWg/DR4mIBm6I+2B6jOcSXm7B4cHAiCEeb
	g7+XF8sYYHlNiBMc1FtXh7uXj8a5PUU5RkRNfIy1hUVH2ySu/PhTGSQrfd0KesB5Agk5
	89rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=eYSbsyZEuVSsMJNkSF24hylnGMzgHUTX+T3JLV58Ej8=;
	b=f7uOZ3t+K+aTXWYqz2pphnXmfoFiRh6daRnGTtxG3IXRrIygsCwPyVdpJM38fqdEES
	/8JzWyQCBZfg/c78bcMnmASu/I7jH46EKZy6+sPugus6Wxkwj/ip8g1fu8Tg+jzwVwkt
	CplYXob2Q4REVJSS14ZVKiYmfdQO7pNeXe2+BKYCTk3SVdR4mHF9vuHXI7J+x2AzB4As
	1E6AMoDpQgkXd+8JxZ81lcsyd/opTX0ii1BOkvdy0EpCVC+7k51QBY1qBIUh6CF1yleT
	rqyeWTAjjiF40uJTUC9UIufzlOimZqWymuCjGk38/nEFkSOWXJMWK3FyAEcFzZs0i8uG
	Nifw==
X-Gm-Message-State: APf1xPBWzaY3ZWdn/mG/gpoOWn3g5bg9LGifetqhesZmAXzgzD+CFdoH
	UQefID2s1lSBNIh2wR1/o0/jybgS
X-Received: by 10.55.214.217 with SMTP id p86mr24498435qkl.252.1517847389805; 
	Mon, 05 Feb 2018 08:16:29 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id u67sm3453721qkc.4.2018.02.05.08.16.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 08:16:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
	<20180205105720.14620-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3659e9bc-4b71-4785-22c7-e4cb97d7b241@amsat.org>
Date: Mon, 5 Feb 2018 13:16:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180205105720.14620-9-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="2e2gyX4S7Y1newXgahIgqfrmIvPkXQiWE"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 8/8] hw/intc/armv7m_nvic: Fix
 byte-to-interrupt number conversions
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HWT8HdWImJY

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2e2gyX4S7Y1newXgahIgqfrmIvPkXQiWE
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Message-ID: <3659e9bc-4b71-4785-22c7-e4cb97d7b241@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 8/8] hw/intc/armv7m_nvic: Fix byte-to-interrupt
 number conversions
References: <20180205105720.14620-1-peter.maydell@linaro.org>
 <20180205105720.14620-9-peter.maydell@linaro.org>
In-Reply-To: <20180205105720.14620-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 02/05/2018 07:57 AM, Peter Maydell wrote:
> In many of the NVIC registers relating to interrupts, we
> have to convert from a byte offset within a register set
> into the number of the first interrupt which is affected.
> We were getting this wrong for:
>  * reads of NVIC_ISPR<n>, NVIC_ISER<n>, NVIC_ICPR<n>, NVIC_ICER<n>,
>    NVIC_IABR<n> -- in all these cases we were missing the "* 8"
>    needed to convert from the byte offset to the interrupt number
>    (since all these registers use one bit per interrupt)
>  * writes of NVIC_IPR<n> had the opposite problem of a spurious
>    "* 8" (since these registers use one byte per interrupt)

What about using inline function (suggested) with those comments to ease
code review, since this code is kinda confusing at first.

>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

at any rate:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 8726be796e..9433efd1b8 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1721,7 +1721,7 @@ static MemTxResult nvic_sysreg_read(void *opaque,=
 hwaddr addr,
>          /* fall through */
>      case 0x180 ... 0x1bf: /* NVIC Clear enable */
>          val =3D 0;
> -        startvec =3D offset - 0x180 + NVIC_FIRST_IRQ; /* vector # */
> +        startvec =3D 8 * (offset - 0x180) + NVIC_FIRST_IRQ; /* vector =
# */

static uint32_t off2vec_rd(uint32_t offset, uint32_t base)
{
    return 8 * (offset - base) + NVIC_FIRST_IRQ;
}

> =20
>          for (i =3D 0, end =3D size * 8; i < end && startvec + i < s->n=
um_irq; i++) {
>              if (s->vectors[startvec + i].enabled &&
> @@ -1735,7 +1735,7 @@ static MemTxResult nvic_sysreg_read(void *opaque,=
 hwaddr addr,
>          /* fall through */
>      case 0x280 ... 0x2bf: /* NVIC Clear pend */
>          val =3D 0;
> -        startvec =3D offset - 0x280 + NVIC_FIRST_IRQ; /* vector # */
> +        startvec =3D 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector =
# */
>          for (i =3D 0, end =3D size * 8; i < end && startvec + i < s->n=
um_irq; i++) {
>              if (s->vectors[startvec + i].pending &&
>                  (attrs.secure || s->itns[startvec + i])) {
> @@ -1745,7 +1745,7 @@ static MemTxResult nvic_sysreg_read(void *opaque,=
 hwaddr addr,
>          break;
>      case 0x300 ... 0x33f: /* NVIC Active */
>          val =3D 0;
> -        startvec =3D offset - 0x300 + NVIC_FIRST_IRQ; /* vector # */
> +        startvec =3D 8 * (offset - 0x300) + NVIC_FIRST_IRQ; /* vector =
# */
> =20
>          for (i =3D 0, end =3D size * 8; i < end && startvec + i < s->n=
um_irq; i++) {
>              if (s->vectors[startvec + i].active &&
> @@ -1860,7 +1860,7 @@ static MemTxResult nvic_sysreg_write(void *opaque=
, hwaddr addr,
>      case 0x300 ... 0x33f: /* NVIC Active */
>          return MEMTX_OK; /* R/O */
>      case 0x400 ... 0x5ef: /* NVIC Priority */
> -        startvec =3D 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector =
# */
> +        startvec =3D (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */=


static uint32_t off2vec_wr(uint32_t offset, uint32_t base)
{
    return (offset - base) + NVIC_FIRST_IRQ;
}

> =20
>          for (i =3D 0; i < size && startvec + i < s->num_irq; i++) {
>              if (attrs.secure || s->itns[startvec + i]) {
>=20


--2e2gyX4S7Y1newXgahIgqfrmIvPkXQiWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp4g1UACgkQ4+MsLN6t
wN4+exAArV0Y7Bibg1at6fkDe/7ngIFhZaqtad0kZOhZzm1QLOAcbOAl3jB5pn8Y
o96PA9mg7h2K041nc0xPwATnE8arvb91sB47TuqZemkKbfMDwJa2C21I6lLdKP6x
u2C8BSOf2iK2HunGOq5NqW7kTmVLdilCqmdi/Im4yOP1//bCl2N0sxzr9s7MH4dQ
FUxC5y5vpLPPhsyBSklNvRf00LiQlKBJBHvfPYMKjWe6O0DyGkgdCrSzC41DoEy5
GWMnu3pb9dJzailBnmix+VLNBBWGNOIK0dT9BdFEtyd0sbsscoXUjZ+lCOmThUX9
U2BA+tfQIu2IbqGg0TArgeaqwaNt9+Mx6NESphit8AT/qRCjaQyNmh73D8C53CYH
GZbNKT5yCpMZC77pNnFJL6LflsdnH85bASdy8LeWQVqAqO/hIeKEMTOWV+KrzUPF
xhGJEe4KeQXuJzVuxI+Nem0zkG1teKosgcxTFL301jc7rH8xBRqRxVs9eU7ZjUNv
P0RGgo+WtqcvrdG9p6rQu8y0wGn1XpGPg1z94Hdx3/3ZI0uBKSGbILet6zvwNH8L
NkvIqSyrULxPMv4qlZrUxWBf0Q5CDU5Tsj3yjsI0v9dcQ6EnV2Pvrw12/NJqscCb
u8bg/k/kTT3MtHMVdVnwGBK7MVEYdTADmAQUm/EYPe534kyaDoQ=
=Ai9t
-----END PGP SIGNATURE-----

--2e2gyX4S7Y1newXgahIgqfrmIvPkXQiWE--
