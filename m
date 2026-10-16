Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B602FCCF2C1
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 22:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHqo1-0007UY-6n; Fri, 16 Oct 2026 18:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHqny-0007UD-Tx
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 18:53:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHqnw-0006o0-M7
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 18:53:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3acb512a7a0so260949a91.1
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 15:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792191214; x=1792796014; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jFbt1hoixxjPVWE023X/7skdt6GJW42bri8Snk4vWz4=;
 b=CUEgvCJZYzutha5zFY887V+joDQHDsY9Hy7mcgz1ZwXAFop1wg00TUQiPKKMw9nPGd
 frDQe/bsF5aD5vCV3StXiFAe9pe9jMejEEO98ovaCCRb3lXh/8lfUfWJHtym8Q6qvZFP
 q9D6tciBH8XOwztjedyifJyQxFvgerlkmwFtMYimCzgTONDv1cXwzbwh4GADBOV4xhf1
 eoJCOmD+5g39w1OwJoiQjrcPCSLdH50+XHWy2EnKDVcGiYUPlqOEI+X5YepAgCU2TQEk
 lCPbGZylR6zzpw1Bf6uSIF0LHgSforHU7HPqEo17168bkqi48CvXJMYVpWlJ+dfnHsTh
 hF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792191214; x=1792796014;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jFbt1hoixxjPVWE023X/7skdt6GJW42bri8Snk4vWz4=;
 b=M66g0ag2LQ83MlLaQOGdZSwM1XSRXlvSmv7TrmWZn66VCpCW/WcDaxyV9PdaV+y7PM
 6V6PziftUpOdb0fylgfJPXERIZCDkzpb8OpF1QhYo0UyYNQMlV81b2BGknCPnYP5y3X8
 ukjtOkCqCXjlJ5PHWzzukcgh9SS/p+AH4782lFYBiJIyK9/h5hZazYo0rQvbxBf2rKri
 d1cJpdHqWxQ1M5vowCvsQPQkNYwpo00uMqtxG3C821CWeTfmwu8tLvVBljt4Us9jE6Yq
 m9GILhiwWHPmh6j3DoY9Z8z4NxJhsf3h/BV4dzm6URBxmuEgbe3BPMhm24TF6POvausM
 VEAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBykUFVnl5xbInkdqI3bOha4kFOdJG7jBpm/URNiG1Arogp00keDvN8tVH3ZmSesG1Sja8mnAwgahw==@nongnu.org
X-Gm-Message-State: AFq9FYLa4JEjLW/sBWdlCjhjHXjsNW/m9g72ISxM8zcwE1VY2eXwQSF5
 NExGev9cYaF6zLWaD6enmYrRsw7LVAPkcctMGaktmk6bEmq1wBgMt9Sgc9iicDjTeYI=
X-Gm-Gg: AYBFou2JszJvUelaq78CZp+zs7TapMV4UMDssYU7w/RHxdlvONUV6jWjz84I1iyhoNq
 3iVzzrS0UrhtJzmZrlMy+k8fTDW18XGlmYPnzvB0ngmvgu6zfSgxJsqC4kM4YKYb9pqTTdDq1Z5
 hE2/KDcUtQeUcY+uJC3HLaZNiFzXMQTKN9Qu89Yup3jTbvgDaNGzo+qP2cUZiA1OjChG8vtEN04
 rW3GtUALr/sPKIqpyLA2uOiKHDdnNKxYaSN8ZWfeg9Ly16WLwuFIEh4dBAlqSmf6jG4VYZSNwis
 ern/3zy2VNLRAG3CWRWxrTNz7BwHPclf06JF9lmQ3yNioB99/pwpk/jV57hTlknaUPxCFwOq0x2
 dMqvHSGUzwKnFHAgoke2MOV4gZZqED/oQI+EvfjmbcPXge/qbKN1txOmro9kc1RbUd2Qspug/bn
 c2fJCWp73ZPZrDJ7C//ivWEevmgnKBpGPe5+po1WDCKWrzyM/73dKl5dQFv6mWWpYHFssxmvMU3
 A==
X-Received: by 2002:a17:90b:4f8e:b0:3ab:d26b:c2e9 with SMTP id
 98e67ed59e1d1-3acef1451d2mr1122422a91.33.1792191213780; 
 Fri, 16 Oct 2026 15:53:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3acd9c4b4eesm3634255a91.2.2026.10.16.15.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:53:33 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:53:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 12/24] target/arm/cpu: Set number of breakpoints and
 watchpoints in KVM
