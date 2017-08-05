Received: by 10.25.221.202 with SMTP id w71csp160553lfi;
        Fri, 4 Aug 2017 18:41:02 -0700 (PDT)
X-Received: by 10.55.106.197 with SMTP id f188mr5542403qkc.289.1501897261898;
        Fri, 04 Aug 2017 18:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501897261; cv=none;
        d=google.com; s=arc-20160816;
        b=O9vYKFC0lZvaRLirdNuqiPXnaqiauk2Eg3p47/e2b45yXF6WyFjNw7fpkhydCsTJ4g
         Ze/BmaiRpgGP5a3sZR3EO/gz9KArIelzVTXMTWWsvIrhDLH7FKADnn+l/xj+buvSx/oO
         ELGx478hVlvmXB7TOA8GgPx490MuHH7MBzueFcOtPBH1FzRixkY2UzPr8doLaTsPK+I/
         8xcHEMXOCtM+3zEjWgCKZ/W4Ri3RdWsTGxyVNnmZHDFm4koYGZU/iwiOQ51Lj9NGbZxO
         u1QGKLwctb37/2LpqxcxdI9AHAtOHjh3NoPN0H8OZWDxggpSdTq9ykWRnwVTA1g9dEny
         fy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=4Ob1ZNJX6zwrcDyVemkHUrYS6OwTCQgQYNGOhtu1F7c=;
        b=brwJq8z/zev5l47aru4ONMAj10RtBxJv1832pHEM+xXRjxrtk1TARblTSLVC/+OhAS
         kD91pgOMyjaw264auxUvjgPiZJaHRNotPj7/u9opXjHQNcPl61NvVi1cK2kgutIVw7Qk
         oLwgbVaKoeff7uDxFdzq6CEVhJVE+z4iPFDEkVmDmnW8udIbmrszp+i6izh/AlRlipjc
         mSjpYjm9ry6omwhI2h1oCm+HCfOrZf6qioou4jc7ZCrr4ZTha0x/V01/dRwa2eM6Mq9C
         QIETVzKwa9ZPjXSqlb8b3PjWDxNF6mP3YCF/LX/k5UOoph6aHD+YSPQzn1iNDiSv9GUw
         izvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=DvE19Dbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si2651824qkf.523.2017.08.04.18.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=DvE19Dbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddo5L-0004TK-4G
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:40:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo5E-0004Ss-Ij
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo5B-0003MD-7s
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:40:52 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddo5A-0003JR-EL; Fri, 04 Aug 2017 21:40:49 -0400
Received: by mail-lf0-x242.google.com with SMTP id w199so2035091lff.2;
	Fri, 04 Aug 2017 18:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4Ob1ZNJX6zwrcDyVemkHUrYS6OwTCQgQYNGOhtu1F7c=;
	b=DvE19DbeThknlfQkkuvNcXzE69/aQYrPwFzETFG7DTcOeosnMHzkNEU6wb7C1izInN
	m5DlIh7jmvEcB5Cb4iIBwYi5r256eTXe933q2zIETBzS5S62mLs0sKrmYPPx09FTkgRl
	lQvDvf9eGsu38zx93XuK/WAaREeIb3s6Z52ipvCQvBl71F+Mx7aWFGQrwYiOReQik9Vn
	0XE3vJXGcGVgp5xCg+sby5LjUEMeVn3zbt/Glgag0Wrl+EGR0ukoLLdp5KaHA3WXcjzL
	6uKXP1rLQUZHTg5OsJFomfHXglmzGSYI2Ud80UhTb9Rwobb9RuTHAC63o7Uvy/3HWfUN
	Brbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4Ob1ZNJX6zwrcDyVemkHUrYS6OwTCQgQYNGOhtu1F7c=;
	b=mEd3fLwWiTOnTSip2l3Ghe7ST4IQFL2HIb4+87O5DJVFIWjEl6YkdsPNA9+FFDzCFz
	LRmMgo7YhA0Q5ORw5ADrytxG4lrCut0kiTgPXxUdExbq2l2IyJxZ9DnqvXZpyBJmEikr
	KvW3+lFRPvIHVK/WOk/MObPN9n6fS/23lKGoselyDq68G41UO4m84B4I/M4qha6T9Wu8
	4NKOYcPKE+ynthoOgIFs3M2A4+/dDxtTYBXv/uME++TWkySoGkASkIvbhjODgh54gLsQ
	8eqOCfuJfKER0V+GANZFkeeIQMf1Mm+RdLdtVtjN/iFT7Wj5lKiPKZ9EXLrqlhwuf5KW
	jKUw==
