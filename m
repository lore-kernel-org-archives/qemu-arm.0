Received: by 10.223.172.38 with SMTP id v35csp1700799wrc;
        Tue, 5 Sep 2017 10:51:03 -0700 (PDT)
X-Received: by 10.99.120.3 with SMTP id t3mr4777686pgc.388.1504633863061;
        Tue, 05 Sep 2017 10:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504633863; cv=none;
        d=google.com; s=arc-20160816;
        b=ry3Nl9htcMEE7r8cUCjxlPZFZCTI3hDDXmzJKnJIARWnm0J1h/xxDkSqxkGAIHBLC5
         0oPZ0egX+qiWChIfSHLGWWt+G52/7kSB+aM4gg61sFCXokAog9ZfFX4T6lW8UJtw4gh7
         WiSdsfL/L+Y0FfkyXEug0Jqb3CpLIXFANsc4aV6USuTguDhyDnF18tv9M7SWUvYwLgKa
         oPfekk/u6jWX0WkjaQbPig4HRdSERJfruMZNHl4wCILGWlHBdjgwpjvYqi7j6LAAc5qT
         bzkL8EBH20FEt605h26sMByJ1S15EpJ37YLwsNZQroNJ5nDF557lBuP1MGPVuNVgtiKc
         K+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S8SoT3KyHvrkltcbP7bLsjQqvNv7p5/pDfkOQA2yjSE=;
        b=dG4ea5SIcud5aTY5Fbtw2J4L9Ku8AGnSJ//LK8yRLFugKkTfSDOrNFLARrtbPawqQ9
         IdjDNmTcnqD0lmO3kLzlxygNBlmV2jlVP8hEdRCi8CHzQe1m1OshlxGZjjkzSMHS7JwU
         bTdIP344tQ5ahI395vYsJr0GqvlrHkn9kGsYGzd1ybM4S3iSrUTYeo7VKVSj9BJzwoGN
         9GA2LQ6/RjP2qNfUkn2IHc74FTkbsp4OoaU2ncLRV0J0Wqz0Q2p/6Tcxm0/G6Xu6MqQ/
         sLgzzbGl/KAxFeMwWimVtFw4waUzD7ZUYRSgN1saHiCPkPL0JmPwSWzqIanH2zsakh7i
         i5aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gpa7GCQ+;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w24si672451pfl.62.2017.09.05.10.51.02;
        Tue, 05 Sep 2017 10:51:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gpa7GCQ+;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753215AbdIERvA (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Tue, 5 Sep 2017 13:51:00 -0400
Received: from mail-wr0-f169.google.com ([209.85.128.169]:33096 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752058AbdIERu6 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 5 Sep 2017 13:50:58 -0400
Received: by mail-wr0-f169.google.com with SMTP id a43so10209964wrc.0
        for <linux-kernel@vger.kernel.org>; Tue, 05 Sep 2017 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=S8SoT3KyHvrkltcbP7bLsjQqvNv7p5/pDfkOQA2yjSE=;
        b=Gpa7GCQ+Fxb4Su/UXBW3jusSce0c9osJfRCMoDasZ8xJQpj5PU3ipvLMMM2s2E4dxv
         jYod1f+gEsF+/Ldbnh4nDYztXvAcQarxgSGQUa+IrS5clHag7O3mNHzk+hfxkB2kSQ2O
         RuqfTe29VvjDMj4QFFPXpcZ4iJx00U5zJHI98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=S8SoT3KyHvrkltcbP7bLsjQqvNv7p5/pDfkOQA2yjSE=;
        b=sB8JBC9+eMPFWQFyQyAuhNnJPVR4wc6iasVlIhSKVownAXRUlNTRmgqLMUb3aUq1Cq
         rzBfysdOITCA2ykYphrgU70lql+SldFPwXkgCEi61W/dQp2TJO7p7BfPGmVuhOBl6IBi
         F7LaUm4P4xUAlFGWaJRrzdr/YBVuPuCgX+0aUi/5u5Y39cka2V5myCIyR/NXlw0e6XYK
         DgKkdxRqZV4tONfGbnHFnfpWWSSAAzc/aCRF3Ns/sdBizJtfuzCZwMETDalKSsABDv1W
         Ps/WCar0vVEXfyxIkJ3lflOqW9AdpcKzlORRq72NdGW1XsSvFUb2CGqC915D3GHYpH8H
         6hrg==
X-Gm-Message-State: AHPjjUhWDMfhdBNhNev4BenKbvHHvOj+IVxWUfkxZ3PYoOwUXkp1b801
        AUy3PHGhCUIAI95+/545fkv7ShqgeLg6
X-Google-Smtp-Source: ADKCNb5eo9O6ibv6NIV1DZ8BK43hxOpTsVh8YXjLKCEsFiMgHhAIWekbGYPoejoOmrRZqOVtBNlwmOJIEHc7ROavBig=
X-Received: by 10.223.135.250 with SMTP id c55mr2791424wrc.11.1504633856700;
 Tue, 05 Sep 2017 10:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 10:50:36 -0700 (PDT)
In-Reply-To: <1503066227-18251-7-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com> <1503066227-18251-7-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 5 Sep 2017 18:50:36 +0100
Message-ID: <CAFEAcA9TsQg4EXr4MAM2VbrzB9v5UA1F4o9tOCka=3e4wjbBGQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, bp@suse.de,
        shiju.jose@huawei.com, zjzhang@codeaurora.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        john.garry@huawei.com, jonathan.cameron@huawei.com,
        shameerali.kolothum.thodi@huawei.com, huangdaode@hisilicon.com,
        wangzhou1@hisilicon.com, Huangshaoyu <huangshaoyu@huawei.com>,
        wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>, zhengqiang10@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: VR0lzxUZDtec

On 18 August 2017 at 15:23, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> When guest OS happens SError interrupt(SEI), it will trap to host.
> Host firstly calls memory failure to deal with this error and decide
> whether it needs to deliver SIGBUS signal to userspace. The advantage
> that using signal to notify is that it can make the notification method
> is general, non-KVM user can also use it. when userspace gets this
> signal and knows this is SError interrupt, it will translate the
> delivered host VA to PA and record this PA to GHES.
>
> Because ARMv8.2 adds an extension to RAS to allow system software insert
> implicit Error Synchronization Barrier operations to isolate the error and
> allow passes specified syndrome to guest OS, so after record the CPER, user
> space calls IOCTL to pass a specified syndrome to KVM, then switch to guest
> OS, guest OS can use the recorded CPER record and syndrome information to
> do the recovery.
>
> The steps are shown below:
> 1. translate the host VA to guest OS PA and record this error PA to HEST table.
> 2. set specified virtual SError syndrome and pass the value to KVM.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Quanming Wu <wuquanming@huawei.com>
> ---
>  linux-headers/linux/kvm.h |  1 +
>  target/arm/internals.h    |  1 +
>  target/arm/kvm64.c        | 28 ++++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 2aa176e..10dfcab 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1356,6 +1356,7 @@ struct kvm_s390_ucas_mapping {
>  /* Available with KVM_CAP_S390_CMMA_MIGRATION */
>  #define KVM_S390_GET_CMMA_BITS      _IOWR(KVMIO, 0xb8, struct kvm_s390_cmma_log)
>  #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
> +#define KVM_ARM_SEI                 _IO(KVMIO,   0xb10)
>
>  #define KVM_DEV_ASSIGN_ENABLE_IOMMU    (1 << 0)
>  #define KVM_DEV_ASSIGN_PCI_2_3         (1 << 1)
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fc0ad6d..18b1cbc 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -237,6 +237,7 @@ enum arm_exception_class {
>  #define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
>  #define ARM_EL_EC_MASK  ((0x3F) << ARM_EL_EC_SHIFT)
>  #define ARM_EL_FSC_TYPE (0x3C)
> +#define ARM_EL_ISS_MASK ((1 << ARM_EL_IL_SHIFT) - 1)
>
>  #define FSC_SEA         (0x10)
>  #define FSC_SEA_TTW0    (0x14)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index d3bdab2..b84cb49 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -616,6 +616,22 @@ static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
>      return -EINVAL;
>  }
>
> +static int kvm_inject_arm_sei(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    unsigned long syndrome = env->exception.vaddress;
> +    /* set virtual SError syndrome */
> +    if (arm_feature(env, ARM_FEATURE_RAS_EXTENSION)) {
> +        syndrome = syndrome & ARM_EL_ISS_MASK;
> +    } else {
> +        syndrome = 0;
> +    }
> +
> +    return  kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_SEI, &syndrome);

This looks odd. If we don't have the RAS extension why do
we need to do anything at all here ?

> +}
> +
>  /* Inject synchronous external abort */
>  static int kvm_inject_arm_sea(CPUState *c)
>  {
> @@ -1007,6 +1023,15 @@ static bool is_abort_sea(unsigned long syndrome)
>      }
>  }
>
> +static bool is_abort_sei(unsigned long syndrome)
> +{
> +    uint8_t ec = ((syndrome & ARM_EL_EC_MASK) >> ARM_EL_EC_SHIFT);

You don't need to bother masking here -- in other places in
QEMU we assume that the EC field is at the top of the word,
so just "syndrome >> ARM_EL_EC_SHIFT" is sufficient.

> +    if ((ec != EC_SERROR))
> +        return false;
> +    else
> +        return true;

scripts/checkpatch.pl should tell you that this if needs braces
(it's good to get in the habit of running it on all patches; it
is not always correct, so judgement is required, but it will flag
up some common mistakes).

In this particular case, you should just
   return ec == EC_SERROR;
though.

> +}
> +
>  void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
> @@ -1024,6 +1049,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>              if (is_abort_sea(env->exception.syndrome)) {
>                  ghes_update_guest(ACPI_HEST_NOTIFY_SEA, paddr);
>                  kvm_inject_arm_sea(c);
> +            } else if (is_abort_sei(env->exception.syndrome)) {
> +                ghes_update_guest(ACPI_HEST_NOTIFY_SEI, paddr);
> +                kvm_inject_arm_sei(c);
>              }
>              return;
>          }
> --
> 1.8.3.1

thanks
-- PMM
