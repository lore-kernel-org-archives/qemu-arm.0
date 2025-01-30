Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp67451njb;
        Thu, 30 Jan 2025 14:27:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTzKH7iy23wgwNptzO0AcCLX7mp9C36HeLCL14SQhyp1zNQV5OJWAQhg8T7jMWYZK1qTQx4D+a0ox+gQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFeSixzgb4iIf8C1C7d5ykzNlyULXqoZL4FMEfR5mQYyeVvRwKRKrVuvXl5xbNTlo3e+PFg
X-Received: by 2002:a05:622a:1aa6:b0:46c:82dd:9a69 with SMTP id d75a77b69052e-46fea0f1a6fmr18725861cf.19.1738276044708;
        Thu, 30 Jan 2025 14:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738276044; cv=none;
        d=google.com; s=arc-20240605;
        b=gkFlW/xy+a69OH3/kn/pkWoggJh84Fa2h4GieAvCIpXPfozXxGBoq34TG6getbT2s6
         F6qI6iMc/us+Q0t5wpD2vVqZByA+h4zPGCe5hdELz+YMNfrIrQ9rPetiHZBGdhCO/JSa
         4bu/MXZcclS2TQVEljYlGEbRU9xUkHzFisCIelH2zoDjb+0F8bqb03q8WZfp5CyF+DgY
         GNRXnu963DpfO7xoFtWNpxiAwUhNJmwDiwiv/bIvKjUH6/wXMElTzaMbiNyPHcWQI+Vy
         Br7xjNRks8E1y0YuxqpYN6o30x+BeupeTjLl+Q5ec52KVN2HbCQT7dVC2ynEZbyE8jPY
         Bd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KM/XoXqgNaQ/GxSHEqGpSfmcFkb5BDSf0xiYa4Q0Liw=;
        fh=pNSrQZf+v/vI48urKHUMvVH/FuU4jf2J8yCuADgieKU=;
        b=LyP37G31UPhbwpnJZGxbFS0NdB2+wTIHo4tsn26q9zEctC4wcJweqxc3MyIo7gAtUf
         CF0DEYBm1PsFxQxFIQ8JxPjF0svqYqQn9INLbUoo/olKvgDjBRH3UB7FceQnrud8cRA5
         eKL4wh02ERiCeVaRg1DJM0mV0T1csLuWmWelWlmdlyF14IaJPx1Q2KgE8mCJ1Y5EbV71
         LvFNi62y61Vtzqa5e+rt47BHZ3HMrMFmXxVOqbn3rSmwaqg4q9Ijp+sn9vYsayhesZ6J
         9MEjz9Jj7y0JfTY8GccrPrXFN28sQ3mPDkgaJaVgSQPcorECGJd0hDwsAE3cACqAx9oa
         lsag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6LIi7FC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d18b9si24821331cf.422.2025.01.30.14.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6LIi7FC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdczm-0008BU-9S; Thu, 30 Jan 2025 17:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdczk-0008Ak-3n
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:26:44 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdczh-00028n-H2
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:26:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so15604555e9.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275999; x=1738880799; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KM/XoXqgNaQ/GxSHEqGpSfmcFkb5BDSf0xiYa4Q0Liw=;
 b=n6LIi7FCEGbGNek7Z9bot648/PG3W5vskBppe6+bRcxt2kzoyUOGdPT04g9ok1sjpa
 Sp18ucUC6B52qPDfNZgliOfwPO7JWnQ595XuDvLuX2ctfxozpZ45jyMAWEZgLXf1fzr9
 UA7Arfp/OuHuN+QutrLEfqcAG92BQ1X4b+RfGscwa0DvVAi8PWT+EVkVZALwo9fmbhUu
 F8T4xosy+2zD2Z2picW+szvD4C4pjNtJ0X8H0ng7mwm8qzzbT1ZtVnEj49wDf6nfbAQo
 CWFzu2ZVk+sLNHXiDf7p7KEH4TAU2y4UPqlZP2L40gkMBEuAkDZElh51SboYKkh1b1nV
 ndXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275999; x=1738880799;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KM/XoXqgNaQ/GxSHEqGpSfmcFkb5BDSf0xiYa4Q0Liw=;
 b=NuMVonVO9m9zKpFwUpFMnr3mvp1kK+Oyonevia9+b/XOndlnp+yKZ1Nr+wygsHISeQ
 vr/nszqxg0i2maJS6aT8s8ExRRw5Tl4twEzVdrpzcQg1m7JmdKw54FLoWv8Cqclq9Qev
 6WcqjnB4SaDNWJ0egYO9y4JAmiRmFICCG29XNEbCb6mvY0Wc70NslprBfjpDIqIUMNxu
 HMphCb9KaaYF6F5/MTb/z+TnlQF+wIjiM9CpnHP82RZaY0f3xQntBrhuqR0epsg7YIs1
 d4HEQsrsAlomhBwRSnZwQ8UCk1zRDF9k0JaIsie+pqxo9JAyVuRcq4CIaXY9PYXjao7H
 RyCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBC7we1QIrPXXnsTQuLDeBeGldH5Hrm/h6Z9pt1qyOpudcISE142VNjzPxKZCC26RT0FXGkb5WrQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy556pAt9aexqUmxiU1fo8S/i0XuZSrin+LJ24xHrVqE23xVaHI
 CTX6QU+4qimMpeJByBByuM7K2218mmWduQ3MFigG9p+3x5p7sHCOimeQ4c6BgyI=
