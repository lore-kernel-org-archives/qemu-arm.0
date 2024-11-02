Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1137306njc;
        Sat, 2 Nov 2024 08:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnbaqMI/7TLcYhX3c7o8khHmJ1qHPvB/Dobwkudl2/60Jsv+edNYiRMSXg5ZndfWpiWrJQmsYc+PT+ug==@linaro.org
X-Google-Smtp-Source: AGHT+IGl+o6cfLghwCrO9ox5KcwEeEZdxAnnwGlUNFjupWvo93emlh9L4AMnQPYD9wzmbyEEsNOR
X-Received: by 2002:a05:6214:3d0e:b0:6cb:eea5:69e0 with SMTP id 6a1803df08f44-6d1856f3c9bmr475828186d6.27.1730559664203;
        Sat, 02 Nov 2024 08:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559664; cv=none;
        d=google.com; s=arc-20240605;
        b=UTT8+UPwvMXEDyCr0LmnWxeWXujOOQPatbSeiVwh7LjFa4d0aesSzYfgY5lPV6FRV2
         gIRt2NWJNbdvUrEG/q+Jjq7QAV7TnxpSpQMsDgPgIvShWF/FWS2DYQ4ILvpiaF0/8w5B
         jlgosyx13ALXCocVUqhTgI5u36oSloBEFDmkrkllVOJWuHiq4ftP46zT9+5QaKpeKsHi
         9im7YmtdMS4C2fuaqse3VqO8FN52rOeOSlvm3ct5khGMp01XU/mXwmDaTpu35QdN6ov8
         fVjBtcWMPOcBSRKG/DFZxRy8ba7HkGlFNglncIwbXHP6KJvudEnIZ428MaMI7qngr6TB
         LgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Ig2wkEtg7CJnn4pqrnZZnPweASw6BtuY2TiYNn1c620=;
        fh=98dZCMvX+NqbPkRXvFJNDIlyaWZH4tCfmKGJXDrbs8k=;
        b=PcMC11lwuufIGQEhRh0I3On+2YMxRo+cusZeKhvgIRIyEq/l0e1WEc3kZ6KD0xW8bW
         QyoHQOhBGkFvpVPIMQ2SjJOvxtNMnsBjrlA6lImBkOFw/sdj9V0kvdVm9IekywYK6BWz
         YpXyHRO6Dv9UwW/pMOdpu6OHSFxxLyqFg61G55vqrAUeiWDEZTaRtcalm8bHewh4eF69
         Wyh9hO/PRm+BHyat3Yy2FGmvdnccCuvLEK8N1MvVgoHTM2t7RIZZLQTd8y9GTFBs9xUZ
         79dPK1fc16dGBbtOEe+ikPuVChKiO9F6TzZ3LmDfLsN/CBRA/ZhFf7P4DqGqcYOFz/v+
         UH2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa88b7si72679456d6.41.2024.11.02.08.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 08:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7FcL-00059p-1q; Sat, 02 Nov 2024 11:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fbs-00056B-0Y; Sat, 02 Nov 2024 11:00:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fbl-0004BN-IM; Sat, 02 Nov 2024 11:00:14 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Xggr727vnz4x8W;
 Sun,  3 Nov 2024 01:59:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xggr25dHpz4x7G;
 Sun,  3 Nov 2024 01:59:46 +1100 (AEDT)
Message-ID: <60c62585-4bc0-4467-aa11-f79cb806253b@kaod.org>
Date: Sat, 2 Nov 2024 15:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 1/8] aspeed/soc: Support RTC for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
 <20241029091729.3317512-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241029091729.3317512-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=uVOK=R5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 6SsmgN1gbFDA

On 10/29/24 10:17, Jamin Lin wrote:
> The RTC controller between AST2600 and AST2700 are identical. Add RTC model for
> AST2700 RTC support. The RTC controller registers base address is start at
> 0x12C0_F000 and its alarm interrupt is connected to GICINT13.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast27x0.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index dca660eb6b..7ab4bec644 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_ADC]       =  0x14C00000,
>       [ASPEED_DEV_I2C]       =  0x14C0F000,
>       [ASPEED_DEV_GPIO]      =  0x14C0B000,
> +    [ASPEED_DEV_RTC]       =  0x12C0F000,
>   };
>   
>   #define AST2700_MAX_IRQ 288
> @@ -376,6 +377,8 @@ static void aspeed_soc_ast2700_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>       object_initialize_child(obj, "gpio", &s->gpio, typename);
> +
> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
>   }
>   
>   /*
> @@ -670,6 +673,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
>   
> +    /* RTC */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
> +
>       create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
>       create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
>       create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);

