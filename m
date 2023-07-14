Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3842153eje;
        Thu, 13 Jul 2023 23:54:55 -0700 (PDT)
X-Received: by 2002:a05:6358:880e:b0:134:d78f:67bc with SMTP id hv14-20020a056358880e00b00134d78f67bcmr5489632rwb.14.1689317694879;
        Thu, 13 Jul 2023 23:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317694; cv=none;
        d=google.com; s=arc-20160816;
        b=rDkLy7dvAXAC3d5hUxlbyXJg5SD7x0Fb/wztLnZUmhD9uvNvdp4aAJzs5YsMpZbaIp
         vCU3kpUmsSdsxRQWwebrPh1+t+orZvh2qgE2LgB7dgDT+6FTasA24QYvl3J0/M5TvmcI
         FqiiLfdr2WVeFllSrdV4Jhz4zyMEO4Nra37pLFOL/A7MTutLwIHnT1IT+5mZ7j0VSIV0
         7+z/8neQi3cYDOdee8dS/LbXz6EMcexFkD81gat8tReXah7B+Qsy6QFike0NAc8S5O8w
         +MCBMcVB45LEk+3dn5QXkWuFTs+sgIDdERlVFHOQao2p19fNYidk2H9A9FHYZJMjUmya
         TndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8XreADdZGjiQFEnjQQAMs4fWo4glXBmdWp5So2413Ik=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=rj72yOTL2uobZ7Tu7gNzVNWkSjlTPj3R8waGi6kGY7HIvtUXMEepyF4mWILg5F6bJC
         BNt7WMKpi/UdO7xRR3qe2f37IDrBnWHoE/eB4U1lfiZLa16ai6MpZklAm3oAB4ISh5Xe
         AjBzhCSkYIrtOulzbO9ri3yW7ZksXZ+djTbd1YgjQr1lNdvPJ9XE7e73Lvg4EeQEioEL
         m9QjAJ7n/rkTKpM72pp6orIMJq3w6mEu22KLacUqvvQ4fc0b2wiHuzY5uv9Bo5LnCJCv
         bMjTvzCVqzt7RDUM/4jChFiCKT0BBqiWfIyrfUoK95ElWy2/N93eR++EpwJL/TJEu3G1
         vPjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/wQthjz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x27-20020aa79a5b000000b0068262bf5840sor3483302pfj.10.2023.07.13.23.54.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/wQthjz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317694; x=1691909694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XreADdZGjiQFEnjQQAMs4fWo4glXBmdWp5So2413Ik=;
        b=n/wQthjzTj+0SNlXMQfpKfsOPpJSWxrm57qk1R/kOcEu7GoqaKwOILW2I+zBog1hvY
         fMZmuLNsYb4wf00npY7J2OGEi4xVWOjzTlzyHqVP8i1rABUtAqkuGuAsKfeT5SojgPNE
         VClwCtgyvHUAc7dFiNqtXO/aCBSkhEOFDu4RYPyZTKS+MyMaiJp45ekzCK6qwvIFwJvl
         sh6RVQaHZ9qI8NS+LXL+Gw6+VExBHAOuuJO8sWs/BHEs/JJy92PyGwqsKZFbRLphcl1U
         Z8VrB4lwMGv3sRipjewKLMtF34LE987pesR9Pk1BPJCdUqirWjPAnM6T+U5vMQS9/XhV
         Ky9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317694; x=1691909694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XreADdZGjiQFEnjQQAMs4fWo4glXBmdWp5So2413Ik=;
        b=hWFyiTxT8aJE++fY2+lQmsYXjfnT7x1Nglg+zDh29bFfw79Eud/Ju6qFdGu77fe43p
         PgrEwTFYwtCFNIRAjgOiIgv6AGo+JZTyr2BfFQk83ev0bYsQcFKAhoBj/X2gvZVYliKn
         fiupmhiev4JHi5kOk3KGhcQFteMrWh48IORC1Xh97FgEXxfR0f57EUuVKQEVdjf83ENa
         lm5nbImZUJuysfkiJYwReQ7sQqmxnh5Px3+M3BBFjpKYLyXDOyPaUidnOhmWQW4g7VO5
         Ca2qC/gNB8ON2N4ZSITxZrFK6isZ171EV/0JvXi654oW8w+e4r1Kp7f09+dpNExK0imt
         YUCg==
X-Gm-Message-State: ABy/qLYmu0EgAKgvNYOEmGqJaa9C6HkueZcfQiXge4hzqNleES7SDUAr
	HvBoDkm77TzVnC1IJInWgiaVIG7R
X-Google-Smtp-Source: APBJJlGY2Kuo1stsMM9qF7TcsW1N5flabFei245JKgjfeZ/HkfO3LeByhIDc7gVFG/DHx4yYVh4yQw==
X-Received: by 2002:a05:6a20:5499:b0:12c:9f36:e7b9 with SMTP id i25-20020a056a20549900b0012c9f36e7b9mr3308417pzk.2.1689317694339;
        Thu, 13 Jul 2023 23:54:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id b15-20020a170903228f00b001b872c17535sm7022915plh.13.2023.07.13.23.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:54:53 -0700 (PDT)
Message-ID: <3784cbec-d137-3df7-291f-b283595058c4@linaro.org>
Date: Fri, 14 Jul 2023 07:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/11] hw/char/pl011: Replace magic values by register
 field definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6K2PyRlP3j5P

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> 0x400 is Data Register Break Error (DR_BE),
> 0x10 is Line Control Register Fifo Enabled (LCR_FEN)
> and 0x1 is Send Break (LCR_BRK).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
