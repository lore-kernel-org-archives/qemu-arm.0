Received: by 10.25.221.202 with SMTP id w71csp811730lfi;
        Thu, 3 Aug 2017 08:49:20 -0700 (PDT)
X-Received: by 10.55.104.148 with SMTP id d142mr3270182qkc.182.1501775360623;
        Thu, 03 Aug 2017 08:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501775360; cv=none;
        d=google.com; s=arc-20160816;
        b=W0nsXCLgL1Ae4OXW7Eax65RtcY995Wwp+htfnY+POV+oYSur4ZMbNitwqdsYR837c2
         ar0bOKK9OFFjfu6QTySJ1IquRL6dTC8qFBSdbv6Qx3K9urs3rrWB6IMPsUjAEikGEcBs
         lNJ4QRP+UTBrSH+j9aUk88dX2sPXMLsGY20gN3ToQFlkNJhpQqOA63MSpBQbVqdsn1lh
         qSXhipqFjKahO+p/t9rKZyfJKvLc7rUI8/XQqBQr8FCRsYuY4ccKD1z8arDCxjohNJjy
         kQ7GCEEE2GU68g/idtqJ/0sVym8Liybbwd8xwB1qXzZAnT9BowzkOiMNHCQhRkZFtBFx
         h+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=lnzWeSGhFIGDLgQWVShh3E1O91RmuECl7cVZu4TQu3w=;
        b=la3qstJpqs9Q4cjCtgR0QP6NkRYSfP0p7z0iPFaxa2/EdChKJOa8Nx4AtXTFMcGaSR
         8UkTrqp5KHCj92snwR5SL3f7KDEIizrIxOO3bsd77/vF/2Pj1BIsRgalzbrY88SzAvx9
         G0N8yvB44c4b7w2362aRB0T+KUBnyEEOC8+gnu/p6xTNBX+s6sCBM+j87ow4q7IRj+z3
         1OoTVdt1GM/27jFCBDA3XrJbJ/+8cUTZfPnofYM1OWhvvBlFo2uimq1SRusBW3Cy1n5S
         mhnjuIHDi/Q0G98kfUQcUVI/3v30xKjfFOwmHLK+hSpaLk4FN9Td4LtSuuuOgB1F55LP
         dZ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=O6p5GCJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b24si34459548qkb.222.2017.08.03.08.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=O6p5GCJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddINB-0006Ed-Ti
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:49:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIMz-0006BQ-Us
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:49:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIMv-0003KT-W6
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:49:05 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddIMv-0003GP-ON; Thu, 03 Aug 2017 11:49:01 -0400
Received: by mail-lf0-x244.google.com with SMTP id o85so1212817lff.1;
	Thu, 03 Aug 2017 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lnzWeSGhFIGDLgQWVShh3E1O91RmuECl7cVZu4TQu3w=;
	b=O6p5GCJIKuuD3lndo0zLEw/RqIPnvXj/jPe+Mn2Pb9DNIz43KixqIPPmWX2LWcVnBZ
	hl/AKMC8eBLCOyCV21ptxHKQ6jtn27aO0cCsNdk+rbV7CnR9YtAccxoJ2nBNIL3O1ZSH
	5khof5R1afcMsA84EKsn04oyPsDhvvFCP4G6HyuT7lFn+FPKFvLfef9wJSHVGpv28QJG
	f6XO+iEJzLdzkyc793OeWL+z48rbWvaJ0ztdZmfrnWp3vAlgNkP3xYvcqi6fg+NjjoK8
	XLLM651RCsxkmsronWAIlaFcU4zwL8eud9JNws9ApoUcb1Ls0BW7lDAPXe+2BMJPPluY
	tb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lnzWeSGhFIGDLgQWVShh3E1O91RmuECl7cVZu4TQu3w=;
	b=eURa4TxaN32TnWH8k6lV0GmpMFqhobR9F8od1xqWpm9ztgv+O1rI5iPB0rlcYUF7qj
	fTE/OXWK36rCRF2x2mDZ/4rbLj2v3lgH+P0wlezFJmjK8tJwR723uNb0pgC+PPd5yDmr
	roRyo2dHogrIKjnQYVtTQ6HtRYQReWXAuYMMpqZCCJ4NZ8ZzInL1eCyzwX9lANA+4s8L
	abdtkft++9secoo2aRcV6xf9E0JGCNIVajY98X12sJBulOPfWIlUFULPu6z0+noOegpW
	3l7yfvGNa62pqfnkCCepV/3tDhcwrAVXPmOtZKie0w30kbZJSkwGjjKgw5i8l2WRjrL9
	Z/GA==
X-Gm-Message-State: AHYfb5iYyCHkTnSiyLUcIQajL8bnYrT9fNI5KkVjPsPwwGXhK6h4ErED
	Ux3ObjNOUQaI82Pn
X-Received: by 10.25.233.143 with SMTP id j15mr854739lfk.64.1501775340371;
	Thu, 03 Aug 2017 08:49:00 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	m12sm6712109lfe.12.2017.08.03.08.48.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:48:59 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:48:59 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803154859.GT4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 12/15] target/arm: Don't calculate lr in
 arm_v7m_cpu_do_interrupt() until needed
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
X-TUID: FrHmBzWz+lmG

On Wed, Aug 02, 2017 at 05:43:58PM +0100, Peter Maydell wrote:
> Move the code in arm_v7m_cpu_do_interrupt() that calculates the
> magic LR value down to when we're actually going to use it.
> Having the calculation and use so far apart makes the code
> a little harder to understand than it needs to be.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b64ddb1..0ecc8f1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6311,13 +6311,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>  
>      arm_log_exception(cs->exception_index);
>  
> -    lr = 0xfffffff1;
> -    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
> -        lr |= 4;
> -    }
> -    if (env->v7m.exception == 0)
> -        lr |= 8;
> -
>      /* For exceptions we just mark as pending on the NVIC, and let that
>         handle it.  */
>      switch (cs->exception_index) {
> @@ -6408,6 +6401,14 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          return; /* Never happens.  Keep compiler happy.  */
>      }
>  
> +    lr = 0xfffffff1;
> +    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
> +        lr |= 4;
> +    }
> +    if (env->v7m.exception == 0) {
> +        lr |= 8;
> +    }
> +
>      v7m_push_stack(cpu);
>      v7m_exception_taken(cpu, lr);
>      qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
> -- 
> 2.7.4
> 
> 
