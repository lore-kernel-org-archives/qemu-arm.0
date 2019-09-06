Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp811671wrp;
        Fri, 6 Sep 2019 08:04:03 -0700 (PDT)
X-Received: by 2002:a02:b882:: with SMTP id p2mr10622389jam.16.1567782243159;
        Fri, 06 Sep 2019 08:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567782243; cv=none;
        d=google.com; s=arc-20160816;
        b=bYmxY2tUBFY8SEioXQ6YKb+Qq14bYPTJqA+FxcUTMMhSwy++BqAB1/Ua26+TZOwhm3
         SQf5rs0I0a7pJZ6KUEblFBxX0W70XZSwmSstyLlS1xDfTeIzNFshk723ZQQ0zrl70ZWp
         PPcZzky6UvW+qAONisNeg6+F4LQgpqZbsi99RIMUBXE5aPEcVNgCoN/VcqLMKU++oE1X
         WkzayaDVFghGnKs2bkbx9MmCI4eq01qD9l25GFAQKDEvm53PaF7w1cZ2bA827QsZ6oO6
         mM0GpxefU+8KNxr5UaAdjXt6kUromIvksAJRQMmPO6jjfmlEBWE7CJ7LRMkE5JOWw4bk
         PJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=aezTh+2CCztN2KsEUXj5ct2ukC2L7Qso7Ma/IlDFJRA=;
        b=aXSM/6QAcsZr74d+p8+o8PFQw8HYMcEnGUN1z38dKv/GNRgbgL6YoT21GkuLmShpiN
         YdpAfK33z+4hjLcBI/Tv79X+a176p93DqGLtKfTPNqxXmV4b53uqmqOYaasros0ljD0O
         yyqPPv950ugj43JyN9Abki37kA+pxoisq8gtIDsz9bqcgTUcnsUwynk/Y+Z4NH6Y17CE
         5SqzlQ/DhzGpJpOBXncJFEkN+mPoBcPDgMf7UsNRIemS+NJ/eXrsQ2uv5di+GA+75rqH
         ChTGmw1zc2FrnQS1NKpT/ovMvGUKsGlvY3/qg3wlybWqOj8QMw1Wdqa+VpS2RMQhqhRF
         86Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNBfaetb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t1sor4424666ios.74.2019.09.06.08.04.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 08:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNBfaetb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aezTh+2CCztN2KsEUXj5ct2ukC2L7Qso7Ma/IlDFJRA=;
        b=WNBfaetbpfibF80OVg0BoN+AcNHsA+nlVfxbxWyqMa5ogLZrU7Vep4fYHs5Q9MwUTq
         OjPmCcUpNg4w7je54Mgecvf7S7zXP0qTplIzogLpnS5oC4H2V7UnAPgcYkGSaBxuqWVB
         IzALlazfYZ2kvg6qrHoCJHxQ+ag9IFkwJJCL3xgWRG2VSibTrLKpPp4W9I2kfnv7zheJ
         3ZgXkhD2LMBZUw8vtPLMV/qnPxJnNwMbHqMqonU+BGs5HKgVW5IbDj1F8zHI4/ix04bg
         V0LsftPcz6WmfGwIskAexMoLVgnk9YQ6hCibfOU3vvWpTYdg+rbSaWN9v8FjYGvCY8xs
         OxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aezTh+2CCztN2KsEUXj5ct2ukC2L7Qso7Ma/IlDFJRA=;
        b=qDLs2riwLDvuevYDbhVKyvWOHOFf+h73qfTrYuDpYVQ+uhQF2S0ZTfmmS5AT7UG4RH
         PBPMz0M3XH2nKK67FtgXi9ODbqB7qyY0PBleAN4O725KJSW4nu7EETbJkY+ZrxLZOzZ/
         wi5SLi6iS2ZvcDCs2wYoilcP3x+iYM9TXRA6SvOQ5KTxFfAd+GC8PDudI8Ap8YthglRK
         rLeC1Jzvq+yElqI0Yi69NY7+WLkCDynhnZojDCLN6MsdrpO/Z9xEJ45yryHVVPTRjg8d
         9qNCws2kXx3D9nICRgvDUH0G1NzuMx3mlj2r0SI4i6l0DnGNjcdxt2BVjmrrg6NJNH52
         gqLA==
X-Gm-Message-State: APjAAAXfSIvqLsEIs4YiRX22/65F0K9cE10SqEg8P5iEg2E0TF9Tse2z
	2c43g1Zjgme9NauXptUB/uoZlHs2uPR8sn6A
X-Google-Smtp-Source: APXvYqxbaMRE1pVk5h1QF31v12zpAAGmEUF4Igl3s2wOlSy6jC0EfE+SWPJH3Gq9GqucYVMM3i8Viw==
X-Received: by 2002:a05:6638:155:: with SMTP id y21mr10521182jao.112.1567782242626;
        Fri, 06 Sep 2019 08:04:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2607:fea8:a260:81:78cf:74ad:c2b2:73ef? ([2607:fea8:a260:81:78cf:74ad:c2b2:73ef])
        by smtp.gmail.com with ESMTPSA id l8sm3800042ioh.85.2019.09.06.08.04.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 08:04:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] target/arm: handle M-profile semihosting at
 translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fd822874-4ffc-3417-d0ca-b82316de53b5@linaro.org>
Date: Fri, 6 Sep 2019 11:03:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906124706.19145-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: I9XmAIRdpbmh

On 9/6/19 8:47 AM, Alex Bennée wrote:
> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
> +        semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        s->current_el != 0 &&
> +#endif

This last should be !IS_USER(s), no ifdef.


r~
