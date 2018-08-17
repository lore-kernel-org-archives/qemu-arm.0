Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp743388wrd;
        Fri, 17 Aug 2018 16:50:16 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxo96SuXmrjUlCnNfDl8EnUTrsTCjvUNE4nmN/DRfNAtkDL6yETib3RMRp76qPonfvwQLqe
X-Received: by 2002:aed:3c55:: with SMTP id u21-v6mr36382713qte.198.1534549816473;
        Fri, 17 Aug 2018 16:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534549816; cv=none;
        d=google.com; s=arc-20160816;
        b=dKVyBd4r5wAHBta7L3lhvtGRS262YebfpAz0SXSdnbBjb7TWUBn/fOGm+buEpBRE/V
         Ea75ynIJb7QWpKr+WUpBWr+LSFQmEOm4jNWg/yyN73BXzNZVztOsWk/jQDrRe3R82S0L
         5vKSrDx1iJhunTAstzYtzNA2xdP2L6m82keVyfU+iCvIxC22pBmXGJRNCpeSIfwtzLdX
         GMo3QpgcUd/FkeNWoin5PPDyB1ILrbKmDMpaEMejN6XebVkAzQGyHv/FSbkXVHk1BrZx
         rEOe1RoqgwMvQ2TwlWfLDuZHIZIPMwbCGVV4FljeWayWT3Sawf9Fjx6ZzDy9ikhro1x9
         w27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=8JFb7WHKJWMJS218AW+hKeIW7Nnv9xi5HlzcOGzy6y8=;
        b=DCuoJ3NOZnMNejq15m9KQcKgSDAd8iuBzMvLfbjatp/nutwDDHt73k9pwUTT3BOOuP
         vXOzFerdHBvLC6Y6pLicSnvrjXja7XwwYFroo/kuFHuF/ALf+4UJqlz3Eyt46IgWdJNN
         jZydasdB9CbMPak7spjSY3csMJIHT1fnlFMcY0eaKlkiX6zBR1aqmBLnEPgf2vN0LFxf
         mhbOqe7d+hi7fVeY9HjUP722lsn+isRJvcMm33S4kV0A4DM/xe19fWkmmrPp7U4znGo6
         wUFu1KfRLeLpqbGn0kzdGVJIv0My4Bugvq7CvbMJJA2lOwmDXkANTuXajgBRk0wp9UWA
         XR6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bl7n99yI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127-v6si2416629qkh.181.2018.08.17.16.50.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 16:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bl7n99yI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqoVU-0001m8-11
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 19:50:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoTK-0008RX-M7
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 19:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoTH-0005n8-Ev
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 19:48:02 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:43860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoTH-0005mv-9X; Fri, 17 Aug 2018 19:47:59 -0400
Received: by mail-vk0-x242.google.com with SMTP id s17-v6so3995482vke.10;
	Fri, 17 Aug 2018 16:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8JFb7WHKJWMJS218AW+hKeIW7Nnv9xi5HlzcOGzy6y8=;
	b=bl7n99yI2ghwIskTE+BI5P2AgM+0J8gOgi7LrJEpPD+2XKgz4T3MgvfQyKPsQcRLbQ
	zNLzcS+WH3odaHOZumhHlAuGQzRXWQ9NZNuotKzhd+lh49dQE/vLJf7rvXly3vHx2acZ
	6E30Sx2r+nL5PrD1k9qsbw6IFevsSv3Lofsgi/Ye1sQLHHhRCK7J1TZQIBx+9t2s7yLI
	nNZ5L/xJzWtfIgyYCBpclYHIRYaeykG/D5rRF/AKaK45BxxFmdT6s7IBLGJeIYthHIcq
	Iir1zqQ3T+HcLPGQPd15oEWiAbLa9GbfsI37dwmqSHugWwdwscx6E6ENWTgyPyQpexsO
	k/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8JFb7WHKJWMJS218AW+hKeIW7Nnv9xi5HlzcOGzy6y8=;
	b=OS1iv3WKRRZS3RKLftwM+OpT14Atd2sB1ttPMP1ovCE6be1Nq8jMmJ6y8ETDkSLfHS
	Ryym8KFDC+D8EJfguBqbRJryq4pJ1xhNP+8ztHlQefm6gRmcXi0DH6HfptLjHch5FCcE
	HXWKFGDrQC/iNXXzJfkJ13dD3c3hRD3JBvrp0asnqjqu9t6gbTAmLxOULREc75ze6V8F
	Yqq4VoNmknYowRbwwDiuT4L4yPFuVAFfhlDlt9EvTaRoIPcW/Phnhnit1mauqe8ZyBoP
	V/B7jt9CgEpBrS6pzcIBfozqyCgfw4ZtuBoxtSzEw+x1M72AZNKjZYr/oi+csa8WFhE6
	n8hQ==
