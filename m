Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3303827lft;
        Mon, 4 Jul 2022 08:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYBsW69GWzrTHOAjp4PzIN/+Vy4e8XF075YIWg9v5nn23JkHv1sRwV7ayBi7mBqei07mah
X-Received: by 2002:a25:3b91:0:b0:66e:693f:d81 with SMTP id i139-20020a253b91000000b0066e693f0d81mr522846yba.338.1656948165689;
        Mon, 04 Jul 2022 08:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656948165; cv=none;
        d=google.com; s=arc-20160816;
        b=tIvdSjdyDHlbewmgaYtldiz1oSeVrcBmD2DCKMogWl8vjBR0RHrorxgAgvh+Kowj9e
         8QJvQCKrQ5qwmcOmj8mQXxhzhrwKiexWipSO3LHk/at16U1GJ7qw51imyYoVhZ8xf5ng
         gy0g3kD9lFNTsk2JuxSlqsKgDJOimJKWen7eD3549n2kY15R64zwmnT9Oq91um7VQGwA
         s+xnNdzNr5guGrGeLM5e08IOtxalC1HbrIwnPmNtcatIXaksRJ3Q0FQx3o9iOiEgoePk
         rWD0vUvg9RWjNKDh/Nzm9P90QlZYTdkot1crrkGoNGosR526TIJwSYif2W347Gb/n4TX
         WNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2lp9Do7C7JGDT0iqwVCG2YrhON3OohTJB+UJsrPGhcc=;
        b=Er0wNUwVvhHYyNAN+JQmGxI85hamBwtpogVSliZzZOePkB7nkAuHYa/atj7M17/ted
         +enkNwBFYxgacP95T/TRsSVrDdDVhmkl9n/1vU7i3bjvMoXgHFN5q1lRAIoso3Gwexa3
         AmsQOM5SE1jdySEddJvRhT8iJFSwmmA4w2HXbYkCL9aExvww8UqiGImYdYFqdI9CS9Tn
         4lutbDe4vPICwvKk6cNt1Jgs/vEnOlEHPb6nGQzUkkEJ/iX7P9bnvuhQ2DMb73fkSn+r
         xtLS65FVuttkGiWkgFRc22/1qWvA66fOCuH9Se0wwEmntwgT73fT2dkiVf/eMTbU0lnE
         ZNew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxtYsGyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s71-20020a252c4a000000b0066e4be918c2si4020159ybs.377.2022.07.04.08.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 08:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxtYsGyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8NuP-00038I-2x
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NuC-00034Q-RV
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:22:33 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NuB-0002Jk-5W
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:22:32 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31cb2c649f7so10677607b3.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lp9Do7C7JGDT0iqwVCG2YrhON3OohTJB+UJsrPGhcc=;
 b=fxtYsGyMiqQpKC369BMsSaspow62s5sKnyFF/z/dUwkffokvh0hiH8oQQvb9mxu3be
 7UavFJLc9Hls+tpL1vZJACGtGYDJsx+TuxMVrO5dZ3zVxMtHDRgYx7Gv0tFdcahHbhrC
 f9c1MMJEFuhvglGsiixChIaefJqpPxQaYslNufNuurk6nqGdUPMlvaACvuthcEyzHZ4a
 nwg7uCZVYcAUJu6iweWU3Tao+I8SdTYjp4ojkGGs35QMJAgw9b1Ox/9hbTMYPDFOFj0q
 3rx9Zg6hFnlJQduCKiNUnDioSrM9p6erK1kaZg5KP2Xed0iJOWPBFnxvq557wqlbaEm8
 aTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lp9Do7C7JGDT0iqwVCG2YrhON3OohTJB+UJsrPGhcc=;
 b=j58WLd8fg8e/PwgJgfwZkt0/d2DCvrdaOzR4L/Piru5SDI4Jktx+WkKjV0BugTE4gR
 3fKPlo68VT+fsXgCh9RrfupvJbNPWTOPO2wrdqOFuDOIMVm9RwjY1SlW0XpjNjpGzGgc
 Ok443M74F9MTHw16x16FUK3BmzFO3y+23+mz8gfry9lwaMT7azeKbQjMq9Czl2PL+oPx
 dZzOeFERMhHewLLwBy7b71wIfF+h+h7ugeqnRk9akKMgsF4cBMTT+vlW3rMf1XaV3hB2
 JFMaFg3fWzPDqjy2tYFF4gsBYG4DezA59mShAsBm0q8j81luj6TTuopFwgOQaJlZNUpF
 SoYA==
