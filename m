Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1422331ejb;
        Tue, 19 Mar 2024 09:46:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQtlmHW5B0DNa3PpWjNcLEG66oly3gfehrLFD8D1etN1ia68esnjKUjYEHMnRuK9YPNJ1lrSP3KEePy3ZdnCIADkXl/0Ut
X-Google-Smtp-Source: AGHT+IEwtVEYRDMb4s8CH9WvbMQPPF2HmoxL/fcCEQKoYlHpz6tjj5aXbeRAobj0GzwEp1rzwvmR
X-Received: by 2002:a05:622a:446:b0:430:d196:c9e3 with SMTP id o6-20020a05622a044600b00430d196c9e3mr3180640qtx.59.1710866813817;
        Tue, 19 Mar 2024 09:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710866813; cv=none;
        d=google.com; s=arc-20160816;
        b=uEjNwB98H0lPFbTJSOTOp8z87m6KYAWnn1T2Iv0U2RXqLhuzsCDwsL1gKOByCeo3HJ
         4+dBnjp0JboBa4uRbmBuJOPU266iuF2NOS3aO/L6CjBky7WoMTtsGl7vV5nm4FdMB+Ea
         PEVt4S/dihN8XsqYhZyD2NS4sZbQXuvYLL/wokVhLL8Wj4LKwsbOUEB6KuWbha8TQD+G
         FNjy1ih7PtfWNyCckjxhZp1im86tjNeA+sLVAECPoyScK7s7iSdEB0QOOQp2R8gspHnn
         WVCWST+RH5R2yOlgk/5XTHHe8EEeW7iRVzBlFTJ+vV+lQ48U7PxyBiaPj4/ZIyMN1aGL
         3rMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dggdOSHaw+DN0XRoP0qoW60fulWhwlGv6tWT229JhlY=;
        fh=lLopQuXv8jVoLQYWIFRSP9Ed49pb7e8icVgL1sWTlG8=;
        b=yn15x5OEa79Br+LRj5lv0opBpEimuBYHDkL+j+DevjNXm/tLsFOdW91WQL56112zNF
         DRvLvYZfAW7qxOd8NYW8uqXa0GgnnXpzfmHJcb7zyQRLt0hylepXIMfKdc2g8JPURNQV
         MthRdbpqzbqytSJiYDFJ0adtSf4Oy0ImstcURj6V/6YKownBmCd3BjQExU4Sukante8d
         zX/pMZxxBNOYjfFHoGGMgJZIC60xTMGPTt78qjyxwTwxhJKOafeF+KIjJnHS5g3t0jaZ
         2WHIiIzTF4RdlFDsLT5+eqiZOYZCUuwzOyacoDGyGDP7ZTFqZdE6LgGu308h4fFULSQJ
         uRCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m69iDtMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac85882000000b00430d6cefa0esi3824449qta.647.2024.03.19.09.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 09:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m69iDtMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmcbb-0007Of-D3; Tue, 19 Mar 2024 12:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmcbM-0007Nb-Lt
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 12:46:12 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmcbH-0000Z7-R9
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 12:46:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso7489297a12.2
 for <qemu-devel@nongnu.org>; Tue, 19 Mar 2024 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710866756; x=1711471556; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dggdOSHaw+DN0XRoP0qoW60fulWhwlGv6tWT229JhlY=;
 b=m69iDtMd11G1cR43OtHCpKrJOA5GNT1FYlw4mv6mHcyDPOETKTIQKJTCOcj1SG1peA
 ZcDXEs66ZpASD2H4ij6AEKVSdpgwFjkT3oc3uOImSAYgsel79Ez9GYKFmrJxmOxhs+tu
 4p6whOZYYqpjsRo8ARuf04SzinsotTejVfQYxR5eNu8bUjZBE7aXDFfHsswjp6LQej0u
 4RlTk2kl5lxKlgtlcLtFS60goBlTJt1Kxh4K680KR5ztDvnWTd/kW+8kF0/svWEAWfln
 Bect5sbZ6fqKeCGuuLrffjNCWQvASsTQ/+rLqtnQQCUsPfyl0cRWxVtKEYSzhMsiiYgZ
 dROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710866756; x=1711471556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dggdOSHaw+DN0XRoP0qoW60fulWhwlGv6tWT229JhlY=;
 b=TsHzurLynIMpL9NnvMIUDjbs0XsJWysLQtnS9KUPtUVnhti+HGhUObXs2B/juZHKWa
 vGiT/rB1qtdbhnIJDaxHCxLdJGpD7UbbdP4OPy1O2atgyweCesXNeBsHWPk8MxMgYC3u
 PQHOEs3bunQVPxZsqJp2VZGej3vS00rfwNZ6IRJmpIyCJKPE2SwO2RRdWjpJBD1J1YC3
 YBQrMziJ7VhM4vhkaetGrZe9lmp0tWTmzV3ne8Mzolhtmgdw+JXPFvaARoZELvDgrNPh
 lD1e4tH8Jz7Y+2XQJjXDReAJV9XwbVzE0FmiTVX2ey3JvBfKLkFl8uuPG3C/XTuG0Ngj
 tsEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCK8wgL7sXuGMh4TTmuXEwzFtSPK4k1IOoVMHlr+NNi5E2bO1+oQB4//AveWsY6JyfdBQ+wh4gPfkZNTJ0G0ewJgFhs9I=
