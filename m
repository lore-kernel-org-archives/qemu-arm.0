Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp1974446dlb;
        Wed, 15 May 2024 02:40:21 -0700 (PDT)
X-Received: by 2002:a19:4358:0:b0:51c:bd90:e60b with SMTP id 2adb3069b0e04-5221006fa0cmr10415024e87.25.1715766020881;
        Wed, 15 May 2024 02:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715766020; cv=none;
        d=google.com; s=arc-20160816;
        b=qNbIvuAwXcEGhbbqKHZBAGpahhzqwczrBVsRjfrt11cl+5W0X6wm7nTX6TAFNrnWqw
         /i1sJBoN45ncntKxP/vLP+hHxNjbJD5Jle+JrZZdgAZkEf7cTR3DPHGtjBQlrd/apet7
         qZf7eOh2xq7gBzJiGlmOL0bXSw1sZd1finPDEmjnIqGcooyBqpPn+k+JAcirR707gXfF
         HlcQXD2+8fxeA78xBAgk4Du4eWwq7lIvDW3G5yOoxG0SUU36ANBsn3J+m5vqT9VV7E7D
         Bib76JvRwSN2HYssLrBZTR+UkBRHlo3+FYRy2P/1dYZOXaMjp82J14Nnd9PaeMWw43Hj
         dSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YM3ewHa7Fo4NePz33KHws2CHBa5FWfTq47qMZgR+Yug=;
        fh=Cs/fbuvFiMkLdTGG5mnddmq74k2WmtJg3cMNRFm0Bsg=;
        b=vSkLGgH3v+F1y48TSo10dXbC9y9NV2apZhWADSurF5wvlzSQPLQks//yxgDmUWH10G
         bxd9K+yeNWnUEj1GtE5Mgfl5gLEY/Q5nCYL4E89wexFoMa+54wwnm8XX0p7NW2bRpcJb
         caum1+UpysjoOrkY1ByihiHaIwj3a8COLglxnWdotp8OBgPIZjstuxfoa4zwz5RHSp7e
         J191HoQQDSsZPMDjLYmWcIcFsEa0Zvybvow8t14L1dCpEHF/IGqslKfJE/6qPaQCHORD
         ytvyvuwlWaXwDSgsquuhKZaOVswuxZBK4Jz6Vi2ltimKN3Rxh/s+kKhg8d553dt3awQU
         3MjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGHU2wuC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-521f37d48a5sor3482828e87.21.2024.05.15.02.40.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 May 2024 02:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGHU2wuC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715766019; x=1716370819; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YM3ewHa7Fo4NePz33KHws2CHBa5FWfTq47qMZgR+Yug=;
        b=CGHU2wuC/qxeIqbZQbAkQm/ugi/hIQxaeFd6WyTOrKUowHeLWIGj7Hh7km6YabsaeV
         8cmSmTZ5WXSMOscv7BaTQZ0JswjrB0e6JCPCnDu1JMGb+DJ+G8VgKwJU7OTM8BpMTZ7m
         hhBRHDGfR2SyH8xkr1v0EqzIUwJJ+Ocpk6rC8WmmLs1xKJemPhxl7MxbTqmiAh8t08OH
         0xtd8RhH/PYXvrRpJI99YcMWHIOv95EdfctduE7/3Ew4osf+MxFUW373XCqr5svOKXXC
         IQBtya268uDmQpCeAbyv8SxqhUuSnwuNfng99gSCh8S3vDpXy0cJ6w+clhfuTsCJh+Mg
         X9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766020; x=1716370820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YM3ewHa7Fo4NePz33KHws2CHBa5FWfTq47qMZgR+Yug=;
        b=lN1TrEUnhkHClTO6FLyQr/Z7e+0Z5lx0Ug7b+fKW5B0CwEph0rwK/AkEOijbcA7xMi
         vT6bOETuUlpKH05WNVC0nTyU6xHjj1weQQFnbsu9iOCbRx00H6KLfSxFfzgmF3qovvPI
         DkLQh8KDA6Pq32YR4UcPYtKwSLa7NJgHzYt1ftg7sd+O2UlqMvgcdYy0ZDpISIKQUMuV
         TH7u9RKqE/rdkLfK5NO1vPApAxs0YAACrl5isND3njt39lavsJUrck0p/7iBbY7WG2AB
         dEdU8+hSANURYG/5nbgjSdT5GEltUVytDjnZUnYmvrAsJvEz6c2i1to3If/lgdBmCoLn
         909w==
X-Gm-Message-State: AOJu0YzggdH/D1u8YMNL3EnIhFw5MnaYfCykf9TxbqFeZ0COEUL7xBFe
	NxV6Q+sTIp6FYhYS6VjkXASjmwZPrHG53gDXnN2FuI1i7x4Uh6bHj1Hel02zoanqFUnCJphZPJV
	dQK8=
X-Google-Smtp-Source: AGHT+IHWkyOL39owYG20oFHEXII8PUN4InS1607VsRC8tUg7SuODybrpn6C8L82nYpUm2TBmNyagqQ==
X-Received: by 2002:a05:6512:3d0c:b0:523:8e17:444f with SMTP id 2adb3069b0e04-5238e17451emr1513515e87.29.1715766019636;
        Wed, 15 May 2024 02:40:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.91.1.102] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad0a0sm16152410f8f.74.2024.05.15.02.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 02:40:19 -0700 (PDT)
Message-ID: <25c2a681-1705-46f6-9dcb-cf2d1b15881d@linaro.org>
Date: Wed, 15 May 2024 11:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] plugins: prepare introduction of new inline ops
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
 <20240514174253.694591-4-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240514174253.694591-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zE+a7y38T/FN

On 14/5/24 19:42, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Until now, only add_u64 was available, and all functions assumed this or
> were named uniquely.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20240502211522.346467-2-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h  |  2 +-
>   accel/tcg/plugin-gen.c |  6 +++---
>   plugins/core.c         | 14 ++++++++++++--
>   3 files changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
