Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4476724wrv;
        Tue, 30 Jul 2019 07:54:21 -0700 (PDT)
X-Received: by 2002:a62:107:: with SMTP id 7mr42675614pfb.4.1564498461847;
        Tue, 30 Jul 2019 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564498461; cv=none;
        d=google.com; s=arc-20160816;
        b=h/AkHypkA5o8aWXVdGlx4OhkLiRJowJ4V6JlZOgNrTdA99p9Sa7k94Y9gTZLf5Dhk+
         JGTYXX7kvJOlM0uMzrd5riL1mZSWkFOFHwvG7Kbi76YtnyL4LUCguXeZp8TVnDQ/hSfi
         yTtHAFG3w/wAm+Qlq61aSgO9IbJFqhUelnFM4ohA8TVE/QQmOUsXUIWHOFpP3Hnmevc5
         nPJcNyrp41mSIUKh3JByXHWeeOaoMl9vLt/6+eRsz50vfGw7YupxjHFs0BfRLOi1WXnX
         prBweb42wSe+1jNFoh5Oex00P0yR1Y1dQZSmulyx4dIWhyistwa5A9nIJDk6aJGuZUb/
         SIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=lLkaJ3wgFvcEuAPw7ikJ5rmvzJ8As6bAxa2G5iVp+/E=;
        b=KHnaVTbeswHMZm6yW6MiZYKVgphFhwnzHCU9lZmS9a6XxRsJ3kZenjBLouuQ1fcre4
         0G4vFpXfPSqi5r4BvlXmpVwhHbTk0y04+waS9wqfZs1Wmjlg2aaiCHN+jWR6/LuBEdgw
         yBdLoq285Ulk7yhwE9fsTmzQEXD9BNcFRO9wBCVUeKmf1G+TvZdB1sNeveGnEJ35ovrF
         YMzOFl+tKsio7rsgjJcKlNkpzcwurhQWd2YKE26oOxq8pQWUbl/0N5tkY5UgPvaxlg9l
         07ehv2jAr502zSqDKx+spWo85UISKIX3TpNx1bljOznBwSDRtKbcMTWPz3Lu3nWqZAQH
         Vk3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AH0GvLYG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s10sor77747090pjc.5.2019.07.30.07.54.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Jul 2019 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AH0GvLYG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLkaJ3wgFvcEuAPw7ikJ5rmvzJ8As6bAxa2G5iVp+/E=;
        b=AH0GvLYG37kF5plDzvl43jiLzrrC0DnRDDjHlaKpzfKmjyk22Fj0VmS5s7G8fVGbj5
         PaB99FgF8anrRZ4rhr1VE/xpCXz8FRa9GA1tOMo8vQqET4JGoK1/Yr/v5Y3vsfXXYJNb
         5RptY5WBBBhgDMGhF05BXvnRCE+yfOLw01tturUgjsIaqZ0uALorYNnvzP3AvE/VMypm
         R+Y7+EHY1fabDMXxIJD+JxJzU49YMVG6tD0v7/4CQ5JbC8XGFYT+zhZ/5ugX+33PNQ2i
         gjbgyPDyQx+R2fmrLeB8rCjsTab1yNe7QdkATe/vLYaWo2MEPq5M0ezEgD/UJGSrLXlP
         TAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLkaJ3wgFvcEuAPw7ikJ5rmvzJ8As6bAxa2G5iVp+/E=;
        b=uGDK37xmOqp2InwCgragAbwsedz7oADP/eG0HyyzK5mJF8J7bchVikmaGBrDUlt6EC
         wDPUKrTsc+LmrHc1PanPMUm7ptJRnxibXfni107pWHkPAfsbCTEFPokDD9NwteuuSLH9
         Tzo6zvZQqRIZwfEa5b9hkvdWUvXohtib4LwcaiBNdLXIR+wVN0YhIRyjcMp2mYHpb/gZ
         hm4gIX8+IBvzkbMC8vAF2EXuvgcmZPvu48qsgGzSOQgxqquO8+QdpcEbLKET77ZhN6/P
         It4hrmBznOGN6L5GG/S6XZ+AJbUa+uKP4VkB/Fko1MqGFHN0NaysA3MYy34807BH3B9Z
         uzvQ==
X-Gm-Message-State: APjAAAUWvJt5TMZoaUxt1Ql73W9Y/Hc3Bs/8P/9+CkhgqeQvxULrIz84
	BR8uTVQmm9Jf4D7KdSlFQxdo4xN31N1eqA==
X-Google-Smtp-Source: APXvYqzCUJgfyVYv/LynUZ7w4X+HENloQlavokj2Nsq9w7XlNQA787qXtKVbAL2l/5oyyTgvcgYbTA==
X-Received: by 2002:a17:90a:cb01:: with SMTP id z1mr2628925pjt.93.1564498460892;
        Tue, 30 Jul 2019 07:54:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id x65sm65132285pfd.139.2019.07.30.07.54.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 07:54:20 -0700 (PDT)
Subject: Re: [PATCH for-4.1?] target/arm: Deliver BKPT/BRK exceptions to
 correct exception level
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190730132522.27086-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6788a31f-a46a-0fd3-0513-a2fe558d0703@linaro.org>
Date: Tue, 30 Jul 2019 07:54:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730132522.27086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 5+y9FSBMPZLR

On 7/30/19 6:25 AM, Peter Maydell wrote:
> Most Arm architectural debug exceptions (eg watchpoints) are ignored
> if the configured "debug exception level" is below the current
> exception level (so for example EL1 can't arrange to get debug exceptions
> for EL2 execution). Exceptions generated by the BRK or BPKT instructions
> are a special case -- they must always cause an exception, so if
> we're executing above the debug exception level then we
> must take them to the current exception level.
> 
> This fixes a bug where executing BRK at EL2 could result in an
> exception being taken at EL1 (which is strictly forbidden by the
> architecture).
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1838277
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> At this point in the release cycle I'm not sure we should put this
> into 4.1 -- it is definitely a bug but it's not a regression as
> we've been wrong like this for multiple releases, pretty much
> since we put in the debug handling code I suspect.

I'd lean to putting it in, fwiw.


r~
