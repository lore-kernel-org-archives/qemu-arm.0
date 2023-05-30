Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2436902ejb;
        Tue, 30 May 2023 13:57:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ577RiVZh6KtmCgz8KdaqONI+kbyHr5kyCsLk7Mq+IVAnmmeMMopA5ToMlIZlFj5HpTGxBL
X-Received: by 2002:a05:620a:8a12:b0:75b:23a1:423 with SMTP id qt18-20020a05620a8a1200b0075b23a10423mr3282500qkn.57.1685480223398;
        Tue, 30 May 2023 13:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685480223; cv=none;
        d=google.com; s=arc-20160816;
        b=i2E21ZuUgpvfIH+HYMET9kJTa1+m4BhMxfHz/9NX1aukJGgV2WN5+i+V1j29IRduCs
         W6VJ1X/VkLEtnJfFe+CE9M9hTpCqW+KqyCK1w6iWiFP842pvOdZC8pbFePqHtfBnniAm
         cfyD11PU/dPor8JkzYCdsZhgIz34U6ImqCwspsIX54ga+ivhiqxoqiqMYoUqvcIs9UcH
         g0BRQevxu2QKf8Hd6Jo0Hg0olHO7yOapF+N6ZMkGaatqZzcs8cKVQP61vOS4UmiaK9DW
         sNCGtaljLEG6v5e5gtg3IE6Mpfo/obZfLuo9rYs3tX327CwMRirk8WuZ9hN+4CbENpd4
         xwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VQSh4nyJNtfG4fQTBMsLnvOj6Tx0lKX2IP+60OpXJwU=;
        b=T0ywzz4SijVv/K8o7/SI16p25+EBYD4w2d6LbAavfQDqfvdqsF8vWiWCpof/CIqDXd
         VtG23x2XGpOipmldadE6H3IaeeFil8pfNI3m2iORoUwu1LOMZvRi4+v1Gjg1kN0Jvpcc
         1q6kNCCskzpbSVjCoYi46+b6UqNIL6CIXgHL4vuawvzCv5p8jSY9H/B7zOvy2zMJGgOo
         LArHXnlYS9XLUGIac2RaDWRT8evoySMxCazzzLo47Rvkhxt3ZgN0lC4IUIDqqcjQkkRE
         ymWSVet+cRjQMUWp2el886aGZlM5kSscAFNs3at0NLZ0qPLspnKJLqQI0GjhflDOX1Bi
         VOng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JA9xB+Qs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a128200b0075b08d7b0c7si6927491qki.187.2023.05.30.13.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 13:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JA9xB+Qs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q46OT-0005S2-UZ; Tue, 30 May 2023 16:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46OR-0005R7-FV
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:56:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46OP-0000Mc-QV
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:56:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30aea656e36so2108386f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685480192; x=1688072192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQSh4nyJNtfG4fQTBMsLnvOj6Tx0lKX2IP+60OpXJwU=;
 b=JA9xB+QskiqbGWg7JjbaPNRBIA3Lh+FAbeVlULE1kfVXEZq96u05PQe53fwJ4txWgl
 LpZeTqnZqJYdSZesPGIm75Gxd+xHvlNZ7f/Y7ePJSY95GlAE2ljBnZk+Bm6IZ9T22/gA
 mo1+2xb5Fdef0k3ULQ+YodGgcZyWXadFqKhSAHaMmnBchVoCOVvE+zuwboyQaFx6+3RI
 mxPm1kSaj0Oi55SOOcnOie5uZF7bnMm59ladg9bYuQp0Uqnq5zLrBPUikC9tEB2SBoZe
 FcbXBbDR/FQN0qm/fRRFeKnMqcV9TeqxLeMU2+ELfqh+xFle51xhUylPIaicUMEvoU9w
 6KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685480192; x=1688072192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQSh4nyJNtfG4fQTBMsLnvOj6Tx0lKX2IP+60OpXJwU=;
 b=O2rBRme2RvjyV/XAaYpplWenbhV3PRep991tm1XyWnU4+TDDs/pBnIa/SxBO0exnEI
 YwWmPhXd5AYrbSc/0cDkIUp6c93TBJdMp50ywPBIYGe1wCupYK9Yoka+aBIHJ4IU/PjY
 Q+aqXzZ5fG9yLEbS8tcKq63FePJqvokVTbRuOlDAv6/pmAZZ+W1y2hwtMZtsygS3x5O1
 yRX//c82m2qk6FxnSNJo2t3D3JFDU4uxu9K59F7zQLoXeoHEar6OH2X1RXr0dK0egnb6
 x0jBghzNzVaBRhK2A/NTkZlyBRo7XJrPYRc6/F6heeK2QxDKFLWUch4sJBOqEGPbixbV
 xEMg==
X-Gm-Message-State: AC+VfDyeuv4JW/OwOWJ4qY5nG+EmTne0WoenBvlRqOtvehLMZH4Dryvn
 +P8LQmbvgq0FpI8s1scU4OU52g==
X-Received: by 2002:a5d:58da:0:b0:309:3698:8006 with SMTP id
 o26-20020a5d58da000000b0030936988006mr2450000wrf.34.1685480192211; 
 Tue, 30 May 2023 13:56:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b003062b2c5255sm4459893wrt.40.2023.05.30.13.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 13:56:31 -0700 (PDT)
Message-ID: <ad016c90-238c-2654-d550-9823bcb2a395@linaro.org>
Date: Tue, 30 May 2023 22:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 06/12] aspeed/smc: Wire CS lines at reset
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-7-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: yj68j/VhMXWK

On 8/5/23 09:58, Cédric Le Goater wrote:
> Currently, a set of default flash devices is created at machine init
> and drives defined on the QEMU command line are associated to the FMC
> and SPI controllers in sequence :
> 
>     -drive file<file>,format=raw,if=mtd
>     -drive file<file1>,format=raw,if=mtd
> 
> The CS lines are wired in the same creation loop. This makes a strong
> assumption on the ordering and is not very flexible since only a
> limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
> which is less than what the SoC really supports.
> 
> A better alternative would be to define the flash devices on the
> command line using a blockdev attached to a CS line of a SSI bus :
> 
>      -blockdev node-name=fmc0,driver=file,filename=./flash.img
>      -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0
> 
> However, user created flash devices are not correctly wired to their
> SPI controller and consequently can not be used by the machine. Fix
> that and wire the CS lines of all available devices when the SSI bus
> is reset.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c     | 5 +----
>   hw/ssi/aspeed_smc.c | 8 ++++++++
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index b654513f35..9a15899cbc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -299,17 +299,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>   
>       for (i = 0; i < count; ++i) {
>           DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
> -        qemu_irq cs_line;
>           DeviceState *dev;
>   
>           dev = qdev_new(flashtype);
>           if (dinfo) {
>               qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>           }
> +        qdev_prop_set_uint32(dev, "addr", i);
>           qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> -
> -        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> -        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>       }
>   }
>   
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 7281169322..2a4001b774 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
>           memset(s->regs, 0, sizeof s->regs);
>       }
>   
> +    for (i = 0; i < asc->cs_num_max; i++) {
> +        DeviceState *dev = ssi_get_cs(s->spi, i);
> +        if (dev) {
> +            qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> +            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
> +        }
> +    }

Why did you chose the DeviceReset handler?
Shouldn't this be done in aspeed_smc_realize(), the DeviceRealize handler?

>       /* Unselect all peripherals */
>       for (i = 0; i < asc->cs_num_max; ++i) {
>           s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;

