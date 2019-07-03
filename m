Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1003026wru;
        Wed, 3 Jul 2019 09:35:02 -0700 (PDT)
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr9330320wmc.154.1562171702727;
        Wed, 03 Jul 2019 09:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562171702; cv=none;
        d=google.com; s=arc-20160816;
        b=RmbnZ8I82kucYxwsl7g0ivLfa2vT2k5GniFyBaAVLM3UpNMIe+Vzj+RC9jc6oXOlKt
         sOKPmRsK6Qil1fYp2KBXUlr5mYyx1WoLtuJbK3kUAE6K+x8gOaiPMl1lNe6flRNCn9gn
         S3Ylu1hLfghGGLDjIYbkP8UHwx+MkPccQXdxLWR+mpynz9zFKS3qJVMZ8IWwu2AqG5rS
         H3W/pb4sNJfO62R192diZOH/Nk1tkalSDm9MM+ygMw5XxkyyQKz9Lxoc28IUBrimk6bP
         TUUFmxD+VhimaQN7GmTJDeKVAIif+1lAuRLyJ/PGdO5WoDrevsT/1calehPbscDWJPLJ
         Fdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=qaGODbYJKsxE/CqG0c/kMGgXk1sGBE9vDO+cWlS4gVQ=;
        b=Pa+Hb2Yr/B0eW9agr+nzITCvmYKMMBAWI6Rqo6nISRZGLoyw7xqgv8t5GLoIeY5LYO
         ZVyHQbaTPojcz0g5qCJPKkTsiWshVJmY4S+Eb2qeYrJHJglh0c0ncIZ+DU4WjQ45HraP
         7nSNku47bQj7WcvfSTZwEBWqmKDOOBym8f/WbIKe+eWRfaqrniX0SGtGZKwWgQNWWn/p
         o7fIBLAMM9Y/v6AJeLpCvM9BgVBrGzbLCR0bLBypk0nYwfFe00xkcGxhs4L/FGfpWGGQ
         QL6C25+JcDX2GwbVHVV0MtMXlAqlQNJkHv80BviBDBXVOqQl1ua6uln/5VehSm2or4oB
         xokw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhycOE3z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q14sor1580140wmc.0.2019.07.03.09.35.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhycOE3z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qaGODbYJKsxE/CqG0c/kMGgXk1sGBE9vDO+cWlS4gVQ=;
        b=XhycOE3zX977xr6vIqBIUjNd9o8TK1F4TDPx06fGeZrWfh1iBRmfp13v0I9oRseLYO
         pes2TdDmV9TbaDk0GSfh3po7rVidVvqiXxDjs2kmFJxvpP9A3pJs6VMNBrnui6gl3p8u
         cLz5Asn7tjyhAoXEbDN3kZ3hRAyvjxCpkp8/TZpXJ6dX6RivHBPkzoglGVJ2c5tsV9Q5
         PgGbToL8O9F3gv4lY6Cz16Zbx+sNjYPtnRyGd94Wd4ymhjAxbDnKJvGkgzLyU+0YfGyp
         BGQa+dvsYCWlN8Rrv2Ebqecj+1Bkk6eXfLPF4qPpc9eh7Mge535GYVbmK5HHpiIi7gpb
         zEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qaGODbYJKsxE/CqG0c/kMGgXk1sGBE9vDO+cWlS4gVQ=;
        b=K8gWuadCJdbFrd1S0mazHoTbyoWnwC3WzhpfKYAofR99rgtgy7YWok5Wl5loHx+Pee
         e62XCakGYCkNsSPwVzgrCWL19ZFDayZDLMAtxWSpXRT6GQ+/cUPfYT7XDftau1C+yFg1
         BTO5a7glgs8e6DkbvoIjNIhIA3iB/x4XhjShyFlH2KWOfo7Qsmlal3enTMhLfA4wjjTp
         e0P9XQW6m8OsfRbtQjvYqEqp7t1JlqWptVsQlxw6p3m/IeB5N0v/s1ljb8ZtwGHa2iOv
         c2XByKjM2vgY29Y6vKYenHP8tCpl5uDXpnhVUHJjUpCspYNxaPgyZ0XG7foqEDcKGwBu
         EgAQ==
X-Gm-Message-State: APjAAAXVmBWzRhnq2bkwZUOQkgOJq7l55JBR422/MMnkCOzDHKGjKJnw
	orWVjwCM6kCqfsNZgmZQP52ZhM7L
X-Google-Smtp-Source: APXvYqwAcLEIazn1Dpw2KBfxADhgZQz7f3OF1yEEX87evuT/xi9dz/YKpfJA8al79HBu3I/BKLsfoQ==
X-Received: by 2002:a1c:1d83:: with SMTP id d125mr8588366wmd.63.1562171702441;
        Wed, 03 Jul 2019 09:35:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id x129sm2678662wmg.44.2019.07.03.09.35.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:35:01 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 3/4] target/arm: handle A-profile A32
 semihosting at translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3081fb0b-0e87-6907-4055-e939c1f52573@linaro.org>
Date: Wed, 3 Jul 2019 18:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703155244.28166-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oKOEs5mfGV1/

On 7/3/19 5:52 PM, Alex Bennée wrote:
> As for the other semihosting calls we can resolve this at translate
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
