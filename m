Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp495926ejo;
        Mon, 11 Dec 2023 13:28:26 -0800 (PST)
X-Received: by 2002:a05:600c:808b:b0:40c:314f:5747 with SMTP id ew11-20020a05600c808b00b0040c314f5747mr2595073wmb.112.1702330106175;
        Mon, 11 Dec 2023 13:28:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702330106; cv=none;
        d=google.com; s=arc-20160816;
        b=V9+5R26+zHsrQ7rV27iC/vd5OYB4qpJu9UkHGEjwyMiD6zhb5gKItkrd3lo/w5pQy8
         vjDdS4jVCml816Jwty728eh0PzXdr1HHPQ81i7YT091tmendWCYafm8Gdoqa+BXW0TP3
         Kimv9z+bGQHJjvQefri1Htevzo/KAEXaGttqqD2eZcJmwtzg8Qaqq2pWABnaHMjeTDLz
         /c9nP7AroeJ8sHZtYJj1/6UO2lC8D/N0CTqcK1NFGwSucLhUo7bTQNHuK+neTKIm7rFr
         mOOc3NtUBsDSwTdWedNBsot7H0yTHSRef8I2nY+W3nEQ6G6vYlfTPSb/2xZ9Bn6K/mzB
         0ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X5fiX191P4G5pBLsLalRnbHg5N0cH0B6SHCS4O/yB3g=;
        fh=rYMw+LxknRbPxzhFod/KycX9GDPjQmedSl4WwGp3PEg=;
        b=oFPaPL+sXbDuUKTwcyvJZiFIem9QRVbWX2kaiGChfXhP/NpNHy9b04ULi0PCLVkfCK
         yy8eRwAVit96acIKv9Bp5eaCT2enWBbENZnGNv1v8gD+MgG1xYXWIMTQvT5y2mPL4lN2
         pe4/XgHnFWIBNOIiozaPetQ4rRwKhtMf6UYKY8cOjrSuhZid7BO5AKWMgbterfgipjb4
         QZ2m1tEyBahFUM3VdfnapUtLYJYyeNXXTnnEfrAba5ud+nrSbybnPQFwnLuWANSzUEQZ
         wmCacCb153at1nP7jIGeya1kuxHfrTOsM/PrZI4IyKAVy8MttKqYmbsgAPqrnRi3xJFR
         Q7Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUCvsvB+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n15-20020a05600c3b8f00b0040c23be848bsor2914288wms.11.2023.12.11.13.28.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:28:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUCvsvB+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702330106; x=1702934906; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5fiX191P4G5pBLsLalRnbHg5N0cH0B6SHCS4O/yB3g=;
        b=FUCvsvB+w8DqL2dkPlzRUUhwdnUVUCBy0dAXLeNq08T8Ci+Vigtj7EwsWGAGJ/4Y1C
         sDrQbCeqh88SstYNQKRuf6d9rdFAm20o9F+gFOQ81vlfMAeVCuFTQjZ5MV0PjHQ9Gsh7
         dwRWZzY8S6cP3nAO4qZvqesKoHJxQtVqgiopmGUlZzWm4SE/INUP33o1s/zB132EnVbQ
         rxzD6sJomJoPAtJDUF1PLyPxgtc0+sgJEUsexh0SaCzpelA0mtHCRoPk3Tx54YE1GWP7
         vbeJFC9Z46hKRZRy1J6CG/UNA+cXkGrD9syB79lp3HS3v8zCwcmnUOKe3CBGZmSTe2K4
         Ugrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330106; x=1702934906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5fiX191P4G5pBLsLalRnbHg5N0cH0B6SHCS4O/yB3g=;
        b=RTsYxtfNiGOgw1efh5tp5O8gJ+BzemFtmb4erwa51zEEVmOxz6EAsRqz+1Qy3zZlwN
         aUXHvtE1b6Z99KfchU21vhQrjCvK7vaPM5KvuId4j0a+6AhQ8x9jzZK93zMJ266T/R/h
         YbekicpNAYGo9Bzw3m17J154UjtoJXN57H63D8Cyl8pajyg01M7drFKhrrTgJrwZrnFI
         svRYgUxpZxnPpKpgWZyR+w9HlvS9iW+3HQlxqCQbMv38KoPQ7IT70+zp1KFGjqmA9kFh
         +Vy32kIR/jwy+qV3m6GfsrMXSWyM3A0TaYThIVa8MsNTUxWgwflSUnibE4+IbTILoux3
         wbmA==
