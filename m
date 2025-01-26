Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2079541njk;
        Sun, 26 Jan 2025 12:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwkOb9QccFs1rWSpXHWPSxmkGZG+khVfNK+Ok7nfGSzDUUhvrBbaxAtcpU27cdsvKbO/XbguHYx3SW1Q==@linaro.org
X-Received: by 2002:a05:6a20:2447:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1eb215adabfmr66485199637.35.1737923807977;
        Sun, 26 Jan 2025 12:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737923807; cv=none;
        d=google.com; s=arc-20240605;
        b=lB9SfE52l5jhPng0avO2UdeE2BJsoRKNAl6Ta8+wki+8jiPsIKr023Zx2XZGbesQFN
         BDwTKj/m5Yv31/s+anUmedy35cH5HfGUFBCjw01X95S2LKRdpN3W7DD3OSxIQP7EXCwE
         3Lh266jGLJsODlrvooQZb/ywIEnru4t4Gq5RCnxMS1mC73kn3aonIDeqkytAa6/d+MoO
         r3ObsBGnGFK/MNhPJlZr5PjV40WDyQR6uuEFcqI0RyO6bvcON9UALtGKwTri4jbyLhrZ
         CETPBkuHSjaNgQpLHruJr+Z//6fBrTdtJX0fHpzAaYFX4ElzEWOs2hm6lvag9as/etGo
         g50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g2WeP5q4hv+K1Hr21O956YlU/gBG9YtJDHMFPAKuFc4=;
        fh=Xlk1s1i8o8e3tQOywu2/sJS26HKYJ1MeyJfXxRmVLts=;
        b=UcbpovOjFH9zZG4CTqpZYMt8cRIvJdc15XcedZNPyTQPy5C8LhqZac8IpMGnEjGCww
         mLJIhazxfAtLygi8fPLtBXOl4Y4kSO5t4GLqAiBzS4u2f2ZslQS0bMcxX+e403vMb34u
         aL0UgoCRSGJuSce6G8PhZHw1y1U5c8Ns5vBmiWyZQyf4zPRuUH3ETCpm0O7Zg7coNN9n
         QOrJZssjwmWeaZsGeJb7cBWje3hwiVxp++ZjdApE53bNN1dmY4oOcLo6/RHrLQpGpQVd
         0TQH++MWDPkwbdkdQNz69mkmg3LRGwATLrN0GDYaGe/o2uTSSJmcKf42wjydNjpX/I7W
         nmUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRfLvKh9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-ac493f8bdc8sor3185967a12.3.2025.01.26.12.36.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRfLvKh9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923807; x=1738528607; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2WeP5q4hv+K1Hr21O956YlU/gBG9YtJDHMFPAKuFc4=;
        b=qRfLvKh9WfSd0R07A00sQK03IViHtXjEtoN8HfN2566/ezr3lV2IsD554r8dOqtZ59
         t/x+jJYkRGm82pv/MPNBKALnQ40BkqMd72Lp6exAFh3m+G0D57DisVNQL6Fz91cYO/4E
         kDSI5gIeb+GkypslMC/LsEyk42hLsM1EeCbHXA1oavFpNh2VKXSdFf5WJhxTLqs9DgIq
         n4O9NeqZl6iXr5XrN0q9ttXFNdmCOov9ZN0OluVsb++uFx2dV4JfxZ3VC/rwPTcA4/+F
         qzymKHeWvzXrX9SLmSmfmD6j+85KIv8OfzhYkY/dkHwcUrq4v2CX7NqbdzQ71OwKqK52
         bf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923807; x=1738528607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2WeP5q4hv+K1Hr21O956YlU/gBG9YtJDHMFPAKuFc4=;
        b=Jd45riE0ZcqVgpI5DoJderWq0q5dxS5RyyVLN8BE38VcG33JXee6RJ/IEWzaN6QGIg
         e+a2aMWisReN1qn7ICHwq/2kzyI8A5uFnZ2tzGxtX+kxKO8r+FiBCtq25I4sDbEnAi7c
         LOOfYyaFllzo646AUGVLvcYns3CAJBOEer6E6IH4FfLnoCcCKF+1V+4xlsoNVr93FcP7
         LWbqilUgCfH7j4BvmJYugCrzaiswlT/wLqp/qzPlC9PUCWpfj/USVmedYGXBuZn/oIJ6
         Wu4gZSntYRRv7LmnedsQQ5liUsMeBvfwUevU5yzOOSkXGxQjfLH+3sNLEzU2bnRYOfPk
         xahw==
X-Forwarded-Encrypted: i=1; AJvYcCX0aqTQGL3d+V742V5Ien0f+PoCRp+KWjdvqNlJOYKY05uMW1Hfj+NO28L78wM8LBZUkGL1EB0cXRQA8A==@linaro.org
X-Gm-Message-State: AOJu0YzpCjd0WRrrXTo79Q5YSiQqVQeXzEeqJW8x3c/hynHqMRC0zadW
	NC41pH9YpP+nEzji8ZVIWpaM7Hjt0LWpAbTbuoNHa7oY2wzd9jUkNjTgXN0XUQGBBw==
