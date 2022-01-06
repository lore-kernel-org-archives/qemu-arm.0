Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1131201lfb;
        Thu, 6 Jan 2022 08:58:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDDmesFfZeGyAXIaNJA/7tM1iqaaxbPDOB4VEyiNZEjm6eJWOOAbWwE6SY1J0oxwQx5d+Q
X-Received: by 2002:a05:6902:681:: with SMTP id i1mr66403958ybt.526.1641488323356;
        Thu, 06 Jan 2022 08:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641488323; cv=none;
        d=google.com; s=arc-20160816;
        b=Xu+uGjKAX/XdFB4CGU4tQ/pFgm4YIR0KXkYszior8ACWDGiYvsA4CvIKUl3OZ62orY
         9McuhxWmRd687vWKSQV4xRWTrtOkUb+Tre/LTroh22mvwSReKTzlA3gRT6AMm/DGeHoR
         +0n9D+4bz6Yn0htiwKosuuAeMcmjHNHZGyMYqMsH8KslofnRPMHB1yLmyo1hKWcGmpRT
         wptGrSOe2DKs5PUpkeZvuUIMBLafoE6txLA3wAjsV0YxnbbRJa2U+mfbV8R43DO0Hput
         35Bp7mFUyokvnG1gpDfmRZC95pDH4hsWhR8gfsqDpN2HWrjWmTAtINfStbDamorG5tym
         QEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DiWpVTbQB8LMgHupaDBBXjjcIZsZaVwessQthDQ0hto=;
        b=UuSJENBDys2ba9+5wekUOwuNJwCPelnk7F87xEABxi4olDHMxYqSHr2nZbHOHAxb0d
         doUi7O/ZjiTKppDwffW0kgm+GhUkAceYBzwGugvRKui6CfFpwmpCcUFnfcbwiFctu1G/
         KsTF5T4NL9eLYOYjfXqeTioZUQiOPZGAvA90CnAnIG3/V+Z4GvFXoemDmG2C30ce9+XA
         wLzwmLLv+2DTRHihlFbzsaRBoRGBMPODXHFTaEAZHIttDMRO9rNt1zKZHTNMLveFQTFx
         VAjRDhcBuVF60+jhY1gNRz0RT9tfstjJ3cLthH9j+65hwf0dSi4BJ/nYG1OeieCXc3Hc
         NVqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clSWMJCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si1710058ybm.264.2022.01.06.08.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 08:58:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clSWMJCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5W66-000337-PO
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 11:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5W5H-0002I8-Jm
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 11:57:51 -0500
Received: from [2a00:1450:4864:20::32c] (port=42731
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5W5F-0000Rk-5C
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 11:57:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1539068wme.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 08:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiWpVTbQB8LMgHupaDBBXjjcIZsZaVwessQthDQ0hto=;
 b=clSWMJCsubQYkI9ZgqD/GB1zPV7l0SvKClRx5GAHwPZ/s1Hd/EadtcfVBnEYvJ01gl
 Xpd9UU4SLrJpgJCo1RrJN/HqpBf6T9u4+mBJdbzezXBGAEwFkIA+a/v4iPOw0LMfDLo3
 72KYJsvAQ3aud2EhY8TQEpE1zXOQj2Arlmyk/4xliuFWNpIBbJqhi5QO9cMQ24wal/AB
 uJ/XnqasJFnQiIeboaEOHXrvCJGXKYk2NcDnTyNvnJMchvOWgAQ+ZUaP6v4g3HGYVFHE
 gTBoVAsi+AC8+SWGScasL7+kRTAbph7HxKqfPjseeotSntxmX230Ai/JQJsMoW4vA0G+
 M52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiWpVTbQB8LMgHupaDBBXjjcIZsZaVwessQthDQ0hto=;
 b=NkPiZ4oIdI+Qx9YIojk0fM8NTeljIAgfB16/N9JziraSOb3yvwst0U339iG3R7SUha
 Eg5oeiK4i9mlxsEjzOaR9E45DadS7L4J0yNIfLDXFJRc5soEjB74ZL5k14Hr+O6VMhOP
 4xqp2q6udPM4DzUS425+BIsNUnuHMBF4yO1vBepY4um2hj4H5mbiQZE1mtow6zGIpz7x
 9dRs8eCj6X3+nfyAiGVHMfQtz25qaYbGZJwhhfPoCoSwsz2hhm6xpNOFj7UfysymsWAH
 0AYagFjqlolIsLm71KZhEPiTYrq9ZBSSw76igJ73aErP+Qjwa+Wn5us6iJpD0zX2QcVN
 nhVA==
X-Gm-Message-State: AOAM532zSi2FyvkO3E/BsxSUz02zkjWhvXSGebWEaN86uT6eWSTnDkA2
 n1K6/xMuEPZnVO88R93AHXAOpgUcXidNwVzX9TIpjg==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr8145886wmg.126.1641488266021; 
 Thu, 06 Jan 2022 08:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20211216064820.61342-1-bslathi19@gmail.com>
 <20211216064820.61342-2-bslathi19@gmail.com>
In-Reply-To: <20211216064820.61342-2-bslathi19@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 16:57:34 +0000
Message-ID: <CAFEAcA_gy6dbA2X8BsvKkzdnny40hd-OHNYr1+cBFrUuZk8g4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: Implement Cortex-A5
To: Byron Lathi <bslathi19@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bslathi19@gmail.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zrWd3hXfAfNO

On Thu, 16 Dec 2021 at 06:48, Byron Lathi <bslathi19@gmail.com> wrote:
>
> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 Init functions, using the appropriate values from the technical
> reference manual for the A5.
>
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..2b54fb618b 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,41 @@ static void cortex_a8_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);

