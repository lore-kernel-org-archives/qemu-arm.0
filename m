Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E94CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:45:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIxN-0008Oi-8B; Thu, 15 Oct 2026 06:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIxK-0008Mi-O3
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:45:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIxI-0006rD-6k
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:45:02 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8a83d2706fdso18874177b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061099; cv=none;
 d=google.com; s=arc-20260327;
 b=ehVh3kTjLLms3kdqPO7aIV+gZ2/yIKALQFAh4Preizlfp5AI7NVupGY5axsyYRLwUI
 feSaFIvi833Ukn40DKZdIs9HOfjpbgxQEAg1ILXao0b5Nl2HzNMA0jCMqx2lyGoJM4Vi
 ClilVtCvWr4mTGfWxflEQNT8i/DVHHwGvnONVLku3yRbmgeTccakeLewfPaOykVQf0Yi
 ISOdCmzeTke6L7oFc9MgTiBBXY8ekQEa6G1qCKg67Qm4PWXe4Ys5qdQ+x9RLN+69K/zO
 GuhtXNxArfn5wB5DOUcFAmXzNn+v9T90YZIFjAM0MN59tfp0+V35B/nt/TcDJh5nhw5Y
 MT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=VeK25S39q0agAlFTm8ppyZypDBOICxzXmnVPINozsHk=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=sGsa+RkVkmGe7jV/yZxw7/OJW+d/uI8ct5wB+e83g8DFKXAaTBRXDDfO3qSa0C08A1
 pRkFUygvLXkXw38ATIqy/dDgbYdl1wy4iD9uVTIDb9iC7OocQFaCoZFlC/cg5Kk61YdV
 VgFPPNapyqpHESv/rSY6twqOVC9ZKp7r7akJSly34h28lq48kDqq2wITevUZR4dCSlxt
 S7jIDyVDPiEQGyQA6Kb5alsRHIMcMhs2bYrY0+TFmxpoWJWrHVdWW7am43Zqo6UPMEnJ
 DZNCJLLQiVLQ42F5dEikxUtlLIehY1SI61CDCOvvH3exGuH+tJZjC1cw/7MC2BQQdhnV
 OQZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792061099; x=1792665899; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VeK25S39q0agAlFTm8ppyZypDBOICxzXmnVPINozsHk=;
 b=NQU5YCmzlDf6bajD+u4Ct1h7P0fy77IznI4vE0P5FcAOFIYAbbUY2/2XvbE7Oz2ihG
 7zvGoD98/ibIFeDyF+93Z1pD8TLFf0CdM5ebtdWfDk95bIupDDwZjW2UntYpGKGzEqE0
 NdCXapILgrwoneoOkI4KsmvquRQ7cV1GeB15oESiHJUdrPq8OoHdwlLvgPh1Os6YKfe/
 wsijrrx8Fg0YwOpkRFuc2XIuG83GMQNP55oGITH+N0uu6NUzvtesZOrKGGmnnjrx8xlk
 R+BAio7FgCg9tj1KCsOJO463vTl7MGpHu0TGrz0aGaFJkxdxgLFW9ofUi84aUlEhpqz0
 kpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792061099; x=1792665899;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VeK25S39q0agAlFTm8ppyZypDBOICxzXmnVPINozsHk=;
 b=JStSqvtJMW/ThGId0wHKNMnirv33vLi4FOBf32SGJW6XxyrdOWk2290ffdnV0BiAkV
 OiRqM26Z1HfLdOX9pwPguqTNQ7OkwAQrSyOVO/epzKvb7SOIjpka/bKhJNeHtEvaccov
 jdnFYW5vt/2wsejzMARPOuph/BC8ph57jNd+FT/46Zfv1IyxhFaG16uPEhuWJjMwrrCf
 BIO5sGXjW1Ke12irisbAyjW7x0rax/Spn4PYwhPZZQHBTNlNu0bqgfdWRcnNMRQUF54p
 qLCieK+7xfyKVCPslyqUsayxAky8EnLHKTF48t1+n140P+j1iopk0/PwFg8M1ya697uo
 WP+A==
