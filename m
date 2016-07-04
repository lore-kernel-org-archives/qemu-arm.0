Received: by 10.25.21.96 with SMTP id l93csp1635084lfi;
        Mon, 4 Jul 2016 10:57:56 -0700 (PDT)
X-Received: by 10.55.187.4 with SMTP id l4mr17928341qkf.152.1467655076533;
        Mon, 04 Jul 2016 10:57:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d12si1734299qkg.156.2016.07.04.10.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 10:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK884-0004iM-1N
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 13:57:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bK87j-0004LK-WD
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 13:57:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bK87f-000794-Ry
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 13:57:34 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bK87f-00078Q-EV; Mon, 04 Jul 2016 13:57:31 -0400
Received: by mail-lf0-x243.google.com with SMTP id w130so17739759lfd.2;
	Mon, 04 Jul 2016 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=v6pfLlpxZHHHF15AkdXZuTK03gUlwmbH9WcR9V/O7d4=;
	b=t+CrZj+GY1grE2DHtO8LlwXl66sW0tSxaI5p7jnWQ9ZVWp8RE+suGRPgY2IBWFwMHr
	hK4TAvUzBh3zaO64GZWh/iXInHPpDwq6UL0JIXrBhrvI9N01mXuk50ggOxcerlydbai1
	77kZiN2N1VL0MXSiV/bVAGBp6OtwhAYnB/zlLHRIbFIWbVDePtc7oC8j8nyRJWbLKaWq
	gyOLTR6MHx+K+C+j6cPVAgCkj8YbLeOG3p+F/qczuMbWAlYf8Hy8X5dQlSZcqhxBupx6
	t5xcm/ywzo5kPsB+oFnEQnyFdxluH8oloJqEwwTm+J3BuT4Yo9b9YinhCe1k7zq8/a9q
	jafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=v6pfLlpxZHHHF15AkdXZuTK03gUlwmbH9WcR9V/O7d4=;
	b=AX4mHVJlDf26WC7QT5m3VSvzF/JoYT1cb22P3oXKAkqczx+CRzTrZBUCLznmmWCdFT
	E8mG7O/2xHQShL664BFvDTEpvg7kPe0Yc6mFwjdWdlfn/2Wiju7WRipR+h6hQHIS87Nd
	p/RuSgEgB13Y/Bu0iLmjmCZSAU855KfJ4KfFvxC8ys82jMmyGJZEKSFGkKd1OYh1r+yk
	Jgvpa+qk9tRiRlo7Y4al7rLuW0faoAMoE2vs75pAvkc0jLkxZAwd9oYodPAm4ZQfrex1
	5WakauPLcWim8M5ZQim9GiE6REGPRHY9cYSrWzeTUzJAVfANjZ4AF40CKTXz3AsBnsoH
	XVJA==
X-Gm-Message-State: ALyK8tJ/bn8SSEevK1H9W2ZbtsbESaCJIJdGFquGqBCpO8+FykRLL2uv7iG2AXWkm1b0Dw==
X-Received: by 10.25.196.216 with SMTP id u207mr2818187lff.164.1467655050453; 
	Mon, 04 Jul 2016 10:57:30 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4]) by smtp.gmail.com with ESMTPSA id
	m125sm1764420lfg.49.2016.07.04.10.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jul 2016 10:57:29 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <577AA388.3060100@gmail.com>
Date: Mon, 4 Jul 2016 19:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467634738-28642-5-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
X-TUID: /AgX15UC2VWp



W dniu 04.07.2016 o 14:18, Cédric Le Goater pisze:
> Some SPI controllers, such as the Aspeed AST2400, have a mode in which
> accesses to the flash content are no different than doing MMIOs. The
> controller generates all the necessary commands to load (or store)
> data in memory.
>
> To emulate such a behavior, we need to have access to the underlying
> storage of the flash object. The purpose of the routine is to set the
> storage of a preinitialized SPI flash object, which can then be used
> by the object itself but also by a SPI controller to handled the
> MMIOs.
Hi,

I am not sure if this approach is correct. I can not find any datasheet
to this SPI controller, but as you mentioned in first paragraph, controller
generates all commands (probably ones are somehow configurable).
In this series you hack this behaviour and you do direct access to file.
IMHO you should emulate sending such commands in SPI controller
model.

Thanks,
Marcin

> This is sufficient to support read only accesses. For writes, we would
> certainly need to externalize flash_write8() routine.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/block/m25p80.c        | 14 +++++++++++++-
>   include/hw/block/flash.h |  2 ++
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index aa964280beab..fec0fd4c2228 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -29,6 +29,7 @@
>   #include "qemu/bitops.h"
>   #include "qemu/log.h"
>   #include "qapi/error.h"
> +#include "hw/block/flash.h"
>   
>   #ifndef M25P80_ERR_DEBUG
>   #define M25P80_ERR_DEBUG 0
> @@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error **errp)
>   
>       if (s->blk) {
>           DB_PRINT_L(0, "Binding to IF_MTD drive\n");
> -        s->storage = blk_blockalign(s->blk, s->size);
> +
> +        /* using an external storage. see m25p80_create_rom() */
> +        if (!s->storage) {
> +            s->storage = blk_blockalign(s->blk, s->size);
> +        }
>   
>           if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
>               error_setg(errp, "failed to read the initial flash content");
> @@ -1259,3 +1264,10 @@ static void m25p80_register_types(void)
>   }
>   
>   type_init(m25p80_register_types)
> +
> +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom)
> +{
> +    Flash *s = M25P80(dev);
> +
> +    s->storage = memory_region_get_ram_ptr(rom);
> +}
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 50ccbbcf1352..9d780f4ae0c9 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>   void ecc_reset(ECCState *s);
>   extern VMStateDescription vmstate_ecc_state;
>   
> +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom);
> +
>   #endif

