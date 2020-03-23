Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1406982lfi;
        Mon, 23 Mar 2020 05:44:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtN6EOywu+jivKoBRYXdwRBSjQPdsCXdHsBjAPA5w4rMTxrrEqO/UaUIBPVdmGwNwHVJDnk
X-Received: by 2002:a37:634d:: with SMTP id x74mr21108832qkb.254.1584967461380;
        Mon, 23 Mar 2020 05:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584967461; cv=none;
        d=google.com; s=arc-20160816;
        b=HsG9CqMrkUtsSJcUxY2CS8C6mnsiNc2WeM7XsMJ1Sw6FOxTe07yMJp8owCCrS+3g+x
         h8cIZVfccnsJVSt85wMbhXXTIx8dnT+0ud8gr8wmgURnv406AjCZwKdXJENYDU7dJUcf
         YTm1jI47fKCB4tlIVGhxmQLuNtEpfMVud/rEY1NtT3+L0OXF9gsOPYu+5lv0G3z9cyZJ
         HqkEFxjDdu1KuVrWtH32+WMGgUfgThSEm4srNkbTnfmdXjNjJMDe59HZjFIYH5mpIZwp
         XlS6nPl+xubdvEexULeXHIQv3XQNkwROH9+LwWCj/bzU1A2wK4IFrhclle2gYq9lNyqv
         tl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=3JLU79kdjsPhGVHpaau2Qrn8gwTtWCPDlysA5RJsWps=;
        b=ANLpG329NnvVEKvWF/ezR6BEjzdozGUW7SiTQkw68KPtMP0dil8OljSLpMcV6M8/K8
         MJGhpSdaYcOgaOOfhXLuwpV6Teh8tZd+Sf0QH5JCvIfYUVBQpw7jA/Y9PCdffhl9iiDo
         FD/JUNAZG7FsAEh/ZG3+0pNlvsVNymqpMbRRF1/iZhSgmCEtZzUUROxBvq/hw0P4hO5F
         ZcJh06CfB6W050i8sW6W3HDSySGA91oXLrRHIe8UQ5ZZ16/t+oc7TIfKfO70vM/AfYMF
         d00GQGbq0S5FpwKhwbD1KxXrLof5UJfM96DUsbxey3uURgOKjqqAj8R/4fH0EugoMX3H
         PvYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=dNJ6lr38;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id k23si8369409qtu.184.2020.03.23.05.44.20;
        Mon, 23 Mar 2020 05:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=dNJ6lr38;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EF0914B0B4;
	Mon, 23 Mar 2020 08:44:19 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-8TXLMz9jzm; Mon, 23 Mar 2020 08:44:18 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C47AA4B09B;
	Mon, 23 Mar 2020 08:44:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 683E44A534
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 08:44:17 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgShzFOJzvRw for <kvmarm@lists.cs.columbia.edu>;
 Mon, 23 Mar 2020 08:44:16 -0400 (EDT)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 594434A4C0
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 08:44:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584967456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yR9pLXr9umNUFsL7+ruu0WYz3liU3u4/YnRrG/oP/n4=;
 b=dNJ6lr38l5yQC1rgvCNfHmuFThu+VTX2p+zmX3aTxQjan7smbQvOiNLomvO3CkSK3Jf8ki
 JW7pxCFUgv/IkURx27Wf2be8P88wAPsyGG1GHhG0xXHD3o5fjKOWMrT4SuylxR3TIiPAjN
 ThfNBno5NHZG58Y6P6GaLCV+6hmlBL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-wepNHTTdMfiPe0XL8J5zGg-1; Mon, 23 Mar 2020 08:44:12 -0400
X-MC-Unique: wepNHTTdMfiPe0XL8J5zGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 242CA477;
 Mon, 23 Mar 2020 12:44:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E67B97E331;
 Mon, 23 Mar 2020 12:44:08 +0000 (UTC)
Date: Mon, 23 Mar 2020 13:44:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v4 1/2] target/arm: kvm: Handle DABT with no valid ISS
Message-ID: <20200323124405.xdv56zplli23sl46@kamzik.brq.redhat.com>
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-2-beata.michalska@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200323113227.3169-2-beata.michalska@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: PfI+EkWsZdPR

