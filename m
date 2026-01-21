Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB175C44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 09:49:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viUpX-0000vq-SQ; Wed, 21 Jan 2026 04:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1viUpW-0000v1-CA
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:48:50 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1viUpU-0004JM-9H
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:48:50 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b87cc82fd85so564706866b.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 01:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988926; cv=none;
 d=google.com; s=arc-20240605;
 b=VNBVoZQapeZpRPiq8THHuUghcD0tyBkIez7SfOwQS58qhplALtXBqDeuSDXJNxLzFi
 dz6JozdGzIgpNOAuqV11RTMeRLxp1wk55VzX2GvnuTbZu/i2GxdB3YhgBRraBFOhJ4ws
 W2WaB0NcrF+rYsQwmA+1jRKPNL0y+Gpt9+c5ubNyPUKrDiDzwMrHyHIOPWSMIGhniilv
 xLJx14eACO00PAZ5RRfXFITiqfkW8EcoN176o48Zvg4tEnDV2Rp85KDAezynmBc7EiS7
 7uzWk0hDqOEnx5LklLGPlDUb+YcOduBFqKDoampOeqjgC2BkndLbl2Rzk7JkfjGigDzt
 mAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Kyi9fncuN4cOT9Qwbze6uf3r3BG4aXoohtJV2Ki5cU0=;
 fh=5sH9K55ntY269PiHybdlJ/SfOxsw6bvBpQU24QB5Mrs=;
 b=R4fTs1LjyaOynXha4GVpRSeLFJltDF8uvjXyDblY6oWD9J0lytSqf4oXAxXNbwCim8
 hEIqoQWBK0paalrq79gFnn6olMpQHD9rypjq9mX7Iw5CvHLPIIuBG/dKH7KrXjHHNyTY
 b2Aa0eyRTgWbZn0rbsyiF8433kkw83L/VrXhv+Q4oCLiKM5iVKghssYoH5pRPXbnMsM8
 aRkA6MWBSAvb4msBVqU1k1gjB0i9gPG37Fo5FXXMvQDEqCGX1GBcl+TsogB5NbX0RqvE
 LYobR6pHCradE07eXEC0eR1dUdwVRAZTZ59RMGzee8cHx44632NdVYY6sWheVlYZwMAB
 5mmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768988926; x=1769593726; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kyi9fncuN4cOT9Qwbze6uf3r3BG4aXoohtJV2Ki5cU0=;
 b=xh2Cj/zwFlZfGeb+vdJxqMaBmQbxtaLcmkCt0Jd1EbKukInNAW5jQPlT1ue1gkPUVd
 wivJ9/ANq7FId56mnCNyPKB8VYKYstf7ziEue30dEfBKyMUv3jCYk6sDvAscQ5+mMNaV
 +ZKK/KbuF3O1f6aeta/toFXxZ2KH6D26T8+u1EVTB7o4ByofA4Kcs9mz4Rv0erLr5LPX
 dBVB7qNQFdm8IIq8qkf7wJEnGNm0xuMvoYFJ1Ix+1txvbN7rXK4UbAzXN9xVH2cPhGvd
 wlDpOV9qwDIqmhJJ5zXWHsCAH4X0XyPuf2NG0Ocz0W1wT98Q1OB+Pb31CWXGI5otpqaw
 xi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768988926; x=1769593726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kyi9fncuN4cOT9Qwbze6uf3r3BG4aXoohtJV2Ki5cU0=;
 b=VoHCBp12z7C/zkF/mP9tipeL+dkDo43s987wec2QtRCN/TCe/dpdk7bl/kJDPPfgv2
 oojhIYUcwLJlDEDioNkMOUOBXL6BoeDiMcmYqjUbmDcHg8UtpXCWYlfeqGq3AWtCEY3j
 waOkmCwz0m+d/GaN1pK9JTU9xGjwNXu91NgySPlDmZ4aULcWFRk4U1psjRoO28YjhsDd
 YrttYnea0guEvA4r0CGA1aD5Fv187chbIVievSfNlld7ujAvepGAd9EQPQuRmXf87r/I
 Hms+yBGg+lDkyjFslC/Vf2Yr45I6/67YQMc5G5rhHED91HtVz1qjymOu33j6OuQo2onU
 1gQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2kLU9C+BHXbUshg7RII0VD49FFpOa8GVf0xZkA4UrVDbA7Hym8dphL1sOHWUMxzF3/XShFLHNiA==@nongnu.org
X-Gm-Message-State: AOJu0YyfyVlrpnjRDy8NgtExvIuGGaRxrh9UR617dFAGqbWlFZcJwi6h
 GqZtc3KHzXUR8tP/jnPoGqC/T6EqrxYvAd8TQ/EW7YTrzeULCcCpTVRt2vmpDlr8V5nTvs6TajL
 ymJ4rn33zf4z1pFxVfaqzd3xGVUTIMxb4ORg8m92W3w==
