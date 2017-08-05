Received: by 10.25.221.202 with SMTP id w71csp164220lfi;
        Fri, 4 Aug 2017 18:46:43 -0700 (PDT)
X-Received: by 10.200.44.13 with SMTP id d13mr5649700qta.192.1501897603372;
        Fri, 04 Aug 2017 18:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501897603; cv=none;
        d=google.com; s=arc-20160816;
        b=QzURWmuuQgC1yMb62s1PMqm2cTZsK3yakwVtNGvYE7YEIMQuE8ZObayEC8+lPriFmp
         w0JBCrSBRIWbyasIE22j2/bIDnzghYl+c8c82NybREu9UE7SnCc2dWLSpm9fZLNZVjVz
         PBh/RkxR6wB10MFTw07rhrFDVq3pF0ZfPlpnzf0YXI/XJli1uMaobCqUcWoHc/0ZazxE
         RyT6iuU/FkqKJ9J0LZo+7tkB58NVToUGA03og0047t+FfWy23nu67mFD5TIUTucmNAti
         0QkEOpmzmLEL3V1m1zLFzq9QOTfOk4P5UfTkF2muoooYKF2dOqrnEBxAqur+SQXh3KvB
         UqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=kCBZXtKMH/pRVNQuA5KOru3ZCwws27J5QZ6rSHn29LM=;
        b=CT4re9x0LniGopVXRV7Il78CgIAVccqDskoDSNsQ9JA0f+eLtFmskfTEsZMg6zuxkl
         XKHRPWTsrmgB5v3iN7h9OYl0Y4DON3i+xuhZtUL6Ys31Rb7F+Ci7tK3+8a43loEbPiZQ
         pygDkOu8n/dpt/woVpFkf6ZWk3kYuttoT3Fp23Gn2q6WCWOJoLqqKJrJhuxn7Xq1xWpD
         h/q5iJyKOw1YF4iINyWx5WCuWpQAop/iUqFt1/MWxYWrlmYNefGgdmaZE5nXpTHRxlNB
         z0Ald39/6J/k4mIP8GfPl8EDK90/yk8tdJ2YKaTjAHz5hiske+ZYeuOZDhDYHdQN8Iwk
         MeNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=iNaUZznb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si2596652qkj.540.2017.08.04.18.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=iNaUZznb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddoAq-00078E-Jz
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:46:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo9V-0006FO-87
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 21:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddo9U-0007Ef-Fw
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 21:45:17 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:32946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddo9O-00073n-CK; Fri, 04 Aug 2017 21:45:10 -0400
Received: by mail-lf0-x243.google.com with SMTP id 65so2050366lfa.0;
	Fri, 04 Aug 2017 18:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kCBZXtKMH/pRVNQuA5KOru3ZCwws27J5QZ6rSHn29LM=;
	b=iNaUZznb7MXSu9/+On6vvH3ehXAR/CxH3SXczjnFCbSRb5TzTHEDjd38O5MD8c4Xnv
	FezQxin4/5lGh5jIQmlSsH20qQ4v8xNVOguuFy/ZrWQRO19xQsian205kfzv3Wzf7aUB
	28VJieXLQwaNzDAXfQVoh1TX27Jd2uPvEn/G2y7anLUXYlsBa0zGZZU/Qfl/MSvFl4SL
	1zffQ2Yb7KDH+8f9IV56GJkESqGtQd0InfFQF3VKiS+A7KJ7XOOUaWrZCFHtwMnpn9rX
	vwWpO/g/ZoRfplw9ereP0k4EzpSqHWrThBBG5hvZSZM2ydPByAUUZHGL6d9DNbSlP/0A
	ZW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kCBZXtKMH/pRVNQuA5KOru3ZCwws27J5QZ6rSHn29LM=;
	b=M1lCl0ziAM5Yz+XkP4+OJrJJVzuT4be7VoF091keIbmP5ju1vBTVNh9ZRJDZFxFJT0
	H2JzrwmMLbuDvi2SBWtigr+6DAD8NRjy9Hq1vyvpalWAwteMkcMm7nsXFURpiCMIhIrO
	Vxi4F9lSXwb+IBPXqfr5E3o9yFOcrBRebwoFWg/0c08z4czIUA6cQLUyuEJ3fKdTdWq8
	iZADeFyP2BfXKc1XnPy5vVrsvIul7mna1Hi3ewCEXQ85Y1e7V5ww9nWzeGGidi1KGrAq
	pc8sc6cqwp8MLLqjsSNC3oHNp6I7YL51sLK4ycqGuYfVHgNkT8fnAehuInxm5QAIOWHE
	V40w==
