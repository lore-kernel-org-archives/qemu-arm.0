Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2210858lfa;
        Sat, 5 Jun 2021 11:57:11 -0700 (PDT)
X-Received: by 2002:a63:ae01:: with SMTP id q1mr10703073pgf.216.1622919431275;
        Sat, 05 Jun 2021 11:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622919431; cv=none;
        d=google.com; s=arc-20160816;
        b=FZBmbHUw0L/Cvsj3pw+qqdLS/cByqFnaIyLQVqHZJt43SnymsnfUuEjrQnmANXDA2d
         G0O+DCHk1KrCWHoSGhDcd3NgZs+1CFAQpt4dgHAcJ1URWfZa0PSX1upPzriz8ILSAZKv
         bB/4H7IUdnPuc/9aVMMwvQLHa3a90O0zkUNMd0Pp5IeAMi/S9KjVG8iD05UEvflkvRkZ
         JLgcUtujqART1eEnCqt/Uw72XrXFanNPS4nQikJTQae+Nowy+3y29T1Z/a0lUlP6HcUY
         WwQ/3GOhnn2LxMsa89JW1EWUUIcTUeKaDXVFvXEyNC5gZSDQUkEueL1Hus2nEXXyRkZ2
         zwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qGgnvp9E2IUHKX1ZUyEJHuFMFSiqnp54KMP0FuDmEb8=;
        b=gpBxBaElyNWuU1t37GkP+JN0rf+6k5toooo58p5Ds0vvA/vRKp8Z3cDrUFLAiFo5hv
         YHClpmyqTx2cZlE0Sh5+z8rE5ermokuds+K9YaDf4bbbA6CejNCGiR9ZYxUVBCfbuHsJ
         2YYGcw5zDWeammGpdE7SqPXdy8Yr4yzhM/gAQBLGaiWqQOjXms9VQkGtNd0ZJJZoZbMd
         PxY0rlrJcQ0XB+oD5/6XudVEkdFAVf4ETgBUrehP1xoZXUbbCescM2P9jIzAbdR4ERAM
         eCDDvGqtWqZSTUwgFu4dWBrpKOudX0/cGcGvgmo2xn5opCiQgJJvKbuZdMAM4sYA3wsj
         QjqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILvxCqgc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id na10sor3592179pjb.29.2021.06.05.11.57.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 11:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILvxCqgc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qGgnvp9E2IUHKX1ZUyEJHuFMFSiqnp54KMP0FuDmEb8=;
        b=ILvxCqgckK58CfayGZ3LDvC42200HdDh+ihZm+VSm3uzBxHX/pROfQSbWoJ6MvIA8t
         w/x5ZYy3Yxgrpvu1QsDt1l+pYGGuGqmfmwHd7RoE0fSEaOfwBYXhbIsCCuGIVW6a7kMD
         XkZwZhaTtXbRfoQBtFCP7DUWs/wz+YTcBfTLWdbDQCfJr/yTn8thgmtddPW8n9j2iCOh
         mdeoRFo38rruKyYch86bSYPokNHFaEMCoJK00b7v7hiDpdWpW6L/XfaNILowS+0ABXou
         6xo06NB3W5S3dISGkR39wCUiYdO7+yiVz/W/JySnafPfztg7yJ8mc9EARFpLXixCA6pw
         njJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qGgnvp9E2IUHKX1ZUyEJHuFMFSiqnp54KMP0FuDmEb8=;
        b=gzZLQxh+iKBi3AB0wYGOurN9DyPl7g4XpvmbEbS3vZidALUJSIna0ro5g2UDlgC7AN
         KpipYhK5nP2E6oEsrg5zdnQwZjupsEWHaRoc77StWWFVwE9edn4om5NATvqaZqpdc0wN
         d95LHEaTAonP6urRXhP/ZR0Fw/AkKP8TWKFf6jBaorUHzq7AyDdBGv5/IPBtZ6H52Cjy
         MpoQ+b7ezeOtDoc4a6qrLv5iGAslC0RH/gUmMFW1838uHJb0cE8o4pZWyj6OJJDqGiYS
         HnnbnADeAkyXERQN3UFVOh6M+xWwBNni+xYUYIk9noQXAGMl1wCCoIYzN216J4od5YNN
         edEA==
X-Gm-Message-State: AOAM533wLfqcSFIYUHShXLjPjtIYjIHkU62IbWnVD1v7qR0j6t1LSlvN
	gvfR6qNIyyRb/OoC5hUCJKa14LG/5357JaXJ
X-Google-Smtp-Source: ABdhPJwi5jKUNspYwbHI6kCuKEiHDcvUW3Y4N2i/mMyEdxmK61mfRHWlGUZbzUL4Y0+Rn6N6VmyzsQ==
X-Received: by 2002:a17:90a:a509:: with SMTP id a9mr11456913pjq.190.1622919430702;
        Sat, 05 Jun 2021 11:57:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s24sm4663128pfh.104.2021.06.05.11.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 11:57:10 -0700 (PDT)
Subject: Re: [PATCH v16 74/99] target/arm: cpu-sve: make
 cpu_sve_finalize_features return bool
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-75-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c215771-9493-0397-781e-1924fe3eb34f@linaro.org>
Date: Sat, 5 Jun 2021 11:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-75-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1OM9kT8fqE85

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> return false on error, true on success.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sve.h |  2 +-
>   target/arm/cpu-sve.c | 17 +++++++++--------
>   target/arm/cpu.c     |  3 +--
>   3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
