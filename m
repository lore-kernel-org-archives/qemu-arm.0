Received: by 10.223.197.9 with SMTP id q9csp707512wrf;
        Thu, 5 Oct 2017 09:05:09 -0700 (PDT)
X-Received: by 10.55.149.70 with SMTP id x67mr29350020qkd.149.1507219509558;
        Thu, 05 Oct 2017 09:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507219509; cv=none;
        d=google.com; s=arc-20160816;
        b=EwcB3mVNCJ+BXY648b+5QeMNpl30fwYGE60rxlsyIYPSxhX/qtEXehfNKDhY34ZVCV
         P0yZSxnqeWVWQvJ4VllA/g6EUkCis1T0QXCQX6Eq7si+x4d2cK0dxsSODvmRBU7+DIQ/
         QLa4ZpTwKrNd1vIuQfPWTo9yjHgVAerQMYXFw2pBSU3yTJRoJ2K8hmn850TwCDM40j6y
         ncOxWrnVjh4XZBh9r+PM5MEVSSO0VUj97jIs2HD6CUK2eLKACNEeb+S0+KNg6AHStQO8
         Jj6pDYLExeTSaK2gyJ0pHv2Nb/Ydx30GLzROm9Sn+vQD3CVSvYwDo+XQeonxI4qh0CwO
         1XmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9JzZDdyc2LqxQgkZ+vSdFc7AZ6o6XdDJC8OZsN1ysgE=;
        b=B7tNINQCnWLUYjMMOIln0K/tL7WO4Ucs6YhKAY9VkbJPTqP57wwd7EkW0qCT3qy5VU
         uaT8Mr2UVwiWslZdw3ZnznrKvqx/wTHsrWIDYHgXtUYkYBambrQ+kHBMQJDMs45Ar2TJ
         ET1XuqA3O6P8n6Qh2qBPhSbPx+By5F0/A/X4/UsuqUeYymVTnEZISNGqniyp312qSTO/
         Lwhouhy2zsELXVXPB3DgdLK3GQH65BBc4x5rwj6dF7bpzRINKf/UkTNwGIgniiGlvT4G
         TBMqK3PBs/4Cc0Eo6HKctGYsVWkNnXmH2SZsTcB8SOksckb3EXUeTgEXIqT1+1n/ekbn
         qVhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mg2zLoLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a55si976288qta.363.2017.10.05.09.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mg2zLoLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e08e5-0002u6-1a
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08dp-0002pW-Am
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08dj-0001ee-Jn
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:04:53 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:44019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e08dj-0001e5-Ff
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:04:47 -0400
Received: by mail-qt0-x22e.google.com with SMTP id a43so20374602qta.0
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9JzZDdyc2LqxQgkZ+vSdFc7AZ6o6XdDJC8OZsN1ysgE=;
	b=Mg2zLoLiduSs+y3aFE3qHKXuAatFwUpvqisDwEXZUpBIMR3oZ0IDxmkrWfpBoFpiZk
	gpJgFr94eNj3Zl20OCh1iiGoZwxijX+EL2xeCSOA5W1tqY/VbO8l02la1ETc24Cjsp/a
	ZpuUJ0Mqq6p4WcMWDSnSoNEpKC1ovhNDveljY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9JzZDdyc2LqxQgkZ+vSdFc7AZ6o6XdDJC8OZsN1ysgE=;
	b=GtNdyrvxPxzeWN4376PI4+jvir1UTY5Hdt0aBOc7+1G20ndQjXJNBhjUiVTe/ngUqw
	hxEf/815Hjeynzy4Mz0ZEFC4D94dn24Vy0/yVdT3U9NBHZ66zLxHWwii95Urf3JdqfWL
	m3Bnv5PvrZJgH42JaUJHsSdpiDy3+FHdhqNQQzrJ/Y0fuwrH+ZecYC+qtTNZlm8whZHl
	YVZOlqY/+x1TLEN87jdzppkeQswbzPsjz+IJKUhLlUkdU6Ab/0a3C5PY80R6smYf6Xse
	UfHe5/kplO1YhyEZ4z4L9pb8Aydqil9ZoakHuiBMgA7HLyWCjS+mcStiQAJQE8xCQ2VY
	rIYQ==
X-Gm-Message-State: AHPjjUgzzaC4FP8yXmsPbBOUJuP77+vOSKreT8iaJJJnfG2lrar/0t1C
	C7GFPevhXVGexKg2tfpJHmyDIg==
X-Google-Smtp-Source: AOwi7QA9uZ/FCyyzLP1a1ERxYG3gWK502aOdLpjNsb4BSNrxWSWaglnMsnvJ8ejaMU93ChT/Nt8Y+g==
X-Received: by 10.13.242.67 with SMTP id b64mr20862542ywf.242.1507219486599;
	Thu, 05 Oct 2017 09:04:46 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	v124sm6839148ywb.68.2017.10.05.09.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:04:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0b514b4-6474-87ed-6fa0-c109761d243c@linaro.org>
Date: Thu, 5 Oct 2017 12:04:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/20] target/arm: Don't switch
 to target stack early in v7M exception return
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
X-TUID: VphasxRR6rnt

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> Currently our M profile exception return code switches to the
> target stack pointer relatively early in the process, before
> it tries to pop the exception frame off the stack. This is
> awkward for v8M for two reasons:
>  * in v8M the process vs main stack pointer is not selected
>    purely by the value of CONTROL.SPSEL, so updating SPSEL
>    and relying on that to switch to the right stack pointer
>    won't work
>  * the stack we should be reading the stack frame from and
>    the stack we will eventually switch to might not be the
>    same if the guest is doing strange things
> 
> Change our exception return code to use a 'frame pointer'
> to read the exception frame rather than assuming that we
> can switch the live stack pointer this early.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 127 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 32 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8be78ea..f13b99d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6040,16 +6040,6 @@ static void v7m_push(CPUARMState *env, uint32_t val)
>      stl_phys(cs->as, env->regs[13], val);
>  }
>  
> -static uint32_t v7m_pop(CPUARMState *env)
> -{
> -    CPUState *cs = CPU(arm_env_get_cpu(env));
> -    uint32_t val;
> -
> -    val = ldl_phys(cs->as, env->regs[13]);
> -    env->regs[13] += 4;
> -    return val;
> -}
> -
>  /* Return true if we're using the process stack pointer (not the MSP) */
>  static bool v7m_using_psp(CPUARMState *env)
>  {
> @@ -6141,6 +6131,40 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>      env->regs[15] = dest & ~1;
>  }
>  
> +static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
> +                                bool spsel)
> +{
> +    /* Return a pointer to the location where we currently store the
> +     * stack pointer for the requested security state and thread mode.
> +     * This pointer will become invalid if the CPU state is updated
> +     * such that the stack pointers are switched around (eg changing
> +     * the SPSEL control bit).
> +     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
> +     * Unlike that pseudocode, we require the caller to pass us in the
> +     * SPSEL control bit value; this is because we also use this
> +     * function in handling of pushing of the callee-saves registers
> +     * part of the v8M stack frame, and in that case the SPSEL bit
> +     * comes from the exception return magic LR value.

Exception return magic lr value does not appear to match "pushing".  Did you
mean "poping" here?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
