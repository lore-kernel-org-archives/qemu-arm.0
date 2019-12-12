Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp33279lff;
        Wed, 11 Dec 2019 18:09:16 -0800 (PST)
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr6379157plp.253.1576116556332;
        Wed, 11 Dec 2019 18:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576116556; cv=none;
        d=google.com; s=arc-20160816;
        b=lzx6UmK1Fx00OhUvEjbE0OUXC4R3Xhjy2vES7QSYN6KOWuMmwtR2KCBFKX5iAHqRj0
         yZpTmSueuA2e649JeZUEperY9FsovID+sILckqT0ZLoL/VCWP+KxURthLHbL4lOWqbuo
         /YYhGLHKx+gFa/jDCzmAUHyLlYGbsNoosxwauVTgFLNn/gFlbE3BjrM/Hsf1gQ4yC50s
         o8U0pJDM3JO9FRcbJHFM/jjftYEK6ldKQioMrcqW5M3OJNMctrTstmoNV576TcgfcUvm
         DEwYEJ6WNeGVRoYBHoqc3LqVKvWdDq1lVTG7Eoneeq1XZIr31m7CNCGmYbboNKQQZqxM
         dSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vyX7QreLgESGZBkcNOCy4sl/B66hsQvvZY/2+o5GCOI=;
        b=naJnHwHg3a2DYbvzpr4D+KRQ8YP9yt5DGy0F0Uy5tKUbsqcHsyWzNkJGRtUUu/ioR+
         BWrkswZsOS70UUSBj2hPuw2VnwkE7EmanGJAU5o2sNpLM/N00ZhOX1E6s8uTlLRGI6gj
         EiSdZcQaEdf3mm2ujx3Yh/JpeLDfdbT9v45R7upM7KD3HLIjiFHMAVpGhLjjyOF6OfJH
         yVShs5+Y/J5XusxNRpMkgbJEhF7SozkTMySDMt+eeHipYkuGbet1liCUONpNFUF5XJvp
         xOLFSO4IPiaw1HLdAk98bbthtl1/47xKJj8YdkK0hAVUq97j5Ff+/SZpYhZMfi+CtvWi
         mTYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gZScW/0Y";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g24sor4995223pfh.58.2019.12.11.18.09.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 18:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gZScW/0Y";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vyX7QreLgESGZBkcNOCy4sl/B66hsQvvZY/2+o5GCOI=;
        b=gZScW/0Yfu+Fl9zkya/fv/1Lxf0899+RDyoqhPM5HRs5PjHVaYY4Z4BjFw40brIdPQ
         rM1MvfuBJEuHawPAQ/NrMubFrvS/tVZxk5mV1+bMcbvYTUtBcluO0EIjquQ7yabWTEfw
         YqyKY02/y5lmlAq8SVfr0heEvtanZKcfEVQEA6SzJd+cBmlzaXKwMhnK6s/OX1cQYh2l
         xlSWN5ZP4so/raL8NiDezH3sbQmrlu2xJ6S1iGjYJZqosrjELnhfzps52IbZy+br/aaC
         8eG2px1mXoBfaI/MwY9aKVFv4/09Rsie7/1IjaeBQHshhynrc6FowrVOQiMlvTCoQHlN
         8SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vyX7QreLgESGZBkcNOCy4sl/B66hsQvvZY/2+o5GCOI=;
        b=e/dxH2/JPrEATt6cG2yUsl+wHKFx46J+iYOnBWcHoMxw5OEuIG2ev+Mu17EPTQibEL
         x3zMK4yfHg2GFenUSfFyAqjq+SxVDsY7R3CVIEZ4JNM2eYeiZjO2CtvudsVmU+4dyyYc
         3KSkrfGvIovzJRLkzKu1hY8z1W5DHrW1qLDAMQv0NW6/ITe10SAM7sMw6tTFkdzzhSwL
         R9EpheuCHtQ8R3oe/GHbYgHlTjMapivYktGjvpQSQz3JQnQROVDxve0kH+y7oAv0epLW
         0vFVkvRtlas4JRQlLUNUaOv/ppE4L/2aPxTTMvWW00vkpSFAzUo0hHHwcLsC8Nq2gDxr
         zuEQ==
X-Gm-Message-State: APjAAAWgrNCtHVHncsjQ5MN1wuuzE0yw/LcLIClqJlM0SJzjqFvcJZ0d
	2gjs6gkDaSblPgJUFlPjfDJXJ+If
X-Google-Smtp-Source: APXvYqzt4r+JYIP3LxkcoEM74229wKgfDcGlQJIX2BV09qVmfK4Kj+FNn1ehdPwApYD0K0uYiQiwBw==
X-Received: by 2002:a62:4ec7:: with SMTP id c190mr6968035pfb.68.1576116555710;
        Wed, 11 Dec 2019 18:09:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id s130sm4368967pgc.82.2019.12.11.18.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 18:09:15 -0800 (PST)
Subject: Re: [PATCH v3 11/20] target/arm: default SVE length to 64 bytes for
 linux-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd38b591-f9e8-2d62-2381-9bcccabbbf8e@linaro.org>
Date: Wed, 11 Dec 2019 18:09:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CO3U0oulXveX

On 12/11/19 9:05 AM, Alex Bennée wrote:
> The Linux kernel chooses the default of 64 bytes for SVE registers on
> the basis that it is the largest size on known hardware that won't
> grow the signal frame. We still honour the sve-max-vq property and
> userspace can expand the number of lanes by calling PR_SVE_SET_VL.
> 
> This should not make any difference to SVE enabled software as the SVE
> is of course vector length agnostic.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - tweak zcr_el[1] instead
> ---
>  target/arm/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7a4ac9339bf..d42b88c9b73 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -199,9 +199,9 @@ static void arm_cpu_reset(CPUState *s)
>          /* and to the SVE instructions */
>          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
>          env->cp15.cptr_el[3] |= CPTR_EZ;
> -        /* with maximum vector length */
> +        /* with reasonable vector length */

I think this comment should mention the kernel as well.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
