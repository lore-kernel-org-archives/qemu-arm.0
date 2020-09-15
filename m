Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2933235lfq;
        Tue, 15 Sep 2020 00:33:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9253rI5Yf9MpNAd5w3lge2C8oU0faNP/sal1p/UhERsr+/Gcj83LHoaImo+0KlbfT0uR8
X-Received: by 2002:a25:dbd3:: with SMTP id g202mr3738042ybf.212.1600155205584;
        Tue, 15 Sep 2020 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600155205; cv=none;
        d=google.com; s=arc-20160816;
        b=dMsJKKbCQcv4olnPqE1eFbrpnanI84dUJEdPt9ahDwSS475uDOfZ3ROpaFhzLLHqFY
         Myee5EftHRn5RiXnHsiC3WHCfZr2E/BjCJ81EOqd79izFkHJrIZch/JngbEsPU9SCE2g
         ooZOfyp4hqG2mGX+/QJEFhqAJgQaL7ohX+mCEw4xYKHK8d8H8lgAIcTppAETKtfqXWmG
         gCLfzuRiQ2hHfMcL3Q2Y1z4dM+9SdAShP+2EwD1HaNDYE5XaZIi/AlLzqopE6LyZDceO
         xIGxA/slHj0B9ghLUkPWwR7saeCa0ZRQ3Xo8IJYlmK2rz2wMNMHgxWQZhlhU2SVS6Sk9
         45xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/s+UJ/Ysdcnsmt2V+//M/LWXL1ge5dmgeawBIC+2t0=;
        b=o0vkSdU1zAmqjUicoM5RXkyi022KNnOh1guLs98G3dtZSh2dZvQXAfuGPP7/hZCdjw
         I/fUkJzVHvDuH7qJ+pTPUFa4iwnoEGBAbfgCBu0r+KAQoViv1muYX/9rNK9pptg7PF8L
         8IwE27mszXTUvf0+M5/MMOpqsWt2kWnwuGSDPV4FkQr4iO+xghcdR4oofVzRMzrRcgwa
         lqoAaDCx/dV4BI4rI+rSLspr4SQM+7SEhzOa3czzwIpFtgHtkehkpt9iDrhVd3+Gbfi6
         ekOAJuIxEdOjGyJVd1b4iYjJsj5cG9q+P+u4mRzjV8d/1s2UpzugSSJuNd3nHvaHisfs
         AacA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUSkG0Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si5002594ybb.273.2020.09.15.00.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 00:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUSkG0Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI5Su-0004ur-VT
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 03:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI5Sk-0004uQ-1o
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:33:14 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI5Sh-0005Dg-Vz
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:33:13 -0400
Received: by mail-io1-xd44.google.com with SMTP id r9so3019140ioa.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 00:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/s+UJ/Ysdcnsmt2V+//M/LWXL1ge5dmgeawBIC+2t0=;
 b=cUSkG0Tg7qZiLWigWblG2NGWGNVkwgaY6C+WdmjM3qNjf2S3tLkKCURhkMYOJZcSJm
 Ks/m6p6ipzflQ1gq7JKRFEJc7JTdNMhfNMNEru2CDiFZ4qctezW5ORibrPkChvXrEks8
 YgPkDew0UEl97yWID5txZpoHV1cDKpX1cHuH9e7Lz0jQUazh62YiCnbMCNDZ1uH6WqgJ
 SXbtm8Pb/eomXrQWfEfD1eqshd/ixT4GtnkVgOiMLUyrpB0yktKnQHNjXANdWhkZWi2Y
 r4gRsQyhlvU5v+3LmlWTZlBhd/wL0xSR6T+NpAIR6JgQMYthCWfyM1+cfZak6kqLzedV
 j96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/s+UJ/Ysdcnsmt2V+//M/LWXL1ge5dmgeawBIC+2t0=;
 b=q/uNxKAZQhXDIlZjfMvQXv3mt8KkyWoJHaiewq5vb3GLYDAa4bystLqB/pgHNGo9iG
 dwKwyAuy43lcLgW5hsJ235LP50jfXe+ec58ZXCsnB1S3IBxInjcoAOi+nPu7luugLyUn
 GIaAmXSfKspvY5W6e+3poPXTwcadmnwVFFMKsZSyOBTfrM0ZWCXgOsyEipMdJ7IW5ifg
 L/4k5XTo1D7YJ0wHcjwj77pKGRmvYYNn0zONgYSUx4R5elgA3ZAPuknCvvcojquUHsdb
 a133FWgMzziuVhc8cQ1AXgLO067ytLptixMIrotR04ehGLjar1AhQrnSYI48qR1mxxPB
 4Leg==
X-Gm-Message-State: AOAM532jYwf0ogOTgAFYuQagqbbxG9B7RaQdm/Hgk3YbHKxKA8957Mgq
 osMTxcJjGoUfUutHisfJ/MeELmvu7R4Dtme93IXJ
X-Received: by 2002:a02:c72d:: with SMTP id h13mr17167274jao.17.1600155190602; 
 Tue, 15 Sep 2020 00:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600135462.git.haibo.xu@linaro.org>
 <90fec9ff0da7595f52caccf052c019d9359c8724.1600135462.git.haibo.xu@linaro.org>
 <20200915061058.zl7dbgmcjh5icu74@kamzik.brq.redhat.com>
