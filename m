Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2791053njc;
        Tue, 25 Mar 2025 10:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx7SUHILhRUwh6cQVthnVXvAeuHId8C0ZJoItbOtIam3QGi/3JigIxHf6okYMG+Q97REPsIvTU9o4gIA==@linaro.org
X-Google-Smtp-Source: AGHT+IGxyqOCjeOTS86rBFm0Ooamcn0mHW8xbG6h0sR24+Kf2jLvDNITEIkbdcVK2bX8Wr9LfqSU
X-Received: by 2002:a05:620a:24c5:b0:7c5:4bb7:8e30 with SMTP id af79cd13be357-7c5ba157afbmr2227520085a.20.1742923905788;
        Tue, 25 Mar 2025 10:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742923905; cv=none;
        d=google.com; s=arc-20240605;
        b=cfJNk1CoLUCYEAOGfwl7kC5HoJwS/ssC+SnbzH6eFe5wSgaNWw4l2tl4MI8vZ4I2KZ
         ekFEfxe7QHCitYJKQw+F/CaSdFNFpmqItm0ejtVcB+c1jIMuJPbPZ3KH2j2zgEw2ly6K
         P+Trxl2Kr7cMC9D5rQxJtJ6devTthhG6j5ZQK3ujTAhefr0L4sjJyItkOaMC1RMVlGCe
         pbMLygDlOLNf0zfucm4nytmicWf1VtDLUQ9WBuX4KukkrJK/tJA9vr7eHTmh9aZ1gZxd
         schaM+Uuz8k+mMpHfETlthc1YsENyLizEGOA4FGk+0n02ufLCjaCvRl3vsHZU6/p6LaL
         SfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=bLD7uGAuxhknuMznbPUOjYYmujALZbEPbDo7/Q7yzKo=;
        fh=zRGHzg0QSvglehTRa45zTc999PxcMC/xgiADOP0n0i8=;
        b=KyYMLL8jfx25Y1O6OO49P3FAqeCsl/WYLt43rBH3CM7kk1UCKRivm3nxeMYwZW3TPG
         o/MIM/smsoghdIPddp1i1seY+ukDaPiwfmUqjJlGBfGEYv8WbKjBzd/kmFh8aWZW+kVU
         inZpaEzZvIuY/eYRBGkPqwxa487Yajbm1StTHEjeC6VjA+Md32sdVS2YqiY5+ybyDn8r
         86Xa0Qeij/C6zd6sNvKZ3+47/DSBl1SekHBYWkyLaZPkgM+aa+o8u/qTsuL8s7dvfTh/
         D0j/72QVrXXPQ86I0Ki1li179iVfcnXmj+LR3LO9HZalaQI7pTasFwN8kq8UVlnrOcAP
         NsAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92afe58si1047180785a.130.2025.03.25.10.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 10:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tx87i-0005iB-Oo; Tue, 25 Mar 2025 13:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TX69=WM=kaod.org=clg@ozlabs.org>)
 id 1tx87T-0005fk-O9; Tue, 25 Mar 2025 13:31:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TX69=WM=kaod.org=clg@ozlabs.org>)
 id 1tx87Q-0001Dl-04; Tue, 25 Mar 2025 13:31:17 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZMcQn3MxXz4xN6;
 Wed, 26 Mar 2025 04:31:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMcQk0BgNz4x1t;
 Wed, 26 Mar 2025 04:31:09 +1100 (AEDT)
Message-ID: <d3c84044-390b-4ba5-8cc8-1d21b70beee9@kaod.org>
Date: Tue, 25 Mar 2025 18:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] aspeed: ast27x0: Correct hex notation for device
 addresses
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
 <20250313054020.2583556-3-steven_lee@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250313054020.2583556-3-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=TX69=WM=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DUViibwxzuht

On 3/13/25 06:40, Steven Lee wrote:
> Corrected the hexadecimal notation for several device addresses in the
> aspeed_soc_ast2700_memmap array by changing the uppercase 'X' to
> lowercase 'x'.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Change-Id: I45426e18ea8e68d7ccdf9b60c4ea235c4da33cc3



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.




> ---
>   hw/arm/aspeed_ast27x0.c | 28 ++++++++++++++-------------->   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index a3fe2582f8..b4e4c5e4b6 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -43,7 +43,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_RTC]       =  0x12C0F000,
>       [ASPEED_DEV_TIMER1]    =  0x12C10000,
>       [ASPEED_DEV_SLI]       =  0x12C17000,
> -    [ASPEED_DEV_UART4]     =  0X12C1A000,
> +    [ASPEED_DEV_UART4]     =  0x12C1A000,
>       [ASPEED_DEV_IOMEM1]    =  0x14000000,
>       [ASPEED_DEV_FMC]       =  0x14000000,
>       [ASPEED_DEV_SPI0]      =  0x14010000,
> @@ -62,19 +62,19 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_I2C]       =  0x14C0F000,
>       [ASPEED_DEV_INTCIO]    =  0x14C18000,
>       [ASPEED_DEV_SLIIO]     =  0x14C1E000,
> -    [ASPEED_DEV_VUART]     =  0X14C30000,
> -    [ASPEED_DEV_UART0]     =  0X14C33000,
> -    [ASPEED_DEV_UART1]     =  0X14C33100,
> -    [ASPEED_DEV_UART2]     =  0X14C33200,
> -    [ASPEED_DEV_UART3]     =  0X14C33300,
> -    [ASPEED_DEV_UART5]     =  0X14C33400,
> -    [ASPEED_DEV_UART6]     =  0X14C33500,
> -    [ASPEED_DEV_UART7]     =  0X14C33600,
> -    [ASPEED_DEV_UART8]     =  0X14C33700,
> -    [ASPEED_DEV_UART9]     =  0X14C33800,
> -    [ASPEED_DEV_UART10]    =  0X14C33900,
> -    [ASPEED_DEV_UART11]    =  0X14C33A00,
> -    [ASPEED_DEV_UART12]    =  0X14C33B00,
> +    [ASPEED_DEV_VUART]     =  0x14C30000,
> +    [ASPEED_DEV_UART0]     =  0x14C33000,
> +    [ASPEED_DEV_UART1]     =  0x14C33100,
> +    [ASPEED_DEV_UART2]     =  0x14C33200,
> +    [ASPEED_DEV_UART3]     =  0x14C33300,
> +    [ASPEED_DEV_UART5]     =  0x14C33400,
> +    [ASPEED_DEV_UART6]     =  0x14C33500,
> +    [ASPEED_DEV_UART7]     =  0x14C33600,
> +    [ASPEED_DEV_UART8]     =  0x14C33700,
> +    [ASPEED_DEV_UART9]     =  0x14C33800,
> +    [ASPEED_DEV_UART10]    =  0x14C33900,
> +    [ASPEED_DEV_UART11]    =  0x14C33A00,
> +    [ASPEED_DEV_UART12]    =  0x14C33B00,
>       [ASPEED_DEV_WDT]       =  0x14C37000,
>       [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
>       [ASPEED_DEV_LTPI]      =  0x300000000,

