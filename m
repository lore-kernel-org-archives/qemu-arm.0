Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2664660wru;
        Thu, 9 Aug 2018 22:18:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxAN61qK2XlWAMAgqXzZZyHgFCzslWNKqEa8Q3M2Arc6Lf1j8X5Wyi/fbycY8b4+c0OhySB
X-Received: by 2002:aed:22ae:: with SMTP id p43-v6mr4959370qtc.393.1533878303436;
        Thu, 09 Aug 2018 22:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533878303; cv=none;
        d=google.com; s=arc-20160816;
        b=WKpSLMCp8x1c7vdhHmmyIsgJRlGN21glWPOxOD5+V7HRNAf34SonxbHylPcDAeKGbR
         aautoCUshStnSZ1vNoK9n7FEiO4UBz+FOGQ0mgU3BGN2aoZKJM0oE2RJrKZ5z/xelum+
         GPaE6WeNVMyM2dNOhyv/XHJNx4oDEEQmINu3qmTnGulsAHCkkI1vip5vbujUyZSiflaE
         zB2yU/DjVPUvbsJt1ENpTUm+OGxcR3p65j+I8NlVKTrN2gAI62Wq9PM7mh6FOC5vlnd8
         ajggr6x/2IfCDVhpLftuhezUMkvHwWHCZZu3ycB7o/b1i+Ms0VppJpxR4gPgThtfVPrP
         O5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+JRf9T+RW9w3dqbB/o7DtqTOlzdj4BY5NEdutVLIsTA=;
        b=oiEb54SVbwICVacZuUHB1K89tMQ9ttxNGJ4Cxbs4f8f17BMK7wenH4Q8fWlQ9uAQrw
         wAjHn97rpKEKsgRD4jzob9IovnOl5Pg4y8Z7/gYtC2JmSlF26oZfAjcGN+wQoPVnUypL
         md0vxoWkmWFO63hzTcRjhf9sdqyt5QDp/5DyxH8EfJ7auKnQdSpg9BFlULivbh6pwh7K
         IADkbJ7OFzr0U5aC2n9o8HXEsW9t/Du3/FFgx/a3hV/hbPoWISf7OmgDRcgVgA4iPd8P
         JCafZ4DoINO0PnHyPilgmpqlBp6y3n1Me2z+FEpUi7YwvMZGUcx4PwWOpPpH0W1mrB8A
         Zbow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JLPQsgnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i37-v6si4410139qvd.67.2018.08.09.22.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JLPQsgnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzoc-0002RM-LO
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzoT-0002Pz-AT
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzoS-0006Hp-4y
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:18:13 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:35909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzoM-0006BG-Ce; Fri, 10 Aug 2018 01:18:06 -0400
Received: by mail-ua1-x944.google.com with SMTP id c12-v6so663729uan.3;
	Thu, 09 Aug 2018 22:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+JRf9T+RW9w3dqbB/o7DtqTOlzdj4BY5NEdutVLIsTA=;
	b=JLPQsgnQKzn8Pjmz56QtvalwXvhgw71vKe1mTwKT4fYOht3Xm0aFIg5bF6z24d3Fbz
	C70g0labtly9cmde/8Hiijz0NnEP5d0rqzJXMzdDefEx5UPxlBrUp34ZsrBqP9J9eW8f
	v7cG4A7a6CBTPrY4owGZgIgpG0rZR8DzO9TgpOTkSd1vFT35Q4yI78N8iTWqU8trmBLI
	z54GCo3No7ECeQd7XRkxNhlkIHJo4kM0aBRo1hTc4fL20YPOhaBkwQ/LAi9WIUuvNYun
	0fbbAHO8+Erv9QktGvZxTjpxm5J6pU6Xz0ChpCnX2wGcLClSLCQ3xa+zzt6DyURm0cu4
	Cl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+JRf9T+RW9w3dqbB/o7DtqTOlzdj4BY5NEdutVLIsTA=;
	b=TpyV2IxUIjHzL/cPeYgPZ9ahOpugW+n3qevIU/cs0EXgz4fGNgEzh1VNzzQAhue5zl
	7x6p3Wqz2gUDp+MYiT6m15e5qRWH7zDunsiNo/OSN4WBYz5KHLl/c6UzFImGUV9DK3AS
	NmV1cVdhMskFYxfozwIR0aG6iAX1/aPgDvF9DEkuET1quct7uRmYEuA4JJ4oqZtDb/Xe
	OEopibNjCoxDLSDbqXhLBc8qYxJybDWLpnrw3WKk4xHcuzvQExQccg9SOiahEycmaESn
	fUi043LJ11W+Tv/twiTcslFtKFod/8wgGuL3Ize5gAPEPtWWe2fBeTAuBjuNzWd/o5KB
	YLOw==
X-Gm-Message-State: AOUpUlHSx2GQIHHGWhX0/r+B7X2OUoyXx+cDrAalV8mwzAHbDxuFdelL
	6Jm2kafOf3o7f5M2oJ6plQ8=