X-Gm-Message-State: AOJu0YyuBTpfRf0qbLcOu9Prplx4FHu36KF3bxDDUEsZePxyip2pWYYi
 304uYhMetBBF0iCqdhzzmg6f5DHRMFSrY8g0/WhhUvD4lREO99LUoNH8lXQx3E9Yw5//cpI2A6m
 orErsbOLxc+9MkM2t/s2rG8RidxBc4YBO3f44kHxKdHn22QZt
X-Received: by 2002:a05:6402:414e:b0:566:18ba:6b80 with SMTP id
 x14-20020a056402414e00b0056618ba6b80mr12974820eda.31.1710866756373; Tue, 19
 Mar 2024 09:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-6-ruanjinjie@huawei.com>
In-Reply-To: <20240318093546.2786144-6-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2024 16:45:45 +0000
Message-ID: <CAFEAcA8ft7eeh0oT-imh-L7m0nPo3TekPUYdcdwYA0xK-qd5gA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 05/23] target/arm: Support MSR access to ALLINT
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WNl3H5oGcWMd

On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Support ALLINT msr access as follow:
>         mrs <xt>, ALLINT        // read allint
>         msr ALLINT, <xt>        // write allint with imm
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5:
> - Add Reviewed-by.
> v4:
> - Remove arm_is_el2_enabled() check in allint_check().
> - Change to env->pstate instead of env->allint.
> v3:
> - Remove EL0 check in aa64_allint_access() which alreay checks in .access
>   PL1_RW.
> - Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
> - Make ALLINT msr access function controlled by aa64_nmi.
> ---
>  target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

If you configure with --target-list=aarch64-softmmu,arm-softmmu
you'll find this fails to build:

>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b19a0178ce..aa0151c775 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4752,6 +4752,36 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      env->daif = value & PSTATE_DAIF;
>  }
>
> +static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    env->pstate = (env->pstate & ~PSTATE_ALLINT) | (value & PSTATE_ALLINT);
> +}
> +
> +static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pstate & PSTATE_ALLINT;
> +}
> +
> +static CPAccessResult aa64_allint_access(CPUARMState *env,
> +                                         const ARMCPRegInfo *ri, bool isread)
> +{
> +    if (arm_current_el(env) == 1 && (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
> +static const ARMCPRegInfo nmi_reginfo[] = {
> +    { .name = "ALLINT", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .opc2 = 0, .crn = 4, .crm = 3,
> +      .type = ARM_CP_NO_RAW,
> +      .access = PL1_RW, .accessfn = aa64_allint_access,
> +      .fieldoffset = offsetof(CPUARMState, pstate),
> +      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
> +      .resetfn = arm_cp_reset_ignore },
> +};

These functions and the array have been put in a bit of the
file that is built whether TARGET_AARCH64 is defined or not...

> +
>  static uint64_t aa64_pan_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
>      return env->pstate & PSTATE_PAN;
> @@ -9889,6 +9919,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      if (cpu_isar_feature(aa64_nv2, cpu)) {
>          define_arm_cp_regs(cpu, nv2_reginfo);
>      }
> +
> +    if (cpu_isar_feature(aa64_nmi, cpu)) {
> +        define_arm_cp_regs(cpu, nmi_reginfo);
> +    }
>  #endif

...but the only reference to them is inside an ifdef TARGET_AARCH64.

Moving the nmi_reginfo[] and the functions so they are next to
some other TARGET_AARCH64-only reginfo array inside one of the
existing ifdef blocks is probably the nicest fix.

>
>      if (cpu_isar_feature(any_predinv, cpu)) {
> --

thanks
-- PMM
