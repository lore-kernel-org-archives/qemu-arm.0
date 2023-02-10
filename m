Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1851846ejb;
        Fri, 10 Feb 2023 05:23:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9+CXKvKklcLTJrBVbf9hCbGXTiQm03yW/SVsL7fVs2mMC9sirJGoCG85vZkrp5vuZjwgOq
X-Received: by 2002:ac8:7e86:0:b0:3b9:e3fc:5689 with SMTP id w6-20020ac87e86000000b003b9e3fc5689mr25416796qtj.58.1676035433307;
        Fri, 10 Feb 2023 05:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676035433; cv=none;
        d=google.com; s=arc-20160816;
        b=FFqZL48YLCjZmJ+QKdnoLQMJd66t8gUeohHBI7A8aySTQPRoWm+eQ2Q10qQkmw/f8k
         4PtcsFwUkNR3X/SrCXo+9hWo9i4xnDenCbf95vJZwtKaMElKOKLiI9SQNHkEoJ+K33Cl
         gFVTR07wQ4haFKi2ZFRLoXu9I8muuqKnXd18PnyvgSbzU35NBo4+Jhyh+1ukaYW1EZKH
         uLYv0zxnAn4Pk3RYhE2gUItv5A8Nun0dpH82nhv8BCKxEIeZPYWKniFZRXcXhljqZi8G
         anVQJWw/OIQbUPKk0pVe2MOSLRjYxvj9ravGVWePSTGD9zAva4wm/1QI/N3vjHvDoAIw
         LjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5Uh4LvAjqS1PXos/SFXGgkzGwtB7EbyJ1YBZFCF9Z6s=;
        b=JA2A6tkX7RU3/0UzOSRYuH3dvnS9JeZeLD3Z4VOOCy7sMd55yEyr+hGGxDka+igY7+
         APyGagLY6+ZEhIzrqfvxkW27FmvuEbFfkuPxZ0015efjvMjESv/6FgtgXZs2jKvnoNLz
         DUVmAONifi7mcznWiL5YuiwLvPP2k+dvdyQuQDuQAHQM0RhXJw8DdwXWVhg9FnkR4Kwm
         WFpa11XRO60lOiVyi6nyCS5XR57U7zhOlJAmL8PXYS4hKJsyO8okZHvpOJbjQBhRlsl9
         y9dEIIPTFBuLJBK/k0lJrfThoA5epwX2XAemQWEBE9mqHQodFvl0P5D2ZumMemWEr0vx
         ZvSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ALF/Nil/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020ac85bc6000000b003b8599d7188si4132042qtb.226.2023.02.10.05.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ALF/Nil/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTNQ-0005cT-Re; Fri, 10 Feb 2023 08:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTNP-0005bK-8d
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:23:43 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTNJ-0004yM-Vu
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:23:42 -0500
Received: by mail-pg1-x532.google.com with SMTP id n3so3676797pgr.9
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676035416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Uh4LvAjqS1PXos/SFXGgkzGwtB7EbyJ1YBZFCF9Z6s=;
 b=ALF/Nil/zJWzX5XpH1wqvVSMyaafS780lKa8FyrKpybdn1HTTCXgBxnCDaNgzTRsPP
 EfK7VKQRnZaU79SbIDsmbLipzpibelGx9R8zXlytYOthb9No03IO+vzjq/T+9rSsIxlE
 4TG6XtaBAyEbfP3a8g6HeDneeDdHR7f5zHZbmhq3PUlGJunKdKzzsg7Hqc2O7qWw3KTq
 fJXgzGiHNq/x45vBxu9X3ThPaGLzZ6xeHBK2fNrzAY38LMTFMLxqdL0d4vAGqX9yNJAV
 XkYnfdGmLp1qDkTBiXSQafWTdSJtD2YSAEVXolYF3N3q90Wnx39nOUY8izo3gnYyzvRl
 WMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676035416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Uh4LvAjqS1PXos/SFXGgkzGwtB7EbyJ1YBZFCF9Z6s=;
 b=dlPaNitqWNkPyjKmqzliuDs/ZKWMb2mHEici9BRJ28wRRpwzrxx4ImiONDAb72AS+e
 3gzYwPQVfuSkCpTEuVTzvEUvfbbXiClJexmMf4LU0RgknVUq3YyBGDuVYDvimubrnB4C
 4x2LAmlDGEczv3rzhwOuxjBzYsjYMxAaUJcif5XUEqv4Fm2d7N8ufBgZ/7pN2CD9X7o6
 c9EecDaTW6IO7xT8eAQOO11djzv6Rr5NX2WBfuAmpLH1OeFXi4zKo6l4V3d1fqncqBlA
 JhAlo/pVXTlDeRmRtDT4dCH6V+aWJgIctojdErzv/+PpdBVh52D7SjlZTAv5erxQwyz9
 3k1g==
X-Gm-Message-State: AO0yUKXd04hroVhmf3GQfrdaStltmqCwDnAxAJeJ30Pay7xzVtXtb/SV
 vnAhNRJ89ZVq+N3siQknJ23KJw3VhBOWwnmvpDXkkg==
X-Received: by 2002:a62:484:0:b0:5a8:447c:b45d with SMTP id
 126-20020a620484000000b005a8447cb45dmr2216098pfe.23.1676035416632; Fri, 10
 Feb 2023 05:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-17-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:23:25 +0000
Message-ID: <CAFEAcA-sUJ54teMSftw6TEN0N73EOKCRETMX2xoxO-PHpNvttg@mail.gmail.com>
Subject: Re: [PATCH 16/22] target/arm: Move s1_is_El0 into S1Translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5nQ55nxNr5ly

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of passing this to get_phys_addr_lpae, stash it
> in the S1Translate structure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 37f5ff220c..eaa47f6b62 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -22,6 +22,7 @@ typedef struct S1Translate {
>      ARMSecuritySpace in_space;
>      bool in_secure;
>      bool in_debug;
> +    bool in_s1_is_el0;
>      bool out_secure;
>      bool out_rw;
>      bool out_be;
> @@ -33,7 +34,7 @@ typedef struct S1Translate {
>
>  static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>                                 uint64_t address,
> -                               MMUAccessType access_type, bool s1_is_el0,
> +                               MMUAccessType access_type,
>                                 GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));
>
> @@ -1257,17 +1258,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
>   * @ptw: Current and next stage parameters for the walk.
>   * @address: virtual address to get physical address for
>   * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
> - * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
> - *             (so this is a stage 2 page table walk),
> - *             must be true if this is stage 2 of a stage 1+2
> - *             walk for an EL0 access. If @mmu_idx is anything else,
> - *             @s1_is_el0 is ignored.

This was a useful comment on a boolean whose semantics aren't
totally clear just from the variable name; can we keep it ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
