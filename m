Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098A0F99C9B
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 22:34:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEEE9-0005uK-JR; Sat, 18 Apr 2026 18:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEEE8-0005tF-S6
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:33:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEEE5-0004mT-KZ
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:33:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso26141585e9.3
 for <qemu-arm@nongnu.org>; Sat, 18 Apr 2026 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776551600; x=1777156400; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JpxWVc8Bpv3pkBagZMD8Fk1TPdllWzHm0/EyhjnzJ/4=;
 b=hZnv6M3v8PDhIekpFnrHhqFqehThI3BBRsx6E9HaLoPCdw+hyeTBeXUry+DbGAy5tL
 AMe7BTEH1jlDH+vapRs0PREexhZrsd2gk72oxVliCsxKmcH7Kra0qeVMX6OCDwEF53lV
 hb4A82F7TxK7tf+RT5E4jT9zXq0qKzQa61uZV6IJeVmwfBbPkAtQOYjC4pcAkELXxINE
 KigBtnezUCK9wZOBnrjMVGw6wQ6KymGRPeJlySSpTSAsONPOLEVAzbPtW1Ud+qKVgaTO
 wqFYF4PzYgO8g12PEtJbPCklb/SYwCEGBO5pPgPFEQBrb1qof9f/6+YSbTYtKBWiganF
 Q+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776551600; x=1777156400;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpxWVc8Bpv3pkBagZMD8Fk1TPdllWzHm0/EyhjnzJ/4=;
 b=PU38wn1RBZMmIOWByrTN89/RjsXMZXalOYI+RTKRdBPsmg7HKc8oPRaXde1L3/Gmdr
 CUN4/En9K0rUTi8A0FH9NxRF4MdDVTiwJvBBBCOoFQxwGt/Mo0q95iwTMfM/2xozSG/0
 qAuICPydvUqs5hTBmkfndZAGKnwl8T9Bd5gvIVS6T0lzGrfghQNfjFIIjj5mZnfF/QPr
 5LBxdvAA6mVTMG6lmxLhqGt7n9nnxsUzb/f3CIwdNwB6EioQK59mH7n6Aeyz8x8CkFjI
 il0MTf295U2QAJFsUz/eaWMl0Y9zmJuoq84A8xvSkOIyiLosiEPZpXham95Dir5XpVk/
 v5Qw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AXgmBaXoRK+XE2rFaY18T2dgHnjh1TMGVkJ+Uv1MG/tHmcad2a8v+w1ODTPOHQyq0pv3MyZ0r/w==@nongnu.org
X-Gm-Message-State: AOJu0YzsGTxVtRQuc/pLF5C2Yc9s8HUFGwBw9A5buRd9D36uOSwaDdWI
 qTT2CPyyPNbr32+4TzKWQ7c3PlI0meHVlaHs3jpHawmyjcrkPAj6FYkMi9tEBtdwzpk=
X-Gm-Gg: AeBDietsVL/ANTP49gZlYmnhctfbfUgpdMCT3czoPgwO2riQhJD8t6oSc1cGsoVSVpi
 itunssVw7lY7/bKsgJcAl4jy0PcGn2VmAgs4A65FXvfto+qR4RWQTP+fLEacF88WjTBjiv/RLD1
 mW8/16DMBqDG6YJTUqJuEROzv6YG93AL0U4uebUgonqWpcyyZr4qz2erIXxN7srEAeZue7+mpCW
 6s6iVuJ6iSx9ZvEMZJ+OHx71XLmZIKLN6b1siHou4/9CCQ7Kf/rv0sW79rZUpHcPayDlwIXNXqk
 ZeCIoFU7PokHt5ac7lfOhljX+xPMYKQsjD6kCU7+BHG6u3fdMwQCFyRal5gSKj+NquYizz1PkIv
 4UeeqFSV2yEuEgkFrHfPIBgbMc2GQk1EpbFwqyUufjqoJJUDLHuzyMq/t7l70Iu35kvBJpem5Gc
 updwPqCGH+uRbX8jwzdYRYaxynzVoK46C+yLJCcvzr6CHpeD0t+yEp0U2D2emjhcR9QiwlO5BlN
 WBq
