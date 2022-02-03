Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1584308lfk;
        Wed, 2 Feb 2022 20:01:12 -0800 (PST)
X-Received: by 2002:a05:6a00:15d0:: with SMTP id o16mr32499062pfu.19.1643860872309;
        Wed, 02 Feb 2022 20:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643860872; cv=none;
        d=google.com; s=arc-20160816;
        b=r3p5RLfaSmF4vfNUKGMmlk3FVeXaUCV5eR0Zg8qPYsUyMXCi3RexqtJw6AMzrj4omx
         tUbgNIhN2iQBA4S2agviDzKbxL6ORs1IODL/lhdKOnh52j7T3aEv38JpBriAoSOfO78Z
         MKboAOgksXcz3ds0rADmqd2CyaPHLEFbdqhatE0Zhb2CW328Ij+69evnOkI4xAWXnPVt
         8PEYVWAGHjUnek2l7wQmwj0m5uxBQyyNTkh2ygGW9S+9hDae3jHBkPCq6Va/zu0ldtKd
         +7csVzjvhcxZxwkZuVAQV1kLW1sI0pT/6pRjzlKc3utMOD/gL/LBEByJuRjVXfKR7JoP
         P73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=m5TUnOTjXqAXeMM1rZbgqSEAcyF635xpYbmeqW1M5oc=;
        b=sl0sxm/p5Pc3PwywmLEmsQQY9f3QMWS/3TTO5bKXf/jWpb6gG7jVF8xHbwElYdBIjw
         HWG2Ugyjs91cLlx3/LjmEwprUNkTGakawY1UO20nhCZdNYsHE9I0e9YavgrpNqqdWBs/
         836mB3nwyJEk1FIf7YKzALsQLZGFe3ecie9ua7WYLiaImyRDjfxIGBYDFhVjqIw3/l8R
         FPCLnboQ4I8n66dWuAjTbmidJkF5PYYKZ5QXx6YeXIiqU7OCYxZaHGciC/fHBDtfwzJF
         PGYymlNWl0+qwcVm1YlsB3ZkJnYzziT7uqOjxCgEtfS7P313cDR6gpXujelpALwXIeiI
         nYEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqG6hkXt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3sor9537232pls.173.2022.02.02.20.01.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:01:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqG6hkXt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m5TUnOTjXqAXeMM1rZbgqSEAcyF635xpYbmeqW1M5oc=;
        b=pqG6hkXt3MVsEIBsDuB7FCcC1NX3jmEhiH2PakGymJGFDcKt7dt3Tpr1aGv3JNleIe
         5/E5h7IXvxbqb97ID+mPS9zdazX5uiaou8/Nft7rkPcaX6qW9RYphCAVdUWKghRnrghP
         gCBufcHlDQMTa4B/7mjmMYkIYLjYbn80sOCBBsO9ZFum9RrgjiUTjH+2rJQmIyf+jsYo
         hngMwXNp6NrgLy18qCxOdRw7euL68XX1Rdq0R8rvCCyYqnswhBTd0caeavmp45wHhg3z
         VFkWx2UKLuZtwNbRceEmzZ6+4RhKiGaAPd3sQrKLYTcq6vtnnf/s5CoKu92/6DSoe/K4
         PKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m5TUnOTjXqAXeMM1rZbgqSEAcyF635xpYbmeqW1M5oc=;
        b=TJ4zzURIfp8AEOuK0AyCKqieWQcGBTnjoPKDLgDzG4wSYQ/KzagL5EhPHG+vmLY7Yw
         qA45iG+2xttYJ0dk9z6EEzOyD2hUj4Su3811X8huGAi1jAchDvMaEvhtu/V1iviUq2IY
         AAtZngpG7q/vj+cYNOZNwmZUI0BJBCXryQh1N/dHUKKzr4vmmw6StsT20PBSydfOGciq
         q8LPqFdaH17J6j485qGuAaB690jt0FgPUNdRYYN5BaPRdvkXLn0EI+X4wNOq47lRMRzk
         dd6UkYIuF4ZrxI3XLJIRou6cTsCBuNqwwKOfsWINMrPw92v5ZztmxdaeSnB1VEeOeFQD
         AU9Q==
X-Gm-Message-State: AOAM533wem9Smxse3XDWbsH+XIJrISlq6k6MH8dtXG1d50aPp4w/1KpI
	6hromh11wuj5023mO+C0Oj0Tua9JaaLCBD7OSBU=
X-Google-Smtp-Source: ABdhPJytoZuHtF2/MwO9uJrwFa6wjc0sTGqpvtpR5y63Lb6pfuHzBKJV8Hz8h50uoIEpIV8vo+QxbQ==
X-Received: by 2002:a17:903:22ce:: with SMTP id y14mr33295714plg.37.1643860871830;
        Wed, 02 Feb 2022 20:01:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id m1sm27606215pfk.202.2022.02.02.20.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:01:11 -0800 (PST)
Message-ID: <1b28ad76-f980-1bd1-4a73-7e4198c72cd7@linaro.org>
Date: Thu, 3 Feb 2022 15:01:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/13] hw/intc/arm_gicv3_its: Avoid nested ifs in
 get_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lWZKmkrWWpCN

On 2/2/22 06:32, Peter Maydell wrote:
> The get_ite() code has some awkward nested if statements; clean
> them up by returning early if the memory accesses fail.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
