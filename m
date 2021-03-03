Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5736344lfg;
        Wed, 3 Mar 2021 14:40:40 -0800 (PST)
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr1330277pjq.124.1614811239940;
        Wed, 03 Mar 2021 14:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614811239; cv=none;
        d=google.com; s=arc-20160816;
        b=cFdiExRjt4DhPALF3NsGeJt8tL3SXUwe6IaKS/V4OmZ4kSTWDiNitCVrNXwFg/jxNt
         +ZGwnpKYqVvro3ZkGwWR8/Dea/2LRXMFkrwerZ04Ddtap7EpKYzQHfq4EGgRCKZbnjka
         hHtdO5WiEwMT5Pft3ib2XGQlzPAh36pXi2hwGnF/FW7JqyuRdDiIOgcj1V4EwBjygxFR
         ZvoS6+Net4B5aerJFgVknAN8FrSeg9o2SAfpqWPZPqpcntlZCHyZ5Q3cM3f2LJGaA+iQ
         uf5cGqqW+1fvTSNt4xynx4VXGJqgwCJUChDcO84WnecyRZUAjhJ3PASFgNXGmp4NMyks
         HThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=19f7qb+y53JUvtjj49PEhOyUOKx4GdRkcZ4TxjovP6o=;
        b=iwug+TM0ugXmPxkcO7lDEB9wqSSIuYy4BguzAoE1xm4ECwYz2TM781z7LuWaHiqL8G
         6/9JdQfjo9XMEVoCClrkCNq+M69ba6xHJPK7X9LIyhV3SXLYLhaa+ewhv4kiF3jgwkNT
         YbFASGd2jN3uj+DL5JEfEeC3pJZsTSDtJM1f8rcrwUX7olbiZtXOpzPq/ghSRRFcTgir
         0TvpI6TdBAUMbwJIqqjHuJVw2Zgvmkl5nDgv7QN/u2jypf7aN7IIa+lBu+Ignl+kDkR2
         fgV6rHEy93eB6EClvAl4+V1t9gvYJvwkykYRr++teFwrz1K5fsZYR4g6cvXAnik68AdB
         2GGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhaYUznl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x16sor1791362pgg.38.2021.03.03.14.40.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Mar 2021 14:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhaYUznl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=19f7qb+y53JUvtjj49PEhOyUOKx4GdRkcZ4TxjovP6o=;
        b=lhaYUznlzNOKrWes0imFI5KMW2dlMouFHt4iXY3cFTZesQ93/nvsGsD71hc8XKmJdC
         lyZ7YdQxnksbQBl9QYqXnRB80OJb5iORG46eIQ0oUO00lyLto9ECyduBi3LmdMyzGMfG
         Xgp6WfDg2J+TYy3Ym6dahStrGKYvcFVSQ8WcHEMM1JU1R1NnDezxIOoLgN3IxJLSDXFC
         RbdUOqair7pVNpzLelzoaqtlmNDguqzJbws9J1CSdzNyF9q9UEzrusuKmFo/5yjAS632
         G2LINNT4sxuf/yXvZ2f8Iq+puikASA+O+Qkc7BN8E/RMMvLuNjJR5GvHkQeHaFHhisOe
         6Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=19f7qb+y53JUvtjj49PEhOyUOKx4GdRkcZ4TxjovP6o=;
        b=TM/opLZqLEO86B3+4dX1pRbC0zEZ1gCrxx78CwrnKIXplTwInO8cI/RW1ahwsiIULA
         SV+it8t6Yk7EVoKHPtdi1+Xm0VKD3sURbjmvwY6vgsMYauwOlESD26rNES9JWv+Ckuzo
         YxSxYPzek6uB9OKynb1vmIHDtMvxZgA9onYCMAd47pT1HEf0xU6ivpqwYtQMj+ImZJ0O
         eZi1tWWxdWsdbl61mWefoDSZQd0PC+6iLZ7s7gKt4VTwKhP03coy8TwQ6TX5JNtGfJPn
         MnXUgPxC3Xb1DsZAt57TD1+53YPCM6K2J1A7olJevstHw1Xt2X38O4EmYWq5LDlGLIW7
         yxbQ==
X-Gm-Message-State: AOAM530vg4qiCkPL5iBDkkj3eHVTgZGxWy0cS2LBpSqAKrzrNzFdQqRM
	k/X1X/1Vibvl1mXFLO0mAP5cLIwd2nM+bPsL
X-Google-Smtp-Source: ABdhPJwz/bMCHyyD7OIkvr3YG1CVZ9O5KF5y4VexZUR5mN50uLcJIePe39XM65mIty99NkpI96B+/Q==
X-Received: by 2002:a63:3d0b:: with SMTP id k11mr1023694pga.390.1614811239246;
        Wed, 03 Mar 2021 14:40:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
        by smtp.gmail.com with ESMTPSA id m16sm7568084pgj.26.2021.03.03.14.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 14:40:38 -0800 (PST)
Subject: Re: [PATCH v4 22/28] target/arm: Restrict watchpoint code to system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-s390x@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e09f8ecf-700b-2394-10d9-3320b57e4de2@linaro.org>
Date: Wed, 3 Mar 2021 14:40:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ljQjO2m3T1gx

On 3/3/21 1:47 PM, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 844db08bd57..ed3f22d78a5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4849,6 +4849,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>                   /* Some page is MMIO, see below. */
>                   goto do_fault;
>               }
> +#ifndef CONFIG_USER_ONLY
>               if (unlikely(flags & TLB_WATCHPOINT) &&
>                   (cpu_watchpoint_address_matches
>                    (env_cpu(env), addr + mem_off, 1 << msz)
> @@ -4856,6 +4857,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>                   /* Watchpoint hit, see below. */
>                   goto do_fault;
>               }
> +#endif
>   

Nack.  These are eliminated via TLB_WATCHPOINT 0 in exec/cpu-all.h, and an 
empty inline function in hw/core/cpu.h.


r~
