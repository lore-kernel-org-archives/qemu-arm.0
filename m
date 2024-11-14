Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp478603njc;
        Thu, 14 Nov 2024 10:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWL7g3Kg9hwUeulXzCJTmV6fDhGaiWLgb8pZpUwqkL6XGK8H3X8s32v5Kp0YaBnxSssSDLWkqzbWCAaOQ==@linaro.org
X-Received: by 2002:a05:6a00:1307:b0:71e:6728:72d5 with SMTP id d2e1a72fcca58-724132c1a44mr33659258b3a.15.1731609824425;
        Thu, 14 Nov 2024 10:43:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731609824; cv=none;
        d=google.com; s=arc-20240605;
        b=NvM8C02FhRu4LNXMuA8VOT7i5iGvS0QuCBE/Dql7X2kiCBiHmyE9eVDC0Lq7kCCqri
         DZ06rtPR9EE4w4nV9JDMT2/LvsuZ7FFOXMTwCSBRQIZncE92k8AKvgSohoMuGQ8MjX/g
         aU70kEMkp5R7Z0j+56r/1SMjSs/BuyeXMoeD43iyPabrMzD0kY6uVLnTXuxFxVFIlWoG
         HdvVPr+CgW/B0hOsqUXF3sZuoLjnoT+oakWwfUnZFRe/QIqvjso4VyW0NsASKYfHBAab
         zr+gCq1DAKyw/NYPAwOrr7kQEXNQyNKyrad7X1y/8m91XssQ4B0tpzN/s610prW6NLqr
         PVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XjfAF/SJK3eDJAFNumNgZbXhsBbAjVolOCWprgqHspU=;
        fh=98ewQIm1S6pnhKCMYhJGAjtjCXuLztTE00boya05Sgw=;
        b=NGBN79D+AY5KSpe5qvJgvVXfbcBZc5mWDrUfAa1iqdkoEE4LAMNqisg33IoNiOntBn
         8/UvPJE+Og8U9nqaIBb+0VsHmxwe6d4KZ9i4so9qbabI8DTA7w+w6n+xOqNh9aja6Fay
         EuHKmv5loQlLoq5ZI+rOu+NfXIhxtp8aBdOgnNG1S+5GtOSFUc89/QCbhPqW0Xkd4HRT
         GcMW7xuZ9PgYpuVde6uMEh4AtkLcIGGwIQhmIay/I+36hHKW3Fibbp19wuL6+BU5kbQ3
         1prD1erVL19xzD64XLhAQ4lRXtB8A5pC2ra5COJh2hOskSim0N60prFOdRfIlt9YifEc
         BEPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6imyjLz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a9d1993sor1262507b3a.9.2024.11.14.10.43.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:43:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6imyjLz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731609812; x=1732214612; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjfAF/SJK3eDJAFNumNgZbXhsBbAjVolOCWprgqHspU=;
        b=M6imyjLzIcFgQ2e7NK2HuW0TfbgtazzZ6p42Yb/CSdw/yVS8lVxz6vx//VSYjA7PdT
         U589r04Ku/qSFvM2u8Xur8UbbrJMWmfGHApL7ZuqHg8VXrClJz4eyStXmxW/j69B8key
         SGTJ5ZMONgDQgMLqcTtHx0qz/W8UxN0ic1c2OiFy02I1oSsT+sA3sh3U2wJrHZBeVkOI
         gqf8B7Yvz6YuY9UttaQLGoi4U70+zzxo+Ha3XmZIvN2x2/N76TpESSQ5uCXl881DClKG
         m6E0EVdE7Rdqkoo+2Plc302ImhZP8X8owQvinp/86osk8zACZU/VGjPwm1iTW0hH9D0G
         vG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731609812; x=1732214612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjfAF/SJK3eDJAFNumNgZbXhsBbAjVolOCWprgqHspU=;
        b=rUtGMVsLpMzV0ghTZMseZmFqeh27Oq/SVyRKr3NjxqA6XysExOCO8Xn9W1IkuH91Y1
         yv7Ik+9/q6ZgCFvv0PVKuEi0cl382MIdSHIwL9kMdIgNa5Xhx2AqpLzow9TaXI27Ubzb
         Y0z504BQynn0K7D/vrE2gXMe8DSTR0RWKGGCKy2c3llaAmStweeE/GKwCtijCY4a+K5T
         34B3xi9HaMBt4k3j56D3urjxPH7RJwXbC1zzxRkNEpy6WL8p5hAKgfPT2tKAUSqPfJxs
         kl3hY48ewXLcWAs3dNvfEPnbvJsUzuA/COm3MXJV7+XA3ZlqSjg71ZR8kvwo6DkVaclq
         qXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUXW5/yb5BA/Gc2NWZvsC8qgY4OIJxVveGU90KLrOLEK891xZW6eI3sPeErQ61bdGDCO66U55Dil6EoZQ==@linaro.org
X-Gm-Message-State: AOJu0YyjIOwD6EOtVWRNsziJx3SQ8j7kHRhpRbMomL+yxZ+I9UomzGlW
	pFRoqnxQl2MHVFHw/RGMhD5G4I23OcOmu2yMwPTRsKV8h2OZIaGCWHhlBXilwNciiQ==
X-Google-Smtp-Source: AGHT+IFZiFRuTPhuuPl9RedinzOTAidWxryZvOz2MP4W9IYmAynVnyLjPAGi0/vjNnIsl6cVobjXLw==
X-Received: by 2002:a17:90b:3c84:b0:2e2:c69b:669 with SMTP id 98e67ed59e1d1-2e9b177d6cbmr32076950a91.27.1731609811796;
        Thu, 14 Nov 2024 10:43:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06fbb549sm1505103a91.52.2024.11.14.10.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:43:31 -0800 (PST)
Message-ID: <b7d12d85-fa22-4b53-ad09-b55ae62e4d9e@linaro.org>
Date: Thu, 14 Nov 2024 10:43:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] target/rx/cpu: Include missing
 'exec/translation-block.h' header
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
 <20241114011310.3615-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sMERCaiVFWnn

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> The TranslationBlock structure is declared in
> "exec/translation-block.h", along with the TB
> compile flag definitions. Include the header
> in order to avoid when refactoring:
> 
>    target/rx/cpu.c:50:42: error: use of undeclared identifier 'CF_PCREL'
>       50 |     tcg_debug_assert(!tcg_cflags_has(cs, CF_PCREL));
>          |                                          ^
>    target/rx/cpu.c:51:21: error: incomplete definition of type 'struct TranslationBlock'
>       51 |     cpu->env.pc = tb->pc;
>          |                   ~~^
>    include/qemu/typedefs.h:116:16: note: forward declaration of 'struct TranslationBlock'
>      116 | typedef struct TranslationBlock TranslationBlock;
>          |                ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/rx/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 65a74ce720..945ae6e9e5 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -23,6 +23,7 @@
>   #include "migration/vmstate.h"
>   #include "exec/exec-all.h"
>   #include "exec/page-protection.h"
> +#include "exec/translation-block.h"
>   #include "hw/loader.h"
>   #include "fpu/softfloat.h"
>   #include "tcg/debug-assert.h"
