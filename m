Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19390C61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 15:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PyT-0002rw-6i; Tue, 01 Sep 2026 11:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1PyP-0002qa-V3
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:00:30 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1PyO-00029q-88
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:00:29 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-861145fc841so35235467b3.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 08:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274827; cv=none;
 d=google.com; s=arc-20260327;
 b=gDAyTPX3wjGUYLdvR3Fll5iZzI6uBxs/1nPZMRK/e+AOQfRQ9VtOL01V2Uc1kNLMOh
 vB0BRlJr41UaSH2PjEio8VqjdqH9JRHz4oEbx2rGW2j602PokgXo0/hOs/e6+Wxc+vNw
 MX6meLRsa0fbLzfXaDP007pHD7afkPilXY2phmlwCM+ETbTrWTgg3sqkK4z8PtHpx/Bx
 VbrU2M6ZYH78IRHRNNMQFyFMvUXAH3AaKXS5Y8s+z/9/nzuPQtta/n5hKhQuI8tJskpg
 bijOa8Uk1VZsMCyBR41efBpzUA6C5zKLcURESvxTY/YZG5NFCdJZgTdE5wKirln1hna0
 9Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 fh=Z52jak7nyQgl1ofNTf9U9UBXPp7i9vMfWOSJVYV/v2I=;
 b=ot7hFeCv9MXi0uDl3VTmFqJtLWhznQW+ylNUhu4Z0zMk/Dtl3z6fLfLfNRFN9ZQoPv
 LsHSiNeSdvMk3jHfSr7lLLVHySB9dhYk4bQX4O/bWKWZ1v+7/28YtNK09ysPERiHdl3q
 6yNhPftaQB63e7e2fLg4UdNHFqJIXCP5kJiVS+YoyNTdgIWS5xupfm7qwXK0cArB+fmT
 4arNfcZ4m3Z2R+3tCAsfvDf1VirVbOOzm6xMbHge4/SiRnSHuFmfUTQ0UTEPAz7vVV5X
 PoPcj5VQZ06+bATq+zqg5bFboTb8DIN5hZAfUNuGpxMbntltTwLreYg6y5rp5FLDAwrU
 a39Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788274827; x=1788879627; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 b=Ya0CAi9dRwN5CO4+KzPlI+klcLT2pRoQ1LIJwP3BI2hMdk35r42Tn+fzD80cXPoxE1
 xgV9x6HMTg5j4sI6Dulf/6XTPkjROPPAzcW1PwHdMk3c3bY61hQAmaZBXa0gpYXUzBsU
 4FZhHYV6Q3ysyAZTHUNnm9ovWnuGp8gya4HEAosur7nBXiArFvbqg3qEBUD0NWNZfvGR
 uruxzBeR55sDm5NMyy0gZTu+KQzj/xKLLAbJzretqI0r6tmqc/XNCTLc83B4NuPit+6K
 73QRDkDiHHIYb8nLqF3WboeI62TTggo8jSq3eNOA1WTg5AFYx20H0eotJi0Cf7CND3DZ
 Zx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788274827; x=1788879627;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 b=DC7iwgu8phiyf4tmaZM6sYB35zf1oo7Z70I6riWclxh91j/4xnq8k7i7TUOSoTXKbD
 o8rOFQhyHKfZcnxJnOguzvMFDKcxYeUyiWI2nXEjZ9bn7L4CFjseLCgzMK2ErMqrtp/0
 LUIY0u7FN1/2RA0LH2TpcZz24jnlyrHetvJOCWKMhywOzMuJQ3KH0x+87/KmUVezShsn
 fxBBOuv0Uc6osOmGliXPGxkzOfJ08mo1MHpPEyaNeVXJy8wokV2sHPhHQ+EjS4QNfZC/
 TJIygAPJQgTa+E5HUsGf95Ho6x6NKfUxQonO+EaoDrwyFZCiAllIU8mNIdTvGDXPx/z/
 y3xg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWKYJfnqdmaCfYy0PiA+rT7fwE45jTETRQ9RzA19o4vK7yzaD8msUIkinCJQKGo39xpcvYHT+oEg==@nongnu.org
X-Gm-Message-State: AFuF++lUc32/2vWUZ3otrfqsfhtSJ7XJyFEDe9/pP0cPBYaYFd5DjUl8
 N5tVWBRYhlsqLF1jGNAROJwZL6itzNhRlgLBDuRIYXtl86SJtAqFL8sYWnhR+kQFpF2sOOC4NeS
 M2Hi7PrR3KhDcgxOVbMOIKZ8Q9HiFmE7w6vPL64PMRihyXg3YwzpnQKBe8Q==
