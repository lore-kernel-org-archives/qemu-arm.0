Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1DDCD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtZP-0008Gb-Tx; Fri, 15 May 2026 10:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtZK-0008G4-63
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:31:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtZG-0002xj-BC
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:31:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so7253961f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855466; cv=none;
 d=google.com; s=arc-20240605;
 b=OFyBC4DC0iZLYa+GR3oiJt9nuFGXwpvyIG4PGD1utxFmywMPDDRIUMu7TeJ/rmut70
 L1iZeojUkvev/xAbZPP6OIYb/grXMnX1tSNnykFU9GNPmn/QsufhEPTl/SXZDD+CJI5d
 LMH2saCAgDAzBncdd6ImrdfE6jfivN5L7MpNGH0zjgN3SL/pPlJouJDO8hSOtOastjRm
 jFYW8qwgNuGRJIPeG6/0gxCf6gpzNI78369oz/gBUS7EUfLYP9rcLB95PqOkDVjF0z1b
 Hlg3euxv3+V8yhtLT+c2GGqitoYXZD53DMZaMkl/gDVbSTc6M/qYkKLcqiVqZWpKmDu+
 Lvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iqpaB11lB+i4Tnn2aT9+weYYqZdjgfUKZ0Fy4jcne1g=;
 fh=yUELQHUnTVGRLM8elsUCBBGD1LwkahNRc6Z3bOrOpo0=;
 b=AoH8NueI1cUOmw/DOLuqsEGHZxWzomM87UQWcc5FJ74idqIul6/IyL/pA9lfXqjHsM
 2/0IhhRWWx6Hh4hCvAJwZIndtB9HpGownn3/7fOCDiIRDemtyMrCQ3FEqfDemkxwWVBf
 09/EcIdae46q7QA5qHKm/7QbhWh2TQx4oFkFLvsUQYZJyHhKnQfozG9xPhoxfbDqUod9
 Doy4QoMSnGuLWQ3qwuh7xip+gNXqNK5GiWzqhZ1HEyMwMwUCJ/IyyOvIkEawbEZs066v
 lgDxHvTqPSW1D1Ezz62bFuVIGUHfPw/vnBy+iOc3rYR6kGAFFoBLPDHVg9qZDayUOfKJ
 /SUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855466; x=1779460266; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqpaB11lB+i4Tnn2aT9+weYYqZdjgfUKZ0Fy4jcne1g=;
 b=UVDgCZMZuMMaW0QF7oA7PxHa+bAUsgY2uONKxaLbXgbTCtlgVr1PFpDe8a8qqaIomV
 5L9SU4RIAFxtbkFJirtQVpHTpgeEV6x8GZ91gqkwBwxZxLUeORX7iSXJlT2GRbJrF7zN
 cK+AMJnrHiM/u+YlMXtiqwSV4gulQhIINagiqnUd7CMzB4sBPOYQ0Cce55IP7k1VThdh
 UeQ1CsHJZLiO08upSdHIiTybT0u7bJc8Odoe7ywmNEgb1zJpGd+u6tJnmnerobFSSLAT
 8P5cxIsPuPafvna64ITfnebTw4yWWGUAz5ZcomcwdXr+j65G4ZkfJnRMYL9Ck56ujXmu
 c5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855466; x=1779460266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iqpaB11lB+i4Tnn2aT9+weYYqZdjgfUKZ0Fy4jcne1g=;
 b=gGmqalnpL4Kd/JnXloR++u3eITpP0XSS+y6jNHdwLdkCMU1BjzEjNd3ke6DlzOzFZv
 l/NN6mwDKrPMX37ijhE825kNwLnjoM+sjdOkRmyARuOTQC7slmBvRi/B+u/qw+r7vqai
 cL3ybNImhcyJ5VBiQICpHuhu8CB9TToZ1pyX+J+NzdfJcSYMGTjM9rlIQOgijbPoTQxO
 wNtluDcri1hMRdjA6O8KvGB+WaINlOW+GiIFna1oSNgYRlGUL2BodbF5mobvGbOl9GV5
 cVN2opzd7dFNi7lQ+d1C1Y0gPo5UNeykuD7PVNGufJGbzezIW/AIU4tKBWFWQZHVmAQI
 OS0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9XQKNiNoCWrQNoXwz86HAx30FGm153gtfVra/cdNQWZZp0q2cyXHDUIA8u99EmULiwXqdcyzRPsw==@nongnu.org
