Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp385815ejc;
        Fri, 6 Jan 2023 07:57:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv10KSg/Y3FXdP9HG5s/0kvXa1QVki4QEUbCrvJrP8L/AHjj9Veljy+OEnvEKc8J8WzCUrc
X-Received: by 2002:ac8:7583:0:b0:3a7:eb2c:efea with SMTP id s3-20020ac87583000000b003a7eb2cefeamr82197760qtq.19.1673020647842;
        Fri, 06 Jan 2023 07:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673020647; cv=none;
        d=google.com; s=arc-20160816;
        b=sIVVezzmHRTGAbPTCyXX3VI6MZGZioIrQMiRQm9YGnEkDMkL5bHPFfzm2NUfttsAF8
         p9gyuCULJTGWJ+x0rZxEzLl8tKTlbwQ0t9aTxkqrd/g+JN4MCaAQjX6e/UfYD60lm+9i
         bDe84cOU0i9FemXs6/L9bawma6srxXXP30RHwrxS1l5V+AMvv832tshca4Ig8OQkzumz
         E47/pomK8D4DZeo+WevoPUnjPIXQG8OSdH6ArDRvdvnU3TALXVMeGRuVWopuJz9su3PG
         zSeOzMzqu3JQptIPVsmoAoWb012bVVc6a90ODNzHpk3iABzm8DedAsz0dpF4FFUO+8VR
         t64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9uABkwrjQG1uQC5MGnlRIuDgLsfk5VsI53U4v0q4LUM=;
        b=LyYJgaKXcsulDnTeXQoouMswxXM456cTY9SyI2DTJ/23t6M7VKX4QjNmE0i6kV6nWP
         nq+TwYYhsn3p1gzHTldbk1P1lip/cicn6NG0EOpbwCwJ8sISgmFcT4wUoQnlWU3k4lAd
         cZu/FhhnwkVu1TYRfqqPcpGNl3zQG/LJcmMBw4To0ijTV+e3k74Jgsb7XSYcAqv61V7i
         4H/Udwiwn0Zot9/jBO37zY9+i3q9VtiZDpglrZUy9bhWHPPdgw+sXsAKFhz+71H+ugzU
         153G84pq9bqjtAOMnorWN/0cBAJ/QWaDgs5YBk7WSBnbIC510cQESNCIpmbtFxCzoTi3
         SiXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONhjOKpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a05620a27c500b006fa28d523ffsi906678qkp.316.2023.01.06.07.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 07:57:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONhjOKpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDp5t-00005b-MB; Fri, 06 Jan 2023 10:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDp5r-0008WD-6B
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 10:57:19 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDp5p-0006HP-Hm
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 10:57:18 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so5582409pjq.1
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uABkwrjQG1uQC5MGnlRIuDgLsfk5VsI53U4v0q4LUM=;
 b=ONhjOKpdjSiwDuv37Sf/dRioeBEqN9tAYj6G9OE+8/3efLIR4s0+b3X2SJOLM2H2bd
 eE749o6zezdiuxAjWsvWlpqFsCIUCa0lDXA4DNEUoBvgAFo0f50aboUmgNI1xvHqg2Ip
 DrW8Yn08dThY3W1bjLBts0Uou+olN+Pu1Odk4NSnmoOJ+UFPbLDvqxd3d/xXACp6EdTY
 gniBt31UudZGdieLovTbfuD2jdZKba2lf8U9A7ZMOsuvaSSSc6zzBZBFtueQ9LJ4w3cH
 S8IVF+fSuKLIkHTgXG1eewXG8ZLcc5Qzst9NrhcCMdrO9SKhx+YHwGUmDGGFPPs1mj+T
 syhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uABkwrjQG1uQC5MGnlRIuDgLsfk5VsI53U4v0q4LUM=;
 b=xDtLuXeB7cP19AIIeAQfIHxPBq1hnxUHQFNFyPR2/6ks9nY6w1yQMbX291OgZ++lz3
 J84dmKH8JRmKLsNASZxefmMbBH/hqove1ceWUMgot0rHwdzgh9rg56F5o0YylXet67UW
 E9L1qSWDQ8hvuaSKEY47TcJ+iCnxCeSgkyBdp6H5E2W1HFUuKOBZfRe+OkX/y/xL8PHO
 2o96YvsOuq9fUJF9ysa1BW3mnZliXomAumJWeJNcGJze65CssOgahgZpPyAt2V6mX1Ar
 A8dUJRz3D091qrcq0vqv5baSlCT3gMzcfhi0SB1c7t/X9iTtKU14Gu0dkVZ5piPvU9l5
 5BAg==
X-Gm-Message-State: AFqh2koCuAY/nI6p5386BFtPzV8XG4UnWjNU5ihq1X9XNtHfPbXdcVO7
 +ensVHLe9O2SEoA6m45ZDdwodBtyNqN8cmEiNzaDzA==
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr710502pjq.215.1673020636045; Fri, 06
 Jan 2023 07:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20230102175245.1895037-1-clg@kaod.org>
In-Reply-To: <20230102175245.1895037-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 15:57:04 +0000
Message-ID: <CAFEAcA_m59FxCGFu1aF8j1nfib=W49e59w4LNYx3Cj5NOmYufw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow users to set the number of VFP registers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EN+U6yZ1bF2A

On Mon, 2 Jan 2023 at 17:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
> have 16 64-bit FPU registers and not 32 registers. Let users set the
> number of VFP registers with a CPU property.
>
> The primary use case of this property is for the Cortex A7 of the
> Aspeed AST2600 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2fa022f62b..27af57ea9a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1258,6 +1258,9 @@ static Property arm_cpu_cfgend_property =3D
>  static Property arm_cpu_has_vfp_property =3D
>              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>
> +static Property arm_cpu_has_vfp_d32_property =3D
> +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
> +
>  static Property arm_cpu_has_neon_property =3D
>              DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>
> @@ -1384,8 +1387,11 @@ void arm_cpu_post_init(Object *obj)
>          ? cpu_isar_feature(aa64_fp_simd, cpu)
>          : cpu_isar_feature(aa32_vfp, cpu)) {
>          cpu->has_vfp =3D true;
> +        cpu->has_vfp_d32 =3D true;

We shouldn't default to true if the CPU default is D16 already.
You should be able to use cpu_isar_feature(aa32_simd_r32, cpu)
to check this.

The setup of the property should probably be in its own if(),
rather than tucked into the has_vfp if(), so

   if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
       cpu->has_vfp_d32 =3D true;
       add property;
   }

This would mean that if the CPU is D16-only then the user can't
make it D32, which I think is OK. You could write it to
allow that if you wanted I guess, but then you'd need to
special-case M-profile, which doesn't permit D32 at all.

>          if (!kvm_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_prope=
rty);
> +            qdev_property_add_static(DEVICE(obj),
> +                                     &arm_cpu_has_vfp_d32_property);
>          }
>      }
>
> @@ -1650,6 +1656,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> +    if (!cpu->has_vfp_d32) {
> +        uint32_t u;
> +
> +        u =3D cpu->isar.mvfr0;
> +        u =3D FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +        cpu->isar.mvfr0 =3D u;
> +    }
> +
>      if (!cpu->has_vfp) {
>          uint64_t t;
>          uint32_t u;

There should be a check so the user can't both disable D32 and enable Neon
(Neon always has 32 dregs).

Armv8A doesn't permit D16, so we shouldn't allow that combination either
(but note that v8R, support for which just landed, *does* permit it).

thanks
-- PMM
