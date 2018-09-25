Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp609882wrt;
        Tue, 25 Sep 2018 05:27:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63psn0cG+VZSxOBj8AJ5BZBf8y3jNsZh7w4roPKz3ni5bn6QGdsttOQ+AcV7UyBhkbPrcn6
X-Received: by 2002:ac8:22f2:: with SMTP id g47-v6mr567338qta.105.1537878440524;
        Tue, 25 Sep 2018 05:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537878440; cv=none;
        d=google.com; s=arc-20160816;
        b=AAJOoIQGG9xb0z5O5VFUS4LZvJh6Lx5+uohd2Q03zXqN6RJJxr7BsJc8Ga5VLG7aba
         1HiOiBPf1w34/3KnmgoyRW31b6iwqvXM+PdMH/9Dc2YoYfmvE058UTuQTN6Zq/0kDhUm
         cn4qV4iU7seFi73fx3mbe1a4OAZAprLO7I2EryWsxRFobsyqyi21IyiytRBk3XEcjZps
         k6Sk+fFval0afIXKNYQQGcQxAyDt55rUq4TT8tqOjfRtbGLGkEidFEuXMNhnbfFswU5/
         UJIbivM4HiSdaZLKeTdRpStqJMP4GrbOI3bNondHadxSim8ovoNEfZfpUvPip60iOwBC
         hc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=YAX6t25WW9yJPw5Hn0pcQKFCvEDRyvUgUPMXuAsJOaY=;
        b=ETwZ8i+piTxZkJ5ATSaaeYK4+SaBoFsJFBwDmnyRnHR55QM+uLu5aSW4ngKsuBRLt/
         UJMFRhECl5SAOXFsIaHYIEYPSPflJy+BCVJ2UlkiAj+dbL6x/aRvZo/iT81csJCQ1iMO
         a+2HcQB+T46o3isnr3hl/AwJaidu9wugKfUK7QKoMRdWQA5TCGDI+C78InLA0OVecc37
         5xZMS8xs27F/MQYfjnu9pGTLwHQ9ELz1+nRdEiQFKIGbmUEkUU8P/UqCRcQXQZk6Yiwy
         yPvyZBLzja8k1nwmPMsepaAgCsdqrY124JoOOITlg3Cp0Ppa4BH/kYmWKF80zQjsQ1mq
         4Krg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i7QXqTog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188-v6si1616322qka.330.2018.09.25.05.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 05:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i7QXqTog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4mQx-00023c-RQ
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 08:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mQq-00023J-1e
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mQp-0002Yx-5T
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:27:12 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4mQo-0002Yd-Tx
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:27:11 -0400
Received: by mail-oi1-x243.google.com with SMTP id p125-v6so1293161oic.3
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YAX6t25WW9yJPw5Hn0pcQKFCvEDRyvUgUPMXuAsJOaY=;
	b=i7QXqTogOmSonTMqOPAMNY4C9iaW/ZWdXHGEFI7iYWGLeaKTYE9XrMRwqkmdelRd5w
	t7RY69KRdjCXYf46yIrpg19YCEMa9Z81wItS2X4OWMSJyPooANSTEEtUxN0wfx0voHHg
	nigOSeNvFjvjjbD/oqsweM6OBCk/GgvXRRQqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YAX6t25WW9yJPw5Hn0pcQKFCvEDRyvUgUPMXuAsJOaY=;
	b=pgGFnuzQeYF+11BAWZKu+8yCcgYO6cxydtDPLxzfZ7aogY7ayx8RrZgnBxEkzFc2HH
	0O4s+ZfM/jYktyE6tOjSoq2Qjb/pALpmxxFN9VaqdloLqwGR+bQLJYyGS5aNS/URS6E5
	evJQY2XiJdGS9aJ4occivaETeMCObStI5H0+R9Am1+0CCd6i4IKCdwi0ttaXRVK5lFwq
	ELZNRdddtKAvqCqMjWPwQlehHOZU+7R8i2OUeAMu9C+Z9Q3Rp9LZ83uxGW60Q7fPLc0W
	bnEC58ejM4fjTK2YgFvc/nfYhuZMk9vuUfn7A5HfAuHz9LnM3jJFdTlkeOJmo6sRVRoh
	GVpw==
X-Gm-Message-State: ABuFfoj/EDjzFjiFdTB5ely8nbAvHYyhGQumMP/ROrKYMso537qIhI65
	LphXJu7aKQkm63oQsW7ZBUYa74iGdZn7Ix3DM2Jv4g==
X-Received: by 2002:aca:5c56:: with SMTP id
	q83-v6mr429053oib.255.1537878429948; 
	Tue, 25 Sep 2018 05:27:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 05:26:49
	-0700 (PDT)
In-Reply-To: <20180921161939.822-8-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-8-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 13:26:49 +0100
Message-ID: <CAFEAcA-k86WNgeXnAx=MYfv6VA6Y-pPXcRPqy+h_PBQAHD4Dwg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/3/3oNxwFV9

On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The setting of the DRAM address of the DMA transaction depends on the
> DRAM base address and the maximum DRAM size of the SoC. Let's add a
> couple of properties to give this information to the SMC controller
> model.
>
> Also, move the SDRAM Memory controller realization before the other
> controllers which need it.

There's that "Also" again :-)

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  4 ++++
>  hw/arm/aspeed_soc.c         | 28 +++++++++++++++++++---------
>  hw/ssi/aspeed_smc.c         |  2 ++
>  3 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 1f557313fa93..d7090bb5e9b7 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -97,6 +97,10 @@ typedef struct AspeedSMCState {
>      uint8_t r_timings;
>      uint8_t conf_enable_w0;
>
> +    /* for DMA support */
> +    uint64_t sdram_base;
> +    uint64_t max_ram_size;
> +
>      AspeedSMCFlash *flashes;
>  } AspeedSMCState;
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2cbacb4430bb..bbc05d172fe1 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -209,6 +209,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
>
> +    /* SDMC - SDRAM Memory Controller */
> +    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
> +
>      /* VIC */
>      object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
>      if (err) {
> @@ -252,7 +260,17 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>
>      /* FMC, The number of CS is set at the board level */
> -    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
> +    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "sdra=
m-base",
> +                            &err);
> +    object_property_set_int(OBJECT(&s->fmc), s->sdmc.max_ram_size,
> +                            "max-ram-size", &local_err);
> +    error_propagate(&err, local_err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
> +    error_propagate(&err, local_err);

I don't understand why we have several different variations on
"do this thing, and if it fails then propagate the error to caller"
here. I was expecting all these things to be in the form

       some_thing(..., &err);
       if (err) {
           error_propagate(errp, err);
           return;
       }

Is there a reason you need to involve the 'local_err' variable
in some cases ?

>      if (err) {
>          error_propagate(errp, err);
>          return;
> @@ -278,14 +296,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>                          s->spi[i].ctrl->flash_window_base);
>      }
>
> -    /* SDMC - SDRAM Memory Controller */
> -    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
> -
>      /* Watch dog */
>      for (i =3D 0; i < sc->info->wdts_num; i++) {
>          object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6045ca11b969..500de6d16d09 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -800,6 +800,8 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
>
>  static Property aspeed_smc_properties[] =3D {
>      DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
> +    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
> +    DEFINE_PROP_UINT64("max-ram-size", AspeedSMCState, max_ram_size, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };

thanks
-- PMM
