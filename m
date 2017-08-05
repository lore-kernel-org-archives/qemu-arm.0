Received: by 10.25.221.202 with SMTP id w71csp163244lfi;
        Fri, 4 Aug 2017 18:45:12 -0700 (PDT)
X-Received: by 10.237.42.88 with SMTP id k24mr6101439qtf.58.1501897512783;
        Fri, 04 Aug 2017 18:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501897512; cv=none;
        d=google.com; s=arc-20160816;
        b=oc72m329NrNOgf9yRoo4EfgNvM5flp+JJeviyxV+JVwugtkcSQL7NdruxCCHzIgLmz
         rJ5zsE1mZ+A6d0y3H5ADJe6sJx2DZy0qPHWTZqNMKQuRo64oXwws2Uu/LMLqX39JeQBz
         KZNpT3B+l89+tkd+rxn+6D3tXpSBrE7Pqq+FrOBBEe6sBQYkweqr1buFcYlc/Ujs8ZCM
         /csSammaEk+HiaGIJ8OYYKmDYTSPFAk8WPvz8ctZcZU0QtFa4+Ta7TMZot/qGhRAcbLG
         /qljzKfiEyzcdf3Di948H0F2WEWi9fpDbJETPHK9BKChG+GMZFJVaHSTaW2fxFGFMhlB
         A6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=5X6y92SuGvQKAv9UzbJBk6xCv/wcmROYhpdhQqDcO1Q=;
        b=SJFbuNr53OIALpLxxNjX1hc42fYLgzuVvwMDw4DKG07uZkSBWi8//frPmlTJSWqPUu
         8mB9/gHkw1MnEElLqEfckKOOvFNRBtd4wbRVaUoDQodDid2kSXGSgBDgfA8HDaIE5ePp
         e8Qen+ahZ1px41FPsklBRAv9bLynZnoViIq+4WTp9Lquv5+58UNikMlreZJgiXg2urQv
         +qWTZAGpLikrTCHy6u9Dc3O4dgO2JNQthsxmEEaGe0R3drryIZG101dhveBf9ALTV3h3
         cc/eqwWlUoCyfJqT/Ocf7UGADCRyDpKeDpqCEG6FDICYM7ADv+lDZKMJK1PHLuSJULGE
         RVLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=iKnGDb4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65si2653928qkf.384.2017.08.04.18.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=iKnGDb4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddo9O-0005eU-5D
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo9H-0005b3-GE
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo9C-0006rZ-S1
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:45:03 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:38436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddo9C-0006r4-Gk; Fri, 04 Aug 2017 21:44:58 -0400
Received: by mail-lf0-x242.google.com with SMTP id y15so2030569lfd.5;
	Fri, 04 Aug 2017 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5X6y92SuGvQKAv9UzbJBk6xCv/wcmROYhpdhQqDcO1Q=;
	b=iKnGDb4rQz9FejaEDb1HngPONnft4NDFE4qMgcqqbfL4iVnMZ/8SwSUh1T0Ae2G0SH
	uH1vvd+qBDMzXgfCT1eFxsGCrOmNGSKPDpDfJ0IiLRnt/pKwnMdBBZ25sM/S356b0mYT
	A02IboPRE32BfFDliN7lgsLeb9KdddkQhzdPWBWPadZAJVV6b7HUbXDwiLkJusWc2Oi8
	DzDhgFZOialULWllTZxpdiddVSzpEXgnvAE0FHANMFqXvWS1mqAX/kPsqRcFyZbFA2jX
	d5ld3c04SD76ZurjN0d4Umw+rioqC2kDf2jpT1pXbI2hxcRmVwRFeyZ6Y3pw0TD9O+CR
	wHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5X6y92SuGvQKAv9UzbJBk6xCv/wcmROYhpdhQqDcO1Q=;
	b=qt62k6hC/taP1YT3thT4e9usmJV59pcXz0ECh2Zj5T9nbc8O0Z3Svmu8nm/b9weXGE
	oCsj2IYVFATM8gmw/Z/rt1xWayTZ5rjm3G/r2dgwA82k8pCwUeMk3XZYTjfPG4d/rays
	kcOnMpxvzZ/eIq48VAS4lahrh5VRUb5PeEIUSupNRJv7xjlvPiBWUAJn/4WgtGgl0tdC
	NCSwLXhWcm3xaQsoHaAchISV7s5PcEifdvnUxGz3t+BSSLE44r188/Nax3jLsbxmQ+T0
	V4RBvwgcV914SZPVKYQG9IQduBypkRzhuZ8CYCJnmS0lixryUc0knB/Ipa+FL5So9upH
	isXg==
