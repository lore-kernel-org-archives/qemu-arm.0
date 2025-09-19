Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA28CAC59A
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Sep 2025 10:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzYiX-0001mG-3g; Fri, 19 Sep 2025 06:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uzYiW-0001lr-C2
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 06:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uzYiS-0007KR-Nn
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 06:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758279105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQRK3YPT6mwpfNmMpzhdsLCbZWvefuQUKBzBqqtWsmw=;
 b=ee22jfR8TQgq38g527D8hNFr6Kg+h8xpylkPDGMsdz+6PAJ3zFeLCajY1gZ/jxhCuxCxIT
 1BZKkt6IJGxf52m9l4GEV5U2/pXwaiREvgzz0I5BE0aDkKwbsUiK5fIJxVyOs13wrbPh4w
 gSa3pDoRUXXj6SmbwK2Rr/CRSwSHm6c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-RBWg42u_OuyuRsvbsZFGEg-1; Fri, 19 Sep 2025 06:51:43 -0400
X-MC-Unique: RBWg42u_OuyuRsvbsZFGEg-1
X-Mimecast-MFC-AGG-ID: RBWg42u_OuyuRsvbsZFGEg_1758279103
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45df7e734e0so22596125e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Sep 2025 03:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758279103; x=1758883903;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UQRK3YPT6mwpfNmMpzhdsLCbZWvefuQUKBzBqqtWsmw=;
 b=adrZz9RbX3MvsXrZHg3TAYluCTuqWplLEywjxumtAXItQkEyraKlwDyTCicC+vZcKv
 d73gDfdCbjyP8diSEqDZZUnVL7nn9sFxKk8ZNZ5ru75ElCRTFzshxEWHq8P+KVwVopLy
 fDGZzAK6oNio25Ii+n0csQ8yJncoN6d0Nay/QJEOndzuCLdIClYXBLzbuW1KBcO7EsUh
 rcWZCzHpKsHwG1VRQI+vnysQTkal7BVBHouBJenlkDc8K2TjRL2fMYp7LT2AHXimfyYz
 LEcfTusQWDPiogaiUloCqJUjbKBO3RBChlQANEkxW1q40HyD0Sqwz/ilQLEvqQEuPKM1
 I0aA==
X-Gm-Message-State: AOJu0Yy2vKhtzfFCtTAKrnKT8jFBX9dXSo+5abck70v+CCjWLvfPdsOa
 L65Rn1WVDCbTcA6nApXClypJ+gl7wu11+z7KHWtiNDhwodV5sDoRgR+Wg0KjI5GbqozoX6NnJVG
 IP08vWAV5f22dVxsFg8gP3fK47+NkV7B8WXP3zFRD1Iz0mebaoZ1C0g==
X-Gm-Gg: ASbGnctd5wvDv2YDZFoGvET63CLTKcyypysYEYhylnaNPwUGQGLrNYjIu/93keqrlvO
 tr0Wx0G0JXVLoS/sqlHPm512Nkd8Tr5M2HLFr6aHfAx+ZptyXA3oiRrCAjn6r5JhVp/283n8AyA
 77wiwZG8I7IarB+B2KofOVLnSgc3Ls1aQiG7SWgMLjaT9BKf3uMGhOxXX5suP5l6tvXafl//LEL
 bHx8VeoQXG+qmfUn1ZPtG1ldM3rVU4mNvnxpqLANmyxKzv9UtZQTN+WzyQ5UqWdhuJGRTDVUS2+
 +m9jKQjumd7BEkGY28DsB0UGprjJItfwW/Vk3eaHKwKdUZmNN/FVMc7GgCd9F6qF0ZDellW8uAs
 dGlALh5RZ6HsrUw==
X-Received: by 2002:a05:600c:45cd:b0:45d:7d88:edcd with SMTP id
 5b1f17b1804b1-467eb23112bmr25899085e9.30.1758279102609; 
 Fri, 19 Sep 2025 03:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGch0fL9uUPqIZBmMRHzx+5peKTgh9rC9sEWO8g2P/U/CDrDQ3AXj7Gu+NtDPhv7yGsIVpP4w==
X-Received: by 2002:a05:600c:45cd:b0:45d:7d88:edcd with SMTP id
 5b1f17b1804b1-467eb23112bmr25898835e9.30.1758279102149; 
 Fri, 19 Sep 2025 03:51:42 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf3bfcsm7363231f8f.58.2025.09.19.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 03:51:41 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:51:39 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerkolothum@gmail.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>, 
 berrange@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
 armbru@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com, 
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, 
 salil.mehta@huawei.com, yangjinqian1@huawei.com, 
 shameerali.kolothum.thodi@huawei.com
Subject: Re: [RFC PATCH RESEND 3/4] target/arm/kvm: Handle KVM Target Imp
 CPU hypercalls
In-Reply-To: <20250801074730.28329-4-shameerkolothum@gmail.com>
Message-ID: <3bf24eb7-b1cd-793c-158f-7b6e2aeab026@redhat.com>
References: <20250801074730.28329-1-shameerkolothum@gmail.com>
 <20250801074730.28329-4-shameerkolothum@gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ws-hAS9OakKKLTCz9D9mu5fLvPnRQWCyOLqG7RAmi00_1758279103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 1 Aug 2025, Shameer Kolothum wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> When target implementation CPUs are set, handle the related hyper calls
