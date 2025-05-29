Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp563563njh;
        Thu, 29 May 2025 08:37:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVw5yQVUrAgSeDP7OejkES1gc88ngVeKMZZFTDDwqm81ObYMHDk3VO6TnlzQ38f1+AlNF7v1dFHoq6I4g==@linaro.org
X-Google-Smtp-Source: AGHT+IEWsfo7KtA4XLuW/Y9CL2rRQsQdC0aBAwWl3XkRaqKbAWCRx8aHQAoh7JEZSCuiqYrbRlJ/
X-Received: by 2002:a05:6214:2583:b0:6fa:9f9b:8df0 with SMTP id 6a1803df08f44-6faceba6780mr1422356d6.20.1748533079778;
        Thu, 29 May 2025 08:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748533079; cv=none;
        d=google.com; s=arc-20240605;
        b=ES2ezLKnL1eK+SsQ+EBJfOr7Cje5f5y+fF9DTc42rnvRKKre6TyBAf7NM+unbhaiXg
         OmKt8cA2MPfOCqyQLHAf6P49bTQjXWFq6PLxkgKynmicJjVSmCrkljGBI5kyU102MRla
         9ixAKC1umB3CGuiC4iIrpaI1kS5obZmEDpWfuCr8EdSQ32RaVH/VkKevgKZX7PL5sV0v
         v7gnZEa+FyKShXHlMQ5389jeYel+ERcuIHCKT5BV9DPqMcnbJVDyTPPPsOwBTCCDZ1fD
         N0KDDbz0MSrxJJ0Vtk5UoybPSzEFcrEJGjEphuiVlOpz5rrfot18iO1Y/h3pJ0QyccFm
         5bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CE6kGDjxFKKcDmM4b6gj6+heUchY/sQzHh7mQXpY2lI=;
        fh=0Q7VsPfS5dOVYckVYqsBkCJ3GOwkpinNAiRkKB1y0M4=;
        b=AB8YfYoMt1ThMFXuocwMKHT20gCeF/t37zFsZtAabPeaTtH9X03xf/k593f5402OY5
         gajBLx3uxrE/HhgxwFReirGgytsc5mnYqC5d8EtAt5gZf3jUi1d9VstgWPvbYVAVgbqh
         GUqGqF6NfUeauuBZPMHgoxlJXhvwD9ZYANusr1GJ/ouMr0zVsvtrXMrKm34yxhuh/hbO
         k5xNCV8LEhPpTkwg+dNMSyapZU7RGovZpNanmofLphlwYvoywP5jUMAJjET0U1DbT0YQ
         wcaQlGn1NEDUh0UQQhCrpQyaR9DCRpF61tiC5FbCkkdDd9RP6hWkuG7Jl94rrsxBD2t3
         zyqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDpE5w7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6dcaf45si17872496d6.160.2025.05.29.08.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 May 2025 08:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDpE5w7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKfKC-00029I-1E; Thu, 29 May 2025 11:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uKfKA-00028d-4z
 for qemu-arm@nongnu.org; Thu, 29 May 2025 11:37:42 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uKfK8-0007KP-EY
 for qemu-arm@nongnu.org; Thu, 29 May 2025 11:37:41 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-70ccb7effb0so8004777b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 May 2025 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748533059; x=1749137859; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE6kGDjxFKKcDmM4b6gj6+heUchY/sQzHh7mQXpY2lI=;
 b=FDpE5w7BAqy2HsU8SObPewqRMooY8IO3zhJJwifaAT4qQpiv22nDOKOLw6RexteByH
 vr44bKm033/mhGtiRp534RC4qd2R+zlW/xuNvhR7756VORXsvFn7wG956pkH0iLhg5rv
 Ahn7uAP2Oi2aJNRaFk8imms2SlLicK1i84rgBHTRTsK1C2CWlI+VzX56RnnaZwXOZMh9
 1GvNTe8CjUm1EqdjuF6kPz5OQzgKPPUEnC/gr7Mm6/EEffldYnh1Kt183tMstnbl1SFt
 yX6MFIPyXpGFM36NCHo41R+mp47EQEQv8XhhJOckzjC0Rp0VSrkKCc78KXu6JG12O8Qy
 d/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748533059; x=1749137859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE6kGDjxFKKcDmM4b6gj6+heUchY/sQzHh7mQXpY2lI=;
 b=ML5j1xGNgDyyoVwVZHc+aLFRdgx1wXfTDNl5iXd2SpHxYcw/LYj1H8zqYgaw7IpwsV
 rkLjTasoaLPLJrz73luWHvgK5QTCUS0Drabxw8Dk5HyftKZedTdiQ59cVkS9gwrkrOiE
 yOeFnVpkZeEtHvv4u5QN/cUQmONwfU2Cyns1N6KThf3UhTV8eo1eEVR552+cGnULK9rD
 bLRkKKsLusApoRsy4oUcbrmrj1dnfxDNhgMEhNqNGOXhsco1JKfVOPb7JSegkPj1s607
 6bJAmOfZdxxl8gxHSQLwegH8cxVz21xvFsr4+HaNxOPkVLxdUggwpevZXSubo/9pCIjv
 H+aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMRp+heGXRtRTHTromPRdpO0e/5P8s7gbJXxkrQKlpO6igYzcOtN0MUTN4XX+44SDNG/xkN2WM+A==@nongnu.org
