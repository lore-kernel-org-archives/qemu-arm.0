Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp273382njj;
        Thu, 1 May 2025 08:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJJ23b841gA9+WfGUN9FRYkRSRaH3II9qJK2Xs3JD1Mrl7FZeE5UrzlXaKnm/+tlZdRp+A5dTyBf8F0g==@linaro.org
X-Received: by 2002:a17:903:3042:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22e040a3473mr45875315ad.4.1746112529522;
        Thu, 01 May 2025 08:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112529; cv=none;
        d=google.com; s=arc-20240605;
        b=k97gV0Sw1r1CVOmrLykdcwtiOAGlnxDL5vzWn+0KF0fsvuHs5riclL0ISa7QSnwhpl
         1a3qozWTtCYxRVKrcydbw3efw8gPraQksz0cN3CIEkzbq26Y33eOgH5g3sfhK03BrZRB
         UYsCR98ihbZE4qn45r3nnrguWNalfVvogfC/GU/h1ixTfqxj+zgaYzVb5g2KwrtGyzE9
         o6qPYAOdHNw0vLUA7byzu7gG/u7KfRcvgPvRXD9ZKaK0U6sK81LNydDDnFPmvSKcz8tH
         P0UM5zntKAqCPu2amETujfN5EN5uP/dOrDA+sZi9YwHMiKYii5VP9+CufFv1sxCt0+6I
         hH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FF3pddHEwUgaH/9RTqdn87i5S0KIL/aYEK/4foUzVjo=;
        fh=y8xnH4B0w3ejQVENIipB5xcZSFOD7bdWFLzBObhxtFc=;
        b=XvTH03rqnAg5NI6BmrbTISo5XjWgWs2YpRhS2UOG1/8RSIBchxbQAfF5JGeaH6hDQg
         SAi3rlry1BK2AE7yPTS+E1AnpTKkFRxtlH7KwVdIok0ge3QltsDJkFCrp7FVMH6jA/Bw
         7kvPqc5j80BEaY82dIId7unueaCHgaqtcGBsbpkSRFsk//Uorw1g+wexgxhgFxFEOqPY
         fbBKZjiz7Aic6LBzTuu9sHUaf39m2Zigfs6DGyFY//sPRKe1QIDXc9fywVS0Q5HZbsxC
         iBh/mbWmh2J8ZEanXeRRTbqvZMJKfecdu+TZEt9Jd3k1WTeZWtZ/jT4z3Py31t26bKGH
         jNpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dwi8Ekq/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7f93esor8911275ad.13.2025.05.01.08.15.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dwi8Ekq/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112529; x=1746717329; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FF3pddHEwUgaH/9RTqdn87i5S0KIL/aYEK/4foUzVjo=;
        b=Dwi8Ekq/KT7EGiXfuwErFaxZFSalB4HLQuQ1240Fjy5lMg9UuVTPAhTOrLJN5CAuvu
         yq+83aJcc+jyyksvmiZLLYUiTxQ7l4BThBEkYLxb9yLPiEVVMO5PKmT23+JUAMyh1Tlw
         q3/BMcHX3D3NZXSRtwta3OqYrVRJMFqR0J0y/AxyW+RFyDnFNYU6+YUK6uMiyF/H/L/l
         E8/z3ftJyeK/f9ogzguFw07N0d5+yeUGwdIFJ5AAN7BpBBRAKzYFrdxbTjOYdM2LxgJI
         CmaVSkgfS3aocLTMfEqR8ZgC2B/hx+Sx4RuZBuMf80Llpsh9dxDHB6uMJCsc9gSVo+i7
         seMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112529; x=1746717329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FF3pddHEwUgaH/9RTqdn87i5S0KIL/aYEK/4foUzVjo=;
        b=iS/FYN0XfmHeUsTxYj5jU7QnDn4J0h6TIyuoUoq5RIi1LMHL8gZ4FECC7miUSyVozQ
         JA+Y2kJc31PSSp7emqbWsB2kFaJP7DevOqSg7yxVYXb5ttLeLu0hglvuJ73iR2CiQR+S
         4vgcaro2G2/2LFIfaZ3arYo7ZvMP50FmlfBR7nXnjwXMEywLsbCrzee0Akhx4u1Rdp3/
         MWasN+n5TjYxT322iNoXrWWoOl+fvOOXPdReKS8ytlF+u7li4/KYOKHwJABBR0mvX73/
         oY2cCMQy6qFU/m9hA3XU0VzXVQv2eyEFNV0aHg7atd8nN48tKqiptvTpxntew4T6NlEM
         RfBg==
X-Forwarded-Encrypted: i=1; AJvYcCVG8fq4lBSIDzD7/KXH3TdzKMKcwcHh2bY/ffvu50w+N5YIr+sm2YcYksW5PTLxRZhpKHJmFT88j2TrbQ==@linaro.org
X-Gm-Message-State: AOJu0YxiDMaejC3VntRDLIuyr5C+mzQKL0dqJkYr4zeivlWZK9Ht2+Fk
	zlkUvIypwGpbUkZgP9vJMRbWqtvD58AreZZQ8j7ACfaA6SZG9rg8v85Eyo5fg56xgg==
X-Gm-Gg: ASbGncuUkf6Th3udL3pOLaNCNRyIGmkKs5XEeCCrCXblyrfKUQbQnniBOzmnLwUJCmf
	8JkWM7f77zcYs9VlOo+ga+62DJgymkJ8nC+HuwPF8/zGTS2A3rX4urjYghpZzbqlz5eX+ku7LlF
	L8MwcJtgrKr430qR5/AjJnnXswPmmIQAJMG7OHHz9ljCEGejGIQRUXpkrgfOvM1TABxFJJyMDkQ
	hmRhdtez7Dwf5Sm2n57p6V9ceE1aSVHJ+NtQMzkByrH1LPvaOQ/K7dotUQCNtZcSqjBAwcnhVH/
	YK53c/slSmSNiYgRqIVVLLtdja1xZrz/k86X/5HN/i9SpcYMKMY/i05AVj7GF6TkGSYodSydWiN
	q3YD9+Iw=
X-Google-Smtp-Source: AGHT+IHmyRr7z6sPij1th8t08gn508e/IEYOVboajUzflb5IvUbXe1xABl2MLT26AzlI/t3uR/F3TA==
X-Received: by 2002:a17:903:4407:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22e04127919mr60789965ad.46.1746112529060;
        Thu, 01 May 2025 08:15:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d4edc4esm731664a12.39.2025.05.01.08.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:15:28 -0700 (PDT)
Message-ID: <0762481e-878d-46dd-9964-666c115ca692@linaro.org>
Date: Thu, 1 May 2025 08:15:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/33] target/arm/helper: restrict include to common
 helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-20-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cStIv2ppkj1k

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 257b1ba5270..085c1656027 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12,7 +12,6 @@
>   #include "cpu.h"
>   #include "internals.h"
>   #include "cpu-features.h"
> -#include "exec/helper-proto.h"
>   #include "exec/page-protection.h"
>   #include "exec/mmap-lock.h"
>   #include "qemu/main-loop.h"
> @@ -36,6 +35,9 @@
>   #include "target/arm/gtimer.h"
>   #include "qemu/plugin.h"
>   
> +#define HELPER_H "tcg/helper.h"
> +#include "exec/helper-proto.h.inc"
> +
>   #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>   
>   static void switch_mode(CPUARMState *env, int mode);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
