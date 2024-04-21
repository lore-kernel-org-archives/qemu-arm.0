Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3716060ejd;
        Sun, 21 Apr 2024 09:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlT5D2V9oErK4JE7wqk6tT/k7iLpjLyvq+sSPlRyPNnY4qjz+Tl7C+vI1RZZEEjMrMsBa+Yiws1vLr/Sm+VAFRBOoC6k7R
X-Received: by 2002:a05:6a00:3929:b0:6e7:b3c4:43a4 with SMTP id fh41-20020a056a00392900b006e7b3c443a4mr9455549pfb.25.1713717554941;
        Sun, 21 Apr 2024 09:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717554; cv=none;
        d=google.com; s=arc-20160816;
        b=NLT86iNcI9TWFX85HO68zhCOMhAhS+9tA6Rh4qni/IQ35xUBTPzxC29tJSjOW/0WEJ
         ho/HLia/r+fyg7/OozNRDIMua6yzKgIQl7+AtNlKYfvcO7pCHdi2GrrngKhIN+GEfPsp
         NsD2lqs3pikAZ106rT+dUd9nbm5N+4n0ZkIU66OeQ2hU7wK9uw/zFX8hOIpdM+vN6EAC
         4mejFIYxebIEw4KpFMRfraplD6U79wTFyL65tsKesZ29OdKndiwrq+ge/D7rO4AIaIJd
         fRQGIiwrlvAF1boJpFOHR2i9xKTeV2fJDKdLDk9+E972UzkM/wHk0NCu51wADh0MJAzz
         jC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KBIKe8zgLoNCoWSrF2oAO7S40KS5rkTLrzC/jSW5AhA=;
        fh=qnCmUytkyerCwID4MAm9br9syjCZdmZ1Xqb0RrXxTqE=;
        b=fsvcm/ArSipXXQReCEu0TE4V6+8i74KHgbvV+wwkDqLl+7TR5ilAH3adFT4kH3oXp5
         4TZcICMo0iA7KlHtxAzhbihu27SisoeZor4IpgtBNoKGAjndJdAqxC+RJRSbc2CppYzU
         Rnhn+Zp7fl7VhiJhX4WOc4yrR54vpMKhLZtZsgHlLakazE61b/d4l2ccTRtXvOpx9ZyJ
         DmyXHlR9o6DIX+Zs+tyuWWY3OT14VkD0H1UVEDyjFfbld7D38gbCl/bWfIIxuLJSm5Ra
         uqMsTgHjtMbkA9+HW1qZXQNmMtJVMm3XFaMGgH7EYyT3p4FYknPIuDCHJqdHjaedQqZm
         xImA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v46PRksd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7-20020aa79a07000000b006ecfd9ac31asor8648523pfj.11.2024.04.21.09.39.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v46PRksd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717554; x=1714322354; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBIKe8zgLoNCoWSrF2oAO7S40KS5rkTLrzC/jSW5AhA=;
        b=v46PRksduvvGMFE51CI3M7vP71FDgX4JjZBquEizxim07iiI9t9do9eE5IOOTpX7cu
         bYoDyGTSLqGW4qCaYtsOZL4QTgNdRgiw+3+/lTVUm5Uc+lj+esWX/F19kfG/zrRCwp3l
         oupJnons7cJpP8DsGw62XPrXUDZyzUAsT+IlL90sunKalAa8yXEukhAWXHRWi7X3qlBV
         r+KYEQve6WoxxvGhdWHO8FEtcFMrWwoDJjGdJyileflieIimWs0rgpEfLSI5aIstDU8F
         Lv6YBKuCPYgDnbGzxzfOnk2U/STjf/jbtM/NKzi1Ym8/VwO7n5hKkqAUbtcteZ3A06+B
         y9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717554; x=1714322354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBIKe8zgLoNCoWSrF2oAO7S40KS5rkTLrzC/jSW5AhA=;
        b=idEFmfvAw4qMu69ORIay5YC0eqlfWn1hcw6VniUtP2FZcO4NXH6fUoCKMjIjRhp5OC
         OeS1WP4zFyM7WbNTiYP9ZUwbyazPiq0PYM5giiwP+CWXUYi7EDzI2pqP+6WjVcV47ZOj
         Rc9KnnW2xlPAkyRbvIeUdj3cMUl05wswJUH6WojUOUys/bn01Xk3MgEGAVRhKv45XEgS
         3jM0mfCq+RN/W2Lu6rFbIzUjDFqNLwuurhKNpsGOvWWCz1GD8wgT1jcdBeWq0E+zHHxk
         75YYEOQO5XmIsGAr0pLhZdnQ7uNFD9sjXgQr+Hu7+aCSQoLpNappLSHXjJ86XLLTZhQx
         RQqw==
X-Forwarded-Encrypted: i=1; AJvYcCXSMtSDjDgwAztqHniC6PCK12seHgf6SGwUg7rzyDRThWuGWiwhLRQFi+g55KMsAsQ96MWfeQGfPeo7QUbz/Iw+mJrs/g0b
X-Gm-Message-State: AOJu0YwdYKZFDOQpKONtayLgwjy53HcrOwIV9X7SQQ/gZFcXCa2YITvb
	rvHjJSR6aoXVT1k5clEZSYqi2x43xhAgXy9mK0QwSKyr162gvrT2pflZxIqc38gY5TjauYhcTti
	EdZU=
X-Google-Smtp-Source: AGHT+IGCwGjfAvYRcqjA2Bi2AYbsyA1QQoJSzL60PWGPM8M7/QMuG7JcYk5iQbZ3aKx71eqxHRHL1w==
X-Received: by 2002:a05:6a00:3a1e:b0:6ed:5f66:602 with SMTP id fj30-20020a056a003a1e00b006ed5f660602mr8896814pfb.9.1713717554235;
        Sun, 21 Apr 2024 09:39:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006ece85910edsm6342752pff.152.2024.04.21.09.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:39:13 -0700 (PDT)
Message-ID: <6cf18e2b-f914-4ae7-be96-8c9d469c48df@linaro.org>
Date: Sun, 21 Apr 2024 09:39:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] exec: Move CPUTLBEntry helpers to cputlb.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: moldmnNCDCmT

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> The following CPUTLBEntry helpers are only used in accel/tcg/cputlb.c:
>    - tlb_index()
>    - tlb_entry()
>    - tlb_read_idx()
>    - tlb_addr_write()
> 
> Move them to this file, allowing to remove the huge "cpu.h" header
> inclusion from "exec/cpu_ldst.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 55 -----------------------------------------
>   accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