X-Gm-Message-State: AHYfb5jv0+6gvPcC3dIdJPjEjjr31SeBSlc9kpyhgfw52rJjOaIgpY2I
	cK5RmpW6czETyQ==
X-Received: by 10.46.20.22 with SMTP id u22mr1300188ljd.58.1501897497114;
	Fri, 04 Aug 2017 18:44:57 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 2sm972042lji.5.2017.08.04.18.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:44:56 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:44:55 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805014455.GF4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 8/8] target/arm: Implement new
 do_transaction_failed hook
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJAH2liJFs43

On Fri, Aug 04, 2017 at 06:20:49PM +0100, Peter Maydell wrote:
> Implement the new do_transaction_failed hook for ARM, which should
> cause the CPU to take a prefetch abort or data abort.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/cpu.c       |  1 +
>  target/arm/op_helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index a3adbd8..13bb001 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -471,6 +471,16 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
>  
> +/* arm_cpu_do_transaction_failed: handle a memory system error response
> + * (eg "no device/memory present at address") by raising an external abort
> + * exception
> + */
> +void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> +                                   vaddr addr, unsigned size,
> +                                   MMUAccessType access_type,
> +                                   int mmu_idx, MemTxAttrs attrs,
> +                                   MemTxResult response, uintptr_t retaddr);
> +
>  /* Call the EL change hook if one has been registered */
>  static inline void arm_call_el_change_hook(ARMCPU *cpu)
>  {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 05c038b..6baede0 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1670,6 +1670,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #else
>      cc->do_interrupt = arm_cpu_do_interrupt;
>      cc->do_unaligned_access = arm_cpu_do_unaligned_access;
> +    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
>      cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
>      cc->asidx_from_attrs = arm_asidx_from_attrs;
>      cc->vmsd = &vmstate_arm_cpu;
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 7eac272..54b6dd8 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -229,6 +229,49 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      deliver_fault(cpu, vaddr, access_type, fsr, fsc, &fi);
>  }
>  
> +/* arm_cpu_do_transaction_failed: handle a memory system error response
> + * (eg "no device/memory present at address") by raising an external abort
> + * exception
> + */
> +void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> +                                   vaddr addr, unsigned size,
> +                                   MMUAccessType access_type,
> +                                   int mmu_idx, MemTxAttrs attrs,
> +                                   MemTxResult response, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    uint32_t fsr, fsc;
> +    ARMMMUFaultInfo fi = {};
> +    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
> +
> +    if (retaddr) {
> +        /* now we have a real cpu fault */
> +        cpu_restore_state(cs, retaddr);
> +    }
> +
> +    /* The EA bit in syndromes and fault status registers is an
> +     * IMPDEF classification of external aborts. ARM implementations
> +     * usually use this to indicate AXI bus Decode error (0) or
> +     * Slave error (1); in QEMU we follow that.
> +     */
> +    fi.ea = (response != MEMTX_DECODE_ERROR);
> +
> +    /* The fault status register format depends on whether we're using
> +     * the LPAE long descriptor format, or the short descriptor format.
> +     */
> +    if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
> +        /* long descriptor form, STATUS 0b010000: synchronous ext abort */
> +        fsr = (fi.ea << 12) | (1 << 9) | 0x10;
> +    } else {
> +        /* short descriptor form, FSR 0b01000 : synchronous ext abort */
> +        fsr = (fi.ea << 12) | 0x8;
> +    }
> +    fsc = 0x10;
> +
> +    deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
> +}
> +
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  
>  uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
> -- 
> 2.7.4
> 
> 
