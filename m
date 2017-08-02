Received: by 10.25.44.15 with SMTP id s15csp60080lfs;
        Wed, 2 Aug 2017 14:52:46 -0700 (PDT)
X-Received: by 10.55.3.130 with SMTP id 124mr31066597qkd.31.1501710766545;
        Wed, 02 Aug 2017 14:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501710766; cv=none;
        d=google.com; s=arc-20160816;
        b=07GysF3dC9CqmlmeAjfl5++vppyzZgBIXr6mTDcjV1OcJxDMnx//TryV06IXB7l2Fi
         dMIUPL96/4GfyY2oMF7iW8OZS5T1zykm38hvp2jAvFEvq624PWhjhpjyvbwYpnV1CCak
         /JsTc3sCYrgDUiOZO0/BEpqVQD4qUFZh/xZj2NCmxGZHLwOcSL+2Txef0ix2GuAm8GF/
         k4WSIEuetuR0tpb8zaH3RylFpRbDuAkX7H4o/YJZwZmRWFPeV4KPiENH4pHGgDNUtKWl
         TgDAPueaVmEvM6CbF9X3wZA5Ws8Py7/bRCqiEO3nVDF0zvxuhwYbSHOJC3JRDs0o3dPb
         jgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=uM36W44eEre2ZYawEhXVgaKDvYhqrnowz49vzzxfH+Y=;
        b=tZUi+mTLuyohnLZYe0wNmR6I/0ieXPg6iHxrN3GN2XFpgyENODcyhXdF3ec6SOaxAi
         3Nmoe5SjBoojt/oNgwFGtp/q+zvWG4aXKKXrqvkPsxkCrQIXTgGNvEOiVWRKi5Ppemz8
         VedXj4rU1bPTqoB51Pmu3rWvAIe44tCEDRI5161uIoTn4hkktMjk3Vbvy6/yTaY1aN7T
         Gcl9LV1VIdNntvGD6cEAt86foTzQ8rf7uwLfI/tN+CGIR+DhqbKbddmDHtxPbINhUO7n
         OClBq+yWBuUsjQ0AbzgD1YUZ2jlacTnX34p/PW7elS2eRXIin6H+A9F52YuCBrHMC9d6
         wKCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pJgSDm03;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7si29411077qtg.133.2017.08.02.14.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 14:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pJgSDm03;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dd1ZL-0002Lm-Vk
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 17:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1ZF-0002IP-DQ
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1ZE-0002Sf-0A
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:52:37 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Z9-0002Pi-1H; Wed, 02 Aug 2017 17:52:31 -0400
Received: by mail-qk0-x244.google.com with SMTP id a77so5897056qkb.2;
	Wed, 02 Aug 2017 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uM36W44eEre2ZYawEhXVgaKDvYhqrnowz49vzzxfH+Y=;
	b=pJgSDm03EzHcZCpZmikxnTIR28gAxcEoy5g1pBECIpeyRGAMR8yuHI5a3xDxCdX1/I
	F7rC+NpCJ7NuG3q6440+8YFhQieR12B2Ty9cGN4yJVla64B5HIp3UiANVzuclgvSgT5P
	2hzqu8ti/JNEaWpuZ8mf2rU3nDU9spNF2LIc1RV6N6U+WkWPLFrdmbJpnDVQ2vsgJwoq
	U/I8PaA50ThIPKAbx8J3Wx0p3BS/ZhIyBbfV/RodEEJ068XLGjuZx6+FWely2tmT74em
	4NrAbAjFW69uwv71xVfUDhpoNZUHI/zsdM5oNAifDP9dHF+0X8OfQuB5S8KyWSDy3fbf
	yTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uM36W44eEre2ZYawEhXVgaKDvYhqrnowz49vzzxfH+Y=;
	b=cUOYpL3XutAAj4l+y6DStbwsV49t1OfvI2wF7Zn9R++Lm6si1xX4crTQjZoEGGf309
	wAZkTdMR9aKNgy+8Fz7f86UsUoY91p/GGYnJlC9Bm3Wot+fXhHcK5N93YUbcZBiz/HX4
	EZMtrXt9nH+ddHNrw0BIFP2X8r/q1PLXd34NTzqF7zaKHG5w/4HdLZv+D/CO/Q3ruA3c
	p8ZaTgnnxuwhn4+v9Nw2rStOSG1MuHzFXdr0QbmTQ7GN1fr8OfWft407TYmCTJCyS9wt
	vItPAQCGqFcYBS6FSjyfRr/hXopqpoP+OnuEzu53IM+IR5McvAOhK56fI/H01XJ4xJzb
	ZpYg==
X-Gm-Message-State: AIVw110pVvQcZ1qf0Uh7PdOQy2ZKZ69peBak9HjFC4t8C3Exla1uo68a
	w0TKiAuI1RqnOg==
X-Received: by 10.55.160.15 with SMTP id j15mr33893569qke.324.1501710750328;
	Wed, 02 Aug 2017 14:52:30 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	w46sm8855498qtc.16.2017.08.02.14.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 14:52:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ab516a18-25d3-11b8-7065-ce94c5cce7a7@amsat.org>
