Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2629321wre;
        Mon, 28 May 2018 09:07:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJIvo88p70SGuJFMd7IChnGSsg3iF3h4lzPmzTLjMOukY7YcdzXmT0ma4V+5Z1YJATR/Y2c
X-Received: by 2002:a37:4a8d:: with SMTP id x135-v6mr11991632qka.100.1527523648822;
        Mon, 28 May 2018 09:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527523648; cv=none;
        d=google.com; s=arc-20160816;
        b=XuFH492NODXSKYpMIcIQnhBCWM/4v5GiNL2L5DtpsLJEaU+Ex1nI6C3Q+xJ4ZwbOJc
         +KLbZEDANykxIxr7SbsAP7wqp/5B+FrHqPxdkSJNu0gx5XQnIqKY2jBayjTTQ9uFMib7
         UKHyKOK33ZayqpyvjrHkhDB+8lt69tOu59qGTkI55XQxfP54Z31jyaM+pdbm4Pkmw8xp
         2fuI8Cf1Ho7EHlWAUeJsCax6h8lbuOObDOfO/DXiEzVXJqoDfNaadv5YZemNzvKO/a+I
         02nefdW+dNBv6WKzjf4OA5wfslU0NORFLw5zBoPecTuM+dUr4WBEZmTiDWU9R2zeVPIN
         cj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=iMdgdh2t6ugGHgohetVGoBxE7hCfZJFnGO9gzTABYb4=;
        b=Pt/AA8aEiXth76mnZgDPuv7BwuJzqXAopVh4jQhIsIooXueMiHDvLLXBIlkH1hAHbZ
         iVed6p4v1dxESLgsOsRMKFpRosX2CLNA3Pd99KJMrnTTCOZ01A6YFeL9jxemZeSqUl9W
         8rZd4yjYW2fNL4xvXrd6htMFp8VWcFLSBiD2CLhZuiutb+uHCFc9NRInhzTclflYmmFO
         4QaRvqjsXUohGkWJ5ldskTQAurzi5573LDeA5+QFOteT2+yc3srag6ijIVy7CVlKTWVR
         86/g4DWfNnMEkY9QHvD6oFgtoRB9oxeaZJE2q5GY8/Fz4zJp4i7jikda8X0gjS/p7B7K
         UYXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p+468WZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si863388qtb.70.2018.05.28.09.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 09:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p+468WZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNKgC-0002NK-BO
	for alex.bennee@linaro.org; Mon, 28 May 2018 12:07:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKg4-0002ND-Iv
	for qemu-arm@nongnu.org; Mon, 28 May 2018 12:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKg0-0004EW-Im
	for qemu-arm@nongnu.org; Mon, 28 May 2018 12:07:20 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:43221)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKg0-0004EM-Bh; Mon, 28 May 2018 12:07:16 -0400
Received: by mail-qt0-x231.google.com with SMTP id f13-v6so15390594qtp.10;
	Mon, 28 May 2018 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=iMdgdh2t6ugGHgohetVGoBxE7hCfZJFnGO9gzTABYb4=;
	b=p+468WZkyNDsyCoIKjnHEWAgUkq4aetvpoIJitA8X2hRmmIS7+uMD6HeT9JZvFEIqJ
	y/kWbpgqT44Jee8/usK9iqwl/WRXZPI7EW2EgaM8MyKUXUEMKQ9njoeg3S6+ElU8tgms
	eGzZyuFKtVwqE4VruIVhWVCG7LWTFUNW+9hlOapqNKnuOuE/YhQr7Ar+8wxzCgf4uBU4
	zGp2WSE/i5CFh+hW+RLiqkLvg8ExYGTwHhoI6UDKI2y4toTzfUZEnfn7oIW2rGBPNWqt
	dvebLVirGWYPN47HqYG3Oue8gJKmc7wqI/wfBywwJHsHRFvAGyyVNRuFnf3Orf6PWzar
	4Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=iMdgdh2t6ugGHgohetVGoBxE7hCfZJFnGO9gzTABYb4=;
	b=S6WLar6lEyjvK1UpZWEsakdmiMNcWvsTvwm9JTrxC3fJXoVx5qPlACglbk5ly9UKCt
	XxwtDI+sBWddY54jikaCS0QIwq4Oc90Sjl1Wt4t+WEs5G/7BBk2/NDGi+JpC7eAHbsrc
	kH/Z+Q+p/GPFLMFEB0gtV8TWrGkFKX8y+bujb4enWyCpriWVF4ym3SGtR580K6an+n0U
	Ip84KdcGdlUA2/396XCMfWP48JbEvYQjQ2hRWbFU6lO1Dlx/nEUrXUEjQFivXOkTsAU4
	X2X8Q2qC7bG++A+bUXTFSFfmKzZ51/BGkib3GoVNERzCeQF85R5tsZQi3xNt9ST3gqy6
	yD6Q==
X-Gm-Message-State: ALKqPwe2WDPvyWJK4SUECNQQd921/TNCKou4+4gKsNXrxVBSLCgzVIvO
	OBylg5k3NtTndnZz7Ii1Ak8=
X-Received: by 2002:a0c:e4d3:: with SMTP id
	g19-v6mr2508372qvm.242.1527523635796; 
	Mon, 28 May 2018 09:07:15 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w13-v6sm20866441qto.44.2018.05.28.09.07.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 09:07:15 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180528152225.7108-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <45bcd928-b328-0a0b-a0a2-6b4c4f0b560e@amsat.org>
