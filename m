Received: by 10.25.0.144 with SMTP id 138csp767837lfa;
        Mon, 10 Apr 2017 01:45:08 -0700 (PDT)
X-Received: by 10.55.67.135 with SMTP id q129mr51998427qka.98.1491813908258;
        Mon, 10 Apr 2017 01:45:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c138si12923982qke.203.2017.04.10.01.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 01:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxUwb-0002O1-L4
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 04:45:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUwY-0002Nv-Bj
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUwV-0003m2-6R
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:45:02 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cxUwU-0003lh-UM; Mon, 10 Apr 2017 04:44:59 -0400
Received: by mail-lf0-x243.google.com with SMTP id x72so3330540lfb.1;
	Mon, 10 Apr 2017 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=97tiJEWivlzZNssH+q0WOf/tyCk/GmJwDB4HqsSTv60=;
	b=bdXi5WHPXJXc1aedIMPnSo/lAKE+8RdbSdEjuquUUFiVZDRnDfuDvIj39FJz2PlU6S
	CSimT0cKNIg3lziFBwmJZDUsLYgDNQf8qgO812nvHiDSEj42EZQcFw5zkMZKRT5pLhI1
	zUxcmOTJi2rDVcn/8KTeP0QnHM7dcF2ktydAsTihBYvozX9BckozmE/7T0Qya0RUumja
	al8CRfOm0AR5+/P8bMupx+OgjWa0/ZEuCKC8Yb0HbseHjbpqw6X4oE/iiNkji7v+aCrH
	V0Urj2LeOU0XJ1CGktaJ+cQaZBhkU+7dHFcdnIfjPcFsRrOHBkfwD+Y4h/0TdFrQw5UN
	CcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=97tiJEWivlzZNssH+q0WOf/tyCk/GmJwDB4HqsSTv60=;
	b=dEioe3H+PGD9md3vqyo1gRYrhPWadeFT4FgNbALoj0hxJcbQLMAy/UZx8tOKfZuOx3
	6nkjN8qcmkVB+mb+ZjKyVprhmyCVUoMc+I5gYzbiPA9ACrp/R+A1uMEbwdr26lzJ7dT4
	CCzKmNnv1+o5flkOc4Fkjt/wL5YvLeqyW/7lZydJOGZFYxMyw8fh+nPCPXw0Ou+lSZwE
	3DKonS5kENFPdrgvqEvNDnXqpWZw7DY8E1WbCI7Q8VGp8JQ7kepkxzMoPqJSZmzk1ahw
	JFOesc9MJ9xBv3cTDdFG58BI+0+5F6KpBbJhl3eaWICAcPy5yEyaYKsFWnkzUgw9hxHw
	S7ew==
X-Gm-Message-State: AN3rC/43gdTOzblzdBoqFQ1yTUpapS6uhb5fbaikvLaqkrrqPA4y708Yg3pFsX5d/wJZLA==
X-Received: by 10.25.221.197 with SMTP id w66mr1744692lfi.10.1491813897460;
	Mon, 10 Apr 2017 01:44:57 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	e91sm2747762lji.40.2017.04.10.01.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 01:44:56 -0700 (PDT)
Date: Mon, 10 Apr 2017 10:44:56 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170410084456.GB19103@toto>
References: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491486152-24304-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
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
X-TUID: NuEl9Tuw4ea5

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


BTW,

Have you seen something suspicous when running code or was
this a theoretical issue?

Cheers,
Edgar

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