X-Gm-Message-State: AOJu0YzkCaTHTh8+gCwbYWytJd4XEv/I/QqPxEzYtYkaD4m1B4PJC/mg
 UfgZbuWRQRgkXWfRuXXKkmiuL95PCBSOtoBVPQlWSnmSB5wouH3dYROcKghn99dC3Y8iNODVaH2
 X3CHBnK9wYkW1K9/cqjKeY4FKnuEEurKUyVZ4Ti1ypQ==
X-Gm-Gg: Acq92OHaUdXfG1J4xJ24tiiL2OFsXSWhmU82D4AgCid5EXswfnOdTGcLL19U1Sq8Fej
 8a9KClbUAYid8EBk+Rih3waODnEQl5qFz3zfTRwbyHtHqyoGoHZW9qkf6EDaEUugdkaPqG8lxU0
 938oWKogmllfyp/5enNt7fDAqikBZf9UrQdJ41Ryk5cpJaHp6D5riiaN/vFtXpZS5l33xivWky7
 F6fyf+qDM/SdMzlJC7Qalv1cN9AsHEl/uFyGl2/JciqvE69y45CZctbdJ2IV5CaZ2pDvGxtZ4sf
 DFKVM0X7+bXDrBrajxycB118n2ZKpA48Zyh0ZrzGZAedJBFdKQ==
X-Received: by 2002:a05:6000:26c4:b0:43c:fc5c:aa0b with SMTP id
 ffacd0b85a97d-45e5c5e1da2mr5962329f8f.42.1778855465636; Fri, 15 May 2026
 07:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-20-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-20-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:30:37 +0300
X-Gm-Features: AVHnY4IuC7PDuu1wyvjnMXIMKADLWR42yUedf5EBSLmrMd84Bf5F8UW6cpoG-uA
Message-ID: <CAAjaMXZqtMx_3XFBE2nLkdWQdXbP6o86SSTVpQ26Cigb3M88Wg@mail.gmail.com>
Subject: Re: [PATCH v6 19/20] target/arm: Build cpu32-system.o as common object
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
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x432.google.com
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

On Fri, May 15, 2026 at 5:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> cpu32.c only contains CPU types used in 32-bit system emulation:
> rename it as cpu32-system.c; always compile the file but only
> register the QOM types for the 32-bit binary.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



>  target/arm/tcg/{cpu32.c =3D> cpu32-system.c} | 19 ++++++-------------
>  target/arm/tcg/meson.build                 |  5 +----
>  2 files changed, 7 insertions(+), 17 deletions(-)
>  rename target/arm/tcg/{cpu32.c =3D> cpu32-system.c} (98%)
>
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32-system.c
> similarity index 98%
> rename from target/arm/tcg/cpu32.c
> rename to target/arm/tcg/cpu32-system.c
> index 8220d785f5b..51ed1f8f269 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32-system.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU ARM TCG-only CPUs.
> + * QEMU ARM TCG-only CPUs (not needed for the AArch64 linux-user build)
>   *
>   * Copyright (c) 2012 SUSE LINUX Products GmbH
>   *
> @@ -10,18 +10,13 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/target-info.h"
>  #include "cpu.h"
>  #include "accel/tcg/cpu-ops.h"
>  #include "internals.h"
> -#if !defined(CONFIG_USER_ONLY)
>  #include "hw/core/boards.h"
> -#endif
>  #include "cpregs.h"
>
> -
> -/* CPU models. These are not needed for the AArch64 linux-user build. */
> -#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> -
>  static void arm926_initfn(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
> @@ -738,13 +733,11 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>
>  static void arm_tcg_cpu_register_types(void)
>  {
> -    size_t i;
> -
> -    for (i =3D 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
> -        arm_cpu_register(&arm_tcg_cpus[i]);
> +    if (target_arm()) {
> +        for (size_t i =3D 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
> +            arm_cpu_register(&arm_tcg_cpus[i]);
> +        }
>      }
>  }
>
>  type_init(arm_tcg_cpu_register_types)
> -
> -#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index f821331fbee..a6aac6deef0 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -29,10 +29,6 @@ translate32_d =3D [
>
>  arm_stubs_ss.add(files('stubs32.c'))
>
> -arm_ss.add(files(
> -  'cpu32.c',
> -))
> -
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64 + files(
>    'gengvec64.c',
>    'translate-a64.c',
> @@ -83,6 +79,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', i=
f_true: files(
>
>  arm_common_system_ss.add(files(
>    'cpregs-at.c',
> +  'cpu32-system.c',
>    'gicv5-cpuif.c',
>    'psci.c',
>    'tlb_helper.c',
> --
> 2.53.0
>

