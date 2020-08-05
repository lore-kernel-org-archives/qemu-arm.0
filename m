Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp758559lfy;
        Wed, 5 Aug 2020 09:13:43 -0700 (PDT)
X-Received: by 2002:a63:4c48:: with SMTP id m8mr3708205pgl.290.1596644022759;
        Wed, 05 Aug 2020 09:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596644022; cv=none;
        d=google.com; s=arc-20160816;
        b=dZCg3c0LiUstc2frqJq5M0r94eXncQh9Q4c/ByLAVASvTXhWMtax7vtf9HQc9uo+Tk
         2lzJRalufv9aLlei+Gbb/FCY1waeQuWGFi+2WjkXq+tzsTeLEKY65BYuny5RxUPQDJ16
         HN23ul6/fXwx/6huQyqUYLa/XHtNtFKtivLP27wotCkvoA64Ob3+0WQyC/F7MjrA4c78
         5zs8qijF8piMfFwkHeqI+7C2ej20FBxDGy9AJJOnPziN1PuSvDelN/H2HcS6PwMtfGbG
         HEYmU6ymaDxeEf1zUfRDbmO44MF+yi/qM3yx+K0ZepHjEYFAX4KK1Ei47fZ48EsNptk9
         U0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=1znVNOxtsb12P2bEtHCMxakeRtG7wQdoITwFpnpBvOU=;
        b=YRejcRnkzlIBdgX3SJJffGpkagwpGx+dkkudBlDXCROOiKfgfEtI80v9qq0AajyWBj
         7touJr5pCB0qksEoQWyOrRxX0WGg0aY2g4wYn3xB9o+mUyn35YgPgAi/7G+dCmhwrPEO
         9kElKLLlGjEXLliXSeMWaDUQt7DQZrGY439ofJQXs+khZ+NhXUnpsBiIF6CnzcTZpSC2
         jwJHPb1x8ysxxkY1Io/ClsMNg8UAR09zGJk7Sx3B/iKhEb10tSOrXRZoqhbPVG8eKTUr
         dSCfx2dwANf5l8F1JVf4tM9gyp9vtAedCLJn48KpYtOTvSpvxBJCvkqkbFmjx9wD42Tw
         h5Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIDfFLsw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a5sor3225830pfd.43.2020.08.05.09.13.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 09:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIDfFLsw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1znVNOxtsb12P2bEtHCMxakeRtG7wQdoITwFpnpBvOU=;
        b=bIDfFLswQnXkTCzl4WxLkLYoNk01tjYmsgKg+hKWJ6CO71QWUSC3vR2g1B1/kbFwOt
         icUCMYfCyoy9IAj1fpnMOjAeuJZG/frO7F4AjCpBmsvi1ilNWkjp37rSWTkbe9c6aUhw
         kO2RsgU2JxFKGtz8X7UZSRwwZ+jzSfMYYwtpeHSr2O2oIX4zlpEhOj+FhzgwRiqaCw8Y
         8eEwUmGNY8DTMoE52laz7E5MHMk7lpfwa3zw1p/TA28/q7uOJ5EYwYUhkrGS/UFseHB8
         Zp4gSpVdwW4NGwDeJUNyx+pz/WiVeBbMCu77604imf+L4cXM1S031vi4oXo0ygy1bITm
         NP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1znVNOxtsb12P2bEtHCMxakeRtG7wQdoITwFpnpBvOU=;
        b=SNeakk4uEYW/jtYhy5Zn8PtWRu44ctPgfiyuA4UBsynOYgzaGmofA52BQO6DbYTGY2
         U4AvAUvOI1A7A7JIrhHzAfamYnY0snZH6QutCLunc3naMfsujTcJYR8H8FQEA6UF8Lw7
         RprVWuVoOC2OUVq2j+9CNWX5oaeFO1xi3C+CcrcpoiZMd9uNdzD6PGqNWLCeEyRQA9B9
         kytO/dcHkZ3TPGORVn4iOdKLKUUjn6Z+qYzV62rP0nXVlSnVzeBcdmqyKoLHS+OawsIs
         5edYoPOm2yNx5cA69PybMxIusDIB+y6BpQKJBiSPSeP2U31W8+FuXPUUIvrIcQNCTA/D
         tEaw==
X-Gm-Message-State: AOAM531fhPHc9tdnKYx1NkCAIQ07A3JeM2KpbBR+fygJ8WHLOga8g55h
	nzVjUQrpwtLS7SILd3C2GK+eF5G3+IQHzA==
X-Google-Smtp-Source: ABdhPJwMWQvGA3ylvmUl+k89rrnweJFTocqWJTZGd5iHAHj36IW95GURc+2plaKMBqxcUg1bcRvNxg==
X-Received: by 2002:aa7:943a:: with SMTP id y26mr4239817pfo.244.1596644021716;
        Wed, 05 Aug 2020 09:13:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id t2sm4324370pfb.123.2020.08.05.09.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 09:13:41 -0700 (PDT)
Subject: Re: v8.1M cpu emulation and target-arm feature-identification
 strategy
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org>
Date: Wed, 5 Aug 2020 09:13:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Nx65Z8Nsu/h9

On 8/5/20 4:08 AM, Peter Maydell wrote:
> Mostly recently we've been aiming for QEMU emulation code in
> target/arm to use ID register fields to determine whether a
> feature is present or not (the isar_feature_* functions) rather
> than the old style of defining ARM_FEATURE_* flags. This seems to
> be working out well for A-profile. However, for v8.1M there are
> a small handful of minor behaviour differences which don't have an
> associated ID register field, but which are instead in the spec
> and pseudocode just called out as "if this is a v8.1M CPU".
> (The major v8.1M new features do have ID register fields.)
> 
> I can think of two ways to handle this:
>  (1) define an ARM_FEATURE_V81M flag
>  (2) define an isar_feature_aa32_v81m() function which under the
>      hood is actually testing for a specific feature which happens
>      to be known to be always present in v8.1M, like low-overhead-branches
>      (ie ID_ISAR0.CmpBranch >=3)

I think (2) has the potential to be confusing in odd ways.  If there really is
no official flag for this, I think we should use (1).


r~
