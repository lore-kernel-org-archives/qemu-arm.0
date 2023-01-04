Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8317782ejb;
        Wed, 4 Jan 2023 14:24:18 -0800 (PST)
X-Received: by 2002:a17:906:6402:b0:7c1:962e:cf24 with SMTP id d2-20020a170906640200b007c1962ecf24mr40763646ejm.50.1672871058091;
        Wed, 04 Jan 2023 14:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672871058; cv=none;
        d=google.com; s=arc-20160816;
        b=cuLzfEbJj9NzP5bUY/8Qc6Jni81/qOxn3d7UArk/k+njBhVBow3rPfEhdVxF1k/t0I
         yigQo8YE5Ku8uKEgD2fzSlkq2D3B6ABUzc4I4zaJeKsFD0siNK23aozTqOui8R5oqn+n
         Y1HALofZilvDVyP+8ZXsSVssi3Zg7Yp5pDRDCzxSdZz26CnN2a8Getz+a57SgrU+cgd0
         Ushf8P89jeaLBZd6xrRlPprA/2sr45Dt/s4uHqAJ+p7Cw6HZvLHGXlRGTEbhquAXueu6
         5gBlNIvQUju1Uzvx7IGc5DaaTigntbXBs9GNZivaWhjxL8TiBgj0w/QOV4fHkiresayu
         c6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kdJK7hKhTxXNAjCVewSU4FCPOPdb8xkIvabuXsiLWtw=;
        b=ZDpDXpLeDhTJM2WqeEBAEpB7ffsJOTEMNsO95wSPfJMir/HjIohin0X459j4J2H4/k
         wPtuAbQ3vU92xqfHNemqtaLbFAQhzBd8BjfWga/9kK/TwosN+StQAfjnyAnQh9L5MbKO
         iETe1XTYgOPWbNObNgrEnPs4PF/jUaEsGNlhXKD18V/h6p1PotVS0kEM3NPGMGAP86yd
         NVX+jHy56VQFhlN0IQyAAI4QjtAmgtf9y/p/7hFCU99lEH2AVbwFBdtO4B0JAEiN46qf
         Wh/uoD7ldDNOcCszuRSjhCcOzqLd+2l60XLCXvwkQRtOYqRmKV1zgo6feAduWjUgdo0C
         q58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkvqpzPQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id st14-20020a170907c08e00b007c1031b0224sor15693554ejc.31.2023.01.04.14.24.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 14:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkvqpzPQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdJK7hKhTxXNAjCVewSU4FCPOPdb8xkIvabuXsiLWtw=;
        b=CkvqpzPQ3FaSqpRI4Tas2VvKPAZtJdwd13Eiy8L2CneL/u5tzug3cMd2bL73FAaoNU
         svfMWQaBW+8C43zuEhJaVYhtpim1/7a9Fragv4jCyg3c8jLKlUYiolauCgFq1hbEa0kk
         q4f0TqxS0wsuXaKrwNz88rZqpkcKpF4sklOA3nQiernVB2z/wxpeuflgj4b5oGbgO0eR
         51gSQZksnvDaXS2tgFJFuCUk5fwQ2lH2puOt/CRltHixLrIdEtJOHIwdTl61XRmIW/eL
         gYluP+7QudzoN2qTN9OYHbZTbWu4xOhHy8x6wvcSASxifj/+zpeJqrj2m1mCbLsFPTTV
         Inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdJK7hKhTxXNAjCVewSU4FCPOPdb8xkIvabuXsiLWtw=;
        b=j5Dv3gLMNbKcwls5EWVePlI/fm+6nxHxSQB6QgBuWU03Xfl0PoRi4+m5PMhyHsg9CW
         vW6VbwIKSICE6fdmLmGYOf5LOAVgKxwOuukHJlFDDInkCqnjzEUOgdTV+H4eNgxawLzi
         a/SSZXVZAc5evp9bLxCUv0hHIhfjuSwmO0NPSFCqSIudP+utwdkreyZ1mqGANpeyC889
         KRAE+VGeFOGz60poXkU4VV4oGFaUgNrXMAvJWtFMOolP64UgMS2KjPVYpjXMNvKsunNp
         ME2VArBSmymiRk/vkYWWgQaKaxYE2atUzeUUICnzXFg+y7A71geH+EMlwoAwTWEtzr6c
         GM3g==
X-Gm-Message-State: AFqh2krppA3nQvtbBLTgZmsVw166W6ulOM9Fyxz0Gb+g0Xr9I7EUxJb3
	1XBClj91IOIgiDoJyiCHncyrCLAb
