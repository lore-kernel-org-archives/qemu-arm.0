Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp505852njb;
        Tue, 4 Feb 2025 13:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAyEN9nb/Cy52yJG9gne6v5vqup1SW/J7DGojC6OmD7HKylXbIKR0bxNq2umURl9QdnpFVzw7hAjj7Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IGAquDYrH3J8u5QWSAnRV2vrQhINDRftfPekdY7WJtfnUOF8K1mtIVh3YTn1KJxFBY5BeDD
X-Received: by 2002:a05:622a:254:b0:467:867b:ff57 with SMTP id d75a77b69052e-470282e9be9mr5076051cf.44.1738705119571;
        Tue, 04 Feb 2025 13:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738705119; cv=none;
        d=google.com; s=arc-20240605;
        b=jm8sd+6jrgIgRRtLtiWylTx83SKChd8N7ODBDMytZaChFK8QklgjSb8JYvoelhjg2e
         /Ky4EvwXR+nblMj00p+Doooww1xRCQu6359KYdk9yQTNFyIdwxp2HaICpCBEnHNTCNue
         2InHrY+OfZ0qy6Blvs6fwRgVnrlZZQnYSRjkqk/V2s8mXrdYfxtD4c0ECtvJ6qVSaIGZ
         5mqjwV9f4+e6ZtFPESrN5JXOGOP2qm5hca6vw2wujlrSU1Q8TLYPI28L2VgC3u132Pab
         KSyYVK3GKTI6uaknbcGZ2LZ+ZBvI6aDc2K0GGtJd/O7m7ZmSuq25t82XBpxtRSWnn0oh
         tMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S0hDIfiZm7cM2pMBKQYziSrKjmJPOXOvSA6Bjp6kfZE=;
        fh=ZoeGIVtIFj3A4WOj+ZC1v6d69xuB2WCcQ/hjfWfbW0Y=;
        b=G+V9ZPkqcJTTb+txIA0XToFUXHuyaf8EoU9/r9h6rJd/38dog4Q2r7ntfc1RJLsN6x
         7vGwuY24Q5PF43hzD3bfy2aPmo0bVpvoTMduwm7cY5YaJbHZkPSckj2Z5lg4msXT5VfH
         e0cBvERpfFOBfWkCr4eD0hYz0AuH3LnVps6p729PR7H1EfTalu9boUV9eAhiYnCfj+Rg
         nkLIqR+aNsOTVd/yzNh4yK8IB+3PmpZrPQWBxJQ6wdcUoO9waBPZMDweYRZHpdibD1Hy
         maGPZaIJUDxLEu9NuUiLUDIH9wvdgIVso2p8vKHzjIn2CQIhz63Up+7V9R6D7nZcmCjQ
         XVqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uzq2Ss+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bf64e9si38400311cf.617.2025.02.04.13.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 13:38:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uzq2Ss+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfQcn-0004wn-1g; Tue, 04 Feb 2025 16:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQcl-0004tl-M5
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 16:38:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQcj-0003jU-WE
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 16:38:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso42589605e9.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 13:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738705104; x=1739309904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0hDIfiZm7cM2pMBKQYziSrKjmJPOXOvSA6Bjp6kfZE=;
 b=Uzq2Ss+4geK5XD3FkaRe/ByWe5wgCfiaOXalNUVvQD/IvzMnvbrupNe4VLCG2vgeEK
 I+8C62oOOIYNvLVjbpRgzjSkwtM+RFRbbSVZ+M9z0sq5q7AncZp4eDVOaQoAAlUL5nw/
 PJJkxAozup4xaRFQV8KfLetInSfZJqXkfuqCstJz+iqwnDW8DTtTNbsFLjn2zHhIsGL8
 ozs7FjpudBoFftAE50ny6WA6w+5XTswmuJATCoHM2aifAjToThjQF9+RZBB/twXYTvKc
 r+zcYtGMpMjYJhKbBHqN9vnx3fZwS1kIIgUBwelJpD0E9NlhRgScUjstH3+juAkHcgev
 AuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738705104; x=1739309904;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0hDIfiZm7cM2pMBKQYziSrKjmJPOXOvSA6Bjp6kfZE=;
 b=dI8M4CIIEs3fTr7RlUz3c3I2OBLO/b3/lhojsW9ROX2LWitT5aBxMQl4aKcz1EFHkb
 FQi8NXN/7264MffQtWIEB7HWXtMktLW6NWEDWL2Z6DBGC7qWhBJ2UmnfOd8EE7ccxwsm
 pOTDPCOtYgctBVqV3xxTYQKt7Xjj20TbWZAx+fOQjAPuoXZzYuzCLdL9c49HdbkTbtvt
 ci/cLITruQo++uhOlZbb62tV9I2mOQpvYrWccnJdPstqa9pblB1yEWONxSdltcSFaJP2
 Mfnv6xUaqCIZvMBqszQp/xR2///glrYzBNVvdhZDlW8MfrALU3WjFYtBNH0P91tsY88i
 xthQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcVVSUeAdo/Y/lTA93bVOLWTk9p7s3Ul8MxeGflvM92vGFu394Y4uWUIoS/uABCGj2M1RqkurjpQ==@nongnu.org
