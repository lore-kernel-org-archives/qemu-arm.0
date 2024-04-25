Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1170669ejb;
        Thu, 25 Apr 2024 00:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmwewf+EBuU+1aOkX4zfcdmWp8V3IdCrXFHtbtLwnL+dR/NyR49tJV3XtslbRHDWa0dCEbsQRJJoQAPirj5t9kdji+EfPT
X-Google-Smtp-Source: AGHT+IEvcvtNAUiI/VF4C1ALNIKUK33vWVUnAqG7nIrrBs7OmWar4zJtAGHiQfAGDSF6V0tI1HHz
X-Received: by 2002:a05:6000:50d:b0:346:ef6f:562b with SMTP id a13-20020a056000050d00b00346ef6f562bmr4121138wrf.53.1714030186214;
        Thu, 25 Apr 2024 00:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714030186; cv=none;
        d=google.com; s=arc-20160816;
        b=FaKZHDjKZ0hHDrCLL/Zfpbv8eKjLXETvCKA27tsqI3yUrDhOkBDobrJvlttnqYO0bZ
         yk83X/O0JNqnYcex4VuhRR1kLb4ARgMQOhizy0YXVEB6V0TA6vydl77T+mvXnfRwnbN/
         18j3y4Hp6NygUOzLeexB5/USzakY2Upa+p7Fm7oHU9vkkMs3hL1d6P8ZcpJH3k/c/X1o
         FWguj9pYMNsyOM0oPAnrXa84gBvrhYVM6cXohqzZUA3USF+oyF3/PmxdNWUWXR7sZLSH
         qgBmZmbEwsuTxoN8UJEiiQrcxkg5Dhan2rQMh3mcWPMzsTYtxmp0c7Nxyd8FRV8SV9A1
         IxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Da3yxCWGzsnWNN6km+BcKJYVIH43tAdmKiFk55A1vrc=;
        fh=LsweAqzktXfCcpdujJz1lS2dJjAzaTh1+7YaeFKgoxM=;
        b=bpXLNcwUVYfCwG/XQJ6SivNU7g0DdI2LTCm7UA9SZQ412jW6aLhkDQ9CEt5B4AvXZR
         nhzsev3bajGDNWW2FGZEpvXYi8gIuv14Aj3MSGsbZ4IfI0Ct+d8V9g6yhtcKsVHjm56p
         m+WPjKJosLrlHlqMs19/f+P/oVVvNwIGBr2MLqR+kHIdGpeYaGLzWUmOSJba/DjpQ7VH
         tq9t3//Fq/nWZnsmK5pyAH43+owrZ6gD+CUpXdStivprhgb0mnfcMC+C8Lhc2F11rut8
         JXC3KiUKgiTf+ec73rIySuHeBfUGooybk8SuO0TAMj+Yyjch5NQIu/2oZBe8ZP88kV+S
         e1Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=eKRbj7ld;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id f5-20020adfb605000000b0034abfdaec1esi5306574wre.606.2024.04.25.00.29.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=eKRbj7ld;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=Da3yxCWGzsnWNN6km+BcKJYVIH43tAdmKiFk55A1vrc=; b=eKRbj7ldRIKCcDi
	0cwKzubk4X8WO9Ygs0PGviGBDuafgdKDlM8E1dJB/AwqSHYNXNgORb5G5zM2z1FL1RQdM3/qcZi32
	A3dCSpLSlOnWKd5lLN2/pOdpCFWqxJwbbPc40X2gr45k2ce95tEPc4vqpUnkPeB+TMfKGqyU0sea2
	PM=;
Date: Thu, 25 Apr 2024 09:30:57 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 09/24] physmem: Restrict TCG CPU IOTLB code to TCG accel
Message-ID: <2efaq47itirahcuk3yxpccdyuuuvgbdugudzwl2qenhezso456@566dj53tasun>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-10-philmd@linaro.org>
X-TUID: s8crfEJVwiSY

