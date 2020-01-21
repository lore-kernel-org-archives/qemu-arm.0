Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1215157lfp;
        Tue, 21 Jan 2020 00:52:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9yn5f8AdLfNiGgctjcC6N05RqruJAQ00L5GaT7xClNQWqwaAE9Fvm2BotUpBGXL0NQ3Qm
X-Received: by 2002:a37:3d8:: with SMTP id 207mr3355997qkd.335.1579596776615;
        Tue, 21 Jan 2020 00:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579596776; cv=none;
        d=google.com; s=arc-20160816;
        b=WXt+dqxJE8agWF20ApgSugwBNRL2iQCk00nXSK+47wHv5FxLITPYaCi6IcfJpES4JY
         sSfFXXC1U8XkJC2TbukC22uageZuy/rA/gMN6cTs1a/YskBdcpc4BBQD5cyYsCcslnR8
         iZgUtg/Z6IB7OsOS/D2uYZ+cgxmELJp18lQAyeKLymsgcZhWrpCrpiI3aW1p7QdoYM3j
         O6QJy7w4CWe6oFHjBA+nAbewJbllXLNr55CGm+X1TEjV7zDZRLC1utEy2c/jyfG7o4xO
         4vyHaKS7nzjSYxchuu6LHqwgRuoZwKoWjqe1SgDIk1iEPNduQfi9W421A5MY42bobjJ3
         1/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DbN+Vpoha1itMQp+hrPAY/DVqbvgsc26vw7XNW9KU7E=;
        b=bqKm1GJAgTa5mAgvOHL9d+fUsMgBSsnIqssHZm2fp9CzH446ze6SdFF/cP1o7RmhlI
         N54yIdcUQ+7lMr0Pd0sOzT6BCnizgJd2Zd0IHsfPz4ivHrXr/4AjZ04+l4a2dyZ1YVF8
         40vsCzd6E4aGf+p6Q7VZtCSJkRfXZ9CnSRGFXis7payFlPcYe97vuD0updhyDOL/NBGB
         2Zjv5+zYF4/eAyTf4NvNW0a8lwo8ui0Xg7gEHPidY1NFfNZ3rk4ueufOiY9Lx6coqfGR
         7MA8gL8+2k5mhLZLUga1QgUhC+qeiAZesKlOpyoWzW82bDuyyWOh4gXCEH9nd1xvnaCF
         t7dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esA150ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si21099058qka.361.2020.01.21.00.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 00:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esA150ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itpHL-0004xG-Sg
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 03:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itpH9-0004wi-Pw
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:52:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itpH6-0000co-9G
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:52:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47488
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itpH6-0000cZ-5Q
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579596759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbN+Vpoha1itMQp+hrPAY/DVqbvgsc26vw7XNW9KU7E=;
 b=esA150ro9ucmnwXWTOvtc15esCzfdEqrmgNbLxFwSrUFsalXtTMGYVmtLsL80AZqq5Xmul
 emfKEof10uIBNr8LD4UrbyMn2sbaCeYRcTuAv4Ir2MBxVJwbcG+E54MfeQcMB6kTu1k76P
 ydCm6Y+bajaiAL/73Dc5ezR9uwnCyH4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-GgBNRrxaOHGRXVh5vSNoDw-1; Tue, 21 Jan 2020 03:52:38 -0500
Received: by mail-wr1-f72.google.com with SMTP id z14so1021185wrs.4
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2020 00:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=edEY1ReFPmWoxoOPXjtICaZFRSIvbKLZn+dFKDtLj50=;
 b=BHGwsZIZ3LUeznrtdaE26lZbtcOJ3yEci7qFwUvdUNKeH2Q22EpAtf46CsrKZMLWgJ
 ZEEcSkVQ4x4of+C12j/X8Ch1A9n13bzvC3MVIqQoXSS2W3dGRedqawQ9dsehOgFEHEHV
 7nXk5+HRFxCnGyyuX2XdCbnYPwqjb5ob3MbFnvNS4UWl35t1Qhhx95vh0dzyeKLragA8
 t0lg/XlmYzb0Udsry/80OOvq0/JZcrcVa2JeXll5jdwCOCk1Hg2b54kVmY6AIXMmqbfg
 gZDCXiu1sER3qAI+MPXMe3j1wbEltcGqTZ/f7/by250OI2Y8zXF3+fULivjNFtEfVyKC
 sBuw==
X-Gm-Message-State: APjAAAXlHiqIik54yGtqvKMWWOG6p142/WHuHqvaWglqiYrc9TQhLmbT
 qulHW0MLzNoA/7I1+Nitg1SGejzoASsZVt3jVE6MrGwmIOHPaiz/xbUcdrOhJl1lKkzans1O3Wb
 5ehqI7lO+kbhT
