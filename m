Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B5DC624D3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:42:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Pfu-0003ob-Nt; Tue, 01 Sep 2026 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pfo-0003ey-2X
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:41:16 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pfl-00061o-NL
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:41:15 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-861feb6d61bso31223517b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273672; cv=none;
 d=google.com; s=arc-20260327;
 b=GgEia4S0/5L6mVAHoyYy3Nj089oExNey5sERkkOhhh91OwsSIdY5ZfUbNV9cUzegA3
 ht68rvlDIXrvdNYwepY1p1lOlUhxALLUIsSO3ZvvND+NnQIeeMIkcd6SOU0LTLy3/WA+
 JvE6iwSfGaxb6B+Jc3qdfdiHNFa6Y/pkpA2JhPRea0G76kbEgwXhSHllocJ5NhMa6hPw
 VYOC3n7sCw1W+dICggEPtt9VmvcXBGrumvfEvJKaJqKuPAyjbOBxn7UIxte96XLtGHxg
 phZ4DTf5bI3Ho+rJA03fa4cfdNx2LdvaN/cBmRzcqXxmwNr+8ZznLm6s9uMm2jnz+R2R
 p2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 fh=xiOP2mtfuVQzLV5F8f+nveYIkxe41tYpbha+h3tjGPg=;
 b=ilCBtL0E8X/dSPqZfxb7dhXllXLMrz224j4YhMvleF0ScdA1njb8eOcTEdM5flcKjl
 hIOA2WPs80hajOnSyWEXIRoBOyLwEDSqcNHMLVg8NNcze/cMXCue/ZxoEz5tEYrL0Kqt
 0uqs1T7xJPV+YRiHGBwSJKaX9hIuNllPcKMch+yTp8U66KAE26l3RpqC4ZmfRJDKl76W
 9erAf3/7d8Mj31XUzM7hoMJiIF+ksNwjs0TgjkaEqfHnL552DLxDcgbH5oShEzY0vVV0
 rq0Bc2+kA/cm9WynR6+YvvcPF0YD4bsv6REvGGmo1E9Mz8lEpDjCow3EB66sMSybuLoo
 XWNQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788273672; x=1788878472; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 b=X4b3SGutYgN0aym2fMqlH8C7I0v1dl37gL/CTfn9Ld5BdpB0SaD//D54jebpWf2XU0
 w6CsA7USB+I/iuz2iQO7lJsNyhM5h4CB42TdhG/zKgI+dptAHCK3gJM3udog9ScDhNg7
 sBmaRyFG0p/4ybEhBuVf/S8DYd3ejHnTFrX3P+jPLPQy/UDpJny6HeG5/K8QkPNsyv2r
 EvvE+clBFkBsYvIzPijevOB8kLryiAecZgntuI8IjhqTOuj0E35FGvAA8heCPiJUAY8n
 h1zIa8ugG4q0szJeHE4pPCZovmVaIDBosPPS2UXfYlfNVxAob//DNeiNSMlQNhwl0t8G
 31dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788273672; x=1788878472;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 b=G+ibhGg9Fx9y/d76n9xX/yQYzpfqRAPEypOQzKBuCjRYXguvwavHCJqAyFc44L2rHZ
 VQBuOQQlAL6Wxnm7pT6HF8tFzEHmLy6uBFuPQeoHSzRZD9xGxmqLQExcVLUoYQz64wOH
 faXppMz0uN7i71vLfTF315GRjdF003bGS3NkFNziL2OcW3ZiqV8t7b6BWuRP03vwFArP
 aJ8u30MVF1NQVEDBxgn6mG+zYYuMwc7ReEHvwUzJjS30N8yYtMmvXtOPNzkP7nqbEYLK
 1mywSDqGIDYtGGNrGN98OjX5WGpR1vLVURIZZa6F6Q2qGo35a6yNByffQhYWSFxlYHCx
 QE1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgYypziYjRLmr3dw9Lq4jW8K1j7mx/j3GQu3exSdQTe3dIWAdJT0ZbM+0UylI3IMfMDEKMAtvI1w==@nongnu.org
X-Gm-Message-State: AFuF++mXv1ATIfWuJZ32ziTrFfBgeQA2BOlFyJ8MoWg0Ri34NRVikEwb
 45Wu0fFo8T/V4h6lPNRjhW1VWzcOKiXIl6058HrMo7/U6D+/2llJAJM37+qTUCtreknCMs1ZFZg
 mmaAiblYq4nxrzeY2eXjh67LcMruD+Y5MGi0lpXdHRtz1OS3NVcbbsm4=
X-Gm-Gg: AYBFou3phmJ+zw/eDkY1n6sT9n+EfbA6bUeio8hstAx9FBU2BVwHOMTQSsj4uPbrUi5
 SdkXAntbcC+Xr1JiVCdCLCWgc6BvwDEhITE3dVsbsYPlH/QjfeWjTqR5/EcZwCVzeKWNrIUwE11
 DtpaeBdcb3VzNCcFdw8nko5et2n1Nx+Kbt6ixNbaM+bUydyuSCcRyX5Lz3Aee7S/HhjHBBNNU2J
 XFgbdVRjNRRi8ytqtsfAuQqyqko4nZjY6u5CXsPJ4AH17czAGmiUPui6s7c7L2TSbQcmgpsHx3H
 5VkizhApLFG+gqN1vZpCTN0Ax9Qy3qNY+YzJHMsLwiFG+NlRirGF3EV+WdHD8JGOrkjmM94SgDz
 UU+Dw029olaWrojym6fZhcnuAnCEp
X-Received: by 2002:a05:690c:4017:b0:859:9c98:b8b4 with SMTP id
 00721157ae682-86875b7b5a6mr39126547b3.31.1788273672159; Tue, 01 Sep 2026
 07:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-5-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 15:41:00 +0100
X-Gm-Features: AcwNN1UJKfZbjKh2bd_FuMYds1GxfgSxuJBFRTy6fyi2zfdUtM1DbjjX0Ul-b4I
Message-ID: <CAFEAcA90XrBA4EzTY_jQd0MtyXSpFn7tGy-jvRDwAe=HHmgdjg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/18] target/arm: Generalize probe argument to
 allocation_tag_mem_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had a confusing relationship between 'probe' and 'ra == 0'.
> Make this explicit via an enumeration.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/mte_helper.c | 130 ++++++++++++++++++++++--------------
>  1 file changed, 80 insertions(+), 50 deletions(-)
>
> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index dd4c10ef4f..31bf58c937 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -87,28 +87,48 @@ typedef struct AllocationTagMem {
>      MemTxAttrs attrs;
>  } AllocationTagMem;
>
> +typedef enum {
> +    /* Trap on missing pages, invalid tag access, or watchpoints. */
> +    ATM_NORMAL,
> +    /* Gracefully return no tag memory for invalid pages. */
> +    ATM_PROBE_PAGES,
> +    /*
> +     * Basic page access has already been checked,
> +     * so a missing tlb entry is some sort of bug.
> +     * Assert the tlb entry is present, but gracefully fail if tag
> +     * access is not permitted to the page.
> +     */
> +    ATM_ASSERT_PAGES,
> +} AllocationTagMemKind;
> +
>  static AllocationTagMem
>  allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>                              vaddr ptr, MMUAccessType ptr_access,
>                              int ptr_size, MMUAccessType tag_access,
> -                            bool probe, uintptr_t ra)
> +                            uintptr_t ra, AllocationTagMemKind atm_kind)

I think we generally prefer to make 'uintptr_t ra' the final argument
to a function call (though we don't 100% follow that convention).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

