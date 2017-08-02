Received: by 10.25.44.15 with SMTP id s15csp6397510lfs;
        Wed, 2 Aug 2017 10:27:22 -0700 (PDT)
X-Received: by 10.55.19.13 with SMTP id d13mr30090208qkh.214.1501694842397;
        Wed, 02 Aug 2017 10:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501694842; cv=none;
        d=google.com; s=arc-20160816;
        b=OLR4gfdEvrbJvcF0YDeHf6+1iV1nnnozNEZ9H3Z8bTp3V3LrQ/uN5tBt52yVPbbn5N
         lHPQuf1HMQzH03WKnWvB+kSXFNgEIYo7j3m3NhVS7bT3q4yX7WWzxM92j4Y/M8MezkeP
         fi6AMLMRf1A7MwG/Mx2/PxL/BMoWCcOAXteMdu3fg8i0jdOdlxT50/bPssq+6DGp6q73
         iLSGjdaymcWf8KAb6nDhvm7M4J4JJxnYFbMnxopdxNQVBVdBK3HXIPae3IfV52E1rjTd
         hnRRjkYddkUn0zS6rNR9LmdNkWbj7K4jNf2Fubyjc8/WsQuArAy+sERD7D3hJbAMq4+i
         ZetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=CSxRkAWBnoJnEdDqBNplkkRVjaqbDpKrNabk5QDXD98=;
        b=YQ7Ncr0Cl3RPtWdhhZ3t9FAqqzDI99jFqryO3wVnQ8CpS0MIuLW4MnX0fOhJwpMk+k
         HzMETwS3EepBzNtf+0DsuZjRSHyvxvvFx5tK6xn8eGHXTYTliKoDRqwE1nLlVrn1poTa
         DEut7+pPyA1WY0hKQa89PAblDbUiz861JDtTIgWFl5LLuYj7qBZZ0ETcErm4kLhCilEd
         +etrAQm+j7lx6c4JT87Jv3yUiTbuUyPI0NecsIko8Fdf1DIgSgsbnFXcCL9dVpL3beHe
         RYIAfwVw69Bhem9XvmkxL8XsaQYMKqNwol7Q1RJvL/qUI52RnOHbM0r03n3GQnnxxnBR
         85Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=q926By+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si4619828qkf.310.2017.08.02.10.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 10:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=q926By+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcxQV-0004qA-O5
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 13:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxQQ-0004oZ-GX
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxQM-0000kE-GD
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:27:14 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:38336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcxQM-0000gu-4E; Wed, 02 Aug 2017 13:27:10 -0400
Received: by mail-lf0-x244.google.com with SMTP id y15so4179429lfd.5;
	Wed, 02 Aug 2017 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CSxRkAWBnoJnEdDqBNplkkRVjaqbDpKrNabk5QDXD98=;
	b=q926By+wz+hJpDf4Q5x8Yba+H/mJdFn0Qy9YUbvD6khWj9+YsAtBoTkdHeYTGi6RZT
	2yiBKDIhyT08hZ8Ix88Q+cpeH1D2HFQKTBuWUsRmMiP/xfItDg2K2VrKEBz0XwTka5eT
	1aBpJtMKaMj8M9bmUzkmjgKq6nDdvb7Tw18HmN2n697tU9N+SSUlrv590Kgm3N/rGxl1
	T0kH1+2IECBN6MRRQn4b/4ZUlg9t6Fj3buVcS1xzKj9if8+H6mp0hhWIlLnp4Ql3Eu6b
	f/BX8V4Gviprt3d+FQI4MHDsVmya0zcX03zM3RpRFggw3nEaId2ghCEmq0Re0aoVm4Ee
	IfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CSxRkAWBnoJnEdDqBNplkkRVjaqbDpKrNabk5QDXD98=;
	b=WYQXUpB67yRsX1FVxYwYuz9J9MY8onps0Rnqm/tbvZ4ieVlK9yC2iTFJrNUsc6rH6K
	xzlI1HfbrNnNLnbicSK63I5ZH+sLjqV2KsPIfM0rta6VsMpYPAaAxLBrlxDAafjHcdHD
	BUBVqUpBqFlYMf76eg7pHzkZ9EyxLbJIfAF5siHoWj/xxVkOYER+FWoXneF94z1rJBYv
	Ukv1rKBlnYfS6pFjQHdy90D2btEGBPNjt9clRobxv0wnASmX27p0hrNe6RVqcPxt4E1o
	JpKOuPiiA5LxQaHywP+DzVF+igzntLv4UziVuyH27E843+xbX6NLAQUIj1hjo5bBP4Ya
	pA4w==
X-Gm-Message-State: AIVw110aK1Om5llW7sOhbq5bDBO86icWnPVKFr/Gxr9BFP8UM6DY4GPD
	6fcgV130vZ3PBw==
X-Received: by 10.46.20.22 with SMTP id u22mr5048005ljd.58.1501694826830;
	Wed, 02 Aug 2017 10:27:06 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	m124sm6319027lfg.5.2017.08.02.10.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:27:05 -0700 (PDT)