> correctly by returning the information requested.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> target/arm/kvm.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 99 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8f325c4ca4..5adecc864e 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1697,6 +1697,71 @@ static bool kvm_arm_handle_debug(ARMCPU *cpu,
>     return false;
> }
>
> +/* Only supports HYP_KVM_DISCOVER_IMPL_XXX hypercalls */
> +static void arm_handle_smccc_kvm_vendor_hypercall(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    uint64_t param[4] = { };
> +    uint64_t idx;
> +
> +    if (!is_a64(env)) {
> +        env->regs[0] = SMCCC_RET_NOT_SUPPORTED;
> +        return;
> +    }
> +
> +    memcpy(param, env->xregs, sizeof(param));
> +
> +    switch (param[0]) {
> +    case ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID:
> +        if (!target_impl_cpus_num) {
> +            env->xregs[0] = SMCCC_RET_NOT_SUPPORTED;
> +            return;
> +        }
> +        env->xregs[0] = SMCCC_RET_SUCCESS;
> +        env->xregs[1] = PSCI_VERSION(1, 0);
> +        env->xregs[2] = target_impl_cpus_num;
> +        break;
> +    case ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID:
> +        idx = param[1];
> +
> +        if (!target_impl_cpus_num || idx >= target_impl_cpus_num) {
> +            env->xregs[0] = SMCCC_RET_INVALID_PARAMETER;
> +            return;
> +        }
> +
> +        env->xregs[0] = SMCCC_RET_SUCCESS;
> +        env->xregs[1] = target_impl_cpus[idx].midr;
> +        env->xregs[2] = target_impl_cpus[idx].revidr;
> +        env->xregs[3] = target_impl_cpus[idx].aidr;
> +        break;
> +    default:
> +        env->xregs[0] = SMCCC_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int kvm_arm_handle_hypercall(CPUState *cs, struct kvm_run *run)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    kvm_cpu_synchronize_state(cs);
> +
> +    if (run->hypercall.flags == KVM_HYPERCALL_EXIT_SMC) {
> +        cs->exception_index = EXCP_SMC;
> +        env->exception.syndrome = syn_aa64_smc(0);
> +    } else {
> +        cs->exception_index = EXCP_HVC;
> +        env->exception.syndrome = syn_aa64_hvc(0);
> +    }
> +    env->exception.target_el = 1;
> +
> +    bql_lock();
> +    arm_handle_smccc_kvm_vendor_hypercall(cpu);
> +    bql_unlock();
> +
> +    return EXCP_INTERRUPT;
> +}
> +
> int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
> {
>     ARMCPU *cpu = ARM_CPU(cs);
> @@ -1713,6 +1778,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>         ret = kvm_arm_handle_dabt_nisv(cpu, run->arm_nisv.esr_iss,
>                                        run->arm_nisv.fault_ipa);
>         break;
> +    case KVM_EXIT_HYPERCALL:
> +        ret = kvm_arm_handle_hypercall(cs, run);
> +        break;
>     default:
>         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                       __func__, run->exit_reason);
> @@ -2212,6 +2280,29 @@ static int kvm_arm_sve_set_vls(ARMCPU *cpu)
>     return kvm_set_one_reg(CPU(cpu), KVM_REG_ARM64_SVE_VLS, &vls[0]);
> }
>
> +/*
> + * Supported Target Implementation CPU hypercalls:
> + *   KVM_REG_ARM_VENDOR_HYP_BIT_DISCOVER_IMPL_VER   = 0,
> + *   KVM_REG_ARM_VENDOR_HYP_BIT_DISCOVER_IMPL_CPUS  = 1
> + *
> + * Setting these bits advertises the availability of the corresponding
> + * Target Implementation CPU hypercalls to the guest.
> + */
> +#define BMAP_2_DISCOVER_IMPL_BITS 0x3ULL
> +static int kvm_arm_target_impl_cpus_set_hyp_bmap2(ARMCPU *cpu)
> +{
> +    uint64_t bmap2;
> +    int ret;
> +
> +    ret = kvm_get_one_reg(CPU(cpu), KVM_REG_ARM_VENDOR_HYP_BMAP_2, &bmap2);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    bmap2 |= BMAP_2_DISCOVER_IMPL_BITS;
> +    return kvm_set_one_reg(CPU(cpu), KVM_REG_ARM_VENDOR_HYP_BMAP_2, &bmap2);
> +}
> +
> #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>
> int kvm_arch_init_vcpu(CPUState *cs)
> @@ -2293,6 +2384,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>     }
>     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>
> +    /* Set KVM_REG_ARM_VENDOR_HYP_BMAP_2 if target impl CPUs are required */
> +    if (target_impl_cpus_num) {
> +        ret = kvm_arm_target_impl_cpus_set_hyp_bmap2(cpu);

There's still the question of what we use to actually set the
imp id regs for the vm. I'm in favour of using target_impl_cpus[0].*
but if these can also be specified via the writable id regs interface
(https://lore.kernel.org/qemu-devel/20250414163849.321857-1-cohuck@redhat.com/)
we need to make sure that they match.

Otherwise, looks good to me!

Sebastian