X-Gm-Message-State: AFq9FYJvYlB40jePfZvGp8Ouf6qb9C1CancQHTf40P9BWOgILQ2NwNRj
 LRjNC7pw8aDog1u0yoieI+1QWZfzNh32XLWD2+HS4IQk7VtwxUsdNUKzgvOCVfS59ugDKQwVNQj
 aC3HyNxnoIfUDtibFkKHEu4YlWAo2jJt0AHCjVG7L5YH2F07t5Nun9/0=
X-Gm-Gg: AYBFou3NIZ59OD7QoYcUgCH3DWdJG1lPnBPuqwYPwB6gjilTcN/pRmSGvuxJzX05lN8
 ZLPaeeud2WXHQ0hhOH57+9yGh4nYAZASn+008Fq5bdgBecCn3DzirrMaeerAIm80wsbLj2xz8is
 dccdb24prGGXDLv7uAR5bmy7peznN51yJQURpnhORKCzIFSvOyB0+jHQe6Eu+sv7wvvZimRIwWv
 QYuGhmOsCXRH4W5eSTjQYrZydp84IRhWDS7NVPT0eaCQVtBxSY3l5guhwpLr5KZ6/efJZKmUpdw
 8UINt4998r9erRpXN/Aobb0Xw3v7KGYCdBb1gTlIwhk49P77KGHBh4xP/OJC+r8HMJiRx358rCP
 BW8jyKQFProvFVZf/r0ef8o6V3pLVYb/tp3Mrh/g=
X-Received: by 2002:a05:690c:c4f1:b0:8b0:a957:80d4 with SMTP id
 00721157ae682-8b0a957861cmr38502717b3.20.1792061098493; Thu, 15 Oct 2026
 03:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-46-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-46-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:44:46 +0100
X-Gm-Features: AclHuK_ttN2KSCuGuhflcafMj_TsXvjLxdxzYKAKelL-cFqGoltBNz86LukSdK8
Message-ID: <CAFEAcA9kpkC65TgGkh+7shjvckOUj3d-RN0FP4PWtrBPz4AU5A@mail.gmail.com>
Subject: Re: [PATCH 45/86] target/arm: GICv5 cpuif: Handle PPI injection in
 vPPI pending writes
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Tue, 13 Oct 2026 at 09:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In this commit we update the logic for writes to the virtual PPI
> pending state by the guest using the PPI_CPEND or PPI_SPEND registers
> to honour the DVI registers, so that the pending state of the
> underlying physical PPI is updated.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/tcg/gicv5-cpuif.c | 69 ++++++++++++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
> index cdde759bf41..5a2927faf75 100644
> --- a/target/arm/tcg/gicv5-cpuif.c
> +++ b/target/arm/tcg/gicv5-cpuif.c
> @@ -816,16 +816,61 @@ static uint64_t gic_ppi_pend_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      }
>  }
>
> +static uint64_t gic_ppi_vpend_to_ppend(CPUARMState *env,
> +                                       uint64_t value, int reg)
> +{
> +    /*
> +     * Given a mask of bits which are virtual PPI pending bits being
> +     * changed, output the mask of bits which are to be changed in the
> +     * physical PPI pending state, by adjusting them for the the timer
> +     * PPI redirection.  We require that the input value has already
> +     * had the bits masked out for vPPIs that are not direct-injected.
> +     */
> +    if (reg == 0 && (arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV) {
> +        if (arm_is_secure_below_el3(env)) {
> +            /* vPPI 20 is pPPI 30; vPPI 19 is pPPI 27 */
> +            if (value & (1 << 20)) {
> +                value |= 1 << 30;
> +            }
> +            if (value & (1 << 19)) {
> +                value |= 1 << 27;
> +            }
> +        } else {
> +            /* vPPI 26 is pPPI 30; vPPI 28 is pPPI 27 */
> +            if (value & (1 << 26)) {
> +                value |= 1 << 30;
> +            }
> +            if (value & (1 << 28)) {
> +                value |= 1 << 27;
> +            }
> +        }
> +        value &= ~((1 << 26) | (1 << 28));

This "clear bits 26 and 28" line should be inside the "else" block,
and the "if" block should have an equivalent line for "clear bits 19 and 20".

> +    }
> +    return value;
> +}

-- PMM

