Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1130387ejb;
        Mon, 5 Feb 2024 05:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfOlzf81OHS+ZXoH9fV3Mf6xwjAQEAl11xC86XeAd9genZAoRzjOzbMpdDdFaAhrciZwcC
X-Received: by 2002:a05:6830:1d62:b0:6e1:ff3:d369 with SMTP id l2-20020a0568301d6200b006e10ff3d369mr13495337oti.25.1707140113084;
        Mon, 05 Feb 2024 05:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707140113; cv=none;
        d=google.com; s=arc-20160816;
        b=nlvdpd/CyeaCFXvL4VkFsOuWlS919mLuppuNSq6ioJshkyfooFsNV8Iit2Sgdgue7v
         Err/ZoNqud9w3ppzy0qdK2H2z5K3sZfK64rPLeuRNRyc4BA8CP29gHoc4xEEGIjpLZML
         Gt0UXYlf/XtwoQqlZ3eY4LJ9nuOWzbjIP9SN+wT7K395MozjQhdX8sAWEuD8W5BevK2G
         69T5hf2x4kiHu92WA4s3s8D+XKk+gNKAB65paJ/5kXMF2hHZuIpzoiKHFTX0/x8kIMjR
         IIlV2BEZfU+P1hpJU9CW1vv13MgFwNQnIseVPX4dWw1A/M1h1Kz2VkLe9Hk6K6BkipiK
         jolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=b9H5VwlguMsjQWFMLAeqleJBMNsjUUOE/3TqNNHZIyI=;
        fh=KMzqgv9TNlCcvYcEFQfb8tfTG18MToJSM5w7/gFkEB0=;
        b=gemdxI7DNxrLPRCrQwf4YxpvusnFCP7GJvovzhgBUrl12toh5OuHvJzAQHcoMwJmhe
         PzFtBixo94LOOI/2Z3mjuEnpdkokk2klhvIea9vLpiWYeA98uuBZnsaUZ7jqc4/p4sYv
         YyEnyMr+mllvokEUKZnRWtPmboxULGFu6H7gVYmcAr2oW9/x9+eWBxVE5L/7633cKXQS
         3RWZwV2n+WXsmw0gd5lM0ff7hg6Uw6pUh5DksO+nqsdQTuPVptSTWxPS+66Lcr4CzisF
         fIzA8AQGObKUwUw4XhOz7vo5oFZEZi5V33lJDJNOwOrjLG8c6YOt8Mq4i8r5VDsmWr9U
         Zfqg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCWzcFgDzRx7ibmTRfSy9oRQ8XCY3uLXx18j3MxwVdjf/EW5t0FgzGOQcPbrACMNJ/zKpG6Ndnyjn6vADKRChctSl03TlPR4
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020ac85e13000000b0042aa458abcasi8503634qtx.215.2024.02.05.05.35.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 05:35:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWz7f-0002AC-EP; Mon, 05 Feb 2024 08:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XBpg=JO=kaod.org=clg@ozlabs.org>)
 id 1rWz7c-000293-PH; Mon, 05 Feb 2024 08:34:52 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XBpg=JO=kaod.org=clg@ozlabs.org>)
 id 1rWz7Z-000352-Mp; Mon, 05 Feb 2024 08:34:51 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TT6n02Kfnz4wp3;
 Tue,  6 Feb 2024 00:34:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TT6mx5m1hz4wcC;
 Tue,  6 Feb 2024 00:34:22 +1100 (AEDT)
Message-ID: <7b35d498-0669-4b54-8111-a598b60981a1@kaod.org>
Date: Mon, 5 Feb 2024 14:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240205091415.935686-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XBpg=JO=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: nWxaBFj4cYqi

On 2/5/24 10:14, Jamin Lin wrote:
> In the previous design of QEMU model for ASPEED SOCs, it set the boot
> address at 0 which was the hardcode setting for ast10x0, ast2600,
> ast2500 and ast2400.
> 
> According to the design of ast2700, it has bootmcu which is used for
> executing SPL and initialize DRAM, then, CPUs(cortex-a35)
> execute u-boot, kernel and rofs. QEMU will only support CPU(coretax-a35)
> parts and the boot address is "0x400000000" for ast2700.

On the previous SoC, the ASPEED_DEV_SPI_BOOT region is an alias, at 0x0,
to the FMC CE0 region, mapped at 0x20000000.

Is 0x400000000 (or 0x40000000 ?) the address for FMC CE0 region on the
ast2700 ? or an alias ?

What is the cortex-a35 reset address ?

It would help to also introduce a basic skeleton of the ast2700 SoC.

Anyhow, this change makes sense. Could you please respin and also
remove ASPEED_SOC_SPI_BOOT_ADDR. ?

Thanks,

C.

> Therefore, fixed hardcode boot address 0.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 218b81298e..82a92e8142 100644
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

