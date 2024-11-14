Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp2422dll;
        Thu, 14 Nov 2024 10:23:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCbTJ9PxO2267noQaMr4VCG/zimKmXtvU4AyaDjYqKbMx9lnBfg0CLRnEu7Uxi2fLyHzQXx6mbimkKTA==@linaro.org
X-Received: by 2002:a05:6a00:4fd5:b0:71e:7f08:492c with SMTP id d2e1a72fcca58-72475f97182mr124131b3a.1.1731608636028;
        Thu, 14 Nov 2024 10:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731608636; cv=none;
        d=google.com; s=arc-20240605;
        b=k2NWowvublQq6X+fkQy8fmKd7uFXJs15BYsvbOI0/WG1HUT8OdwT+Fx7RTFkw5iYxy
         kDl7AeHkjyHyykAA0UHr93vYeNkuG5Q70RwhBFS/NmmH0OvOeRzFYFR+z3HoZ+3ca976
         I/AmmC+kFx4pQrJc8QZDUGWGIxFQzlwBjwpURCngdAYRmIm8i6T4TBSWSLbBPXoCs2OT
         WB1mCFCzchTwczbIE8C4Ei7P9Udgx9eF9wrQouQ9oq4lmQZJtOayGYLiscDJ2d+a2d3e
         7DoozQRzQoJ0a8a+/72GnBRr3HoV/3Rnrutd9Jc501nQPkJGhVbCOrpiu6tzcPLjdho2
         JvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pWrlQmqkGFoVZPKM2LGF3oDBVshqqzwKduuS1JkstNA=;
        fh=ml+MFRXCA05Wvynbq/qwg6q8wqb6xuRVrP7UiM/cJ4I=;
        b=kFWvXmQZKpZcosEjr1YVSCSdjHUV4Lnpp9g1W+IoAqXWZ+82Q7QvqRwGLjmT60N3fh
         1KjH+RJaTk19y4qbcSzKsl1jRtg3chyOBVpKF+OPZoReubZ2LeZrkHHNQW9E3i2vXpHq
         OTqazXMHBzA8vilfeTWpSKJwYOAmyZOosRHX/0HJEuy6D+VUEkLQP2bskqf3erjR9aDK
         RqYRXHvhm7oos6w3FC2hR60ekMVz20zZW8bssdYX/gtKSmfqy0dnKooGpTexE3O6yY/N
         piY21fDuY4hGDcNu6pI2uDLQcdo+NcplpiNeiaQ69tFr4vPYVAWz9xB7oXTnpa/i+Nex
         6q4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAnxogC1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a6f67ddsor1043359b3a.1.2024.11.14.10.23.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAnxogC1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731608635; x=1732213435; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWrlQmqkGFoVZPKM2LGF3oDBVshqqzwKduuS1JkstNA=;
        b=mAnxogC1PQexinZH9DW9XIv7n+A0dY4CjX/efNspGy/pA4O5Hf5rAotGOuDFncLWBP
         47nkW+2sZzUUMq0XJMPrg6BDaInMjsS+5oPAA0pzO7Xyp5RFe94lzS2Z+XITLQ8+ocLt
         ttAQMsXSTL1dkc3NuXFc/MetZqm8EpyGkfV64szPe/k40AJy7lQ5nx5FkULaaX8WgVUn
         9h3EAUk+iqIMp0DJPSSu5EWl7nmPcVG9lBfjAOMXcfq74iajb1HYD4KGKtBeZJYGZ6XE
         qFiyg9BwmzdbEVnnch23L+I2AJJC3N3x9iT5+pvxA1hPeSJio6g+mXjO0X+6wQ4/xQ8V
         9FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731608635; x=1732213435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWrlQmqkGFoVZPKM2LGF3oDBVshqqzwKduuS1JkstNA=;
        b=ix3UwdYk5b8XoanORpoWECm1FhSG5XL32ZShdSNo/rlwTf4gN9Qdnt1vhpB4TaBVw/
         Wew7ZPnyClWMv2SsICOQrLBxNyU0PtuavSzEkXxSpykMCMVFhymnkf8oRRfFi6wVOviH
         anKDltHwSc6zx6zGecuZOVeXOzVmXmnzwMtWa+/BkdZxK8QyNRcelLiHthWV/NRi/heX
         8iKpDWaYIV6EmcbBhdtrYX04tS4r+FNhCTB7yaduRcle7frC/0uvd8C3NZB0t124+17f
         iVnFE1iI32bk+glTLiCAuuV2/3W/lvNQ9XZ9UpwZdnTotcj6WXJkKs39BJ+ubbcLbPtk
         oB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJdG2eqli+0ygAOW1GsjPjjJGALZYDpzXoYRt8G6gsz/G2OD0GzCm1fOm5tJSNEWUKgZSlIfKNvq8w1Q==@linaro.org
X-Gm-Message-State: AOJu0Yw5vwRoBTQolCEYpQyuV98v+34Ew9fYc78LStYqlfIyG6azge47
	+nYUw4K9FSZaZCIHDEDQp/jYv6RaUqZDhLSTVznSvlOgpuTrstoiDLKgh+qwy8Mxzw==
X-Google-Smtp-Source: AGHT+IFaM4tPkOHim3pBzQlGQstO9lIzVCJDZj4sa8QMuEUhTc9wH21LsRXyx0yzd4mGebp4quQW4Q==
X-Received: by 2002:a05:6a00:190c:b0:724:66cf:163f with SMTP id d2e1a72fcca58-72475f97125mr132951b3a.3.1731608635245;
        Thu, 14 Nov 2024 10:23:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a6e716esm1550837b3a.59.2024.11.14.10.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:23:54 -0800 (PST)
Message-ID: <453e90d6-f8b8-436b-b3a0-45c11fd8e813@linaro.org>
Date: Thu, 14 Nov 2024 10:23:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] accel/tcg: Include missing
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
 <20241114011310.3615-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +/bQP+Wo0PFF

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> TB compile flags are defined in "exec/translation-block.h".
> Include it in order to avoid when refactoring:
> 
>    accel/tcg/tcg-accel-ops.c:62:36: error: use of undeclared identifier 'CF_CLUSTER_SHIFT'
>       62 |     cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
>          |                                    ^
>    accel/tcg/tcg-accel-ops.c:64:26: error: use of undeclared identifier 'CF_PARALLEL'
>       64 |     cflags |= parallel ? CF_PARALLEL : 0;
>          |                          ^
>    accel/tcg/tcg-accel-ops.c:65:34: error: use of undeclared identifier 'CF_USE_ICOUNT'
>       65 |     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>          |                                  ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 3c19e68a79..22486c5dff 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -35,6 +35,7 @@
>   #include "exec/exec-all.h"
>   #include "exec/hwaddr.h"
>   #include "exec/tb-flush.h"
> +#include "exec/translation-block.h"
>   #include "gdbstub/enums.h"
>   
>   #include "hw/core/cpu.h"