X-Gm-Message-State: AJIora+RjDoS0FcMG67gxZdRC2ZJOa760W1QKkBW9Z81y+diPd5KiLbP
 QQ+JlXks0dncXU7XbTBqnuNbwiak3h284JGJWj5BYg==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr33290479ywb.10.1656948149859; Mon, 04
 Jul 2022 08:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-3-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:22:19 +0100
Message-ID: <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
Subject: Re: [PATCH 02/62] target/arm: Enable PageEntryExtra
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DBq0qHU1fRa0

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Copy attrs, sharability, and the NS bit into the TLB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h  |  8 ++++++++
>  target/arm/internals.h  |  5 +++++
>  target/arm/tlb_helper.c | 14 ++++++++++++--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..a14f167d11 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -30,6 +30,14 @@
>   */
>  # define TARGET_PAGE_BITS_VARY
>  # define TARGET_PAGE_BITS_MIN  10
> +/*
> + * Extra information stored in softmmu page tables.
> + */
> +# define TARGET_PAGE_ENTRY_EXTRA
> +struct PageEntryExtra {
> +    /* See PAGEENTRYEXTRA fields in cpu.h */
> +    uint64_t x;
> +};
>  #endif
>
>  #define NB_MMU_MODES 15
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c66f74a0db..2b38a83574 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
>  FIELD(V7M_EXCRET, S, 6, 1)
>  FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
>
> +/* Bit definitions for PageEntryExtra */
> +FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
> +FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
> +FIELD(PAGEENTRYEXTRA, PA, 12, 52)

So why do we want these things in particular? It would be
helpful to describe the intended uses in the commit message
to save the reader having to read the next 60 patches to
find out :-)

Is wanting to cache the physaddr an Arm-specific thing, or is it
something we should consider having in the core softmmu code?

> +
>  /* Minimum value which is a magic number for exception return */
>  #define EXC_RETURN_MIN_MAGIC 0xff000000
>  /* Minimum number which is a magic number for function or exception return
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 7d8a86b3c4..9de3099153 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -226,21 +226,31 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          &phys_addr, &attrs, &prot, &page_size,
>                          &fi, &cacheattrs);
>      if (likely(!ret)) {
> +        PageEntryExtra extra = {};
> +
>          /*
>           * Map a single [sub]page. Regions smaller than our declared
>           * target page size are handled specially, so for those we
> -         * pass in the exact addresses.
> +         * pass in the exact addresses.  This only happens for M-profile,
> +         * which does not use or require PageEntryExtra.
>           */

Do we have to exclude M-profile here because the PageEntryExtra
data is strictly-per-page, or because the way we've formatted
our extra uint64_t requires the physaddr to be page-aligned, or both?

>          if (page_size >= TARGET_PAGE_SIZE) {
>              phys_addr &= TARGET_PAGE_MASK;
>              address &= TARGET_PAGE_MASK;
> +
> +            /* Record some particulars for later lookup. */
> +            extra.x = phys_addr;
> +            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, ATTRS,
> +                                 cacheattrs.attrs);
> +            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
> +                                 cacheattrs.shareability);
>          }
>          /* Notice and record tagged memory. */
>          if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
>              arm_tlb_mte_tagged(&attrs) = true;
>          }
>
> -        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
> +        tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
>                                  prot, mmu_idx, page_size);
>          return true;
>      } else if (probe) {
> --
> 2.34.1

thanks
-- PMM
