Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp534270ocb;
        Thu, 6 Oct 2022 07:50:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QqnIopoLFYoGcQ1yTddFU5AnKFTBpZ7NALuw2BSdrgybEWP9hhm4UQRubxW8Fy5K0igir
X-Received: by 2002:a05:620a:1447:b0:6ce:16a5:73ef with SMTP id i7-20020a05620a144700b006ce16a573efmr337199qkl.348.1665067822141;
        Thu, 06 Oct 2022 07:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665067822; cv=none;
        d=google.com; s=arc-20160816;
        b=oRXkqTSlVBTnRpIUKJNkim6EyfZPAk5kVyHpCV0J0SRltKG9fO5Vu65POiHM9QI2ph
         yj4/noVpuRaSQkvhI8SuUa48lNvejD8oP38WwvIzihEuxRqxFsOmKl/PwNxK0/J40FFR
         PYR47e1oCoSR9iAZLJb0gLvfv4Zp5gYE6EAP3u4GsiQRqZYyXtXIh+XVjfY8nZKygdie
         4AOl62hSLUMRqE9tOCvIZiFTz39u5yH/3UbItAfG4GCaFV/empF0BqyR8bJjYMDhtdJM
         xMKH3RaU5Vrbkrkrmozb6vBKcyRAFkEbGHyAEMN8pgk80wdGU9TvQW3uetcIaTPoL6o8
         FeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qQQC5C/Fq3WcEaAGlJ7iXt69ARtQYzjczXq/0FOr2sk=;
        b=mDBGnn+MQQe4jRo1Z4K9feHr8Q8INk1jYJBKLvWS0ga2vo/mpzri+p90NHdYZvDJ3k
         rgNVm4tiOgAuU7g/2np8GLZpHSZtrT17mQ7u0cy1TGsZbS/ej2+aY1O0fBAK4j97r2wb
         dodjRxMPFvFluUope1G+XNwzcsTW5MKkvaFJYbEe1HiRXn8b9j8YMQiI70EiLaYp020+
         RC2w1QVWnm5fpGCUOxMz03r3oln85VkjFZY2FNEqsRSYqfFhluvEPIDZ2IXik7VaGdW7
         oTyTDXFnmy7wJCarUy5MTXfPgLdA1Bw3XZd2/OLGfngn/kay1fqsXNu1KrXIL51YXJ4v
         tUog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cK5PzXqz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020ad45744000000b004b1d9e12313si901402qvx.433.2022.10.06.07.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cK5PzXqz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogSCa-0007xz-N8
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogS7G-0005Jh-Fz
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:44:51 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogS7E-0000B2-Sk
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:44:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id s206so2076024pgs.3
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qQQC5C/Fq3WcEaAGlJ7iXt69ARtQYzjczXq/0FOr2sk=;
 b=cK5PzXqzWrzYBLZJdis1y4FwJ0qxXcTMjNS7/F8ey6W353smI6mAqxKBMtgDJrGgtY
 N6UJJDelJrRxz081UlItBoWew0s9oD/AEPdXFuzwcuLX0D99MvjbDMczFv/2lXGwj9sK
 TpMPz8B9+QqH7iamfKvwbCUK0JJnnQZ2v1wQJBphhfcPAptNWztEJMFW5Ykg6wY4UNdW
 Or7Fbiz3c9YaaupjyWovGqCgUHX0Hwwha/SQn/ypsxLl9fkTIfs5cguSNYR2dKWa0WnO
 CgR3PKEQoFoCzI2GLxt0FIlgNZNaazbsASKbOUxgx6uOyHhT3xidi7gMSW8xb99x8u5X
 LpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQQC5C/Fq3WcEaAGlJ7iXt69ARtQYzjczXq/0FOr2sk=;
 b=Du1pB8t2okE8y/QKSk57lCACkwWs8g3qCJwaYy+fWugeYlGyNV2EgT2ZpgYGqV+fka
 jyGQbXu19tcRuThfApcjAH3atN2SSUr2AaT4/js05VeortZH318ivaVU80oBocj1PaRq
 ZCxxMX+MWP+ruGJvo17PBU4iU92Ls3HVUiJwahGNfNv1YQP2fYMiiybzfGDjQaOGc+Ke
 WUa9jS5UEJKhrOSmELXtN+16WJJNHtC3RfjJarOBeuGDvsNuJ8A+Vo1pKhmLQChjvDOv
 J8D03N3hORbASFw7/ldoIs+EeDedgGRmM3xNNpzxWZf3AecHQ/dzia73urHZX1y6MTW4
 lzJw==
X-Gm-Message-State: ACrzQf1hYaNUAvdQ2SzNCmodsfBaeheLQEacmkBCUbchJagjt7v8SRqb
 Mbu6lb6hwRBVmQ0GikJtlhKpCzd9DF/mt87GVM8Vlw==
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr153433pfk.51.1665067486875; Thu, 06 Oct
 2022 07:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-22-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:44:34 +0100
Message-ID: <CAFEAcA8M+d1ytbZD6WmLik8RiGjv9=bPA3YOQm7V6XrH2fxmLQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/42] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: BLNcw8CPPGu8

On Sat, 1 Oct 2022 at 17:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Copy attrs and sharability, into the TLB.  This will eventually

"shareability" is how the Arm ARM spells it.

> be used by S1_ptw_translate to report stage1 translation failures,
> and by do_ats_write to fill in PAR_EL1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h  | 8 ++++++++
>  target/arm/tlb_helper.c | 3 +++
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 08681828ac..118ca0e5c0 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -30,6 +30,14 @@
>   */
>  # define TARGET_PAGE_BITS_VARY
>  # define TARGET_PAGE_BITS_MIN  10
> +
> +/*
> + * Cache the attrs and sharability fields from the page table entry.

"shareability".

We should document the format of these fields, similarly to
how the ARMCacheAttrs struct does. In particular, do we guarantee
at the point we fill this in that pte_attrs is in the MAIR_EL1
8-bit format and never the S2 descriptor-bits format?

> + */
> +# define TARGET_PAGE_ENTRY_EXTRA  \
> +     uint8_t pte_attrs;           \
> +     uint8_t shareability;
> +
>  #endif
>
>  #define NB_MMU_MODES 8
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 49601394ec..353edbeb1d 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              arm_tlb_mte_tagged(&res.f.attrs) = true;
>          }
>
> +        res.f.pte_attrs = res.cacheattrs.attrs;
> +        res.f.shareability = res.cacheattrs.shareability;
> +
>          tlb_set_page_full(cs, mmu_idx, address, &res.f);
>          return true;
>      } else if (probe) {
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
