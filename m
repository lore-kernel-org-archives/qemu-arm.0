Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8505848wrp;
        Tue, 1 Oct 2019 10:47:05 -0700 (PDT)
X-Received: by 2002:aa7:8d8a:: with SMTP id i10mr29097702pfr.45.1569952025286;
        Tue, 01 Oct 2019 10:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952025; cv=none;
        d=google.com; s=arc-20160816;
        b=PeRK7TMXBjR5Gq7QDZNpaeAh4vk4AHX0k7Lo3vMMHKzNvFzUqkSIcZxoibBLJ2vxJ2
         nDw0ApYKwp7awmbqtwcdKoD/aEWCdf6xdTihWDB8627SjDODVlyoej2O0ZoUAbDv4Mra
         +2NTuCr3lsFERIpKJ0DkS5MZkkukwDv4axvwBkvPwGb+JZ33O9rN+lq7gQRM9KOUdTtS
         RAiBRjJAUBnqIwGpbNDvN2MNEG9PvtzzGtlMQsxGjexmnlWms6FH6kgrEpLYz6HYpodQ
         ynSwBTAoSIEZfZIYmfmfCiYaVsWpD4JFEUw1XxJ9WTwRQth2tiktmfl1EuW8e9z/Xhwc
         4oAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Dw5+Plo4HhNnd148/i5R7IfjhCcc++n0+iY55oE9COQ=;
        b=Ph0KnNBCfqLL/IMX/K3OJJf+HY24O1jg3XzG2jm1d+tFWkbcH4MU9uGIJHplM5IhsK
         esjx9Q0GtlYHXkmocRKNbZCYKNp01KB1oT9gYMnD0jD8BX8bCbFRjnrMEe3W+Vxmrjbv
         7FP2WxdcAvSB0Tw4pDnW0tPxYVeNOHyNOPsbBL8GeHMDv0uadRmnFlcFJXEPzg9eWgu3
         +fjVNJ7YyQOMEMRVf+Aq4jyFb6id0cfwoK6/kyo9JgQqnaJCppjgRU7d1uKl4yyvujcl
         kmWZs3gOZUFMija1XFuKSCUsnbPjLOTLUyWSPWakrJqBAX7GPEFRpf8r9/Z8vTNUXcjr
         hCiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvFdxBL4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 20sor16105540pfp.4.2019.10.01.10.47.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2019 10:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvFdxBL4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dw5+Plo4HhNnd148/i5R7IfjhCcc++n0+iY55oE9COQ=;
        b=gvFdxBL44N1v/G2ecamkAds27Mc7ppkB794seBu2ovL3epAaClPHuTrehL6Q8IZMO1
         Vr57RjVEyrfONmiCZj2XETFwnX6Gblz1R73OT2rJH7bXHoLjr74r4uNOYtJcqUDrHUIk
         +RKdceg0slzV/KDsBRe0ewMbdEKUmjk84TRsQXJ31H88fSUrgRc7eRvK3jOTxxc8jzOu
         3IcuWVX8UxJqK03HtCc5gjrxLnvtyZNBINUlX78CjKYFlFEsoWG/ymQiEoEfaEw9IQow
         ptjw1Tmp3W7KjeI5oL3/7jHgToVlwtbGRAUaMu3Us6DPz8b9kCeHaIpatjLSlbZRHaQi
         U86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dw5+Plo4HhNnd148/i5R7IfjhCcc++n0+iY55oE9COQ=;
        b=KetDVf2rnjDpiVvOFmOtltb+wkZlbqZaCJDcAALWth4Y4jdvyM5p9mlwShY3L8oJbn
         vh8ATfnMkUcFHYbiRrciSfBnroXeQLS6llzhdRw4wKGidBwkgx9Cs3ADB5neTK+4zdvt
         AG1SHWHm9LtiTzdiAVP53n+0RJM/fBQFjYopN+z6mlNoYg0rfruBBA5NW0TXM0ugGxs6
         aeyx11VuPujuFu6H2Ebd/TyohQEGT5Zg6FH03q/mi4B22rwYgNizhAUGijexzBBwpFb0
         Fsy08jezzGmZBzEtkoyRWQUgRbj8ZH/5sTGxiTMbZflTQV4Uueq+kMg+POocjFCJuTJv
         oIWQ==
X-Gm-Message-State: APjAAAXLGCx3iHbuCJ7TiX6cy+CzNAEl0XFr9Y3k7j3/snyRLIyJmGsy
	UhRiDJBl/fSnqhpwjHGIf3lqVLSZ5kGTwQ==
X-Google-Smtp-Source: APXvYqwp3gU69k2umjl88FK9zrPIN/BiICOUzTOIzp4RAJpvowKdFirwcNFgwNCYAuczxiMUEYLZlg==
X-Received: by 2002:a62:1516:: with SMTP id 22mr28725141pfv.87.1569952024349;
        Tue, 01 Oct 2019 10:47:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id m9sm9343571pjf.11.2019.10.01.10.47.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 10:47:03 -0700 (PDT)
Subject: Re: [PATCH v5 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <320e09a7-3025-6f8c-d37a-840094d7d8e3@linaro.org>
Date: Tue, 1 Oct 2019 10:47:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001125845.8793-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: YvtU63ZnbpYv

On 10/1/19 5:58 AM, Andrew Jones wrote:
> Introduce cpu properties to give fine control over SVE vector lengths.
> We introduce a property for each valid length up to the current
> maximum supported, which is 2048-bits. The properties are named, e.g.
> sve128, sve256, sve384, sve512, ..., where the number is the number of
> bits. See the updates to docs/arm-cpu-features.rst for a description
> of the semantics and for example uses.
> 
> Note, as sve-max-vq is still present and we'd like to be able to
> support qmp_query_cpu_model_expansion with guests launched with e.g.
> -cpu max,sve-max-vq=8 on their command lines, then we do allow
> sve-max-vq and sve<N> properties to be provided at the same time, but
> this is not recommended, and is why sve-max-vq is not mentioned in the
> document.  If sve-max-vq is provided then it enables all lengths smaller
> than and including the max and disables all lengths larger. It also has
> the side-effect that no larger lengths may be enabled and that the max
> itself cannot be disabled. Smaller non-power-of-two lengths may,
> however, be disabled, e.g. -cpu max,sve-max-vq=4,sve384=off provides a
> guest the vector lengths 128, 256, and 512 bits.
> 
> This patch has been co-authored with Richard Henderson, who reworked
> the target/arm/cpu64.c changes in order to push all the validation and
> auto-enabling/disabling steps into the finalizer, resulting in a nice
> LOC reduction.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
