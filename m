Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24568CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtY8-0007aK-9Z; Fri, 15 May 2026 10:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtY0-0007Xh-0g
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:29:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtXw-0002VM-Jk
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:29:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso80893545e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855387; cv=none;
 d=google.com; s=arc-20240605;
 b=TDgdWnmQIpizxSHtJYqRx2V3qrpZsABNdTO85J6EFayQouBDA+gSExkCwjkToP8lsY
 zcKyVzHKdIismMfnF9gQelhQQTzAC/Aw4YIvjsOXooq+gjGHw7uVBlddm+6d9p7QbKY3
 ojnOnIUGc3LuAULRoo2BfkQFTlkHFnLIqtJF0tXMQDGspfUyH4LBFi7owHoLPsEGdL/h
 x+G7XZGjgLlc4Z+fqxxaPh3KicUwSgpC9aJOR1OsThtB6PuInQOtyACBwvSuQGSjlvZg
 JNJk/SRD7hB9MZavDElW8eHO/hMw/DqWPhPrll4xeN1iK/zd3BRYTGyLfHNpv/Zvwx6k
 LzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sa9BJi0vnwbW34BPrIvuFbK7B45rjLdSJNt+bO7n3ZE=;
 fh=GLFNqaZEf97p1Tziq9NqKld2JrUskhEjxsA/pl1hpZs=;
 b=DcqryVk4abZ1c0UTHjJV5+nrxw69TUGetxcQ7Yfj8vwsfDaGw2RS3p7c05K54D8kSU
 xdkxTk9NGApgf9/2Byz1cHr8N8CugtX0zDI7zn0R08pNasKVln3/d0JZks3KfexGIgAl
 G9rvnL9eBoaWZoLAzvbLlEFpyas8f6inoECXmk0Qj7cJ2pFubYYp4FYOuA1TDhkzxYeA
 FBqy/i6T60KqQF9WPv3MxCSOCGIqilMhKBTANcVD4nOWLMMg63s/ghvxUs3YSmXj5kuo
 qsFuxfZagB+HClXERxIl4Wok4XL7XetP62bnY1q/Kn6a/zdd8v6ozt22+XX0RhVywdei
 nwkg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855387; x=1779460187; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sa9BJi0vnwbW34BPrIvuFbK7B45rjLdSJNt+bO7n3ZE=;
 b=F3KuwLXs5z5agN7zuKwx1pAL0HbO1pBI6aCVIpulRXiKOOus3pjDZrXmQkWB3dUcvo
 uXqF+o8vCnH5lYmUjfsdvczcwINLIl7J9olZMwmq66kIYTIhX1iCE9cojAE2e7GPiarp
 E8Vd7qJdYxoIv8jA9p3xSUzCjiWpMh6KFn+UwxI1pnDZwRjUYdHPg5YZ/x5FVqZwXyMH
 ZSQZDsHIyRKZZ1MsyFH+sK5nGwXBODIrRP1t/fCAdAFpvCIVGcUePU2bX9uyzlDs5vNX
 Mfk8pxqtIK8VTGMZJUmaYOt6W2TKblNdDj4bRXLJm/tYDxamL16k+HYNg324D04S4kFr
 wcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855387; x=1779460187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sa9BJi0vnwbW34BPrIvuFbK7B45rjLdSJNt+bO7n3ZE=;
 b=MKBKII53zitSLKYk36fOcdZIgt7CY2KGmQN+QmaHpjxenPPYqGaLS3/I0M75X02J1k
 vK4lQjAeZLHCWpu5jDCOKeHRDYYJI80BfG3fMwF9h/GwlFPwxsQS3n6Pp6fT4vYxVwm1
 5ncDcjRk+kjdVrDsH+MS6YJ8hs/VHGNlo9ZifXHXA1tccXUXi4CcxcnWb9k5CjPQjttJ
 eAMQL4qXuALznkV+B8BL9GhIhD+mtLl4KpYDGRTPS4TYvavByqq39p4LpwHSX7tMF5sQ
 2YVRSvbHBny5zZDlKhbAFBF9BFqgnSUr103YiIFTKHEBFs3BeK9c5eaNjbrq5UESJ/Jy
 tqLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NHgA/ey90/EU5ZOLyhT+Q0Di1Lhnu+yCIAStv8TlsmdPlgaALSSDaGrcp6gOL6U3Fobf9hSbVzQ==@nongnu.org
