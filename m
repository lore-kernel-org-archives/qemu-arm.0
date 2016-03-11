Received: by 10.25.208.211 with SMTP id h202csp888453lfg;
        Fri, 11 Mar 2016 00:41:20 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr10033346qka.72.1457685679937;
        Fri, 11 Mar 2016 00:41:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s141si7648169qhb.115.2016.03.11.00.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 00:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeIdL-0000Ai-Fb
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 03:41:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIdI-0000AR-Mi
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 03:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIdH-0001su-Hw
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 03:41:16 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIdH-0001sL-Cr
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 03:41:15 -0500
Received: by mail-vk0-x22d.google.com with SMTP id c3so126276945vkb.3
	for <qemu-arm@nongnu.org>; Fri, 11 Mar 2016 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=puDZrldIUKmVZ16u784OzNY5lk0fVZKanYhaKAflWoA=;
	b=FTIfRLtSUVJR31+xJMGhTQm0ZkJaTBDbIfrjAvpxQqxkKzqSgFTGHid39wOB896Fmu
	a7Evbf9a9VPBK2xQxkXkiZp8Hxs2e0Fte2hWcTKVaUhQmvwfnibihCeDdhvSZBVCCIg4
	OyTvz/phJeIWQjDpns81ehTJltGwkr9tGQxeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=puDZrldIUKmVZ16u784OzNY5lk0fVZKanYhaKAflWoA=;
	b=PP4l3Y6WldC5BgZ6CXci4RsyvNaa2VcLrx5aNFcJJmNl/957yg9SW2Pe7ww/iS8lmV
	LwDpZStpSu4P5lBSiPhgpKO0U4P5wdAO7r6ltIA7riCX8EcZQjGxQqjbr7eZTLtIfjXO
	SJAQLJtoiqdAg4ARC8HvhUAIgErrlHGeC0Fb+rsVsnR/OwRB6KGbm++rZ2FaICjufbFl
	qUcG1mx7/C+qVEK0kWfYymEydTBBqqjtFaH7dRNCfQaE8dgio/fkKKbVp5T+y6wSfo+D
	c54GnD+6ZGG6nAGcxyP3oA1U5RPPMJT2CWubrTItKrS9FFvNmU9L9NJ0tOHWDalqaJsF
	lZeA==
X-Gm-Message-State: AD7BkJJKMvEXhXc5TNC95mK3iS6UQLNYuNZ6k3zvrpQeSPs+flPJDce8XNlQT1ulRREfsIf94FlokUyZPyStAjML
X-Received: by 10.31.141.2 with SMTP id p2mr8507920vkd.37.1457685674882; Fri,
	11 Mar 2016 00:41:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 11 Mar 2016 00:40:55 -0800 (PST)
In-Reply-To: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Mar 2016 15:40:55 +0700
Message-ID: <CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ybpwf53ugkVZ

On 4 March 2016 at 23:04, Sergey Sorokin <afarallax@yandex.ru> wrote:
> There is a bug in ARM address translation regime with a long-descriptor
> format. On the descriptor reading its address is formed from an index
> which is a part of the input address. And on the first iteration this index
> is incorrectly masked with 'grainsize' mask. But it can be wider according
> to pseudo-code.
> On the other hand on the iterations other than first the descriptor address
> is formed from the previous level descriptor by masking with 'descaddrmask'
> value. It always clears just 12 lower bits, but it must clear 'grainsize'
> lower bits instead according to pseudo-code.
> The patch fixes both cases.

This is pretty confusing to understand -- it might help if you
could give an example.

Is this something that only causes problems for the "concatenated
translation tables at the initial level" case (which is only
possible for S2 tables) ?

> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/helper.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index dec8e8b..b5f289c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -7243,7 +7243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>      uint32_t tg;
>      uint64_t ttbr;
>      int ttbr_select;
> -    hwaddr descaddr, descmask;
> +    hwaddr descaddr, indexmask, indexmask_grainsize;
>      uint32_t tableattrs;
>      target_ulong page_size;
>      uint32_t attrs;
> @@ -7431,28 +7431,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          }
>      }
>
> -    /* Clear the vaddr bits which aren't part of the within-region address,
> -     * so that we don't have to special case things when calculating the
> -     * first descriptor address.
> -     */
> -    if (va_size != inputsize) {
> -        address &= (1ULL << inputsize) - 1;
> -    }
> -
> -    descmask = (1ULL << (stride + 3)) - 1;
> +    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
> +    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
>
>      /* Now we can extract the actual base address from the TTBR */
>      descaddr = extract64(ttbr, 0, 48);
> -    descaddr &= ~((1ULL << (inputsize - (stride * (4 - level)))) - 1);
> +    descaddr &= ~indexmask;
>
> -    /* The address field in the descriptor goes up to bit 39 for ARMv7
> -     * but up to bit 47 for ARMv8.
> +    /* The address field in the descriptor goes up to bit 39 for AArch32
> +     * but up to bit 47 for AArch64.
>       */

This is not correct -- the descriptor field widths are as the comment
states before your patch:
 * up to bit 39 for ARMv7
 * up to bit 47 for ARMv8 (whether AArch32 or AArch64)

See the v8 ARM ARM AArch32.TranslationTableWalkLD pseudocode and in
particular note the width which it uses for AddressSizeFault checks.

> -    if (arm_feature(env, ARM_FEATURE_V8)) {
> -        descaddrmask = 0xfffffffff000ULL;
> -    } else {
> -        descaddrmask = 0xfffffff000ULL;
> -    }
> +    descaddrmask = ((1ull << (va_size == 64 ? 48 : 40)) - 1) &
> +                   ~indexmask_grainsize;

...so this part of the patch is wrong.

>
>      /* Secure accesses start with the page table in secure memory and
>       * can be downgraded to non-secure at any step. Non-secure accesses
> @@ -7464,7 +7454,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          uint64_t descriptor;
>          bool nstable;
>
> -        descaddr |= (address >> (stride * (4 - level))) & descmask;
> +        descaddr |= (address >> (stride * (4 - level))) & indexmask;
>          descaddr &= ~7ULL;
>          nstable = extract32(tableattrs, 4, 1);
>          descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
> @@ -7487,6 +7477,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>               */
>              tableattrs |= extract64(descriptor, 59, 5);
>              level++;
> +            indexmask = indexmask_grainsize;
>              continue;
>          }
>          /* Block entry at level 1 or 2, or page entry at level 3.
> --
> 1.9.3
>

thanks
-- PMM
