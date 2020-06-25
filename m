Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1454562lfm;
        Thu, 25 Jun 2020 09:21:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOTwEu0d8y1CupPMubXg7Pp2m5hu2EOvqc5J0Z8hgDQORpfb8intIU3IAIfU1hZoGRodTM
X-Received: by 2002:a25:da88:: with SMTP id n130mr52357059ybf.220.1593102067427;
        Thu, 25 Jun 2020 09:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102067; cv=none;
        d=google.com; s=arc-20160816;
        b=PW2pLxQ1MkN3bvcPB2C67oKlYTN4GLrZh9BQfliYevhaCLgX7akzkbjmf/Hg8qxdYy
         EiWpR+zIlIMiWHMAIc/ajwEy5lQYKfegTQPJdX9dh1aI3a2nScD6X19irck3QMkhWCC7
         CT+MjubJux78QVjhTnNB3srRgDL34BS7adZG0eyJq8LlkgxtbNcdE6JRN35ZU91m9rmd
         jXuPxpumYpYBcboC//hCFaXVm4GoPR3R2NGVGwAzB/IGOPi79GB3zCtkx+tvgi5mzdz7
         uFMHp027zxQfFYSerk6xuWhkiEwpc4IVwF3z2PCzSuM+ILX7dDOAHcE/pftxYcEY8jOx
         xRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bzt76snm4wLfHzG59xDB4yLCkSvVzZD1EmKyQz6jLA4=;
        b=bf5bp2JeKDDhUYq7wNAEYZ1zVQIFWIC1rXT9bFQMTkckBPKhEgBhCy9ODHtfcrz9mJ
         IS9HDyan4qFclL9VJfOlX/yyJ5aU8xDsyrkXvkP0dWX4KoGkWsaWvCe/tylMDqNuN8vn
         5oBqXM47vTShXodCdKrdC2yTkCKFsu/RkMAIpvaqNOI5gfaxM5UgGC/JsiISWopJNiPk
         YaKnpPAkhfeFAd5uv4iFYs/JEVhJR6UIGUProOA2EUPI/6XX4Pwh/wKBn1lpLcp+ZYgM
         x8BPzt4PZvzxq6kUcHuIprkZ0tJGnctf233f64N/mPj1qYlgd1oqy1nNnlWU0b6BptBv
         OPWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fZvlxEeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si21086824ybj.14.2020.06.25.09.21.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:21:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fZvlxEeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUcc-0004ad-Qb
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUcP-0004Ye-Hz
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:20:53 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUcL-0000Zv-SP
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:20:53 -0400
Received: by mail-oi1-x243.google.com with SMTP id r8so5467718oij.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bzt76snm4wLfHzG59xDB4yLCkSvVzZD1EmKyQz6jLA4=;
 b=fZvlxEeG8pVDlXg3MgK2RQYACHlb/LcU0CPXHwBsMrLrqBXjxmqDV2/47XaR8FSeH6
 oNWQjRzjobrqKp6rqIzjgZQUAEtidnvIzdkJlB4ZSFjART6VdYSI4VATpcX48Qm3f3zs
 LqcuWVxpBPJ1D7FAWJ1wBHoGEkn8d2H/OZscUOoxpluD+2P8fcHk9/SQFg9xRxSHRIyn
 RRXM0jhSxY56pUZH8TObN7Tc+SH/tJVlkqM5YazBQICE3O1pYDYYnPF5NOQSOzSxZt3O
 YQOniM1VlAmw1E6QMHKx4xIA5eCU2OkPEDpT6ADnTHP0DeLL+GEkpJim1eUwJjPjtLgX
 iY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bzt76snm4wLfHzG59xDB4yLCkSvVzZD1EmKyQz6jLA4=;
 b=DxXiZOo888gd0jov14jo89Yzr5P906hykslT6i6v3FvXrLrUzW14ePMQmnXElAQ5/u
 fL4M5S0kzOBynB1u0c8K8G53b24QDJ6KyBrLq8nNO19gq7frkbTIpI6u/nRZbLc57ZgM
 Xp2MlCGKWiIHxpY8StIrUGVnJuYsvGDhMxfp3eS7ANWa1RTz2AL1z18Jlz5Gn68cL2qB
 BJeCsnqbOs/s4m6dUFMemB9CeZgDIQ7H8ktr3SUZhYuTiWsT8P8Bh6mOREioBdyb4tLb
 9vBqwmvOoZn3uI1DfHLruMG1HqxuZAIC4ARHpZ9RBD8l1CFcxzjs6RGMBZ1rcqkm6Kk+
 U2TQ==
X-Gm-Message-State: AOAM532eDKfB+GZJfgcx/q3E46jMWwt1hgvSU/NHu5XLbELQ+KZ/ZHtQ
 5XvRZEcz8Z6A0zhLd7IK4jBaz88p+Ykdq0CYnJFKmw==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2927182oia.163.1593102048093; 
 Thu, 25 Jun 2020 09:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-2-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:20:37 +0100
Message-ID: <CAFEAcA-qybDD6GWYPFB6tMfTb9Kj+_bCKCxPyDYMZBr8EwbDmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] tcg: Introduce target-specific page data for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6q2pTOCxnSm

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This data can be allocated by page_alloc_target_data() and
> released by page_set_flags(start, end, prot | PAGE_RESET).
>
> This data will be used to hold tag memory for AArch64 MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -289,6 +295,8 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
>  int page_get_flags(target_ulong address);
>  void page_set_flags(target_ulong start, target_ulong end, int flags);
>  int page_check_range(target_ulong start, target_ulong len, int flags);
> +void *page_get_target_data(target_ulong address);
> +void *page_alloc_target_data(target_ulong address, size_t size);

Could we have a doc comment for any new function that's got
global scope, please?

>  #endif
>
>  CPUArchState *cpu_copy(CPUArchState *env);

> +void *page_alloc_target_data(target_ulong address, size_t size)
> +{
> +    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
> +    void *ret = NULL;
> +
> +    if (p) {
> +        ret = p->target_data;
> +        if (!ret && (p->flags & PAGE_VALID)) {
> +            p->target_data = ret = g_malloc0(size);
> +        }
> +    }
> +    return ret;

Can a PageDesc validly have p->target_data != NULL but
p->flags with PAGE_VALID not set ?

It's not clear to me why for a !PAGE_VALID page which
has target_data already we return that pointer but
if it doesn't have any we don't allocate: either
"always allocate" or "always return NULL for non-valid pages"
would seem more self-consistent.

> @@ -787,9 +788,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>          new_addr = -1;
>      } else {
>          new_addr = h2g(host_addr);
> +        /* FIXME: Move page flags and target_data for each page.  */

Is this something we're going to address later in the patchset?

>          prot = page_get_flags(old_addr);
>          page_set_flags(old_addr, old_addr + old_size, 0);
> -        page_set_flags(new_addr, new_addr + new_size, prot | PAGE_VALID);
> +        page_set_flags(new_addr, new_addr + new_size,
> +                       prot | PAGE_VALID | PAGE_RESET);
>      }
>      tb_invalidate_phys_range(new_addr, new_addr + new_size);
>      mmap_unlock();

thanks
-- PMM
