Received: by 10.25.0.198 with SMTP id 189csp184009lfa;
        Tue, 2 May 2017 01:04:00 -0700 (PDT)
X-Received: by 10.237.53.37 with SMTP id a34mr26959506qte.274.1493712240133;
        Tue, 02 May 2017 01:04:00 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id y6si16368220qta.278.2017.05.02.01.03.59;
        Tue, 02 May 2017 01:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 849CA40A66;
	Tue,  2 May 2017 04:00:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xHQtdqprlWE; Tue,  2 May 2017 04:00:51 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 37D9340BC4;
	Tue,  2 May 2017 04:00:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5592840BC4
 for <kvmarm@lists.cs.columbia.edu>; Tue,  2 May 2017 04:00:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R+Lsz8ilOVrD for <kvmarm@lists.cs.columbia.edu>;
 Tue,  2 May 2017 04:00:42 -0400 (EDT)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id A7CAC40A66
 for <kvmarm@lists.cs.columbia.edu>; Tue,  2 May 2017 04:00:42 -0400 (EDT)
Received: by mail-wm0-f51.google.com with SMTP id w64so104113536wma.0
 for <kvmarm@lists.cs.columbia.edu>; Tue, 02 May 2017 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fwRjTW+u/bc1Ra8I5ZI3YrxhU2ueioCmJZclkRUTEDU=;
 b=SxPxXkCm5tFRX0lfM/FD2Kae55AU2cKtoBiUngVADxoL3CXhfGg50ru1ae1dmCnnIx
 ongXmVDnHFsv/gXqd0AXSE4ucWepglv8VDdCu4GfxsAxYRn2/Enug/1KNQNLqecA925/
 vutBRpr8u+YfMnTgq5Um9qI2hqO+7xCjt0zgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fwRjTW+u/bc1Ra8I5ZI3YrxhU2ueioCmJZclkRUTEDU=;
 b=a9rinxQ9fRdExMe9DUNHBx3QZYIvSJ+Id6yslBPXHKUH0sN6l/TKOTO01p13HrkSGJ
 F+5wqH6IELOc1yaqwqyVMfmtd40ROfVrbWKDdbWTkyDUpyLT1xQiq7dXt9ZoyYSv+/nq
 Ac0W1sld3lHl9IZl906u9GMwFWWbqk+2JlEvdq1eqshb6FwaPO+EnAXs4ukscEaPZShe
 QotJdT1ms1o038D9P2VB6dp0fOgsvJnXB0WoOaSrg61C3MvkLrWa7+Ik9n4708ntVZfZ
 W8tPnXkcQ9NvNynRpdEMynauwL4LI535nkhO9rhbdhUDqNcfL3BSjdv0XOfxkWjctEgQ
 xR5w==
X-Gm-Message-State: AN3rC/79CWzGTrzcxjqgE/PV4QdXy/2/nyxzuNu5inOHi4bXJ8umjvmO
 rCiTOys/kMBxObrK
X-Received: by 10.80.184.226 with SMTP id l89mr22451444ede.137.1493712223068; 
 Tue, 02 May 2017 01:03:43 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
 by smtp.gmail.com with ESMTPSA id h15sm8745326edh.56.2017.05.02.01.03.42
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 02 May 2017 01:03:42 -0700 (PDT)
Date: Tue, 2 May 2017 10:03:42 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Subject: Re: [PATCH v3 2/3] arm64: kvm: inject SError with virtual syndrome
Message-ID: <20170502080342.GF16940@cbox>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: mtsirkin@redhat.com, kvm@vger.kernel.org, tbaicar@codeaurora.org,
 qemu-devel@nongnu.org, wangxiongfeng2@huawei.com, ben@skyportsystems.com,
 linux@armlinux.org.uk, kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
 lersek@redhat.com, songwenjun@huawei.com, wuquanming@huawei.com,
 marc.zyngier@arm.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 linux-arm-kernel@lists.infradead.org, ard.biesheuvel@linaro.org,
 pbonzini@redhat.com
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
X-TUID: Tbc3MLIUF9ib