Date: Wed, 2 Aug 2017 18:52:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0UVqS2roJfb

On 08/02/2017 01:43 PM, Peter Maydell wrote:
> In the ARM get_phys_addr() code, switch to using the MMUAccessType
> enum and its MMU_* values rather than int and literal 0/1/2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c    | 30 +++++++++++++++---------------
>   target/arm/internals.h |  3 ++-
>   2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fa60040..b78d277 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -20,13 +20,13 @@
>   
>   #ifndef CONFIG_USER_ONLY
>   static bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                          int access_type, ARMMMUIdx mmu_idx,
> +                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                             target_ulong *page_size, uint32_t *fsr,
>                             ARMMMUFaultInfo *fi);
>   
>   static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> -                               int access_type, ARMMMUIdx mmu_idx,
> +                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                  hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
>                                  target_ulong *page_size_ptr, uint32_t *fsr,
>                                  ARMMMUFaultInfo *fi);
> @@ -2135,7 +2135,7 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>   }
>   
>   static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
> -                             int access_type, ARMMMUIdx mmu_idx)
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
>   {
>       hwaddr phys_addr;
>       target_ulong page_size;
> @@ -2194,7 +2194,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>   
>   static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>   {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>       uint64_t par64;
>       ARMMMUIdx mmu_idx;
>       int el = arm_current_el(env);
> @@ -2253,7 +2253,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>   static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>   {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>       uint64_t par64;
>   
>       par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
> @@ -2273,7 +2273,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
>   static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>   {
> -    int access_type = ri->opc2 & 1;
> +    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>       ARMMMUIdx mmu_idx;
>       int secure = arm_is_secure_below_el3(env);
>   
> @@ -7510,7 +7510,7 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>   }
>   
>   static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
> -                             int access_type, ARMMMUIdx mmu_idx,
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                hwaddr *phys_ptr, int *prot,
>                                target_ulong *page_size, uint32_t *fsr,
>                                ARMMMUFaultInfo *fi)
> @@ -7626,7 +7626,7 @@ do_fault:
>   }
>   
>   static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
> -                             int access_type, ARMMMUIdx mmu_idx,
> +                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                                target_ulong *page_size, uint32_t *fsr,
>                                ARMMMUFaultInfo *fi)
> @@ -7733,7 +7733,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
>           if (pxn && !regime_is_user(env, mmu_idx)) {
>               xn = 1;
>           }
> -        if (xn && access_type == 2)
> +        if (xn && access_type == MMU_INST_FETCH)
>               goto do_fault;
>   
>           if (arm_feature(env, ARM_FEATURE_V6K) &&
> @@ -7848,7 +7848,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>   }
>   
>   static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> -                               int access_type, ARMMMUIdx mmu_idx,
> +                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                  hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
>                                  target_ulong *page_size_ptr, uint32_t *fsr,
>                                  ARMMMUFaultInfo *fi)
> @@ -8256,7 +8256,7 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
>   }
>   
>   static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
> -                                 int access_type, ARMMMUIdx mmu_idx,
> +                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                    hwaddr *phys_ptr, int *prot, uint32_t *fsr)
>   {
>       ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -8415,7 +8415,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>   }
>   
>   static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
> -                                 int access_type, ARMMMUIdx mmu_idx,
> +                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                    hwaddr *phys_ptr, int *prot, uint32_t *fsr)
>   {
>       int n;
> @@ -8442,7 +8442,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>           return true;
>       }
>   
> -    if (access_type == 2) {
> +    if (access_type == MMU_INST_FETCH) {
>           mask = env->cp15.pmsav5_insn_ap;
>       } else {
>           mask = env->cp15.pmsav5_data_ap;
> @@ -8513,7 +8513,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>    * @fsr: set to the DFSR/IFSR value on failure
>    */
>   static bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                          int access_type, ARMMMUIdx mmu_idx,
> +                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
>                             target_ulong *page_size, uint32_t *fsr,
>                             ARMMMUFaultInfo *fi)
> @@ -8626,7 +8626,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>    * fsr with ARM DFSR/IFSR fault register format value on failure.
>    */
>   bool arm_tlb_fill(CPUState *cs, vaddr address,
> -                  int access_type, int mmu_idx, uint32_t *fsr,
> +                  MMUAccessType access_type, int mmu_idx, uint32_t *fsr,
>                     ARMMMUFaultInfo *fi)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1f6efef..bb06946 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -457,7 +457,8 @@ struct ARMMMUFaultInfo {
>   };
>   
>   /* Do a page table walk and add page to TLB if possible */
> -bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
> +bool arm_tlb_fill(CPUState *cpu, vaddr address,
> +                  MMUAccessType access_type, int mmu_idx,
>                     uint32_t *fsr, ARMMMUFaultInfo *fi);
>   
>   /* Return true if the stage 1 translation regime is using LPAE format page
> 