X-Gm-Gg: AYBFou1RVoTKFN7GiNtQ5jU7dkCWtEl8iLx5ZSlCdku3AD/eDYQGU8+a3ZQXz3GxrfU
 q9VoCzZ/T4sQIHGuWGgZKcW/vLqKE0RPnqk3D9vD66x7nvYPWcZRxmCAOYuXd5lLV94Ini6q4bP
 aUHEQntyK83UOJA7UnHs9HCF4aTkpJqDPrgURB0RSbKocuO0ugsCboWrNdKT/nbfJ9nbz5ld0g0
 bN4ZtUAgFXFptxdjjL0+B0uMTthqu773XYgo1p14EhKxhHYT+ijxZpRHfyHLZrDPRJk7BAEhIMX
 LGnGdOCiEmtaFfCGvWnyVl8FDZsphDRX5+GVDjVhr0oImPYWdh3MmlbE7MljGWIz4ByfyFOpYwd
 g4FzQYeUoTiHCfdjX8/8A0BY+MvC60AlLGYk35A==
X-Received: by 2002:a05:690c:4017:b0:808:f9bb:3832 with SMTP id
 00721157ae682-86874ed6716mr36431947b3.22.1788274825957; Tue, 01 Sep 2026
 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:00:14 +0100
X-Gm-Features: AcwNN1WPi7qGbg46Wh0xWYH9-0XQaT0gVeeR0vqvhzK0VAgdSmxHoNQPfEo-pc0
Message-ID: <CAFEAcA_C7KpgU2--eEKwifuTgh-oCJPKexy30RB=Bc8VCcXD3w@mail.gmail.com>
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/accel/tcg/probe.h     |  2 +-
>  accel/tcg/cputlb.c            | 17 +++++++++++------
>  target/arm/tcg/helper-a64.c   |  5 ++++-
>  target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>  target/arm/tcg/sve_helper.c   |  5 ++++-
>  target/mips/tcg/ldst_helper.c |  4 ++--
>  6 files changed, 34 insertions(+), 20 deletions(-)

> @@ -1412,19 +1412,24 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
>      return flags;
>  }
>
> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool nonfault, void **phost, CPUTLBEntryFull **pfull,
>                        uintptr_t retaddr)
>  {
> -    int flags = probe_access_internal(env_cpu(env), addr, size, access_type,
> -                                      mmu_idx, nonfault, phost, pfull, retaddr,
> -                                      true);
> +    int flags;
> +
> +    assert(first <= addr);
> +    assert(addr <= last);
> +    assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
> +
> +    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
> +                                  access_type, mmu_idx, nonfault,
> +                                  phost, pfull, retaddr, true);
>
>      /* Handle clean RAM pages.  */
>      if (unlikely(flags & TLB_NOTDIRTY)) {
> -        int dirtysize = size == 0 ? 1 : size;
> -        notdirty_write(env_cpu(env), addr, dirtysize, *pfull, retaddr);
> +        notdirty_write(env_cpu(env), first, last - first + 1, *pfull, retaddr);
>          flags &= ~TLB_NOTDIRTY;
>      }

> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index 399bca30c9..f36286d596 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -151,6 +151,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>      ret.flags = 0;
>  #else
>      CPUTLBEntryFull *full;
> +    vaddr ptr_last, ptr_page_last;
>      hwaddr ptr_paddr, tag_paddr, xlat;
>      MemoryRegion *mr;
>      ARMASIdx tag_asi;
> @@ -162,7 +163,11 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>       * exception for inaccessible pages, and resolves the virtual address
>       * into the softmmu tlb.
>       */
> -    ret.flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
> +    ptr_last = ptr + ptr_size - 1;
> +    ptr_page_last = ptr | ~TARGET_PAGE_MASK;

Are we definitely guaranteed not to get here such that ptr_last has wrapped
back around to 0 ?  I think 'ptr' can come directly from the guest
(e.g. trans_LDG can pass a guest register value to HELPER(ldg), which
calls us). In that case we'll fail the assert() inside probe_access_full()
because last will be < addr. The second probe below will also calculate
a ptr_page_last + 1 that wraps round to 0.

> diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
> index 1b25466b49..065570a8f1 100644
> --- a/target/mips/tcg/ldst_helper.c
> +++ b/target/mips/tcg/ldst_helper.c
> @@ -44,8 +44,8 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg,               \
>      int flags;                                                                \
>                                                                                \
>      env->llval = do_cast cpu_##insn##_mmu(env, arg, oi, ra);                  \
> -    flags = probe_access_full(env, arg, size, MMU_DATA_LOAD, mem_idx,         \
> -                              true, &host_unused, &full, ra);                 \
> +    flags = probe_access_full(env, arg, arg, arg + size - 1, MMU_DATA_LOAD,   \
> +                              mem_idx, true, &host_unused, &full, ra);        \
>      assert(!(flags & TLB_INVALID_MASK));                                      \
>      env->CP0_LLAddr = full->phys_addr;                                        \
>      env->lladdr = arg;                                                        \

The macro magic in the MIPS translator is confusing, but I think that
it's possible that "arg + size - 1" here also might wrap round to 0 ?

thanks
-- PMM

