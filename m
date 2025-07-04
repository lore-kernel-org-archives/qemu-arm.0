Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1426681dyc;
        Fri, 4 Jul 2025 13:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+rgK+Mya31efbDMKemEeSuwc74CtuYFHv1RMFg+4W+Wwv6nvqnqGK4zSJzpxkfoIjsFHKJq7OnxFgig==@linaro.org
X-Received: by 2002:a05:6870:20c:b0:2d6:667c:511f with SMTP id 586e51a60fabf-2f796a46a7cmr2373211fac.9.1751659438016;
        Fri, 04 Jul 2025 13:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751659438; cv=none;
        d=google.com; s=arc-20240605;
        b=ac0X1B0+Z8GORRJF2wPjirzEBIRYl08p4UpCQ0t8QjV11ti1YCqn1+mVfTKJilv8eu
         7vxDHd+bQ8bty45Jick4+g0AUiy09CZrJ6ThZIEmszNydWc+VlCUUQuPA+lLSfX884J0
         PmH9cOh8cAVfZc6rQOpc6Yq0j3fgXS2kP3fZif0QFnQJKKnRSbu06hb5gOYPgjq14GjI
         nCIq1uGxqNcKJkGgLLFO//KEXDlwI/wP4iK81JVAj53rA/T3TbixY6O28iRn5TmQ5dbT
         o7J2hR/J7gEHAX82bAMYGCUYqIpG5BhK9kGmcNon8l9vopPT+V5XZKPxDprh+cntR9rB
         6QLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fjaLey0O/axm/Woq3tMpCDfp7eQbKZ9meHYum4psoRc=;
        fh=KndOGJQnSC4o4mgSgq0BVfRrzgSfiLJ7cOgJpO0c1Ig=;
        b=cUKuUkdgfvgTL+ed8ayc1cpYG8eDhxK3gE/Yrdd5PzC7MkwatnOc+QglgDLkwTbP+x
         TWBNFPfqTUINgclZLSGjZADl+f4CFQfyokVt7XtHeEm6wHldwH6Wn+p2sqX2BJvZEjuB
         WcZJhE5vEJVfps/CXyBI/ePromoSgidZlTsX98M9Uu85nC7oPxXIHQ1KsI8zHxHjlKeT
         yiDKN7ivTM7fszv9Uc1wdX9zEqf6eX2QIvE3amGAML6Df6dNbpmeTM3hsjh7+OR+/5o5
         OK3mlN0BYTvgiI3KjXXgFt5gpbjPAAVUd+v61xDpvaPSDLKDdtWzCJSSCWiZJIQgYqf6
         tbFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCco5F9m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-73c9f778f7asor811517a34.3.2025.07.04.13.03.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 13:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCco5F9m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751659437; x=1752264237; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjaLey0O/axm/Woq3tMpCDfp7eQbKZ9meHYum4psoRc=;
        b=dCco5F9mpeTFLLRDM3fQQe3Au+QI76uutwce4BwOs72DZt1MVI6/5HSRz6T9maer6t
         lr8dGC3Jv8OoI32gKK6zVcYs65nQGaQwzGZpw+nHxGzJKEQ5RiEetud0XMT8EMBn7a6/
         SGnKN85jSCbxv+qxqaFtZxAG6ofPuOvlZxgr1yKXf0xov/NMFu7GJeGZRuJLAJuVYTt7
         ffkudhM/sWDAc8QtZfIo5HM7iHUAoCS6jeDhmlIU9xdjGdIUCfpzoel33KbumyA/dG0G
         CRI6JzxPASEHGLHtCDAY49AARbmxdpF27g4w/a4yv0ksZAh/AHmBD29pfJ306wODgnDB
         laaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751659437; x=1752264237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjaLey0O/axm/Woq3tMpCDfp7eQbKZ9meHYum4psoRc=;
        b=Krr0ipDlCKVAytEf4Q0vkZmTqlnQ4gQAqc4X/P+GkY9aR8IL3iKD+1kP5sZHf1cqSC
         NL0ouXc3VBZN7+ZzZ4QPcQgnSNrdaTmGk8A8ur+LHczuYUH/UvHAiYfF2WW6qR4Pmxws
         DUZeKPatjkB1ciW7su/NL3nzGOvQFUtMIqGUawI3ThkLHw1NiKfAPVTrvqd/8VEk1vLO
         16LIMQSSMZTj9HRzxqY3Vc4po11CW2M79i8WfluYvl7fCGkfRuyptUil34e+mBydlc/v
         VHFy1RDWApgD/uPx+Os/1v2rp7WjfhPVUFfv9Faim2T9i4810ieHTQ/eayBn7wp9TLZG
         1YWw==