Date: Mon, 28 May 2018 13:07:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180528152225.7108-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="QTuJrhHzBXk2Y45fV4J8jFMTiSVIDzHYo"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] aspeed_scu: Implement RNG
 register
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZgQaq7pyUoqK

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QTuJrhHzBXk2Y45fV4J8jFMTiSVIDzHYo
Content-Type: multipart/mixed; boundary="AQ3GusOqf0kBPHtEhxFlL8h7C3emPPvy2";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Message-ID: <45bcd928-b328-0a0b-a0a2-6b4c4f0b560e@amsat.org>
Subject: Re: [Qemu-devel] [PATCH v2] aspeed_scu: Implement RNG register
References: <20180528152225.7108-1-joel@jms.id.au>
In-Reply-To: <20180528152225.7108-1-joel@jms.id.au>

--AQ3GusOqf0kBPHtEhxFlL8h7C3emPPvy2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On 05/28/2018 12:22 PM, Joel Stanley wrote:
> The ASPEED SoCs contain a single register that returns random data when=

> read. This models that register so that guests can use it.
>=20
> The random number data register has a corresponding control register,
> data returns a different number regardless of the state of the enabled
> bit, so the model follows this behaviour.

I have been bugging C=C3=A9dric to check specs for the RNG_CTRL register =
and
he sent me the v1 of this patch than I missed:

    >>> may be we could test bit 1 of RNG_CTRL to check if it is enabled
or not.
    >>
    >> The RNG is enabled by default, and I didn't find any software that=

    >> disables it, but it can't hurt to have that check.
    >
    > I did some testing on hardware, and the rng still outputs a differe=
nt
    > number each time I ask for one regardless of the state of the enabl=
ed
    > bit.
    >
    I confirm that the HW doesn't really care about the enabled bit.
    Let's ignore it then ?

Now your comment makes more sens, however I think it would be more
useful to add it in aspeed_scu_read() to make it obvious.

>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Remove call to qcrypto_random_init as this is done in main()
> ---
>  hw/misc/aspeed_scu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 5e6d5744eeca..29e58527793b 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "crypto/random.h"
>  #include "trace.h"
> =20
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU=
_NR_REGS] =3D {
>       [BMC_DEV_ID]      =3D 0x00002402U
>  };
> =20
> +static uint32_t aspeed_scu_get_random(void)
> +{
> +    Error *err =3D NULL;
> +    uint32_t num;
> +
> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> +        error_report_err(err);
> +    }
> +
> +    return num;
> +}

This function duplicates bcm2835_rng::get_random_bytes() except it
doesn't exit(), is that on purpose?

What about refactoring, inlining bcm2835_rng::get_random_bytes() in a
new include/hw/misc/rng.h?

(This can be later patch)

> +
>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned =
size)
>  {
>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwadd=
r offset, unsigned size)
>      }
> =20
>      switch (reg) {

       case RNG_CTRL:
           /* The RNG_DATA returns a different number regardless of
            * the state of the enabled bit in RNG_CTRL,
            * so the model follows this behaviour.
            */
           break;

With a comment:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +    case RNG_DATA:
> +        s->regs[RNG_DATA] =3D aspeed_scu_get_random();
> +        break;
>      case WAKEUP_EN:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Read of write-only offset 0x%" HWADDR_PRIx =
"\n",
>=20


--AQ3GusOqf0kBPHtEhxFlL8h7C3emPPvy2--

--QTuJrhHzBXk2Y45fV4J8jFMTiSVIDzHYo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlsMKSkACgkQ4+MsLN6t
wN7SOg/7Bn5OZMy1MUYoJUXVoa00ki4k/I/S57/4FqosqBXQ9650KqIrUCzqJdlG
F5CAgaGS/zLlNf+6jO/kv24NSn9p99LN0+4kR+C6sDHLtBiND28wbOGgRonsnkJC
HYng9ussjBp6Y5Kid2Y6/0tScHWI4Bg0wc7JBC5s0/WHvYRZZAjeGCW1XquoSB2L
wl/t4ghSG05lduv0oCG9HGevOEXMmFaCxLNhw4KUdJWt3lwSEfUmr9dNV0JUG/V7
/e+ZgraHipQaxJeM79E/eAWfiB5TPTyxHyBFrkas3BHqhtwoxWcIJBSPOIfM/uiH
TdrAGcoKi8vMJ49Eb/OIynN02NfMct++HImbmXKYkZFl1OLGU1afyqgCLOHIPdgh
DAC7AnDLlgpXUPLVlowPy1dq/htBub4wcHT4bp4zcD32/SSWpc4DddulUUC2Qs9d
r0NXXL7MvTBpbvbk8LkPCzSNvAK/GSekU3W9mr934PpQ7DmKsL7nO5WS+ZMM1qLZ
77z3mwakkALXT9cuYngTe9m76/HCuRgKRvrt7eeB1ljVz7igMV8vmk/hk/cdaCIK
ifRtYrA8cXNBb3KhLlCu9wTx3PiL9HdfvMyA0IgZPB/2JA357AMCZU40kfrILepG
lc9r8m0xfYnXSEibNINqnXioxlMw5n6uGkj1EBgXWYFMiggsCSc=
=CGxm
-----END PGP SIGNATURE-----

--QTuJrhHzBXk2Y45fV4J8jFMTiSVIDzHYo--