X-Google-Smtp-Source: AMrXdXs3CUGU5yg/n77GCtilLwu1wiI8vhqe9Mpp5uILUgm3oKkw+kCF8Xj9E/s+HFldzXBsGDAODQ==
X-Received: by 2002:a17:906:5786:b0:78d:f455:3105 with SMTP id k6-20020a170906578600b0078df4553105mr40686622ejq.45.1672871057841;
        Wed, 04 Jan 2023 14:24:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b007c4f8bc322asm15658779ejc.196.2023.01.04.14.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:24:17 -0800 (PST)
Message-ID: <820138bd-1971-17f3-c5a0-37fc6c4422dc@linaro.org>
Date: Wed, 4 Jan 2023 23:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/27] target/arm: move translate modules to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-14-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Xm0c9E77Ppke

On 4/1/23 22:58, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> I also moved translate-{m-nocp,mve,neon,vfp,sme}.c
> 
> Originally from:
> https://lore.kernel.org/r/20210416162824.25131-2-cfontana@suse.de
> [RFC v14 01/80] target/arm: move translate modules to tcg/
> ---
>   target/arm/meson.build                  | 26 --------------------
>   target/arm/{ => tcg}/a32-uncond.decode  |  0
>   target/arm/{ => tcg}/a32.decode         |  0
>   target/arm/{ => tcg}/m-nocp.decode      |  0
>   target/arm/tcg/meson.build              | 32 +++++++++++++++++++++++++
>   target/arm/{ => tcg}/mve.decode         |  0
>   target/arm/{ => tcg}/neon-dp.decode     |  0
>   target/arm/{ => tcg}/neon-ls.decode     |  0
>   target/arm/{ => tcg}/neon-shared.decode |  0
>   target/arm/{ => tcg}/sme-fa64.decode    |  0
>   target/arm/{ => tcg}/sme.decode         |  0
>   target/arm/{ => tcg}/sve.decode         |  0
>   target/arm/{ => tcg}/t16.decode         |  0
>   target/arm/{ => tcg}/t32.decode         |  0
>   target/arm/{ => tcg}/translate-a64.c    |  0
>   target/arm/{ => tcg}/translate-a64.h    |  0
>   target/arm/{ => tcg}/translate-m-nocp.c |  0
>   target/arm/{ => tcg}/translate-mve.c    |  0
>   target/arm/{ => tcg}/translate-neon.c   |  0
>   target/arm/{ => tcg}/translate-sme.c    |  0
>   target/arm/{ => tcg}/translate-sve.c    |  0
>   target/arm/{ => tcg}/translate-vfp.c    |  0
>   target/arm/{ => tcg}/translate.c        |  0
>   target/arm/{ => tcg}/translate.h        |  0
>   target/arm/{ => tcg}/vfp-uncond.decode  |  0
>   target/arm/{ => tcg}/vfp.decode         |  0
>   26 files changed, 32 insertions(+), 26 deletions(-)
>   rename target/arm/{ => tcg}/a32-uncond.decode (100%)
>   rename target/arm/{ => tcg}/a32.decode (100%)
>   rename target/arm/{ => tcg}/m-nocp.decode (100%)
>   rename target/arm/{ => tcg}/mve.decode (100%)
>   rename target/arm/{ => tcg}/neon-dp.decode (100%)
>   rename target/arm/{ => tcg}/neon-ls.decode (100%)
>   rename target/arm/{ => tcg}/neon-shared.decode (100%)
>   rename target/arm/{ => tcg}/sme-fa64.decode (100%)
>   rename target/arm/{ => tcg}/sme.decode (100%)
>   rename target/arm/{ => tcg}/sve.decode (100%)
>   rename target/arm/{ => tcg}/t16.decode (100%)
>   rename target/arm/{ => tcg}/t32.decode (100%)
>   rename target/arm/{ => tcg}/translate-a64.c (100%)
>   rename target/arm/{ => tcg}/translate-a64.h (100%)
>   rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
>   rename target/arm/{ => tcg}/translate-mve.c (100%)
>   rename target/arm/{ => tcg}/translate-neon.c (100%)
>   rename target/arm/{ => tcg}/translate-sme.c (100%)
>   rename target/arm/{ => tcg}/translate-sve.c (100%)
>   rename target/arm/{ => tcg}/translate-vfp.c (100%)
>   rename target/arm/{ => tcg}/translate.c (100%)
>   rename target/arm/{ => tcg}/translate.h (100%)
>   rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
>   rename target/arm/{ => tcg}/vfp.decode (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
