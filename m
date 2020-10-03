Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2312735lfq;
        Sat, 3 Oct 2020 02:09:25 -0700 (PDT)
X-Received: by 2002:a4a:5258:: with SMTP id d85mr4957205oob.72.1601716165002;
        Sat, 03 Oct 2020 02:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601716164; cv=none;
        d=google.com; s=arc-20160816;
        b=XPaSIMmS8N6T0wLJQR1luHuIBaFtOzunPuYod/4WHQx2SuGIlY7SgyTQqojJV761VU
         J2BaYGpLsW5WP56iSaLtcpE4zYm+At1lVY1Sa5qq9BiRjwKOAQxEFUCv36s96OjgmUj7
         bi3sE3jPpOlK6zoEhCb4Q+fdz+ZXwuy50yxK1oBpiwHewHELkWaW0wqK/7usn6xKL5DZ
         P8BsA9UJoR7mGThpiY4wfBzBZtHRJXZEXOrhzc3Y/YyNSjWftQ7zRsxK/FUdGrkHuZoZ
         5rOW13Q/csYyl2+Sfv7ArMlpEAFL85tN3jjJ+EaqvB513Q8awlO2/IPRQ0SJ2ZmPxL2p
         R5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=HYSCtcMUH1CnN1lWiP4pycuNjmBqf/V7CmBzZsvjo70=;
        b=KOKDLdA8c+JwxOFu8afCt9KgfxWCSWGl4UpAXRmQXdTMUr9hWfTKMLkgWFrXrbepO1
         PzUqrJ3bXGFtC25nSp9SE203RZGa7i/zRjz0xIkSFWw4FnNiLGSyhkLOFIXR6f78V++A
         aqtyZqah1C+m0j/It9EsL6OJt4+N9AGIZhN0iefgPWgo4Dx01psvP19I0uTtl1g+moH9
         /7mvfFYXVhgJ6Fu/kH7YnZAy2GGBOioemd+K+PoG+jPVNNRexx06YxLgauoOed9Rtwll
         TWwevpVMMLfkcC1EiRozJB6ruZqYWa5hFIukVJPTp3LKruTqsuzYNPXkdIFnoeBrNiEd
         9MPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zen9iB1y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d25sor808637otq.132.2020.10.03.02.09.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zen9iB1y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HYSCtcMUH1CnN1lWiP4pycuNjmBqf/V7CmBzZsvjo70=;
        b=zen9iB1yMPujq97iQd0rcqeRg2ftw3ME8gIklBFi8p9ldwneLaDXCDPYRUIQTkjPmu
         34gpNg5WuzSZl9oqb4EqsMJpID7Y8kqBXJN3lH6S4KyBU2GMIlgl0TTl6E+UVa33u510
         3Rh14+w366lPClVPydalaCx8NxczYi4TvLeZD2vj3p3wCzFn7msZNBt/JVfVWh3nGC0n
         7+GGP4US3qXnRDgu9/Ti+7ZjPRKMQiE30/YT7a1k6v6ax+sUGyRg9yD6N68gbwO1wt1H
         Rt9BsMi2c3z3Q8NvcmfIH8x9WHxlS3gWDRK7Ni2ODGW31CZ6cw45ek/rpWWeBWhDhvBh
         lXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HYSCtcMUH1CnN1lWiP4pycuNjmBqf/V7CmBzZsvjo70=;
        b=MFP6LBka3rOw+7typEOg5dKdidoIMqaKgz/mg6K52JOCjtJI5TM4AdvPTzt/fV/CeN
         SJsYOTQFkq/Rt3gTdoHNGUgQeWNmiRzWapsn2LEfVNyfCQwwnOLwae2msbJ43vx5lYOr
         WWouvrymdrge8ZC0ui0dUnwpaoz5RkKNYr8TVRzkCWFpevRpNSatGJ9TSNMaAL/tWZSD
         VIPGrQQS1MsKm6YcoRk8AEZ11cMtExNdYAiDnbNsPUvcWYhkfALyszRoIIqsu99EBmV8
         ZFF+71G65aTHNCzzMwwNAWVvvFbTrizhMqPkGPGhASen7gqM3efFqinHhJkZm4f8znDZ
         f9Ng==
X-Gm-Message-State: AOAM530SVE5ELSSJsY06mfBp2gkwqnKQju2xMbmQuSerT6tHo+4/KQql
	2gSWNperrURdu1/d5jdFWpdW/QOC
X-Google-Smtp-Source: ABdhPJx4lrVJsgCJS8zeF1KPZ5f9Ry1mx0UpzDyt1+dQuj+wzFEHnqikKO7+ju8aX5ld/ijPH/aJeg==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr4536397oth.215.1601716164481;
        Sat, 03 Oct 2020 02:09:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v18sm1125780oof.41.2020.10.03.02.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:09:23 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] accel/tcg: Add stub for cpu_loop_exit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Keith Packard <keithp@keithp.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4d714db-18d6-a789-b7f9-fe7e2c62b224@linaro.org>
Date: Sat, 3 Oct 2020 04:09:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /iIDohmJLvh6

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> Since the support of SYS_READC in commit 8de702cb67 the
> semihosting code is strongly depedent of the TCG accelerator
> via a call to cpu_loop_exit().
> 
> Ideally we would only build semihosting support when TCG
> is available, but unfortunately this is not trivial because
> semihosting is used by many targets in different configurations.
> For now add a simple stub to avoid link failure when building
> with --disable-tcg:
> 
>   hw/semihosting/console.c:160: undefined reference to `cpu_loop_exit'
> 
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  accel/stubs/tcg-stub.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
