Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3474198lfk;
        Sun, 12 Dec 2021 12:35:18 -0800 (PST)
X-Received: by 2002:a17:90a:c394:: with SMTP id h20mr39871211pjt.136.1639341318617;
        Sun, 12 Dec 2021 12:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341318; cv=none;
        d=google.com; s=arc-20160816;
        b=IkJtfxq0o4jne1uObQ259sAJ0mWqlcQKoyTT3D91pxVjlCPTo8YzEgyMz5IEVLz+Ne
         /xmi8jfL/e5v4+Q3YGt7oYQPWfD3v48Gz0RCCr6dsmLfa8IOHeTQ/pN2vCQ+ie9ViJA9
         k+I/88BO6xhF8CtGJvA4NQ07lFeQK0zPDgdg8p1iEGkV3AdVoaz0o5A0pyQA1QvLll74
         NqPY1ATipkcZ2dZ2aS87P16tpW+PdvJ1VR+qNjlM9vXG2roQaSbR5cxjZU0U2RXPVCwF
         XMc1F/2F0MIhpN10ph4j3N3vr/xpAMFPQmRsNdW0JsTOvivmr2ZAova4dT9vukFzcZF4
         koZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ZjsXg/AdaNT8UNAL+8owMlzcz8Ut+qb4zCi4vr4Aew0=;
        b=gi63isvpi837slXJQ1r1m3oaK9VG1jMQi5aBM5xQmC0YNB1G7pXLV2y+uIrCUfhtU4
         E/vBriCXdVJQ1yP7MdiNIV06DSyq2a2gQowX+bn8xIc+oMsQZxCxZO1XAapX7j761WwE
         nSH4+BVA0oZJvqZoCUQwKpJ3rYpYMvs94FpStYqCcxRw4bVquU7OPi1YIRlYvOUzZjwy
         Cy5+AQrYNKQaIb0QiePaoiQ4ampZ9SN+iFhahoKtXB2uXbo2KKsxYyZLN4S0PhQcpnV2
         XOrx4u6w3JU8d14R8QyAanxpFtbhsG+WYM/C3JfoXN1b4XfEQbJ2H+AFLvxNGQlt8RsG
         eRlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+YIfx49;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t9sor4210719pgp.31.2021.12.12.12.35.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+YIfx49;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZjsXg/AdaNT8UNAL+8owMlzcz8Ut+qb4zCi4vr4Aew0=;
        b=F+YIfx49uq1ArPNxYqbfXtipvTb35+MP1+kTguIcJHYpWhYXywyJfQlOFbhWU18uLF
         3Tam6DNC5EtcjLvandwu/KKcYS+Fo03BaxvfchF2xGHLKN3IEl+PVoIu6MYucBrlpEJ7
         3UKfC5F0Z/9Dzy/y/FAl+ODtG8ubzyOFYWMLYhsGsGNSfXf+73koi4SoG8hwS4E4NKmt
         sA5yMPHvcemM1F5luUzlZXt73UtuIacCAqXoKlCo2noqKbt7Xr413ebnp+RY+ygXNgDH
         m+5ih/ReR/lUpTAS61DrwRQySjOAWEceaJpoBbHoYGMKPW0jEHViMt6JBwducHY7/94w
         mPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZjsXg/AdaNT8UNAL+8owMlzcz8Ut+qb4zCi4vr4Aew0=;
        b=injt+37ja5cEqSZoYSH9TmNX7vJmwKaj5HGE356pfr22dUBPvgBQWZ8KqKw3cjzVT/
         YbxHmkCbHJN4X4FBewW2dO+Iz9JlcMHT1gzPTG3ZfGf1qnj6kJO287Lo6DmQPYclzyHH
         oRzteCbLVXAVTkLNVWM3/82Y6Pt0UVdJGPty1kUfl2Oo4jlVp5Qg7n8HOqLqruBP3hPD
         xYC+FTTVm/dt5h0o1CeFwwKd1m6vec6dzDi8Z64PD1AGjkJ9NrxNFFjJfg//5W9JKLhq
         6ZSPkG7wX2Z17tFQYtXXrfOkHAI6X/JWcFxfMDL92oC/OetvnFAnRO1sshTLxXPu2AFq
         iaQQ==
X-Gm-Message-State: AOAM530BZzGW3A+7TIBUydAz1wbpqk8O71bVANfoIwdY/4xAZcX0l240
	ITqHYD0RlodjY0xAF4pT8qVTnF/1blAdOKBf
X-Google-Smtp-Source: ABdhPJyCxgH4wR2WQYrIC5XwYb7M4nIPYvbhx+jzziv6Ofv7QDYjSGMk8xGfpTTHy2sXqns6WVgHJQ==
X-Received: by 2002:a63:2c10:: with SMTP id s16mr15149506pgs.173.1639341318166;
        Sun, 12 Dec 2021 12:35:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id 12sm4754277pjn.16.2021.12.12.12.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:35:17 -0800 (PST)
Subject: Re: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ba521f1-1080-9f24-e21e-3587f6f44c0a@linaro.org>
Date: Sun, 12 Dec 2021 12:35:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 64PwARLbOv3d

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 3 ++-
>   hw/intc/arm_gicv3_its.c  | 7 ++++---
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
