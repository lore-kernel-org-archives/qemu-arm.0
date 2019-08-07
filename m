Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6682080wrv;
        Wed, 7 Aug 2019 08:22:11 -0700 (PDT)
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr8690823plq.146.1565191331160;
        Wed, 07 Aug 2019 08:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565191331; cv=none;
        d=google.com; s=arc-20160816;
        b=fm7TRJVfpoPWrDbr54ot8w0CSkut+4SGM8/jkTNt3bm6VQuA9b+z186E68fYE5pfSU
         3Dn+Z+xOUoqDB4JPkKzAKCr5QO0cnJyTAsFgxsgkJfHhwvDuVsNIMoxKG0ottULBFGMP
         CU9jREPJeEOT1L9zCwaRo20mSYzLuaDSYH3+uwCCb39FDT4qJWwM3Xsnu/EZzGyVUdgl
         0qEMGuxgeYGoLNv5jgtrCeKeL2+80AAUUUpDgsZZTRRla6wYkEXNBDcvPEKF91+hUu5C
         dgCYGskrPe+R5ks5+vtmweeLNwW044v+AASuId5gzANemow/wt0G/1K1MuNhBIeZ4fJz
         d6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=1hoAsKtF3zqsFQtWBUuvddCQSQZoJ0c/zZDeC2QkDLQ=;
        b=LbSdcR0HeYcwoSvMclpP+KzC8Jps7egdkEiotFbcfXI4S34y7gjw36AOKJAP0kCnRK
         kR+5+ph/SMSFpHnXjdUwAhJ9qn3u+7Ssdfa78+nBk+wb1cmItXXrLS7xZKVolJjzfBYU
         YMsDnBsnlGgrdAIxNfcmc8M9I/u+Gv2l0whAlKRlCAcKECWt0jf8i1iWjAFRuvlIvTgb
         7E+mRsLgQP9PapBhltUrnRVMBkNqCUgL4kPpMpCvFBSX1zA4oujkwGqBNU3PYhlhRe9j
         IbPlgk+nkHBydANE2QoHcqXbHoiZsmIpvwwMOjf5K1cuMWVjYLR1qOU/C9ZP7GIyR+6i
         kiBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXK2srHM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v13sor64568472pgn.35.2019.08.07.08.22.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2019 08:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXK2srHM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1hoAsKtF3zqsFQtWBUuvddCQSQZoJ0c/zZDeC2QkDLQ=;
        b=HXK2srHMtJIjFp5zptw4lQ5+DHWBgAnWrlqomT8WAcFnMVk7CryUbiO9gX8xJ4EDUh
         YDxlxZsmnQIgHolL3gqT+aYsxdmCiV7H5pgrxtpdefsfDL6j7rP/AcA3T38jfDH5dxbc
         rB8IH/iQC6jcLQdPxNGni2p0XlBCG6cMwkq3lWlvKoqcAYV/O1kpIO/N5i5hTwc6bdCM
         /Rl0NxLxBcSUzl5ZHMDpy+K1r7yjmz8ZfSWn8G/dAhzJiAbU6TTdlW8oNychR/yxuIcF
         5hP9GTveMBbEnVqOXdxQKcE0JzMW1kvsy/Sk3n70H2jEcUzS38WVn83Wnok2GwVc4hA5
         OuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hoAsKtF3zqsFQtWBUuvddCQSQZoJ0c/zZDeC2QkDLQ=;
        b=jy9cJDt3DFshW/TerLwLzTh/VwEr8sVnPElUKPWCV0l9Ro7QcRhQfi2GWUUGogmpRR
         F54F1aO72tSaKO5qk8lrrjncPJWdXZko9zZ9fJyUEVTQ4HO/9K+SZR+zj30uXY5i5u9f
         8G5n2uDyn0J7HmLC1gdHd/nTKVYQjCc+VGbinOvEbe84PGdk04Ernv23o2a0UY5ywPQ6
         w/rJVzk/2vw3ux0J0zefB1YRYdOZOVEhceqC8NzVXp+wLUis3jXLgQ7hoBHufVFKJNjy
         NvJWsiwzamNbW2BJS4YOlXtH0W0PJzviXD3BXPMSHtcJphpx7NLZLwzvNyhY19VhPV1w
         naLw==
X-Gm-Message-State: APjAAAUO+hlFIajDyExjPS+81tkDtYiTvALX8bIQWItiN8ibjHxKVQG2
	9y8rN7F/O7ZBC0ITGoha+BAPHkbT
X-Google-Smtp-Source: APXvYqyQ2n+QO1FiGZLqliF+OoioFWqgszZxmcr5zeQggc1PTBEXBZK8wsphLrtt/T2nkkS1HQbu2A==
X-Received: by 2002:a65:41c2:: with SMTP id b2mr8140986pgq.320.1565191330521;
        Wed, 07 Aug 2019 08:22:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id s20sm103427419pfe.169.2019.08.07.08.22.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 08:22:09 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
 <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
 <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <39a4d205-d291-8962-2693-6bbcce89c332@linaro.org>
Date: Wed, 7 Aug 2019 08:22:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: B2EQosIlkafa

On 8/6/19 5:21 AM, Andrew Jones wrote:
> That's a reasonable suggestion. I do like having self-contained
> validation, self-contained, but when cross-dependencies arise, then
> it does make sense to have a master validation function, rather
> than interconnecting too much. That said, for this series we only
> enable the qmp query for aarch64, pmu, and sve* properties. aarch64
> and pmu are independent, and thus self-contained...

Agreed.

> and I consider
> all sve* properties one big entity, so their validation is also
> self-contained. If we add vfp and neon, then indeed I was wrong
> with my suggestion in the commit message. They would need a later
> validation check. Should we just cross that bridge when we get there
> though? Or would you like me to see how that would work within this
> series?

While the sve* properties are handled by one function, they are not handled as
"one big entity".  You examine then apply or diagnose the effects of sve384=on
before you separately examine the effects of sve512=on.

I think it would be easiest to merely record facts while processing sve<N> and
sve-max-vq, with no side effects.  Then in the common validation function see
the required side effects and diagnose errors all at once.


r~
