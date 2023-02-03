Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1749804ejb;
        Fri, 3 Feb 2023 12:46:16 -0800 (PST)
X-Received: by 2002:a17:903:1cc:b0:196:63d0:a674 with SMTP id e12-20020a17090301cc00b0019663d0a674mr14779430plh.9.1675457176627;
        Fri, 03 Feb 2023 12:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675457176; cv=none;
        d=google.com; s=arc-20160816;
        b=AapHV8xr1BhN2BewDd8AXQpS1zpcN49H4NY7YtDIXscmE/KWOQ2+y3QdBqtycIvxEQ
         0jL2NnJRQtXiV1DIGGqsGFIYbgYAC9wAhI7zSZ+ZwWYd7POYsYE/WKvJIuofXVt/USE3
         B97WvrqM1yA635P8fb2UA0ioCiWdx7RzNCGc9/n+3JAwBeWW/9KR2fiHuIA9o6RGDePq
         /6yReKwcHE4p9Pa6kifaWptEOP9/4raV6kYqerv0XpyNpyxPFYAa0reMtg8znZfIIv8H
         cMHktlot9mOOlnJRfy4bflN26g3nT9KlEKjfkaguaCBVO+DTZCVe7amvpPspaSnOAQQg
         HOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=90r2rH7VmupffwVD+Rrrr2U62ktUsW4af1IcWoBsIHc=;
        b=u8PLhuusDUvRa85tCbmJGJG8vPrnws9CwPFzV0yBHZI+3eGpxpSmq/ekkY5bHwpMr0
         ugbM9RgFQH7Gkw82wj1u0zMCQzn4Hj819n4oETe6XyD+J3f+1iTdvwBEI4MOsngmQM2d
         IqH1CgGDHP90FKW69m2OjE66tbv3ubyzopZtu+N6ad2lPPOUd1zN8KOsh3nORIK+Wlkp
         Y/wyYiJ97ysv0BpZ5WTXaVNVZGnxgdET191cSAdZrq4FtajbwiQPhrW21WB0yXi7ODTk
         ROfcfdI0VHBzt1zujA3TpsHgNCkxPWoW4SevCBfH+4aEMdrQVNnF0pjQDSB4jCZj88eV
         c0/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAdR8ynd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b9-20020a1709027e0900b00198a3655b0dsor1549679plm.16.2023.02.03.12.46.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Feb 2023 12:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAdR8ynd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90r2rH7VmupffwVD+Rrrr2U62ktUsW4af1IcWoBsIHc=;
        b=cAdR8yndVAnG5VibYma02cQlaT2uUofuD+mnwj+A2UocjAvr35AQrv6OdKQg5Cgcjk
         tinLMh/r0UKu6RPYUlrbJxLl5D4NSuPQWk0IAEoikzFQukCVk9QZbSq0679D9ZIZ0D2b
         gnds/9Fk53uQjebMyjQZTX0hcm5kkqlzdlxebcDtAb6FMZRBF7JZalKQ5Zmyt6izyPJ8
         2BEmxLH/qyRmI/tw9W0C7UHgWP9lOQ7Osif9DIzJgj+ANB9nP3fa8GVhOrXG4vRYbBFH
         BAdtx+tKMmHhGTK51UaR7mA6Fd2CA1UIlHcpMRUqySSil5/TXYJJTJscU9kkYT2VkWVt
         4TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90r2rH7VmupffwVD+Rrrr2U62ktUsW4af1IcWoBsIHc=;
        b=hI0YEyHPlrU1v3K7yQlOrq7NYlijv/BtBuPh3XTB8UMsFDFmsJknfvak8UWwCrKmAg
         q+46nInEqJkOQP8ZLEWssfQcKvdgBuFyvYCnkZDeF1QqN4MZuIOJkodjmkWjVboDUCBP
         0RTy+xznkHr9D9mFW7QL2dg+UzF1p1Em9siDxM2xkOfFYQ1lGPDzeCTGbSqnN1kKuRgk
         pfZn96u9ycDEo42ToAXfuY4weRPahLjeM9QAp1EYpXNufpgsb/6gjHgMm4AFb2r0QVHh
         Qeg20W5mpw6lKsyZlXmHZx4yBok807LnN+D6PwwI5Ch22QG34o1GDwaZih9SLKPf1+HL
         /bUA==
X-Gm-Message-State: AO0yUKVUodcF+c1N33EajCtmgFZjtqIZWGb+3SeEXLg9RKz49Ts6uHJC
	Fn5dRaPuWLCzp/R3uUwAbjODq3gLh+oVpCbdYa8=
X-Google-Smtp-Source: AK7set+XSWNXwBxOmzdkfd9RMPqGN0H0LVwj8E6QnkeJX8r8pvjRCH3Na+UzHwMz+NYnLpd7jYCYRg==
X-Received: by 2002:a05:6a20:1442:b0:be:8fb1:9b11 with SMTP id a2-20020a056a20144200b000be8fb19b11mr15033890pzi.47.1675457176180;
        Fri, 03 Feb 2023 12:46:16 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id a77-20020a621a50000000b0058e12658485sm2316671pfa.94.2023.02.03.12.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:46:15 -0800 (PST)
Message-ID: <6be1085e-1909-45a3-741d-b2c8e1baaed0@linaro.org>
Date: Fri, 3 Feb 2023 10:46:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MUht2CMGMmTv

On 2/3/23 08:16, Alex Bennée wrote:
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
> 
>    Overall coverage rate:
>      lines......: 11.2% (59584 of 530123 lines)
>      functions..: 15.0% (7436 of 49443 functions)
>      branches...: 6.3% (19273 of 303933 branches)
> 
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
> 
>    Overall coverage rate:
>      lines......: 11.0% (58121 of 530123 lines)
>      functions..: 14.9% (7343 of 49443 functions)
>      branches...: 6.0% (18269 of 303933 branches)
> 
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux.py           | 48 ++++----------------
>   tests/avocado/machine_aarch64_virt.py | 63 ++++++++++++++++++++++++---
>   2 files changed, 65 insertions(+), 46 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
