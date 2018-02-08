Received: by 10.28.71.27 with SMTP id u27csp2340877wma;
        Thu, 8 Feb 2018 09:36:19 -0800 (PST)
X-Google-Smtp-Source: AH8x225IZG86R4k6DffOs/NaogWbfQ2XNy5U6oYZ8Qg7PGc6+qsrIwSG2pN/xslIDYIaUHH1y+Su
X-Received: by 10.37.40.1 with SMTP id o1mr1105042ybo.318.1518111379429;
        Thu, 08 Feb 2018 09:36:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518111379; cv=none;
        d=google.com; s=arc-20160816;
        b=WzgFV+3ixCqEj8WuNxPMvFjUg/y3Y2mfXte0tQxMXwAvSU+D3L5DNnwwNK+jUnUr86
         7P6OLup7qkmR0gzAKERjt3os2+VGdLfgb7Oemj66fd42eSVWkIkpPv+16FP9Txoze8j5
         9KRcPEAVsW0qRz28VQ6KHymSKcSCp6KH2lt2uhHiKtcrMniTpN+7TRAMTxV37CVNNcOG
         qYj+VjE/4yyrbyRoGcoH+HaiivycFUuE9lrSaudGkyznCGE/rC/LgxLaJPHburUz1hLy
         OSChLSSYlRQzrxwLUH3stRkoiniiXfy7IfGanDkEPvLhahLOdg3/ZEl83AdzOOa4WBrM
         Tq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=1tzXdoNgtZ3A5clLTtNnlXw2vUZSg/6xylAIVKeFkGg=;
        b=bDhXIDmTyf57zjM8A2KPN62jr7lukE41u6DKVtdcySkRvn0jako7nwYstspjanziYY
         H9+G01gmgrPAYNAxllNL4yHdfkcAHXQFCa1yQXPd9z+Yw/m8xky6wocg8N07/YNAhiYK
         1DF8rc580mo3gwxFH4swx/mZn5R3Y4hVTYl30OZf29NG6dSvFeHPavdTbmE3S/+UcyyE
         D0TlGVF7X3jNQKUf3AHM82IXAd/RIRkFf/Cy5Kabrl9Gova/Ssll3sp363cHvhGkBkXU
         kg2oBUAiZEikUZj39AlrUliX1dd05k/N1fNVMaqY1vNpOdiJUH5Jig/a9PU0fWpBEvow
         C2uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gaXssaqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7si77160ybh.637.2018.02.08.09.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:36:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gaXssaqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejq7O-000747-PK
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:36:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejq1e-0001vJ-Bv
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:30:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejq1d-0004au-9A
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:30:22 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:38000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejq1d-0004ZZ-4N
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:30:21 -0500
Received: by mail-oi0-x243.google.com with SMTP id j15so4064724oii.5
	for <qemu-arm@nongnu.org>; Thu, 08 Feb 2018 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1tzXdoNgtZ3A5clLTtNnlXw2vUZSg/6xylAIVKeFkGg=;
	b=gaXssaqO989vD4vLE1UQhUg2zVoKZWpSmo5d0Xv2mEJjo1uScl+2goEo042zFfMuJO
	mB+qV7AIKSvLy492BGDelXM56fe7lU72mmWBI+ppLWygNH63PIA/bnsD+QMTqBIB2OLv
	Sf1R773hYun/RS+cd+rSRJlygAudluP2uL6jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1tzXdoNgtZ3A5clLTtNnlXw2vUZSg/6xylAIVKeFkGg=;
	b=WODIXTj2Pz5caYjaLyfLIt69O8OPvJ01UZNeqagwu4f2tuLxdhoOiAZnzC1Yc1VzDP
	4DqZYIQNq8WVC0dCyK4EGB2jW/zYmgj6APd8hy9io5VZLIGd4c6sYUo+mEMX/V8VCfwD
	vub3AWqczcvu7xCTZyT6iFugzmOPuldj2MpTAc8mNEIUHWKcT24aEICRJq0U74RXATH2
	nKmnSzsMxbGmNQrCeE4QiBkLvVTBINCNkKxLLH3f+0kC0wVAjgMthbfDtEvAWM2/+JHP
	ixfKYlYp6bJJ1FXO/GOIntXev8k0YDaAf8/6xCgwBf4vNSeIQDtdJF2jGvwzDEw5ViWo
	bCkQ==
X-Gm-Message-State: APf1xPAzWUEqhol86edb9Cw0PL2L+uZY2CeKyT6fHYuydBYC570YiFae
	7OEGgUIPJCf1lbaEQR7TPy/DFJpPR+XATupM9SQlow==
X-Received: by 10.202.105.84 with SMTP id e81mr947544oic.305.1518111020421;
	Thu, 08 Feb 2018 09:30:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 09:30:00 -0800 (PST)
In-Reply-To: <20180208172202.9984-2-f4bug@amsat.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 17:30:00 +0000
Message-ID: <CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GEI4fvLU3NoG

On 8 February 2018 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/aspeed_soc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c83b7e207b..a786750e14 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -257,7 +257,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hds[0]) {
>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
> -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
> +        serial_mm_init(get_system_memory(), ASPEED_SOC_UART_5_BASE, 2,
>                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN=
);
>      }

Is this a bug fix? It certainly changes behaviour, which
suggests that a fuller commit message would be useful.

thanks
-- PMM
