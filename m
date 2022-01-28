Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp64748lfk;
        Thu, 27 Jan 2022 19:09:53 -0800 (PST)
X-Received: by 2002:a05:6a00:1914:: with SMTP id y20mr6002985pfi.39.1643339393378;
        Thu, 27 Jan 2022 19:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339393; cv=none;
        d=google.com; s=arc-20160816;
        b=Nvj3HG9TPp5OyLoIy2vBU8/vbFj/IWanmu2AerAM3UhP7dLzh7JXEIuuZJdDIZpD6w
         K9rgTj6NSvBTJdSuU3ZYxU2d2G5IFGAsarVRlUf7KSuwxGndArmhECXcT+iAFcZXf4YP
         cUOb4beOAsjlKp461ZDoOxFfo6Ag7mYtnqfuueW2dcTQEbqxXtl4I1q80QvzH1Di+RnL
         gQ34fXkT8RktBmQE9bWdIXcgH4MPS6bqjAx3Ia6kpW/eFTNJzxL72hPoZgEBEWvL8NTG
         L1XpbRAHl1fGYZd/gGJF8/7sOO2xG3TJPvl+CgCox4Hk4ULk0fAuMFMEJlPkXROwhRuP
         gRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tdI7ViT51aX3rcnvbe1NlwhwZbYwlbpAsIbT2Jmsu+g=;
        b=Ws24R7sHL5jzcko82qrhc2nlvMijYIKAFfXv0J0+a0i0ZAEzTbIhbFutEtDuCNYtms
         dWOH/w49fzKXJ4EJJm0khe+NWsisnVkAedvh++Dq8qCErcyJx+3eFF9RRyophKihqTwh
         4ImpgIO5MOCf06OaXhixRgudCqBMZ8qzH95c/qyihZPGVATafUtz/hTk19laToUH8Zy1
         le6iJwCPXYDTdD5BnEcdG9U4Upptc9YMOUWND1Yadxj/j6InvYN5mK1Vf2iySlFPRVif
         yJp294bK/QiKlRWnbxJhYyuSOFPNYpjuBF2jmEKrjV7686g7msu7PegdmRNIBBfyvt5k
         LvwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bul8Ma0z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f4sor1913070plg.190.2022.01.27.19.09.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bul8Ma0z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tdI7ViT51aX3rcnvbe1NlwhwZbYwlbpAsIbT2Jmsu+g=;
        b=bul8Ma0zwKyn9xN9ZDwMvm3TnjgMAc9wkqSChf2WPqhasck4QC0f+QESU3Ag2bYJlb
         52dP37wXuCeTGKeDuZBBAFkT5xepufg989qEICFEMKFqC+iu9IXO66kFbAgcAGWidD0Q
         rFeOvj8q6RK137RtjW0s4NjYjrqMCQrs5bmYbERv+FDLKMzGuTs+vj/cMFLrv/HFOfj2
         C6pci9V1cBxNzBUod16UvasqJPz2Nk+B+aQkZGeuhZIPElMMnoi40R9PRkPaUJPjLRaR
         qMQouiYGzJWtoqIrvaAUOeGQyq66CQ/S20eznhMALQ1UsUrPLsDy83nbYdnuFsJuvlXT
         iT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tdI7ViT51aX3rcnvbe1NlwhwZbYwlbpAsIbT2Jmsu+g=;
        b=a98RC/D4mVBm7QnVe/dkCPs5Ahexe3srCJV41A3IsZOKncQjIcY7R8idNknyhGPHqr
         zXn0fd5zkfeBnk9EE86Hrvi2I0wWnOEHmtGvUTOYEFmFr2h/RphElOQMGyyeYH+LFqz/
         KkdmQ47COv4b2OFCFwYt9CqF5zifC0jaBa+JSOtVVyZWuS4c3QRrIOqYk8JgSUc+ScTt
         1p8irTsZaDcNVwujp8nnYxU/631kq8826IgNH6k8f+mOObxbcBCX5Fd5/POBjDHNkC3k
         pes+AJMYf3WoBkISdtM4XDfrIOJbDTwn068ET+ACOtl6thioxQ87bMIL6DvftPigBK7I
         uOfw==
X-Gm-Message-State: AOAM53046DiP1iPMEGINzpUhPDP19ua6mxcuZ5MtEjLPpvw+OJNlMBL3
	8BPQ8dUt9oknWyN5syb3byHrT2m5
X-Google-Smtp-Source: ABdhPJzImvaAr8Pm/BEZJBHnpKrBevcMobTrBkx+CvLcQYGnfiHBdeaQguDZp+e89rZVM1kDfwDvgg==
X-Received: by 2002:a17:90a:d24e:: with SMTP id o14mr7439755pjw.99.1643339392854;
        Thu, 27 Jan 2022 19:09:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id p22sm6685410pfw.139.2022.01.27.19.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:09:52 -0800 (PST)
Message-ID: <d49c445e-1a3b-64b5-0b74-d4e394cff68c@linaro.org>
Date: Fri, 28 Jan 2022 14:09:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] target/arm: Log CPU index in 'Taking exception' log
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tqOqKg+cNqrf

On 1/23/22 05:24, Peter Maydell wrote:
> In an SMP system it can be unclear which CPU is taking an exception;
> add the CPU index (which is the same value used in the TCG 'Trace
> %d:' logging) to the "Taking exception" log line to clarify it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/helper.c    | 9 ++++++---
>   target/arm/m_helper.c  | 2 +-
>   3 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
