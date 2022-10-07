Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp353969ocg;
        Fri, 7 Oct 2022 03:36:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uTX9F2CRZI8ubtQnMyQzNwOleZEnpGV4pbwezQ6EoJ0bWdIfbqtjMg6Bvr66DVmpZbnvU
X-Received: by 2002:a05:622a:1790:b0:35c:8450:d9e4 with SMTP id s16-20020a05622a179000b0035c8450d9e4mr3589708qtk.130.1665138999682;
        Fri, 07 Oct 2022 03:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665138999; cv=none;
        d=google.com; s=arc-20160816;
        b=jOeIB3psAJT5kgYOmwmatBCy5FLF3Q1csw1NRxhmNECkSe/QjR/4an4PUiuj/V4wiF
         djhweENNr0/IzcsE7Vl/Mw0EH8tZKn5Fi6HnCA4xh0qe2fctfV7/JDn8Nc16HFRIjuzZ
         h4VT789Jlvd+gHyFpAw2hj+DLN0GrR/cUr72OpRZG1X8Nb7AjH1O54uhOFuhmxyR2Fqc
         nctKqqEbvWfDGAwzpyAGiS07BDUf94NBy7UwnGmRZm3Mhv9nqwEtf9d/F9UZIM7n+RJ6
         OiYsSIqQAv5V1/rk0Ox7Fxo/lUh5qN5a4mCh1UO2tcN1sneiN308xz5gZmZ/vnjFgFUE
         4XBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UxwxHWAfGgIfy1t+sapsDy0iUfE7JEus2Rvh5aRKYqk=;
        b=S5PHfF6PCVcsVaKTdg8Emw2Misdn/v8PLjCpf+QiHjcGR9UNbBcOWh3hAFaZB574fB
         Sz1r0Q/yfMu6wHCgfWPtbBhOsQQfizG5lnD4la82k24iTVNwjPXn7JRDvxnp07n77UUS
         DcFb5CougVlqsdhAIG5f5zyN57wwm6dZ6FYeGFR0i6WztS6qaTgNslepEs+PvNySGCNo
         4mcAqLZg8fSF2kafxk+/FTVfImNvqj/sIlPehAUU6E6Ob+rtIJn3jR1rOH6K0Wmej6qE
         zO9bHawrYVNP5ACcyFPcOWWEK8Mc7ZftchlKm5iaJtJvZwu0ms+7Lj6oy95Xr+P/y98d
         1GNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7D6eliU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn3-20020ad44a63000000b004992c5f80besi583326qvb.12.2022.10.07.03.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 03:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7D6eliU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogkid-0005sf-8x
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 06:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkiC-0005pr-VG
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:36:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogki9-0001JR-3l
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:36:12 -0400
Received: by mail-pj1-x102c.google.com with SMTP id lx7so4151952pjb.0
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UxwxHWAfGgIfy1t+sapsDy0iUfE7JEus2Rvh5aRKYqk=;
 b=Y7D6eliU0LDuu5iNreyYEDGY/lphmkdRyEzuyhxJmmNljnxOuztK+qTsjjlGbeB4Uz
 3U7Lre1ugKtFzzRR+mxl9fvW4o7F4UmSRktA8fncD0WRpbGuAuy81/45LXfmxt0E7ak6
 V9lB96n5cvPRs+XoMpPz8jda+QWEvasCAGsEA46KRy0lJuXTcRHKOX1cQTEUzksiqiKZ
 OgN2drOqk3vjDFR3pFt0Fszu3VnhG1nMbX8IBgcJx6NPUekvFQ/Lu+Omt9NpGMfgmiDM
 EH3wCYl6Kx0SagwhRl0eUuPEDHatv+c42PEEIECcCzKc1NZG3oGay5cYUEvNutWCfrbD
 pYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxwxHWAfGgIfy1t+sapsDy0iUfE7JEus2Rvh5aRKYqk=;
 b=Y8YrfnWU0CvQ+JLUQaCUZeT6IoXUGkIicvGvLD2z1cu+mqJiArjhMLXr9Ub8QhcXo6
 yvDlsxRtz0tUUwcmR/Z6Cs9i8Us9LsL329pRQ+62gNhdRFY1395AcgPj6Wn/AUbpUQFk
 a9Ko/JOAXnCZ6+GO50DaaUiWRpJYeHNPkO4bBLXWYjbjOvtZ+J/ZVwSbUpFVtTJAq9+Y
 wHe+tr4BapA5znEhj1kbdjl5L2vWXSUKKtyXOr+3KviRyDzpWnCQzVtb77qXGo3zdA6y
 xGGKIwr3UPMO/IO78JvP+SxR5VNHHi4AbgEadIZzUrBxfU/9b4i5LX5/4SGF2N3nos3k
 bGNw==
X-Gm-Message-State: ACrzQf2KPISDtIvtow2jcNyL+/MOEnDrtx9gQQ3wIZDrb+9bLHPaY36L
 cFFiXwRJWmFVnbzk7Us5Vcp3807nXuRZk4bjNL1ASw==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1447437pjb.215.1665138967096; Fri, 07
 Oct 2022 03:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-40-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:35:55 +0100
Message-ID: <CAFEAcA_p0GC33mnWrDfSMim3=v=KLoYP9Q=xNT6nMXCfwwT6FQ@mail.gmail.com>
Subject: Re: [PATCH v3 39/42] target/arm: Don't shift attrs in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: mlBS/GMEmfhy

On Sat, 1 Oct 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Leave the upper and lower attributes in the place they originate
> from in the descriptor.  Shifting them around is confusing, since
> one cannot read the bit numbers out of the manual.  Also, new
> attributes have been added which would alter the shifts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 01a27b30fb..c68fd73617 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1071,7 +1071,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      hwaddr descaddr, indexmask, indexmask_grainsize;
>      uint32_t tableattrs;
>      target_ulong page_size;
> -    uint32_t attrs;
> +    uint64_t attrs;
>      int32_t stride;
>      int addrsize, inputsize, outputsize;
>      uint64_t tcr = regime_tcr(env, mmu_idx);
> @@ -1341,49 +1341,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      descaddr &= ~(page_size - 1);
>      descaddr |= (address & (page_size - 1));
>      /* Extract attributes from the descriptor */
> -    attrs = extract64(descriptor, 2, 10)
> -        | (extract64(descriptor, 52, 12) << 10);
> +    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));

So bit positions for the lower-part bits need to have 2 added,
and bit positions for upper-part bits need to have 42 added.

>      if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
>          ns = mmu_idx == ARMMMUIdx_Stage2;
> -        xn = extract32(attrs, 11, 2);
> +        xn = extract64(attrs, 54, 2);

...so this one looks wrong, should be 53 ?

>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> -        ns = extract32(attrs, 3, 1);
> -        xn = extract32(attrs, 12, 1);
> -        pxn = extract32(attrs, 11, 1);
> +        ns = extract32(attrs, 5, 1);
> +        xn = extract64(attrs, 54, 1);
> +        pxn = extract64(attrs, 53, 1);

Compare here where bit 11 in the old code is 53 in the new.

>          result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
>      }
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