X-Received: by 2002:ab0:1b93:: with SMTP id
	k19-v6mr3396765uai.122.1533878285751; 
	Thu, 09 Aug 2018 22:18:05 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	v128-v6sm2411911vkv.18.2018.08.09.22.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:18:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-11-peter.maydell@linaro.org>
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
Message-ID: <b16ded66-e814-43f4-389f-65e697660740@amsat.org>
Date: Fri, 10 Aug 2018 02:18:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH 10/16] hw/dma/pl080: Allow use as
 embedded-struct device
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UpD+QpV+IRa

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> Create a new include file for the pl081's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/dma/pl080.h | 62 ++++++++++++++++++++++++++++++++++++++++++
>  hw/dma/pl080.c         | 34 ++---------------------
>  MAINTAINERS            |  1 +
>  3 files changed, 65 insertions(+), 32 deletions(-)
>  create mode 100644 include/hw/dma/pl080.h
> 
> diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
> new file mode 100644
> index 00000000000..7deb46c8578
> --- /dev/null
> +++ b/include/hw/dma/pl080.h
> @@ -0,0 +1,62 @@
> +/*
> + * ARM PrimeCell PL080/PL081 DMA controller
> + *
> + * Copyright (c) 2006 CodeSourcery.
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Paul Brook, Peter Maydell
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or
> + * (at your option) any later version.
> + */
> +
> +/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> + * The PL080 TRM is:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.pdf
> + * and the PL081 TRM is:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0218e/DDI0218.pdf
> + *
> + * QEMU interface:
> + * + sysbus IRQ: DMACINTR combined interrupt line
> + * + sysbus MMIO region 0: MemoryRegion for the device's registers
> + */
> +
> +#ifndef HW_DMA_PL080_H
> +#define HW_DMA_PL080_H
> +
> +#include "hw/sysbus.h"
> +
> +#define PL080_MAX_CHANNELS 8
> +
> +typedef struct {
> +    uint32_t src;
> +    uint32_t dest;
> +    uint32_t lli;
> +    uint32_t ctrl;
> +    uint32_t conf;
> +} pl080_channel;
> +
> +#define TYPE_PL080 "pl080"
> +#define TYPE_PL081 "pl081"
> +#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)

The PL080() macro can stay in the source.

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +typedef struct PL080State {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    uint8_t tc_int;
> +    uint8_t tc_mask;
> +    uint8_t err_int;
> +    uint8_t err_mask;
> +    uint32_t conf;
> +    uint32_t sync;
> +    uint32_t req_single;
> +    uint32_t req_burst;
> +    pl080_channel chan[PL080_MAX_CHANNELS];
> +    int nchannels;
> +    /* Flag to avoid recursive DMA invocations.  */
> +    int running;
> +    qemu_irq irq;
> +} PL080State;
> +
> +#endif
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 7724c93b8f2..0f79c2d8a6c 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -11,8 +11,8 @@
>  #include "hw/sysbus.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
> +#include "hw/dma/pl080.h"
>  
> -#define PL080_MAX_CHANNELS 8
>  #define PL080_CONF_E    0x1
>  #define PL080_CONF_M1   0x2
>  #define PL080_CONF_M2   0x4
> @@ -30,36 +30,6 @@
>  #define PL080_CCTRL_D   0x02000000
>  #define PL080_CCTRL_S   0x01000000
>  
> -typedef struct {
> -    uint32_t src;
> -    uint32_t dest;
> -    uint32_t lli;
> -    uint32_t ctrl;
> -    uint32_t conf;
> -} pl080_channel;
> -
> -#define TYPE_PL080 "pl080"
> -#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
> -
> -typedef struct PL080State {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -    uint8_t tc_int;
> -    uint8_t tc_mask;
> -    uint8_t err_int;
> -    uint8_t err_mask;
> -    uint32_t conf;
> -    uint32_t sync;
> -    uint32_t req_single;
> -    uint32_t req_burst;
> -    pl080_channel chan[PL080_MAX_CHANNELS];
> -    int nchannels;
> -    /* Flag to avoid recursive DMA invocations.  */
> -    int running;
> -    qemu_irq irq;
> -} PL080State;
> -
>  static const VMStateDescription vmstate_pl080_channel = {
>      .name = "pl080_channel",
>      .version_id = 1,
> @@ -408,7 +378,7 @@ static const TypeInfo pl080_info = {
>  };
>  
>  static const TypeInfo pl081_info = {
> -    .name          = "pl081",
> +    .name          = TYPE_PL081,
>      .parent        = TYPE_PL080,
>      .instance_init = pl081_init,
>  };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d1a3645dd4..92ccca716c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -444,6 +444,7 @@ F: hw/char/pl011.c
>  F: include/hw/char/pl011.h
>  F: hw/display/pl110*
>  F: hw/dma/pl080.c
> +F: include/hw/dma/pl080.h
>  F: hw/dma/pl330.c
>  F: hw/gpio/pl061.c
>  F: hw/input/pl050.c
> 
