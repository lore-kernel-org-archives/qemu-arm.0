Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp58180ejb;
        Wed, 4 Jan 2023 21:02:47 -0800 (PST)
X-Received: by 2002:a17:902:d1d5:b0:192:4feb:cac5 with SMTP id g21-20020a170902d1d500b001924febcac5mr44056510plb.32.1672894967237;
        Wed, 04 Jan 2023 21:02:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894967; cv=none;
        d=google.com; s=arc-20160816;
        b=nxDAgTWY2lo7agtizR8wOLu7wCtFnumu5zizoLmJPs6ba2cSL5PYSkYjCbBAoTMai5
         VAqmdV0Os+yFUINWojchaownm/2pnZpOkc0k51pndCTgSMZXgWuUnWlT+foIGinND3Y+
         RYEjjFpg/JUtC17BBpUhqOBmmX3Yxi2cOeH0iF7lZaApFuLdF2508WZi00zyFJZhXSvF
         FDJn5GIPqT2yIbaTe/A1Q0Bau4s2RKs2m2LJI4WuPVTgpIZOihqce2NBchHZua/JVhSC
         UgpMeP+BzbquYM8oPhOgfj9MGTVzR86uCPiVc6eHm8BKGUEMkWx/kh5HMbqFjaisWNih
         DhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IsMrjT5bgFE+wb1Flp77K91WZQSGvYHNLILbRrYHTZI=;
        b=YpYpwRYeFXus4/orCVjvRUXDP5lsJVekI6XZjXTEJXBAsX8xQ1eeFDbkebSdg02h7d
         xnwPpauuRtzBCL0M/wyto6olsrBI9xOakGhu3ghOLu/grGE5xdBz28suzjLFBYa2SPaU
         Dh3kd7z1WeUXumDma483JupbKXMYqIlA/TwIGaRUx0yk4r0Q4vEpUZnR4sE7PFp+L6g2
         Vhu/S6xyaJQWTU0d5L0B8jYwZp200lGSWIRogKqekZ2P1u+EG8MB09Jmf+rxi+6uVVgD
         7ckgkzW2DygEko2YzM1aFPFqOUPHu+zUHRVGQfdfgEJoQIOufcB8NEKgjewSMd9Lyguw
         9/ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL5t9ImT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iy2-20020a170903130200b0019295de867fsor8819180plb.7.2023.01.04.21.02.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:02:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL5t9ImT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsMrjT5bgFE+wb1Flp77K91WZQSGvYHNLILbRrYHTZI=;
        b=wL5t9ImT4MQyqTflldZoCPNZfe0ZIxWK8bUoNH9a2FAXGLjXFs4Lts68dha7ooxwaX
         sTdjRQY+9F9m6ZvWMxIDe6OiM3U7OXXAlLSq2B/e/n2vo6b65EOZFqUNnqUU6Dr3OG6H
         +9isx/XTSd2aANPpEHIoMP2kiLAe97POEioQKTeeA60Dil20jBNSLvRduNvS3W5lvIH0
         MH/vNDX5WSeG313hvk0FOWQ1xwhKNerHi0xv9rO5yY94OyeiWzuQWr0Qp/mZgM6HrzrD
         62SP9+MVJxbVV8Mch3ajkS1lyTydpYCF0eEgXZi8CQ9yenDp78A2ynPKxPGoH7qeWFOr
         SeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsMrjT5bgFE+wb1Flp77K91WZQSGvYHNLILbRrYHTZI=;
        b=GXY75jlHXsrDeFezqd/4qfSdZ1DMNUbmLswJgHBbY64oPyS9k6bsjR3TRI8IEflkMg
         +vjWluHfCfFX7nmrSKRQsBSEIG5iNjkwZv53hQBTmZWsgzEJcuuPtFdYftnUgh74ukfm
         LopHzyLg6QI5HmMNrQSjuGGl+hXqMsAzU6Oh7iTR6MiJWaFdmlLunO6LR5RB/mtPtkVy
         iPB6ai9hb5HqgvQQKS15xZ0qPeurfL/pgw8UwHhwJMvnDpwYH8HFhmA8VpUZ1dFzth1N
         D1zAtFtSXcGGrOozUpllQc1uUbgYSbbVyLlDuRPekZ27FfMIDKkxrB0VyDCacCvwR4m0
         mDCQ==
X-Gm-Message-State: AFqh2koWU98ZuUgGL1iCBMGPUF0wTaBkBk4VWHRpEIG1yPXugFKE26E/
	yHPxt4/z98o+0u4xaMl4Q1oUoJ9r
X-Google-Smtp-Source: AMrXdXumhqdaEvpew9UiRTMGbUFwHKkJX2QBRAlbEeguQL2M3VMwc2V5Jpp4E7p0VT3cn6x5Jj4rkw==
X-Received: by 2002:a05:6a20:c991:b0:b4:6f9:ef7d with SMTP id gy17-20020a056a20c99100b000b406f9ef7dmr26968566pzb.35.1672894966779;
        Wed, 04 Jan 2023 21:02:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709029a8100b001925c3ec34esm24280697plp.196.2023.01.04.21.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:02:45 -0800 (PST)
Message-ID: <079601b5-1c91-9b85-ff75-91d0abb93ef8@linaro.org>
Date: Wed, 4 Jan 2023 21:02:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 21/27] target/arm: make further preparation for the
 exception code to move
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-22-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-22-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /hOCSBuaWeD4

On 1/4/23 13:58, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> the exception code needs some adjustment before being exposed to
> KVM-only builds. We need to call arm_rebuild_hflags only when TCG is
> enabled, or we will error out.
> 
> The direct call to helper_rebuild_hflags_a64(env, new_el) will not
> be possible when extracting out to common code,
> it seems safe to replace it with a call to arm_rebuild_hflags, since
> the write to pstate is already done.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/helper.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