On 18/04/24, Philippe Mathieu-Daudé wrote:
> Restrict iotlb_to_section(), address_space_translate_for_iotlb()
> and memory_region_section_get_iotlb() to TCG. Declare them in
> "exec/cputlb.h". Declare iotlb_to_section() using the
> MemoryRegionSection typedef.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cputlb.h   | 25 +++++++++++++++++++++++--
>  include/exec/exec-all.h | 21 ---------------------
>  system/physmem.c        |  6 ++++++
>  3 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> index 173eb98b9a..3594f904b4 100644
> --- a/include/exec/cputlb.h
> +++ b/include/exec/cputlb.h
> @@ -21,6 +21,8 @@
>  #define CPUTLB_H
>  
>  #include "exec/abi_ptr.h"
> +#include "exec/hwaddr.h"
> +#include "exec/memattrs.h"
>  #include "exec/cpu-common.h"
>  #include "exec/mmu-access-type.h"
>  
> @@ -43,10 +45,29 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
>                          MMUAccessType access_type, int mmu_idx);
>  
>  #if !defined(CONFIG_USER_ONLY)
> -/* cputlb.c */
> +
>  void tlb_protect_code(ram_addr_t ram_addr);
>  void tlb_unprotect_code(ram_addr_t ram_addr);
> -#endif
> +
> +/**
> + * iotlb_to_section:
> + * @cpu: CPU performing the access
> + * @index: TCG CPU IOTLB entry
> + *
> + * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
> + * it refers to. @index will have been initially created and returned
> + * by memory_region_section_get_iotlb().
> + */
> +MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> +                                      hwaddr index, MemTxAttrs attrs);
> +MemoryRegionSection *
> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> +                                  hwaddr *xlat, hwaddr *plen,
> +                                  MemTxAttrs attrs, int *prot);
> +hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> +                                       MemoryRegionSection *section);
> +
> +#endif /* CONFIG_USER_ONLY */

!CONFIG_USER_ONLY

>  
>  #endif /* CONFIG_TCG */
>  
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 5cddfea01b..e4cff08db4 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -536,21 +536,6 @@ extern __thread uintptr_t tci_tb_ptr;
>     smaller than 4 bytes, so we don't worry about special-casing this.  */
>  #define GETPC_ADJ   2
>  
> -#if !defined(CONFIG_USER_ONLY)
> -
> -/**
> - * iotlb_to_section:
> - * @cpu: CPU performing the access
> - * @index: TCG CPU IOTLB entry
> - *
> - * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
> - * it refers to. @index will have been initially created and returned
> - * by memory_region_section_get_iotlb().
> - */
> -struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> -                                             hwaddr index, MemTxAttrs attrs);
> -#endif
> -
>  /**
>   * get_page_addr_code_hostp()
>   * @env: CPUArchState
> @@ -659,12 +644,6 @@ void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
>  void tlb_set_dirty(CPUState *cpu, vaddr addr);
>  void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
>  
> -MemoryRegionSection *
> -address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> -                                  hwaddr *xlat, hwaddr *plen,
> -                                  MemTxAttrs attrs, int *prot);
> -hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> -                                       MemoryRegionSection *section);
>  #endif
>  
>  #endif
> diff --git a/system/physmem.c b/system/physmem.c
> index cf6334f3a3..38d3ede9f9 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -31,6 +31,7 @@
>  #endif /* CONFIG_TCG */
>  
>  #include "exec/exec-all.h"
> +#include "exec/cputlb.h"
>  #include "exec/target_page.h"
>  #include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
> @@ -585,6 +586,7 @@ typedef struct TCGIOMMUNotifier {
>      bool active;
>  } TCGIOMMUNotifier;
>  
> +#ifdef CONFIG_TCG
>  static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>  {
>      TCGIOMMUNotifier *notifier = container_of(n, TCGIOMMUNotifier, n);
> @@ -648,6 +650,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>          notifier->active = true;
>      }
>  }
> +#endif
>  
>  void tcg_iommu_free_notifier_list(CPUState *cpu)
>  {
> @@ -668,6 +671,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
>      cpu->iommu_notifiers = g_array_new(false, true, sizeof(TCGIOMMUNotifier *));
>  }
>  
> +#ifdef CONFIG_TCG
>  /* Called from RCU critical section */
>  MemoryRegionSection *
>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
> @@ -761,6 +765,8 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>      return section - d->map.sections;
>  }
>  
> +#endif /* CONFIG_TCG */

I might be missing some context here but are the other iotlb functions
#ifdef CONFIG_TCG'd by some other patch?

Otherwise,
Reviewed-by: Anton Johansson <anjo@rev.ng>
