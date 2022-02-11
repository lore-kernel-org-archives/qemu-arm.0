Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2577838lfk;
        Fri, 11 Feb 2022 13:51:01 -0800 (PST)
X-Received: by 2002:a65:6182:: with SMTP id c2mr2993981pgv.95.1644616261120;
        Fri, 11 Feb 2022 13:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644616261; cv=none;
        d=google.com; s=arc-20160816;
        b=huHTWG3BOeHgyzIri2hLLTRkDe0Is2okjmYtstnunlOxUV/ptKsaoxNkPzCll/tb5N
         YJ1hycWp84JzkWyKidFGHSbGBFRRt9y8Ek+eXTFhJYBCHRLifzCPr5GP5repphXRBH/i
         gl8TTYNSx9ccmfGTrrAa1cGfxCAdOkcwJ8vOodjTomAfapVsgmBxqiFq8qE8wOTOATpq
         dqrvaiQFxSJqR3ektt7B0+QOBOlFKcB0ReDOttxXI7kqYQpsXshS85CPam7A5ZtB24i2
         jwVvLZFN/D9sbRrbzj9arA4chVOQISK9UOEXzD1xvF+ebNgEpAQmI6YbqVEFVzV2dPF6
         7oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0qP1D62ghj4OUR82+nyZD7hsZP1iVI+3118AKwbSseY=;
        b=RR50pj3+ryuzNY3wtw2Y0CfvbjljDrgO3MZwroqTdExWlWoruBnqnjvIj7o/Vm84LR
         ewS4RhAgSZlK49K9o7PY1e0jYajdkqw8oN4zM31tWbiX3lqyWC4eAyZowgISzZTBxZuS
         70bWY9ULGjgBYg9uz4C15TaTkuOESyuJfE0/FBq/uY0Gso9B8onRm4d3Uqar0qFMKrHV
         phuuBRSowArtkZiHuyv0B5Hoe/Zt1NaPNj8hckhhgfEeBFjIdZk78dZ6aSNL/Lbsg+7m
         rZI8/x4LzdKwrG89Hto2ufUMTndMg9zHSj6r6QiqjM2CfR9lifSr7fXUiqqGRbZ5Tv4L
         Wy0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgEgLxph;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h12sor2699924plo.131.2022.02.11.13.51.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Feb 2022 13:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgEgLxph;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0qP1D62ghj4OUR82+nyZD7hsZP1iVI+3118AKwbSseY=;
        b=XgEgLxphXtey58ICoQJPtTUiF8xpmRfga4TouIi1KrtR1Q4H9o9KlhyVvHZVXN77D+
         Wl/7snyAGwFG3wGCcrQqK1Xm57qMMy60pIwF8ofTFJ5TAZv8Wfcsq+PoGWbF/A9yD2My
         D2EX/HcB4KG2446NByHp2VF9wY7oyvo4sQzK/Il4lb7t3TO0aSiXT8gt1w7Sy3X1Eis5
         uOMhJXPhnLcAevwjPrj5avfUV31VJi5nsJEQ6yANgbTvzpU5BCDYGCpesDryjixds3ma
         5fiAZ9lyH1WQeGMmw3qY3EOkq4X8tr8+jKJJ1+UcKP9ZVT/nujZq9IUq843vG5V5M1Ni
         +U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0qP1D62ghj4OUR82+nyZD7hsZP1iVI+3118AKwbSseY=;
        b=OPjPI3qGGrnGthFSiAwkmlQX4LFJasciz0x3m014r8T0gM/5GiZtAcMvMp+5Cuk4se
         owa/7n5fv5RIGl5YQeHutZeo4HCngfXyJ7E1cmXkM/KF+eMvt77xQrh+6LGgCN2OD1DT
         jYbPV40VIJdu+SE4ZzZ0C82C/uCPooucMjJH8bYub/RFcTfrVLZWJDXdSdJZRv9DC9gV
         siLJeKnZtkAwHf54giDRjSVkmjOmlMjfUaA5Nw8OEj6WXH/7wLKU7KXE9mr42chZqUFy
         lpfB/hd7GCFQPscYQ1NyU4YT4huKURg71VqfoZUn0YwFu+iNesn8ejvTzW9GinLgcBWK
         OfQw==
X-Gm-Message-State: AOAM530gwZn9e604Y4T99YwqZm+y35DXM0CDLtRUiu4qPFQ5b8RFZLM6
	w2yoOw4uZV/k8TlzHGOtCebPsx4oFyW4rpnmG18=
X-Google-Smtp-Source: ABdhPJwlrMfFR3REefT1wJS2HKt435J7T8gLj8Prj5pq1lu+V9Jq0EvIlFWwVNHvJ34rfOaklV/W7A==
X-Received: by 2002:a17:902:bb97:: with SMTP id m23mr3301103pls.151.1644616260613;
        Fri, 11 Feb 2022 13:51:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.0.0.163] ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id d8sm30417004pfv.64.2022.02.11.13.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 13:51:00 -0800 (PST)
Message-ID: <1f319e1b-a117-979a-eb5a-09e8aedfaf62@linaro.org>
Date: Sat, 12 Feb 2022 08:50:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 09/11] tests/tcg: build sha1-vector with O3 and compare
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Y7qEpF5Epdwe

On 2/12/22 03:03, Alex Bennée wrote:
> The aim of this is to test code generation for vectorised operations.
> Unfortunately gcc struggles to do much with the messy sha1 code (try
> -fopt-info-vec-missed to see why). However it's better than nothing.
> 
> We assume the non-vectorised output is gold and baring compiler bugs
> the outputs should match.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220202191242.652607-3-alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 10 ++++++++++
>   tests/tcg/arm/Makefile.target     |  9 +++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