X-Gm-Gg: AZuq6aJw9TYfgXCMMpvICr/xKgYJ45WDT7vx2UhiMU2nWYg+JFFXmWrtkrm+7IExGsm
 yNF7/uj6Zr3ZVo0m7USvQjomj2VGbIaHXVrUdB7f9cPrxr1PuvRG3yn96/MWvutbvV6R8Ej8/3h
 zwwU6tZ/yFq6UCZHaP8zhynyphwx51bVP1VUVaymTh8LWiXTAI6l2Y1AZRVahKiC1RGs7cVJUTB
 g1gqMA8n2qDdqo4sJaQC1sTQSm8osWJanmmyS42nNqzEufoIOPaAJtTEk8uCNMi74un4FtZe+69
 D6Sb4iGmlLAKgtwXx3ZPsyslF9brYq/WhlSt
X-Received: by 2002:a17:907:7282:b0:b87:4c37:7fd8 with SMTP id
 a640c23a62f3a-b8796b953bamr1452579966b.49.1768988925589; Wed, 21 Jan 2026
 01:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-1-2eca481bd7ee@linaro.org>
 <1b0bd534-dd41-4ace-b5b3-37d854ae3d31@linaro.org>
In-Reply-To: <1b0bd534-dd41-4ace-b5b3-37d854ae3d31@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 21 Jan 2026 11:48:19 +0200
X-Gm-Features: AZwV_QieMxmGOt5h_uUsgXx8uINFPJk2u-1YhanMM975plgOrem57jmfn9aUJG4
Message-ID: <CAAjaMXbHe_zZ_dbz2VD95LAnfZzUkbFgZ2x4N39AEzWRssF7mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hvf/arm: handle FEAT_SME2 migration
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62a.google.com
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