X-Received: by 2002:a05:600c:a30b:b0:487:4eb:d125 with SMTP id
 5b1f17b1804b1-488fb74dff1mr77336105e9.9.1776551599904; 
 Sat, 18 Apr 2026 15:33:19 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c96b4sm261103735e9.13.2026.04.18.15.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2026 15:33:19 -0700 (PDT)
Message-ID: <6df7abd3-cd2b-4181-81b6-e499322ea402@linaro.org>
Date: Sun, 19 Apr 2026 00:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] system/physmem: Use translate_for_debug() in
 cpu_memory_rw_debug()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Chris Copeland <chris@chrisnc.net>
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-18-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260417173105.1648172-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

(Cc'ing Chris who reported the issue)

On 17/4/26 19:31, Peter Maydell wrote:
> Currently cpu_memory_rw_debug() assumes page-granularity for translations,
> and it works in a loop where each iteration translates for the vaddr
> rounded down to a page boundary and then copies up to the end of the
> page boundary.
> 
> Rewrite it to use the new cpu_translate_for_debug(): we no longer want
> to round down the input address, and the boundary we copy up to is now
> determined by the lg_page_size it returns rather than being assumed
> to be page-sized.
> 
> This, together with the implementation of translate_for_debug for
> Arm targets, fixes the bug where semihosting would incorrectly
> fail to access parameter blocks that were in memory where the
> start of the 4K region they were in was inaccessible due to MPU
> region settings, even if the parameter block itself was readable.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3292
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   system/physmem.c | 38 ++++++++++++++++++++++++--------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index f2d9a4ff8f..45c3a926cf 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -4036,28 +4036,38 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>   int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>                           void *ptr, size_t len, bool is_write)
>   {
> -    hwaddr phys_addr;
> -    vaddr l, page;
>       uint8_t *buf = ptr;
>   
>       cpu_synchronize_state(cpu);
>       while (len > 0) {
>           int asidx;
> -        MemTxAttrs attrs;
> +        TranslateForDebugResult tres;
>           MemTxResult res;
> +        hwaddr blk_base, blk_size, l;
>   
> -        page = addr & TARGET_PAGE_MASK;
> -        phys_addr = cpu_get_phys_addr_attrs_debug(cpu, page, &attrs);
> -        asidx = cpu_asidx_from_attrs(cpu, attrs);
> -        /* if no physical page mapped, return an error */
> -        if (phys_addr == -1)
> +        if (!cpu_translate_for_debug(cpu, addr, &tres)) {
> +            /* Return error if no physical page mapped */
>               return -1;
> -        l = (page + TARGET_PAGE_SIZE) - addr;
> -        if (l > len)
> -            l = len;
> -        phys_addr += (addr & ~TARGET_PAGE_MASK);
> -        res = address_space_rw(cpu->cpu_ases[asidx].as, phys_addr, attrs, buf,
> -                               l, is_write);
> +        }
> +        asidx = cpu_asidx_from_attrs(cpu, tres.attrs);
> +        /*
> +         * Clamp the amount we read to not go beyond a page even if
> +         * the CPU returned a larger lg_page_size, in case this access
> +         * is to a memory-mapped IO region.
> +         */
> +        tres.lg_page_size = MIN(tres.lg_page_size, TARGET_PAGE_BITS);
> +        /*
> +         * Find the length in bytes from tres.physaddr to the end of the
> +         * block whose size is 1 << tres.lg_page_size; we will access
> +         * that much in one go.
> +         */
> +        blk_size = 1ULL << tres.lg_page_size;
> +        blk_base = ROUND_DOWN(tres.physaddr, blk_size);
> +        l = blk_base + blk_size - tres.physaddr;
> +        l = MIN(l, len);
> +
> +        res = address_space_rw(cpu->cpu_ases[asidx].as, tres.physaddr,
> +                               tres.attrs, buf, l, is_write);
>           if (res != MEMTX_OK) {
>               return -1;
>           }


