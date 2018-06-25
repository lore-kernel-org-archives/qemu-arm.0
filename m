Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3443812wrq;
        Sun, 24 Jun 2018 23:13:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdU2YfuLSAYY3FfUuqwyi8GRa/xHYD75x1Gp/DwXDckShVjH0nwmHRekizuMcfxWLw1qvNR
X-Received: by 2002:ac8:37f2:: with SMTP id e47-v6mr9487379qtc.386.1529907197549;
        Sun, 24 Jun 2018 23:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529907197; cv=none;
        d=google.com; s=arc-20160816;
        b=NacvdkzF2X/FXuV7tNCIiEDEzJ7ivJ7lMZZPql3GBVZxn4pQMkrA21CHve/DyhCNzg
         H71gTz7Z79+Wx/xHXY1gq7tM1hbWU1uVrsBEq3gfoiBUkkk1R2XUNIqAyPPgzOWo+jYJ
         HOjVDAS2BDGia2sXDSSvM1e3EhHzdTFfHtNEma8Yh2dfzvhTEZjrFlT3czFD0FE1D7D1
         Hl61XMGpMwBQQqZNGX2bb8YtkkJcC8jgVFYPu9nbV+wE6u/bnJeoy9rlATi6hkwyVVAP
         gzOHSLhPKTkAKReDxMIvCQBFGp0xULXrp+PAJepj0oSgbRZr3KyN9q5+TZMuKaFEKeMY
         T1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:date:in-reply-to
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=pA7afJVrPjFbdC0RLLHfj7nazdwM1db6Nq/FwwP2n+c=;
        b=yzuTfAmA+JAcHS/68OP8jS1beBIoQ1UpDSy7pQbNPrzc7Vl/YLVH48jwQkH/KFtnao
         Y6+ub5zAiKFawLvUIEf7isWCLWm0nzvgZ1zro+AfzZhaukKSApiTPbi7A5FLh7L+sOgA
         nscubSI0TUzLOU0qifNVRwWdCM0UYZ3qMrgroI22jQswLZrvEEFJhpltIp56koHPXBqu
         Ael4CIKDNTaC/lEXOk2+cgjitKeVRWujXVUmKgPxAQMyFNwJn8LnJuwp7XDgjIBtRVlw
         WOJ2SGMBn2hPbAd8Rpv2p8cBMEYnxhlorMk/9BF9I2Smkc9l+O+ceK/coPp/w2JYcgO1
         pjkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=T5Tzl7NV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=g797xJij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f10-v6si2852689qkb.49.2018.06.24.23.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 23:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=T5Tzl7NV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=g797xJij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXKkX-0002Mh-0m
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 02:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKkI-0002Iw-U5
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKkH-0000Kl-CI
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:13:02 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXKkH-0000KA-86; Mon, 25 Jun 2018 02:13:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0B10521609;
	Mon, 25 Jun 2018 02:13:01 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Mon, 25 Jun 2018 02:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=pA7afJVrPjFbdC0RLLHfj7nazdwM1
	db6Nq/FwwP2n+c=; b=T5Tzl7NVg6PJERvZFgMGUyFIGBjkYlKZUSTKWuBUrV81P
	jh/++iA72woAGfvscF9kcYb33CySVaQVoDMWfEiW6X98LJQHS9Cxd5R1hpnPD3yW
	fBrlkrZU5bKzBwvPmsVWnYf8+PLISHYtIGWv3GSfliNd0XCz4+jIIG1h+nW7TrIX
	1iy3TQtmMMHMRBF/mQ1jWObV/v7Vlo+yVQcRhH9JC1stu0OyZRow7WydlClvg+ku
	9DL89ZQUwaNeP9Bao4/PMFQUAyFAIoEfP75jgVTrbDKsNg4FSkoXKPLnoM0ICzsc
	H/0DNsgCqpuP7cuCTFe9mbmEa5E2TksQS5Op89ulw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pA7afJ
	VrPjFbdC0RLLHfj7nazdwM1db6Nq/FwwP2n+c=; b=g797xJij95cay7f1nOL6ot
	DtkDqhYuyEX6Y4LV6q96pZtReUkRm7VO9g4alikdxwZCYKQM2G8C3Mw3dXorhHWm
	EQoOOC5G1lZgEJVHAyhp5fSQPshBrmb4sHIfYl52YTnCGwGjPvfZjPIkJhDQ8aZ5
	+ZZsnHoz8/KEYTyw+61e9v51dGjnjkBT6NWJYCFviELJCqyxw7i6YPQXTbOCyz44
	jx5bPehnVxFzOhV14ppuaH0R9zaMYdTNRXybcI9BfatQa/e3t6O/ZvCTCNteHMfj
	NpHr+pN/kFPrQeUjeIrdLkRkjx1UQlFiunINb8WHPktlr0d8cH0eJaSY47zMBdvg
	==
