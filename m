Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp838835njb;
        Tue, 13 May 2025 15:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqrZhFE0amt+7E3XBhsJeHCmidcdi9P9uycLZS/EyWwWdx0WNfQf44nQsBhrTLu5ZD1YJnKEzzXqe/Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IGASIU4o4Z3PDpX0UWPQtCTzcv9D6YJqKsvNya1zVZhklnznKUVOH0xehYwNafZ1DoksoZZ
X-Received: by 2002:a05:620a:688b:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7cd1de7cb5dmr735887185a.8.1747176977470;
        Tue, 13 May 2025 15:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747176977; cv=none;
        d=google.com; s=arc-20240605;
        b=WA+v/PHhIbMQn0K25ycsw+urQyCmo7Totczwhs0a3H/iuvKYSLDpR18xeF3bkodMxm
         c+EM87hG3f3g0k7PE8m1Vv9aD97MLw2e3f0r0Ef0FUgUep4peG7Sm1kHUlYXg3TwcUml
         lA9cxJMESusbOgA4rAHd9zHg9Av3qhxa0AjZh2zyS0Th9ZYhp9PpdeynUNQ4ppnSczv4
         62GnfEsDw8YPtCg17kdFV0GfE0GMIHmi6PezpLYJokt33ubRHCeqCC78vMNjsp7DUGGH
         7uKKpLFHsklU9LlkGQc1q49tzULqk6k/WhL7U9ReGWDt7z/48vR7nX69lqA0dYU8V1gT
         i2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LBJDbb+g+rnG8821hA+sNUH+3t1umps8kf5QOmsN0dM=;
        fh=tDo1sjLGPAilqSF1yiKQyjDS2gdQWx5jJt4qeyTFl4E=;
        b=jCHoz2jPiBq8UOsd0NR0yPKs3fMwmFh00samiLnB07xmtI7QZGRe5lX5RCDygEH2ss
         b22gXL+Vhb0PeKxEm2/EtMieWDoTmKmcmqW0DET49O3tbOHH3yUO7BhJala/dkRtYPwV
         hcg2QSwoPt92vfteTtlOgWLSeUjnnti6ZpXjzQZeuP4weDspVujVsIvIr4M2CnN8TztS
         L774E8eqqAr4R9ptEPsIkucIdi1cAbhQtIZsSvuKDhiv6YVZnNWHyuTmY0Cg4jplGwiX
         B8+Oe3EqzG2r3XPxqn5/mJu9t+0zDZUnp3ze4rPWmswuRZnBjhSup5HNKm48j5tVg7h7
         BzMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEekhJ6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00ff0505si1291891185a.571.2025.05.13.15.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 15:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEekhJ6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEyXY-00062G-6Z; Tue, 13 May 2025 18:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyXW-00061U-8l
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:55:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyXT-0003lp-Ek
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:55:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-309fac646adso310800a91.1
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 15:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747176954; x=1747781754; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBJDbb+g+rnG8821hA+sNUH+3t1umps8kf5QOmsN0dM=;
 b=eEekhJ6WlQnt0wZusp+z9QV5rvDfaZixX2XBij8byAbVug9ZUYkdxg+iC3TR2FnqJz
 nhhtDqm4gz4+3atXMou1zLaU1lxouPnDCt/cTtCXwsNlBSJoyTZlTKtgHs0iSO187rqe
 St4KnFz+rPQQ0DhEYzjwOHrPiTrPZ4PTzt9CjQTYYqaTak4tofbI1nXQ6vFio/MrlMDS
 gKKxNSealfRH3a9k99rXvgIsH4i3kDMa9z/n+0ZI/teUjPBAc7qvtSWOYpUsfp0BtS4u
 6WcF3DcKVHg3DrREToanBaNNTkIHb0Aihn5UUH+QuGJisg8elG/F7AyBxVYPn3fc+oMr
 Y4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747176954; x=1747781754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBJDbb+g+rnG8821hA+sNUH+3t1umps8kf5QOmsN0dM=;
 b=piZryZnZFkVG9W+RHAQeuNNnE+cM7XY75LGN9HidszFjVUGG+0qdbA+uTla4A3OK6O
 Q787sYaTcYaOogw/PB9h+X5v6EsZRo0JE2hakOSkSgInZH7V9ZT7audE4k1oNkoo3E3q
 XkCDYcuhcg6Rm2xe0mp9a834LDETm53nBz8cen8iLTUibVaPKY13AMF0s2LReR0kX8GA
 0ByOlk6B13kzfLP1hxIvxWlZ5dAHGLIjUnuyGidq5Xkh+il/7mF9VEopknEIcpJPuBLu
 n0JzXPJalzX35O4Y/Eswsu54Pwg8TexI5xEL95zOaZ39gBcqaLOAFMKxjfzEETKX5Gci
 PA/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcpp9Y0iH2QM10Eziuy8LhAdv6juh5rpnhoYgCUHRPSUGg9blzYRPOby/y6jgwF73c/ta0u+qZ/A==@nongnu.org
