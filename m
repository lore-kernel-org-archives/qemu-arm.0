Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4556267lfk;
        Mon, 13 Dec 2021 13:46:11 -0800 (PST)
X-Received: by 2002:a63:581c:: with SMTP id m28mr914575pgb.582.1639431971350;
        Mon, 13 Dec 2021 13:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639431971; cv=none;
        d=google.com; s=arc-20160816;
        b=iMRB+iZugeC4gfrz6hX7H0MFiS+aDTJ8vIkg1Mrb7XNp26ND740WsCu4aEY3p6BEV8
         8r3LFNnyuOoAm1fZCZ8p1tOqyTNjmWyOkDp1tzFAb+hTfDtcjyXtK8nhzs45A/u+Gu2A
         4yA4pXoeL9nU8mswSkzsU5r79eOmhhvVKj/t8kLnS59sK31L/Dy50mfCBlrxeVhFw7Bt
         19BmUdTRpAeSfB2ANwfBN7bgnfhZpz4e2oFH3xn4cbS3iX2V3ub5qoD7mZCxw30L0t47
         /8/Nws8Ayc+IYVHP47t516yhHbYv/A7J7cDz7bx7410n1SjIp3kWzGCNqR0gfbTHKDZc
         8new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Sums4jjaLZUYbtVjwb0Co5diIbb3s+QyTdhpD/MGfGU=;
        b=hizQKZ2xDr+czjdcPsAGBtvTgaY798egkI8VLIsNnZHxMkDs6+8IESH3Yl6U9mKo6s
         QIKx8HTlENLzXdMuqC9XLJv/eYj8G8LdVeuxXnHWywq8/4kjX8EQLg9ML5TUVKPEr4aR
         vd/K0w42/72bCo/LhLDzpBAA0wvH3G3ASs6N9yFczXTDY+vlsOe/Tii65TuihPh/slHp
         NG84P4Jpm58QGJqr1BkzmzsuIzvRRiHlj7Id7VIKdCosNoA1xt9fzEjglceNRmF9q0s9
         s60gLxhAvu7ZWAF2rriRlscj/IFbCm6bmjB7/H/Ol4KpXJFxjtrPjsGywWmOVpOfosk6
         ePnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vluY1Ez2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j19sor2288790pgl.25.2021.12.13.13.46.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Dec 2021 13:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vluY1Ez2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sums4jjaLZUYbtVjwb0Co5diIbb3s+QyTdhpD/MGfGU=;
        b=vluY1Ez2wAhs2zBXffarn/SCY0PlnNQNqdY8aXhOLSv5HlIOyujRBdNpLooU4UqalF
         V1eAd1S5GLYACqI3DouVl1tdoy4dQVY18QFbt+PzUEts53aUfQO9iLPHPycKdsNp6Y+3
         4Qa/ttWsYbE3Xgsbye02AL/tzvqkcUgmOnjO+ISd8pNm+x3oeX7BmcyDtEz047PZm19y
         c55MFyOAiycxsd9fu1H1ZKx6aZKb/BOS0NGH61gGYHQE+Ig/0jG/fqvOcNtgr9qzY80H
         xPkZGxPGk1nsrF2LCFjh7Glu7YH0T5hnzLBZnS5L5bkz5ZZlsXRNoiYuxvveWBzgPGBQ
         Y3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sums4jjaLZUYbtVjwb0Co5diIbb3s+QyTdhpD/MGfGU=;
        b=CyjhMqXTh4q96KcwgVJDRY4ybp4oHS8MZAL4AhWCV2CYHxxmK1sVffqY5+A3UcaT5V
         MkS/QYwXRU4vIEnG6ubBsKBbZ3ZqSxRnvOD2VqcFkby6A6QLIIIqpWyZnl9hXIGRvGFa
         +3X0dKaGil+mVNST4bBTgRYk3iPwSwRaubLXpJOy++M1lcuyUdet4G/e8aRsOBb9LGfF
         TLrtsIAQrVv97BGvQAcI+Sa8mSjHaezkfrcl+DTNV371amRBbmSxJvCsK4y7BVx835zX
         i46U3cf3zMgU8OQi8cjzYxiQJNn5FMqs36NMA2q/um09uOsB3fc5f4rjMqdTQy9V3VR8
         ZitA==
X-Gm-Message-State: AOAM533mUeXWAlyY+57Q4lekQoVA5Borx5Lo+Qvd6ViQcMPI8I5vBnAg
	XQVAOUGqff7G7h2KYMAbgLjn/omT
X-Google-Smtp-Source: ABdhPJx3vUEmmTx3sbZ7AU8ls6Sc4ViIS6ZSYkR7Sglb7EEzva9WtPmEp3+RTZLNCHphGWUiW1Dv4A==
X-Received: by 2002:a63:1001:: with SMTP id f1mr877906pgl.353.1639431970863;
        Mon, 13 Dec 2021 13:46:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id hk18sm82576pjb.20.2021.12.13.13.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 13:46:10 -0800 (PST)
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Byron Lathi <bslathi19@gmail.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20211213182449.7068-1-bslathi19@gmail.com>
 <87wnk8i4x7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
Date: Mon, 13 Dec 2021 13:46:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87wnk8i4x7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9R/uEtnVZ5LN

On 12/13/21 1:02 PM, Alex Bennée wrote:
>> +    cpu->midr = 0x410fc0f1;
> 
> hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
> I can't find the actual value in the TRM.

https://developer.arm.com/documentation/ddi0434/c

has exactly this value at the top of table 4-9.

>> +    cpu->reset_fpsid = 0x41023051;
> 
> I think for the a5 the FPU is optional so maybe we need a cpu option
> here? Or maybe just assume it's enabled on QEMUs version?

Yeah, there's no entry for fpsid in the above manual.

>> +    cpu->isar.id_mmfr0 = 0x00100103;
> 
> the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not supported.

Again, this does match table 4-9.


r~
