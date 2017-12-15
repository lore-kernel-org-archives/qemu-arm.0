Received: by 10.223.159.74 with SMTP id f10csp650432wrg;
        Fri, 15 Dec 2017 08:58:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBovgONUbx0QgZwEOlnIoRDjX69eRwfclMXkl0EqGRSg1aJYnOJyd7lFpEc8b8idYGHmJ3gy1
X-Received: by 10.129.39.194 with SMTP id n185mr1325778ywn.143.1513357088540;
        Fri, 15 Dec 2017 08:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513357088; cv=none;
        d=google.com; s=arc-20160816;
        b=ykOqK93L2Xm7YmyATczfc7LX6pXk2f4kZNyxNH7mWtuUc49gXTGiPzj2+tUw+TW2hK
         9fQUYMw7dDxFlmLEkZS41xwP4jLqsJqhfAy74Hw2/I4jUAs+kjhKWWB49YlX1xFFoofc
         wCGZ+1chfSjutnFsR+LoOFUwPLsXjIuTngZbbg2DNKXMWB3PvXJXIvq9H7L857+L5nmZ
         GzaoNXEif8o0qLQQAaRApaa92RUN8ys8lRX/kuMPwBbBGjYh42WXmk1DyXenVggDnNok
         6pUMSVo5GJSVzo7bLXMZYjoSVqUEvtPeR1Q/4jqGVRie1zWXO4mvk992ljy7Nj5BcDSG
         RChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ncoH72xesuN7z7LR7tH1t+bnTRHwiRTZwQsDBRrN26c=;
        b=D9xBBW7u5KtTyL/rO5iXWNptlmukZM+dqbhveHxdy15mBrLa1FDwv0Lbusz3by60vy
         UEw/cc//+TI21PZP8qEt62+AuM/68Hd7agBFfAcgzk/hfPwGHCivyMVjQdqg/AtHIbIE
         itmeWzfEyzqk1Fc55In7SIh0I4/V6JAjUTB4j/BXoHHRZr7UUpjw4kpIPio2IvfUaE+a
         wVEETL4XDAltjOjx65D+tan3jL04v+At51lR/SfoJ0kcfCKyyeQWjTMF/ip5lmvW9Egb
         NbLoAzpCFj+Ey9+ZB3ykRJgZ8DdfFZ4ULWwlntIR2gHc3LiPna11JuSkWSa63y62oytc
         7KNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q+H3Ab4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si722821ywi.560.2017.12.15.08.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 08:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q+H3Ab4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePtJH-0003oF-VS
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 11:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePtJ8-0003n3-TY
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 11:58:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePtJ7-0008Nj-IW
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 11:57:58 -0500
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:44095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePtJ2-0008JL-DB; Fri, 15 Dec 2017 11:57:52 -0500
Received: by mail-qt0-x22f.google.com with SMTP id m59so12801924qte.11;
	Fri, 15 Dec 2017 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ncoH72xesuN7z7LR7tH1t+bnTRHwiRTZwQsDBRrN26c=;
	b=Q+H3Ab4OUTXMM09JLjjZnT00RggFiiSBg4m8QeKkZrCj5dWN4St3gz1NjiYGtgquOn
	ZZhGtVJSgKlNL6tTR02ezBI3Sz3XM5iwkAEsEknAhXqwZptcEgqjrN/P4HqraPjyu/oe
	7lgTAumlMuzKe0M4/EPmedxaG6nHELep7zEFDXpNi9pQQ//yJvxHJsSVEf3FQSUEAoyj
	lJmKpliorsYyzOzbWrnVHthhTYbNu/dNp7Hn+67/z1uPtNm/hYhvKkZfMIWbzoahkBrp
	AH6CovTdgJNoT3iYgsd947yurmMH20X8RpXaebl/u4hGIX8/CtUybtGEHm9ebjwmu2wK
	IQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ncoH72xesuN7z7LR7tH1t+bnTRHwiRTZwQsDBRrN26c=;
	b=ma1zLEAfX2nShUBMT1tmtJmm0NdHMxwFdMJlaDP93tTTPBVp3fQP0P+mCWZsXeWH59
	OaSou+X4SfHvakEQ12QVHcH5wXbSFESVDyWtNUR1buiL+oSDPtCgHo49a3XbmsqkD/Cb
	VSUx787wABM2M0Z0AIwJQvj2S9+SKOYbHsu9rCuHavbbsRsY84zD/Lh729pA9F2037tw
	7ly1eHDFD0KTYsgCHYFR20R3xsbsG56I8f7wOXd/UgBP3wb6hCgfFYxpNiKAXWcCXrS5
	Ouyunw61Iye8wUshgr+2xkQ8AQLEgq8Gg1aE2smYIkie0usNtkvZcGVzdJLeUQ1arPbZ
	mK9Q==
X-Gm-Message-State: AKGB3mKC8/OeuKLr0JpBJqSEPnwwr0UZ77m1HzdymWwst1eRmSmyTkot
	6C0ZBfz1XqIEBRkp4cjHj78=
X-Received: by 10.237.59.183 with SMTP id r52mr23094931qte.121.1513357071611; 
	Fri, 15 Dec 2017 08:57:51 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	m93sm4342062qte.21.2017.12.15.08.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 08:57:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1513355076-5075-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b72822ee-168c-818e-41af-5fcebac44ef2@amsat.org>
Date: Fri, 15 Dec 2017 13:57:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513355076-5075-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Handle page table
 walk load failures correctly
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
X-TUID: YoCyoPiJIOV4