On Tue, Jan 20, 2026 at 12:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Manos,
>
> Mostly nitpicking comments :)
>
> On 15/1/26 12:20, Manos Pitsidianakis wrote:
> > SME2 support adds the following state for HVF guests:
> >
> > - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
> >    not support it)
> > - Predicate registers P0, .., P15 (also FEAT_SVE)
> > - ZA register
> > - ZT0 register
> > - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> > - SMPRI_EL1 which handles the PE's priority in the SMCU
> > - TPIDR2_EL0 the thread local ID register for SME
> >
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >   target/arm/hvf/hvf.c           | 285 ++++++++++++++++++++++++++++++++=
++++++++-
> >   target/arm/hvf/hvf_sme_stubs.h | 158 +++++++++++++++++++++++
> >   target/arm/hvf/sysreg.c.inc    |   8 ++
> >   target/arm/hvf_arm.h           |  41 ++++++
> >   target/arm/machine.c           |   2 +-
> >   5 files changed, 491 insertions(+), 3 deletions(-)
>
>
> >   int hvf_arch_get_registers(CPUState *cpu)
> >   {
> > @@ -465,6 +698,10 @@ int hvf_arch_get_registers(CPUState *cpu)
> >           uint64_t kvm_id =3D arm_cpu->cpreg_indexes[i];
> >           int hvf_id =3D KVMID_TO_HVF(kvm_id);
> >
> > +        if (kvm_id =3D=3D HVF_TO_KVMID(SVCR)) {
> > +            continue;
> > +        }
> > +
> >           if (cpu->accel->guest_debug_enabled) {
> >               /* Handle debug registers */
> >               switch (hvf_id) {
> > @@ -558,6 +795,11 @@ int hvf_arch_get_registers(CPUState *cpu)
> >
> >           arm_cpu->cpreg_values[i] =3D val;
> >       }
> > +    if (__builtin_available(macOS 15.2, *)) {
> > +        if (cpu_isar_feature(aa64_sme, arm_cpu)) {
> > +            hvf_arch_get_sme(cpu);
> > +        }
> > +    }
>
> What about:
>
>         if (cpu_isar_feature(aa64_sme, arm_cpu)) {
>             if (__builtin_available(macOS 15.2, *)) {
>                 hvf_arch_get_sme(cpu);
>             } else {
>                 g_assert_not_reached();
>             }
>         }
>
> ?

Yes, that's definitely better.

>
> >       assert(write_list_to_cpustate(arm_cpu));
> >
> >       aarch64_restore_sp(env, arm_current_el(env));
> > @@ -603,6 +845,10 @@ int hvf_arch_put_registers(CPUState *cpu)
> >           uint64_t kvm_id =3D arm_cpu->cpreg_indexes[i];
> >           int hvf_id =3D KVMID_TO_HVF(kvm_id);
> >
> > +        if (kvm_id =3D=3D HVF_TO_KVMID(SVCR)) {
> > +            continue;
> > +        }
> > +
> >           if (cpu->accel->guest_debug_enabled) {
> >               /* Handle debug registers */
> >               switch (hvf_id) {
> > @@ -687,6 +933,11 @@ int hvf_arch_put_registers(CPUState *cpu)
> >       ret =3D hv_vcpu_set_vtimer_offset(cpu->accel->fd, hvf_state->vtim=
er_offset);
> >       assert_hvf_ok(ret);
> >
> > +    if (__builtin_available(macOS 15.2, *)) {
> > +        if (cpu_isar_feature(aa64_sme, arm_cpu)) {
> > +            hvf_arch_put_sme(cpu);
> > +        }
> > +    }
> >       return 0;
> >   }
> >
> > @@ -909,6 +1160,18 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >       hv_return_t ret;
> >       int i;
> >
> > +    if (__builtin_available(macOS 15.2, *)) {
> > +        sregs_match_len +=3D ARRAY_SIZE(hvf_sreg_list_sme2) + 1;
> > +
> > +#define DEF_SYSREG_15_02(HVF_ID, ...) \
> > +        g_assert(HVF_ID =3D=3D KVMID_TO_HVF(KVMID_AA64_SYS_REG64(__VA_=
ARGS__)));
> > +#define DEF_SYSREG(...)
> > +
> > +#include "sysreg.c.inc"
> > +
> > +#undef DEF_SYSREG
> > +#undef DEF_SYSREG_15_02
> > +    }
> >       env->aarch64 =3D true;
> >       asm volatile("mrs %0, cntfrq_el0" : "=3Dr"(arm_cpu->gt_cntfrq_hz)=
);
> >
> > @@ -927,7 +1190,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >       memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_=
t));
> >
> >       /* Populate cp list for all known sysregs */
> > -    for (i =3D 0; i < sregs_match_len; i++) {
> > +    for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list); i++) {
> >           hv_sys_reg_t hvf_id =3D hvf_sreg_list[i];
> >           uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> >           uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> > @@ -938,6 +1201,24 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >               arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> >           }
> >       }
> > +    if (__builtin_available(macOS 15.2, *)) {
> > +        for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
> > +            hv_sys_reg_t hvf_id =3D hvf_sreg_list_sme2[i];
> > +            uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> > +            uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> > +            const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(arm_cpu->cp_=
regs, key);
> > +
> > +            if (ri) {
> > +                assert(!(ri->type & ARM_CP_NO_RAW));
> > +                arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> > +            }
> > +        }
> > +        /*
> > +         * Add SVCR last. It is elsewhere assumed its index is after
> > +         * hvf_sreg_list and hvf_sreg_list_sme2.
> > +         */
> > +        arm_cpu->cpreg_indexes[sregs_cnt++] =3D HVF_TO_KVMID(SVCR);
> > +    }
>
> Could we add as a hvf_arch_init_sme() helper instead?
>

Will do in next revision

> >       arm_cpu->cpreg_array_len =3D sregs_cnt;
> >       arm_cpu->cpreg_vmstate_array_len =3D sregs_cnt;
> >
> > diff --git a/target/arm/hvf/hvf_sme_stubs.h b/target/arm/hvf/hvf_sme_st=
ubs.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9c679b711017448681e532b=
88ce10a07ebfd5122
> > --- /dev/null
> > +++ b/target/arm/hvf/hvf_sme_stubs.h
> > @@ -0,0 +1,158 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +typedef int32_t hv_return_t;
> > +typedef uint64_t hv_vcpu_t;
>
> We certainly already have these.

We don't, hvf sdk header provides these. If you include the hvf header
here, there will be a bunch of definitions that are available and a
bunch that are not (guarded by availability attribute) so it's far
easier to just typedef these two in the stub header.

