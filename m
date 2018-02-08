Received: by 10.28.71.27 with SMTP id u27csp4960wma;
        Thu, 8 Feb 2018 14:10:34 -0800 (PST)
X-Received: by 10.36.29.81 with SMTP id 78mr910097itj.53.1518127834692;
        Thu, 08 Feb 2018 14:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518127834; cv=none;
        d=google.com; s=arc-20160816;
        b=03S5CKuJnLcF4So6FUwLSJoXpxPfowqolCok2xoJGtdeGf9zSGckMXfrjaygsp3alH
         CK+i/HG0EIXmHntG2Mvnp05dMCM0sz/OJIUagEf8W8AuxUJJj6lZ3FQgl7L2qLQTyHlf
         T8Ev+f4fCPphvVW4+8UHbZvhxbEtrwAK2xjOaljtQ63IZ3gfJsUri9W4u0PIDKJgqXaT
         WuBUvTlopsqi69DEV1lpOTI1OJH6mZnxoKyU9c1Ur45oVmJ9ZThUwDX7g9A6omlVlfOz
         mYmShUyqTu/uXbOo8yPgcVGOtXEqk51pHpNxbyb2hu7r/2/fdLJp4ASYLGkFEFQRwsJC
         suXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=GFu353q2Iyn1cCX5NHtO5mi/Su87HhKmjaxeiF3AaKo=;
        b=cPVquGlD4Zy55QrPvRYPp74o9FK2n+RJftrnuvIn11QIoCxn8rSBBLaQ5q3TaEMT89
         D6bH6UMuHWEwC96mQ6eYQ7Se6aSbEPxlafUdPBdFv+A5HhQFFseuKVKipqj/leJvs8SJ
         7r3lEhgshNk4CfEyYExAjsBX0nimF/EDifx71s5finvLRLAjJfsOVWHJREonvr1tLCxi
         nh5ZDM1CLfbSy0TdsaJ6DGYQajPr7TtdN6deIThfSMtHJhLGexSOD/7k2204xja2GeFG
         N/NY69zD9nZYpt0Jzuku4NTowC5rA+lSDN4pwRFzKEGygqAKe6Jkma5iH9NSlVBbBDjq
         cryA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKNNGVOO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e7sor625697ita.42.2018.02.08.14.10.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKNNGVOO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GFu353q2Iyn1cCX5NHtO5mi/Su87HhKmjaxeiF3AaKo=;
        b=jKNNGVOOxZTZ4EoLqb+6/cNbwH2jz5MQK63GULASGW/Nz9wca+ZIfIiu5D/G3HJ0Bn
         FU9WQKG23Cko6oUf3CrmQ6pPJAlTa6bdb80Sw65+4IHBBixRCdNSOAqwWPXxsxktlinj
         jpMZ89+5VHr9sCfAL5Ojm+haMtYReyePibfRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GFu353q2Iyn1cCX5NHtO5mi/Su87HhKmjaxeiF3AaKo=;
        b=OSLAiLrJ2JBMovQ/f3bP80nQY47lq8XvdKWx0GA+bQO6o7cB17iVvM/4KXnsOgjz/t
         WUOgWcAL7mZRsUhbLkNsiE7rQLmWv4iSm4+b45vsQtr2jM6JLLYfZIXsRf7/4PrOoC2O
         CHj2qw9/4QNV0AoY80PJSGCwgu3Ss3tWmvfl2NsDE+QmYk/9EskdE+yBJixs9e1xYH1Z
         JXPOjsEkB8wR9xwevB1SRnKxlm3SnYVKzb8AwHOZKO+WgZdEU1d79mWqM0OCEfjP9b9O
         D6F02y029lhbs3zBtydPjeWIrNppQq5A2RBaKkk+pAEp+S9u53JoD1KD683b2cgKUGAp
         fZ5Q==
X-Gm-Message-State: APf1xPDiABGuXPkphZ+FYJijTn3bV25Q35/HEUNmMrYYlaFFb8G6QBPk
	bOCsmmB1tsiaD9Lw05a/b711+W9B
X-Google-Smtp-Source: AH8x227sj2ENSw5x+65Q4bAxMQw8KLqbaEHCRKBL9E8s2S0GTNyT9cLOfX4URMmluMtikhGLqEG+gw==
X-Received: by 10.36.28.82 with SMTP id c79mr963432itc.128.1518127834205;
        Thu, 08 Feb 2018 14:10:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id e21sm720981ita.28.2018.02.08.14.10.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:10:32 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 16/32] arm/translate-a64: add FP16 x2 ops
 for simd_indexed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01476a36-ea99-e11b-ce2c-8752cc6e8b2c@linaro.org>
Date: Thu, 8 Feb 2018 14:10:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: M5pMzHCti2I3

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> A bunch of the vectorised bitwise operations just operate on larger
> chunks at a time. We can do the same for the new half-precision
> operations by introducing some TWOHALFOP helpers which work on each
> half of a pair of half-precision operations at once.
> 
> Hopefully all this hoop jumping will get simpler once we have
> generically vectorised helpers here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/helper-a64.c    | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/helper-a64.h    | 10 ++++++++++
>  target/arm/translate-a64.c | 36 +++++++++++++++++++++++++++++-------
>  3 files changed, 84 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
