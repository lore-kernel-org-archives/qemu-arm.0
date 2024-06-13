Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp121937ejb;
        Wed, 12 Jun 2024 23:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+Z0y97w/NrcC9AjKPnZR++kCxQoEOSIRCe/eSzB/Mi3vATeh6MvUaGIAkTwjq8H+btiztUNqwR4fAHHyds/Ev9OgxWNXn
X-Google-Smtp-Source: AGHT+IH8M3yAF6GzP77vHJ9KQXNTrNxfHIHi25HzY7lDB8y/Swie8l7XjtC5JcQim2mFeuns3exD
X-Received: by 2002:a05:620a:2684:b0:795:6016:bdb6 with SMTP id af79cd13be357-797f60367cfmr460786085a.46.1718259877057;
        Wed, 12 Jun 2024 23:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718259877; cv=none;
        d=google.com; s=arc-20160816;
        b=oHM92mG5anS0eqes9q2lbqa1AFgus5W0mAITFdmJl2arh8Yq9yOAQRKRXyFq+Bz6Wm
         YSA9/DMNe1D09B0Pwsm5wUuATT+imd6WiCxBjac6/AN2wojfvuNcIceR0DZ825XjR2K/
         0fF9veMayCvW4zfis8pEOZf+q1wJjNBOCfYy1HBIrJCSRnnqDGSGsMyZEPxJlh0VIMaR
         /dsdnf45ymI5qNwJKnZw9exH7A/NGb+ezFG7sA4hSDtdFcmZlEApQQfAc300YghajVmM
         PZNjQmRshzX5jbuNRwJfn3CPJ7ZiuMKXG6K/NgxdryP6uQUJYe/xuPRqi55PEXhIlSnx
         vcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7aIVNtmxDpSvKVBu+XJfqD2fbmyv+8s9qMuYcG3rz2Q=;
        fh=AORTYZJUsRUNKSnjur3U+CxDwEM/B5fa+vCfrR3zQOM=;
        b=LK1747oJmpRm96SlDkItShsiAdbCtbkbFvD7W8D5IdGDK39Lww5Z91rCRD8mouQ9Tf
         9hv6+miALlVZb60xbFdNqq8YJ8js+irU1LprkwLY/JmIjlvcBtsSadFNWtikV5Kh89ur
         iNZLG65Y9j+zvObQbyktUeYZ12YOAvDhc1PjzV1Kd1HKBdYjx7wonZgEoCvAOzg5ZkFU
         w5ghDXSL0aw0hFLchPgtQyUASdMSOD5mYVKLoqG9/uEkgCRlHlVy7KL/l9c0gHFYohW5
         U/aCMylOP5vca0ofboYi3wM8zTlGPzqajn+FgkyDQhbVku3sETwUgAqmijZFo/Qf+6UI
         2uVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.alibaba.com header.s=default header.b=vWKw9piZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.alibaba.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aac9ccacsi67697285a.120.2024.06.12.23.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 23:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.alibaba.com header.s=default header.b=vWKw9piZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.alibaba.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHds6-0002Cj-Ku; Thu, 13 Jun 2024 02:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1sHds4-0002CG-2b
 for qemu-devel@nongnu.org; Thu, 13 Jun 2024 02:23:40 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1sHds0-0006zD-JR
 for qemu-devel@nongnu.org; Thu, 13 Jun 2024 02:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1718259806; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=7aIVNtmxDpSvKVBu+XJfqD2fbmyv+8s9qMuYcG3rz2Q=;
 b=vWKw9piZmm9gth3zC00QNDXMri+JO7uEwF9MxO64SjzK4cgnK+j/dkOA7XvjJipL+JkF+aVCoorfUplJ1dkGk2C0t80q532otACWc7UePKit6iJ95nL9rnPOOaKxeRWWNrktXNmhWPKrLkSkvkqsUwc8EkT9O11W++KM5fGMLvw=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045046011;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=36; SR=0;
 TI=SMTPD_---0W8Mxq7G_1718259801; 