X-Gm-Message-State: AOUpUlH1XWtFIhtOdp9Py+H066hZzkML2wZGWaId8W0zaSMSW14nTBUq
	iJmayT7lD9eRcJJ8TbgqI7Y=
X-Received: by 2002:a1f:da02:: with SMTP id
	r2-v6mr24366887vkg.138.1534549678655; 
	Fri, 17 Aug 2018 16:47:58 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	d71-v6sm1091518vka.47.2018.08.17.16.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 16:47:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <9bc9e8e6-53ff-b7a9-d26b-e46fb88ee973@amsat.org>
Date: Fri, 17 Aug 2018 20:47:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 03/16] hw/arm/iotkit: Wire up
 the watchdogs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ip2KGwrQaKHq

Hi Peter,

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The IoTKit includes three different instances of the
> CMSDK APB watchdog; create and wire them up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h |  6 +++++
>  hw/arm/iotkit.c         | 58 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 3e6d806e352..776d0497087 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -57,6 +57,7 @@
>  #include "hw/misc/tz-mpc.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "hw/timer/cmsdk-apb-dualtimer.h"
> +#include "hw/watchdog/cmsdk-apb-watchdog.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
> @@ -87,10 +88,15 @@ typedef struct IoTKit {
>      SplitIRQ ppc_irq_splitter[NUM_PPCS];
>      SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
>      qemu_or_irq mpc_irq_orgate;
> +    qemu_or_irq nmi_orgate;
>  
>      CMSDKAPBDualTimer dualtimer;
>      UnimplementedDeviceState s32ktimer;
>  
> +    CMSDKAPBWatchdog s32kwatchdog;
> +    CMSDKAPBWatchdog nswatchdog;
> +    CMSDKAPBWatchdog swatchdog;
> +
>      MemoryRegion container;
>      MemoryRegion alias1;
>      MemoryRegion alias2;
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 130d013909e..5cedfa03570 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -19,6 +19,9 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/arm.h"
>  
> +/* Clock frequency in HZ of the 32KHz "slow clock" */
> +#define S32KCLK (32 * 1000)
> +
>  /* Create an alias region of @size bytes starting at @base
>   * which mirrors the memory starting at @orig.
>   */
> @@ -140,6 +143,15 @@ static void iotkit_init(Object *obj)
>                            TYPE_CMSDK_APB_TIMER);
>      sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
>                            TYPE_CMSDK_APB_DUALTIMER);
> +    sysbus_init_child_obj(obj, "s32kwatchdog", &s->s32kwatchdog,
> +                          sizeof(s->s32kwatchdog), TYPE_CMSDK_APB_WATCHDOG);
> +    sysbus_init_child_obj(obj, "nswatchdog", &s->nswatchdog,
> +                          sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
> +    sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
> +                          sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
> +    object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
> +                            sizeof(s->nmi_orgate), TYPE_OR_IRQ,
> +                            &error_abort, NULL);
>      object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
>                              sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
>                              &error_abort, NULL);
> @@ -510,12 +522,52 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
>  
>      create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
> -    create_unimplemented_device("S32KWATCHDOG", 0x5002e000, 0x1000);
> +
> +    /* This OR gate wires together outputs from the secure watchdogs to NMI */
> +    object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(&s->nmi_orgate), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
> +                          qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
> +
> +    qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
> +    object_property_set_bool(OBJECT(&s->s32kwatchdog), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32kwatchdog), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 0));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->s32kwatchdog), 0, 0x5002e000);
>  
>      /* 0x40080000 .. 0x4008ffff : IoTKit second Base peripheral region */
>  
> -    create_unimplemented_device("NS watchdog", 0x40081000, 0x1000);
> -    create_unimplemented_device("S watchdog", 0x50081000, 0x1000);
> +    qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
> +    object_property_set_bool(OBJECT(&s->nswatchdog), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nswatchdog), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->armv7m), 1));

So a NS watchdog expiration will triggers
qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET). This is fine for
now, we can eventually implement the proper behavior of IRQ#0 later
(flag the NSWD of the RESET_SYNDROME register and continue execution
from cpu reset if NSWD enabled in RESET_MASK, without shutting QEMU down).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
> +
> +    qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
> +    object_property_set_bool(OBJECT(&s->swatchdog), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->swatchdog), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 1));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->swatchdog), 0, 0x50081000);
>  
>      for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
>          Object *splitter = OBJECT(&s->ppc_irq_splitter[i]);
> 