X-Gm-Message-State: AOJu0YzL+ehZUnhaETiAX7fNj/JekGE9LnnY5kbljsYDF9lgW/GxMeQc
 L+cQZyeSrQ07AIB6LiS1Y/hIb3qOXREghjCKD/haPCPJkWpmuEQuiDPa8wy+pP4abup6sCVli7F
 w1ZDcBHGJjd46ps1+OOXOaujkhoZ7vkwJxZuDph86tOdYfzV9uiZ/u4miEQ==
X-Gm-Gg: Acq92OFghnkwFCqxNK1pCKgkVTM24MYHi4tKy1CkjvrwNtPP+jJxG05tcJv1MLPKscI
 Afhwo/QCVsYPtTtxDHqrFSKTet2OksyGycDOJ7UhCWCEjQRuCzuGO51qQsDc3z+FsaTGwswClEu
 JStUC4w2cIQbVxjpRuCRzAAMpsXHt+zc42fsNYf+OrOmrElsl1wrozhKVsCT7t6CdTB26pAU//A
 zfh8vfDLSptmcq7Ks7XLN92+bN5mvD9V3j+qbodltPPqmvaV+VCBdJs8dNchdgOM0T0C4jfZDKd
 EoWjbUcdxi1baR8e62DPhih3kSoeylzAM6XFp9vahFtc9LAOgcnrgWCKKSU2
X-Received: by 2002:a05:600c:608b:b0:48a:58ae:9933 with SMTP id
 5b1f17b1804b1-48fe61ed232mr56357955e9.18.1778855386752; Fri, 15 May 2026
 07:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-19-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-19-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:29:20 +0300
