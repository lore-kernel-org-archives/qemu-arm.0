Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD74C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:07:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uebzQ-0006Vm-Uu; Wed, 23 Jul 2025 12:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebz5-0005xc-Ja
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:06:23 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebz3-0003p4-RQ
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:06:23 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-71840959355so1041367b3.1
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753286780; x=1753891580; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vSGrhNHEwYU0lQMKHvf2QPzMKfk0ILIx2rv+NoDssE=;
 b=n7Dn1o5cIZ29weba0PBH8VOpGSv6u0WEqEPprZnyWxFJwIGsphoBwWuXth0d2BcbwS
 yQIujnwZYN7oxDT8ntWewNppGjixm2X85v4pcP3Y0OxfamVkhaIKBWzghd4P9tGXigbg
 B7KHiafHDm08BQf51qTK2H1kw0Mbh+Q68z6ON/wNI/1FXm4CV2kGKp/VlLT4fsAJvYYX
 iyFhDEadvT9MKgLrYA5HqnboTI3vQMjA6A3Uz7cK5W7CNpMmDlDxAYoLN6L70hq2mSBm
 llWU3l682bOsJCSi47ZfKqb7RdypAtycXpQFVQ0AHoy4AdbL9fJI2iVw5ssaI9jkzpAu
 C+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286780; x=1753891580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vSGrhNHEwYU0lQMKHvf2QPzMKfk0ILIx2rv+NoDssE=;
 b=YrRPrPZtwfPIXjNcet0trai3eWmz17RyLJCSeJ2ODkyVE2l4bYk+iVb9QdP8DyAiwT
 e6lEMi+KBp9GhImqQ/V0Ubk6EyLJQWtWF0JnjK1/SnZWo0xLrTd0HN+MAOGNzfCzBCkU
 m+Z5slXLxwlmd+6vVSrLo2KEuQRR1prbfJ/toha5DHeyFBPwtMnOua+oeITEuXyW4FtT
 9plTfUPl0Yk6X0VJf3hhWbaCL4cIXzXGKDkPbAcufv23ExKTCyeMuozUCyttTlavnsEr
 ZoPX+9PtnNnbKWzJuR/xyRKae8yq4F7JuouLnskQMEl4InO7ErqewCP3xOKW+O9KvVOv
 BrKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHsCH4El+2hcG4/On8z4ZCwHBXdyXl6HL3iJso690lsDE5+i+872O841MlJzWysLhHeiAU9v4uRQ==@nongnu.org
X-Gm-Message-State: AOJu0YytGat6kwUacCQFpy+uH+zTYg2ot2cO8tXYGOKLwz9TzbpOLtpz
 WNDUlh3/0WNt7KrYrlS0JwIgnNn5Xakvh4s2xbVD/MN/P3jKpJdgGa117D5nSetqcd/pp637muC
 jBprad+pADVUiuVc7wOJCs81ccvLphO+c3kdCijC9yA==
X-Gm-Gg: ASbGncvMwF3TSIEO1UWeVJ6ZrOtDOS1f+yR5WlwxnjhEAj999IccdMPeWbMZu1wQ5iE
 Qld3vuvBhOKnBrtmDNuziyUDH4CkpZ3YL+7BH8CD0eb3wXD9nMbs07mOdM2MVchosj6z0Ulh0rA
 bmcscC7RDpt4Y24DgKacUe1xOx8+gOtImxOdj/melURlsyY7KbrVlqgPpnH2ps9pislI1/rupNM
 sApKU/D
X-Google-Smtp-Source: AGHT+IEh5pBHeb66mo0LTS4E4tZfL/BcjEb0VgDJ2TNUmnsvDjiF/q+TJuGahequE60YQ67TZe4kKLaNYJKGlw0dyIo=
X-Received: by 2002:a05:690c:7107:b0:70e:2daa:65b7 with SMTP id
 00721157ae682-719a0b53556mr102529697b3.12.1753286780320; Wed, 23 Jul 2025
 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-5-philmd@linaro.org>
In-Reply-To: <20250723135156.85426-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jul 2025 17:06:08 +0100
X-Gm-Features: Ac12FXwEs_KJkhbGkhaYXW4dnpaJQ9Exigs3r_seXukmG1-qzLvHFqhfqXBXMM0
Message-ID: <CAFEAcA8gp3v2D08hmR0CCtE9G8Jv6LgcQbKxN5sz6gYq8ODcrw@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v4 4/4] target/arm/hvf: Really set Generic Timer
 counter frequency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
> not correct because the timers have already be initialized
> with the default frequency.
>
> Set it earlier in the AccelOpsClass::cpu_target_realize()
> handler instead, and assert the value is correct when
> reaching hvf_arch_init_vcpu().

Could we say here what the user-visible consequences of
getting this wrong were ?

> Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/hvf/hvf.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 7de770da4f3..ea9e6b1c0c6 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1007,6 +1007,13 @@ cleanup:
>      return ret;
>  }
>
> +static uint64_t get_cntfrq_el0(void)
> +{
> +    uint64_t freq_hz =3D 0;
> +    asm volatile("mrs %0, cntfrq_el0" : "=3Dr"(freq_hz));
> +    return freq_hz;
> +}
> +
>  int hvf_arch_init_vcpu(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu =3D ARM_CPU(cpu);
> @@ -1018,7 +1025,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>      int i;
>
>      env->aarch64 =3D true;
> -    asm volatile("mrs %0, cntfrq_el0" : "=3Dr"(arm_cpu->gt_cntfrq_hz));
> +
> +    /* system count frequency sanity check */
> +    assert(arm_cpu->gt_cntfrq_hz =3D=3D get_cntfrq_el0());
>
>      /* Allocate enough space for our sysreg sync */
>      arm_cpu->cpreg_indexes =3D g_renew(uint64_t, arm_cpu->cpreg_indexes,
> @@ -1083,6 +1092,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>
>  bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +
> +    cpu->gt_cntfrq_hz =3D get_cntfrq_el0();

Maybe worth a short comment
/*
 * We must set the counter frequency hvf will be using
 * early, before arm_cpu_realizefn initializes the timers
 * with it.
 */


What happens in the case where we're doing "try hvf, fall
back to tcg if hvf not possible" ? I guess we must figure out
that hvf won't work quite early, and well before we get to the
hvf_arch_cpu_realize() hook?

-- PMM