X-Gm-Gg: ASbGncu70xlfec8LBlV3zkSN018Udp57iu8AyS7gVys9ma02lzBY+l8XPSZFR6FmIZc
 0DUASi9UVPalSEY6t2DD7DubJBhjXcUGA4QsojO7r33HxqFmj70/EKcmy7+nQxbHf7MKumDekXP
 r6KUlRtjr4T05WnKqWrirnw6JC/zKseHXIRxELYC5Fkw40t7vaidsd+XZ/Mfsv0hM9YIQwDHDiV
 aHRo0UT05mw/0IabbbFrXBxlFFRhFW+OPGdiGQHESW1cireHqZJ56hVMXyWMlzpHZXGpF71jw/c
 6HtaesGn8ee0r0wHuNGtJfr7QJPgTN3qmpiGrr0VUSpPFLuB7kCAkzugFDY=
X-Received: by 2002:a7b:c356:0:b0:434:f218:e1a8 with SMTP id
 5b1f17b1804b1-438dd1a5b55mr65885935e9.19.1738275999498; 
 Thu, 30 Jan 2025 14:26:39 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5780sm3141965f8f.67.2025.01.30.14.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:26:38 -0800 (PST)
Message-ID: <25be2867-6736-442f-989f-2ce1f2745c05@linaro.org>
Date: Thu, 30 Jan 2025 23:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] hw/sd/omap_mmc: Convert to SDBus API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: XmeokDzUVYyV

On 28/1/25 11:45, Peter Maydell wrote:
> Convert the OMAP MMC controller to the new SDBus API:
>   * the controller creates an SDBus bus
>   * instead of sd_foo functions on the SDState object, call
>     sdbus_foo functions on the SDBus
>   * the board code creates a proper TYPE_SD_CARD object and attaches
>     it to the controller's SDBus, instead of the controller creating
>     a card directly via sd_init() that never gets attached to any bus
>   * because the SD card object is on a bus, it gets reset automatically
>     by the "traverse the qbus tree resetting things" code, and we don't
>     need to manually reset the card from the controller reset function
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  1 -
>   hw/arm/omap1.c        | 10 +++++++++-
>   hw/sd/omap_mmc.c      | 30 ++++++++++--------------------
>   3 files changed, 19 insertions(+), 22 deletions(-)


> @@ -643,6 +630,9 @@ static void omap_mmc_initfn(Object *obj)
>   
>   static void omap_mmc_realize(DeviceState *dev, Error **errp)
>   {
> +    OMAPMMCState *s = OMAP_MMC(dev);
> +
> +    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, dev, "sd-bus");

Why you don't create the bus in omap_mmc_initfn()?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   }


