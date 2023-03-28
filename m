Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2775125ejb;
        Tue, 28 Mar 2023 09:15:35 -0700 (PDT)
X-Received: by 2002:a7b:cb02:0:b0:3ef:672a:2c93 with SMTP id u2-20020a7bcb02000000b003ef672a2c93mr9179229wmj.36.1680020135555;
        Tue, 28 Mar 2023 09:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680020135; cv=none;
        d=google.com; s=arc-20160816;
        b=YMsJ55qe6UqAAqQLsohFRO0W+NoPlgkBU6QBtVtpC5oA+HD8wTtHymNtgD32WfzA68
         +NyET+PeMqwSVolUbmujgOicfVQA8EIAmjfS42w8omEOdzsrKM8iIIXhJs0G18Ih5Ogf
         +bkWSsDSGw4ALNyB1rGztNWyID0oY1UgyGSWyctQc6UsCnaRbApNOu6ikNdSAQxeogFb
         dZ1wmR4m3E1BioBMyLfALizZLm24zlZQScxazlk+honUKMeaPKBrI5da0zgT1w2CnhIf
         WVFTt2ipi4nyziSoJh+3hZLRmrX31tR7RfJoksYX7R6CblW51eZ+x/JnUTPCwG4TFubq
         P7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DWKWWkSsnpfRn2+LYEIqq1vAGExKdFNDPfBo77h5+cM=;
        b=gKSE6TQ80QAEYQWFnqz88NUEcXjDbveN4VIVIPtp3hMBt90SveRj9fuYDCPRAd9H5w
         6lUEfa1PIyddpnihE6w/OO5+1L64LqHQpBaGJgO3comK5vMA7fiV7EPEW18jKyjq/U4K
         prd9l2NDu4rff5NLoAcy0qKCoi/ky+whKkcKiBSE01fP9i4w4yq1OrKqXpZIF369BBNk
         YjzMQGAZd9Earfceb3nT0pPWQ5smQ4KifOp4U90HjxJ9zXl0M9YtxSZNHQPET50rr9fk
         r95rMaG4d1TfydpJFkuOV+0ZgJWfkLjwSWso9SUeaywAtYvLkqTALNy3e6PCcmocLy+n
         +hrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XifWTcm1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n23-20020a7bc5d7000000b003ee032b1cb3sor4497771wmk.27.2023.03.28.09.15.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 09:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XifWTcm1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680020135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWKWWkSsnpfRn2+LYEIqq1vAGExKdFNDPfBo77h5+cM=;
        b=XifWTcm1xnu6f9aPouPR7VpIbR1N50dcIM54qN5Mlbel5sTiLdbYCmSrtLw+KEdPPn
         1cF9OK2tzNRfBtBzKhUWKFrzydK8HB4RjTKxG3lRQznlJeHEt9b18xI81tjKIDcLO6Eo
         YZN+JIkHNrswH2apXYp8qCAmDm1e5xx0qqkC15FhCIwF6ikGsN0usjVkw1cSN9SUrgnK
         8eYG+LVZqlmkc8PnWAVpdiGIvfXNjoI6Yim82jOq/aaqYsae+Z9+beMNWCNpH65ymKQM
         Iq0Ggbxz0pC8gHx8Yu7TY2O7CoIbWyEFj/IQVWk10QxRBgFl8Cd+FqnAsOaeBP7S7dNP
         Oebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680020135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWKWWkSsnpfRn2+LYEIqq1vAGExKdFNDPfBo77h5+cM=;
        b=DOLrPDMbntsoN1FDe+vM7fjyNQuSlSKwC1GjRWreg0AK/hRTRyxkBpgziE5pZ7aR6T
         Rn3tk/TD4xfZZlq6K6TVaHE57DUQHSkzf/8vCOeQKPKwMA3x3EnbydDGURBf14fKIJWV
         k07PonWEsf4IMQoTvLbGx0eqgyWpIxLJP7jQX0zGDtefSzS6rBYjRqnjQygO5O4l43s7
         tImQmFpKqLmbNTXFehnEDCG3lz0WfKV3XDWGVWZ+sQfuJrgeemy/FhmiEUJy6/XxQYmv
         j+Wy8pX2a5GYpoOLdF1nbcCPZwU2eo3NXcHJgEBizIKv2mL6WcDjhZoKTjZi6VxUt4YQ
         rzHQ==
X-Gm-Message-State: AO0yUKX408aMbDp9Cie5Tmyny+ZLdAjRp79A7C4DivZrXHWQzMuRNotD
	AOnDA17XV/G5VUeZMCTPUOXGRzT+