On Mon, Mar 23, 2020 at 11:32:26AM +0000, Beata Michalska wrote:
> On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate those instruction which is one of the
> (many) reasons why KVM will not even try to do so.
> 
> Add support for handling those by requesting KVM to inject external
> dabt into the quest.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  target/arm/cpu.h     |  2 ++
>  target/arm/kvm.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 11 +++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 4ffd991..4f834c1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -560,6 +560,8 @@ typedef struct CPUARMState {
>          uint64_t esr;
>      } serror;
>  
> +    uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
> +
>      /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>      uint32_t irq_line_state;
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 85860e6..c088589 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -39,6 +39,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>  
>  static bool cap_has_mp_state;
>  static bool cap_has_inject_serror_esr;
> +static bool cap_has_inject_ext_dabt;
>  
>  static ARMHostCPUFeatures arm_host_cpu_features;
>  
> @@ -244,6 +245,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          ret = -EINVAL;
>      }
>  
> +    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
> +        if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
> +            warn_report("Failed to enable DABT NISV cap");

Shouldn't this be an error? If KVM says it has KVM_CAP_ARM_NISV_TO_USER,
then I think it should always work to enable it, unless userspace passes
the wrong flags. Currently flags must be zero, but if they were to change
then we'll need to add the flags to vmstate and fail migration when they
aren't compatible, and I guess that failure would occur here.

> +        } else {
> +            /* Set status for supporting the external dabt injection */
> +            cap_has_inject_ext_dabt = kvm_check_extension(s,
> +                                    KVM_CAP_ARM_INJECT_EXT_DABT);
> +        }
> +    }
> +
>      return ret;
>  }
>  
> @@ -703,9 +714,16 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
>          events.exception.serror_esr = env->serror.esr;
>      }
>  
> +    if (cap_has_inject_ext_dabt) {
> +        events.exception.ext_dabt_pending = env->ext_dabt_pending;
> +    }
> +
>      ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
>      if (ret) {
>          error_report("failed to put vcpu events");
> +    } else {
> +        /* Clear instantly if the call was successful */
> +        env->ext_dabt_pending = 0;
>      }
>  
>      return ret;
> @@ -819,6 +837,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>              ret = EXCP_DEBUG;
>          } /* otherwise return to guest */
>          break;
> +    case KVM_EXIT_ARM_NISV:
> +        /* External DABT with no valid iss to decode */
> +        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
> +                                       run->arm_nisv.fault_ipa);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                        __func__, run->exit_reason);
> @@ -953,3 +976,34 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>  {
>      return (data - 32) & 0xffff;
>  }
> +
> +int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
> +                             uint64_t fault_ipa)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +   /*
> +    * ISS [23:14] is invalid so there is a limited info
> +    * on what has just happened so the only *useful* thing that can
> +    * be retrieved from ISS is WnR & DFSC (though in some cases WnR
> +    * might be less of a value as well)
> +    */
> +
> +    /*
> +     * Set pending ext dabt and trigger SET_EVENTS so that
> +     * KVM can inject the abort
> +     */
> +    if (cap_has_inject_ext_dabt) {
> +        kvm_cpu_synchronize_state(cs);

I guess this is just an expensive 'vcpu_dirty=true', which the comment
above justifies, but not super clearly. Can you try to clarify the
comment some more?  I also wonder if we shouldn't add a KVM function
that just marks a vcpu dirty, rather than fetching all registers.

> +        env->ext_dabt_pending = 1;
> +    } else {
> +        error_report("Data abort exception triggered by guest memory access "
> +                     "at physical address: 0x"  TARGET_FMT_lx,
> +                     (target_ulong)fault_ipa);
> +        error_printf("KVM unable to emulate faulting instruction.\n");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index ae9e075..39472d5 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -450,6 +450,17 @@ struct kvm_guest_debug_arch;
>  void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
>  
>  /**
> + * kvm_arm_handle_dabt_nisv:
> + * @cs: CPUState
> + * @esr_iss: ISS encoding (limited) for the exception from Data Abort
> + *           ISV bit set to '0b0' -> no valid instruction syndrome
> + * @fault_ipa: faulting address for the synch data abort
> + *
> + * Returns: 0 if the exception has been handled, < 0 otherwise
> + */
> +int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
> +                             uint64_t fault_ipa);
> +/**
>   * its_class_name:
>   *
>   * Return the ITS class name to use depending on whether KVM acceleration
> -- 
> 2.7.4
>

Thanks,
drew 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