X-Gm-Message-State: AOJu0YwnGaCSJp3N/o2cqXg/JnpvedG6cJFYBcKV7Y4a7M0UqVl9Tnjq
 Fez5VvcpKzCDOjwePxcC7iz5zeyMjVKr6kP6DzxeItiWL4hHal1pKPLcZgXKO6o=
X-Gm-Gg: ASbGnctWGLnM+/t9SNF2/QbDNkPEbFHiQNgdjEDD4K4ZBJ6C/Q40wVHBxwJ14mlPIkS
 x9WbxADXkQWVRNlRVV/ujnfYjZBFhkJfKjyzoJVFW8aFVxzk4AM1tipY9mc7cvCkShpHphkE7qI
 aeuURtBCeNbA8aPSzs7gHvgXUC+bnemZou47+lr6kEMuIzqH8ItknS7jEUblQqDasMjCNaa4iYi
 aI7XEBdMVawvnvhzm8DoenoEc4cDu3yWg6utFtJIJrrIYHsw0gBZXPrnGAACrHO28X9rq3K2l6z
 BPhRXpMa3NfETDhAGUAbefHOiJ+Vm8pRsFNlZ0DFrFuyQT3aZ2G8t2U/MjQwZAnY
X-Received: by 2002:a17:90b:33c8:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-30e0db01419mr7180936a91.7.1747176953809; 
 Tue, 13 May 2025 15:55:53 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e33482fd3sm136941a91.37.2025.05.13.15.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:55:53 -0700 (PDT)
Message-ID: <d7e3158c-2115-4a74-96a1-aec7fa99e172@linaro.org>
Date: Tue, 13 May 2025 15:55:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m+jhinxxRx8s

On 5/13/25 10:17 AM, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  |  9 ---------
>   include/hw/i386/xen_arch_hvm.h | 11 -----------
>   include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>   hw/arm/xen-pvh.c               |  1 -
>   4 files changed, 10 insertions(+), 25 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h
> 
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> deleted file mode 100644
> index 8fd645e7232..00000000000
> --- a/include/hw/arm/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#ifndef HW_XEN_ARCH_ARM_HVM_H
> -#define HW_XEN_ARCH_ARM_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
> deleted file mode 100644
> index 1000f8f5433..00000000000
> --- a/include/hw/i386/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#ifndef HW_XEN_ARCH_I386_HVM_H
> -#define HW_XEN_ARCH_I386_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -#include "hw/xen/xen-hvm-common.h"
> -
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index df39c819c8f..8bacaa4ec41 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,5 +1,11 @@
> -#if defined(TARGET_I386) || defined(TARGET_X86_64)
> -#include "hw/i386/xen_arch_hvm.h"
> -#elif defined(TARGET_ARM) || defined(TARGET_AARCH64)
> -#include "hw/arm/xen_arch_hvm.h"
> +#ifndef HW_XEN_ARCH_HVM_H
> +#define HW_XEN_ARCH_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +#include "hw/xen/xen-hvm-common.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
>   #endif
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>   #include "hw/boards.h"
>   #include "system/system.h"
>   #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>   
>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>   

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

