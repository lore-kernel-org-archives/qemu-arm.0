Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp497147njc;
        Thu, 14 Nov 2024 11:19:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcr2sfoPZTETuN7bPNmxH4NGxEGEIjG10GgnrETjStD9IreZEk1FeSaPUmP3r3NX+Vt7ipkcXpAPrsEw==@linaro.org
X-Received: by 2002:a17:902:ea12:b0:20c:ccb7:df84 with SMTP id d9443c01a7336-21183e0dd1cmr359530235ad.42.1731611949839;
        Thu, 14 Nov 2024 11:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611949; cv=none;
        d=google.com; s=arc-20240605;
        b=MHDuVI/ECg2qJOudMAh65hxiYZs7gpsaDSBcpC3KwbvZfuCULPEJCq3fhwDoacHMf+
         K8pyXv2CQ6qgyki/PSmSkn2Plcl6Ja2CTHCZrlqpA2YIY1eneam4EWr82WoMZ7kIo+9R
         xgNZrlhXcE9NztKc/Jfj2uY5HbzuRHXhkYvH6XU/kbpmiRoLH0IgPUKNKlnNSe4iBbhj
         S+oFaJNteoji/ygG4r7xsFSCcp0bSrnyy/WOm23lvIGzNi6gaPeqCk2Jd2kUazTAHvwj
         n0Fuf1MD/LjhsJJK2XlxoUmlLbZ+XRYV+cOaHe+u1L1isLG+q/lzS1bAV+nakEFj+6XG
         ETig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s0Dvqfj9DowpfpWzoYao0iUmgeNJmjRhVc0tjP0hvOw=;
        fh=pwdD0F+bKQBcw1goeUkMhSPi1Q5jOxYUa+HMJzlZ79k=;
        b=RTb4xskyiLQnVEwDCcNGKZw6mplS4x8rS7T02C91Wj4Q7SrHyzpD9nEAFAaURUlYB1
         DsZafHJod1sZ0Qk6uFrYhZOHeIJinmcFlQBBfzFTfodLRwaRKGQ+Hz/9g1ngWfH+PHRu
         Y74LIG9T80kZAGxWi6cK7DD2cmstoUEgzs1OExwhoJRuvCTBNKkeXqr8yBP9ltG4NEMF
         obK/HikSRxhMBmKk4fJtQ6aiu5zJZUf89uiO5ZpC5LexnEML/alhCy21n6BT32NdRVJz
         MCmNMfQWWFAOc03FD57vMPX0GdrbPw2xHzHS/vFlBgO/lqNYL+QhvPOsH61KmmWoqEA7
         H/4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8gCBfJ5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7d01ea0sor12426355ad.15.2024.11.14.11.19.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8gCBfJ5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731611949; x=1732216749; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0Dvqfj9DowpfpWzoYao0iUmgeNJmjRhVc0tjP0hvOw=;
        b=o8gCBfJ5wzUoVj7xyfrgqI8O8Eaoi+eJgE1/Kxqhu9qnY2Ui5xgLcYhtJIGBMclhro
         u7G2KlgNJ3fG3oNT+hK/pp1eSZfyQmXpckWlEqc4I0LG27fQHy9fJ9j5ErNRa8tzrxcD
         gNscke5sb4J1A73dkPL6WezShFH1PunlNUBfaEMLCVcBme8RwdNU7tn64wyNBSeGDT33
         1vZLWj4dAJBAhIxpe6UDUqcGnYrNdUbfJckTP/5aeRTiOypBu2hKbPzQFWsyjD0d4+Jy
         tS0lkKaARtLKj3FEzEbgzEinQH6sVSa7UMSXDw0U7EAfyBSz8qjW0MtkEtMvEf2StP72
         k8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611949; x=1732216749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0Dvqfj9DowpfpWzoYao0iUmgeNJmjRhVc0tjP0hvOw=;
        b=c1xwZp+UNtp53B0HucLBLXSZS0l98RC4C8syblMBnx3JABx7+huRehfZE+FVv88o3C
         d60UlcfHvsGLk6jz0SoyCk9wugpBGQeg3LGIlJMOSoa1Re7q4r6kpI8VgeSJL5kHCz99
         oWtS/LURh3Iig5mJHq/XK3ARtZokkkDLsEBylwcVQI/TZ+uHQFvn0/HA1uW6aHOkkyQ+
         m3GXaowV2yXdtdN+AyaAhkvNuYobxTp2uEPnYup1rkRfPrxuBwn8DC/JnwK5fG/zDLvS
         BeRgJOJNw9KnkQqDQ+zQ/+1oecSpwspW+xBTQrJEAHReN2uaaSozTqnOT8HNr9D3wfWq
         ZRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOHeCtMMDWC27sX9vPXU/j8ECODHvD8+g1CrE++ff1gF0qegeYTVlySZJMXgaq0sOc3n0Osq2PYNXTGg==@linaro.org
X-Gm-Message-State: AOJu0YwPBWTueB/PiMm/VgMM/Z5TaInoCYj2XRxNKPHry8lisfWO2dfs
	dB1+8H1fGp8VxwYOv/DUv8aKNKbxO3TWKtL4rpUcIJ/5OMRvPGiqlDmjlO77Udbl3A==
X-Google-Smtp-Source: AGHT+IF2wx13kgvBJCCM+Ukz7KTLiYUFJbyeR2wdiIlBTuhv8rXCbtj6XB1BBAIDmyu0IdZiCpWB7w==
X-Received: by 2002:a17:902:f541:b0:20d:1866:ed6f with SMTP id d9443c01a7336-21183ccf11bmr339200565ad.4.1731611949378;
        Thu, 14 Nov 2024 11:19:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c2d3basm14229255ad.12.2024.11.14.11.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:19:08 -0800 (PST)
Message-ID: <1c700309-abc5-4b5d-9a40-d00b7a7a13a2@linaro.org>
Date: Thu, 14 Nov 2024 11:19:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: neuTMfrezp+9

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h   | 7 +++++++
>   include/exec/exec-all.h | 3 ---
>   include/exec/ram_addr.h | 1 +
>   system/physmem.c        | 1 +
>   4 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> index ef18642a32..6cac7d530f 100644
> --- a/include/exec/cputlb.h
> +++ b/include/exec/cputlb.h
> @@ -32,4 +32,11 @@ void tlb_unprotect_code(ram_addr_t ram_addr);
>   
>   #endif /* CONFIG_TCG */
>   
> +#ifndef CONFIG_USER_ONLY
> +
> +void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
> +void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
> +
> +#endif
> +
>   #endif

This can join the existing CONFIG_TCG, !CONFIG_USER_ONLY block above.


r~
