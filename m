Received: by 10.223.197.9 with SMTP id q9csp852764wrf;
        Thu, 5 Oct 2017 11:50:29 -0700 (PDT)
X-Received: by 10.200.18.66 with SMTP id g2mr7570127qtj.223.1507229429314;
        Thu, 05 Oct 2017 11:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507229429; cv=none;
        d=google.com; s=arc-20160816;
        b=e56OuWZGvrAmpF5K1ZfuF1cwJgwjJ4HKzBTDjRZfwNk9ydnyNda5+MRSwmKJZ5FBlQ
         NTPhwXtjwONdoJVC9SPtfSvPojfWzwnnXBpwMhKat/HIeJS/qOHvwV78usc5/RkZkQMx
         ikPR5E+GsXK8T5+T36/UJ9OhY8fM3I3dVa6Uh0U14XLy7jno7a/Xdm5MQV16vOeB7nEX
         6UUkB/6TxiOhCTPuXDBHiNxVUjZHemkD8qkK2mR3kXvWyzVhIzHrboDKALw4xLNMzHcO
         lNeiqdo3Q5iCIuPQg8aCAWt0Oa36sftjB+KrY1tFal0wEEemZfKH81zP4I6dnSnzcaZB
         9bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=+cFXmJhIlReTxPVdshXryv49li1stPw6y2csrm2f1jU=;
        b=G7p8cKeWUqApd98klOfwI4ByT1GKPEI80WgQxBaVN6z6KO+EJC5BrGsC11UcqQUC/6
         CoqcamsaQ9vzMjEtL/kcnMiIzS9NQlkCvD+sSXGy3eRWWMuZxoYhISxuBfgbWF8p5q9J
         OyoYhMNmzfAWvLjjFe/Q2QN6VTjKwlYFUid6SewQU95gqmZT85+foF4KXxve4VLS7FJs
         Vahl+jXNEUp1+f260au2NnS/S+r7crMeH4pcqbuIBpWxtCxpDV+PVsVkDzpgTjqWfQrE
         HaJUHPcDmvxsiodyEFv/zLfXXnAzddd8k5HZgT4o8iBGHf3tD2bbMyhozXm91TRkyTwA
         /uDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQFixHVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si1766170qtp.275.2017.10.05.11.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQFixHVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BE4-0001aC-RK
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:50:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BDx-0001Zn-No
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:50:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BDw-0006Gs-SP
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:50:21 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:54944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0BDw-0006Fk-Nj
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:50:20 -0400
Received: by mail-qt0-x229.google.com with SMTP id i13so27235616qtc.11
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+cFXmJhIlReTxPVdshXryv49li1stPw6y2csrm2f1jU=;
	b=VQFixHVyEdUfNKbpyPga70CVmXYvC8toWUGLZJ9sSB6w4t+jdftDDcqk81nE2p/P4L
	6O8O9pYklx+6qZFyyqtwRfjKquRV93mAiez05LivZvpTmg2ah6Wf9NzIKXPl4YNjM1oe
	h4/bEb0vntJLrZF+VtezeGS7EeAjfbADlfxIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+cFXmJhIlReTxPVdshXryv49li1stPw6y2csrm2f1jU=;
	b=lLuCaIWQUHEgPqRS9Yh4m/HnClSJSCpOySRkPuCX6R2rBBzJa+0/5YE6iEkZtCHl6+
	Al5QVy7Vc1W/rnAqlw6gGfQu+IjV9KpxJfK6qIYv6+Il3wVYLqJ2hMAzInwyL5UhXV09
	gpr/AjbVTh1KMl5Stp4e8x7ROLVzuzoGjLwwZoJ1BBIvw/9TERxJW3T6wJqb9fudJaF6
	p+Nb95W0jvRx6PJStnfa0d720m/+vfbxgC3M7qCAVxwXxljG5FM0iLvuovNu6gpBizYK
	5+gFv6xoQ8PsmuVKyeW+WB9e7OA1Y1RZXWTZHh6vqwc1FOPQmbWO4PKMU0habaOKcaYQ
	RA9g==
X-Gm-Message-State: AMCzsaWnzdP3O07c0KjVHpkU6QCM/FsSIOvcq5Bjj5BGgITMmfaQ1/qC
	Iuv78xlNHmyAC7mao7PuCroliw==
X-Google-Smtp-Source: AOwi7QDhI9LQMLHJJaAh2eWotj3r2MLEVM7BYU5FcHoelyYZ3Gp85kT3yoOOhq5JQ+LUx1dffk6NPw==
X-Received: by 10.129.173.12 with SMTP id l12mr401264ywh.138.1507229419815;
	Thu, 05 Oct 2017 11:50:19 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id q5sm7027004ywf.11.2017.10.05.11.50.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:50:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd16f792-28a0-95b8-6a68-73f1427e6d38@linaro.org>
Date: Thu, 5 Oct 2017 14:50:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/20] target/arm: Implement SG
 instruction
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
X-TUID: u45fs3Ej7wPM

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> Implement the SG instruction, which we emulate 'by hand' in the
> exception handling code path.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 124 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b1ecb66..8df819d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -41,6 +41,10 @@ typedef struct V8M_SAttributes {
>      bool irvalid;
>  } V8M_SAttributes;
>  
> +static void v8m_security_lookup(CPUARMState *env, uint32_t address,
> +                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                                V8M_SAttributes *sattrs);
> +
>  /* Definitions for the PMCCNTR and PMCR registers */
>  #define PMCRD   0x8
>  #define PMCRC   0x4
> @@ -6724,6 +6728,123 @@ static void arm_log_exception(int idx)
>      }
>  }
>  
> +static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, uint16_t *insn)
> +{

This function doesn't take an address ...

> +    if (get_phys_addr(env, env->regs[15], MMU_INST_FETCH, mmu_idx,
> +                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {

... reading it directly from r15 ...

> +    if (insn != 0xe97f) {
> +        /* Not an SG instruction first half (we choose the IMPDEF
> +         * early-SG-check option).
> +         */
> +        goto gen_invep;
> +    }
> +
> +    if (!v7m_read_half_insn(cpu, mmu_idx, &insn)) {
> +        return false;
> +    }
> +
> +    if (insn != 0xe97f) {
> +        /* Not an SG instruction second half */
> +        goto gen_invep;
> +    }

... but somehow expects to get two different values read from the same address?

Certainly you'd get the wrong exception frame if you incremented r15 in between.

> +    env->regs[15] += 4;

... that make this right and the implicit address to the readers wrong.

I don't see anything else amiss in the patch.


r~
