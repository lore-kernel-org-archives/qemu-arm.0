Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp725796wrt;
        Thu, 7 Feb 2019 07:58:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ1Ocdl8rgwlbZ/Z6FlBolAMH+XU/OJ2wLv5+3r/OEv9yDaJNfoUCuq9YaKauvTWr7FcOpo
X-Received: by 2002:a81:7355:: with SMTP id o82mr11357150ywc.400.1549555097486;
        Thu, 07 Feb 2019 07:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549555097; cv=none;
        d=google.com; s=arc-20160816;
        b=XzCCtLzkJQWR2+1VVCsWn/2yINCVDQmygSAd5906hIrPd15vLKzlVRxB/PTQ+edNFK
         KV1GA6rhNewj5GozQa8JqfC9aS3moKurr/M2IVvS9MKXePcG3Q+ByYP//188NYBpA2bl
         3/0Qjq8EccoFzkNm4knyXBgFAQmgQc+/geYPkNxBeJ4lGSOI1RFVHt0LvERHrHjtcrQE
         i9kOM8TWoOvz2vtESZ7siHC8Ovsan+OqBwD7qZdHnzlkVRovM1Vg1YTCyBFU4vImhhxW
         v+gXhuw0JPznqUbUYzR0I+CqukVwM923NtDXtD+KX6VH/oyjNVHzVxQn094pKqH1T173
         dj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2QTy97fPqApKshu4c3gq4F5JCAemWG+eOW7k9hcPb4=;
        b=nMaJFRVy5eMSoplQyLYChkUscPGXd9oVUmIiI+z74LEhjNIxh/ewyB+Fo5sxB9MeX7
         h865FRugJZGHmeH3K1z8WByjYl1vob7LJh+oAqAMX57fcSJNRgW2RpfHPE6+0/SSOqo4
         BvQrJ5ENHfZ+pm+Pko0448czyEvwUbWVEotWKbd0iVTre5t82ow0QDqyyw63kr2obBm8
         Yrtl4VWoychXkHvMlJV/tMJXhtNLMpctyK9U4+faH440+blRtgvtQL2a1IESykf3Mvch
         NzjnxfW0jbx9DNRWHsIT044/2i0xAjlB7J0rf0kFalqc8QscWL0WolQyqCkRFDV8xX2H
         mmZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CXfVbFZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g125si1482690ywe.357.2019.02.07.07.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 07:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CXfVbFZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grm48-00052w-U5
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 10:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grm3y-000522-TF
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:58:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grm3y-0008FV-0I
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:58:06 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grm3x-0008Ek-PS
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:58:05 -0500
Received: by mail-ot1-x343.google.com with SMTP id k98so606610otk.3
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h2QTy97fPqApKshu4c3gq4F5JCAemWG+eOW7k9hcPb4=;
	b=CXfVbFZJuRbFpnT7Nh+sLREI6U8TFBWcelQygQWHGXtmwJ2EoVKWuemzO2Fv0x6Qt7
	SvEvxP4asMjeGzB6z/MkKJCKnwWVSGDpXxKBVgtCk7MaXfDNY6aaT92tDP51t+6wT1FB
	4NOjhSuSXg8fnrVw+ZmTyh4NAu7vd4rUpCKf7tP4FVJs5nKnKNiLFJ1JIgbmR/PBqvIf
	2Ff8CLlN+rppl0RRiTWP1WbWhK15dh+nPTGvfdQSBiRGts5+WWmC6CM+9rqK/SfpGwiN
	3kG3owviBsDciIXDbV69l2aeEAd/HD6c9zKaHMk1rOirAw5/qEX6i/9QFy7zdg4u0zM8
	fr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h2QTy97fPqApKshu4c3gq4F5JCAemWG+eOW7k9hcPb4=;
	b=Ui0i65WXGljpIrCV0d753ADjFd1qFvZ3ldO2qpcJQcw+auKUdbskdjyOdyw1spcrPE
	lgMFrZmfcrgkysbN9LcuEmUOn4F4IprFX25ljC9Wk9SZ8DPyvYkE/lKDGioc3VQjcIoS
	KMzLE263H/sdGwKzf5T6bP/o2kXeHKvQF/sAF1xq3ohThxNVKnaJw5dPf22foHdFjp70
	PPzp9H2y60WBbKmVSTpa1uZ+JYo+R2ytzryHZx8p9sBxyS7kjcMpYpiWB6bqyvfSUT83
	Q2RdLdAxBSEzLtKJAtUohJU6oVTffXi98ZEAMuoQctqmXYNq06mcDqaUhcDyyUm5jFZn
	ekfQ==