Message-ID: <atKq6YqMMzzft2r1@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-13-mathieu.poirier@linaro.org>
 <eda8ee8f-5f17-4144-b21e-b1d990ee3270@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda8ee8f-5f17-4144-b21e-b1d990ee3270@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102e.google.com
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

On Fri, Oct 02, 2026 at 02:06:24PM +1000, Gavin Shan wrote:
> On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Add "num-breakpoints" and "num-watchpoints" CPU parameters to configure
> > the debug features that KVM presents to the guest. The KVM vCPU
> > configuration is modified by calling SET_ONE_REG on the ID register.
> > 
> > This is needed for Realm VMs, whose parameters include breakpoints and
> > watchpoints, and influence the Realm Initial Measurement.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/arm-qmp-cmds.c |  1 +
> >   target/arm/cpu.h          |  4 ++
> >   target/arm/cpu64.c        | 81 +++++++++++++++++++++++++++++++++++++++
> >   target/arm/kvm.c          | 56 +++++++++++++++++++++++++++
> >   4 files changed, 142 insertions(+)
> > 
> > diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> > index 83ec95c290f6..9ed65eb090d7 100644
> > --- a/target/arm/arm-qmp-cmds.c
> > +++ b/target/arm/arm-qmp-cmds.c
> > @@ -76,6 +76,7 @@ static const char *cpu_model_advertised_features[] = {
> >       "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> >       "kvm-no-adjvtime", "kvm-steal-time",
> >       "pauth", "pauth-impdef", "pauth-qarma3", "pauth-qarma5",
> > +    "num-breakpoints", "num-watchpoints",
> >       NULL
> >   };
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 6bbc942f9a59..d256d66a3e1b 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1173,6 +1173,10 @@ struct ArchCPU {
> >       /* Generic timer counter frequency, in Hz */
> >       uint64_t gt_cntfrq_hz;
> > +
> > +    /* Allows to override the default configuration */
> > +    uint8_t num_bps;
> > +    uint8_t num_wps;
> >   };
> 
> May improve the comments to indicate: these two fields are only needed
> by RME-vCPUs.
> 
>        /* Override the default configuration, only for RME vCPUs */
> 
> >   typedef struct ARMCPUInfo {
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 4e8c47253086..18adb06d78ad 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -666,6 +666,86 @@ void aarch64_add_pauth_properties(Object *obj)
> >       }
> >   }
> > +#if defined(CONFIG_KVM)
> > +static void arm_cpu_get_num_wps(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    uint8_t val;
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    val = cpu->num_wps;
> > +    if (val == 0) {
> > +        val = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
> > +                         ID_AA64DFR0, WRPS) + 1;
> > +    }
> > +
> > +    visit_type_uint8(v, name, &val, errp);
> > +}
> > +
> > +static void arm_cpu_set_num_wps(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    uint8_t val;
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +    uint8_t max_wps = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
> > +                                 ID_AA64DFR0, WRPS) + 1;
> > +
> > +    if (!visit_type_uint8(v, name, &val, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (val < 2 || val > max_wps) {
> > +        error_setg(errp, "invalid number of watchpoints");
> > +        return;
> > +   }
> > +
> > +    cpu->num_wps = val;
> > +}
> > +
> > +static void arm_cpu_get_num_bps(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    uint8_t val;
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    val = cpu->num_bps;
> > +    if (val == 0) {
> > +        val = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
> > +                         ID_AA64DFR0, BRPS) + 1;
> > +    }
> > +
> > +    visit_type_uint8(v, name, &val, errp);
> > +}
> > +
> > +static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    uint8_t val;
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +    uint8_t max_bps = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
> > +                                 ID_AA64DFR0, BRPS) + 1;
> > +
> > +    if (!visit_type_uint8(v, name, &val, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (val < 2 || val > max_bps) {
> > +        error_setg(errp, "invalid number of breakpoints");
>           ^^^^^
> 
> Code alignment issue here.
> 
> > +       return;
> > +    }
> > +
> > +    cpu->num_bps = val;
> > +}
> > +
> > +static void aarch64_add_kvm_writable_properties(Object *obj)
> > +{
> > +    object_property_add(obj, "num-breakpoints", "uint8", arm_cpu_get_num_bps,
> > +                        arm_cpu_set_num_bps, NULL, NULL);
> > +    object_property_add(obj, "num-watchpoints", "uint8", arm_cpu_get_num_wps,
> > +                        arm_cpu_set_num_wps, NULL, NULL);
> > +}
> > +#endif /* CONFIG_KVM */
> > +
> >   void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
> >   {
> >       uint64_t t;
> > @@ -807,6 +887,7 @@ void aarch64_host_initfn(Object *obj)
> >       kvm_arm_set_cpreg_mig_tolerances(cpu);
> >       kvm_arm_set_cpu_features_from_host(cpu);
> >       aarch64_add_sve_properties(obj);
> > +    aarch64_add_kvm_writable_properties(obj);
> >   #elif defined(CONFIG_HVF)
> >       hvf_arm_set_cpu_features_from_host(cpu);
> >   #elif defined(CONFIG_WHPX)
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index ca25b707a0a8..93686b038263 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -912,6 +912,56 @@ out:
> >       return ret;
> >   }
> > +#define KVM_REG_ARM_ID_AA64DFR0_EL1     ARM64_SYS_REG(3, 0, 0, 5, 0)
> > +
> > +static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
> > +{
> > +    int ret;
> > +    uint64_t val, newval;
> > +    CPUState *cs = CPU(cpu);
> > +
> > +    if (!cpu->num_bps && !cpu->num_wps) {
> > +        return;
> > +    }
> > +
> > +    newval = cpu->isar.idregs[ID_AA64DFR0_EL1_IDX];
> > +    if (cpu->num_bps) {
> > +        uint64_t ctx_cmps = FIELD_EX64(newval, ID_AA64DFR0, CTX_CMPS);
> > +
> > +        /* CTX_CMPs is never greater than BRPs */
> > +        ctx_cmps = MIN(ctx_cmps, cpu->num_bps - 1);
> > +        newval = FIELD_DP64(newval, ID_AA64DFR0, BRPS, cpu->num_bps - 1);
> > +        newval = FIELD_DP64(newval, ID_AA64DFR0, CTX_CMPS, ctx_cmps);
> > +    }
> > +    if (cpu->num_wps) {
> > +        newval = FIELD_DP64(newval, ID_AA64DFR0, WRPS, cpu->num_wps - 1);
> > +    }
> > +    ret = kvm_set_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &newval);
> > +    if (ret) {
> > +        error_report("Failed to set KVM_REG_ARM_ID_AA64DFR0_EL1");
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Check if the write succeeded. KVM does offer the writable mask for this
> > +     * register, but this way we also check if the value we wrote was sane.
> > +     */
> > +    ret = kvm_get_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &val);
> > +    if (ret) {
> > +        error_report("Failed to get KVM_REG_ARM_ID_AA64DFR0_EL1");
> > +        return;
> > +    }
> > +
> > +    if (val != newval) {
> > +        error_report("Failed to update KVM_REG_ARM_ID_AA64DFR0_EL1");
> > +    }
> 
> These two checks could be combined since we needn't to know how the write has
> been failing.
> 
>        if (ret || val != newval) {
>            error_report("Failed to update KVM_REG_ARM_ID_AA64DFR0_EL1");
>        }
> 
> > +}
> > +
> > +static void kvm_arm_configure_vcpu_regs(ARMCPU *cpu)
> > +{
> > +    kvm_arm_configure_aa64dfr0(cpu);
> > +}
> > +
> >   /**
> >    * kvm_arm_cpreg_level:
> >    * @regidx: KVM register index
> > @@ -1128,6 +1178,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
> >           fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
> >           abort();
> >       }
> > +
> > +    /*
> > +     * Before loading the KVM values into CPUState, update the KVM configuration
> > +     */
> 
> Can be squeezed into one line:
> 
>        /* Update KVM state before it's loaded to CPUState */
> 
> > +    kvm_arm_configure_vcpu_regs(cpu);
> > +
> 
> The newly added properties ("num-breakpoints", "num-watchpoints") are only needed by
> RME-vCPUs, but they're also visible to the normal vCPUs. So do we need to bail without
> adding the properties if RME isn't supported by the vCPUs in kvm_arm_configure_vcpu_regs() ?
>

I added a check for confidential-guest-support in the get() functions of both
options.  I also addressed the rest of your comments above.

Thanks for the review,
Mathieu 
 
> >       if (!write_kvmstate_to_list(cpu)) {
> >           fprintf(stderr, "write_kvmstate_to_list failed\n");
> >           abort();
> 
> Thanks,
> Gavin
> 