In-Reply-To: <20200915061058.zl7dbgmcjh5icu74@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 15 Sep 2020 15:33:09 +0800
Message-ID: <CAJc+Z1FmOOJVp5xqUZAf7eKmwS6UROJ7x4PSCh5ZcfYtstMoOQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] target/arm/cpu: spe: Add an option to turn
 on/off vSPE support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7qkYPEQpy4HU

On Tue, 15 Sep 2020 at 14:11, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 15, 2020 at 03:11:39AM +0000, Haibo Xu wrote:
> > Adds a spe=[on/off] option to enable/disable vSPE support in
> > guest vCPU.
> >
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/cpu.c   |  6 ++++++
> >  target/arm/cpu.h   | 13 ++++++++++++
> >  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 71 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index c179e0752d..f211958eaa 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1310,6 +1310,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> >              error_propagate(errp, local_err);
> >              return;
> >          }
> > +
> > +        arm_cpu_spe_finalize(cpu, &local_err);
> > +        if (local_err != NULL) {
> > +            error_propagate(errp, local_err);
> > +            return;
> > +        }
> >      }
> >  }
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index a1c7d8ebae..baf2bbcee8 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -24,6 +24,7 @@
> >  #include "hw/registerfields.h"
> >  #include "cpu-qom.h"
> >  #include "exec/cpu-defs.h"
> > +#include "qapi/qapi-types-common.h"
> >
> >  /* ARM processors have a weak memory model */
> >  #define TCG_GUEST_DEFAULT_MO      (0)
> > @@ -196,9 +197,11 @@ typedef struct {
> >  #ifdef TARGET_AARCH64
> >  # define ARM_MAX_VQ    16
> >  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> > +void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp);
> >  #else
> >  # define ARM_MAX_VQ    1
> >  static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> > +static inline void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp) { }
> >  #endif
> >
> >  typedef struct ARMVectorReg {
> > @@ -829,6 +832,8 @@ struct ARMCPU {
> >      bool has_el3;
> >      /* CPU has PMU (Performance Monitor Unit) */
> >      bool has_pmu;
> > +    /* CPU has SPE (Statistical Profiling Extension) */
> > +    OnOffAuto has_spe;
> >      /* CPU has VFP */
> >      bool has_vfp;
> >      /* CPU has Neon */
> > @@ -3869,6 +3874,14 @@ static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
> >          FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
> >  }
> >
> > +/*
> > + * Currently we don't differentiate between the ARMv8.2-SPE and ARMv8.3-SPE.
> > + */
> > +static inline bool isar_feature_aa64_spe(const ARMISARegisters *id)
> > +{
> > +    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMSVER) != 0;
> > +}
> > +
> >  static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
> >  {
> >      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 3c2b3d9599..4997c4a3c0 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -572,6 +572,55 @@ void aarch64_add_sve_properties(Object *obj)
> >      }
> >  }
> >
> > +void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp)
> > +{
> > +    uint64_t t;
> > +    uint32_t value = 0;
> > +
> > +    if (cpu->has_spe == ON_OFF_AUTO_AUTO) {
> > +        if (kvm_enabled() && kvm_arm_spe_supported()) {
> > +            cpu->has_spe = ON_OFF_AUTO_ON;
> > +        } else {
> > +            cpu->has_spe = ON_OFF_AUTO_OFF;
> > +        }
> > +    } else if (cpu->has_spe == ON_OFF_AUTO_ON) {
> > +        if (!kvm_enabled() || !kvm_arm_spe_supported()) {
> > +            error_setg(errp, "'spe' cannot be enabled on this host");
> > +            return;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * According to the ARM ARM, the ID_AA64DFR0[PMSVER] currently
> > +     * support 3 values:
> > +     *
> > +     * 0b0000: SPE not implemented
> > +     * 0b0001: ARMv8.2-SPE implemented
> > +     * 0b0010: ARMv8.3-SPE implemented
> > +     *
> > +     * But the kernel KVM API didn't expose all these 3 values, and
> > +     * we can only get whether the SPE feature is supported or not.
> > +     * So here we just set the PMSVER to 1 if this feature was supported.
> > +     */
> > +    if (cpu->has_spe == ON_OFF_AUTO_ON) {
> > +        value = 1;
> > +    }
> > +
> > +    t = cpu->isar.id_aa64dfr0;
> > +    t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, value);
> > +    cpu->isar.id_aa64dfr0 = t;
> > +}
> > +
> > +static bool arm_spe_get(Object *obj, Error **errp)
> > +{
> > +    return ARM_CPU(obj)->has_spe != ON_OFF_AUTO_OFF;
> > +}
> > +
> > +static void arm_spe_set(Object *obj, bool value, Error **errp)
> > +{
> > +    ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> > +}
> > +
> >  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> >   * otherwise, a CPU with as many features enabled as our emulation supports.
> >   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> > @@ -721,6 +770,9 @@ static void aarch64_max_initfn(Object *obj)
> >      aarch64_add_sve_properties(obj);
> >      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> >                          cpu_max_set_sve_max_vq, NULL, NULL);
> > +
> > +    cpu->has_spe = ON_OFF_AUTO_AUTO;
> > +    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> >  }
>
> The cover-letter says we're only providing the 'spe' property for KVM
> enabled guests, but we're adding it here in the common part of the
> max init function. It should be added in the kvm_enabled() part only.
>
> Thanks,
> drew
>

Yes,  It should be in the kvm_enabled() part.
Will fix it in the next version.

Thanks,
Haibo

> >
> >  static const ARMCPUInfo aarch64_cpus[] = {
> > --
> > 2.17.1
> >
> >
>
