Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5926938wrg;
        Wed, 12 Jun 2019 12:28:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzU7Ff014H/6TbNUxOwsS04qOpkf6xomAUUIAap/V0xvO9IpchLM/7wnOyGPZ/Q31mo4C1c
X-Received: by 2002:ab0:678d:: with SMTP id v13mr7586205uar.120.1560367724226;
        Wed, 12 Jun 2019 12:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560367724; cv=none;
        d=google.com; s=arc-20160816;
        b=QIWok+Z0uS44Lb+G24i+fN5kiK014HtVdn9LH/c/10sKEGn9NHUPHb3N0YKwuwrz8T
         sFU4SbqyYjBO2Svxo22giG7wHtuWFiuxC5WcroS6EvXgHV2hejn+NDEC1MlzLxwJdQBE
         Hla3gK4ul/ul0FXv8FTamkHHzjTnv1K5ryr99e8AQWywMEte0yfebp9iGfXqCIQ1lwGf
         QQwrZ+hL+b4ivqGFJXx+r43NdLMIPSuqi/+5pmD9g1ikXRucweWU8xKFHyVOSMx34r7Q
         BDnZGg8MdApbCOQSWfeNmniyLruLPsJsW2WPZBhwL9pvLL/dvShlayaNYO9dzn4jBGOI
         FL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:organization
         :autocrypt:openpgp:from:references:cc:to:subject;
        bh=r+lDqBl2uTw1lSoeP0iImjDUKfbSMbKQhfhO2fyQIiI=;
        b=UeoFgNJyYyZzu6m0iVt79cpJcymIDv3FRcw7NS/Is0biI8D3tr9IqGZyE//z76J4Xb
         nWq99CtoY/K+5GWLjyxYT60k8SQdhukGENmbEyyOWt+CO2iTvnnhWhKJWwCnUQZFd6yH
         fJxljxv3dU4HHcw6F9l+sNYnIDKzeH2L6znRF68GuDm2xnTKyGKYf704IDjJJyRfqaa5
         46T71PGS8WyU36X2Zp4at3LeuGQKyqJiK+BRCDX/j1wg5uNg1H2CYhWSG2+wdljDO7kf
         Vrvzn0G3r9brgtB5NfAhUgRDQtPvGI1f6YBNyFmwJJ4dgy7rJRcWAyUU7RPC61E9pGJr
         lb7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o125si325361vkg.12.2019.06.12.12.28.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A5B33005029;
	Wed, 12 Jun 2019 19:28:27 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0C7E614C8;
	Wed, 12 Jun 2019 19:28:22 +0000 (UTC)
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, Ramon Fried <rfried.dev@gmail.com>
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <87o932el61.fsf@zen.linaroharston>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <9b51858e-a876-aff8-15f7-228f659d0d20@redhat.com>
Date: Wed, 12 Jun 2019 14:28:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87o932el61.fsf@zen.linaroharston>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nqWT9CePoK38wY5NuvbMp6T1rdnHuRb7x"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 12 Jun 2019 19:28:33 +0000 (UTC)
X-TUID: G62V6CEuQg3u

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nqWT9CePoK38wY5NuvbMp6T1rdnHuRb7x
Content-Type: multipart/mixed; boundary="KbisJ2eFc9eFgnTLpn7xOErVdRpYBM2XN";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, Ramon Fried <rfried.dev@gmail.com>
Message-ID: <9b51858e-a876-aff8-15f7-228f659d0d20@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <87o932el61.fsf@zen.linaroharston>
In-Reply-To: <87o932el61.fsf@zen.linaroharston>

--KbisJ2eFc9eFgnTLpn7xOErVdRpYBM2XN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/12/19 1:03 PM, Alex Benn=C3=A9e wrote:
>=20
> Ramon Fried <rfried.dev@gmail.com> writes:
>=20
>> defining CADENCE_GEM_ERR_DEBUG causes compilation
>> errors, fix that.
>=20
> It would be worth doing something like:
>=20
> #ifdef CADENCE_GEM_ERR_DEBUG
> #define CADENCE_GEM_GATE 1
> #else
> #define CADENCE_GEM_GATE 0
> #endif
>=20
> #define DB_PRINT(...) do { \
>     if (CADENCE_GEM_GATE) { \
>         fprintf(stderr,  ": %s: ", __func__); \
>         fprintf(stderr, ## __VA_ARGS__); \
>     } \
> } while (0)
>=20
> So these format strings don't go stale in and only get detected on
> --debug builds.
>=20
> While your at it I suspect the fprintf debug would be better of as:
>=20
>   qemu_log("%s: " fmt, __func__, ## args);

Indeed, or even see if it is worth converting to full-on trace points
for dynamic control of whether to catch these things without having to
recompile debug on or off.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--KbisJ2eFc9eFgnTLpn7xOErVdRpYBM2XN--

--nqWT9CePoK38wY5NuvbMp6T1rdnHuRb7x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0BUlUACgkQp6FrSiUn
Q2pQ6ggAjV8iNpm2REHcnw/PqW1/AYUeokG6l/zMqUTeSN8/bjjaw4GrC6r8ICe4
ms4VPK43DjxfIxCkZ3Bz7GRVT4Qw8PUhbB0WsWaO8AhNvcIYgasmsvlAMJrUzRRq
n15YmZ2EYf+pWMWnrQXzsW2nYr5JgC8kfxTB38IYYMBU9hHMiFk54hbruO2zrCVu
O2immF9st2C7261umVRpr4mzNqMrByyylK+flgztyq9Cd0qWhNCfU2C24omzutMi
ooI92IoYaduvbLk4W29oarloN8WE7AMQPUgthjVuNPZhBFv8COrPmKW3tDlj1Dn3
1bbEseoc/U33NWNnrH7qsiSGdetozA==
=NQyf
-----END PGP SIGNATURE-----

--nqWT9CePoK38wY5NuvbMp6T1rdnHuRb7x--
