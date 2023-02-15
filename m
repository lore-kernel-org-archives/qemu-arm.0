Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp393105ejb;
        Wed, 15 Feb 2023 03:03:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/P3rhxSSGr4uo2ijfgrEwiNrfSmIi04ENBPEtL9x4frIYfusovM3PQUryczzDjlHCK4aVa
X-Received: by 2002:ac8:5805:0:b0:3b8:6442:2575 with SMTP id g5-20020ac85805000000b003b864422575mr2164501qtg.49.1676458984598;
        Wed, 15 Feb 2023 03:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676458984; cv=none;
        d=google.com; s=arc-20160816;
        b=nlySfbhhFYoprTE24M0Prl1ZjETAz5CB/zOlJFTadOMnfYR222YDUoqFwdm3zdynlv
         JtZ6XE52cFzwpZWuzYxVXdREFiP+4cHaTWDGm8UNC7XxHak3VCOHYArn3z8n22f7OZep
         6PK46eJhHLzpy1zPP26oShTqFrE+t1dlMRY0f+DEh8wYEdRfQ1Eh8g3xgkIboeh8YR/3
         /KBeDr76bgIuRj4MiUfEU0x7tlbak7t0hy1ZGum9mDv67Kl5jqEBjV8ozBEp0FHkdm97
         +ROkQWxskMMDM72B+GMvvfogi4DpV3JtaeGYCJc19SiUjLTz7OG+Y5q/aQaG6wTUdd+d
         0wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H0KWF+EilOIV/fTgZRY43DEmQDgaPtP5m+T5JvywjtU=;
        b=fGSGpK2eLNKxTWS6SyuR7bk8h1SodHbDr2PfKQcGn775zE9EmQmYjH0+lnbDn82CfO
         Trpj3albZ1B/bKdP3bnr//uONoKDAUdfE/DsuOWXc55SQ6bnFDtdPUPt7F0HRUMjyyGs
         g8bPizzxh8HCOYnyooPZmDNpP/E+CPUK6RJTnFYDbwmSimQa3BtY/xDXCNICTGYfLCFH
         Vw5aJuoXT39DzX/yJVaQ9OBc/Wnqh+AzCQ4st1CVdjOJg3uykXCqV2Wp99HLchnqB5GQ
         3LqqmbQmko9oioewIzXRpPaJuY77ZtCTGr3hYc8tjjXCkkwbun2QFJbbUop9m6Bj3Qds
         tM2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZIoifT8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020a05620a29c800b00735fce4d9f6si14052914qkp.556.2023.02.15.03.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 03:03:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZIoifT8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSFYz-0001Bu-JH; Wed, 15 Feb 2023 06:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFYx-0001BR-1n
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 06:02:59 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFYu-0005Yk-3N
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 06:02:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o15so15396670wrc.9
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 03:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H0KWF+EilOIV/fTgZRY43DEmQDgaPtP5m+T5JvywjtU=;
 b=mZIoifT8JsIrpfNSc/cDTeVwRPVTymGlGgaEB85HP0A38cmVYAj/z1tft6luCoYnYp
 2gQkfhIiF0rCGJmRuzgi4LLxArng7IGvtn1qu9RZSnXlLTAgWHqeFOGoOheku9o6yAim
 G3q+hTH/LmZM7YvyWBRvjiNX14AS41mD8r0b9zrLdXz6F89vnqffS+qfeCpQxhkxHYfw
 Yg+hAGkCG+tBtue9qhE+Xyiz4uiQ9G5Aj1T+NKrLvd8lrTEGS7WUoG59OrpvIlSIN1Y1
 7GVeWL33m9F7yUQ8QXa7q8sjLvX4VS6H4vN2Mgsum1fFatfPhvr+3qOOsPyCuJI1Z27M
 Pv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0KWF+EilOIV/fTgZRY43DEmQDgaPtP5m+T5JvywjtU=;
 b=zU9fN2qyWGIiy5i+22bJhpRKInyLzTT+Iw9dkMcDKzLTUYDrAQQmDUFhfdfxNVtWvn
 WPYcq3xmwGcIYjD1tvbIh9dDwYn7jnKms6pVOfqWX4d4lAXrd1svRypC754oPmgHnQ9S
 P7c+TgkECh12SwH041LHYJrL3hbEY57iIK6usX2og8rfP5jX+sH50BDe5cmUuCJEUyTa
 fW5Upr6oU4p3U+0rlvRl3XCHCt15PrW0iTjLbukgK0SrSfLAVwdtwZt1B6pvgvbrljBq
 dWrFwIrnvyrgJ0zjfovR3mSMZMLWz4sFEyLosISo9uCGysuK1FDP3x+glKcMzz4LQlD0
 XXZg==
X-Gm-Message-State: AO0yUKUlvgyuS1Q9vpnQet5IVsD4uY+ttKBS4TmkJgfu9pSPisvPoPUV
 ytM2hEHI/KvRcdDIC6oYZqmiAA==
X-Received: by 2002:a5d:6191:0:b0:2c5:4bd2:dc14 with SMTP id
 j17-20020a5d6191000000b002c54bd2dc14mr1377256wru.38.1676458974325; 
 Wed, 15 Feb 2023 03:02:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d6984000000b002c552c6c8c2sm9828366wru.87.2023.02.15.03.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 03:02:53 -0800 (PST)
Message-ID: <49213633-802b-afdd-d54d-e40a866e3fc2@linaro.org>
Date: Wed, 15 Feb 2023 12:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 7/8] aspeed: Introduce a spi_boot region under the SoC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-8-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iNAP5g+JZ8kG

On 14/2/23 18:18, Cédric Le Goater wrote:
> The default boot of the Aspeed SoCs is address 0x0. For this reason,
> the FMC flash device contents are remapped by HW on the first 256MB of
> the address space. In QEMU, this is currently done in the machine init
> with the setup of a region alias.
> 
> Move this code to the SoC and introduce an extra container to prepare
> ground for the boot ROM region which will overlap the FMC flash
> remapping.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h |  3 +++
>   hw/arm/aspeed.c             | 13 +------------
>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>   hw/arm/aspeed_soc.c         | 14 ++++++++++++++
>   hw/arm/fby35.c              |  8 +-------
>   5 files changed, 32 insertions(+), 19 deletions(-)

>   enum {
> +    ASPEED_DEV_SPI_BOOT,
>       ASPEED_DEV_IOMEM,
>       ASPEED_DEV_UART1,
>       ASPEED_DEV_UART2,


>   #define ASPEED_SOC_DPMCU_SIZE       0x00040000
>   
>   static const hwaddr aspeed_soc_ast2600_memmap[] = {
> +    [ASPEED_DEV_SPI_BOOT]  = 0x0,

Isn't this a constant address for this Soc family?
If so, we can define ASPEED_SOC_RESET_ADDR once ...

>       [ASPEED_DEV_SRAM]      = 0x10000000,
>       [ASPEED_DEV_DPMCU]     = 0x18000000,
>       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
> @@ -282,6 +283,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       qemu_irq irq;
>       g_autofree char *sram_name = NULL;
>   
> +    /* Default boot region (SPI memory or ROMs) */
> +    memory_region_init(&s->spi_boot_container, OBJECT(s),
> +                       "aspeed.spi_boot_container", 0x10000000);
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],

... and use it here.

> +                                &s->spi_boot_container);

