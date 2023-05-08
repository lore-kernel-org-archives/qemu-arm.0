Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2083543ejq;
        Mon, 8 May 2023 07:28:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+1N/DcuhtmNRD2G9GTOU4uO0IazWqevyLBuCvSC/h205hYXdf/uUL8fzwx8VSRGDoq896
X-Received: by 2002:a05:6214:27c9:b0:616:5c8b:59d with SMTP id ge9-20020a05621427c900b006165c8b059dmr13499809qvb.20.1683556089024;
        Mon, 08 May 2023 07:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683556089; cv=none;
        d=google.com; s=arc-20160816;
        b=cLm6M3R2PcQMTq9u6Nhks9dZ3GXH/kvvNatLGeDkG0BPwlllRqgSKtgLoIJQpPC6ij
         xihJB9DhqchdnH44xIg1VBsgSFTYsoshFmo7y6h+qYN+uzZwgDvvbCOPcnmvKeSs8/gr
         XzGmf2LyLGt9WGx0BIVyjGinQSctkLdMuOC/k2LJX2/4b5RyOia/TZrU+zyOZuG6QqkQ
         2/nS1cM/LIANzvLruYjIgDSncAcPU94RUvApjaIg3RtjjJkUXpatvsJySU5l9dD0P6YN
         yZ/kIsoLsGIjC+ghI5yrdYm+HmjnesMOuLCJJRMNh2JWBTKWdpVk7hKuhEHlv9X2x/dU
         vcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=mX1L7f33OqPKGr7GTBf9WXKfgw9s84E1H8JMzKfT6/k=;
        b=c8obKDu+xKHIYTCSeoJctaRUqqOxaoTYkRkFyRDydAj7te8uHA6wwtutpHouGI9aKw
         bIlIlRUM2jLrhzofaknLvwG7AtjylD6S/KLG0aE1I2ZnLMttR8arcBQvOWLuvSCPUDBX
         sOsXp1X+ao6Y021+2k+Zp+5wpUsbRYD/BdNjs2HGg55Udz/0Vg3yA54Tug2nsiumvFVD
         KBNLJYuopCHGIhXZF6CUPooBU2W6GY9odU1cUMeX9VzpuwtRZUO1wuXFuvTXciiEjAEz
         Rwn1hjNY4P/CwDPNdd22ZFbPwQUXIbRLtd5wY6GjHp/ECuzTBLD2Hz4IW/C44mcLH7JS
         czZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=F0Tz3tzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz15-20020a0562140e6f00b005ef5a570e95si18271qvb.277.2023.05.08.07.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 07:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=F0Tz3tzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw1q0-00039R-PR; Mon, 08 May 2023 10:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw1pr-00034B-2J; Mon, 08 May 2023 10:27:31 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw1pp-0004PT-FC; Mon, 08 May 2023 10:27:30 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso5140355e87.0; 
 Mon, 08 May 2023 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683556044; x=1686148044;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mX1L7f33OqPKGr7GTBf9WXKfgw9s84E1H8JMzKfT6/k=;
 b=F0Tz3tzhcfrqAGNACBQfCHkvmG6E2lv8DQEovPBTu5GzToilIt68NAOz2HCiIXroEK
 I8PoB4yMKeryVHqf7Ja35HXttP8TwBl0nxbpoma4hn68lhk0nmR2zvvFesSOjKcZZ7e/
 9+CVv3pF6NkuBm7R3YLUvSh6jvPUKKXeBkLOnAd0zMoFm0lrxS33zscq3Rz7g6se/tNK
 f8vudqU2o2GFxdqgruRTMfIKItTBfTKKMH132zzYGHTn54ydCCh1oGzjv1kIa0ivYSJz
 7UhCRRth/t3w/4wYYn9IpdhIq2KagTYKniPTQ51mqlCp9mB26FqEe61pJLdIpqHxvQen
 TZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556044; x=1686148044;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mX1L7f33OqPKGr7GTBf9WXKfgw9s84E1H8JMzKfT6/k=;
 b=j30RsFMzGdms+HA2qCwZIEm0WmoNAXdG8sAWrbO6bLpBjeLGGtMay2AGsFwGI2Ephp
 yWz+nXA6H2n409sFg9uxc2zxd+HaPNXHpPKF4L6IRbwh/u5pRYPcbmfbaI+A7/ZnXZsy
 Dht4TTUwqwEYzsJRxvDAsE3qTbccs+lfMXtkeL1jx7gr1fb9JB4C0ttkxWPlQKeMyC9U
 BY5dRxPmQ8GGdcWAG5JGPytSKdjNzIzsLE98aST5dDk2L4BzopUV+L4eXJktCtpoX+A0
 Kz1SInmJ8O5lmdm74PjdX5ztdNHNCdtbwQODciGxrvxD7zeH58hSByjjs2FNT8aFutNR
 0qKw==
X-Gm-Message-State: AC+VfDyUcUHWP3r2N/haayOCOepxE7MzRsqvLJadgqJzGm/UrTtfYnty
 CIAwSWVUfZKJ75XQDOxw4UY=
X-Received: by 2002:ac2:4d13:0:b0:4eb:dd5:1eb9 with SMTP id
 r19-20020ac24d13000000b004eb0dd51eb9mr2478729lfi.65.1683556044228; 
 Mon, 08 May 2023 07:27:24 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 d26-20020ac2545a000000b004cc9042c9cfsm8118lfn.158.2023.05.08.07.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 07:27:23 -0700 (PDT)
Date: Mon, 8 May 2023 16:27:22 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 02/12] aspeed: Introduce a boot_rom region at the machine
 level
Message-ID: <20230508142721.GA6984@fralle-msi>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508075859.3326566-3-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
X-TUID: h/7jkxl/Sx2C

On [2023 May 08] Mon 09:58:49, Cédric Le Goater wrote:
> This should also avoid Coverity to report a memory leak warning when
> the QEMU process exits. See CID 1508061.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/arm/aspeed.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0b29028fe1..b654513f35 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -40,6 +40,7 @@ struct AspeedMachineState {
>      /* Public */
>  
>      AspeedSoCState soc;
> +    MemoryRegion boot_rom;
>      bool mmio_exec;
>      char *fmc_model;
>      char *spi_model;
> @@ -275,15 +276,15 @@ static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
>   * Create a ROM and copy the flash contents at the expected address
>   * (0x0). Boots faster than execute-in-place.
>   */
> -static void aspeed_install_boot_rom(AspeedSoCState *soc, BlockBackend *blk,
> +static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
>                                      uint64_t rom_size)
>  {
> -    MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
> +    AspeedSoCState *soc = &bmc->soc;
>  
> -    memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
> +    memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
>                             &error_abort);
>      memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
> -                                        boot_rom, 1);
> +                                        &bmc->boot_rom, 1);
>      write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
>  }
>  
> @@ -431,8 +432,7 @@ static void aspeed_machine_init(MachineState *machine)
>  
>          if (mtd0) {
>              uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
> -            aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0),
> -                                    rom_size);
> +            aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(mtd0), rom_size);
>          }
>      }
>  
> -- 
> 2.40.0
> 
> 