Date: Wed, 2 Aug 2017 19:27:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170802172705.GG4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 01/15] target/arm: Use MMUAccessType enum
 rather than int
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHJg5b1qjQ20

On Wed, Aug 02, 2017 at 05:43:47PM +0100, Peter Maydell wrote:
> In the ARM get_phys_addr() code, switch to using the MMUAccessType
> enum and its MMU_* values rather than int and literal 0/1/2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c    | 30 +++++++++++++++---------------
>  target/arm/internals.h |  3 ++-
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fa60040..b78d277 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -20,13 +20,13 @@
>  
>  #ifndef CONFIG_USER_ONLY
>  static bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                          int access_type, ARMMMUIdx mmu_idx,
> +                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                            hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                            target_ulong *page_size, uint32_t *fsr,
>                            ARMMMUFaultInfo *fi);
>  
>  static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> -                               int access_type, ARMMMUIdx mmu_idx,
> +                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                 hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
>                                 target_ulong *page_size_ptr, uint32_t *fsr,
>                                 ARMMMUFaultInfo *fi);
> @@ -2135,7 +2135,7 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>  }
>  
>  static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
> -                             int access_type, ARMMMUIdx mmu_idx)
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
>  {
>      hwaddr phys_addr;
>      target_ulong page_size;
> @@ -2194,7 +2194,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>  
>  static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>      uint64_t par64;
>      ARMMMUIdx mmu_idx;
>      int el = arm_current_el(env);
> @@ -2253,7 +2253,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>      uint64_t par64;
>  
>      par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
> @@ -2273,7 +2273,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>      ARMMMUIdx mmu_idx;
>      int secure = arm_is_secure_below_el3(env);
>  
> @@ -7510,7 +7510,7 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>  }
>  
>  static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
> -                             int access_type, ARMMMUIdx mmu_idx,
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                               hwaddr *phys_ptr, int *prot,
>                               target_ulong *page_size, uint32_t *fsr,
>                               ARMMMUFaultInfo *fi)
> @@ -7626,7 +7626,7 @@ do_fault:
>  }
>  
>  static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
> -                             int access_type, ARMMMUIdx mmu_idx,
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                               hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                               target_ulong *page_size, uint32_t *fsr,
>                               ARMMMUFaultInfo *fi)
> @@ -7733,7 +7733,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
>          if (pxn && !regime_is_user(env, mmu_idx)) {
>              xn = 1;
>          }
> -        if (xn && access_type == 2)
> +        if (xn && access_type == MMU_INST_FETCH)
>              goto do_fault;
>  
>          if (arm_feature(env, ARM_FEATURE_V6K) &&
> @@ -7848,7 +7848,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>  }
>  
>  static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> -                               int access_type, ARMMMUIdx mmu_idx,
> +                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                 hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
>                                 target_ulong *page_size_ptr, uint32_t *fsr,
>                                 ARMMMUFaultInfo *fi)
> @@ -8256,7 +8256,7 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
>  }
>  
>  static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
> -                                 int access_type, ARMMMUIdx mmu_idx,
> +                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                   hwaddr *phys_ptr, int *prot, uint32_t *fsr)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -8415,7 +8415,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>  }
>  
>  static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
> -                                 int access_type, ARMMMUIdx mmu_idx,
> +                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                   hwaddr *phys_ptr, int *prot, uint32_t *fsr)
>  {
>      int n;
> @@ -8442,7 +8442,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>          return true;
>      }
>  
> -    if (access_type == 2) {
> +    if (access_type == MMU_INST_FETCH) {
>          mask = env->cp15.pmsav5_insn_ap;
>      } else {
>          mask = env->cp15.pmsav5_data_ap;
> @@ -8513,7 +8513,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>   * @fsr: set to the DFSR/IFSR value on failure
>   */
>  static bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                          int access_type, ARMMMUIdx mmu_idx,
> +                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                            hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                            target_ulong *page_size, uint32_t *fsr,
>                            ARMMMUFaultInfo *fi)
> @@ -8626,7 +8626,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>   * fsr with ARM DFSR/IFSR fault register format value on failure.
>   */
>  bool arm_tlb_fill(CPUState *cs, vaddr address,
> -                  int access_type, int mmu_idx, uint32_t *fsr,
> +                  MMUAccessType access_type, int mmu_idx, uint32_t *fsr,
>                    ARMMMUFaultInfo *fi)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1f6efef..bb06946 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -457,7 +457,8 @@ struct ARMMMUFaultInfo {
>  };
>  
>  /* Do a page table walk and add page to TLB if possible */
> -bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
> +bool arm_tlb_fill(CPUState *cpu, vaddr address,
> +                  MMUAccessType access_type, int mmu_idx,
>                    uint32_t *fsr, ARMMMUFaultInfo *fi);
>  
>  /* Return true if the stage 1 translation regime is using LPAE format page
> -- 
> 2.7.4
> 
> 
