Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp383074ejn;
        Wed, 26 Oct 2022 02:30:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5L4Twdx/mtCYM3vHchYTcOZv7YOfK/mB8swEc5hkrmT0Z6QCcQ0Uw6qer4kvCSErqh+7zt
X-Received: by 2002:a05:620a:45a0:b0:6ee:e153:8d49 with SMTP id bp32-20020a05620a45a000b006eee1538d49mr30412515qkb.170.1666776620279;
        Wed, 26 Oct 2022 02:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666776620; cv=none;
        d=google.com; s=arc-20160816;
        b=tCPRgT9W7wTSORKhrLfNnYL8xBzb2LOczmJBgd6FH+UMR6jQu9FO8WZ9v8PYdjlZ3z
         h7boie5vi0XaPKYmKLqs1ggRSr0QQ64dkCaC5gzBuQfwp/MmFdisKD674AXXyTHjK75r
         6KJrYap5L4iLmi/bu/dUuX2gjfnRVl/nw7ScIge6VA1nyzWZBJOXuIv2RzEI8M6APD6y
         MQXLxCc6SZy0QLbuA0MatJqS9tOW3KGw9eS9gipVJWUvC0ppek9mI0hOG97LPf5aBCCo
         IAN+6AXsKZbSW7Tzrb9tdtxGlG4ejesTjK7uoXrCsPV+YlkBAHzSz6fDw0MVjTbidKGb
         HMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=znWmNC7ul93utvQ4iKvLR5S3PUyWayLBWviS/gxEWVo=;
        b=t/cnxnoCV6+gLYTn4d/kZvS3lc3bc+uo366ygVc+KdOX+W+iaZEC+qvwz06xFSL9n3
         CsYq1NFMzOpTT359EwGilhu1hqJP4imZed7MUaWtj1tGCkKkHUpiApXKkVO/e2j6eXTC
         ZbJeoZIa/RVUAjz2w1F5N+rZ9uA0hppI7JXcUL1ApYPuZEY1+1QPU130+KC6psTHKOyz
         HjKqc0Pwme96fRxp2kxH/wXq999AGdSwDND3DRZwDtZ0pBa+GkJgLNLcbLqn3iupKozI
         NX8uwBZSpzyTOGmAAnSGRQUF0UznlLbIOx45HjXJaQCIL8BQOvWCo9B6r/++bFzbIEUr
         rY/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvZy32xO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020ac85187000000b0039d06d99985si3119396qtn.461.2022.10.26.02.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 02:30:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvZy32xO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onciW-0006LW-Iv; Wed, 26 Oct 2022 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onciV-0006Kx-8O
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 05:28:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onciT-0005vZ-Mv
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 05:28:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id o4so17090113wrq.6
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znWmNC7ul93utvQ4iKvLR5S3PUyWayLBWviS/gxEWVo=;
 b=bvZy32xOaVye/xlHS00Otv7DDTDb2LLlSBzvepQHOTIYlSdstDdPeqTfEyQJZYpIWS
 Aq+NS63jR8XMhkh3BLEt+R8Z2CBMDESBotvIe3EGAYJBwy1ec3RtB+V2sk8n5vb8NTjU
 og0j7cx7OKSNCFl3zC1+jSXm05Jv5ewTAie5r5Qds6WF1zUtyum7FQigjpRx3EY220bE
 tswWdH/ZYiSI2MQJcNQ6t1YQArpFsjmVliRnYhHrN6saDhqLzw81Zp17EHanBnbvpdGn
 07RUF3tGpf+2pWtYagVXoAYiQPrB2QsqeNzvBBWN4y9QSNo4lIKrWV8Kd18yAihC0vES
 +zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=znWmNC7ul93utvQ4iKvLR5S3PUyWayLBWviS/gxEWVo=;
 b=EwQ88T5fLGour3liGu152mFwsmp/wwxtpGsMjVE59jIdMUfoS3sNO7lO0ndIw2kLaW
 tYdl0zAC6mca3nvg8PmhLvoSafBPdNUN1LzxMthrdazmCTNECyi+LYrNn2uGpu32MxfZ
 hXyFwMHZIT0XQcQOlvgzAwr/pjl83m/RpEWpgJNOqAp80fGWn252+uNDcmUIMCxEc9dt
 2Eh/e6+P1kLVQjpfXSzYnlXrUHWVpLEPmP0oLccIx5T0NDAhvAdygayJC57GAwkPj4yU
 jRl2/SVHF0EhK+Kk8xSFxG4H7TCRIX3t27rVjl2jsWQgm7qyfh00p/NPEm9BuLMjfHpt
 vQ2A==
X-Gm-Message-State: ACrzQf2p4pDIHS1++c55y06tsIJLbUaNYVMCMKj1hHGSw2QHTqniAl1I
 VOkRndLekuZR29U8VQSywscFJQ==
X-Received: by 2002:a5d:64e1:0:b0:22e:762f:7d3f with SMTP id
 g1-20020a5d64e1000000b0022e762f7d3fmr28146313wri.526.1666776528681; 
 Wed, 26 Oct 2022 02:28:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfbb51000000b0023677693532sm5159702wrg.14.2022.10.26.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 02:28:48 -0700 (PDT)
Message-ID: <4ef52f4b-3582-b2ca-a3c1-2e3f83418cc0@linaro.org>
Date: Wed, 26 Oct 2022 11:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] aspeed: Add Supermicro X11 SPI machine type
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221025165109.1226001-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025165109.1226001-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6mWj+aui6RE6

On 25/10/22 18:51, Guenter Roeck wrote:
> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
> the Supermicro documentation for X11 BMCs, and it does not match the
> devicetree file in the Linux kernel.
> 
> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
> while others use AST2500.
> 
> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
> to match the devicetree description in the Linux kernel. Hardware
> configuration details for this machine type are guesswork and taken
> from defaults as well as from the Linux kernel devicetree file.
> 
> The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
> from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
> Linux booted successfully from initrd and from both SPI interfaces.
> Ethernet interfaces were confirmed to be operational.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

