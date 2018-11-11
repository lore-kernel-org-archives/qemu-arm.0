Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2063379wrw;
        Sun, 11 Nov 2018 05:58:29 -0800 (PST)
X-Received: by 2002:adf:90d0:: with SMTP id i74-v6mr13913308wri.181.1541944709361;
        Sun, 11 Nov 2018 05:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541944709; cv=none;
        d=google.com; s=arc-20160816;
        b=WY7ZciF0fO8H4hH7BwndOX4sC2IYp6DYC/PcH2Oqwp7wVXw9vnB5ch41SIq03cnBNo
         uAHPR5G8MrXUnV9bK+wIeW5BZpTt5/IyhYQvFKxu+uIpzp2logfFmX02S546Cp5+kKCM
         MhB7BPwIGh94j+CQVSeCNKDrB6zMszbC1eDH/Yn3ARn2boBGmR9CrzbRhrWLZ+aLXBhH
         6zscA9qYelslktDWVcxrkoXVfZ7w1/YOWbCnpY2+9tUjsCjeR9nQg0mDrf0TvKY0xa0u
         hGRmWoQu02C2V4L2Yt/1TGCTwAHMkdSpEpk9BbrDGTfiCBdvascn5I35Glhcu9WQn2LY
         BfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=buc3dC+tPcoK+k91Ko/CCaly2CL7yz+0wm9ClcAzBpY=;
        b=M6Z31NsybTXwY7mK6CLmgVsItntkuA10YuAxauaBj+/Imq5HCAnilw9Lw29mtfg4kt
         tcQyF6ElncdXPlsOu7JltewYr244ikUzlkw4dfh6sMKLJng2b+uYYW3SCnpOrvzgzCzR
         eG3Wyw2mL9s0zbYMvzwcb+qizdQAl4ZzjmN+ov81KD/ZDTx7MC/vIUh6pFYS4EZX4GlP
         +PsU4xlmpTlUEX4HCC0oVGLI5ezeNEbUAVqi2zySvrAsG+MlR2qnHHUAIufmk2sgCGry
         xjyI5kAM0khze1oYOD3SpMBxcceI14dHib0uXbx4CKar/qvJo2M6lP8MykgLBVvdEseO
         JELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WCUXrJrX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r23-v6sor3974778wmh.19.2018.11.11.05.58.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 Nov 2018 05:58:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WCUXrJrX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=buc3dC+tPcoK+k91Ko/CCaly2CL7yz+0wm9ClcAzBpY=;
        b=WCUXrJrXzEmevUoWR8z3L7l7wMsI0YIoPqLnckWjNf7HHTNbRyUUn++SZDPnLIn3WT
         M7WacDyZx32s1Qki+BTULGd5zZL6bxpBozuSRR2XGjStESEmPNfBfgNURFlamfZeZiZi
         yOspNYBdKeBlMVEZfcrpYL0Z/3sRO03GqQeCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=buc3dC+tPcoK+k91Ko/CCaly2CL7yz+0wm9ClcAzBpY=;
        b=nOS6HQQ6Nl/ew1PvdoF+OZMeh+EyeUt1tFN+sLuI4aHSUHaApqHJXZ45a34fsceH3g
         A+NK/cVu91FMnuNbC2FbI49QUxeWty3jnBwznZS3oXbHlq6XSmOp7HJqKwXn/Unw2cz3
         eOpeTY2zLpsyKGyW2QTh0wLwCN6WPbDsBbPGQdR5RsKI+d3Zuhy/tqwOFqtVFJ1st51B
         /udtAFKsIgCqyvK69ZZDGK/nNewJo1UU08LfKLS1OWeRe/6ff1UMfYfFMWkuIG+uLZ4H
         YYzCSyddw1PqgYx1Al3X+YYIussmAbrYYiXMzFLtca4hnLTLXtr3QlGEjqOk0a9pjwUT
         XGdw==
X-Gm-Message-State: AGRZ1gLIp3oShaCrHhkP81G25fF51/mPF4fHOUIZQZf/QkXPB5B9gigd
	6Xkhehu7X3lNtHSuF9HZ6XerUtHR
X-Google-Smtp-Source: AJdET5caMH/vHYdBlbrQ+virIhpho9qkwYvzXp+3mf7drbCBxOjJHf917GG8JeWuD4hy/mzpM7/idg==
X-Received: by 2002:a1c:7815:: with SMTP id t21-v6mr5304114wmc.13.1541944708968;
        Sun, 11 Nov 2018 05:58:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (151.red-213-99-169.dynamicip.rima-tde.net. [213.99.169.151])
        by smtp.gmail.com with ESMTPSA id x16-v6sm9291852wro.28.2018.11.11.05.58.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Nov 2018 05:58:28 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v3 5/7] tests/guest-debug: don't use symbol
 resolution for PC checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181109152119.9242-1-alex.bennee@linaro.org>
 <20181109152119.9242-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2fdd3469-12dd-c65e-d287-372e7f9a6a49@linaro.org>
Date: Sun, 11 Nov 2018 14:58:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109152119.9242-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BD8OlhaCsUvt

On 11/9/18 4:21 PM, Alex Bennée wrote:
> It turns out symbol resolution isn't enough as modern kernels are
> often padded with check code at the start of functions. GDB seems to
> put the breakpoint at the first non-check instruction which causes
> comparisons with the symbol resolution to fail.

If you want breakpoints at a fixed location, use "*symbol", which will disable
gdb's prologue checking.


r~