X-Gm-Message-State: AHYfb5hVdHS2kbZyK8uSwryjiDSfV3laa54OfnxjEwENJnMWG3NBz9HE
	Gw7E9/BZAv+VYA==
X-Received: by 10.46.81.25 with SMTP id f25mr1263681ljb.165.1501897246907;
	Fri, 04 Aug 2017 18:40:46 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id n80sm813580lfb.14.2017.08.04.18.40.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:40:45 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:40:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805014045.GE4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 6/8] target/arm: Factor out fault delivery
 code
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
X-TUID: JH6pEvdLk0IN

On Fri, Aug 04, 2017 at 06:20:47PM +0100, Peter Maydell wrote:
> We currently have some similar code in tlb_fill() and in
> arm_cpu_do_unaligned_access() for delivering a data abort or prefetch
> abort.  We're also going to want to do the same thing to handle
> external aborts.  Factor out the common code into a new function
> deliver_fault().

I found this a bit hard to read but I think it looks OK :-)
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/op_helper.c | 110 +++++++++++++++++++++++++------------------------
>  1 file changed, 57 insertions(+), 53 deletions(-)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 2a85666..aa52a98 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -115,6 +115,51 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>      return syn;
>  }
>  
> +static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
> +                          uint32_t fsr, uint32_t fsc, ARMMMUFaultInfo *fi)
> +{
> +    CPUARMState *env = &cpu->env;
> +    int target_el;
> +    bool same_el;
> +    uint32_t syn, exc;
> +
> +    target_el = exception_target_el(env);
> +    if (fi->stage2) {
> +        target_el = 2;
> +        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
> +    }
> +    same_el = (arm_current_el(env) == target_el);
> +
> +    if (fsc == 0x3f) {
> +        /* Caller doesn't have a long-format fault status code. This
> +         * should only happen if this fault will never actually be reported
> +         * to an EL that uses a syndrome register. Check that here.
> +         * 0x3f is a (currently) reserved FSR code, in case the constructed
> +         * syndrome does leak into the guest somehow.
> +         */
> +        assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
> +    }
> +
> +    if (access_type == MMU_INST_FETCH) {
> +        syn = syn_insn_abort(same_el, 0, fi->s1ptw, fsc);
> +        exc = EXCP_PREFETCH_ABORT;
> +    } else {
> +        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
> +                                   same_el, fi->s1ptw,
> +                                   access_type == MMU_DATA_STORE,
> +                                   fsc);
> +        if (access_type == MMU_DATA_STORE
> +            && arm_feature(env, ARM_FEATURE_V6)) {
> +            fsr |= (1 << 11);
> +        }
> +        exc = EXCP_DATA_ABORT;
> +    }
> +
> +    env->exception.vaddress = addr;
> +    env->exception.fsr = fsr;
> +    raise_exception(env, exc, syn, target_el);
> +}
> +
>  /* try to fill the TLB and return an exception if error. If retaddr is
>   * NULL, it means that the function was called in C code (i.e. not
>   * from generated code or from helper.c)
> @@ -129,23 +174,13 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>      ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
>      if (unlikely(ret)) {
>          ARMCPU *cpu = ARM_CPU(cs);
> -        CPUARMState *env = &cpu->env;
> -        uint32_t syn, exc, fsc;
> -        unsigned int target_el;
> -        bool same_el;
> +        uint32_t fsc;
>  
>          if (retaddr) {
>              /* now we have a real cpu fault */
>              cpu_restore_state(cs, retaddr);
>          }
>  
> -        target_el = exception_target_el(env);
> -        if (fi.stage2) {
> -            target_el = 2;
> -            env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
> -        }
> -        same_el = arm_current_el(env) == target_el;
> -
>          if (fsr & (1 << 9)) {
>              /* LPAE format fault status register : bottom 6 bits are
>               * status code in the same form as needed for syndrome
> @@ -153,34 +188,15 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>              fsc = extract32(fsr, 0, 6);
>          } else {
>              /* Short format FSR : this fault will never actually be reported
> -             * to an EL that uses a syndrome register. Check that here,
> -             * and use a (currently) reserved FSR code in case the constructed
> -             * syndrome does leak into the guest somehow.
> +             * to an EL that uses a syndrome register. Use a (currently)
> +             * reserved FSR code in case the constructed syndrome does leak
> +             * into the guest somehow. deliver_fault will assert that
> +             * we don't target an EL using the syndrome.
>               */
> -            assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
>              fsc = 0x3f;
>          }
>  
> -        /* For insn and data aborts we assume there is no instruction syndrome
> -         * information; this is always true for exceptions reported to EL1.
> -         */
> -        if (access_type == MMU_INST_FETCH) {
> -            syn = syn_insn_abort(same_el, 0, fi.s1ptw, fsc);
> -            exc = EXCP_PREFETCH_ABORT;
> -        } else {
> -            syn = merge_syn_data_abort(env->exception.syndrome, target_el,
> -                                       same_el, fi.s1ptw,
> -                                       access_type == MMU_DATA_STORE, fsc);
> -            if (access_type == MMU_DATA_STORE
> -                && arm_feature(env, ARM_FEATURE_V6)) {
> -                fsr |= (1 << 11);
> -            }
> -            exc = EXCP_DATA_ABORT;
> -        }
> -
> -        env->exception.vaddress = addr;
> -        env->exception.fsr = fsr;
> -        raise_exception(env, exc, syn, target_el);
> +        deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
>      }
>  }
>  
> @@ -191,9 +207,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> -    int target_el;
> -    bool same_el;
> -    uint32_t syn;
> +    uint32_t fsr, fsc;
> +    ARMMMUFaultInfo fi = {};
>      ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
>  
>      if (retaddr) {
> @@ -201,28 +216,17 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>          cpu_restore_state(cs, retaddr);
>      }
>  
> -    target_el = exception_target_el(env);
> -    same_el = (arm_current_el(env) == target_el);
> -
> -    env->exception.vaddress = vaddr;
> -
>      /* the DFSR for an alignment fault depends on whether we're using
>       * the LPAE long descriptor format, or the short descriptor format
>       */
>      if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
> -        env->exception.fsr = (1 << 9) | 0x21;
> +        fsr = (1 << 9) | 0x21;
>      } else {
> -        env->exception.fsr = 0x1;
> -    }
> -
> -    if (access_type == MMU_DATA_STORE && arm_feature(env, ARM_FEATURE_V6)) {
> -        env->exception.fsr |= (1 << 11);
> +        fsr = 0x1;
>      }
> +    fsc = 0x21;
>  
> -    syn = merge_syn_data_abort(env->exception.syndrome, target_el,
> -                               same_el, 0, access_type == MMU_DATA_STORE,
> -                               0x21);
> -    raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
> +    deliver_fault(cpu, vaddr, access_type, fsr, fsc, &fi);
>  }
>  
>  #endif /* !defined(CONFIG_USER_ONLY) */
> -- 
> 2.7.4
> 
> 