X-Google-Smtp-Source: AK7set9OcnlChpyZKYyxyXwjedxJze5iXZPnnxbaugRBy5012tIcIyFoZkfRD1TZBGXun9T1yu26jg==
X-Received: by 2002:a05:600c:2199:b0:3ee:3fd7:5f84 with SMTP id e25-20020a05600c219900b003ee3fd75f84mr12627963wme.6.1680020135178;
        Tue, 28 Mar 2023 09:15:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003ed246c1d28sm17270217wmi.44.2023.03.28.09.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 09:15:34 -0700 (PDT)
Message-ID: <fff8236b-831c-c844-06d4-7eb417367e23@linaro.org>
Date: Tue, 28 Mar 2023 18:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 2/3] softmmu: Restrict cpu_check_watchpoint /
 address_matches to TCG accel
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20230328160203.13510-1-philmd@linaro.org>
 <20230328160203.13510-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230328160203.13510-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 72dCfwDkAAVw

On 28/3/23 18:02, Philippe Mathieu-Daudé wrote:
> Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
> are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
> to be sure accessing them from non-TCG code is a compilation error.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         | 37 ------------------------------
>   include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 37 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 821e937020..ce312745d5 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
>   static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
>   {
>   }
> -
> -static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> -                                        MemTxAttrs atr, int fl, uintptr_t ra)
> -{
> -}
> -
> -static inline int cpu_watchpoint_address_matches(CPUState *cpu,
> -                                                 vaddr addr, vaddr len)
> -{
> -    return 0;
> -}
>   #else
>   int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                             int flags, CPUWatchpoint **watchpoint);
> @@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
>                             vaddr len, int flags);
>   void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
>   void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
> -
> -/**
> - * cpu_check_watchpoint:
> - * @cpu: cpu context
> - * @addr: guest virtual address
> - * @len: access length
> - * @attrs: memory access attributes
> - * @flags: watchpoint access type
> - * @ra: unwind return address
> - *
> - * Check for a watchpoint hit in [addr, addr+len) of the type
> - * specified by @flags.  Exit via exception with a hit.
> - */
> -void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> -                          MemTxAttrs attrs, int flags, uintptr_t ra);
> -
> -/**
> - * cpu_watchpoint_address_matches:
> - * @cpu: cpu context
> - * @addr: guest virtual address
> - * @len: access length
> - *
> - * Return the watchpoint flags that apply to [addr, addr+len).
> - * If no watchpoint is registered for the range, the result is 0.
> - */
> -int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
>   #endif
>   
>   /**
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 20e3c0ffbb..0ae08df47e 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -175,4 +175,47 @@ struct TCGCPUOps {
>   
>   };
>   
> +#if defined(CONFIG_USER_ONLY)
> +
> +static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                                        MemTxAttrs atr, int fl, uintptr_t ra)
> +{
> +}
> +
> +static inline int cpu_watchpoint_address_matches(CPUState *cpu,
> +                                                 vaddr addr, vaddr len)
> +{
> +    return 0;
> +}
> +
> +#else
> +
> +/**
> + * cpu_check_watchpoint:
> + * @cpu: cpu context
> + * @addr: guest virtual address
> + * @len: access length
> + * @attrs: memory access attributes
> + * @flags: watchpoint access type
> + * @ra: unwind return address
> + *
> + * Check for a watchpoint hit in [addr, addr+len) of the type
> + * specified by @flags.  Exit via exception with a hit.
> + */
> +void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                          MemTxAttrs attrs, int flags, uintptr_t ra);
> +
> +/**
> + * cpu_watchpoint_address_matches:
> + * @cpu: cpu context
> + * @addr: guest virtual address
> + * @len: access length
> + *
> + * Return the watchpoint flags that apply to [addr, addr+len).
> + * If no watchpoint is registered for the range, the result is 0.
> + */
> +int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
> +
> +#endif
> +
>   #endif /* TCG_CPU_OPS_H */

This hunk is missing:

-- >8 --
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index fee3c7eb96..22802b659d 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -29,2 +29,3 @@
  #include "qemu/guest-random.h"
+#include "hw/core/tcg-cpu-ops.h"

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 9a8951afa4..ace2d88f8d 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -29,3 +29,3 @@
  #include "sve_ldst_internal.h"
-
+#include "hw/core/tcg-cpu-ops.h"

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b93dbd3dad..1e7f72a2f2 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -30,2 +30,3 @@
  #include "qemu/atomic128.h"
+#include "hw/core/tcg-cpu-ops.h"
  #include "trace.h"
---
