Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1306584njk;
        Thu, 18 Jul 2024 01:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsLpb04+bVONecesU9NUDiHg4Wayi2sKvfoZJZ74PF6iSmNH0KMsKKO1SR9ZAiiePBgquAynY/sj8QxsjYA0bJSzmzGzYC
X-Google-Smtp-Source: AGHT+IFrg/m4kxmE4lLuKcgvTupHFDOL0ckk+/bSg6I9I/AdvhpKaAa9XBz25bsqBpDvKLZXfTw2
X-Received: by 2002:ad4:5b86:0:b0:6b5:101d:201 with SMTP id 6a1803df08f44-6b79c8087a1mr23978276d6.39.1721292567225;
        Thu, 18 Jul 2024 01:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721292567; cv=none;
        d=google.com; s=arc-20160816;
        b=QFWa8bIR2CEeMEF1ZSFPzJvgfLejf1O481cWhcb8S2VCvsKSU+nV4efuhkWC9gIYC1
         NPec9izz6f07sYRhpBepbmHof0+AvdwyO6XcVKTQ7QguNtNTJNvZKJj1XDJKEPNz47gn
         rbC9IuulKQ0lO4e6g3tif+hwwWmJeyy8NRWoKMTCjAnfPewPxlHwlmiarJ2Kwj+k92TO
         rE7+kskIqYt9b5PTsmUk4o/+K6ztsfQWr+S5JGNSGP0Fq+LecW+tTcyo/nZU2hjoz/21
         Lbr4xJ1xFVBjpdMvC93soCi7ZoblDSP/yOHCJ5kyWvgxrx3w0Tu3XYS9CbAhCELBkCLj
         fncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=e3Ha+f9NGgSP+CLNXiH/dAlRiTFOKxxVjsFyJGYhfAs=;
        fh=vpv4dibz543bPaX9Fq9ZvnJ9J5iREE2VOWA/tGZmS3U=;
        b=FUzv9GeEuFbVe02hSg1AKYph22dTN0+fAaJXnhclDDSK9yO1P9/SNP5wcCCtwMug8v
         sVCW2L42xEpiad6Xjbv8dkoxg5G4iu4dxRf9yniUjg24FwVwWBlDTr17tHLf9hv+2ZWP
         s5Gp/+XDy9WX95jLqyb1sHFk8S8tpO+SiyiiO9GL5ivVuPST8J3DtZv85d8ETbUZ4uFG
         8cQzj7KwnNTqRSxXliyI/JSOlYtGNcVcnnOVfrP6jIS+IcUfLk6AobfCJu9/C+I6sPjX
         k/3Q3ICScoKJ2b6skHXrtKXec8rLNZsZ4w24QX05QuZcDBYVolgo7BtDsXFUINLzw5qb
         BmCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c5f130bsi15316026d6.167.2024.07.18.01.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 01:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUMp2-0007LP-5J; Thu, 18 Jul 2024 04:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMp0-0007DL-6R; Thu, 18 Jul 2024 04:49:06 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUMoy-0007OR-2h; Thu, 18 Jul 2024 04:49:05 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPmgb1dYXz4x1V;
 Thu, 18 Jul 2024 18:48:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPmgV4t9Fz4wxk;
 Thu, 18 Jul 2024 18:48:54 +1000 (AEST)
Message-ID: <3e4591b5-2255-4cd9-80f9-d18be201ad8b@kaod.org>
Date: Thu, 18 Jul 2024 10:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] hw/i2c/aspeed: support discontinuous poll buffer
 memory region of I2C bus
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <20240718064925.1846074-8-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240718064925.1846074-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: K9dNB4G674gj

On 7/18/24 08:49, Jamin Lin wrote:
> It only support continuous pool buffer memory region for all I2C bus.
> However, the pool buffer address of all I2c bus are discontinuous
> for AST2700.
> 
> Ex: the pool buffer address of I2C bus for ast2700 as following.
> 0x1A0 - 0x1BF: Device 0 buffer
> 0x2A0 - 0x2BF: Device 1 buffer
> 0x3A0 - 0x3BF: Device 2 buffer
> 0x4A0 - 0x4BF: Device 3 buffer
> 0x5A0 - 0x5BF: Device 4 buffer
> 0x6A0 - 0x6BF: Device 5 buffer
> 0x7A0 - 0x7BF: Device 6 buffer
> 0x8A0 - 0x8BF: Device 7 buffer
> 0x9A0 - 0x9BF: Device 8 buffer
> 0xAA0 - 0xABF: Device 9 buffer
> 0xBA0 - 0xBBF: Device 10 buffer
> 0xCA0 - 0xCBF: Device 11 buffer
> 0xDA0 - 0xDBF: Device 12 buffer
> 0xEA0 - 0xEBF: Device 13 buffer
> 0xFA0 – 0xFBF: Device 14 buffer
> 0x10A0 – 0x10BF: Device 15 buffer
> 
> Introduce a new class attribute to make user set each I2C bus
> pool buffer gap size. Update formula to create all I2C bus
> pool buffer memory regions.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Same comment than on patch 4.


Thanks,

C.


> ---
>   hw/i2c/aspeed_i2c.c         | 3 ++-
>   include/hw/i2c/aspeed_i2c.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index d3d49340ea..abcb1d5330 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1098,6 +1098,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>       AspeedI2CState *s = ASPEED_I2C(dev);
>       AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
>       uint32_t reg_offset = aic->reg_size + aic->reg_gap_size;
> +    uint32_t pool_offset = aic->pool_size + aic->pool_gap_size;
>   
>       sysbus_init_irq(sbd, &s->irq);
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
> @@ -1133,7 +1134,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>       } else {
>           for (i = 0; i < aic->num_busses; i++) {
>               memory_region_add_subregion(&s->iomem,
> -                                        aic->pool_base + (aic->pool_size * i),
> +                                        aic->pool_base + (pool_offset * i),
>                                           &s->busses[i].mr_pool);
>           }
>       }
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 8e62ec64f8..b42c4dc584 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -284,6 +284,7 @@ struct AspeedI2CClass {
>   
>       uint64_t pool_size;
>       hwaddr pool_base;
> +    uint32_t pool_gap_size;
>       uint8_t *(*bus_pool_base)(AspeedI2CBus *);
>       bool check_sram;
>       bool has_dma;

