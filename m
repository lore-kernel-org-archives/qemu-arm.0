Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp538491ocb;
        Thu, 6 Oct 2022 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UqHwbxQMxL6eJYqSeSYGDDiQCUbgCTN9c53nkr0N1avDnFUk0O7/ydlp3ldIMUw9cz4vS
X-Received: by 2002:a05:622a:1788:b0:35c:bf57:caa7 with SMTP id s8-20020a05622a178800b0035cbf57caa7mr393231qtk.470.1665068262350;
        Thu, 06 Oct 2022 07:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665068262; cv=none;
        d=google.com; s=arc-20160816;
        b=AynD8I7BNSJNexXiCgGHx/wYYJ191nYZL9FXzHN8hDMDFThR4LCmobUeZMoV+VoZ0l
         tcTo4FGepAblhmJXzdb9vP/KuWC1PnZ5b8WQja2AXHdyWXCd2EHe30D5LopVsEN4pszj
         VpsHOwUd9LevXvS4sv3jsbsvaS/hZoK6BV8Y26HniD1wWj7U7f822ic2g8atuIo27PZ5
         qP/5jpcZfrgxlwHi8v9euxMO3wPUo4vh/eOARSsz2G+5TcemEowgtljxzux0KudQMXOT
         wAkAfboISvroluhHy0b4BtindqL/AhmMeNaq+3uHm6og58bWhYbwFE8Aj5YKcejn4BsU
         1iJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h+tUr/9l1CJj5Pt5bJRVxccYDsGjcFlBvCJJg7EqzJg=;
        b=enk+cQvj9SB2Po0cEJBGMXzDS9F8uzIqW20fkemDSjDUcdhpiNLrSMrzkqTNrfy0jh
         4kLyQp+ucNzaPkpXU3SySC6yhmrTbDFWa+iXJPVpwhXs1Ix+sRKEmN2LhmZxWS2LNYRq
         f6gSSdgXOg3ClYw4ajNnOwQsjMOoulr7fJmivfJGeINb7Fk6ZzaIx1nG3YbHE1s6HnLZ
         x2Wfxl+Mt6eYarGWJHrUhGUnFOWsEiuEXB5eLqroLfX3z0uASZEuNW0GB+X0odrOzekt
         IeWLx/ALXIuHqHTXS2BcQZgzBBGRTeJ2d6G2htn3XdkTVo8S4G4OBH8A3haM7HTOvaRe
         bQuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QcK2fjEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a454a00b006e23da52244si2322991qkp.552.2022.10.06.07.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:57:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QcK2fjEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogSJg-0007SV-Sf
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSJU-0007RY-09
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:57:28 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSJS-0002K5-67
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:57:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c24so1954016plo.3
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h+tUr/9l1CJj5Pt5bJRVxccYDsGjcFlBvCJJg7EqzJg=;
 b=QcK2fjEp5hrd3mGPXgQ4zwna9hDFWxUXWQ2YFsU9XHCEi/c94gz6VUPfO1tgvNGNGj
 CFCvkdVY4xUxg4/h0gvcR3c9D8sFtrK+6u7VmpkKPvtjOP929/LjSsQAynHVIrc7LD5C
 t3QttCji/dzwa2ztdqBWS7wmOjMXaLh6rjNBDsGx1/fNTo89WKTj8hk1exwgV0jozb1Z
 eFLVGWwdYVNUjQhc9N3uJvkxbI3xqQLVvAFqyBYnH5WX3d49Z/SW3Q17pKJWuc0vRxau
 GUFTuwZNAd++lwD7eebTDN6otf0hkDo91FwpOmyGSi8KF/1fdLpdy+kCwUmGT/VyexCn
 /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h+tUr/9l1CJj5Pt5bJRVxccYDsGjcFlBvCJJg7EqzJg=;
 b=ljSpw4QYR2TMVAnCHKez2KjCLnzvKaRAo5LM6vKFVuSQbReJTWgMuE/lC+vHEgJVpH
 NbbL1V1cbz/OD+HL3qtAzogSJxpoAA1qM0TfZnZ+M36ienu5WlWhmjJQbMZ/9GIShbo3
 kxThQxa0LsA9GmKuBs3jyHydGinN9b5n8K4rgpludqMMjoKTgyWUCU+iBrpOJqnbGjO1
 LTG/bVaIxfIz8UWNXOr07qWcTDR8RXlS/NVxO7ThRNSWApnavecEy2MruRoBFxfRyT9l
 2nvcGI1i+pmz/qplpkcTGhHrccCGjJml6wOk6wiuqAO9tEQ/mUMz4+FskZ/BR5wpCbu+
 soxA==