X-Gm-Features: AVHnY4I5nCHiQUYGCxc8pF4p0eKA5vxGLgQMtII8XuCoVkDJn0V6-0fREAI6qhw
Message-ID: <CAAjaMXaLvu8AZifSk5E1yXeCBdv6JcG6dKWeHZWbg9iVaj3A3w@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] target/arm: Define 'max' CPU type in cpu-max.c
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32b.google.com
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
> Rather than having the 32-bit 'max' CPU type defined in
> cpu32.c and the 64-bit counter part in cpu64.c, unify the
> code in a single place in cpu-max.c. Define stubs for
> aarch64_host_initfn() and aarch64_max_tcg_initfn() in the
> 32-bit binary.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/internals.h   |  1 +
>  target/arm/cpu-max.c     | 65 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu64.c       | 21 +------------
>  target/arm/tcg/cpu32.c   | 29 ------------------
>  target/arm/tcg/stubs32.c | 10 +++++++
>  5 files changed, 77 insertions(+), 49 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c95f3d63138..ccada1c9018 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1759,6 +1759,7 @@ void aarch64_add_pauth_properties(Object *obj);
>  void aarch64_add_sve_properties(Object *obj);
>  void aarch64_add_sme_properties(Object *obj);
>  void aarch64_aa32_a57_init(Object *obj, bool aa32_only);
> +void aarch64_host_initfn(Object *obj);
>
>  /* Return true if the gdbstub is presenting an AArch64 CPU */
>  static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
> index 6fc54ebe74e..8cf8edc6535 100644
> --- a/target/arm/cpu-max.c
> +++ b/target/arm/cpu-max.c
> @@ -8,7 +8,10 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "system/hw_accel.h"
>  #include "system/kvm.h"
> +#include "system/qtest.h"
> +#include "system/tcg.h"
>  #include "target/arm/internals.h"
>  #include "target/arm/cpregs.h"
>
> @@ -178,3 +181,65 @@ void aa32_max_features(ARMCPU *cpu)
>
>      FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
>  }
> +
> +/*
> + * -cpu max: a CPU with as many features enabled as our emulation suppor=
ts.
> + * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64=
.c;
> + * this only needs to handle 32 bits, and need not care about KVM.
> + */
> +static void cpu_max_initfn(Object *obj)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(obj);
> +
> +#ifdef TARGET_AARCH64
> +    const bool aarch64_enabled =3D true;
> +#else
> +    const bool aarch64_enabled =3D false;
> +#endif /* !TARGET_AARCH64 */
> +
> +    if (hwaccel_enabled()) {
> +        assert(aarch64_enabled);
> +        /*
> +         * When hardware acceleration enabled, '-cpu max' is
> +         * identical to '-cpu host'
> +         */
> +        aarch64_host_initfn(obj);
> +        return;
> +    }
> +
> +    if (tcg_enabled() || qtest_enabled()) {
> +        aarch64_aa32_a57_init(obj, !aarch64_enabled);
> +    }
> +
> +    if (!aarch64_enabled) {
> +        aa32_max_features(cpu);
> +#ifdef CONFIG_USER_ONLY
> +        /*
> +         * Break with true ARMv8 and add back old-style VFP short-vector
> +         * support. Only do this for user-mode, where -cpu max is the de=
fault,
> +         * so that older v6 and v7 programs are more likely to work with=
out
> +         * adjustment.
> +         */
> +        cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, =
1);
> +#endif
> +    } else if (tcg_enabled()) {
> +        assert(aarch64_enabled);
> +        /*
> +         * '-cpu max' for TCG: we currently do this as
> +         * "A57 with extra things"
> +         */
> +        aarch64_max_tcg_initfn(obj);
> +    }
> +}
> +
> +static const ARMCPUInfo arm_max_cpu =3D {
> +    .name =3D "max",
> +    .initfn =3D cpu_max_initfn,
> +};
> +
> +static void arm_max_cpu_register_types(void)
> +{
> +    arm_cpu_register(&arm_max_cpu);
> +}
> +
> +type_init(arm_max_cpu_register_types)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 499d154dace..28167355773 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -791,7 +791,7 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *=
cpu)
>  }
>  #endif
>
> -static void aarch64_host_initfn(Object *obj)
> +void aarch64_host_initfn(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
>
> @@ -818,28 +818,9 @@ static void aarch64_host_initfn(Object *obj)
>      }
>  }
>
> -static void aarch64_max_initfn(Object *obj)
> -{
> -    if (hwaccel_enabled()) {
> -        /* When hardware acceleration enabled, '-cpu max' is identical t=
o '-cpu host' */
> -        aarch64_host_initfn(obj);
> -        return;
> -    }
> -
> -    if (tcg_enabled() || qtest_enabled()) {
> -        aarch64_aa32_a57_init(obj, false);
> -    }
> -
> -    /* '-cpu max' for TCG: we currently do this as "A57 with extra thing=
s" */
> -    if (tcg_enabled()) {
> -        aarch64_max_tcg_initfn(obj);
> -    }
> -}
> -
>  static const ARMCPUInfo aarch64_cpus[] =3D {
>      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn },
>      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
> -    { .name =3D "max",                .initfn =3D aarch64_max_initfn },
>  #if defined(CONFIG_KVM) || defined(CONFIG_HVF) || defined(CONFIG_WHPX)
>      { .name =3D "host",               .initfn =3D aarch64_host_initfn },
>  #endif
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index a2f730451fb..8220d785f5b 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -711,32 +711,6 @@ static void sa1110_initfn(Object *obj)
>      cpu->reset_sctlr =3D 0x00000070;
>  }
>
> -#ifndef TARGET_AARCH64
> -/*
> - * -cpu max: a CPU with as many features enabled as our emulation suppor=
ts.
> - * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64=
.c;
> - * this only needs to handle 32 bits, and need not care about KVM.
> - */
> -static void arm_max_initfn(Object *obj)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(obj);
> -
> -    /* Cortex-A57 advertising none of the aarch64 features */
> -    aarch64_aa32_a57_init(obj, true);
> -
> -    aa32_max_features(cpu);
> -
> -#ifdef CONFIG_USER_ONLY
> -    /*
> -     * Break with true ARMv8 and add back old-style VFP short-vector sup=
port.
> -     * Only do this for user-mode, where -cpu max is the default, so tha=
t
> -     * older v6 and v7 programs are more likely to work without adjustme=
nt.
> -     */
> -    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> -#endif
> -}
> -#endif /* !TARGET_AARCH64 */
> -
>  static const ARMCPUInfo arm_tcg_cpus[] =3D {
>      { .name =3D "arm926",      .initfn =3D arm926_initfn },
>      { .name =3D "arm946",      .initfn =3D arm946_initfn },
> @@ -760,9 +734,6 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>      { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
>      { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
>      { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
> -#ifndef TARGET_AARCH64
> -    { .name =3D "max",         .initfn =3D arm_max_initfn },
> -#endif
>  };
>
>  static void arm_tcg_cpu_register_types(void)
> diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
> index 3945dc49e5e..78f819ef6ff 100644
> --- a/target/arm/tcg/stubs32.c
> +++ b/target/arm/tcg/stubs32.c
> @@ -22,3 +22,13 @@ void aarch64_translate_code(CPUState *cs, TranslationB=
lock *tb,
>  {
>      g_assert_not_reached();
>  }
> +
> +void aarch64_host_initfn(Object *obj)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void aarch64_max_tcg_initfn(Object *obj)
> +{
> +    g_assert_not_reached();
> +}
> --
> 2.53.0
>

