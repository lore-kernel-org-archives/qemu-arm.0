Received: by 10.28.71.27 with SMTP id u27csp760935wma;
        Fri, 9 Feb 2018 02:58:21 -0800 (PST)
X-Google-Smtp-Source: AH8x224NYS2+nLaSHwrHwa8lIyrp2eFHcPdHB4oY0LR33+GHluEdJmYGi9F20hxRlaSisNyH+DqY
X-Received: by 10.37.19.6 with SMTP id 6mr1363132ybt.255.1518173901030;
        Fri, 09 Feb 2018 02:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518173901; cv=none;
        d=google.com; s=arc-20160816;
        b=Qpi78AX7AKotpWI0RkwKZT2G3rX3oz4I2eK87sF3qGlhXWCv7YPcuE/5JGzkwXD/Po
         AsbbTxulgcZlM7DObMBNTfrelOhAcsKpcphBo+zuH/2Gfc3frWBcOffFZgcxc7ihEfFg
         DyxKHVKU73i6TEr3H5NNjOXM1olNRJswSFEvIsClSZ8xI0++2p+rvYG5dTXznG8EjQvC
         ok+sBGzgFszreNotPlzeMFs7x1OwPYePuAjrp5hYP0pnFtrIU0p25raPGtKxtmeO+1QK
         b6SWLIlXBNy7ds7cdOdFqWY2jk+NsCaOTnheXgHbyYcV+nGonLfBFmYB5+nX9mj4a+W/
         YYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=UbU4KKRrdXtnNbT0SvxlomKLjj8Qr/ENxgCP6e1Pjak=;
        b=1DX3g6E8b+VmZMg3SeRj4zPJG4NOC2cmxCKNZJZZ6qCCLkpKBeoBAZN7MAdP9lHwiY
         8528tWxmSc5k1Cx4cfaF6CloV90EFeUUliz3/VArOgxE/A0G1UMP+YcnQjRBfRhj2JSS
         7DkxVNs8EP0y3FgOMqUw4Z0KPg+o1pxG+xQHDPSAUy8m7QyzNYak1eNCiR7W/7DnTMvV
         yaXDxoau/bcs5XHl/GXnXegdqJazFyFq4Vuc1c162U8YIJ/qzp8HzODzsHhm2l/RFf75
         /I0QnYz9Y+HVuqxstXPvKPqN74tppNYVnTcWz2DxgFSiM0vqK/cp3cX3GvPah5e1JcNz
         4Szg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r188si355390ywd.773.2018.02.09.02.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 02:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek6No-0006fy-Db
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 05:58:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ek6NU-0006db-E8
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 05:58:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ek6NP-0006Pf-JW
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 05:58:00 -0500
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:45544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1ek6NP-0006Os-Cl
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 05:57:55 -0500
Received: from player697.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id AF8018F67A
	for <qemu-devel@nongnu.org>; Fri,  9 Feb 2018 11:57:53 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2226-150.w90-76.abo.wanadoo.fr
	[90.76.48.150]) (Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id E91B2480093;
	Fri,  9 Feb 2018 11:57:48 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
References: <20180209085755.30414-1-f4bug@amsat.org>
	<20180209085755.30414-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6b80dc31-c710-e4cb-4d0d-ac74cfd3e874@kaod.org>
Date: Fri, 9 Feb 2018 11:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180209085755.30414-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9129077923020573616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtfedrvddtgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.49.208
Subject: Re: [Qemu-devel] [PATCH v2 1/2] hw/arm/aspeed: directly map the
 serial device to the system address space
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1wdzYVlfSqYi

On 02/09/2018 09:57 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> (qemu) info mtree
>  address-space: cpu-memory-0
>    0000000000000000-ffffffffffffffff (prio 0, i/o): system
>      0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
>      000000001e600000-000000001e7fffff (prio -1, i/o): aspeed_soc.io
> -      000000001e784000-000000001e78401f (prio 0, i/o): serial
>      000000001e620000-000000001e6200ff (prio 0, i/o): aspeed.smc.ast250=
0-fmc
>      000000001e630000-000000001e6300ff (prio 0, i/o): aspeed.smc.ast250=
0-spi1
>      [...]
>      000000001e720000-000000001e728fff (prio 0, ram): aspeed.sram
>      000000001e782000-000000001e782fff (prio 0, i/o): aspeed.timer
> +    000000001e784000-000000001e78401f (prio 0, i/o): serial
>      000000001e785000-000000001e78501f (prio 0, i/o): aspeed.wdt
>      000000001e785020-000000001e78503f (prio 0, i/o): aspeed.wdt
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.=20

> ---
>  hw/arm/aspeed_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c83b7e207b..2a5d041b3b 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -257,7 +257,8 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hds[0]) {
>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs=
[4]);
> -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
> +        serial_mm_init(get_system_memory(),
> +                       ASPEED_SOC_IOMEM_BASE + ASPEED_SOC_UART_5_BASE,=
 2,
>                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDI=
AN);
>      }
> =20
>=20

