Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp250346lfp;
        Thu, 6 Feb 2020 23:22:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6Z2l9SIb2U6x9vpMFZfNHqwnvUKbAdWaR3mSu7CLfmIKmA2+Q1YHS0E6u65q7UGKx6Rg4
X-Received: by 2002:a37:988:: with SMTP id 130mr5531035qkj.428.1581060163384;
        Thu, 06 Feb 2020 23:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581060163; cv=none;
        d=google.com; s=arc-20160816;
        b=PuPfQtKsGJ0v+aIjemv+VncJiSmL/q0KKmnsiWcowTi3fIk3oME1YPplGXRGjw4R9s
         tb1A/B+A2C14S1iNtzMY37MGfBTjbclVMhs4Kpi9EMU7NOsAFSeQkO6fRYgzfVsMPu8/
         5XOK4UYGFh6DNCPvz7+mJwR/h/nYlIjAJ77gELBlxTumaGkJ6w4QBsQBEQgqEhLJ/gCB
         oTd2Kp0Nn4CxIHr+IyY3xzxs8/mj5tqPxOc/CqYMnmHCPBI1EytnePq5aSMsAC2AZeVl
         39meWjIUcNFMPKxK4MVhCyk2B1xLKXyLnFJEzzB+pn483MFjwlh+eK/27xaJKK6ACbGS
         HvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PLGtVCH5W9S+lsZ4vA4fIkw3v5YgliIpxKZzIDlA+FA=;
        b=xAj79mws69OD6xrKXaIKkUM+ZDjmZQKkeui7hu44nxk3ilpnPWl462BAJ6hB5MvyFK
         ZJzhq7qu6Q3jo1H+R2gCgW5A99rNPj3T4t1uQ2ytmOVKNaA6veqSu/eixaJKxciOUtRg
         pw2QiBhtNqv7jj3krtOBaVklSe4uEjBPugtcvXqR+UmvobEbmAaasGy4OUbmQxg/2RMF
         tWpu6dZr8+L5LUSEgqV3P/AxUDWS0kd6msGc5aO34btzxA6wapEmsaGU3TGcOlIItje2
         2yPSaKlWOPV7SBU34m4HdoXR4jF/P/9hhE7W/sJr3luv5zVS/aey2Z9PIM/5xvmqaNbh
         SF6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc4si829279qvb.164.2020.02.06.23.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 23:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izxyM-0008Po-N3
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 02:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izxyB-0008L3-UX
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izxyB-0005Mq-09
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:31 -0500
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:56528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izxyA-0005Lm-QM
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:30 -0500
Received: from player771.ha.ovh.net (unknown [10.108.35.232])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5F17112231E
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 08:22:29 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player771.ha.ovh.net (Postfix) with ESMTPSA id E820CF2E2E43;
 Fri,  7 Feb 2020 07:22:17 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] m25p80: Improve command handling for Jedec commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-2-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7fcedc6c-c699-218f-d380-06a2e8b9f2bd@kaod.org>
Date: Fri, 7 Feb 2020 08:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1167839680739118000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeggddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.172
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSXyBauldTST

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> When requesting JEDEC data using the JEDEC_READ command, the Linux kern=
el
> always requests 6 bytes. The current implementation only returns three
> bytes, and interprets the remaining three bytes as new commands.
> While this does not matter most of the time, it is at the very least
> confusing. To avoid the problem, always report up to 6 bytes of JEDEC
> data. Fill remaining data with 0.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2: Split patch into two parts; improved decription
>=20
>  hw/block/m25p80.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 5ff8d270c4..53bf63856f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
>          for (i =3D 0; i < s->pi->id_len; i++) {
>              s->data[i] =3D s->pi->id[i];
>          }
> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +            s->data[i] =3D 0;
> +        }
> =20
> -        s->len =3D s->pi->id_len;
> +        s->len =3D SPI_NOR_MAX_ID_LEN;
>          s->pos =3D 0;
>          s->state =3D STATE_READING_DATA;
>          break;
>=20