X-Gm-Message-State: AOJu0YyoasdTd9H1Mlp6ohf3nq7/B8iD/AaqbrHRH/FSIWjdllJeAgEE
	PeaXiGQuUX//oIZbT8ZJPIsQjiFz
X-Google-Smtp-Source: AGHT+IGF9wlJDqbTFsQ+lI7POZDFz1IPDejuBWORh8oTC1zt3ac9hgvmD2JUuv0T0TaVCeR5cmcUZg==
X-Received: by 2002:a1c:770b:0:b0:40c:7a3:888e with SMTP id t11-20020a1c770b000000b0040c07a3888emr2762705wmi.148.1702330105669;
        Mon, 11 Dec 2023 13:28:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id d15-20020a056000114f00b0033359ae2d52sm9380197wrx.17.2023.12.11.13.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 13:28:25 -0800 (PST)
Message-ID: <1738ff77-057a-4f92-9a58-e1e1573db3d2@linaro.org>
Date: Mon, 11 Dec 2023 22:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] exec: Declare abi_ptr type in its own
 'tcg/abi_ptr.h' header
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-21-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231211212003.21686-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WK9hlP7tchAJ

On 11/12/23 22:19, Philippe Mathieu-Daudé wrote:
> The abi_ptr type is declared in "exec/cpu_ldst.h" with all
> the load/store helpers. Some source files requiring abi_ptr
> type don't need the load/store helpers. In order to simplify,
> create a new "tcg/abi_ptr.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h   | 17 +++--------------
>   include/exec/exec-all.h   |  1 +
>   include/exec/translator.h |  5 ++++-
>   include/tcg/abi_ptr.h     | 32 ++++++++++++++++++++++++++++++++
>   accel/tcg/cputlb.c        |  1 +
>   5 files changed, 41 insertions(+), 15 deletions(-)
>   create mode 100644 include/tcg/abi_ptr.h
> 
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 25e7239cc5..c69f02b699 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -65,18 +65,9 @@
>   #include "exec/memopidx.h"
>   #include "qemu/int128.h"
>   #include "cpu.h"
> +#include "tcg/abi_ptr.h"
>   
>   #if defined(CONFIG_USER_ONLY)
> -/* sparc32plus has 64bit long but 32bit space address
> - * this can make bad result with g2h() and h2g()
> - */
> -#if TARGET_VIRT_ADDR_SPACE_BITS <= 32
> -typedef uint32_t abi_ptr;
> -#define TARGET_ABI_FMT_ptr "%x"
> -#else
> -typedef uint64_t abi_ptr;
> -#define TARGET_ABI_FMT_ptr "%"PRIx64
> -#endif
>   
>   #ifndef TARGET_TAGGED_ADDRESSES
>   static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
> @@ -120,10 +111,8 @@ static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
>       assert(h2g_valid(x)); \
>       h2g_nocheck(x); \
>   })
> -#else
> -typedef target_ulong abi_ptr;
> -#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
> -#endif
> +
> +#endif /* CONFIG_USER_ONLY */
>   
>   uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
>   int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);


> diff --git a/include/tcg/abi_ptr.h b/include/tcg/abi_ptr.h
> new file mode 100644
> index 0000000000..415e31cabb
> --- /dev/null
> +++ b/include/tcg/abi_ptr.h
> @@ -0,0 +1,32 @@
> +/*
> + * TCG abi_ptr type
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +#ifndef TCG_ABI_PTR_H
> +#define TCG_ABI_PTR_H
> +
> +#include "cpu-param.h"
> +
> +#if defined(CONFIG_USER_ONLY)
> +/* sparc32plus has 64bit long but 32bit space address

Forgot to squash:

-- >8 --
@@ -11,3 +11,4 @@
  #if defined(CONFIG_USER_ONLY)
-/* sparc32plus has 64bit long but 32bit space address
+/*
+ * sparc32plus has 64bit long but 32bit space address
   * this can make bad result with g2h() and h2g()
---

> + * this can make bad result with g2h() and h2g()
> + */
> +#if TARGET_VIRT_ADDR_SPACE_BITS <= 32
> +typedef uint32_t abi_ptr;
> +#define TARGET_ABI_FMT_ptr "%x"
> +#else
> +typedef uint64_t abi_ptr;
> +#define TARGET_ABI_FMT_ptr "%"PRIx64
> +#endif
> +
> +#else /* !CONFIG_USER_ONLY */
> +
> +#include "exec/target_long.h"
> +
> +typedef target_ulong abi_ptr;
> +#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
> +
> +#endif /* !CONFIG_USER_ONLY */
> +
> +#endif
