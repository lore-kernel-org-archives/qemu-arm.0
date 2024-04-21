Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3718939ejd;
        Sun, 21 Apr 2024 09:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXn++vIWXouV7d8U5SRF10U9BQ669zvRwRztlGf75LkadFGVEj3FiegfUdjuuTnXaur7rBcZ0ElL2hI/haX8N8uf+JSvtHk
X-Received: by 2002:a05:6a00:230d:b0:6e7:117:c5d5 with SMTP id h13-20020a056a00230d00b006e70117c5d5mr9066937pfh.23.1713717890594;
        Sun, 21 Apr 2024 09:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717890; cv=none;
        d=google.com; s=arc-20160816;
        b=e4g3VmueYQa31p0wrpax5LMAledUG7eJqAxd3Ey9SL3i5Bi9OUJkEIAW3mTqphL7st
         QRwpNV/cR8fBqMdnw3Ffh3jdnPslHJJrq3LRAXnPQUHHpO+oQq5E6zXeFdM1hADnPYkk
         a8JvRDlmYf6PZi7VjYiBqNaYNxvrNATW7XRMXvdioTvagNW7CwSlagDWTZWF2JoyeLP9
         eGDQjpzd/XgB9GKAFXqpVvUB/qVGXpn2Gu2Kk3/sr6Wo5ahHYUiVqumcMJ4C9Lx5C3zO
         xok+e99vmfqkv/LLBDmVSPyMiRWVTolkNagyBjypFN5tJYWgw0iPLmL/RCpZUruVc7YQ
         uVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nyzp97ki1grnNxngMCvV07B0rG8wrW4X+oI9mWIoUg0=;
        fh=idvype/V3by1EtSMe5QyxbmnA55/RR2gphWXNLVyQaQ=;
        b=XW/wtLo550C9ea9T7IEFwnI40soj50i62F4aMijLiK2iBl+GYahCDPRZZLGpbRijhV
         LXGsvBewgeFx/JBpWPPyexkaEj7a/lLnMVW4bkd+QcCDKgYN7GZXPlhRNGmxfGoBwKF+
         2FfucIPtCuxfg2I7RE2NrXJAEC0prWN818C1z/Tt4+mIuNIiptcF6EBNqJVzUl6qXvL1
         go8WdDygPOc0i6Yz1CeVUoIq4tHaB3OFak4dyMlwBlb/kSggHZ7/IHmnhnWPo4ajludV
         TCLfAiHxYxUn5atTwgCLaHZ3wxZ72O4AkUuQ3qq95XSUYfBuJZNa7wx4AmXn4BXVqU8C
         P/7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=torH338C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m184-20020a6258c1000000b006eac2a5961asor9435682pfb.2.2024.04.21.09.44.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=torH338C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717890; x=1714322690; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nyzp97ki1grnNxngMCvV07B0rG8wrW4X+oI9mWIoUg0=;
        b=torH338C0A0VHWwacH8ti11im0ZdcCuGlX+XkA1FQg6x8+zqq7mBt86+UxkiozuBG7
         vNmeddWmlereuqI0Ig1wz5Q8MZiP3781KRr/IVH7o+7vXBO+S7eZQUPXXqtJCgryKs45
         tipJoDwg7DEtM6CvIgQVtxez/X9P1wJVZgrIMm07b2CpYnPuBoeHFcsywohzMB8tz/H9
         vNBjOdjE1/eOpiiHpS4FN5oaoSegrKIi0ft/236x4E+augnxvLF794KLiAwVC6OFkimv
         nboD0t0OmdYOfa4kCz7oyG2n6CdwJG+N2TzdLrbe0N8+GH/ihzyfRC9chy1D+K5CLuNx
         /2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717890; x=1714322690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyzp97ki1grnNxngMCvV07B0rG8wrW4X+oI9mWIoUg0=;
        b=V0Fhc9jLodiWf4VubXOUxW2vJcFBFvbM3ZbYn/ixNtvLy+S/wySlNd3mbdd8VawEnX
         RHkq+Pq1bIwE7BWty/ZJxj/tHE3jI2uyanm0OwyAhSB8u+npK2SqqH/MzfTRy9T6gg7H
         7KNprafQ95aziIBpFhzHn9by2SMKGLcG9J4swRDEzdT7qyBXkZdEXRI+xGg/S0LMSjmQ
         d7tHv2JyM1+7W2HwIbEKukdCXngeqpM6o+1D68HXJBK5arDcYvSgJjizi0RSWzzq08Xm
         O873uGIGC66+JgRwq05hk6ebUxh/upu+4qIrbeyENoWlOxvtXSmc3d/PHEgX51sy5yup
         nE+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZUmiIKPK+zx7rmyf0kA+KAz1icF29cFlsm7x3pvjtNQwtQGggrQ75AEO7h0jwStKRzvoMIC+YWXA+dq+9+da643xihyeB
X-Gm-Message-State: AOJu0Yw56CvAfdDhsehqj74ikSnlXovq3TMRwH5KzvxYgsbWyvRBGE8N
	Wvyg3vQFPKBSwu1ATmRXPuvATrmbdJEMPrF7iMM6I+/zvnWDL8guZeWLy4dW+aCe3A==
X-Google-Smtp-Source: AGHT+IEW0S90e+aa9Rokk8Nr+asc0MSx8g2O+FJc6mVvrp7msO29LBb8PrSeUtP+nkxwtnmiTnWQVw==
X-Received: by 2002:a05:6a00:4f87:b0:6ee:1737:1e43 with SMTP id ld7-20020a056a004f8700b006ee17371e43mr10271763pfb.17.1713717889952;
        Sun, 21 Apr 2024 09:44:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a000be500b006edcceffcb0sm6348703pfu.161.2024.04.21.09.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:44:49 -0700 (PDT)
Message-ID: <76d68cab-7b28-43bf-89a6-bb39a7fdb131@linaro.org>
Date: Sun, 21 Apr 2024 09:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header
 in 'exec/log.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vNdNxCKpgRjI

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "exec/log.h" accesses the qemu_loglevel variable,
> which is declared in "qemu/log-for-trace.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/log.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/exec/log.h b/include/exec/log.h
> index 4a7375a45f..e0ff778a10 100644
> --- a/include/exec/log.h
> +++ b/include/exec/log.h
> @@ -2,6 +2,7 @@
>   #define QEMU_EXEC_LOG_H
>   
>   #include "qemu/log.h"
> +#include "qemu/log-for-trace.h"
>   #include "hw/core/cpu.h"
>   #include "disas/disas.h"
>   

I disagree: qemu/log.h is the main file; log-for-trace.h was split out for other usage. 
That shouldn't mean that log-for-trace.h needs to be spread around.


r~
