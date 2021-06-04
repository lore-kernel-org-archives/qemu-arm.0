Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1536884lfa;
        Fri, 4 Jun 2021 15:22:54 -0700 (PDT)
X-Received: by 2002:a62:7dc1:0:b029:2de:275a:9ce9 with SMTP id y184-20020a627dc10000b02902de275a9ce9mr6566508pfc.42.1622845374553;
        Fri, 04 Jun 2021 15:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622845374; cv=none;
        d=google.com; s=arc-20160816;
        b=dqN5mTlQLaFYMG60rjQG25o2YnlInrUnQowo0PLOOOnnKUc5+x3mRiSANeOWQEOiRD
         C/Pt79YwptfrTcRqwhgNLCeT/3p1hUeWzUGe40UOlRoW7mngIjK4kFZMJ/NoZbAgoSqq
         D/8ocUyqA6zEgrKIv3xs5dySap6lWLhmY1tqwCqoSiGctLkJpvhUjjw9XELo2la00aqb
         bwxJIyiUBPsM6XIHTrM0r1115IJGf1CEJayB6YuKgg9tH8ZCGTCyG5GULJLVS1pFLCFt
         RazyKhWXtZ5MfxkNM3S1Xd664hKTzzdDWmW6TZ9lby4dFmO6bgWpsHR/qskFxoGAncZs
         oyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/vVU8pBQVJDjKO3VMXMlpL20KJGeRAcgu4Dt+exOHmQ=;
        b=R2l6lKxQQZ4OB8s+mD/6hqKgQdkUII/DEedejMDpEt2vAHObBuJd6Mk4tOqIYs14K6
         pwfMgVBgnSx5JNY2HzpXqEkWqbLeoiKd1xgYfIqDbp4OzX96fTxpQJWzX+zG76Qy75NN
         KeC2llDcBNBNMJuIz0KHPz7j912I9q/ajRRnS+X5dympB2tr99K9g00SjHywUCwzqYUC
         s6rThUwDkfymS70uN88iU0UY7xvQ4eesTM+AARwTJTSN0ZUYd5gMiNQ97Z0tVwnmmE6M
         8jUzqsf/eaoDw9nCRYEAgTFUs+vmvOFB58eaVOsvFJxYEQZ5xMKOe+WxQl9KglclQH4g
         yRtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKIaX+gC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w17sor1805617pfi.7.2021.06.04.15.22.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 15:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKIaX+gC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/vVU8pBQVJDjKO3VMXMlpL20KJGeRAcgu4Dt+exOHmQ=;
        b=eKIaX+gCVuxaG/Teu7QlbOIbN/Aw/UBO99y4uGgsPM8b07R+bimkCHcGNSd6bXtSNz
         uCEXnBmf1GdZn+74gdYycB20X7yfSkE+LMeUEY8tv1MCE1iSwtabaOkFoCcOYsYsR9vq
         jyUiIb/UR2t1MjR9KGKJyWdHXIYoY6jNetGpEOy9ZjTTEBqBhECOg0bdha/xMytWLDWg
         2u62nJiEEch/KwNlhztoufE8A+MFz004EOFaILyR9khD7YAl9m/RABiJpwfoVWXHkMm+
         zexdh7o20EIQUi6C4PQh1KBH480NkqXqnggTDJMsSouKLgQvkSFdUTGoll1WHUTTUW34
         Z9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/vVU8pBQVJDjKO3VMXMlpL20KJGeRAcgu4Dt+exOHmQ=;
        b=QICt1Ux+BotGgBAfuskcJGGmVB8rlD38QWMtd4T7ClCO3Jq1mbqoU6301cIL/cis+T
         mq6B9Q9kTnDB3NrZ6YcelQZHYoJl8jlkI+9t2KVy0WjuCQU7+Pz5MIUo6RwoXAYDIq0c
         6NddBd0dxGVYqVYj07UGAwFTCSwztibEaDDce+D1WgTXJq8g7Zjx4VhAUnaJ/NjDuq0Z
         78xBbfbRXN6/qXma//DwphyzKx+a1nhK6py0c1YVGwi4Nm32wpa8MEMQR2gNrQnaja8e
         EckHExnqzEmXgmWr6acSPxbag6EiI8dODCQBImUr00WhnOx4MQBI1pSqHIrC2eUxSRgY
         zBgQ==
X-Gm-Message-State: AOAM530mqen1IyFQe+nxrrjje4vhXZ0z5HgkxDBXooc6/+u71gQbqN0z
	Rl2RwYT34cvEfq3pqGrRe0RqNVV3
X-Google-Smtp-Source: ABdhPJzMO9k4y8hdcfgUNgNYt4AzZTUpgVbKoOee7yIX9GgBNQOOQ5fbIj9S8vLm/awZCZSRhlyqyQ==
X-Received: by 2002:a62:1c48:0:b029:2ea:1c13:e229 with SMTP id c69-20020a621c480000b02902ea1c13e229mr6766749pfc.17.1622845374013;
        Fri, 04 Jun 2021 15:22:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id c24sm2574921pfn.63.2021.06.04.15.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 15:22:53 -0700 (PDT)
Subject: Re: [PATCH v16 37/99] target/arm: move sve_zcr_len_for_el to
 common_cpu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-38-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de00c5c1-6c76-7618-6c73-b8283736ff4d@linaro.org>
Date: Fri, 4 Jun 2021 15:22:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-38-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: G6Jr6y5f11a4

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> it is required by arch-dump.c and cpu.c, so apparently
> we need this for KVM too
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 43 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 33 -------------------------------
>   2 files changed, 43 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
