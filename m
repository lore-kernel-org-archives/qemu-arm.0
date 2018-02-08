Received: by 10.28.71.27 with SMTP id u27csp2430495wma;
        Thu, 8 Feb 2018 11:03:41 -0800 (PST)
X-Google-Smtp-Source: AH8x2259aXhkngaPJaV5hbk72TRxftsjx8BfNXPqFgbyU/mdikiJW6IZBUzLl3jSp8cuDaL+YEE8
X-Received: by 10.129.222.12 with SMTP id k12mr174881ywj.225.1518116621582;
        Thu, 08 Feb 2018 11:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518116621; cv=none;
        d=google.com; s=arc-20160816;
        b=zO5MiK3RdHYTs4hEgyakrQpXlaihZkB1cBkJ6caytql3/5uOa7cBKXsgqhbaJ2/j03
         HO9ttuLcPygMS+bRuzSmaFvZOalxfXxg/S1WzV8TXCeGLzuMhnS78qgtL+K4BKFiTANC
         Ek2lW9LNfa+YB2NJHNPM0vrHI+hc/a++53pcV9bJkZX3XN9EEvPUVo8I2X/uXteJNv3s
         u1d/I13zckUgb56M5q2EEbN7E9ig14cJtlcicELlKrarriXWm3+UU3zpft/O29Hawk5w
         4I8oSf1AbAEowz1vigLanAD23nVZT8HWUPn5w1RR4I4wo5d8x296Qv7n6mEx7eZz+aQc
         G56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=tbeI6e6NNoghF0HOg5T+PcpSpd0GpC36tX+S6mtqs5s=;
        b=JDzG8bC0MmuoyASLKFao6oLP+D9QBYaORcTB7K7fCOyqbh60gWcEdabLtzAAXkG74Z
         ifUjk4gh75CVu08oWNzShYVfJjThA+/QdcPMrMbjKIkrVIf7ifWa4djjIW3UkzBOhnfL
         JZ1e7bceM4xMbQwBhQdZiy3LN9vzOyGKCqq+3txl1GIq4XSbmUWThLPbl//58oB/nUuS
         gKNY5NT2hF5JRhKBPlUWhKQeMAvSVel2dxx5LVEXHUAric8Qq2OBs7YoudZxG6nzHIer
         OPP860g3IHj1lWPInrF58ToudhrcvLb4LMNjqBE/pfgw5EUY6J+FRMVkUGNA8abdV5yl
         DJMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2si105474ywv.43.2018.02.08.11.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 11:03:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejrTw-0001EH-VL
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 14:03:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ejqiQ-0007xS-CT
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 13:14:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ejqiL-0001Yp-Eb
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 13:14:34 -0500
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:36312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1ejqiL-0001NL-7N
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 13:14:29 -0500
Received: from player697.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 56E868DC81
	for <qemu-arm@nongnu.org>; Thu,  8 Feb 2018 19:14:21 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2226-150.w90-76.abo.wanadoo.fr
	[90.76.48.150]) (Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id A4D6E48009D;
	Thu,  8 Feb 2018 19:14:16 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-3-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21f7b55b-72d3-5726-ef71-032bac16e6c8@kaod.org>
Date: Thu, 8 Feb 2018 19:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180208172202.9984-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10627650697570126768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtfedrudekgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.248
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/aspeed: simplify using the
 'unimplemented device' for aspeed_soc.io
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqoqS7xpg31n

On 02/08/2018 06:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This looks like a good idea. (Have you actually tried it ?=20
just asking)

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.=20

> ---
>  include/hw/arm/aspeed_soc.h |  1 -
>  hw/arm/aspeed_soc.c         | 32 +++-----------------------------
>  2 files changed, 3 insertions(+), 30 deletions(-)
>=20
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index f26914a2b9..11ec0179db 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -31,7 +31,6 @@ typedef struct AspeedSoCState {
> =20
>      /*< public >*/
>      ARMCPU cpu;
> -    MemoryRegion iomem;
>      MemoryRegion sram;
>      AspeedVICState vic;
>      AspeedTimerCtrlState timerctrl;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a786750e14..3d21128d47 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -15,6 +15,7 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
> +#include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
>  #include "qemu/log.h"
> @@ -99,31 +100,6 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>      },
>  };
> =20
> -/*
> - * IO handlers: simply catch any reads/writes to IO addresses that are=
n't
> - * handled by a device mapping.
> - */
> -
> -static uint64_t aspeed_soc_io_read(void *p, hwaddr offset, unsigned si=
ze)
> -{
> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
> -                  __func__, offset, size);
> -    return 0;
> -}
> -
> -static void aspeed_soc_io_write(void *opaque, hwaddr offset, uint64_t =
value,
> -                unsigned size)
> -{
> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " =
[%u]\n",
> -                  __func__, offset, value, size);
> -}
> -
> -static const MemoryRegionOps aspeed_soc_io_ops =3D {
> -    .read =3D aspeed_soc_io_read,
> -    .write =3D aspeed_soc_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> -};
> -
>  static void aspeed_soc_init(Object *obj)
>  {
>      AspeedSoCState *s =3D ASPEED_SOC(obj);
> @@ -199,10 +175,8 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
>      Error *err =3D NULL, *local_err =3D NULL;
> =20
>      /* IO space */
> -    memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
> -            "aspeed_soc.io", ASPEED_SOC_IOMEM_SIZE);
> -    memory_region_add_subregion_overlap(get_system_memory(),
> -                                        ASPEED_SOC_IOMEM_BASE, &s->iom=
em, -1);
> +    create_unimplemented_device("aspeed_soc.io",
> +                                ASPEED_SOC_IOMEM_BASE, ASPEED_SOC_IOME=
M_SIZE);
> =20
>      /* CPU */
>      object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
>=20