On Sun, Apr 30, 2017 at 01:37:56PM +0800, Dongjiu Geng wrote:
> when SError happen, kvm notifies kvmtool to generate GHES table
> to record the error, then kvmtools inject the SError with specified

again, is this really specific to kvmtool?  Pleae try to explain this
mechanism in generic terms.

> virtual syndrome. when switch to guest, a virtual SError will happen with
> this specified syndrome.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  arch/arm64/include/asm/esr.h         |  2 ++
>  arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
>  arch/arm64/include/asm/kvm_host.h    |  1 +
>  arch/arm64/include/asm/sysreg.h      |  3 +++
>  arch/arm64/kvm/handle_exit.c         | 25 +++++++++++++++++++------
>  arch/arm64/kvm/hyp/switch.c          | 15 ++++++++++++++-
>  include/uapi/linux/kvm.h             |  5 +++++
>  7 files changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index 22f9c90..d009c99 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -127,6 +127,8 @@
>  #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
>  #define ESR_ELx_xVC_IMM_MASK	((1UL << 16) - 1)
>  
> +#define VSESR_ELx_IDS_ISS_MASK    ((1UL << 25) - 1)
> +
>  /* ESR value templates for specific events */
>  
>  /* BRK instruction trap from AArch64 state */
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index f5ea0ba..a3259a9 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -148,6 +148,16 @@ static inline u32 kvm_vcpu_get_hsr(const struct kvm_vcpu *vcpu)
>  	return vcpu->arch.fault.esr_el2;
>  }
>  
> +static inline u32 kvm_vcpu_get_vsesr(const struct kvm_vcpu *vcpu)
> +{
> +		return vcpu->arch.fault.vsesr_el2;
> +}
> +
> +static inline void kvm_vcpu_set_vsesr(struct kvm_vcpu *vcpu, unsigned long val)
> +{
> +		vcpu->arch.fault.vsesr_el2 = val;
> +}
> +
>  static inline int kvm_vcpu_get_condition(const struct kvm_vcpu *vcpu)
>  {
>  	u32 esr = kvm_vcpu_get_hsr(vcpu);
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index e7705e7..84ed239 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -86,6 +86,7 @@ struct kvm_vcpu_fault_info {
>  	u32 esr_el2;		/* Hyp Syndrom Register */
>  	u64 far_el2;		/* Hyp Fault Address Register */
>  	u64 hpfar_el2;		/* Hyp IPA Fault Address Register */
> +	u32 vsesr_el2;		/* Virtual SError Exception Syndrome Register */
>  };
>  
>  /*
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 32964c7..b6afb7a 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -125,6 +125,9 @@
>  #define REG_PSTATE_PAN_IMM		sys_reg(0, 0, 4, 0, 4)
>  #define REG_PSTATE_UAO_IMM		sys_reg(0, 0, 4, 0, 3)
>  
> +#define VSESR_EL2			sys_reg(3, 4, 5, 2, 3)
> +
> +
>  #define SET_PSTATE_PAN(x) __emit_inst(0xd5000000 | REG_PSTATE_PAN_IMM |	\
>  				      (!!x)<<8 | 0x1f)
>  #define SET_PSTATE_UAO(x) __emit_inst(0xd5000000 | REG_PSTATE_UAO_IMM |	\
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index c89d83a..3d024a9 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -180,7 +180,11 @@ static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
>  
>  static int kvm_handle_guest_sei(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  {
> -	unsigned long fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> +	unsigned long hva, fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> +	struct kvm_memory_slot *memslot;
> +	int hsr, ret = 1;
> +	bool writable;
> +	gfn_t gfn;
>  
>  	if (handle_guest_sei((unsigned long)fault_ipa,
>  				kvm_vcpu_get_hsr(vcpu))) {
> @@ -190,9 +194,20 @@ static int kvm_handle_guest_sei(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  				(unsigned long)kvm_vcpu_get_hsr(vcpu));
>  
>  		kvm_inject_vabt(vcpu);
> +	} else {
> +		hsr = kvm_vcpu_get_hsr(vcpu);
> +
> +		gfn = fault_ipa >> PAGE_SHIFT;
> +		memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +		hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
> +
> +		run->exit_reason = KVM_EXIT_INTR;
> +		run->intr.syndrome_info = hsr;
> +		run->intr.address = hva;
> +		ret = 0;
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> @@ -218,8 +233,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			*vcpu_pc(vcpu) -= adj;
>  		}
>  
> -		kvm_handle_guest_sei(vcpu, run);
> -		return 1;
> +		return kvm_handle_guest_sei(vcpu, run);
>  	}
>  
>  	exception_index = ARM_EXCEPTION_CODE(exception_index);
> @@ -228,8 +242,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	case ARM_EXCEPTION_IRQ:
>  		return 1;
>  	case ARM_EXCEPTION_EL1_SERROR:
> -		kvm_handle_guest_sei(vcpu, run);
> -		return 1;
> +		return kvm_handle_guest_sei(vcpu, run);
>  	case ARM_EXCEPTION_TRAP:
>  		/*
>  		 * See ARM ARM B1.14.1: "Hyp traps on instructions
> diff --git a/arch/arm64/kvm/hyp/switch.c b/arch/arm64/kvm/hyp/switch.c
> index aede165..ded6211 100644
> --- a/arch/arm64/kvm/hyp/switch.c
> +++ b/arch/arm64/kvm/hyp/switch.c
> @@ -86,6 +86,13 @@ static void __hyp_text __activate_traps(struct kvm_vcpu *vcpu)
>  		isb();
>  	}
>  	write_sysreg(val, hcr_el2);
> +    /* If virtual System Error or Asynchronous Abort is pending. set

nit: I think you want a comma after pending, not a dot.

> +     * the virtual exception syndrome information
> +     */

nit: commenting style

> +	if (cpus_have_cap(ARM64_HAS_RAS_EXTN) &&
> +			(vcpu->arch.hcr_el2 & HCR_VSE))
> +		write_sysreg_s(vcpu->arch.fault.vsesr_el2, VSESR_EL2);
> +
>  	/* Trap on AArch32 cp15 c15 accesses (EL1 or EL0) */
>  	write_sysreg(1 << 15, hstr_el2);
>  	/*
> @@ -139,9 +146,15 @@ static void __hyp_text __deactivate_traps(struct kvm_vcpu *vcpu)
>  	 * the crucial bit is "On taking a vSError interrupt,
>  	 * HCR_EL2.VSE is cleared to 0."
>  	 */
> -	if (vcpu->arch.hcr_el2 & HCR_VSE)
> +	if (vcpu->arch.hcr_el2 & HCR_VSE) {
>  		vcpu->arch.hcr_el2 = read_sysreg(hcr_el2);
>  
> +		if (cpus_have_cap(ARM64_HAS_RAS_EXTN)) {
> +			/* set vsesr_el2[24:0] with esr_el2[24:0] */
> +			kvm_vcpu_set_vsesr(vcpu, read_sysreg_el2(esr)
> +					& VSESR_ELx_IDS_ISS_MASK);
> +		}
> +	}
>  	__deactivate_traps_arch()();
>  	write_sysreg(0, hstr_el2);
>  	write_sysreg(0, pmuserenr_el0);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 27fe556..bb02909 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -360,6 +360,11 @@ struct kvm_run {
>  		struct {
>  			__u8 vector;
>  		} eoi;
> +		/* KVM_EXIT_INTR */
> +		struct {
> +			__u32 syndrome_info;
> +			__u64 address;
> +		} intr;

definitely, not.  KVM_EXIT_INTR is a generic exit code to tell userspace
that we exited because we needed to deliver a signal or something else
related to an asynchronous event.  This implies that the syndrome_info
etc. always has valid values on all architectures when exiting with
KVM_EXIT_INTR.

Either document the behavior as the syndrome_info has side-channel
information on every exit, or on some KVM_EXIT_INTR exits, as we explain
in the KVM_CAP_ARM_USER_IRQ ABI that was just added, or dedicate an
access code.

>  		/* KVM_EXIT_HYPERV */
>  		struct kvm_hyperv_exit hyperv;
>  		/* Fix the size of the union. */
> -- 
> 2.10.1
> 

I'll look at the details of such patches once the ABI is clear and
well-documented.

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