X-Received: by 2002:a5d:458d:: with SMTP id p13mr3979164wrq.314.1579596757026; 
 Tue, 21 Jan 2020 00:52:37 -0800 (PST)
X-Received: by 2002:a5d:458d:: with SMTP id p13mr3979136wrq.314.1579596756629; 
 Tue, 21 Jan 2020 00:52:36 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id v14sm51045886wrm.28.2020.01.21.00.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 00:52:36 -0800 (PST)
Subject: Re: [PATCH 2/2] aspeed/scu: Implement chip ID register
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20200121013302.43839-1-joel@jms.id.au>
 <20200121013302.43839-3-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d20e112d-edf9-d8d8-fa6c-e93aac4dcec3@redhat.com>
Date: Tue, 21 Jan 2020 09:52:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121013302.43839-3-joel@jms.id.au>
Content-Language: en-US
X-MC-Unique: GgBNRrxaOHGRXVh5vSNoDw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: KArbVDj+pvcw

On 1/21/20 2:33 AM, Joel Stanley wrote:
> This returns a fixed but non-zero value for the chip id.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/misc/aspeed_scu.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 7108cad8c6a7..19d1780a40da 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -77,6 +77,8 @@
>   #define CPU2_BASE_SEG4       TO_REG(0x110)
>   #define CPU2_BASE_SEG5       TO_REG(0x114)
>   #define CPU2_CACHE_CTRL      TO_REG(0x118)
> +#define CHIP_ID0             TO_REG(0x150)
> +#define CHIP_ID1             TO_REG(0x154)
>   #define UART_HPLL_CLK        TO_REG(0x160)
>   #define PCIE_CTRL            TO_REG(0x180)
>   #define BMC_MMIO_CTRL        TO_REG(0x184)
> @@ -115,6 +117,8 @@
>   #define AST2600_HW_STRAP2_PROT    TO_REG(0x518)
>   #define AST2600_RNG_CTRL          TO_REG(0x524)
>   #define AST2600_RNG_DATA          TO_REG(0x540)
> +#define AST2600_CHIP_ID0          TO_REG(0x5B0)
> +#define AST2600_CHIP_ID1          TO_REG(0x5B4)
>  =20
>   #define AST2600_CLK TO_REG(0x40)
>  =20
> @@ -182,6 +186,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR=
_REGS] =3D {
>        [CPU2_BASE_SEG1]  =3D 0x80000000U,
>        [CPU2_BASE_SEG4]  =3D 0x1E600000U,
>        [CPU2_BASE_SEG5]  =3D 0xC0000000U,
> +     [CHIP_ID0]        =3D 0x1234ABCDU,
> +     [CHIP_ID1]        =3D 0x88884444U,
>        [UART_HPLL_CLK]   =3D 0x00001903U,
>        [PCIE_CTRL]       =3D 0x0000007BU,
>        [BMC_DEV_ID]      =3D 0x00002402U
> @@ -307,6 +313,8 @@ static void aspeed_ast2500_scu_write(void *opaque, hw=
addr offset,
>       case RNG_DATA:
>       case FREE_CNTR4:
>       case FREE_CNTR4_EXT:
> +    case CHIP_ID0:
> +    case CHIP_ID1:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: Write to read-only offset 0x%" HWADDR_PRIx "=
\n",
>                         __func__, offset);
> @@ -620,6 +628,8 @@ static void aspeed_ast2600_scu_write(void *opaque, hw=
addr offset,
>       case AST2600_RNG_DATA:
>       case AST2600_SILICON_REV:
>       case AST2600_SILICON_REV2:
> +    case AST2600_CHIP_ID0:
> +    case AST2600_CHIP_ID1:
>           /* Add read only registers here */
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: Write to read-only offset 0x%" HWADDR_PRIx "=
\n",
> @@ -648,6 +658,9 @@ static const uint32_t ast2600_a0_resets[ASPEED_AST260=
0_SCU_NR_REGS] =3D {
>       [AST2600_CLK_STOP_CTRL2]    =3D 0xFFF0FFF0,
>       [AST2600_SDRAM_HANDSHAKE]   =3D 0x00000040,  /* SoC completed DRAM =
init */
>       [AST2600_HPLL_PARAM]        =3D 0x1000405F,
> +    [AST2600_CHIP_ID0]          =3D 0x1234ABCD,
> +    [AST2600_CHIP_ID1]          =3D 0x88884444,

Since this doesn't match the datasheet, can you add a comment /*=20
Arbitrary non-zero value */?

With it:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +
>   };
>  =20
>   static void aspeed_ast2600_scu_reset(DeviceState *dev)
>=20

