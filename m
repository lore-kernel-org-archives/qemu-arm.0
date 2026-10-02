Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E21CA5FCE
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 00:54:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCRXT-000699-8m; Thu, 01 Oct 2026 20:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRXP-00068q-UQ
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 20:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRXN-0001B6-LQ
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 20:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790902448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIuUoxFqAzBRNm/KfmC9YauHU6KyCv+jklWR5oFxcwk=;
 b=S4XU0dzH6y2l46YDVPgFMOv7t9YAAKd8sD+dcjriVdGPPYAvF7LDQa9KzvHgCc06BiVtuN
 I1KLkSvNcBNERo4zD7fw9hvqMNG2PlBG9A+Vaf0x3JKo5p/GJq3wm+8dVknhldUzxuguaz
 TNOvi/gcM14y1z3x7Rq22zMtVClUy8w=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-GlEFJq-zNaKvSbOdwWZQxg-1; Thu, 01 Oct 2026 20:54:07 -0400
X-MC-Unique: GlEFJq-zNaKvSbOdwWZQxg-1
X-Mimecast-MFC-AGG-ID: GlEFJq-zNaKvSbOdwWZQxg_1790902446
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-385d2703b64so1159676a91.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 17:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790902446; x=1791507246;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UIuUoxFqAzBRNm/KfmC9YauHU6KyCv+jklWR5oFxcwk=;
 b=iUmWrBI6jEfW39BbFJC6mKxTgrhUZrzrRsvPBDoNMoMWx8Lk2KykGP3+UGl3oy1ZAv
 sWCKTTxHGMZ7bO3scraws0NAKUq9x+mhmaaiNtMSiFcHVWFXTlCy4CqxRxcecxDsmhz4
 Ep9sZLiuuZwbeULDb6XrriEq3ED9kwbbSUCWks8/zvsf8qPM31wxQjiyiWWMs63rbO2R
 H7XthqYB6icongDevMMEnxhjSuXQ5JSd/y8slSZttMvGH/G9mkji8O/8M1k0CWk5fhZP
 L3pUtJ9dvGU/ahgLIAQI9vCY6uXwsRSw568dFYedrWdziKwSkYeZHmpaxKz3w2B9VPdI
 JEIg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpxF6wpgzEsRrusvCGQylQ21+NvE97lvwg1IQ7u4rIzoubvX9hCFAuiMSc+rQzkk77cXSZaE8Sjw==@nongnu.org
X-Gm-Message-State: AFq9FYKZr3+XsODzOXPuwDOIpFCFWVvx1fuOcYeGTVyArwj5AfeHMZ7k
 II30S/ERsaRXLueqgXwajQpF7pZxrj03ZZGtmdzhBg8UuQi1mPReW1NKdre8+qPNLxu4Na+uXjV
 2UCN0Qxm6vDgutPehmcfc+kToglLocijjlsTx3YN6KqoERLrOeUD9oA==
X-Gm-Gg: AYBFou1vUCO1UwytFTe2VJ9GIZfR5XecA5m/ZhAmJCdq+yg5TMpPIEjdAK8BPXGqt0u
 tejHf7AUIhW58SYQWHYo5xYfGKBqx7KAWo4E2vdjxZdhr9RwTBkcK5uCcRRMKi2HzKbeibKoa7Q
 vK9Sflligz+Ic3E97hWjDg+YGLjU+fNGY87qUuYhIdpXt6dy4QBL1PlWoDdsJSKkr3fCXwz2D3U
 naAYKIXGkbAs5/n5UHHpbQD/KeRiGesu5Bm8H1NtpdIHMrns9sYrZ+1fUNkYDm5yJs1JBoTi7hv
 1kWAikEAnClak/d7ugiaQB+8awQYYE7kC/Nf2YkDyiTJdhVwhCiZWCLKb9Nj/CP1/WRUYI7debo
 ZZuCRPsZBJ2LpWM+9pjVld5oRtngAls/YRB77bqrWng==
X-Received: by 2002:a17:90b:1c82:b0:3a0:c85a:ee12 with SMTP id
 98e67ed59e1d1-3a6cec91c89mr805485a91.41.1790902445639; 
 Thu, 01 Oct 2026 17:54:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3a0:c85a:ee12 with SMTP id
 98e67ed59e1d1-3a6cec91c89mr805451a91.41.1790902444814; 
 Thu, 01 Oct 2026 17:54:04 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a4f4709a7csm6448906a91.8.2026.10.01.17.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 17:54:04 -0700 (PDT)