X-ME-Proxy: <xmx:7IcwW9m6BCLehst8E-jrKTHbWh0fvqwrNzqhIICeKbDu_VW7-1GfwQ>
	<xmx:7IcwWxMNTC9ejb-1VSE3diWmjDwrF-tORdQ7xVIE9iW86Qy-mUh-LA>
	<xmx:7IcwW97o25-ZndsNATN-MKu8gTVNbWQ64_wbyFQsiK6YPW7sxm-Grg>
	<xmx:7IcwWyKkYOwSaHrK6T6IKx77ubVJcAHG94YFjvps-zwwE3yX9Tq9TA>
	<xmx:7IcwW5Lt-xlThYD6zGcRX_QV9TjfawQHCFB3p0r-oADQH8HLkDgzsw>
	<xmx:7YcwWyyAhEfh_2yjVLBow6s8xbTZ9Z_CHMNVTSLOOw9NcIFZ_WaogA>
X-ME-Sender: <xms:7IcwW1nTEOFcxkEexPwebZfFNszZeYTfvtGDYPW4gIeYdfCLpxX26w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id CECECBA43D; Mon, 25 Jun 2018 02:13:00 -0400 (EDT)
Message-Id: <1529907180.2296295.1419124016.128CD074@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
References: <20180612065716.10587-1-clg@kaod.org>
	<20180612065716.10587-4-clg@kaod.org>
In-Reply-To: <20180612065716.10587-4-clg@kaod.org>
Date: Mon, 25 Jun 2018 15:43:00 +0930
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] aspeed/smc: rename
 aspeed_smc_flash_send_addr() to aspeed_smc_flash_setup()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZU4r/IUh4OF

On Tue, 12 Jun 2018, at 16:27, C=C3=A9dric Le Goater wrote:
> Also handle the fake transfers for dummy bytes in this setup
> routine. It will be useful when we activate MMIO execution.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index b15370893583..b29bfd3124a9 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -503,10 +503,11 @@ static int aspeed_smc_flash_dummies(const=20
> AspeedSMCFlash *fl)
>      return dummies;
>  }
>=20=20
> -static void aspeed_smc_flash_send_addr(AspeedSMCFlash *fl, uint32_t addr)
> +static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
>  {
>      const AspeedSMCState *s =3D fl->controller;
>      uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
> +    int i;
>=20=20
>      /* Flash access can not exceed CS segment */
>      addr =3D aspeed_smc_check_segment_addr(fl, addr);
> @@ -519,6 +520,18 @@ static void=20
> aspeed_smc_flash_send_addr(AspeedSMCFlash *fl, uint32_t addr)
>      ssi_transfer(s->spi, (addr >> 16) & 0xff);
>      ssi_transfer(s->spi, (addr >> 8) & 0xff);
>      ssi_transfer(s->spi, (addr & 0xff));
> +
> +    /*
> +     * Use fake transfers to model dummy bytes. The value should
> +     * be configured to some non-zero value in fast read mode and
> +     * zero in read mode. But, as the HW allows inconsistent
> +     * settings, let's check for fast read mode.
> +     */
> +    if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
> +        for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
> +                ssi_transfer(fl->controller->spi, 0xFF);
> +        }
> +    }
>  }
>=20=20
>  static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr,=20
> unsigned size)
> @@ -537,19 +550,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque,=
=20
> hwaddr addr, unsigned size)
>      case CTRL_READMODE:
>      case CTRL_FREADMODE:
>          aspeed_smc_flash_select(fl);
> -        aspeed_smc_flash_send_addr(fl, addr);
> -
> -        /*
> -         * Use fake transfers to model dummy bytes. The value should
> -         * be configured to some non-zero value in fast read mode and
> -         * zero in read mode. But, as the HW allows inconsistent
> -         * settings, let's check for fast read mode.
> -         */
> -        if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
> -            for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
> -                ssi_transfer(fl->controller->spi, 0xFF);
> -            }
> -        }
> +        aspeed_smc_flash_setup(fl, addr);
>=20=20
>          for (i =3D 0; i < size; i++) {
>              ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> @@ -586,7 +587,7 @@ static void aspeed_smc_flash_write(void *opaque,=20
> hwaddr addr, uint64_t data,
>          break;
>      case CTRL_WRITEMODE:
>          aspeed_smc_flash_select(fl);
> -        aspeed_smc_flash_send_addr(fl, addr);
> +        aspeed_smc_flash_setup(fl, addr);
>=20=20
>          for (i =3D 0; i < size; i++) {
>              ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
> --=20
> 2.13.6
>=20
>=20
