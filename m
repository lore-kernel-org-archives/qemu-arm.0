Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E2CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtaC-0000FU-Jg; Fri, 15 May 2026 10:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNta0-0000Am-5D
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:31:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtZy-0003HE-1Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:31:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45ae6a0e523so2936187f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855512; cv=none;
 d=google.com; s=arc-20240605;
 b=dYKRFkKrgWzAOZCzbPvPOH8VinL0W5fAr5bCZYVef2x4OdCeeVZPMU+/2IOL3IPlVa
 geUKn/dNfXSMMQCOs+mjoS2dD9gAwuwyNxN8px3r6TCWrfmAJFKP3SQlIrIZOOEgniMY
 rRXy1WwveIHEFfnbsAlRlBKwFluyLHdKY9MvHrqHVW/7NefnA2GzChLMNB0k2+v0bNym
 vNmqJh3FylB7UIz7mZFeLAjzSC/GhbZ5R4kuXTWKFIFW1FEbICzk+tH8vRhWvRsNyVLn
 bYouhR5UKR6RH+TbyEtAc2Xp02IBhd8LLgvGZecLe+QqGB9xRFEhSMw2iZxJFaXst32I
 JjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DF5qZalcfRa3geINGkCf2OMKt/clHmchD1zgEGnlxC0=;
 fh=t3hxZa6Ir0Hgv+5f+tBb0sT0lKUX1lTKwFfdEPfO1SI=;
 b=WepwpjircDrdXnu/Jobo2Ogl8S9GQuuH+PZ9unbpApFbxF/8V47DJzJaYC3oSKpbAV
 FjmyOBumBMDE7q1J7pfxpFl/bhaxX00lyciGEpJmdRpxn1tQ1zUqMFCUNkB0MxtoZi7e
 wK4RD0JP94gc4nS1QY68XBiqkiseE0w3V0P6dVb8oMEgyLoAKohMfOMa36nXpgGFhqik
 3kwcdf0AzHieNehn7whiL8h1KjRLwPXY5ir9zeRS5oD4kByuN++o0p3NfjS8OaPyXgGK
 fLLoH2PMhww85uRjB+cGey28FqaZEM8ad3P7ftgYdSsn3YKzJWlPGfOjvGTzhdo95dOb
 m8Hw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855512; x=1779460312; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DF5qZalcfRa3geINGkCf2OMKt/clHmchD1zgEGnlxC0=;
 b=I3p6M7Fu/OLieb9vU6V/JuAbdXxUPiBm6MPiX28Tx+lNGLKjGFQpQqHI/Vo7rxVyzM
 hlSAImOyCFXrXTjRph/konWpGmNeRGmfhMUCHjuJcOK3qhAoxW6X9PLCE0L3Dk5wgD0P
 11OAyfOF8BioE4emAXHMvMaV8Bk5i4DChicWu7ffbBYrUAaK/nzP2QlX0qm4UyHVm8l1
 /JOgwwvEUsAVy+lp6p4RXJziITnXbDB0c4l8dz+aJl/WpF5FQibONBO/6GPpLsMPd2Z3
 uoi13BrPtckD67S3UpZb3oYsPEu8dryVwdDDJ7fWhWejh/OABh2j3a3UIje1mc+wbnEx
 mF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855512; x=1779460312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DF5qZalcfRa3geINGkCf2OMKt/clHmchD1zgEGnlxC0=;
 b=EyfITbVehe3Vwlc9ye7jn8/VC+0NVZLhTSkhiLkJVvsjyfqxNYWYFd2j1DqFLhjYbj
 HEHs5Vl0+v7Nwx05y3YaEfFaljhKWbukyaPAS/IiWo0u9K32chAK53Ajj5EcILHGMt9v
 2f5X+73JpFQ5AwsR4ePRT/ygKHKchaVJN30Gt7X8WASfvuaHjCK0rnRvU413DJansqVa
 Q152BdhO0C21QzVfQsQDNx4DJRS9QotghPPKzeJCQt9OUxgzetrX9DXfGKBAv4PTeUAF
 toM8C2iQ/L59arITQ0cnMEh1coF5iq22HlUfa0LRULbziRh0I5Up18Rm1Hn3a5RX7Fvu
 ISIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/D5Iz97lDbGa0Jh/s5QaxepjYqJkSGWYTPsj/GjfMnLQuOjliEbvwwGhmzY+3HCG1lnh3BjNLB4w==@nongnu.org
