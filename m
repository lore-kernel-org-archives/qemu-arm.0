Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2905241lfk;
        Wed, 7 Jul 2021 01:19:59 -0700 (PDT)
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr2328669wra.291.1625645998872;
        Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625645998; cv=none;
        d=google.com; s=arc-20160816;
        b=It2yaPuTBG6+gmxN7J3ufA6ab26/yqU1TYo09PUSS39evkVm5yifJHAmiRioIe3SJB
         v3W7N7YRdRTaphrc9doKsvoApy3lnxIeHjdumyxu3I0+PBjlfsjzzNUcz5ytYqxCcGS7
         NvErUVmUv2UZOpTi+Mj6eVMBFfDDQwuo2mqI1MhYyxTyohvlWGA65sj8GsddkfiHnYc6
         ZGjrRrjG0SzFiZrMD10Tbs48ZG4Gz/yRiGHagytBxR4fAVOUX1uefEsJR3FvyFqzzFvJ
         P+1X3IL7sGW6Kf6tOWHZL3yYgibKSMrdXnjeyMwlzyzX2Unz2zv7M9OfXBxB6I7ni+D4
         zs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=vlLLwTSvZY5GMEjw/IRDS1ZEL4ADJORW92gO8p1AVPo=;
        b=pzgOOtUsdzN7V8+0On9UEG29754n747pM4sMixhx4mSQHEltBdfexarbPJ7XOdB9TF
         QIXHAU1HCEfrKinYJ/zSUbJYEtWlbyMQgViCN4KfNIWFcNemx1EdaCfYq8GghxuJ9Y/1
         97EYNJLxYDz0RHq2WsUQ2v1iiRK05IFnorwgsvf9gClSUrINvZVwvjb5hrNs3nV8jwZi
         jJerdBCmN+waANK+rCTEUSHNUrrw44DnqatzsRv9tW2jlTaXW1nVdHQqc9QYXkAWHlez
         /beNQeai+ugH6WywrWpWtymjcpyYu5hZCSjzNEzP6iU/E5FEy96zmPdQef9ixXjm7ilP
         4sUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="phcjUTH/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v1sor1068923wri.40.2021.07.07.01.19.58
        (Google Transport Security);
        Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="phcjUTH/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vlLLwTSvZY5GMEjw/IRDS1ZEL4ADJORW92gO8p1AVPo=;
        b=phcjUTH/90tqdgi6GUSLEDkaCrIWLx2IBE9vSkLVswG/BkzRCrx3ftb/RAMIZ0TR92
         qLt1/jO8mDYqLNY0ewnsVJh9l/fprUfR7cq8ILWjR2Fut/fvUDYy0B9WLUvvzs9QYqz5
         y7UVMyvEUWb7LNzmIwcfkNz8f5RT/3vyYHnrQDDEaMJ4M+7fzu3bu1P3XPBEphz3D27h
         xbAPrvRR1dYhlGMxB2KAs3NTO5zu6kGfF9lF5lTZ/04+/RbaYcW75k2WPKIZgMEpwEGZ
         RNPl7WJOi+KDkfmkyprutW5zw2fH1+XT0F+ldm2Ed83Sbnfvs30C2NqoSbslTiBN+FyZ
         iRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vlLLwTSvZY5GMEjw/IRDS1ZEL4ADJORW92gO8p1AVPo=;
        b=CiRBEtwGDiaBmPuodl1qLGkeJB+21U5E43xyflJRmJbmJEEynzL/FYYgZi5NXPw0NX
         /maFpIFbjqTlJdvo1Qxs45n7JKo3/a6TMbJM+qxRe4cpms13Aqs2HTaobi50pLF8V2Ag
         sgvhrahSWKtRh8pHKSLkuxfVpXrnNQYJJdHOm1YQ+78uPexeNxE8pflqX2s8DYjuU1i1
         5wLjouOooA1f5agBIXEBSjWSlxK5+NbbQhzS8PD2+IEPXmPv0h2xt4C7eMQNHnBf03Az
         TKlNPijrBTs3463Mc1E5eIu+ZwjJOEeBC2ETpbMsQg5j+OUYyZPdPU2f66pV/gZwG/Rk
         zjJA==
X-Gm-Message-State: AOAM532/9NPamZ9lt4lwp8Edx6SCv5nVXDsCQobOZ6BZK7uv0uLD6LYJ
	Hamf6CNLTQlHcYoItpgXenPrZ7Lloek=
X-Google-Smtp-Source: ABdhPJzJTFClzSqvqfF1xeaW3mPWk2eptKFj9GK+kXWU46bHE8LrCaTIlD0wCuz2SC58sruZfZVGyw==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr25733314wrz.8.1625645998604;
        Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id w22sm5447122wmc.4.2021.07.07.01.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 14/36] linux-user/arm: Drop "_v2" from symbols in
 signal.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65540b48-3192-86b2-c176-3b6f7b2a1fad@amsat.org>
Date: Wed, 7 Jul 2021 10:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oadIYvuhlaQ7

On 7/7/21 1:49 AM, Richard Henderson wrote:
> Since we no longer support "v1", there's no need to
> distinguish "v2".
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 155 +++++++++++++++++-----------------------
>  1 file changed, 65 insertions(+), 90 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