X-Forwarded-Encrypted: i=1; AJvYcCWrFLRLfuAkfySUq7v5WK4/JrM1KFMl934dFV36wcCKnlTu46w31M17zq4xOCapZKZ1t+ca7DoWRE41oA==@linaro.org
X-Gm-Message-State: AOJu0YwBst4v8nMjGWBukz+lAyCt5P1feZtUgO70RRA7+wfg5UoogKbH
	DQ3GPlr3avtaxZVwlCt86A7BKa+QtRlQBNTmg4luUr2S0quzk7HYO1fX9lmMZ+1DU0hgHg==
X-Gm-Gg: ASbGnctpsrVJgHBKMpz5qWHDeG1oSjhzXkqVjZCPFd7QNawZCQOYmOrspqge9KkGXfI
	6bItfYALxrg4/Tl0EinK9wwwVq6ovCVe3gBoBQ5RjDTG5/lHHFDVEwkrFpzz47c80lebhBNZhlu
	w9+BChINd7Amh4EPEwhpmxekdAST8jKbZiExxfMUN0ICSMAIR1TyibqYD/sSN7Rr0silBJxD7Tr
	PbkmjLgwhEaWMz7DkSUasFH+Os6I9LWHbeO7ilHrFOB4cz3CBMDkafy0+9WqV45CZwa2E3pU5Q0
	a9S/bgfq+OCR6BTyg2xoqqJNHmHYKlvkdK3HUNHvvoelyPTf8R5pCl+GcJIeRaak8GdwE9FrLOW
	FTSx9n+gvV2XrPMZa4X97KS+F5qJy3A1dC8Bmf0y3N1XtVQ9ARhc=
X-Google-Smtp-Source: AGHT+IEAUCDxIrlOcf8uiOinAVcfgxQAglUxx92SLUZXZ1jWTZAhc722y0eD/AgiA5gSndi+oFNhDA==
X-Received: by 2002:a05:6820:2918:b0:611:63d2:d709 with SMTP id 006d021491bc7-61392bbf039mr2597671eaf.6.1751659437464;
        Fri, 04 Jul 2025 13:03:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6138e4ad926sm416953eaf.1.2025.07.04.13.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 13:03:57 -0700 (PDT)
Message-ID: <7d3a794b-68ee-4a90-a970-4287be8c86bd@linaro.org>
Date: Fri, 4 Jul 2025 14:03:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WIP-for-10.1 v2 1/5] target/arm: Add the MECEn SCR_EL3 bit
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
 <20250704151431.1033520-2-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250704151431.1033520-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: g9t89LlZvG9Y

On 7/4/25 09:14, Gustavo Romero wrote:
> The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
> EL2, so add it to the SCR mask list to use it later on.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   target/arm/cpu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 302c24e232..8ce30ca857 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1683,6 +1683,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>   #define SCR_TRNDR             (1ULL << 40)
>   #define SCR_ENTP2             (1ULL << 41)
>   #define SCR_GPF               (1ULL << 48)
> +#define SCR_MECEN             (1ULL << 49)
>   #define SCR_NSE               (1ULL << 62)
>   
>   /* Return the current FPSCR value.  */

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
