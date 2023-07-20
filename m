Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7954208eje;
        Thu, 20 Jul 2023 09:36:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG053uVx4mHLsbHIEs0O+vKiyYUtUz8yMm//PAXL9Bx1kgUkJMLPekQytVJBKJOtC3bC362
X-Received: by 2002:a05:620a:408b:b0:76a:ca95:a5fd with SMTP id f11-20020a05620a408b00b0076aca95a5fdmr2334209qko.61.1689870968576;
        Thu, 20 Jul 2023 09:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689870968; cv=none;
        d=google.com; s=arc-20160816;
        b=Cv8TKHfspVB8LSky/zEEHKIQ4hbTHdrRN2zJjfD2ylQ85TR1HO/OYTcY931oQaLFBm
         Dgio35g84xPN0SLLF3b1nNUbi1+z0PR//DACFTq6vM4SwMb24hMSYmoFhh7bqs8+1eFH
         1K244DX5e3aFqSIGf0QaN3Iu+JTGo7Xqhi7m/7fgpezR2iLZH4AO9YPOMiYBKJ7EOE+Z
         m2M8kbgd6XjTYIuHaj8CiUv4Nwtg4LwJaWbv5iolj5YbFnorIfffatQzUS4bqUml4vdp
         19mU4m7TPfzKGa194krUIo5CSWGrhw4avduzHOD0485gkgplE7QAUVSce+5E2/2EDQXx
         qEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1te5QnsGdqFFgJE8Ufpgh1r9/Gv8HuA5cGaTx2tb6/k=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=EYBorRCV56NHY1KL6o0CyMC1OmLFnrQJApytrbvYf9I1y7g9dOCqy38BqJ4Wn9vTRU
         1JugQVQ/oF/VgzP6eJoV0Dui6Mqpf3zONkzIpFWOOt+VsWe2XsX/52/xjmXAxNcxHTwa
         RGhI2VxUQvZgWhD6CPMjqIcezKwO7hZyd+vgKbnSYWWxRdxSKymxg1wod+1cKpajpuiC
         5WsJJwrUpQnJ1R5PhJNTS+Cm9DcHn7NXQb2Gb6MOInLxzPb1gQBxEN7RrjPRVY2q8d4+
         +9DgvxMDec7PhtA/O8Wi7duWDwksx8suULWmaek4SdNcV/xp69XaJXXpwTHtIYCtt7WI
         nrCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v97+vKq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m123-20020a375881000000b00767ce5a8d3fsi430102qkb.59.2023.07.20.09.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 09:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v97+vKq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMWdJ-0007OG-HS; Thu, 20 Jul 2023 12:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWdI-0007Nn-8G
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:36:04 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWdG-0007I5-IS
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:36:04 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so1596620e87.2
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689870960; x=1690475760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1te5QnsGdqFFgJE8Ufpgh1r9/Gv8HuA5cGaTx2tb6/k=;
 b=v97+vKq+RLntxc3OCeriVEI71u83ToMUoKrqfiA56avpm7YC+GVfnjtKZx0zqhNYJ1
 VSP+HaH/PsgJ4iSsJkR5V6zE5+OdAW0HKLc8NAgAY1II3JsuWeSWuL4l7F+zaBqoNpLk
 mpBBLexoP/1ziAPLsQyitcsmy+DpfQ2Fu2LhASnhD8G3/d53miS5uIJEvWuQXSrSjh5E
 fhcIQsf+9TVSzIYboal8uRbeHozxFdNJI8GjcCK7i8jlyb1Z2fpbjJpSzWEAPdLGq6Qn
 u8mSiFXY/oxmx9o93P4ydyPOXAM+2wWZpzJPWOifsDhwZ0L2tTnTQCEI8ZnDlMtfbP8l
 EZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689870960; x=1690475760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1te5QnsGdqFFgJE8Ufpgh1r9/Gv8HuA5cGaTx2tb6/k=;
 b=GAd7npJR2jszPs77wxzt45Gd74o8pWvdVXY0ARSLHfaJPiiq1v9LpFIbCfkgXR7dPZ
 GMHl9B7fWR/EfGHhqMn46TNSYZZPEUiAkT50+gQTg7a1dNbTg0B0UD8MlsioZWUz0zPX
 2V6TwqopBFGjqGbiQElbC16THCYykuZ5qj+DG/OBAJEpmHGoIao35kXmJF9ohvDgN1q5
 q66SNdVQMICnsNaejSBLZOKNnykA8Q/8Xh1DdM1hzxYQxgUaZ9MYorR8tU+lN03ehXMo
 0G6ZZC1uVRk7vWe4BTckH1+1Q61tdRCiGHrvgPQIFIgMWp5b8MxcdRWFQqTbkrA2n8QV
 SXfw==
X-Gm-Message-State: ABy/qLbyB8HPcz0pqWAHALl9LCyc25w18HwgsrBLWw9zKqxAqXQUr4BO
 Iy+Csboy/2W5n702+SzcHQe7zbEbWZ1BTXRLot8OBg==
X-Received: by 2002:ac2:5dea:0:b0:4fb:89e3:5ac6 with SMTP id
 z10-20020ac25dea000000b004fb89e35ac6mr1846981lfq.62.1689870960297; Thu, 20
 Jul 2023 09:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <20230719153018.1456180-4-jean-philippe@linaro.org>
In-Reply-To: <20230719153018.1456180-4-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 17:35:49 +0100
Message-ID: <CAFEAcA9Wc00X3oqN2aLP1QeVbv4Ji+8x0a8nDUtgkA3fjyNWQg@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm/helper: Fix vae2_tlbmask()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YNwEnfLvV0Yr

On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> When HCR_EL2.E2H is enabled, TLB entries are formed using the EL2&0
> translation regime, instead of the EL2 translation regime. The TLB VAE2*
> instructions invalidate the regime that corresponds to the current value
> of HCR_EL2.E2H.
>
> At the moment we only invalidate the EL2 translation regime. This causes
> problems with RMM, which issues TLBI VAE2IS instructions with
> HCR_EL2.E2H enabled. Update vae2_tlbmask() to take HCR_EL2.E2H into
> account.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  target/arm/helper.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e1b3db6f5f..07a9ac70f5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4663,6 +4663,21 @@ static int vae1_tlbmask(CPUARMState *env)
>      return mask;
>  }
>
> +static int vae2_tlbmask(CPUARMState *env)
> +{
> +    uint64_t hcr = arm_hcr_el2_eff(env);
> +    uint16_t mask;
> +
> +    if (hcr & HCR_E2H) {
> +        mask = ARMMMUIdxBit_E20_2 |
> +               ARMMMUIdxBit_E20_2_PAN |
> +               ARMMMUIdxBit_E20_0;
> +    } else {
> +        mask = ARMMMUIdxBit_E2;
> +    }
> +    return mask;
> +}
> +
>  /* Return 56 if TBI is enabled, 64 otherwise. */
>  static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
>                                uint64_t addr)

> @@ -4838,11 +4853,11 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
>  {
>      CPUState *cs = env_cpu(env);
> +    int mask = vae2_tlbmask(env);
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>      int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);

Shouldn't the argument to tlbbits_for_regime() also change
if we're dealing with the EL2&0 regime rather than EL2 ?

>
> -    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
> -                                                  ARMMMUIdxBit_E2, bits);
> +    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
>  }

thanks
-- PMM
