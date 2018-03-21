Received: by 10.28.71.155 with SMTP id m27csp57144wmi;
        Thu, 22 Mar 2018 01:09:37 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt6iNRh2Uw0Gx5LyLYNf34WPar2Jgbp5ckshsiiOuuNcbIx5J99xP7siBWBCVpYaYjuhUDi
X-Received: by 10.55.78.212 with SMTP id c203mr33935337qkb.351.1521706177283;
        Thu, 22 Mar 2018 01:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521706177; cv=none;
        d=google.com; s=arc-20160816;
        b=u0GzrJXCRfjYho6Ot8pixI2o6nnRumYkuQ8Ekz7r/Tvueaoz6ryZ9jSAPdidRGypc0
         Fz6SY/we4Y8tKg6V5Q/m8sMeSha6dz9hedn1huZG15CHbaGm2ew0YuJ16tZFySjy/uFA
         3rzFbulqzktOkodpkdQYmwPqhGap0QTPkPI9C/N7CeD+ePhcYDsy/cxcXA0JZqqrXSRV
         HckEb6et8ZyMaHEvgPRSHxe6ZeuKA/DKgaPUX3PdT4D5VaDTnTz7Fis7Fj6C01Vd5zpP
         yFnp/PUDGAbogTaUGZYjFAbx3dE57PVZ5f6z+Ww2mgIK/uvG44nIViIEz10NwqWg6Ky6
         3kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=xNBRzejIYxw8PQjigePN7Ov1FvebS/NKYQuRTCqdBNg=;
        b=bupW8CDuI/LlsS3Rup24ej4k/rRtFATda90xs0DMNrUwWGAEHkPtCPYA3siYzNdqmj
         Us/Skkjtp/BfOCqPETHm0uviue7Ic52PEyUPuCB4igr2JXt7PV4JZXWqxUPAe7AD59sv
         farvntsQvjmH54fRu1EdcdoAHpr/LJwCrd5T3znbhAKdrfEDCTM1CH3dVOZlBLedrtvh
         cuAELMvNHR72ti7hKzstv1vt00xD4tNBHgBQMocjzFENBFz5xPMlOdYI889UBJZqjv6v
         +g8HEjEOZk+3qjDCuA+XjJdsX8UdIcmiHxjIEudy77NP9yZsShqGerU8k6D37dt8L5Tu
         ZfIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kogHnRK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d69si2019347qkb.26.2018.03.22.01.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kogHnRK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvI0-0005SF-NT
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:09:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHo-0005Pm-EQ
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHn-0002nn-F0
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:24 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHh-0002lG-Q0; Thu, 22 Mar 2018 04:09:17 -0400
Received: by mail-qt0-x242.google.com with SMTP id w12so427557qti.4;
	Thu, 22 Mar 2018 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xNBRzejIYxw8PQjigePN7Ov1FvebS/NKYQuRTCqdBNg=;
	b=kogHnRK0cXcCqcpXE1KvIjw3mYbOAgBZx1QMoJHJ6H5n2zOXGDTW2WXkG0R2tJxTr3
	HlL0KCoA+oHfeGt1msExUQutEcRNj/Go5A/3n3NOio6Fg8OAD3WMxJTib5Bu3ZozE8ON
	67/rsYgK8icKSByAWYjj14ABl1xZTGWTsh+gBPEsSqmzMl5n9FIFEHFqVPo69R1LLQTB
	2LuH9fXL/r/A21/4BE0H1zugAzVrirN6oDjlF8KIXv9Al/O/uZnMdEw9JxVoxo7O739N
	9aUnO+PPtofz3BLwPYHA7fogTeEGg9ONe234vz1UAEMHXSrPhcWV58xLQcPKKMjw3og5
	zIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xNBRzejIYxw8PQjigePN7Ov1FvebS/NKYQuRTCqdBNg=;
	b=nmWZ8q5Spp9HxFyLPxEy9k4d2BKOa5cD92dLFxyY8lGrXvlt3PCdylj7wmCNTMv+tl
	SUhBmO5yfLphUAAs6hOf+UhR+c72dFOOqy5buMxLY5/8v8MzKNy2duiiR7YmV8oBgvK1
	uj8cvzh//dCqIM8vuf6RhJ7jQ1aSeR8iY8YPrtGtfEu6yHDkS56PVHJj1vffpWP2bV38
	Muj1fEu6r2FE36TND6fS4fJM0Dy1wnJd4WXyfhXJbOR9OVSntz2zMNNFkTFen78poARb
	yQlDjkwt7o8fNcReWFlxSE7g/xvBpSHsvR5MT9YMXhymSAwCDLaIWI30sFPzRWESJ2g5
	o9rQ==
X-Gm-Message-State: AElRT7GBAw4L26MN23NIpbZ4l7eirNIxNwIiTiSCLuMdR6ETBH2ub2bE
	itgKbwxm4ZPXm1K2r1kKXj0pY/ed
X-Received: by 10.200.68.18 with SMTP id j18mr759983qtn.132.1521706157389;
	Thu, 22 Mar 2018 01:09:17 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	s184sm776943qkb.23.2018.03.22.01.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:09:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8f878d04-d5c2-77ae-9fb9-d98d41efac3c@amsat.org>
Date: Wed, 21 Mar 2018 23:29:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320134114.30418-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 4/4] target/arm: Always
 set FAR to a known unknown value for debug exceptions
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
X-TUID: 0QLVI0bjxpE/

On 03/20/2018 02:41 PM, Peter Maydell wrote:
> For debug exceptions due to breakpoints or the BKPT instruction which
> are taken to AArch32, the Fault Address Register is architecturally
> UNKNOWN.  We were using that as license to simply not set
> env->exception.vaddress, but this isn't correct, because it will
> expose to the guest whatever old value was in that field when
> arm_cpu_do_interrupt_aarch32() writes it to the guest IFSR.  That old
> value might be a FAR for a previous guest EL2 or secure exception, in
> which case we shouldn't show it to an EL1 or non-secure exception
> handler. It might also be a non-deterministic value, which is bad
> for record-and-replay.
> 
> Clear env->exception.vaddress before taking breakpoint debug
> exceptions, to avoid this minor information leak.

So this series is worth Cc'ing qemu-stable...?

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/op_helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 8e1e521193..a266cc0116 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -490,6 +490,11 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
>  {
>      /* FSR will only be used if the debug target EL is AArch32. */
>      env->exception.fsr = arm_debug_exception_fsr(env);
> +    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
> +     * values to the guest that it shouldn't be able to see at its
> +     * exception/security level.
> +     */
> +    env->exception.vaddress = 0;
>      raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
>  }
>  
> @@ -1353,7 +1358,11 @@ void arm_debug_excp_handler(CPUState *cs)
>          }
>  
>          env->exception.fsr = arm_debug_exception_fsr(env);
> -        /* FAR is UNKNOWN, so doesn't need setting */
> +        /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
> +         * values to the guest that it shouldn't be able to see at its
> +         * exception/security level.
> +         */
> +        env->exception.vaddress = 0;
>          raise_exception(env, EXCP_PREFETCH_ABORT,
>                          syn_breakpoint(same_el),
>                          arm_debug_target_el(env));
> 
