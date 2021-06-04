Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1554821lfa;
        Fri, 4 Jun 2021 15:59:10 -0700 (PDT)
X-Received: by 2002:a63:798e:: with SMTP id u136mr7442730pgc.264.1622847550443;
        Fri, 04 Jun 2021 15:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622847550; cv=none;
        d=google.com; s=arc-20160816;
        b=PTQH/xIZ8+DcNS5uefFXDBhT34tmCeA2u8AYgOBTtA37gSiLp+Agf81vwXMI/U84pi
         xED6pcHfOyVnJl0wIX3ELHi71l66bwSp2PX/pHtrDkfaY/bzcIkXfidNy/Hg9y8lowqd
         MV2mVEAkQwtciPuvl/2itjBnRakfwhcbQ/NZ9W69dZA6iUxsVXuPcowYsEKxX9W2ByyK
         rqhwUc/WvXWU+nSeZn0JHUUGySAsFSkK7ImnCRpYnPW1dsQGXBpqe7dK2hZrkR8gqAtJ
         ZPw4plQzfzxjNPD4kqcxdldG/yKM04V7pKX9SperTrpmkxEDIhsnKdvvuCZLa8MVBdDL
         UGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Z1cTvou7oP4Ug7sBE5T9uYC4yg5lGy0Z6oF3grcBLFc=;
        b=lNSyQ0L1GlJ2cotkSzB4NYIfgk9dTsM4acQehGrL/wHWCoH2vEK57PegboLp4fxf9I
         zYCJD1J8eXC3B57n2x4Gv19JVB1tOn9uwdKZwJt49bB3E6vJM3uAA0+Q2/HZfZ24GY5X
         ClSnFvMmTnXUs7ewwpGe7o0gV90VTuxbCVTHMUvABsVnDLiWNj9ZfCqELsuhdVKmGPJY
         HPgHjqNPWmRiAexNBINAE3jfODNAqiujIbfWCFlAW4GSWyPebWF+fgHyIJtXHGZd+2aX
         NaNWrvMbEpPjFDIPuGr5ynln+shqvELPeSG5ljY7blFh7O/4qifh6IEvwWXai1GypSwI
         DpXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHtMccVA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w17sor1837272pfi.7.2021.06.04.15.59.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 15:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHtMccVA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z1cTvou7oP4Ug7sBE5T9uYC4yg5lGy0Z6oF3grcBLFc=;
        b=UHtMccVA8FLiIK0wO0uKZSkkiQxZEbksjYtEifl2vV3rI1fKa7xYCfjJKJPf5+VS16
         f6zwO9htrcLs04LGeWA2iSo6WcJ5EwIowLiRaGy+S5EK/CO5j2qzw4CN7KO4yEe/0auz
         WEMzSssX+vTO+yqCnn8t7L80IHbfgdU9odVtAwadcmfzpudz0rIZsLjJFhgPsf60kZUs
         11AuAb+EdWlHKrIKYceyIZM+gSdVa+Y4bN9MYP8M2Dx/bAH7WWj+8dQFj52J1nfdFygh
         aldC1S/dbouCvUSNEqeoU90ZpYQ5Gfj+xWgBzDnLKNlKT8wRLLEjLtTPzw/xuhb6eV+L
         pwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z1cTvou7oP4Ug7sBE5T9uYC4yg5lGy0Z6oF3grcBLFc=;
        b=NO1Zn/J+TnA2bJNr0Q42Vc7X2xMC/CLaFqvhf5anSSLkgF0T4703b3eDhoW2wa8a4W
         XBscKgngSPXdPvyPci2V+zdPT48Govqnpzu2aSFw9pb+orULo438W+roCTrGRdL6gfLp
         FKOyibxr6pKJkdxPgrGYobJkJw8wR9BRZvczSGJvVkLOzxrd6Eex/xHJVWPfZeHNR9oV
         Cmr0dLGaWzY9oFrBZnxX1JLVWWUb1m6AwAGJWNcFvZMRrFHrFU5my0C+r9L8eJvQm1NT
         BNA8qWWabtjennfDTfyU5ibIzno40CRpN44EaA3mZUoMETsN5lAgi32DwUmYahtHhOoU
         IRxQ==
X-Gm-Message-State: AOAM532u8QZK6hBhqEvEFJettV1KDP857MwMhIqy3GYPKmzs4r95gvEV
	ao7lCaXQSGmfT69Qb5ZlXm3VSebW
X-Google-Smtp-Source: ABdhPJz/Pud0OnWKyb1Ye5dFYyM7wZn4+PT6UgTQ/YVRo9UUYnG5dQqj1UL719U1D7xgTzBzU9kLHw==
X-Received: by 2002:aa7:8ec8:0:b029:2ea:32b:9202 with SMTP id b8-20020aa78ec80000b02902ea032b9202mr6548821pfr.36.1622847550009;
        Fri, 04 Jun 2021 15:59:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id y4sm2446852pfg.112.2021.06.04.15.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 15:59:09 -0700 (PDT)
Subject: Re: [PATCH v16 42/99] target/arm: split 32bit and 64bit arm dump
 state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-43-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e20518aa-eb77-c34f-cc23-c5f606457466@linaro.org>
Date: Fri, 4 Jun 2021 15:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: M19gtzJHG9XK

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu32.h |   2 +-
>   target/arm/cpu.c   | 225 ---------------------------------------------
>   target/arm/cpu32.c |  85 ++++++++++++++++-
>   target/arm/cpu64.c | 142 ++++++++++++++++++++++++++++
>   4 files changed, 227 insertions(+), 227 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