X-Gm-Gg: ASbGncsREYpcYRajnjzXAqG0d8+3SpMXaHU9xrVIb8PTn7vmeifx+IF8RhQJ9NKhRlb
	PZy8LR/a9K4TpUynFgucvnhE+2ynimY1tF4yJaiOMGKjYyz4Khk3JfvVAqD3mvclS6+RUM1HbcM
	Kb6o8FQY3a65M554xJeFzDXsAjyQfGZCSLkvsxxsUXg4EUa5zeRLK0ZbmSpdc/vQMWwj5E3jGPO
	kNAmSNBmPTqMvrhllK2uK8ayQ+2kWB/FSj8MCWxdom855JGiw/bXTk5+JlW8QwuDcxbYl+sMBHb
	C72B+HX94MvFIIq2F954o38TLcRWk0J9yO0xdAkq+cmbFws=
X-Google-Smtp-Source: AGHT+IG7QHEN6N12IEj7HpZ8+9ISOfMpvPDzHND+sb7CKsQVCW2Siz1JbFKV0CJ4CarsM9/PXCPftw==
X-Received: by 2002:a05:6a20:2447:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1eb215adabfmr66485176637.35.1737923807521;
        Sun, 26 Jan 2025 12:36:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b18b5sm5645530b3a.39.2025.01.26.12.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:36:47 -0800 (PST)
Message-ID: <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Date: Sun, 26 Jan 2025 12:36:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' ->
 'accel/tcg/cpu-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6GLw0UYoJwBo

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> TCGCPUOps structure makes more sense in the accelerator context
> rather than hardware emulation. Move it under the accel/tcg/ scope.
> 
> Mechanical change doing:
> 
>   $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
>     $(git grep -l hw/core/tcg-cpu-ops.h)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                                            | 2 +-
>   include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
>   accel/tcg/cpu-exec.c                                   | 4 ++--
>   accel/tcg/cputlb.c                                     | 2 +-
>   accel/tcg/translate-all.c                              | 2 +-
>   accel/tcg/user-exec.c                                  | 2 +-
>   accel/tcg/watchpoint.c                                 | 2 +-
>   bsd-user/signal.c                                      | 2 +-
>   hw/mips/jazz.c                                         | 2 +-
>   linux-user/signal.c                                    | 2 +-
>   system/physmem.c                                       | 2 +-
>   target/alpha/cpu.c                                     | 2 +-
>   target/arm/cpu.c                                       | 2 +-
>   target/arm/tcg/cpu-v7m.c                               | 2 +-
>   target/arm/tcg/cpu32.c                                 | 2 +-
>   target/arm/tcg/mte_helper.c                            | 2 +-
>   target/arm/tcg/sve_helper.c                            | 2 +-
>   target/avr/cpu.c                                       | 2 +-
>   target/avr/helper.c                                    | 2 +-
>   target/hexagon/cpu.c                                   | 2 +-
>   target/hppa/cpu.c                                      | 2 +-
>   target/i386/tcg/tcg-cpu.c                              | 2 +-
>   target/loongarch/cpu.c                                 | 2 +-
>   target/m68k/cpu.c                                      | 2 +-
>   target/microblaze/cpu.c                                | 2 +-
>   target/mips/cpu.c                                      | 2 +-
>   target/openrisc/cpu.c                                  | 2 +-
>   target/ppc/cpu_init.c                                  | 2 +-
>   target/riscv/tcg/tcg-cpu.c                             | 2 +-
>   target/rx/cpu.c                                        | 2 +-
>   target/s390x/cpu.c                                     | 2 +-
>   target/s390x/tcg/mem_helper.c                          | 2 +-
>   target/sh4/cpu.c                                       | 2 +-
>   target/sparc/cpu.c                                     | 2 +-
>   target/tricore/cpu.c                                   | 2 +-
>   target/xtensa/cpu.c                                    | 2 +-
>   36 files changed, 36 insertions(+), 36 deletions(-)
>   rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7be3d8f431a..fa46d077d30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
>   F: include/exec/page-protection.h
>   F: include/system/cpus.h
>   F: include/system/tcg.h
> -F: include/hw/core/tcg-cpu-ops.h
> +F: include/accel/tcg/cpu-ops.h
>   F: host/include/*/host/cpuinfo.h
>   F: util/cpuinfo-*.c
>   F: include/tcg/
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
> similarity index 100%
> rename from include/hw/core/tcg-cpu-ops.h
> rename to include/accel/tcg/cpu-ops.h
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index be2ba199d3d..8ee76e14b0d 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -22,7 +22,7 @@
>   #include "qapi/error.h"
>   #include "qapi/type-helpers.h"
>   #include "hw/core/cpu.h"
> -#include "hw/core/tcg-cpu-ops.h"
> +#include "accel/tcg/cpu-ops.h"
>   #include "trace.h"
>   #include "disas/disas.h"
>   #include "exec/cpu-common.h"
> @@ -39,7 +39,7 @@
>   #include "exec/replay-core.h"
>   #include "system/tcg.h"
>   #include "exec/helper-proto-common.h"
> -#include "tb-jmp-cache.h"
> +//#include "tb-jmp-cache.h"

What's this?


r~
