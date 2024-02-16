Received: by 2002:a05:7022:fd0c:b0:75:a5e6:4add with SMTP id up12csp120195dlb;
        Fri, 16 Feb 2024 00:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhoR7LhhhKBysjzzFhbYPwrjPybMhPvsmt9b0JW/8RWCb/Y+5JNTn65thQSHZm09IhpvGL7oIAf+xrNa2QI9u1qynW8E4I
X-Google-Smtp-Source: AGHT+IGSv/VydEv+mXNGCBr3Ddd78eq09yM8+qquwEw4+ztmasRUumKfkmHl7Iz6aoM1IZpEYVN9
X-Received: by 2002:a05:6808:1492:b0:3c1:3ca0:e977 with SMTP id e18-20020a056808149200b003c13ca0e977mr2264746oiw.48.1708070512097;
        Fri, 16 Feb 2024 00:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708070512; cv=none;
        d=google.com; s=arc-20160816;
        b=uHz/rKWU7OxNPliAyLCihp5Pfwd4RoxoX0bKVZy451TVgAchwB/4pPnjLb0uaVCLkI
         ni4JACfmO9WMM4jrvff5TwJsjVEje6+BhLLfGoAyYJohfpUUHNnkyfMjoQw7+FKJyPV4
         LIV0q7uPc5Ba8zcq0CjwVoiCLy9HUJND0vXcQ3wwKWr597xElECmyQIdne6uvYBMdON0
         KgYFu8bqe1YFHWqVQSD9azJlQtjPCvp8CsxNTv589ro+JIbkLivOxG81Ck7Uv961aNor
         nfvoICnwZ7QcmLqAW+UqYqSxrylhHfDS3WvxNk26IeVsM5dOT1dUhFnEXJGJdcnJSXnx
         MNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=LF/jssJYXISE/fxQVAjUybsu3XamLuGKZhbH+d3uBYI=;
        fh=x3A5vJoaUUX/PyTLcXH4ArOydsdINznXPXziiHKzO7I=;
        b=zy6p1upHxfXk11f3uMOYaV3yM7Hpb0MiUd1EeOoCmLp60O8fVHM0ijprn3Z3f5uKsy
         ccOBmZ9gEUU7T147C+uWhCs+PP/Dr92JE5vl5My1s35SHq1JWZsCiZxzstUaiNQDCUy5
         naW3fUi9cOukUC2M6bTKFArG73iG+CcFIefNysrWGlAIZzym9+VELutA5TnPeZWUwNkH
         y+VzOpwFSHn2pOVX84psZmZrOHfBGbiwYhUxAJO31cxz90Da1CcogQlWQ3GHkcChXQY2
         JD1mrD1oXmPwFJu0EULsFFRo3Vshgf/EnQ2DsjxYS0uGRmFopzLOfORxzLVPbmG9VZa+
         RO7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020ac84605000000b0042c23db9e81si3228281qtn.138.2024.02.16.00.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 00:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rat9z-000326-R7; Fri, 16 Feb 2024 03:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org>)
 id 1rat9y-00031q-F3; Fri, 16 Feb 2024 03:01:26 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org>)
 id 1rat9w-0008TH-Hc; Fri, 16 Feb 2024 03:01:26 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TbksG1wwHz4wys;
 Fri, 16 Feb 2024 19:01:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbksC36T3z4wcg;
 Fri, 16 Feb 2024 19:01:19 +1100 (AEDT)
Message-ID: <b2744fe1-8f36-4dad-8e61-2bf9b5292a5c@kaod.org>
Date: Fri, 16 Feb 2024 09:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240215075914.2544262-1-jamin_lin@aspeedtech.com>
 <20240215075914.2544262-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240215075914.2544262-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=8DrN=JZ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RV6yCdjxUt3A

On 2/15/24 08:59, Jamin Lin wrote:
> In the previous design of ASPEED SOCs QEMU model, it set the boot
> address at "0" which was the hardcode setting for ast10x0, ast2600,
> ast2500 and ast2400.
> 
> According to the design of ast2700, it has a bootmcu(riscv-32) which
> is used for executing SPL and initialize DRAM and copy u-boot image
> from SPI/Flash to DRAM at address 0x400000000 at SPL boot stage.
> Then, CPUs(cortex-a35) execute u-boot, kernel and rofs.
> 
> Currently, qemu not support emulate two CPU architectures
> at the same machine. Therefore, qemu will only support
> to emulate CPU(cortex-a35) side for ast2700 and the boot
> address is "0x4 00000000".
> 
> Fixed hardcode boot address "0" for future models using
> a different mapping address.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


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
> index aa165d583b..9fec245e4e 100644
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
> index e1a023be53..c60fac900a 100644
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

