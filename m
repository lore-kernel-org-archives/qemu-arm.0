Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp423110ocs;
        Wed, 28 Sep 2022 09:45:23 -0700 (PDT)
X-Received: by 2002:a63:174c:0:b0:438:aece:e2f5 with SMTP id 12-20020a63174c000000b00438aecee2f5mr29932943pgx.366.1664383523715;
        Wed, 28 Sep 2022 09:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664383523; cv=none;
        d=google.com; s=arc-20160816;
        b=F+WZEJnWtURiEnYkEoaI4Sh/Jp77MURX4hr/pdeR8h4nJ/cfQvYJ3jyxwneB9M5LwR
         CHxEfEA0adEkjvCyowkCLAKtTpcN6x+Im/MJuAuQKcVHDbXFRRbQe16qBENrSLsJL0HE
         9sDgXiOm3MGtjCLmDlQvtESmLvi75+9jzqIjVXxmnv3WQSIh0GxbuNY05tQBNq5DPEfi
         JMEKyjdDOdFJ2c16cIhuCed3Ve3FTXs5Zm4jQROMWhA3MxPqY+3LZCVyyGiYXH5IEIDu
         TSkiPNKrD6Oc9LL6SuVL6U7Zxapew3O29Ll7zOM26mV2tB4VSY/HByX1aDCDzuu6lQI+
         AZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+aoHudcY1jNsD3jw3dXzeUEmYywOkwMTvsN/+GltecU=;
        b=Eg54qLXFeRE3q5fXQ07e4tLWtbZC02Jj+G5sy57iTFAFJ5JvTuzmi+m6MWGYh5Z085
         a0clKn4ZGvizU7X0t9/xV+KFT4wzAf0BolBTRK3HJ7t4CqT1Rmzw4tLL+OQjnVB9DCkL
         reLjvWV2Cv2Yk1nqWZHFFGX+qmF1p0a3IvOIFV0ZpnXlR1O9CHjrkPuw4m0aLNGon11G
         jDj6gHAp6MN0emFPTiIYjSGIsh5Y8fbtHk6Gvw1/n8FWCuHHmh5XDR/41YbvafiPefTR
         fZq7criz0ZyUD3tgeOq4oV1a+vaCtmUjvD7xxX8CgNwx0ePL+Jgq0xnf4R8vFAnaCJ1L
         q9Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEUCmQw7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g22-20020a056a0023d600b0053ab9c18fd7sor2878880pfc.90.2022.09.28.09.45.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEUCmQw7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+aoHudcY1jNsD3jw3dXzeUEmYywOkwMTvsN/+GltecU=;
        b=CEUCmQw7qv9BcovKRJ/+c1EGba+oZFYbMLD5SytKPh3wXZpETqrAGPMuSZrlN9zAeO
         frvrkTG8r/NuYppmg2+vanhmuSj+RFaDy3JSHoHv2Psh+FjpmTNgqXjG2ah1rCL+SQKf
         +x0aWlQh0Zqj3yUaLBqCeJCdRuJsNSnbVLdB6D6HuvIPFKXXqBl5t7T5LpyLWkvC1953
         bWEw0IUDwfq6LBTTGKQ7/jet2k9kYjlBEXxEWklyg7UH9f0x4UWrYNQU2e4LAsgRAkiw
         TgDIHvPE6XP2YRg+hwbVoZozN1n1OT6bgKJyIx33lEjZMjLKMyOBthqYQ1pOSQzvyq7s
         mEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+aoHudcY1jNsD3jw3dXzeUEmYywOkwMTvsN/+GltecU=;
        b=sQMSRxi9JvTyjuvKWXj44lghMRVVJDwn1Dj8/eqOhL/DfPICU70lNxJYAknaf7fVqW
         U4mLjvMhrV4P9mkaZlfcqoETxZi44Cd3IlS18ZfkJqph/aliqZ0LzwFEt/h16BcCLdNN
         5pB6kRivXk61VbfDua5RBMJKkuVQda8meHneL2lDwtjPVbFoQZ0oLABw+txkJI0zzLWq
         IwrGF9AvmoRzDkEkk9ms6Nws0sVaGvVLkveBzwe70dG0m5wzhw//cAh6eGD9bAhadp2h
         cKc4H1R4l1xWlg2K5wjorW3ZxCAzNYMgpRRgRN2Ln9dRWj6PL/WwZJKgZe29xJ3+jXOe
         wrCg==
X-Gm-Message-State: ACrzQf2bB/e9H3v2WZUs4boFpKDTdjmwEm0tCOfJT3oc2alcHF8ZXJgX
	yiHf7zZsssgkkC/mIfF8VEPm+YgSeNXr67GU
X-Google-Smtp-Source: AMsMyM5g/GQCs45hUXl++v9aoalXf5wUG/aOD7fDCEeFda8EzO46xE5vCXhOg+r48XuHZQrYDhWO+Q==
X-Received: by 2002:aa7:88d0:0:b0:542:d98d:bf1f with SMTP id k16-20020aa788d0000000b00542d98dbf1fmr35427288pff.78.1664383523210;
        Wed, 28 Sep 2022 09:45:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090322d200b0016bedcced2fsm4037963plg.35.2022.09.28.09.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:45:22 -0700 (PDT)
Message-ID: <697fb242-ba57-e00e-d824-b32f2bfc6c8a@linaro.org>
Date: Wed, 28 Sep 2022 09:45:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/15] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tZdZ9R1KbzEq

On 9/27/22 07:14, Alex Bennée wrote:
> Both arm_cpu_tlb_fill (for normal IO) and
> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
> get_phys_addr which is setting the other memory attributes for the
> transaction. As these are all by definition CPU accesses we can also
> set the requested_type/index as appropriate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - reword commit summary
> ---
>   target/arm/ptw.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 2ddfc028ab..4b0dc9bd14 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2289,6 +2289,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>       ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
>       bool is_secure = regime_is_secure(env, mmu_idx);
>   
> +    attrs->requester_type = MEMTXATTRS_CPU;


This shouldn't build since you renamed the enumerator.
You should use *attrs = MEMTXATTRS_CPU(env_cpu(env)).


r~
