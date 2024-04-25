Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1167979ejb;
        Thu, 25 Apr 2024 00:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+Sr45b3zY1LoQQ2imiNQibDqgyt1hxxYd7VV3ff2EIVvFURSz6hGMHmpDeEA/FW+CxBiNORnB+6XeKnc8XpOmlmyb5p7H
X-Google-Smtp-Source: AGHT+IGtvRuhwPpRzAs1mXFIHNsDv4RNoxdTcTKgpddRSguMEFPqf8PbkaSA8L0YLQQHBAz8ANT5
X-Received: by 2002:a05:600c:4fc3:b0:419:87ab:f6da with SMTP id o3-20020a05600c4fc300b0041987abf6damr3743284wmq.3.1714029850052;
        Thu, 25 Apr 2024 00:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714029850; cv=none;
        d=google.com; s=arc-20160816;
        b=YxMjKOWRfuEI6D4WWYH4eU6qHA6QMS3hIY2YfhNjjf+eDhxFIMN+gpbqpKnoZFaYDJ
         X6MoW8zYVf81EZJ+/9KJzWLOYS16UH9eyPl9llxVbII7LmGQyDbl8Dw8XvUVbMlyEY+A
         yhHQIjY0E8kMKgSOEpWEdAkGWRSdNMf6LLnRpNeBzoDygUxSy63+u+OoIZPMx9ypXTbC
         UntinNu/R2xb81I2mT9MfKwRZLL6eQFsnS8g4HVRPrzJt2mKpoSAFLfUhG3IdLcWQ7ks
         jOs9pDKMvENswTdExL1JBQBDcfMo5wnC4IAaoCPIhKpHg78NK0qy70hMahh2ZJ7eJ2ug
         RX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=F7BKNHiMAlNocT2U24LEjGIdXTZ+ds4ooqhTuWSUoyc=;
        fh=LsweAqzktXfCcpdujJz1lS2dJjAzaTh1+7YaeFKgoxM=;
        b=cKyBpCvDyJHP1UQixAhkzAG1JJ/mM5l99B1ajVUO9Au0hgVqiaPvsrk5TZWrS/ZFd8
         LyNUztZJRjKAlnPGmQ5M3EFFAoOxc749F1zyGjZcxSwnJRBoFNERJuKiegX8R0fWFucp
         DGxUC1BpgftBtUAs3jQFGEMitnFRQr097px36wPWWLZzWrHAFBdpWJF9YXaOaEJHauZc
         UiQE8iGCX9zEUAinaQdDrYpEozmyW+N4QQhhd4VFCbDX07MDHzd/PeJ7HjE6j/ldoxIj
         3yyE1Hor510An21pL7l9+uRzSGbT2NcaxIAgLfynORtdLP1gTX18g/s8vljMMnDrmCci
         WrJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=jrnrPfiQ;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id bi22-20020a05600c3d9600b0041901677d17si7443159wmb.191.2024.04.25.00.24.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=jrnrPfiQ;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=F7BKNHiMAlNocT2U24LEjGIdXTZ+ds4ooqhTuWSUoyc=; b=jrnrPfiQot4CQI9
	TyacJxS+Y+Uk34YSOGfa58MCeyKl/bmnEkHuJ5b6N86w9zkuxeQ1hI0fZt46iPL43e+aGBP8y+jmo
	Z7vBMXe/rrPDGz/bECXMt+dyF2Ex+tK4IO7yBPIqq7Nb3BzLoIOsJVC1CsxgvPNr+dXT7SVC8tCPo
	38=;
Date: Thu, 25 Apr 2024 09:25:20 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 11/24] exec: Move tlb_reset_dirty*() declarations to
 'exec/cputlb.h'
Message-ID: <ie74e7uxd4dovk4afk6o2r7pbc7rfwqomncla2pgprr34u3q3k@mwmdrjzxzsuz>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-12-philmd@linaro.org>
X-TUID: LjH9n3VlvJ4O

On 18/04/24, Philippe Mathieu-Daudé wrote:
> Declare tlb_reset_dirty() and tlb_reset_dirty_range_all()
> in "exec/cputlb.h". Restrict tlb_reset_dirty_range_all()
> to TCG accel.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cputlb.h   | 12 +++++++++++-
>  include/exec/exec-all.h |  3 ---
>  include/exec/ram_addr.h |  1 +
>  system/physmem.c        |  2 ++
>  4 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> index 3594f904b4..dc92befb93 100644
> --- a/include/exec/cputlb.h
> +++ b/include/exec/cputlb.h
> @@ -49,6 +49,9 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
>  void tlb_protect_code(ram_addr_t ram_addr);
>  void tlb_unprotect_code(ram_addr_t ram_addr);
>  
> +void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
> +void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
> +
>  /**
>   * iotlb_to_section:
>   * @cpu: CPU performing the access
> @@ -69,6 +72,13 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>  
>  #endif /* CONFIG_USER_ONLY */
>  
> -#endif /* CONFIG_TCG */
> +#else /* !CONFIG_TCG */
> +
> +static inline void tlb_reset_dirty_range_all(ram_addr_t start,
> +                                             ram_addr_t length)
> +{
> +}
> +
> +#endif /* !CONFIG_TCG */

The only use of tlb_reset_dirty_range_all() is in
cpu_physical_memory_dirty_bits_cleared() surrounded by an
if (tcg_enabled()).  Would stubbing the latter function be better?

>  
>  #endif
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 778c82ba8e..6f46015ab4 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -640,9 +640,6 @@ static inline void mmap_lock(void) {}
>  static inline void mmap_unlock(void) {}
>  #define WITH_MMAP_LOCK_GUARD()
>  
> -void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
> -void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
> -
>  #endif
>  
>  #endif
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 3fc83587c0..f06ae9b516 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -26,6 +26,7 @@
>  #include "exec/ramlist.h"
>  #include "exec/ramblock.h"
>  #include "exec/exec-all.h"
> +#include "cputlb.h"
>  #include "qemu/rcu.h"
>  
>  extern uint64_t total_dirty_pages;
> diff --git a/system/physmem.c b/system/physmem.c
> index 38d3ede9f9..7a7876a375 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -850,6 +850,7 @@ found:
>      return block;
>  }
>  
> +#ifdef CONFIG_TCG
>  void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
>  {
>      CPUState *cpu;
> @@ -869,6 +870,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
>          tlb_reset_dirty(cpu, start1, length);
>      }
>  }
> +#endif

This function only depends on qemu_get_ramblock which is statically
defined in physmem.c although it doesnt depend on anything in physmem.c
as far as I can tell. Thoughts on moving qemu_get_ramblock to a common
.c or .h and moving the tlb_reset_dirty_range_all definition to
cputlb.c?