X-Gm-Message-State: AHYfb5gam9/i8DUst4KRWO9zNzTssWJhpmDgwnWdLNkzBvwiHnVM+54R
	ZAeSGoemQVlc5RQR
X-Received: by 10.25.56.3 with SMTP id f3mr1156575lfa.253.1501897508966;
	Fri, 04 Aug 2017 18:45:08 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 14sm1374074ljv.62.2017.08.04.18.45.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:45:08 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:45:07 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805014507.GG4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 7/8] target/arm: Allow
 deliver_fault() caller to specify EA bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /uvoT6fmGID3

On Fri, Aug 04, 2017 at 06:20:48PM +0100, Peter Maydell wrote:
> For external aborts, we will want to be able to specify the EA
> (external abort type) bit in the syndrome field.  Allow callers of
> deliver_fault() to do that by adding a field to ARMMMUFaultInfo which
> we use when constructing the syndrome values.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/internals.h |  2 ++
>  target/arm/op_helper.c | 10 +++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1f6efef..a3adbd8 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -448,12 +448,14 @@ void arm_handle_psci_call(ARMCPU *cpu);
>   * @s2addr: Address that caused a fault at stage 2
>   * @stage2: True if we faulted at stage 2
>   * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
> + * @ea: True if we should set the EA (external abort type) bit in syndrome
>   */
>  typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
>  struct ARMMMUFaultInfo {
>      target_ulong s2addr;
>      bool stage2;
>      bool s1ptw;
> +    bool ea;
>  };
>  
>  /* Do a page table walk and add page to TLB if possible */
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index aa52a98..7eac272 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -80,7 +80,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
>  
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
> -                                            bool same_el,
> +                                            bool same_el, bool ea,
>                                              bool s1ptw, bool is_write,
>                                              int fsc)
>  {
> @@ -99,7 +99,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>       */
>      if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
>          syn = syn_data_abort_no_iss(same_el,
> -                                    0, 0, s1ptw, is_write, fsc);
> +                                    ea, 0, s1ptw, is_write, fsc);
>      } else {
>          /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
>           * syndrome created at translation time.
> @@ -107,7 +107,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>           */
>          syn = syn_data_abort_with_iss(same_el,
>                                        0, 0, 0, 0, 0,
> -                                      0, 0, s1ptw, is_write, fsc,
> +                                      ea, 0, s1ptw, is_write, fsc,
>                                        false);
>          /* Merge the runtime syndrome with the template syndrome.  */
>          syn |= template_syn;
> @@ -141,11 +141,11 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
>      }
>  
>      if (access_type == MMU_INST_FETCH) {
> -        syn = syn_insn_abort(same_el, 0, fi->s1ptw, fsc);
> +        syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
>          exc = EXCP_PREFETCH_ABORT;
>      } else {
>          syn = merge_syn_data_abort(env->exception.syndrome, target_el,
> -                                   same_el, fi->s1ptw,
> +                                   same_el, fi->ea, fi->s1ptw,
>                                     access_type == MMU_DATA_STORE,
>                                     fsc);
>          if (access_type == MMU_DATA_STORE
> -- 
> 2.7.4
> 
> 
