Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp130378njn;
        Fri, 10 Jan 2025 04:57:37 -0800 (PST)
X-Received: by 2002:a05:690c:4b0b:b0:6db:e1e0:bf6a with SMTP id 00721157ae682-6f5494cc418mr43199297b3.7.1736513857164;
        Fri, 10 Jan 2025 04:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736513857; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1sGqJMXuMV9C9GLdasZkULZSgHcBL5ZXi1u4NKllvO4RwKum5LnbHbaXwxfkEodFl
         qDqkmc6UlHk6UIXxOyp5arP5tuRUI22z6TLUFNXhlp2o1F/RfkUPamVC7NmxTVDfu7Aa
         dMvkywqstAwSsnvlTRHfai4jifzHXlJ9erTbJveUAnejnir7IrNYTLYPBjQ4wW1go841
         R1/ybovfMjiqmHgsyQVOkWGmCDiUls1nG2utll4VVt5BxNWjY9knoI4C6R9iRquStu52
         6OjTnsuaGySzYlXNQ7akXrMk9i83FzsvhAUmeNRb+ZMQFRKTclvFPdXRqtweVxg4ckQF
         /v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWpgClhMu8y0WMFqZn0FgquieZBpCTzT/UOP0udnz8w=;
        fh=4dKGWKlHv57Zp9hkSCUsePRSIZk2rChGVpZxjAnL8x0=;
        b=OpPdR4Fg7J0QFNH3MyIK93asdSHiFm8NX4YJGLPqqZurv6hLFXdI/fxbneGb8L3IZ6
         aNCINkyvyt8zztIdl59fqh2/hzeGUOm5MEVa3iBwX/4XxRM1ldkDhIk8H57hpY7QHMGA
         yGHCRRX+hQjEOOK/W33o5Zc/RnSEyIA4uaW1n4xhm9tl0Q1aDbvV3KOrNRRjkRWL8+zt
         YOJBXgrICRIAm3N4OSL+cz7vFy3WBAHBwBJ4TB6kPFR4P1tQ9sWrsi0RZvoDQSXBbTE5
         zJk+x0hjWB15tXXMknBrel8HfM29IQ6vJxIPdUc9sbbzgB44cmedGCtVOHj8CYmaWtCc
         P1QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsQAYZt6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546a72ccasor18456857b3.0.2025.01.10.04.57.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 04:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsQAYZt6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736513857; x=1737118657; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWpgClhMu8y0WMFqZn0FgquieZBpCTzT/UOP0udnz8w=;
        b=BsQAYZt6oj+/pbCf8Byi28K5ArbNPV+HXy5WmpblsIM8UY5VIfn684h0CSdqYHrd9S
         MUVp+OgR2keEBiTktHZmjZgY+Y7xgu27rTC91qfdS1YY57qv02KF6mItRWYbRTMD89bx
         exAlrFvYMeSEH7MhHOrI9oFKs8ck9KGjadtAW83QWY4UIkRs18JwISyC9Pbi5zuSdpEt
         LazG0hXO8pCRldylgIt5eUu8HuyGkKJnrZCXU6t9n9tPA8UlzEX9zw46w4KwMmDEEgYS
         FWyVrZ18FgksSJ19B9Wd+36FHxtKNmsB+iv/0pxNZBqGGdPq+T1lnEMvMIXNJFVDGD1c
         Q+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736513857; x=1737118657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWpgClhMu8y0WMFqZn0FgquieZBpCTzT/UOP0udnz8w=;
        b=vk0wXsnXLpsfjh9ZT1J/ktywbRIISVX2Zv2U/nM9/tJsqjdAGCP4uzz4YDIPWA+aWY
         9vFFdKhZgVrMWYzha+K2ml1vgPeCcAA5O4CZlVlgyFE3fOo9zFtpSIBf/VqMY/fLbX2a
         uptdDNW8/XTzSF6DK9lcTPBDCErUOPqJYvLHeN3zJ6l95CT/7elhQIzL7KQBURalrykO
         SpoiUwkEQ6N08craKripJjzeeT9Ks0LxRdLFUKCKuI1UA+/UhdU2edV7QzZ33fheBtGp
         bof2YW9xSTIJGQ1sn60s7mvI6SsNIDkqXYA8WdHZN4Nz2mWIOjlAfOzC7mFngZ5cfvfP
         7hyA==
