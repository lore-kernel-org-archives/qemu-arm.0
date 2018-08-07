Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4007212wru;
        Tue, 7 Aug 2018 02:55:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcjNG9ZNVnDkQDpAOl5X2K9JHK2VPcCmLPDkuzs+oN8Ozh0MNINfbug/wZz/3DnhBeZSOD0
X-Received: by 2002:aed:22ed:: with SMTP id q42-v6mr17820533qtc.193.1533635725299;
        Tue, 07 Aug 2018 02:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533635725; cv=none;
        d=google.com; s=arc-20160816;
        b=wwq84QxuPxToWlhiKeaFYISqXJ5uflacdxgeOrPhuLRo6SMJnVnweVl3DdIHGv+t0O
         w0Zc6kB+bh1+WbPJO/xKmpyxlgJHs2mStWw951bxhNHrff5MER90FUqiEsMDWcyB8v9M
         4d/VshePiM9NO9I52I2ORrMDqyVo+5sDM5pNyBJKShQCPUNJd8xR/kbigTQs72L1QIKh
         vRXjAa+eCGJIW0rKS++14LRYFT0w96SRkB8O1SZQsEgQOQ06uExo1fd+xVwflbIx591J
         VLqODlEwhHd1Iqyg/0Pc+FGwJnsyGrH6ELjKxjCexe7UvLzR6RUFJVHspELFdw7evMGj
         4prA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=sYMD0xHvISYcUuDRS5j6C4bPgD63Q+/fKgacc+RstGI=;
        b=NFHDJC1d2OkOTI4uiQJIvGy6AeYS9J7VZ9qL6uDQnZIzeGlVlzXptvFr1zMXQkc7CU
         NqBaFMTfhdnsWOCmSWZDxpRxAyuzBbXPN7wXQnXXjHqkG8f/pDCJOpctCq1biviphvNs
         WHjjE1RQJgx0XJUDqof2IDUcBBQ28c1WOFfgS7UsgeJfbCg9sF0jQkEgtGkWJ70nMWv2
         zkM5P+3gsX9x5E5pg3NxCR2gJovQrzUmPonRyDvXj3qAiLfxRoXW4HrvgD7w99ZKHbKY
         Hd9wHuF7N974LmlhSc/jpRGRVSMitfQDgEbD61xUae/b2vLwDLaXM0r7WoO7Zufk/wTS
         D+kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66-v6si810724qkb.392.2018.08.07.02.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 02:55:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmyi4-0004u0-Qc
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 05:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmyht-0004rF-86
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmyhq-0007rQ-01
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:55:13 -0400
Received: from 20.mo3.mail-out.ovh.net ([178.33.47.94]:46205)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmyhp-0007qk-Q5
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:55:09 -0400
Received: from player730.ha.ovh.net (unknown [10.109.143.246])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 238921CB24B
	for <qemu-arm@nongnu.org>; Tue,  7 Aug 2018 11:55:08 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player730.ha.ovh.net (Postfix) with ESMTPSA id 4EFBE4400A2;
	Tue,  7 Aug 2018 11:55:02 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4d731cd6-7b48-664b-47ad-18998b7152c5@kaod.org>
Date: Tue, 7 Aug 2018 11:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7816841580513430336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.47.94
Subject: Re: [Qemu-arm] [PATCH 2/7] aspeed_sdmc: Fix saved values
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A4ubxufbDaxM

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> This fixes the intended protection of read-only values in the
> configuration register. They were being always set to zero by mistake.

yes :/

> The read-only fields depend on the configured memory size of the system=
,
> so they cannot be fixed at compile time. The most straight forward
> option was to store them in the state structure.

We could also use an array of init values for registers, like SCU does, b=
ut
this is fine for now. =20

> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/misc/aspeed_sdmc.c         | 27 ++++++++-------------------
>  include/hw/misc/aspeed_sdmc.h |  1 +
>  2 files changed, 9 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 0df008e52a18..24fd4aee2d82 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -126,10 +126,12 @@ static void aspeed_sdmc_write(void *opaque, hwadd=
r addr, uint64_t data,
>          case AST2400_A0_SILICON_REV:
>          case AST2400_A1_SILICON_REV:
>              data &=3D ~ASPEED_SDMC_READONLY_MASK;
> +            data |=3D s->fixed_conf;
>              break;
>          case AST2500_A0_SILICON_REV:
>          case AST2500_A1_SILICON_REV:
>              data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
> +            data |=3D s->fixed_conf;
>              break;
>          default:
>              g_assert_not_reached();
> @@ -198,25 +200,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
>      memset(s->regs, 0, sizeof(s->regs));
> =20
>      /* Set ram size bit and defaults values */
> -    switch (s->silicon_rev) {
> -    case AST2400_A0_SILICON_REV:
> -    case AST2400_A1_SILICON_REV:
> -        s->regs[R_CONF] |=3D
> -            ASPEED_SDMC_VGA_COMPAT |
> -            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
> -        break;
> -
> -    case AST2500_A0_SILICON_REV:
> -    case AST2500_A1_SILICON_REV:
> -        s->regs[R_CONF] |=3D
> -            ASPEED_SDMC_HW_VERSION(1) |
> -            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> -            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
> -        break;
> -
> -    default:
> -        g_assert_not_reached();
> -    }
> +    s->regs[R_CONF] =3D s->fixed_conf;
>  }
> =20
>  static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
> @@ -234,10 +218,15 @@ static void aspeed_sdmc_realize(DeviceState *dev,=
 Error **errp)
>      case AST2400_A0_SILICON_REV:
>      case AST2400_A1_SILICON_REV:
>          s->ram_bits =3D ast2400_rambits(s);
> +        s->fixed_conf =3D ASPEED_SDMC_VGA_COMPAT |
> +            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
>          break;
>      case AST2500_A0_SILICON_REV:
>      case AST2500_A1_SILICON_REV:
>          s->ram_bits =3D ast2500_rambits(s);
> +        s->fixed_conf =3D ASPEED_SDMC_HW_VERSION(1) |
> +            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> +            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
>          break;
>      default:
>          g_assert_not_reached();
> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdm=
c.h
> index 682f0f5d56dc..e079c66a7d73 100644
> --- a/include/hw/misc/aspeed_sdmc.h
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -27,6 +27,7 @@ typedef struct AspeedSDMCState {
>      uint32_t silicon_rev;
>      uint32_t ram_bits;
>      uint64_t ram_size;
> +    uint32_t fixed_conf;
> =20
>  } AspeedSDMCState;
> =20
>=20

