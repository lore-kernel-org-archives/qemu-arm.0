Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4007266lfc;
        Mon, 31 Aug 2020 14:18:38 -0700 (PDT)
X-Received: by 2002:a17:90a:4e42:: with SMTP id t2mr1074196pjl.121.1598908718308;
        Mon, 31 Aug 2020 14:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598908718; cv=none;
        d=google.com; s=arc-20160816;
        b=m4Cae1EqOcwwKy7ce/23wi+a6laYiXqqPx6h5Gjmo/82VIl9yZC3CCfHR+wfkxgZGH
         s81sKRtSNbo2EYIAbQU3rIQemDmcWwHJ+eGxSh01mgcn2Fk2Wwm8K/wIqnt9iyIgv4ex
         F1LMWoJbCqmS1ZjszBdh8yGvDOAs7wH1ffNry8CMA2kE4U/eeQSSQuLwUHPmq+cmgnIz
         EDIe5WMGhY5fUN87iYY5lZm+BfvfwEjbr8LLoqfPfQ14Y5q4NE1Dn/DMMhOC5guA4Ovg
         b6kOzYdFs9NJBuTgLfAvoElKMNGfJGaJbfpj2Ed7T2/IwoZXFCXIhrHm3M+BdxAbhbWI
         tC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lEAC0sSRDk8AHWvjEH7biZuBF1C2T1sYg1EOKUCzcd8=;
        b=Bq1T7aeZ9Q833ScYxVNKLwWjBPHslN+CztOmyvtNOipIlD5yhUv68lgoUa4clUFM2f
         m5y5WBY4t/4cOke4FSvQusyZ7C+0JOW3B8izxbIYzvdFiI1ZjusmxtsajrAvj8ciCVzJ
         y16pqbOYFHYXOUVYh3i34iRF8XyYCXeCoZBaaEHiPa5Sl2EXBJFX78vR3iR6e+BF70ch
         UDZz2mji4dP/PCG+3CzkK3pXZ52ZFRBi637j+gYDnbLOHvesgpA4K3vt5v+zLQKUk3IV
         nBoZCkQHeRO4XQ7muQE6W3BMkg/HEmx3octrPWGPvyiCix7vfnkDmrb5lXUzxwxFHqgB
         jj/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UP+mQycb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m126sor3485630pfb.9.2020.08.31.14.18.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Aug 2020 14:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UP+mQycb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lEAC0sSRDk8AHWvjEH7biZuBF1C2T1sYg1EOKUCzcd8=;
        b=UP+mQycbq8qhOGg+R+Nbn2/6U2WQeAY/M+4L5sTvCUWEGJs5avlsdIL0ZL3d4iaX2B
         oGF4ARyvz7NWjpMgm54mhPHBC+3F2pg23Lxdc0BPyWx3/1og8RNy9dtQgRqkgi9sgBvx
         3jwc8MtsKPLmq0T8ODfiPDxIqxcSMpgmflmEuJJluB8pq6RiC8c5fDBR2AOynNmiwB+x
         EEQ3CavDNtNztvgUZM6c3IIn45Ssl/CVwBnwAECTSkyBK+0a4qRdqS9/W+WkCNxO4OgH
         9xf+Fty8ho4tZ7hPUeha12/bEybk3O7JBMx4SHrIQbYdw8bHLIhOUeV4ZRwtVsXVMrm0
         aogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lEAC0sSRDk8AHWvjEH7biZuBF1C2T1sYg1EOKUCzcd8=;
        b=PdrzXe4SFZogHPcJge9GdZ7p+54nsGqmk20QEXIoRSL9Sbm2Bbrb0eBKhWdQzWMWr4
         ok/RDDqOzuotjhEoohJ09nArhHJg6S6xyqKVAvnqZRHgyQIwd+qD1a4HW9Y3l3GuTCO7
         KtO6qQzs3hWt09sdDRldFFCsLqiBwlKyrq5K8TTPF4D8mJnGQ/caR+bv+NNCCqRcrWQD
         HAnZ/X760qB0biqJz8iniPU/4dIXEV1l+BbCZuFhI33qeZ8yAVY4OKNKALH87Wj/JWCq
         bx6m0ReRpbTr9OiHSNFJmyg0zV+KQ/VfMKVWfWT8zz5OtFnltuN2LQayVQoE6KGZ3gaK
         dn6g==
X-Gm-Message-State: AOAM5328z1szslVtw4Fr0jLm9/qksH8RQqgbesQ2dN9fFUAsVzL2pssj
	305dmWEiW/KjzD0CKbfMVwgJc/EPp278UO0T
X-Google-Smtp-Source: ABdhPJwob5F+J4hvu2kqcbA4eoWCZuUSVY7YjdaQZoFfEXrmRvMHTNh5NloGp+HtCeXEVBBVibWA/g==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr2776241pfd.181.1598908717468;
        Mon, 31 Aug 2020 14:18:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id 193sm8818709pfu.169.2020.08.31.14.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 14:18:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] target/arm: add ARMCPUClass->do_interrupt_locked
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, peter.puhov@linaro.org,
 pbonzini@redhat.com, alex.bennee@linaro.org
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-3-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <439e8b14-adc1-b7ea-edaa-d11069863007@linaro.org>
Date: Mon, 31 Aug 2020 14:18:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-3-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: f9PC/Dd0KqZR

On 8/19/20 11:28 AM, Robert Foley wrote:
> Adding ->do_interrupt_locked to ARMCPUClass is preparation for
> pushing the BQL down into the per-arch implementation of ->do_interrupt.
> 
> This is needed since ARM's *_cpu_exec_interrupt calls to *_do_interrupt.
> With the push down of the BQL into *_cpu_exec_interrupt and
> *_do_interrupt, *_cpu_exec_interrupt will call to ->do_interrupt
> with lock held.  Since ->do_interrupt also has the lock, we need a way
> to allow cpu_exec_interrupt to call do_interrupt with lock held.
> This patch solves this issue of *_cpu_exec_interrupt needing
> to call do_interrupt with lock held.
> 
> This patch is part of a series of transitions to move the
> BQL down into the do_interrupt per arch functions.  This set of
> transitions is needed to maintain bisectability.
> 
> This approach was suggested by Paolo Bonzini.
> For reference, here are two key posts in the discussion, explaining
> the reasoning/benefits of this approach.
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00784.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg01517.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---
>  target/arm/cpu-qom.h | 3 +++
>  target/arm/cpu.c     | 5 +++--
>  target/arm/cpu_tcg.c | 5 +++--
>  3 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
