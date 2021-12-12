Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3360750lfk;
        Sun, 12 Dec 2021 09:32:29 -0800 (PST)
X-Received: by 2002:a17:90a:7e86:: with SMTP id j6mr39201265pjl.25.1639330348967;
        Sun, 12 Dec 2021 09:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639330348; cv=none;
        d=google.com; s=arc-20160816;
        b=V/Cgt5mSLH0qs45ovRPjlOCPEeChC2hc5YueW9RWefn+k3gr9FF1z5k12+bWP/5Bt6
         skWAGBmnUEFiWaS3VXvjhTW/2g4HMJQ1l7CUpzKdAKl8NW/xsQGwSRJjsa8Of7aM/yj2
         A5BeC6qWEfO1p7gdQcb+lCFPwx84GuR+7lCnL/+PdS2cTJ/OPml1nJXK+Dq68Ut1fP5T
         sNVP0v+vpAhkZOI0mNGmWMthq997Q7UD1CMpTd4j8mxPlJNxjj6mFCQLOn8SNNj14KuM
         vqMERjz7a6jFFN4Hi/lVGkdGVtowpUo6MPhyGKKCqSxjS3x8XBCVW8TaAqplvyT23IEl
         PFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=XzvCyZHVDJNW0fY+aJXs29D+CLYKsLM8Ol29emlGVRE=;
        b=IslaQ68DOkrhdxAjoBDgNn4vY/Mv3L4hoLGMby1VrXKj6h9erVHhit38TpSoKW6ktk
         TfVwSdbvZeJ0YS3SN08CfWNQZpE+4Kg9X9Zx8mK/aMky/0z/L31SEegH8ZuDfyhkan5L
         p0Vq0ZDVWfvewlPep1fMbmzCioHe4pmBTdXqyJakuGrnm9Ik0V5hZDUCmt5TyHwXXKbQ
         SARz/JYpKM1G5BlDgMZHVtcd/x0I/NhYUbWJm+TtZnmUzm5MM4Z+QReJ6uT13hfg17xT
         RvPrFuERuXZrTD8/VWxAzUQxcU07q934hIWyqH/HUol4i8IbjrEXpHNEFCh5BvjyaykF
         VXLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iU0Hqs8l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t6sor4969221pfj.52.2021.12.12.09.32.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 09:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iU0Hqs8l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XzvCyZHVDJNW0fY+aJXs29D+CLYKsLM8Ol29emlGVRE=;
        b=iU0Hqs8lxgzUn9R6LLeE5OdGgnahZ66kl8TLr25ElOnVnFX0JRdJfuxdaKfFH+QY9J
         1WRXYs9OJWMmbBXvCnUmaoMKTSQA5Rv03Ospy0yOI62gkyKHk440z4uBQxQqn0pcc7cH
         ERg2biTjHfsvPVcMPcirIq8xqRYMQZlwb8alvaXuJA8hKcVCN3ZpNsE/5jk2CSsShDTD
         cxJrjDe7b4LrsN4YfEL9/Cf+21ZYq8xkfE5ritaN1yYV5eO8xa4OAGyHEelPx0ZyATWZ
         zqB0bgWFhnk0MBx3BxLxqrI5ERsBPAbCYwljMMh+mrVOhdatmkPgDMQTiUvEzOYY8xxT
         mO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XzvCyZHVDJNW0fY+aJXs29D+CLYKsLM8Ol29emlGVRE=;
        b=mPTXNGrq2ab0ndC24TfPDfIDa+GhaQ+P79mc8QfPlHUSJhNjqI1AloSyFfveEQmP3f
         hpg/zOzbe4nhtGeuxclpYSGor+5qAVTqU3msNamhHrVSmz4YWEdcHyoE6Rzd37+kJjDu
         RpdyrlYQzskyi4qZJEaDOxW3sEaYpuPVGlufiombmqeaBN8lxmZy8gipjBseukktbXPC
         651/xqCD/XL/+3oh5jhKg2QKr2jJj88xlsT4TIM+BHQ5JH24g62R+VWLG39JHu/aUEvp
         JVge84w8Rpnnn7p7pF2EH0IF8cLUqIVDcwQyFZCZcJ2AVvFCgzduZVuU8XK8zgvd2iRs
         SH7A==
X-Gm-Message-State: AOAM530VQpYPNOoWjcTkk323mp89MlGLlZajKFqZ1MR9fRtn/O02Z9vQ
	ukhf1exuU77O8/SPEw8r8HP5MugjhSNZ+4Yt
X-Google-Smtp-Source: ABdhPJxqme5Ap7z5bHt13QWJ0B4wSkWw8p8NEnAlMBsvua6tSkmY71vB5WZYImz+sb2483meYPD1qA==
X-Received: by 2002:aa7:9a04:0:b0:4a2:ebcd:89a with SMTP id w4-20020aa79a04000000b004a2ebcd089amr29213294pfj.60.1639330348494;
        Sun, 12 Dec 2021 09:32:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id g1sm7643655pgm.23.2021.12.12.09.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:32:28 -0800 (PST)
Subject: Re: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds
 check on rdbase
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1099d721-61af-8342-9e1a-e23ddf0aa8f8@linaro.org>
Date: Sun, 12 Dec 2021 09:32:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ckhuS7AawSFD

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The checks in the ITS on the rdbase values in guest commands are
> off-by-one: they permit the guest to pass us a value equal to
> s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
> meant the guest could cause us to index off the end of the
> s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
> would probably crash.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not a security bug, because only usable with emulation.
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