X-Gm-Message-State: AOJu0YxRHVYxjTgqnynE+hqtiX6E8qwHQPZgdvMLGlVxKGCxhAQAugmt
 CnUnYJ6EaVlZM02owJX3yMJqwtqZPBf13Ys2tXVpskEgtlghi/KEjRxpDdD8BvGbOR5olfDjeQ0
 x6/DDqlGBLS1lEBBAjq8cyH+GbEAYvnY4OVcKBOcg1Q==
X-Gm-Gg: ASbGnctZuoU7CxcGTiVh0ddagFSqL32hyOTXKg9etz8B0yK6Ak6704/xlxg0Hy98dRH
 kkLclylQRb898aZ9+R6g20trGmh2OcJaqimdqFnvEyi6FgPzC/WAGTQsVHlFRD2lJgS+l43OQIm
 /5CvPWSWwF+nHqgWUxoLZM6YCW1mbn++BURw==
X-Received: by 2002:a05:690c:5c08:b0:70e:2a57:83cc with SMTP id
 00721157ae682-70e2d99f0c8mr243048637b3.12.1748533059073; Thu, 29 May 2025
 08:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250513173928.77376-1-philmd@linaro.org>
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2025 16:37:26 +0100
X-Gm-Features: AX0GCFvvE2syBP7vEGPKMecrfOn87W-_yMOuKLhfHhBrskq9tsOgpHEQGXcX52E
Message-ID: <CAFEAcA9jfLT2NY_1K7z-zHyzzpbw1NcyKRxrPvLx3CoH2QxSRg@mail.gmail.com>
Subject: Re: [PATCH 00/19] target/arm: More header rework around arm_feature()
 & multiprocessing.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: TJZg1iXf8Rwk

On Tue, 13 May 2025 at 18:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Before I respin my "single-binary: Make hw/arm/ common" [1] I'm
> extracting these random cleanup patches. Some aren't necessary
> anymore because now units in arm_common_ss[] can access "cpu.h",
> but the patches are reviewed and simplify a bit IMO.
>
> Based-on: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
>           "single-binary: compile target/arm twice"
>
> [1] https://lore.kernel.org/qemu-devel/20250403235821.9909-1-philmd@linar=
o.org/
>
> Philippe Mathieu-Daud=C3=A9 (19):
>   target/arm/tcg-stubs: compile file once (system)
>   target/arm/hvf_arm: Avoid using poisoned CONFIG_HVF definition
>   target/arm: Only link with zlib when TCG is enabled
>   target/arm/cpregs: Include missing 'target/arm/cpu.h' header
>   hw/arm/boot: Include missing 'system/memory.h' header
>   target/arm/cpu-features: Include missing 'cpu.h' header
>   target/arm/qmp: Include missing 'cpu.h' header
>   target/arm/kvm: Include missing 'cpu-qom.h' header
>   target/arm/hvf: Include missing 'cpu-qom.h' header

Hi; I've applied these patches to target-arm.next.

>   hw/arm: Remove unnecessary 'cpu.h' header

After this patch things fail to compile:

../../hw/arm/exynos4210.c:511:20: error: use of undeclared identifier
'ARM_AFF1_SHIFT'
  511 |     return (0x9 << ARM_AFF1_SHIFT) | cpu;

../../hw/arm/mps3r.c:295:14: error: use of undeclared identifier
'GTIMER_PHYS'; did you mean 'ITIMER_PROF'?
  295 |             [GTIMER_PHYS] =3D ARCH_TIMER_NS_EL1_IRQ,

etc. Probably this patch needs to go later in the series.

>   target/arm: Restrict inclusion of 'multiprocessing.h'

Starting somewhere around here the patches don't apply any
more (trivial rebase conflicts, I think, but given the compile
error above I didn't spend time on trying to sort them out).

>   target/arm: Move some definitions from 'cpu.h' to 'multiprocessing.h'

>   hw/arm: Include missing 'target/arm/gtimer.h' header
>   target/arm: Extract PSCI definitions to 'psci.h'
>   target/arm: Extract feature definitions to 'cpu_has_feature.h' header
>   target/arm: Add arm_cpu_has_feature() helper
>   hw/arm/realview: Replace arm_feature() -> arm_cpu_has_feature()
>   hw/arm/virt-acpi: Replace arm_feature() -> arm_cpu_has_feature()
>   target/arm: Always include full path to 'cpu.h'

I'm not sure about the arm_cpu_has_feature() patches at
the tail end of the series, and there seemed to be some
review comments to the effect that maybe we don't need
them any more?

thanks
-- PMM
