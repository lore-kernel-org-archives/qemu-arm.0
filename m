Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp630184ejb;
        Fri, 9 Feb 2024 00:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY4bMqR5pMsyvaSi494In8kWbKVwR3t5r5yIqi9YXmpJoYddlUVN2jwfEov+WLqLgimB6P
X-Received: by 2002:a05:622a:110f:b0:42b:ff2:639b with SMTP id e15-20020a05622a110f00b0042b0ff2639bmr1026077qty.9.1707467542658;
        Fri, 09 Feb 2024 00:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707467542; cv=none;
        d=google.com; s=arc-20160816;
        b=aK/h+E4YGYoq24XrUBCTNNN4gUs+9ClOK+lxKpcpBVty5hpfARBnItbb1MsCGz0tUK
         WeiNmlH1VBCZNwb5CIdObXz1KPaGFVkueJKFR9U7Lw6YsjApvspBgSgaoILyisX2/jPt
         XBYqFQtZtfYznS1B2lsElMno62uqJCOjP6zJtzOI5UkqQLYjr/wg3v8OfVZtyQgp24qM
         JD8qscMA1eE8eZUn+VliEZinBGmWYY6k1pZ+RCXFa18QByFDTC/c28G6xoHIqumjEEpG
         tJKwiq8JWA0jhEpy1yZ7fcSfjd76EU80rvqTjBynXW2CI0lOqFwSjqjFcryv7dxk2xRA
         FOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=yUiJVG2ZT4Uf+JaB/ND73HItuoLNTiEWMGOj7h4u6Sw=;
        fh=7qagXUvGZCmfBaenYmtEsXcyzuDVUj+njI6999Wt7iM=;
        b=Hhd6S7f2YAjoBvNCJj1YrHt6EgagOXfuay4QAPQqpXlZdSSCSyzz6NUJIDp0qRdacS
         eUWEjhVz2TFdcXu3yIArJs3FBB13NU5Z7oJEQ8Ty+NH3rwwNgD7kwY6N3GMpJ2m8DLTl
         0xXx1Re1H7XSSl3FBhcBQeo4N3eIxqb4EjpCB/Yamg617S9cq5QBQ4o19K7xaRC5TQyL
         aKWmM7C4JJzXun8zijulYu6ELqGUOqxEFmkNQ95stz3+aj3w4IsLyV9m/nMwDWfczbAi
         j53bjZ/LA3fwUzHDRgU9zZ520pWZeqMGsud38Rg/puhF2UnlaIwPSc4FhcNXOJBds+4d
         Nhyw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCXv2F4qywC0WZMq3xPasyjAaawzwPKyCxg+JChmWr5PV1SpLdqbb6ncx0NkIvwF5B7sVuE/OFdsMi4gY0iadQ5n3jj9bZaa
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a05622a034e00b0042c41d9e984si1418996qtw.185.2024.02.09.00.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 00:32:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYMIk-0004pG-Ci; Fri, 09 Feb 2024 03:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vk+A=JS=kaod.org=clg@ozlabs.org>)
 id 1rYMIj-0004od-8m; Fri, 09 Feb 2024 03:32:01 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vk+A=JS=kaod.org=clg@ozlabs.org>)
 id 1rYMIh-0001Wd-0m; Fri, 09 Feb 2024 03:32:01 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TWRsc62Xbz4x2N;
 Fri,  9 Feb 2024 19:31:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TWRsZ5VtQz4wcm;
 Fri,  9 Feb 2024 19:31:46 +1100 (AEDT)
Message-ID: <99e302b1-d24d-452e-87d0-ff7f47bc566f@kaod.org>
Date: Fri, 9 Feb 2024 09:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240207195224.452987-1-jamin_lin@aspeedtech.com>
 <20240207195224.452987-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240207195224.452987-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=vk+A=JS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6+gOZ3+aDxGs

On 2/7/24 20:52, Jamin Lin wrote:
> In the previous design of ASPEED SOCs QEMU model, it set the boot
> address at "0" which was the hardcode setting for ast10x0, ast2600,
> ast2500 and ast2400.
> 
> According to the design of ast2700, it has bootmcu which is used for
> executing SPL and initialize DRAM, then, CPUs(cortex-a35)
> execute u-boot, kernel and rofs. QEMU will only support CPU(cortex-a35)
> parts and the boot address is "0x4 00000000" for ast2700.
> Therefore, fixed hardcode boot address 0.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

I agree with Philippe that the justification could be simpler. This change
is just a cleanup preparing ground for future models using a different
mapping address.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c             | 4 +++-
>   hw/arm/aspeed_ast2400.c     | 4 ++--
>   hw/arm/aspeed_ast2600.c     | 2 +-
>   include/hw/arm/aspeed_soc.h | 2 --
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 06d863958b..39758557be 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -289,12 +289,14 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
>                                       uint64_t rom_size)
>   {
>       AspeedSoCState *soc = bmc->soc;
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(soc);
>   
>       memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
>                              &error_abort);
>       memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
>                                           &bmc->boot_rom, 1);
> -    write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
> +    write_boot_rom(blk, sc->memmap[ASPEED_DEV_SPI_BOOT],
> +                   rom_size, &error_abort);
>   }
>   
>   void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
> index 95da85fee0..d125886207 100644
> --- a/hw/arm/aspeed_ast2400.c
> +++ b/hw/arm/aspeed_ast2400.c
> @@ -26,7 +26,7 @@
>   #define ASPEED_SOC_IOMEM_SIZE       0x00200000
>   
>   static const hwaddr aspeed_soc_ast2400_memmap[] = {
> -    [ASPEED_DEV_SPI_BOOT]  =  ASPEED_SOC_SPI_BOOT_ADDR,
> +    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
>       [ASPEED_DEV_IOMEM]  = 0x1E600000,
>       [ASPEED_DEV_FMC]    = 0x1E620000,
>       [ASPEED_DEV_SPI1]   = 0x1E630000,
> @@ -61,7 +61,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>   };
>   
>   static const hwaddr aspeed_soc_ast2500_memmap[] = {
> -    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
> +    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
>       [ASPEED_DEV_IOMEM]  = 0x1E600000,
>       [ASPEED_DEV_FMC]    = 0x1E620000,
>       [ASPEED_DEV_SPI1]   = 0x1E630000,
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f74561ecdc..174be53770 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -22,7 +22,7 @@
>   #define ASPEED_SOC_DPMCU_SIZE       0x00040000
>   
>   static const hwaddr aspeed_soc_ast2600_memmap[] = {
> -    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
> +    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
>       [ASPEED_DEV_SRAM]      = 0x10000000,
>       [ASPEED_DEV_DPMCU]     = 0x18000000,
>       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 5ab0902da0..bf43ad8351 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -224,8 +224,6 @@ enum {
>       ASPEED_DEV_FSI2,
>   };
>   
> -#define ASPEED_SOC_SPI_BOOT_ADDR 0x0
> -
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
>   void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);