X-Gm-Message-State: ACrzQf1mGzQF+dbbJ36Hy1oCS7QKfg0W/rLlRruKs3AdnuZr1navWqQP
 AZXrBz3LFzbxr/0kpHfmatN7XbzhlVWcc1UTqtTfZUHXd4g=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr5092882plb.60.1665068244700; Thu, 06
 Oct 2022 07:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-24-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:57:13 +0100
Message-ID: <CAFEAcA8L7BBHZ0Gfi7fm4pbZvYBd=Shu9bV6M5rQqcU-EU-p6Q@mail.gmail.com>
Subject: Re: [PATCH v3 23/42] target/arm: Use probe_access_full for BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pyD56jmEOV96

On Sat, 1 Oct 2022 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
> In is_guarded_page, use probe_access_full instead of just guessing
> that the tlb entry is still present.  Also handles the FIXME about
> executing from device memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h     |  8 ++++----
>  target/arm/cpu.h           | 13 -------------
>  target/arm/internals.h     |  1 +
>  target/arm/ptw.c           |  7 ++++---
>  target/arm/translate-a64.c | 22 ++++++++--------------
>  5 files changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 118ca0e5c0..689a9645dc 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -32,12 +32,12 @@
>  # define TARGET_PAGE_BITS_MIN  10
>
>  /*
> - * Cache the attrs and sharability fields from the page table entry.
> + * Cache the attrs, sharability, and gp fields from the page table entry.
>   */
>  # define TARGET_PAGE_ENTRY_EXTRA  \
> -     uint8_t pte_attrs;           \
> -     uint8_t shareability;
> -
> +    uint8_t pte_attrs;            \
> +    uint8_t shareability;         \
> +    bool guarded;

I notice this now brings this very close to just having an ARMCacheAttrs
struct in it (in fact it's going to be one byte bigger than the ARMCachettrs).
But it's probably better to keep them separate since we care a lot more
about keeping the TLB entry small I suppose.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 5b67375f4e..22802d1d2f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14601,22 +14601,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
>  #ifdef CONFIG_USER_ONLY
>      return page_get_flags(addr) & PAGE_BTI;
>  #else
> +    CPUTLBEntryFull *full;
> +    void *host;
>      int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
> -    unsigned int index = tlb_index(env, mmu_idx, addr);
> -    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> +    int flags;
>
> -    /*
> -     * We test this immediately after reading an insn, which means
> -     * that any normal page must be in the TLB.  The only exception
> -     * would be for executing from flash or device memory, which
> -     * does not retain the TLB entry.
> -     *
> -     * FIXME: Assume false for those, for now.  We could use
> -     * arm_cpu_get_phys_page_attrs_debug to re-read the page
> -     * table entry even for that case.
> -     */

I think we should keep at least some of this comment: the part
about the reason we can assert that probe_access_full() doesn't
return TLB_INVALID being that we tested immediately after the
insn read is still true, right?

> -    return (tlb_hit(entry->addr_code, addr) &&
> -            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
> +    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
> +                              false, &host, &full, 0);
> +    assert(!(flags & TLB_INVALID_MASK));
> +
> +    return full->guarded;
>  #endif
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
