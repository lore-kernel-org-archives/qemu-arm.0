Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2360563wrr;
        Mon, 11 Nov 2019 23:45:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3v3FTqVD4DtLWm3Y44YAwLFUIVS+a7am5C09e9eFZ5sN9CiXixMD5yFZzF9N6juZqhGoc
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr28304334edr.84.1573544757421;
        Mon, 11 Nov 2019 23:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573544757; cv=none;
        d=google.com; s=arc-20160816;
        b=tMZXA3jWNnCxt8BTygyPphaDaGf/d7nDB1XPsr7xEmIKuRcZHCwZYqJ5jDe8w0R+lR
         Y2Qc5PvpLw+LlO0Hqb2NTe4tnarvg2D7xeMyHgH9pBf8rKgcwJCp/p7Ll8g0kedGTiDy
         R97JvXOOTaPBhWDgKFVwZjVGfdM4iPHqkfDoSevd1I/jO/ITn6W1+jMzRj8cC6npZPX4
         3egzmzOXB3b4/uyt9ReYoTSQYg9JumlA7M/YmNN6ym++QaKmfF1Pf1DRg6cRzAQrBhOR
         UxEeWR2TU2Zj36nxrybE2L5hnaEXKJe7bIC37qOV7LYyjkLzDYCUBM8l85gB0393atxA
         KbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6ntgY6T8EDJB/jX2fMtJtCCXYJnyGmOBY8sW9aOb0Dw=;
        b=scZOzeRWMWZ/kyU4yJqd3n1sYIIxZmxkQLimmf4BevLeISBE8IYo/rNU1MmrkhNYLK
         uo/Q8V36ro6A/V7IMeH0AAABylHNriIHA+MzTxxkZuXSa6k1AQyPIKlJKu9NvVZFsE4X
         esp0sjj2iebkvQ4z3hcZLaryznImh3sQZ72e9rjuqgVlx/s7m6z47C1hazA95ZbpBUXx
         5sa7ycms9eyJu2H95VMAjqnCmtSyX7IwPzKv9uUjRUPj6eANsL+AGeRv5Nb0lqmAnBPC
         3VK7jVqoi7gTDaGWl5EhL0wGvOZP2/iD6EdfK7PgO/FP4esrsV8YDdF3dCCexfPKu/1Y
         CvFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si11038921ejz.98.2019.11.11.23.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 23:45:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUQs8-0005qF-3k
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 02:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iUQrw-0005nX-8f
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iUQrv-0004Lo-8Q
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:45:44 -0500
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:53019)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iUQrv-00043w-3A
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:45:43 -0500
Received: from player758.ha.ovh.net (unknown [10.108.35.13])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 68BC5121D83
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2019 08:45:33 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 74576C03D0FB;
 Tue, 12 Nov 2019 07:45:27 +0000 (UTC)
Subject: Re: [PATCH 1/4] aspeed/sdmc: Make ast2600 default 1G
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
 <20191112064058.13275-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5c0c7d7e-0580-2bcd-39ac-6314c61dd1d3@kaod.org>
Date: Tue, 12 Nov 2019 08:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112064058.13275-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7141583110517197632
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.93
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWo0y2CkSsM8

On 12/11/2019 07:40, Joel Stanley wrote:
> Most boards have this much.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
>  hw/misc/aspeed_sdmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index f3a63a2e01db..2df3244b53c8 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -208,10 +208,10 @@ static int ast2600_rambits(AspeedSDMCState *s)
>      }
> =20
>      /* use a common default */
> -    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
> +    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
>                  s->ram_size);
> -    s->ram_size =3D 512 << 20;
> -    return ASPEED_SDMC_AST2600_512MB;
> +    s->ram_size =3D 1024 << 20;
> +    return ASPEED_SDMC_AST2600_1024MB;
>  }
> =20
>  static void aspeed_sdmc_reset(DeviceState *dev)
>=20

