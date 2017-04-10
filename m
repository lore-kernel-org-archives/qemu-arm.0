Received: by 10.25.0.144 with SMTP id 138csp767278lfa;
        Mon, 10 Apr 2017 01:42:43 -0700 (PDT)
X-Received: by 10.237.33.143 with SMTP id l15mr51188875qtc.222.1491813763142;
        Mon, 10 Apr 2017 01:42:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si12894341qkf.257.2017.04.10.01.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 01:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxUuG-00018P-BZ
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 04:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUu7-00016O-C0
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUu4-0002sZ-7n
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:42:31 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cxUu3-0002rv-Ut; Mon, 10 Apr 2017 04:42:28 -0400
Received: by mail-lf0-x241.google.com with SMTP id i3so4150366lfh.2;
	Mon, 10 Apr 2017 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nJHu/F8XPPyl1U8+lTdga1jwJPd0dx97onPf4sGp628=;
	b=JU+fInolbsazXiyV8uL9i4RQJVWJKa7xhkTG0Ta5x3Fl0Dj26lFSBhq0zdk9z5hVyD
	uaodkMCg4bgBqhAeRP/7cOTiMpBnuadluXaA1qTIsqK3izxm12YIO04mbs+yvOuQ2wTq
	cFaRp15R1CvNBWhXkLNJcvK6UMCBQrbd4zo8SSI3guxmX0DO+dsdoja4ZngexTnbbSpd
	SOUmkGDAPsAPGFaq6XdRK0IPuAQV1WoBdb3vObERsttQJgfiHBeCSTZSZFr+JWT4puNE
	uUq4wfOt+QvPS9szkPLyfuXgjlFRd5N8AFD2vbrCBsOHC9BFMgOSmJk35EFQ47Bebx8M
	csTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nJHu/F8XPPyl1U8+lTdga1jwJPd0dx97onPf4sGp628=;
	b=pR8NK9jkMkCl+XypxFeI4KDai0iuilrVSWLgQKV6963mCluSHKirAmQHYzrTJFtYM7
	cULGxdEJjh1fimnypn4zYMZN0wEjh3tdb3hNg/oyyWiuN6zptknc2WY+hNbgDIhjc4+1
	g/EFQFuvBXcPvXg89uZhmRvHQ/w0vnRAYVqzXejtZ5NLusLSpj2bGNEbAKT7K0D2mIH4
	cyON3y5VGPderQIm93yLMTdKtX87o6za/dJCVT33y6HeeH/h25cYmQaza7Y82uzev4FC
	4ozqT8LrgD2T3ma8ZYTfEfWIAFWBaHUv0OoroXGNc+383aAmJFzoce+j+cfHVUc/9tLI
	22LQ==
X-Gm-Message-State: AFeK/H3nT2gVEMkUeJlhxb2qSS/pl7oWK2NUd45bdSjWBMVW1mp8iyRDtDbL/yb1GGOl8Q==
X-Received: by 10.25.93.86 with SMTP id p22mr17285328lfj.9.1491813744803;
	Mon, 10 Apr 2017 01:42:24 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	o80sm2670814lff.25.2017.04.10.01.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 01:42:23 -0700 (PDT)
Date: Mon, 10 Apr 2017 10:42:22 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170410084222.GA19103@toto>
References: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Add assertion about
 FSC format for syndrome registers
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ii0s/1Fj/8Eb

On Thu, Apr 06, 2017 at 02:42:32PM +0100, Peter Maydell wrote:
> In tlb_fill() we construct a syndrome register value from a
> fault status register value which is filled in by arm_tlb_fill().
> arm_tlb_fill() returns FSR values which might be in the format
> used with short-format page descriptors, or the format used
> with long-format (LPAE) descriptors. The syndrome register
> always uses LPAE-format FSR status codes.
> 
> It isn't actually possible to end up delivering a syndrome
> register value to the guest for a fault which is reported
> with a short-format FSR (that kind of stage 1 fault will only
> happen for an AArch32 translation regime which doesn't have
> a syndrome register, and can never be redirected to an AArch64
> or Hyp exception level). Add an assertion which checks this,
> and adjust the code so that we construct a syndrome with
> an invalid status code, rather than allowing set bits in
> the FSR input to randomly corrupt other fields in the syndrome.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tricky but it looks correct as far as I can follow the specs...

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>




> ---
> It took me a little while to convince myself that you'd
> never take a short-format FSR to a using-syndrome EL :-)
> ---
>  target/arm/op_helper.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index d64c867..156b825 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -130,7 +130,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>      if (unlikely(ret)) {
>          ARMCPU *cpu = ARM_CPU(cs);
>          CPUARMState *env = &cpu->env;
> -        uint32_t syn, exc;
> +        uint32_t syn, exc, fsc;
>          unsigned int target_el;
>          bool same_el;
>  
> @@ -145,19 +145,32 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>              env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
>          }
>          same_el = arm_current_el(env) == target_el;
> -        /* AArch64 syndrome does not have an LPAE bit */
> -        syn = fsr & ~(1 << 9);
> +
> +        if (fsr & (1 << 9)) {
> +            /* LPAE format fault status register : bottom 6 bits are
> +             * status code in the same form as needed for syndrome
> +             */
> +            fsc = extract32(fsr, 0, 6);
> +        } else {
> +            /* Short format FSR : this fault will never actually be reported
> +             * to an EL that uses a syndrome register. Check that here,
> +             * and use a (currently) reserved FSR code in case the constructed
> +             * syndrome does leak into the guest somehow.
> +             */
> +            assert(target_el != 2 && !arm_el_is_aa64(env, target_el));
> +            fsc = 0x3f;
> +        }
>  
>          /* For insn and data aborts we assume there is no instruction syndrome
>           * information; this is always true for exceptions reported to EL1.
>           */
>          if (access_type == MMU_INST_FETCH) {
> -            syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
> +            syn = syn_insn_abort(same_el, 0, fi.s1ptw, fsc);
>              exc = EXCP_PREFETCH_ABORT;
>          } else {
>              syn = merge_syn_data_abort(env->exception.syndrome, target_el,
>                                         same_el, fi.s1ptw,
> -                                       access_type == MMU_DATA_STORE, syn);
> +                                       access_type == MMU_DATA_STORE, fsc);
>              if (access_type == MMU_DATA_STORE
>                  && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |= (1 << 11);
> -- 
> 2.7.4
> 
> 