X-Gm-Message-State: AOJu0YxaRtuaAnPmDT7iFU9iEgg07cYcNqFE71ra0hC+a73ICNo8SFrq
 0X0a+2DYeitFWKwDwcWjODRjpy/0j/b2AK8AFm9fWNUTv/5LeIyjP9QMxgjYmoA9dMdpLbuFWsD
 IrEY=
X-Gm-Gg: ASbGncuUWmV3OWlPsU9qBTNvTZYTJCKsWSi2fH+SxucUzhLLeqZQWcg+FpfRdbMmjqW
 JVddoDzR/rk/nzOn/vsvrMTmH8kr5OVZT5J5P4Vfzm6ruMejLYeaCIur6Yso1nX6He4iMph+aGg
 24szw7qynFPwBPDIoxGn3s5r/Wt0WoI64owVFwtuRrHaI58TaQLMEz5Ipe+gCJCKLYIniwme8Nw
 FaykAB2bNLXjjZxYuRVDDzZihMeKxVitfdN/fu/+VTjsSaF+/+R+/iKvYq8VO/u4rogshCncvYI
 JwTtjJSJyJ2yZ/Dhx2dZRqvnjXMF0qRPBDN4EmKJLBcTZ3iavwqpSW6yzU0=
X-Received: by 2002:a05:6000:1882:b0:38a:88bc:aea4 with SMTP id
 ffacd0b85a97d-38db48be08bmr217475f8f.30.1738705104574; 
 Tue, 04 Feb 2025 13:38:24 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dae1a1e4bsm2606202f8f.55.2025.02.04.13.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:38:24 -0800 (PST)
Message-ID: <b053170f-1116-40be-8e60-95961721dd64@linaro.org>
Date: Tue, 4 Feb 2025 22:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] aspeed/soc: Support Non-maskable Interrupt for
 AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20250204060955.3546022-1-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204060955.3546022-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 75/VfnJQ17ka

On 4/2/25 07:09, Jamin Lin via wrote:
> QEMU supports GICv3 Non-maskable Interrupt, adds to support Non-maskable
> Interrupt for AST2700.
> 
> Reference:
> https://github.com/qemu/qemu/commit/b36a32ead
> 

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/arm/aspeed_ast27x0.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 4114e15ddd..361a054d46 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -470,6 +470,10 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
>                              qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
>           sysbus_connect_irq(gicbusdev, i + 3 * sc->num_cpus,
>                              qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +        sysbus_connect_irq(gicbusdev, i + 4 * sc->num_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
> +        sysbus_connect_irq(gicbusdev, i + 5 * sc->num_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
>       }

Thank you!
