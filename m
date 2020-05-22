Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2211977lfb;
        Thu, 21 May 2020 21:26:54 -0700 (PDT)
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr12984380pll.320.1590121614392;
        Thu, 21 May 2020 21:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590121614; cv=none;
        d=google.com; s=arc-20160816;
        b=upVFctJYGyQigzaezU8ZdliTgGk/ap45ysA9Mee3Cg5aInw1WMztqfx8jWhGof6bLM
         wFQQ4XS1GLI8TQY00eA4VhaGfw+U4R4NuTON83ulCQ0madxQK6uBAHhOUuHt10yfgbZR
         VAS02DI6pDurPPgEtvAaEoc6uvebk0Bjc4xdz+3y0ER+OzPewMD7wzWCKImHxNEpGZYT
         ZZoztUfsqJL4M1cX8XkLZXd1OuM8HDbdzB+4ebOO4j8WbOOWdRoU/uS2aIQ9KCCFJJqE
         W2MwxIgmEmK5dX7h975xPlkiCa56E8EfTbATBBkgmC+2cuEup9l0W27RoLuC8OXgcynY
         Usrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6t60OdTEj/+df3YqBoi4RRSuD0MFWy3jgFZjTOxrC5Y=;
        b=mTFe3iPpv6T3jHIWrkTg44BOxSeg9uvsHnh+WOX8D/ifLvh2OHyaXgSI5Lgg74FL9E
         lPCbfdHy6TM8x+lbzl7KzPTFiZVhO78R7BsqX9obd6PIr6WK2LbgxwHQxOCo9f7Hgen6
         A2xp6RAhSZQsajeWnNi9w2Ra5xQuNuidkOI/QNz6Aq1pi3t13kjEiTFRHNHIcxc3ZkbJ
         qnjZWIF4DcP/A03EFioB9ExVes9D+oCrEmFbBOFGxRynue4yCcrjynIOLBAx6eUMbN+z
         Spuk675DofnmcegUTeTQZ/W+mUv3VBvxsNFCMmA/vJm7yNY0Us88iCz2jA5VxZStappv
         nKsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ABjzplJh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d15sor7774029pjx.25.2020.05.21.21.26.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 May 2020 21:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ABjzplJh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6t60OdTEj/+df3YqBoi4RRSuD0MFWy3jgFZjTOxrC5Y=;
        b=ABjzplJhJ7v2EY8T2PgfadwVYMYTpiHXzRtnQiQkyE4tHYiLWv6q11Iga0HDgro8op
         sFg13WEznnn/nDw8bLQbIqm1rIJe/JWLZokpnzC9Ne5TzC0dYt0/u+1bOTs3mLemDtZG
         iJKQ27PM4/Tvbix1SectJRTOYh9omaCRJULwouNn8ck/B82K3A3vc5QqNNCMiG76SK5z
         IM3lazPWmdYRW7Q1nzdK5neqLhXPvv62pjemgG7+93b2a0f7x6XD6aUvUcTK6C8nZ70P
         9a/ylK595DV60+amKQnC5UdYL5c9GumoHzc4Xxyuf/yRWzI8nP4lHu5tyaJW6GiDf2JC
         rqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6t60OdTEj/+df3YqBoi4RRSuD0MFWy3jgFZjTOxrC5Y=;
        b=ZfpNV/WdwX1E9ucNTmmvSeoWMyetz7Lkp1zxOgQ96R4lErDELtlSUZ0GM+zDhez10f
         M1k3XGnPqNwfahhj7zA9TnRFd3fAqpi1PVDNdVbnXKS6ckfh2WtwbxYu0WClTjGPAyZa
         OI/60oL8yXX3XiTqtVUT5izwuSnbYnXYeIvN4lUxSfodOYcBWqAATRST/9YkHg1YzVHR
         2+Oa/nNoTF+6thLjs4zjCCfA8oMYCvba2g9hBsGdFBYAC2PS+J+TK11R0hNLYHValsJ/
         BCOaiATTrRTkUZnOKaeYUoTHSkgHl/EOMZWMIkcdZyXaFcfMdllN7xwE6dA+sChGltPa
         5YQQ==
X-Gm-Message-State: AOAM531NDCDJYqWFsgDsB5nkld4cXEqopXGpevY4tusH7ph0kRVNf3Bj
	jU66PShNaw6adbrTf8u1EGHGl+LL
X-Google-Smtp-Source: ABdhPJyH7IulLdrBCc4zXIN9Yv0wCSv7AC2Yz2CgZMKL/CyQ70uJA/LgBzwbW61NL8Ezx4Mta1z1RQ==
X-Received: by 2002:a17:90b:2396:: with SMTP id mr22mr2264422pjb.118.1590121613947;
        Thu, 21 May 2020 21:26:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id q17sm5064573pfq.117.2020.05.21.21.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 21:26:53 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
Date: Thu, 21 May 2020 21:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UgwBt2HtZv9M

On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,5 @@
>  
> +# default is 'n'
>  config SEMIHOSTING
> -       bool
> +    bool
> +    depends on TCG
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..035592dd86
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

Did you answer my question about replicating the TCG test?  If you did, I
missed it...


r~