Message-ID: <a3a01282-bf89-46b8-b15c-9dc5f93053ee@redhat.com>
Date: Fri, 2 Oct 2026 10:53:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 06/24] target/arm/kvm-rme: Initialize vCPU
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-7-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-7-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yLhqxdvr9c8-gUp30PTHXOJucT5CwgP_uLfo3i-fLgI_1790902446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
> Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
> the PC can also be set, and is ignored at runtime. KVM also accepts a
> few system register changes during initial configuration, as returned by
> KVM_GET_REG_LIST.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/cpu.h      |  3 +++
>   target/arm/kvm-rme.c  |  9 ++++++++
>   target/arm/kvm-stub.c |  5 ++++
>   target/arm/kvm.c      | 54 +++++++++++++++++++++++++++++++++++++++++--
>   target/arm/kvm_arm.h  | 10 ++++++++
>   5 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e3f931dba26b..6bbc942f9a59 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1054,6 +1054,9 @@ struct ArchCPU {
>       /* KVM steal time */
>       OnOffAuto kvm_steal_time;
>   
> +    /* Realm Management Extension */
> +    bool kvm_rme;
> +

This field seems redundant to MachineState::cgs since all vCPUs support RME
(Realm Management Extension) when MachineState::cgs points a valid instance.
So I'm wandering why we need to maintain the redundant information here?

>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;
>   
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index a4a5e195c196..f7c2cc786e2c 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -69,6 +69,15 @@ static int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> +{
> +    if (!rme_guest) {
> +        return;
> +    }
> +
> +    cpu->kvm_rme = true;
> +}
> +

This could be simplified to:

       cpu->kvm_rme = !!rme_guest;

>   static void rme_guest_class_init(ObjectClass *oc, const void *data)
>   {
>       ConfidentialGuestSupportClass *klass = CONFIDENTIAL_GUEST_SUPPORT_CLASS(oc);
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index 88cbe8d85c41..5fde96f9b281 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -119,3 +119,8 @@ char *kvm_print_register_name(uint64_t regidx)
>   {
>       g_assert_not_reached();
>   }
> +
> +void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 33c3763aebfa..b4c6da1fb9f3 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2015,6 +2015,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
>       }
>   
> +    kvm_arm_rme_vcpu_init(cpu);
> +
>       /* Do KVM_ARM_VCPU_INIT ioctl */
>       ret = kvm_arm_vcpu_init(cpu);
>       if (ret) {
> @@ -2169,6 +2171,29 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
>       return 0;
>   }
>   
> +static int kvm_arm_rme_put_core_regs(CPUState *cs, Error **errp)
> +{
> +    int i, ret;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    /* The RME ABI only allows us to set 8 GPRs and the PC */
> +    for (i = 0; i < 8; i++) {
> +        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
> +                              &env->xregs[i]);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pc), &env->pc);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>   static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
>   {
>       uint64_t val;
> @@ -2280,7 +2305,11 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
>       int ret;
>       ARMCPU *cpu = ARM_CPU(cs);
>   
> -    ret = kvm_arm_put_core_regs(cs, errp);
> +    if (cpu->kvm_rme) {
> +        ret = kvm_arm_rme_put_core_regs(cs, errp);
> +    } else {
> +        ret = kvm_arm_put_core_regs(cs, errp);
> +    }
>       if (ret) {
>           return ret;
>       }
> @@ -2367,6 +2396,23 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
>       return 0;
>   }
>   
> +static int kvm_arm_rme_get_core_regs(CPUState *cs, Error **errp)
> +{
> +    int i, ret;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    for (i = 0; i < 8; i++) {
> +        ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
> +                              &env->xregs[i]);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
>   {
>       uint64_t val;
> @@ -2478,7 +2524,11 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>       int ret;
>       ARMCPU *cpu = ARM_CPU(cs);
>   
> -    ret = kvm_arm_get_core_regs(cs, errp);
> +    if (cpu->kvm_rme) {
> +        ret = kvm_arm_rme_get_core_regs(cs, errp);
> +    } else {
> +        ret = kvm_arm_get_core_regs(cs, errp);
> +    }
>       if (ret) {
>           return ret;
>       }
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index e7c40fb003e4..d95381c13afa 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -240,4 +240,14 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
>    */
>   char *kvm_print_register_name(uint64_t regidx);
>   
> +/**
> + * kvm_arm_rme_vcpu_init
> + * @cs: the CPU
> + *
> + * If the user requested a Realm, setup the given vCPU accordingly. Realm vCPUs
> + * behave a little differently, for example most of their register state is
> + * hidden from the host.
> + */
> +void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
> +

The comments here look outdated. This function simply set ARMCPU::kvm_rme to indicate
RME should be supported for this given vCPU. So the comments would be something as
below.

     /*
      *
      * Mark that RME (Realm Management Extension) should be supported for the given
      * vCPU if user has requested it. Realm vCPUs behave a little differently, for
      * example most of their register states are confidential and invisible to us.
      */

>   #endif

Thanks,
Gavin


