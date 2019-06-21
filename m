Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp381804wrg;
        Fri, 21 Jun 2019 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0vpe8QgiIEFXlKvNAcIkMydb2QhfedD058OBC9CiS36c8QPbbfkDe+vuYOw4N6TV9zqfg
X-Received: by 2002:aa7:c14f:: with SMTP id r15mr79442821edp.116.1561106081470;
        Fri, 21 Jun 2019 01:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561106081; cv=none;
        d=google.com; s=arc-20160816;
        b=WKPoID2P1txgpQg+jgdwtpXwgU5ulDLXOnvUtbsxh+q/ArtBqSEzwutjuAGUf1W2/i
         UiBXw+C7K3UECbhoAmpm99efykr0YPM5j9QLpffx3/YsrOK2V6ronTRrz4TjGVs8sX3u
         Jb8VD4mzY1NedLbDP7WwNj19BxfNhI7hSD8d+Oz6pDXfvTMisDGqEP7vDT/E0CG8Od8y
         BD81hKWRKuPPzzakjCTKUSBiqUaSwZPVTPTTl7no3lpS9D3R1vrGf7bPTqdmiwlZXXS4
         NIoQrWH6vcADm5zQMPDwlQ12RmtnG2gZuPqiaw7V77V4igwZ5QgimY4VKAChCWOPrICf
         X1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=YgqQjX3VvKdAdPWdttvNBy9CSHs15VILuuxCgn0t+VU=;
        b=HIw+AGoO3DJyJwXDWP6SFk1Kw7fneGaZqsLHy2nNAhrSpxOnUw9B/jl56gbeR3rZMW
         y4KIKiaQgFr9P4Mt9Ob8T0ySFEFFGUkoN9+qR4MzjasW0+HuKTnma4urXc4MVyUPj9ry
         LdJ5OAtaM9l8gPepM5KHCzwRbA44rmjIvz3hOO+N3BoGlUWpuMM74ouPjS11Fbk0URLw
         zFins5o+3UtDJqsE/wjGxMvzd+wYcouPSSOMcDYi+y2SjvebprN6YFRvdpFgmhbZsf39
         jnnUAfEt3RwH9ylISajNgYwonF+nFgE3yCE316OxIXx6TbY6Z3PXCY9Qk5to1FAHFVz4
         tuJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si1893819edd.21.2019.06.21.01.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 01:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1heF0K-0004NO-D3
	for alex.bennee@linaro.org; Fri, 21 Jun 2019 04:34:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1heEzJ-0004B8-CB
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 04:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1heErM-0003UM-UV
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 04:25:26 -0400
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:57030)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1heErM-0003P4-PM
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 04:25:24 -0400
Received: from player750.ha.ovh.net (unknown [10.109.159.7])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id D1A2E10E18B
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2019 10:25:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 573FA7309928;
 Fri, 21 Jun 2019 08:25:06 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20190621065242.32535-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6aec047c-81bd-e179-6fad-4bee896ea7a2@kaod.org>
Date: Fri, 21 Jun 2019 10:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621065242.32535-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10693515840636816192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.93
Subject: Re: [Qemu-arm] [PATCH v2] aspeed: Link SCU to the watchdog
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xWFpoIlPamTC

On 21/06/2019 08:52, Joel Stanley wrote:
> The ast2500 uses the watchdog to reset the SDRAM controller. This
> operation is usually performed by u-boot's memory training procedure,
> and it is enabled by setting a bit in the SCU and then causing the
> watchdog to expire. Therefore, we need the watchdog to be able to
> access the SCU's register space.
>=20
> This causes the watchdog to not perform a system reset when the bit is
> set. In the future it could perform a reset of the SDMC model.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I was keeping this patch in my tree (hence the Sob) hoping that
someone could find the time to study the reset question. But this=20
patch is useful as it is and I think we should merge it.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> v2: rebase on upstream, rework commit message
> ---
>  hw/arm/aspeed_soc.c              |  2 ++
>  hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++++++++++
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  3 files changed, 23 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a2ea8c748449..ddd5dfacd7d6 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -155,6 +155,8 @@ static void aspeed_soc_init(Object *obj)
>                                sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
>          qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
>                                      sc->info->silicon_rev);
> +        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
> +                                       OBJECT(&s->scu), &error_abort);
>      }
> =20
>      sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 4a8409f0daf5..57fe24ae6b1f 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -44,6 +44,9 @@
> =20
>  #define WDT_RESTART_MAGIC               0x4755
> =20
> +#define SCU_RESET_CONTROL1              (0x04 / 4)
> +#define    SCU_RESET_SDRAM              BIT(0)
> +
>  static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
>  {
>      return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
> @@ -222,6 +225,13 @@ static void aspeed_wdt_timer_expired(void *dev)
>  {
>      AspeedWDTState *s =3D ASPEED_WDT(dev);
> =20
> +    /* Do not reset on SDRAM controller reset */
> +    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
> +        timer_del(s->timer);
> +        s->regs[WDT_CTRL] =3D 0;
> +        return;
> +    }
> +
>      qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
>      watchdog_perform_action();
>      timer_del(s->timer);
> @@ -233,6 +243,16 @@ static void aspeed_wdt_realize(DeviceState *dev, E=
rror **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      AspeedWDTState *s =3D ASPEED_WDT(dev);
> +    Error *err =3D NULL;
> +    Object *obj;
> +
> +    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
> +    if (!obj) {
> +        error_propagate(errp, err);
> +        error_prepend(errp, "required link 'scu' not found: ");
> +        return;
> +    }
> +    s->scu =3D ASPEED_SCU(obj);
> =20
>      if (!is_supported_silicon_rev(s->silicon_rev)) {
>          error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt=
_aspeed.h
> index 88d8be4f78d6..daef0c0e230b 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -27,6 +27,7 @@ typedef struct AspeedWDTState {
>      MemoryRegion iomem;
>      uint32_t regs[ASPEED_WDT_REGS_MAX];
> =20
> +    AspeedSCUState *scu;
>      uint32_t pclk_freq;
>      uint32_t silicon_rev;
>      uint32_t ext_pulse_width_mask;
>=20

