Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp677747ejb;
        Fri, 7 Apr 2023 21:24:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:b0:23f:58a2:7d86 with SMTP id rj13-20020a17090b3e8d00b0023f58a27d86mr5001226pjb.10.1680927848035;
        Fri, 07 Apr 2023 21:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927848; cv=none;
        d=google.com; s=arc-20160816;
        b=hE8s2tk64T7Um6N+z1uIH5dvRVhvQR7PHiLjocyfffzkondZn+8RlfEHhpT0ZUcV03
         uAk6ba9XPuvnCtY/B1xbG+EtXdP31aMM0LO58EFwmV2qcOjlJNuNLdJD/of188dTAowV
         Z3fPwAfR5zbmRCJ8onnfsIFvOF/0sHfs+zzmAfP4BrUw0a69JlihRKBFZjO4tYhwI6yp
         fqyi/eOp0FjMbSnh4eOrnTUfFN2MPiYqy1hDMGiAeHQGitkkPNVf8DlFk0jb4l0IZgCk
         LJwBu23RCW/NyyiiRMNv0VKyNwY+Lk68C2Sos7XKV58xP3103mmMssjvZHPBlQIPSMVc
         w4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SUf3WfCxOVdR+3bfJfHcevGewv4Q85VTTJ9AWC0Fz3A=;
        b=ZMQ8RxpZsSt79HDIs3DDFJPbOP4FOemDn7H5XJYsvQmSouaQq0tQZdEd2B85HZJJY6
         O6lCjagBDGY7mVqA3APQi2JaM7AylyTsiPUcFPm37vSDwPPMQyCqMAbqjuguGw+CWGQm
         r302wrQpwYCnxvxXOKZfMakwEFe/c5PlUjIgvRqVp2BY2lT2CyIcP9cw7Sb8SVc8KILC
         9hWk/qcg7raGQTdHuJilD85BMVVOMRK2c0ynSNyb1NsqO4Myv47Vk/jwm2CD0od0oxmJ
         Y7JPBd5E+ulNg5LwdcKT8MemYlL2/IbkQv1NkyD1NtaxDt7QNrzH6I27wd1tDK4W4xVp
         vMpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6ule4MS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z23-20020a17090abd9700b0023d1e653c28sor2589123pjr.11.2023.04.07.21.24.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6ule4MS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680927847;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUf3WfCxOVdR+3bfJfHcevGewv4Q85VTTJ9AWC0Fz3A=;
        b=M6ule4MSP61kRkiYLQckGXwG36BBy88n1C4e4q/MbZ4jPqsZVxpVsrW+/hlEu7cN4G
         FKgL1hm9EUnD+E3l6NWRfNX/pk0kMMRdrk7sKYqtgBw+WvVLXQ43L+1XGc/goQjDKAvm
         RMJm0fFNsmJ7KSHZ8BKfwumaTdqFvuKSJbBM1/pAhegO7TuebsgCRh6TXBAVcKeDnJPn
         2i/5MYzTFKIJnJyF+ZJeuQeOLzPiskkObGSLAXorpBG6Vs/bsZw25NSL+3d2TtaVb0IV
         u8q5yj/zReQ5zpMmXo6izob23ZS5U5FQV5R6UGXk9rJSP/7Bf9Kh2saPavjcW7g4AKXm
         +Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680927847;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUf3WfCxOVdR+3bfJfHcevGewv4Q85VTTJ9AWC0Fz3A=;
        b=aO24TGARjZDWWSxJf2M/bagBeQnoDdYWHTxLLVMTZOKiCMnwhzG6IjwCPjXbyylcfF
         mEwA8ULd3tpo5SCicVyZjOXZeNh0puLg9opOJouS8JZFCiyO3xy5Tp54FFb7QDOk1LQ/
         /Vw7LM+fM5Zm+Ww0fp9hhhvoSQNWAjU8z71X299uGA0OVmlFipPI+267xVXiD/R2hWr0
         R29JaWSTAksqV5CoOuomyAOf4pLbv+gp0ga5DaNE5VAeE0c7ox1V4qpULUKC//Ch9t+o
         91EXkIf4vuQSLWXjSDjPpXlKNOv6VAUlH7RneIh+PQUTwsTGrwb1b5TwUEk6OQHXNPQP
         c9jQ==
X-Gm-Message-State: AAQBX9f42MDJl3Au3wTbP2ozNyemVyg0LUEB8nxkUnUTF7Z48F7vGJOf
	HoPBb1UuLxvJfan0+e5ZUWgpFLTY
X-Google-Smtp-Source: AKy350aTojRcwvS7asuLQjO5JCzvuwE9tyORjUy8gTe5GSqRwTu1Ft3j89YC+lFknwdCZLTFDWHdww==
X-Received: by 2002:a17:90b:33c4:b0:237:161d:f5ac with SMTP id lk4-20020a17090b33c400b00237161df5acmr4835643pjb.36.1680927847525;
        Fri, 07 Apr 2023 21:24:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090270cb00b0019a997bca5csm3621258plt.121.2023.04.07.21.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:24:07 -0700 (PDT)
Message-ID: <28b356e3-fae0-c3b2-e40f-d32bb75f46bb@linaro.org>
Date: Fri, 7 Apr 2023 21:24:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
 <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
In-Reply-To: <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +DJUwGMnPtHC

On 4/7/23 21:23, Richard Henderson wrote:
> On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
>> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
>>
>> arm_gic_common_reset_irq_state() calls its second argument
>> 'first_cpu', producing a build failure when "hw/core/cpu.h"
>> is included:
>>
>>    hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function 
>> definition is a C2x extension [-Wc2x-extensions]
>>      static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
>>                                                                         ^
>>    include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>>      #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>>                               ^
>>
>> KISS, rename the function argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   hw/intc/arm_gic_common.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Wow, that's ugly.  But a reasonable work-around.

Duh.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
