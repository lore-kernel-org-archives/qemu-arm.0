Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1813524wrp;
        Thu, 12 Sep 2019 00:40:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbx4XcQ7QurM2YoY/4qrKUk4E4iEDdCQG4325GfTOXSXtPfzGbdesNPVfiWygjzhzN1v/U
X-Received: by 2002:a37:de14:: with SMTP id h20mr38723378qkj.260.1568274029774;
        Thu, 12 Sep 2019 00:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568274029; cv=none;
        d=google.com; s=arc-20160816;
        b=tFToUlqMf2JGpdPVzU4jadu+o8w0Tk9wYxAMr5E6nMQQTnobaiPeLbb/Tlpb4cN0eu
         t+hnv/IQhoH9ClpMD+m9/PKys59OsV0ZH4LrMvOtnRTF2KF9Fhgv+RyiZvm/a4j37b0S
         7CFvKqvQ6wfDFuuQ2g/0O+d13PD3y9SjAC7lurVPaY24n1aGK+k6Y200hKIOj200hAKH
         NBFFI1Vu1RSaZwUkp8XEYjWyoNThNDW1lVdyneMZrN/hGZXcjc5+3F8SmpcE8bUBC6li
         IjaqLDVi6mBfxGzt4Bt/7uFH8tlOUwGPyMR4UyoBRkWw0ePpKsM8uqqa2y95W76xxOl9
         hdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xlHQqI04ubF2GYWQ9muLns9LHXHGocmy4cNPXMDQaPc=;
        b=cM04jIPz5N56v6l5J1QlVw9ZLQ4JhtF23UdZB7Pj0A4xDp7/i22bQnd7iq6yoLs89R
         c5Cz8r/OT87353fRjhmuv7jVvzD4sEBj7/T9oIrrUcPUO6ZVF8Iip+oisSBlpd0WtmjI
         W+Sld6CqrsZ82KeVtIynTj55UGBgNVCmMYFF8bCJqJ9yF/C2coOz7lGh6XOfMtaTxWoB
         m5b4+W2bRyjbKaMauxuYkP159HElCoBTgusZ7hqGM+O3YxlC7o0BKp04QeW+kmE/whcR
         gNVN/8Y/yU0y8CK385JjrQEa2amIcE63Gp5/+YSYWh0Z+8g0AodooTvgZAqWjI6mYXvp
         8h8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 37si226497qvz.171.2019.09.12.00.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 00:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8JiO-0002C3-Ni
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 03:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i8JiE-0002AV-55
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 03:40:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i8JiD-00037Q-1W
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 03:40:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i8JiC-00036x-Q5; Thu, 12 Sep 2019 03:40:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99BC8300BE7F;
 Thu, 12 Sep 2019 07:40:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0375D704;
 Thu, 12 Sep 2019 07:40:11 +0000 (UTC)
Date: Thu, 12 Sep 2019 09:40:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190912074009.gkqirjdyvitxwnxw@kamzik.brq.redhat.com>
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911155125.11932-4-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 12 Sep 2019 07:40:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: peter.maydell@linaro.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0xkR1R4KWPbi

On Wed, Sep 11, 2019 at 05:51:25PM +0200, Eric Auger wrote:
> Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=512
> for ARM. The actual capability to instantiate more than 256 vcpus
> was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
> vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
> a single KVM IO device instead of 2.
> 
> So let's check this capability when attempting to use more than 256
> vcpus.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c        |  4 ++++
>  target/arm/kvm.c     | 21 +++++++++++++++++++++
>  target/arm/kvm_arm.h | 15 +++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0d1629ccb3..465e3140f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1575,6 +1575,10 @@ static void machvirt_init(MachineState *machine)
>          virt_max_cpus = GIC_NCPU;
>      }
>  
> +    if (kvm_arm_irq_line_layout_mismatch(MACHINE(vms), max_cpus)) {
> +        exit(1);
> +    }
> +
>      if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                       "supported by machine 'mach-virt' (%d)",
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 6cdfa2204f..b601e2f35a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -171,6 +171,27 @@ bool kvm_arm_pmu_supported(CPUState *cpu)
>      return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
>  }
>  
> +bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, int vcpus)
> +{
> +    KVMState *s;
> +    bool ret;
> +
> +    if (!kvm_enabled()) {
> +        return false;
> +    }
> +
> +    s = KVM_STATE(ms->accelerator);
> +
> +    ret = vcpus > 256 &&
> +          !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2);
> +
> +    if (ret) {
> +        error_report("Using more than 256 vcpus requires a host kernel "
> +                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
> +    }
> +    return ret;
> +}
> +
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  {
>      KVMState *s = KVM_STATE(ms->accelerator);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index b4e19457a0..d893d950d8 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -233,6 +233,16 @@ bool kvm_arm_pmu_supported(CPUState *cs);
>   */
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
>  
> +/**
> + * kvm_arm_irq_line_layout_mismatch - Returns whether the number of vcpus
> + * exceeds the limit imposed by the legacy KVM_IRQ_LINE ARM layout
> + * (without the vcpu2_index field).
> + *
> + * @ms: Machine state handle
> + * @vcpus: number of vcpus
> + */
> +bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, int vcpus);
> +
>  /**
>   * kvm_arm_sync_mpstate_to_kvm
>   * @cpu: ARMCPU
> @@ -281,6 +291,11 @@ static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>      return -ENOENT;
>  }
>  
> +static inline bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, int vcpus)
> +{
> +    return false;
> +}
> +
>  static inline int kvm_arm_vgic_probe(void)
>  {
>      return 0;
> -- 
> 2.20.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