Received: from 30.166.64.137(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0W8Mxq7G_1718259801) by smtp.aliyun-inc.com;
 Thu, 13 Jun 2024 14:23:23 +0800
Message-ID: <501987cc-d8c1-47d8-b553-d81e95eadb1c@linux.alibaba.com>
Date: Thu, 13 Jun 2024 14:22:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] accel/tcg: Store section pointer in
 CPUTLBEntryFull
To: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20240612081416.29704-1-jim.shu@sifive.com>
 <20240612081416.29704-2-jim.shu@sifive.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20240612081416.29704-2-jim.shu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -174
X-Spam_score: -17.5
X-Spam_bar: -----------------
X-Spam_report: (-17.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hLM7ru2JN67M

On 2024/6/12 16:14, Jim Shu wrote:
> 'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
> find the correct section when CPU access the IO region over the IOTLB
> (iotlb_to_section()).
>
> However, section_index is only unique inside single AddressSpace. If
> address space translation is over IOMMUMemoryRegion, it could return
> section from other AddressSpace. 'iotlb_to_section()' API only finds the
> sections from CPU's AddressSpace so that it couldn't find section in
> other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
> wrong section and QEMU will have wrong load/store access.
>
> To fix this bug, store complete MemoryRegionSection pointer in
> CPUTLBEntryFull instead of section_index.
>
> This bug occurs only when
> (1) IOMMUMemoryRegion is in the path of CPU access.

Hi Jim,

Can you explain a little more on when IOMMUMemoryRegion is in the path 
of CPU access?

Thanks,
Zhiwei

> (2) IOMMUMemoryRegion returns different target_as and the section is in
> the IO region.
>
> Common IOMMU devices don't have this issue since they are only in the
> path of DMA access. Currently, the bug only occurs when ARM MPC device
> (hw/misc/tz-mpc.c) returns 'blocked_io_as' to emulate blocked access
> handling. Upcoming RISC-V wgChecker device is also affected by this bug.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>   accel/tcg/cputlb.c    | 19 +++++++++----------
>   include/hw/core/cpu.h |  3 +++
>   2 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 117b516739..8cf124b760 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1169,6 +1169,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>       desc->fulltlb[index] = *full;
>       full = &desc->fulltlb[index];
>       full->xlat_section = iotlb - addr_page;
> +    full->section = section;
>       full->phys_addr = paddr_page;
>   
>       /* Now calculate the new entry */
> @@ -1248,14 +1249,14 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>   }
>   
>   static MemoryRegionSection *
> -io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
> +io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
>              MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
>   {
>       MemoryRegionSection *section;
>       hwaddr mr_offset;
>   
> -    section = iotlb_to_section(cpu, xlat, attrs);
> -    mr_offset = (xlat & TARGET_PAGE_MASK) + addr;
> +    section = full->section;
> +    mr_offset = (full->xlat_section & TARGET_PAGE_MASK) + addr;
>       cpu->mem_io_pc = retaddr;
>       if (!cpu->neg.can_do_io) {
>           cpu_io_recompile(cpu, retaddr);
> @@ -1571,9 +1572,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
>   
>       /* We must have an iotlb entry for MMIO */
>       if (tlb_addr & TLB_MMIO) {
> -        MemoryRegionSection *section =
> -            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MASK,
> -                             full->attrs);
> +        MemoryRegionSection *section = full->section;
>           data->is_io = true;
>           data->mr = section->mr;
>       } else {
> @@ -1972,7 +1971,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 0 && size <= 8);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -1993,7 +1992,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 8 && size <= 16);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -2513,7 +2512,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 0 && size <= 8);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -2533,7 +2532,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 8 && size <= 16);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index a2c8536943..3f6c10897b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -217,6 +217,9 @@ typedef struct CPUTLBEntryFull {
>        */
>       hwaddr xlat_section;
>   
> +    /* @section contains physical section. */
> +    MemoryRegionSection *section;
> +
>       /*
>        * @phys_addr contains the physical address in the address space
>        * given by cpu_asidx_from_attrs(cpu, @attrs).