X-Gm-Message-State: AHQUAuZHhjREZVAUT8mrntP1wRtdMpXJJgDclUfJZ9qJuOfmAPB7+YbD
	aXfK517xatEuJPPHJ357FaQaRD8C2y2dWz/ana0KdA==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr9131709otc.238.1549555084594; 
	Thu, 07 Feb 2019 07:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-5-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 15:57:52 +0000
Message-ID: <CAFEAcA_EWtyqOnsropKbsmAnoZc60H339u5YtoLbx6H6m-K3sQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 04/17] target/arm: Fill in helper_mte_check
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ASHBTWxTU4e0

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implements the rules of "PE generation of Checked and
> Unchecked accesses" which aren't already covered by XXX.

What should the "XXX" be here ?

> Implements the rules of "PE handling of Tag Check Failure".
>
> Does not implement tag physical address space, so all
> operations reduce to unchecked so far.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 80 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index a3226c44a4..6f4bc0aa04 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -25,8 +25,86 @@
>  #include "exec/helper-proto.h"
>
>
> +static int get_allocation_tag(CPUARMState *env, uint64_t ptr)
> +{
> +    /* Tag storage not implemented.  */
> +    return -1;
> +}
> +
> +static int allocation_tag_from_addr(uint64_t ptr)
> +{
> +    return (extract64(ptr, 56, 4) + extract64(ptr, 55, 1)) & 15;
> +}
> +
>  uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
>  {
> -    /* Only unchecked implemented so far.  */
> +    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
> +    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, true);
> +    int ptr_tag, mem_tag;
> +
> +    /*
> +     * If TBI is disabled, then the access is unchecked.
> +     * While we filtered out TBI0==0 && TBI1==0 in cpu_get_tb_cpu_state,
> +     * we did not save separate bits for TBI0 != TBI1.
> +     */
> +    if (!param.tbi) {
> +        /* Do not ignore the top byte.  */
> +        return ptr;
> +    }
> +
> +    /*
> +     * If TCMA is enabled, then physical tag 0 is unchecked.
> +     * Note the rules R0076 & R0077 are written with logical tags,
> +     * and we need the physical tag below anyway.
> +     */
> +    ptr_tag = allocation_tag_from_addr(ptr);
> +    if (param.tcma && ptr_tag == 0) {
> +        goto pass;
> +    }
> +
> +    /*
> +     * If an access is made to an address that does not provide tag storage,
> +     * the result is implementation defined (R0006).  We choose to treat the
> +     * access as unchecked.
> +     * This is similar to MemAttr != Tagged, which are also unchecked.
> +     */
> +    mem_tag = get_allocation_tag(env, ptr);
> +    if (mem_tag < 0) {
> +        goto pass;
> +    }
> +
> +    /* If the tags do not match, the tag check operation fails.  */
> +    if (ptr_tag != mem_tag) {
> +        int el = arm_current_el(env);
> +        int tcf;
> +
> +        /* Indicate the tag check fail, both async and sync reporting.  */
> +        env->cp15.tfsr_el[el] |= 1 << param.select;

We should only update the TFSR bits if we're not taking a fault
(ie if tcf == 2).

> +
> +        if (el == 0) {
> +            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
> +            tcf = extract64(env->cp15.sctlr_el[1], 38, 2);
> +        } else {
> +            tcf = extract64(env->cp15.sctlr_el[el], 40, 2);
> +        }
> +        if (tcf == 1) {
> +            /* Tag check fail causes a synchronous exception.  */
> +            CPUState *cs = ENV_GET_CPU(env);
> +
> +            /*
> +             * In restore_state_to_opc, we set the exception syndrome
> +             * for the load or store operation.  Do that first so we
> +             * may overwrite that with the syndrome for the tag check.
> +             */
> +            cpu_restore_state(cs, GETPC(), true);
> +            env->exception.vaddress = ptr;
> +            raise_exception(env, EXCP_DATA_ABORT,
> +                            syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
> +                            exception_target_el(env));
> +        }
> +    }
> +
> + pass:
> +    /* Unchecked, or tag check pass.  Ignore the top byte.  */
>      return sextract64(ptr, 0, 55);
>  }

Remarks from earlier patch still apply about the 'unchecked or check pass'
code path needing to do the usual TBI stuff.

thanks
-- PMM