X-Gm-Message-State: AOJu0YyIOX6lVdwj3swm8d9QSfq/8txVQbHdR3zgNhntD9N/XA5hm6bL
 X2a/ypXQvh6aajNjjzjiHDLXxr4MssZFI122fp3288Et55mBx9bDeXwFVOGgrjK4RmIjRAjldpa
 9O2KyH9HPPyd15KmUPwh45WDeeuvzcy1KyOIkMiP/zQ==
X-Gm-Gg: Acq92OFsdGtMPfgEabt7sSqfeOoPcQRr4bJOzanF0aL+lwruFCKZJHSvz0I0Kj4kvKL
 KZN6+k3+QRa5CSk94j9P1q7Iux2rhmNw+2rKbBsRYneih2tiIjep+wTneHZN6bVcOm/hZWItTDi
 9iigKiuj7H2mUIn1MI4kH7D5te3dsbQwWDm2BZtzH7aM4qw0iZb3VJ+oIRIkSo0/uk024LJ406E
 WexrEk9Bu5YyeG8ZFKCkNtboiSGSRRKzAKAimjYGjLM3w1RJRHz+A+4AL5eG/P3pDysQiT7pnDB
 xoGUeuPo9QxEWbdprByUlSzzLEKtoIAz+0EhBwdN0Ei1wPCL3g==
X-Received: by 2002:a05:6000:1447:b0:45d:3a93:d9cf with SMTP id
 ffacd0b85a97d-45e5c5872afmr5946782f8f.25.1778855512277; Fri, 15 May 2026
 07:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-21-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-21-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:31:25 +0300
X-Gm-Features: AVHnY4K5j0D1WNFNtj3H3DRpbF-RNOYsLTUFY6_wBXFIZrceV3ybyiupuK_RINU
Message-ID: <CAAjaMXbncb7CON1KofLanOMQdWi3NK3xj=CdfieqV4sazZPkGQ@mail.gmail.com>
Subject: Re: [PATCH v6 20/20] target/arm: Build cpu-max.c once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x430.google.com
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

On Fri, May 15, 2026 at 5:13=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Call TargetInfo::target_aarch64() at runtime, allowing to
> remove the target-specific TARGET_AARCH64 definition and
> build cpu-max.c once as common object.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/cpu-max.c   | 8 ++------
>  target/arm/meson.build | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
> index 8cf8edc6535..d38bdfcf811 100644
> --- a/target/arm/cpu-max.c
> +++ b/target/arm/cpu-max.c
> @@ -8,6 +8,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/target-info.h"
>  #include "system/hw_accel.h"
>  #include "system/kvm.h"
>  #include "system/qtest.h"
> @@ -190,12 +191,7 @@ void aa32_max_features(ARMCPU *cpu)
>  static void cpu_max_initfn(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
> -
> -#ifdef TARGET_AARCH64
> -    const bool aarch64_enabled =3D true;
> -#else
> -    const bool aarch64_enabled =3D false;
> -#endif /* !TARGET_AARCH64 */
> +    const bool aarch64_enabled =3D target_aarch64();
>
>      if (hwaccel_enabled()) {
>          assert(aarch64_enabled);
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 3e02941d0d5..9408131d178 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -9,7 +9,6 @@ arm_user_ss =3D ss.source_set()
>  arm_common_system_ss.add(files('gdbstub.c'))
>  arm_user_ss.add(files('gdbstub.c'))
>
> -arm_ss.add(files('cpu-max.c'))
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>    'cpu64.c',
>  ))
> @@ -20,6 +19,7 @@ arm_common_ss.add(files(
>  arm_common_user_system_ss.add(files(
>    'cpregs-gcs.c',
>    'cpregs-pmu.c',
> +  'cpu-max.c',
>    'debug_helper.c',
>    'helper.c',
>    'vfp_fpscr.c',
> --
> 2.53.0
>