We should avoid using the DUMMY_C15_REGS feature where we
can for new cores. It's a legacy thing where we just RAZ/WI
the whole cp15 crn=15 space. For new CPU definitions we
should define the actual coprocessor registers they have in
this space, typically just as NOP/RAZ registers. You can see
how that's done for the Cortex-A9 with the
cortexa9_cp_reginfo[] array. The A5's registers are slightly
different but they are documented in the TRM:
https://developer.arm.com/documentation/ddi0433/c/system-control/register-summary/c15-summary-table?lang=en

Of those, the CBAR we handle with a feature bit (see below);
the others you can make ARM_CP_NOP for the WO ones and
ARM_CP_CONST with value 0 for the RO and RW ones. Make
sure you get the .access field right: these are all
available only frome secure mode, so should use
.access = PL3_RW / PL3_R / PL3_W for RW/RO/WO.

> +    set_feature(&cpu->env, ARM_FEATURE_PMU);

Missing ARM_FEATURE_EL3.
Missing ARM_FEATURE_CBAR_RO.
Missing ARM_FEATURE_V7MP.

> +    cpu->midr = 0x410fc0f1;

As you note, this is the A9 MIDR. A5 is 0x410fc051.

> +    cpu->reset_fpsid = 0x41023051;
> +    cpu->isar.mvfr0 = 0x10110221;

0x10110222

> +    cpu->isar.mvfr1 = 0x11000011;

0x11111111

These numbers are in the Cortex-A5 NEON Media Processing
Engine TRM:
https://developer.arm.com/documentation/ddi0450/b/Programmers-Model/Register-summary

and indicate the A5's VFPv4 support, among other things.
(QEMU drives its insn enablement off these ID register
values, so if we get them wrong then some guest code that
works on a real A5 will UNDEF on QEMU.)

> +    cpu->ctr = 0x83338003;
> +    cpu->reset_sctlr = 0x00c50078;
> +    cpu->isar.id_pfr0 = 0x00001231;
> +    cpu->isar.id_pfr1 = 0x00000011;
> +    cpu->isar.id_dfr0 = 0x02010444;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00100103;

0x00100003

> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01230000;
> +    cpu->isar.id_mmfr3 = 0x00102211;
> +    cpu->isar.id_isar0 = 0x00101111;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232041;
> +    cpu->isar.id_isar3 = 0x11112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.dbgdidr = 0x1203f001;
> +    cpu->clidr = 0x09200003;
> +    cpu->ccsidr[0] = 0x701fe00a;
> +    cpu->ccsidr[1] = 0x203fe00a;

These don't match what the A5 TRM says are valid values for the
CCSIDR fields: specifically the associativity and linesize
fields don't match what the TRM says are the mandated values.
Where did you get your values from?

Following the TRM fields and using 32KB for each would be:

  cpu->ccsidr[0] = 0x701fe019; /* dcache: 32KB 4-way, 8 words/line */
  cpu->ccsidr[1] = 0x203fe009; /* icache: 32KB 2-way, 8 words/line */

> +}
> +
>  static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1054,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortex-a5",  .initfn = cortex_a5_initfn },
>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> --
> 2.30.2
>

thanks
-- PMM