On 12/15/2017 01:24 PM, Peter Maydell wrote:
> Instead of ignoring the response from address_space_ld*()
> (indicating an attempt to read a page table descriptor from
> an invalid physical address), use it to report the failure
> correctly.
> 
> Since this is another couple of locations where we need to
> decide the value of the ARMMMUFaultInfo ea bit based on a
> MemTxResult, we factor out that operation into a helper
> function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Now we've fixed the get-phys-addr functions to always report
> errors via the ARMMMUFaultInfo struct, it's pretty easy to
> detect and report external aborts on translation table walks.
> 
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/helper.c    | 39 ++++++++++++++++++++++++++++++++++-----
>  target/arm/op_helper.c |  7 +------
>  3 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 876854d..89f5d2f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -687,6 +687,16 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
>      return fsc;
>  }
>  
> +static inline bool arm_extabort_type(MemTxResult result)
> +{
> +    /* The EA bit in syndromes and fault status registers is an
> +     * IMPDEF classification of external aborts. ARM implementations
> +     * usually use this to indicate AXI bus Decode error (0) or
> +     * Slave error (1); in QEMU we follow that.
> +     */
> +    return result != MEMTX_DECODE_ERROR;
> +}
> +
>  /* Do a page table walk and add page to TLB if possible */
>  bool arm_tlb_fill(CPUState *cpu, vaddr address,
>                    MMUAccessType access_type, int mmu_idx,
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d1395f9..2575a83 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8305,6 +8305,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>          ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
>                                   &txattrs, &s2prot, &s2size, fi, NULL);
>          if (ret) {
> +            assert(fi->type != ARMFault_None);
>              fi->s2addr = addr;
>              fi->stage2 = true;
>              fi->s1ptw = true;
> @@ -8328,7 +8329,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>      MemTxAttrs attrs = {};
> +    MemTxResult result = MEMTX_OK;
>      AddressSpace *as;
> +    uint32_t data;
>  
>      attrs.secure = is_secure;
>      as = arm_addressspace(cs, attrs);
> @@ -8337,10 +8340,16 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>          return 0;
>      }
>      if (regime_translation_big_endian(env, mmu_idx)) {
> -        return address_space_ldl_be(as, addr, attrs, NULL);
> +        data = address_space_ldl_be(as, addr, attrs, &result);
>      } else {
> -        return address_space_ldl_le(as, addr, attrs, NULL);
> +        data = address_space_ldl_le(as, addr, attrs, &result);
>      }
> +    if (result == MEMTX_OK) {
> +        return data;
> +    }
> +    fi->type = ARMFault_SyncExternalOnWalk;
> +    fi->ea = arm_extabort_type(result);
> +    return 0;
>  }
>  
>  static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
> @@ -8349,7 +8358,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>      MemTxAttrs attrs = {};
> +    MemTxResult result = MEMTX_OK;
>      AddressSpace *as;
> +    uint32_t data;
>  
>      attrs.secure = is_secure;
>      as = arm_addressspace(cs, attrs);
> @@ -8358,10 +8369,16 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>          return 0;
>      }
>      if (regime_translation_big_endian(env, mmu_idx)) {
> -        return address_space_ldq_be(as, addr, attrs, NULL);
> +        data = address_space_ldq_be(as, addr, attrs, &result);
>      } else {
> -        return address_space_ldq_le(as, addr, attrs, NULL);
> +        data = address_space_ldq_le(as, addr, attrs, &result);
> +    }
> +    if (result == MEMTX_OK) {
> +        return data;
>      }
> +    fi->type = ARMFault_SyncExternalOnWalk;
> +    fi->ea = arm_extabort_type(result);
> +    return 0;
>  }
>  
>  static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
> @@ -8390,6 +8407,9 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
>      }
>      desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
>                         mmu_idx, fi);
> +    if (fi->type != ARMFault_None) {
> +        goto do_fault;
> +    }
>      type = (desc & 3);
>      domain = (desc >> 5) & 0x0f;
>      if (regime_el(env, mmu_idx) == 1) {
> @@ -8426,6 +8446,9 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
>          }
>          desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
>                             mmu_idx, fi);
> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
>          switch (desc & 3) {
>          case 0: /* Page translation fault.  */
>              fi->type = ARMFault_Translation;
> @@ -8508,6 +8531,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
>      }
>      desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
>                         mmu_idx, fi);
> +    if (fi->type != ARMFault_None) {
> +        goto do_fault;
> +    }
>      type = (desc & 3);
>      if (type == 0 || (type == 3 && !arm_feature(env, ARM_FEATURE_PXN))) {
>          /* Section translation fault, or attempt to use the encoding
> @@ -8559,6 +8585,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
>          table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
>          desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
>                             mmu_idx, fi);
> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
>          ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
>          switch (desc & 3) {
>          case 0: /* Page translation fault.  */
> @@ -8964,7 +8993,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          descaddr &= ~7ULL;
>          nstable = extract32(tableattrs, 4, 1);
>          descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
> -        if (fi->s1ptw) {
> +        if (fi->type != ARMFault_None) {
>              goto do_fault;
>          }
>  
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index c2bb4f3..2f35ff7 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -226,12 +226,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>          cpu_restore_state(cs, retaddr);
>      }
>  
> -    /* The EA bit in syndromes and fault status registers is an
> -     * IMPDEF classification of external aborts. ARM implementations
> -     * usually use this to indicate AXI bus Decode error (0) or
> -     * Slave error (1); in QEMU we follow that.
> -     */
> -    fi.ea = (response != MEMTX_DECODE_ERROR);
> +    fi.ea = arm_extabort_type(response);
>      fi.type = ARMFault_SyncExternal;
>      deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
>  }
> 