>
> > +
> > +static inline bool hvf_arm_sme2_supported(void)
> > +{
> > +    return false;
> > +}
> > +
> > +static inline uint32_t hvf_arm_sme2_get_svl(void)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +typedef enum hv_sme_p_reg_t {
> > +    HV_SME_P_REG_0,
> > +    HV_SME_P_REG_1,
> > +    HV_SME_P_REG_2,
> > +    HV_SME_P_REG_3,
> > +    HV_SME_P_REG_4,
> > +    HV_SME_P_REG_5,
> > +    HV_SME_P_REG_6,
> > +    HV_SME_P_REG_7,
> > +    HV_SME_P_REG_8,
> > +    HV_SME_P_REG_9,
> > +    HV_SME_P_REG_10,
> > +    HV_SME_P_REG_11,
> > +    HV_SME_P_REG_12,
> > +    HV_SME_P_REG_13,
> > +    HV_SME_P_REG_14,
> > +    HV_SME_P_REG_15,
> > +} hv_sme_p_reg_t;
> > +
> > +typedef __attribute__((ext_vector_type(64))) uint8_t hv_sme_zt0_uchar6=
4_t;
> > +
> > +typedef enum hv_sme_z_reg_t {
> > +    HV_SME_Z_REG_0,
> > +    HV_SME_Z_REG_1,
> > +    HV_SME_Z_REG_2,
> > +    HV_SME_Z_REG_3,
> > +    HV_SME_Z_REG_4,
> > +    HV_SME_Z_REG_5,
> > +    HV_SME_Z_REG_6,
> > +    HV_SME_Z_REG_7,
> > +    HV_SME_Z_REG_8,
> > +    HV_SME_Z_REG_9,
> > +    HV_SME_Z_REG_10,
> > +    HV_SME_Z_REG_11,
> > +    HV_SME_Z_REG_12,
> > +    HV_SME_Z_REG_13,
> > +    HV_SME_Z_REG_14,
> > +    HV_SME_Z_REG_15,
> > +    HV_SME_Z_REG_16,
> > +    HV_SME_Z_REG_17,
> > +    HV_SME_Z_REG_18,
> > +    HV_SME_Z_REG_19,
> > +    HV_SME_Z_REG_20,
> > +    HV_SME_Z_REG_21,
> > +    HV_SME_Z_REG_22,
> > +    HV_SME_Z_REG_23,
> > +    HV_SME_Z_REG_24,
> > +    HV_SME_Z_REG_25,
> > +    HV_SME_Z_REG_26,
> > +    HV_SME_Z_REG_27,
> > +    HV_SME_Z_REG_28,
> > +    HV_SME_Z_REG_29,
> > +    HV_SME_Z_REG_30,
> > +    HV_SME_Z_REG_31,
> > +} hv_sme_z_reg_t;
>
> Hmm do we need those? Could we just define the typedef?

Yes, they are used in the static const hvf_reg_match arrays.

>
>    typedef uint32_t hv_sme_p_reg_t;
>    typedef uint32_t hv_sme_z_reg_t;
>    typedef void *hv_sme_zt0_uchar64_t;
>
> > +
> > +enum {
> > +  HV_SYS_REG_SMCR_EL1,
> > +  HV_SYS_REG_SMPRI_EL1,
> > +  HV_SYS_REG_TPIDR2_EL0,
> > +  HV_SYS_REG_ID_AA64ZFR0_EL1,
> > +  HV_SYS_REG_ID_AA64SMFR0_EL1,
> > +};
> > +
> > +typedef struct {
> > +    bool streaming_sve_mode_enabled;
> > +    bool za_storage_enabled;
> > +} hv_vcpu_sme_state_t;
> > +
> > +static inline hv_return_t hv_sme_config_get_max_svl_bytes(size_t *valu=
e)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_get_sme_state(hv_vcpu_t vcpu,
> > +                                                hv_vcpu_sme_state_t *s=
me_state)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_set_sme_state(hv_vcpu_t vcpu,
> > +                                                const hv_vcpu_sme_stat=
e_t *sme_state)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_get_sme_z_reg(hv_vcpu_t vcpu,
> > +                                                hv_sme_z_reg_t reg,
> > +                                                uint8_t *value,
> > +                                                size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_set_sme_z_reg(hv_vcpu_t vcpu,
> > +                                                hv_sme_z_reg_t reg,
> > +                                                const uint8_t *value,
> > +                                                size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_get_sme_p_reg(hv_vcpu_t vcpu,
> > +                                                hv_sme_p_reg_t reg,
> > +                                                uint8_t *value,
> > +                                                size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_set_sme_p_reg(hv_vcpu_t vcpu,
> > +                                                hv_sme_p_reg_t reg,
> > +                                                const uint8_t *value,
> > +                                                size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_get_sme_za_reg(hv_vcpu_t vcpu,
> > +                                                 uint8_t *value,
> > +                                                 size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_set_sme_za_reg(hv_vcpu_t vcpu,
> > +                                                 const uint8_t *value,
> > +                                                 size_t length)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_get_sme_zt0_reg(hv_vcpu_t vcpu,
> > +                                                  hv_sme_zt0_uchar64_t=
 *value)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline hv_return_t hv_vcpu_set_sme_zt0_reg(hv_vcpu_t vcpu,
> > +                                                  const hv_sme_zt0_uch=
ar64_t *value)
> > +{
> > +    g_assert_not_reached();
> > +}

