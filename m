Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1965946wrp;
        Thu, 19 Sep 2019 22:16:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbgW/H0z+gYo9TNwtX+Wb7UFMziowmG+fVDpRyRMeFGJjCDsauwLvnx/kA62q9mbhKH0Uo
X-Received: by 2002:a17:906:24c8:: with SMTP id f8mr5448806ejb.119.1568956603016;
        Thu, 19 Sep 2019 22:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568956603; cv=none;
        d=google.com; s=arc-20160816;
        b=wstjJFWLomExhLQ3ILcNE9pU+w7Xmbu3ocS9kPLBnlhZMKyvmoT6AiUzr0SjUuyQNd
         xduvNBYwQMQDg/BRHUkFxIY3blIkX7QJx/KFoYhTY0VKpRijJi7rsa4kdzGT1YirUd7j
         0KGqdkkPbkSdye4yQQLEPcqmol4sx8yCScCgsOc36dSrLPZPsQncitJrZZu27+ifc99e
         3a9YUFwkuJnQiJk25IehfIe0SYKx5HwXSRC+fSTWeulZSy8Y1BTwtAUokSXXHVDCDQRC
         /aMFXRiw4bkRCpvks65fsE8kUp+SRJOV9SAd9hLLbNYDUuyrVAQBPx2UadW99hnj0iZl
         X7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nfIYww4aSvg/Xy1lI9Qt7dwpBN/ypbmuNqNckj9f5js=;
        b=L9duQJUMmIJUuJaSnc+klHuMHha+gyf0xxTlVo1NgDvqEBHALYWSKvfMt+jvX7JAXT
         b/iS7jH8h6diBp9rLXVveBiBswrHkJ3YqGSM1anQ/EhsmwCs5odfYgbGJ7kUGCCw87BJ
         v6mNREHEGcStyJ0xNB06Tu9gXH+/5rZ71UZuHakUqCSPtoMhmpo0gsXxR16/FLe7Ka+2
         f3B4C27lnAHPQDTrKtGA7zAs32xHZ7iVSg3ZLMNlOD88JHmt91vyr8Th64ap6ByfAYtm
         LG+UUE+4KlayzmzBa1ogWMkI8pocBZq0mt2zIJk0Iw+/PrucNMkwcNZR+uKZmrtBv9W7
         tx1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=TkHrmNNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si450439ejw.375.2019.09.19.22.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 22:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=TkHrmNNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBBHc-00066e-U6
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 01:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAx7-000719-Qm
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAia-0004ve-Qf
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:40:29 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:43131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAia-0004vR-Me; Fri, 20 Sep 2019 00:40:28 -0400
Received: by mail-qk1-x743.google.com with SMTP id h126so5967560qke.10;
 Thu, 19 Sep 2019 21:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nfIYww4aSvg/Xy1lI9Qt7dwpBN/ypbmuNqNckj9f5js=;
 b=TkHrmNNsDQ3+dh4R1zd4sdc+bOSI5kvfqygM/VycQ38oPjbiG5F96Z3GszoPw4Qf4W
 WZPo2MC43lMJdH5thTD3x8wWo1S3WkYEBlkFRcFur+vOKMu0Aon/Ld6GIJvQqekp2o7d
 sBwGCQYatxQlcn3p1kU6QREA2k4ieQ46hiL4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nfIYww4aSvg/Xy1lI9Qt7dwpBN/ypbmuNqNckj9f5js=;
 b=iAOc0LmN/xB8MVR05/AFz5IXdDMx0MOGKB0TmER3bPcFWa868I8djQdVS7eXssAedh
 zZ+DdBnIKXD1x+dI7OweUtUDLXp6Z7L8tMU3HwxqLEbMs0rd9M29CDSwXT/Z34Yfkk7U
 WyikUmCkilc9ysLcYJYxw+CLVMBy3X4n0LowXt54UXUsKJvsmadJJAccpoxJ/pu9zf4i
 XgOGRkuTfR8lAHnwkQPKlegbsHEdP8wje2UQu8NOAkACsB3Ks8blY4YSEEDr12oCSPkg
 1qWpYWxaqw1IlTFtvwoRx97IDIzl9ZUVNggBBOUu0doYHRttAn+coJNMSXEnq1oJLXed
 9nGw==
X-Gm-Message-State: APjAAAXadGtJHv0IfgG4HRwdjxvG5rfdrWnhaFtmelJlGInCO4TsTJ/g
 QIdzVgoOz5kpIHb9HTDP9OvO3Oxq/llGfSY71yE=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr1670173qkb.171.1568954427786; 
 Thu, 19 Sep 2019 21:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-19-clg@kaod.org>
In-Reply-To: <20190919055002.6729-19-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:40:16 +0000
Message-ID: <CACPK8XcfEqYUju2S9Q3Qy7=gNaN-7rnD0yOWK9KUHd++K2j7Fw@mail.gmail.com>
Subject: Re: [PATCH 18/21] aspeed: Add an AST2600 eval board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i2JnST2eunPe

On Thu, 19 Sep 2019 at 05:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 52993f84b461..4450e71e5547 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -88,6 +88,9 @@ struct AspeedBoardState {
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>
> +/* AST2600 evb hardware value: (QEMU prototype) */
> +#define AST2600_EVB_HW_STRAP1 AST2500_EVB_HW_STRAP1

We can change this to be the actual values if you want:

STRAP1: 0x000000C0
STRAP2: 0x00000003

> +        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
> +        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
> +        .soc_name  =3D "ast2600-a0",
> +        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
> +        .fmc_model =3D "mx25l25635e",
> +        .spi_model =3D "mx25l25635e",
> +        .num_cs    =3D 1,
> +        .i2c_init  =3D ast2600_evb_i2c_init,

Can we add a default ram size?

mc->default_ram_size =3D 2 * GiB;

With these two fixed:

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
