Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1991788njj;
        Sun, 4 May 2025 09:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI9e9nI1ie1KrUTd1fag1UxOTi/1nWP4HP78ZyvyxFF/mrreMdWcMSmHtmMYPHNXxmH/ziSJlb4bp0zw==@linaro.org
X-Received: by 2002:a05:6a20:3954:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-20e962fa7ccmr6604082637.2.1746375601699;
        Sun, 04 May 2025 09:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375601; cv=none;
        d=google.com; s=arc-20240605;
        b=UUIS9ZjXUkbZlI8PumJkgTthkRNH0HxFOJB2Mcrjm6AFir8o+CjXrJCabiN5Sysw1a
         WHx+pHqtKAIxmgKBtfvnJRQa7cQiCP1bEHtMqSpHzN+gnq1JrDJtyC242LhpCrkKzHj8
         3e0VTnhxQ6r10zQ9ceh7zZPLCYUw2r6XqZ6KNABYxl0PLtlZH5ERIH+LMnTt0Pmq31W2
         zE3LJAOWQBiKDVDA9BAkvs/uyf0SrhIrxNEzA9DEXSYts9atY8dee2yH915toDBiePyd
         OXxZB9Tky/DH/fMglaYpsai3WWAtHruZqIQq3qf57d8Lg9uNQMLFXACQtiuc4hVC3err
         oBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=d2Hc1aYlN3sH+w/KQ6W1vC/R4sisfIS2DRgT7jxOlPs=;
        fh=qb679txYqS8ZtQVDAlnobV6I+7WW0qbNzEQBMcBvjl8=;
        b=jZvG68KVGBLoo2N9EiFn+7wKc+MkC/FFWPl/oWaK6Kx6gAFhSbRF8HDjH3/NtDD/Gq
         V+4UjvIKR0sSgiZlgQeOJ+NyIXbGpirmzdsTgKQOOd9jGhiITMsYff+NXIaDipGM+QZL
         HWB8nvpq4SsfuTjAVgZUSV0zMKhrnwnrwA1688k1fJxamEpUj7YCjnXjN62KEg6dD7/3
         iuUYY/wOiZnXXV28cGqf44ob8+pvphvvPYt45XG7jg3tVRFzgDHQVqkPhf/WZ+vvR1yc
         logHqTxjFSGDy4p9Ytf8X6toO+xK84wDixn6dX52lnONpdc77LTsmd/x95isUImJGp3H
         r+EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yvw2aRfe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5a32e7sor2875869b3a.0.2025.05.04.09.20.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yvw2aRfe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375601; x=1746980401; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2Hc1aYlN3sH+w/KQ6W1vC/R4sisfIS2DRgT7jxOlPs=;
        b=Yvw2aRfeGUPFX+JCKClh5zNgotDaOPl61MZpwGD1hwnyV6reh0Bow1B0YyzLQ8PjJ4
         dmtZ3rT69vTdaVyHK8XxT4mfb9WYQhTH582XqxaRokC/rorYn2AXCeBVRm97vYnbAWyz
         TZXBNLpZvrqQXGEFXQjs8k9ZvK5dAiDqlrgjGm+PofzTWwo76E7dAIWBKVoj400MEGQi
         2tx5gMfvM7pLQz4LypBrg9EAkQJjPHhsIfCQ34LmzBU2T6UxtuRq1UwXqujSkyb3Z0+U
         oDqyUggjd+bgXl3I2q975TWv8tVgIN17+xkwLtUrQw09N88zF6WdCJ+24ts6le/vOE1c
         Y+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375601; x=1746980401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2Hc1aYlN3sH+w/KQ6W1vC/R4sisfIS2DRgT7jxOlPs=;
        b=JWtLgmwrOlshR7oEystvVzRxhhQNCzeSttBR6lNVP/YrjLs4xBD18VUDDL5ewE4kLL
         OXQnjdjDvLqdJZf2jNE570jYJ4ezjrYqz21Tp07TFK2Gd/7/jNwFHp4gnXfnkZp6oYhI
         Ex33crNMUXtL2IbejRA8R/kbFO9FzAybGCLb5OTxaSnOo1nJTYQVcctvQTHTLWb2LS7B
         HKUwMMeBeuf5xQJ0B+FyXEhTtvD8AVlR3zFGig8oMXrBi9ooqhvOtfS7BfflwoOBCV4i
         4dTr3KXDcI7HLCkIVVkUt8Irw22ENDZ6KgbDv1BrZzGfqvCFcFqhngZ8SzdXCfL1Nncn
         bpkA==
X-Forwarded-Encrypted: i=1; AJvYcCVM3g2aA0c0vyht4Z3zvvlV2IrD/XUlqJE9Vpq6AMQBWU+PWJ+OsowTMRHEU6tA0ziOrZ4jrrQLaQ0/3Q==@linaro.org
X-Gm-Message-State: AOJu0YzJ9yIwHI0q7FLwocL7bFeGtO/EtJAE7pAK/bLFXVuikGbAlvfn
	QM1Hy2KQ5RCYe9BdgmwoD27UO7kr+VwLUXCNeFvMRPI5u/Q9wq9OrLbriwVLEnOIRQ==
X-Gm-Gg: ASbGnct6eSCr8TPZqtNoTuaLzb/dHWmT7EyHvpmE2R+zUUnY50FY2tgkJ/h/6SuXAJ+
	1p1ppjvlANCEopQkGTEEvbN48Wg+QIkttrp4Svh6GGqYDKEQmrLO/RHWLke3xvIsaPYcp6Ip8RZ
	0d1VsPtX5xNbwN08t/jOZuEdS9+Ik7YNvl6k7iPoStZzEU22cPDNuf2hJzgobNLQGFcBXx58dZP
	Fi5W8n8u/ROF3LhYP7NILkjaLaUf58uzxNxPQFUp5KXtX0oxAvsRAUCalSbuEuPIj8zZnvQup89
	7y4EpUtz6xvBjdcY/M0Uf/NUPxLVs/FqMeg+YXmODqOKwOAz8jiU4bWwx7gQEkCvJpM53Y099VL
	ej9rrZK0=
X-Google-Smtp-Source: AGHT+IHIBLfV45U1Fxt55q+aN+vYiuzFSgze79vYczsauOFmX5DbM62CozFoJkq+QpGbV7cyZ3DwKQ==
X-Received: by 2002:a05:6a20:9f4d:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-20e96205abbmr6336314637.3.1746375601253;
        Sun, 04 May 2025 09:20:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3924dd2sm4005686a12.14.2025.05.04.09.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:20:00 -0700 (PDT)
Message-ID: <a1555cc8-901b-425d-bf02-030a86aedb83@linaro.org>
Date: Sun, 4 May 2025 09:19:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 36/40] target/arm/machine: reduce migration include to
 avoid target specific definitions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-37-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-37-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Fr+wrgIDr89E

On 5/3/25 22:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/machine.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 978249fb71b..f7956898fa1 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -6,7 +6,8 @@
>   #include "kvm_arm.h"
>   #include "internals.h"
>   #include "cpu-features.h"
> -#include "migration/cpu.h"
> +#include "migration/qemu-file-types.h"
> +#include "migration/vmstate.h"
>   #include "target/arm/gtimer.h"
>   
>   static bool vfp_needed(void *opaque)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
