Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2151133wrg;
        Thu, 23 May 2019 12:52:10 -0700 (PDT)
X-Received: by 2002:a1f:a249:: with SMTP id l70mr2641836vke.58.1558641130422;
        Thu, 23 May 2019 12:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558641130; cv=none;
        d=google.com; s=arc-20160816;
        b=AR/X/PumVU5pffjxR9dhG7wz3N7pMEW/t8ggN6dO9edZ6ly0zyhgCLQqntXGEkutGs
         qu5eTvDuwKrIjtov4pkn32HA1DKhAL+Qc9DqCbxwAi9wyrdegYMq6P2+aK03Ys4bbryz
         iBkHKYwxYQT7oT5RMF0Nu0KogD9RKNin45B1IkfSStxZBaMdAoJr1qpMckLkxPHGmewO
         3rg87TEvf/iCydwKJLOTwFUrxalkydSOs0TIeJS1p+RLk/ZWJi6r3KYezEwZ3bMPpove
         XV5lled2Tq3vsJOQ+/3AiWd3odPNOzpF0kHhQqwapMht5nnhgD4zIzX2PmvXoDXhWiLq
         Sw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XQMNwRorjVyKHrLMe0nR5C3o8n+pTdAqdghpcx38hnc=;
        b=b/oGnBJdUFwSEp/SA9ZDjnDluRPTpRTBC+3RMQYTDybhSuYvUC5dJXe0aUtesBHgi4
         17nExEBIZ7ezLPQX1n1XVZLz+NBZqw8jjY9aU9ueCZ4ewYtRtP0wBuBOyZvQhDvguusl
         Ai0Uc5WQ8QCk+crsvp6i31LXPAjkn+YmmZxQ9l43l/StLK+32cKaWL+tgRpZYu2Hvr8F
         uTwqsXTWdNIr4t83nk5K8AxagD+Ecc2gVQ+qtCbJoGXVD2Q8cVuh/a5worOJI+DSTAYg
         pR2HmPCg4H8L9XXHOUsJa+p7gTWn4pSbvh5/r202xgajInJVVa5pA641Qf2ijDXPy2A4
         LjxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDt0rl6U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l6sor127830vsd.66.2019.05.23.12.52.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 12:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDt0rl6U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XQMNwRorjVyKHrLMe0nR5C3o8n+pTdAqdghpcx38hnc=;
        b=NDt0rl6UH13pTaoOL52gxiRd6FFe3Ld2pWL2lSnZNStbcQcUgAw5N4coFkwySmqraf
         29rtFhjmJDah1C0fUugZ9IqwYkqZulb8WrZrVA2yqwQOFK8YBkKha4R2tJryVO7i8o/x
         14HbnJdosfrqZfBiMUx1zq+hzypjDM6zmy/kLEIAJR+S9IGGFT99oANpZtJmk/OvCfas
         hXYRIMxh3Swy/mPnYMmoEij/kLw6KneU8J9ci2bIfW9RT7aq6JWOTnCwOeRTiyxh/jl+
         eTk/2446CI92OtL3290NYZlQx+aa6wuewyCSs81S6Gse4FERywbjfw3x3fumXmCktApa
         qkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XQMNwRorjVyKHrLMe0nR5C3o8n+pTdAqdghpcx38hnc=;
        b=nsQGCYcQInhdL+PJWGAvJjDJjxGF2Np20Klo2cnmYD5IgjELqegPt+0gMhO7MltA+T
         YxCTvg+UQnqXAvNySTeQupLWorx9cxPhnRKlG+TOfBKIK/KlW7Mqe+uVhAJ+q4kT5ang
         AegSic93+8ctskiqXBmldGBFiPi0sl/Rp8mEO3lDNZZ/j8Glq/yj3ZebeLs0BWNp/Evl
         xDhO0bFj5l554t6sLW3nBg6b6NRVQiFdARHLJkRKHOn9SV5UqNjK8RSOMzNnwlDjXjhz
         NPUmxkRNcXVREzLkvoI43eK7zpa006akA1v2doUX+MRHS0XnSKC73aMymppxWzJsFgA4
         9Yew==
X-Gm-Message-State: APjAAAWlXTuWZqDRX1lzVkqSICyDiNIBsPdzX8EVb0biZ13pW19cbsjy
	PyGMZbMyYCWUoCV5saG1ujS1LyR6UwvH7A==
X-Google-Smtp-Source: APXvYqy3tztU8nAS3nKYQkWSwM9zUxPl6ig0PMQFLEWCxCf4MDWsDcfJvBX+8B/FB0N7DYsI+GkMOA==
X-Received: by 2002:a05:6102:3d9:: with SMTP id n25mr22069368vsq.181.1558641129975;
        Thu, 23 May 2019 12:52:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-172-85.orldfl.spcsdns.net. [173.130.172.85])
        by smtp.gmail.com with ESMTPSA id z128sm85129vsb.22.2019.05.23.12.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 12:52:09 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 09/28] target/mips: only build mips-semi
 for softmmu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <165b1791-93cd-9518-e7d2-24f46bb152ab@linaro.org>
Date: Thu, 23 May 2019 15:52:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4z/e5UTNri7+

On 5/23/19 6:25 AM, Alex Bennée wrote:
> The is_uhi gates all semihosting calls and always returns false for
> CONFIG_USER_ONLY builds. There is no reason to build and link
> mips-semi for these builds so lets fix that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  target/mips/Makefile.objs | 3 ++-
>  target/mips/helper.h      | 2 ++
>  target/mips/translate.c   | 8 ++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
