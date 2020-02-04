Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5015390lfp;
        Mon, 3 Feb 2020 23:45:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5oiLZzAcbGbA2VBdHmBRO8Dbz6+GjgK4yPfY3QiQ0Dy39hVWtNwmmH25ZmLXrAvODljRu
X-Received: by 2002:a37:b842:: with SMTP id i63mr27552413qkf.451.1580802337017;
        Mon, 03 Feb 2020 23:45:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580802337; cv=none;
        d=google.com; s=arc-20160816;
        b=IDfyICIaRo/OVPV3h9EamM8jGX6XDOReLYcQvi13w4l6VJhEwChNzY4IMIyYe26Zhs
         If1RxKq9mwgmxssyOt/tdOjAR29NvdfYgRHUBnIn04A/31ukqNkKmm7OwsfU2WD/4qk+
         AGMN7TeSzOXJSPeCrJAJF4HxzSiZxPmRfetzXOA58YLKDN1qTgxESxDvmcmpM2L+A+kF
         eiWHDe/LbVxiP8SiIWBxeR0acwhXpJvdtpBfSgQk+NFvoyOebKqaKWjZ7KgFb6fzrWrl
         Rp4xA1pF41tP4c/0A5lvJCYpUT7lKYq2JwciWnOD/x7ZW6buRsqZNBp5hdhjiTO5f5D8
         bZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=lXMaBLLcQbhgOG1Dwv/d+J0svfpSerG+jLPKDCAnRcA=;
        b=frf9mFjJlwhobKgt8hAJ7eiHmF8ZGG/4/P+tLzBgSlfNmTi1UJh8QTLDhpjQfiDWbN
         vXC6oBBgBnL7JrcG9oaL6xFqns9awVj4DP83dx2dG+ujOIki7+CiVPyhnaafljl3heJZ
         LnDIkHA583KcQNGxhR2+9lE2jwCKNq6kmwuG130cpnP6VOGFj0h8RjCt3dcLOVVpnsrQ
         RzMVP3jxWbJwHc5KEwZaE1sR64S5HQXdNG4Jf+M+70YvX83ITWg/lvJibhxqEyLFS5pQ
         V81txvNHwYcgcJ0vlQZ8hNKb2OZI5C/iadDaGwH5i+KW9Suolm9VO3ZCy6PJd5MlOwFA
         h0TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si13235462qvg.36.2020.02.03.23.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 23:45:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iysts-0005GE-85
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 02:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47573)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iystj-0005DY-ON
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iysti-0006D2-Fk
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:45:27 -0500
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:45174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iysti-00064i-8Q
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:45:26 -0500
Received: from player168.ha.ovh.net (unknown [10.108.35.197])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3716D158889
 for <qemu-arm@nongnu.org>; Tue,  4 Feb 2020 08:45:24 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 1BED2EEF7410;
 Tue,  4 Feb 2020 07:45:12 +0000 (UTC)
Subject: Re: [PATCH 3/3] aspeed/smc: Fix number of dummy cycles for
 FAST_READ_4 command
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-3-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <329f6d24-6d47-4e2e-1a66-7683bc0529a9@kaod.org>
Date: Tue, 4 Feb 2020 08:45:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203180904.2727-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2383248630908488570
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgeekgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduieekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.140
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJuOcLx3AWj0

On 2/3/20 7:09 PM, Guenter Roeck wrote:
> The Linux kernel recently started using FAST_READ_4 commands.
> This results in flash read failures. At the same time, the m25p80
> emulation is seen to read 8 more bytes than expected. Adjusting the
> expected number of dummy cycles to match FAST_READ fixes the problem.

Which machine are you using for these tests ? the AST2500 evb using
the w25q256 flash model ?=20

Any how, it looks correct.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Fixes: f95c4bffdc4c ("aspeed/smc: snoop SPI transfers to fake dummy cycle=
s")

I think commit ef06ca3946e2 ("xilinx_spips: Add support for RX discard=20
and RX drain") needs a similar fix. Adding Francisco.

Thanks,

C.=20


> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f0c7bbbad3..61e8fa57d3 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -762,11 +762,11 @@ static int aspeed_smc_num_dummies(uint8_t command=
)
>      case FAST_READ:
>      case DOR:
>      case QOR:
> +    case FAST_READ_4:
>      case DOR_4:
>      case QOR_4:
>          return 1;
>      case DIOR:
> -    case FAST_READ_4:
>      case DIOR_4:
>          return 2;
>      case QIOR:
>=20