X-Gm-Message-State: AOJu0YwK4QBpoNt870JEhPzXNxpM0Ij5x4Iz9FuK3wDoWFkElTmi5Rq4
	kckMOQncetbNy8CAt6uFLgX3t/pzUlvjzsK9ODA06gc+2aacva6m8nJDG/+68HieRC9GMAjix76
	rNQWcmeKJP+KQ+gV58XVHjgsC+9kNSQJXXIvuWsNgEKhtmJNwytchDA==
X-Gm-Gg: ASbGncszmuwQ6D99RGvsNgzfDcj2Wg/1Z866jVff33WgJzCd0T5jSBzjByB0nnCobPX
	TOz+R8vVwgnbWsoojILv0B7Qz4YHwzlhgMolvU9Q=
X-Google-Smtp-Source: AGHT+IHcE065TBe/uA2Y7mFRis8OKe5LTm7adGkxAIeoPcxcnaO3bt70DOFe+BMWMUwwXeuuVg1gBKW7H85VXBKRdiw=
X-Received: by 2002:a05:690c:4a0e:b0:6f0:5fc:7d with SMTP id
 00721157ae682-6f543e9b1e6mr51579967b3.11.1736513856798; Fri, 10 Jan 2025
 04:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20241218181511.3575613-1-alex.bennee@linaro.org> <20241218181511.3575613-4-alex.bennee@linaro.org>
In-Reply-To: <20241218181511.3575613-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:57:25 +0000
X-Gm-Features: AbW1kvaOOj0yN8OXi4jL1b-c8NvPOfIJXFRhrNoYialIjYiHtbpwXnh9vGjlY1M
Message-ID: <CAFEAcA8r9OS9SO_26GmagYD1E-0e1OSmU8GiGXtogpOJ5c7vYQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	qemu-stable@nongnu.org, Andrei Homescu <ahomescu@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: O3GDv1GTbZE4

On Wed, 18 Dec 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
> actual implementation utilises the same logic as the rest of the
> timers so all we need to do is:
>
>   - define the timers and their access functions
>   - conditionally add the correct system registers
>   - create a new accessfn as the rules are subtly different to the
>     existing secure timer
>
> Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> Cc: Andrei Homescu <ahomescu@google.com>
> Cc: Arve Hj=C3=B8nnev=C3=A5g <arve@google.com>
> Cc: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> ---
> v1
>   - add better comments to GTIMER descriptions
>   - also define new timers for sbsa-ref
>   - don't conditionally gate qemu_timer creation on the feature
>   - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[read|w=
rite]
> v2
>   - rename IRQ to ARCH_TIMER_S_EL2_VIRT_IRQ
>   - split machine enablement into separate patches
>   - return CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
> ---

> +static CPAccessResult gt_sel2timer_access(CPUARMState *env,
> +                                          const ARMCPRegInfo *ri,
> +                                          bool isread)
> +{
> +    /*
> +     * The AArch64 register view of the secure EL2 timers are mostly
> +     * accessible from EL3 and EL2 although can also be trapped to EL2
> +     * from EL1 depending on nested virt config.
> +     */
> +    switch (arm_current_el(env)) {
> +    case 0:
> +        return CP_ACCESS_TRAP;
> +    case 1:
> +        if (!arm_is_secure(env)) {
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        } else if (arm_hcr_el2_eff(env) & HCR_NV) {
> +            return CP_ACCESS_TRAP_EL2;
> +        }
> +        return CP_ACCESS_TRAP;
> +    case 2:
> +        if (!arm_is_secure(env)) {
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +        return CP_ACCESS_OK;
> +    case 3:
> +        if (env->cp15.scr_el3 & SCR_EEL2) {
> +            return CP_ACCESS_OK;
> +        } else {
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

This code is still using CP_ACCESS_TRAP in some codepaths, which
isn't correct. Either:
 * you want an UNDEF: that's CP_ACCESS_TRAP_UNCATEGORIZED
 * you want to trap to some specific EL: that's CP_ACCESS_TRAP_EL2
   or CP_ACCESS_TRAP_EL3 depending on where you need to trap to.

thanks
-- PMM
