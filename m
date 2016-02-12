Received: by 10.25.159.19 with SMTP id i19csp875753lfe;
        Fri, 12 Feb 2016 07:08:39 -0800 (PST)
X-Received: by 10.55.25.150 with SMTP id 22mr2507159qkz.15.1455289719536;
        Fri, 12 Feb 2016 07:08:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z192si16213686qka.1.2016.02.12.07.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:08:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFKo-0004xe-Tp
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:08:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFKm-0004uk-4o
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFKi-0001si-Vv
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:08:36 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFKa-0001qa-8B; Fri, 12 Feb 2016 10:08:24 -0500
Received: by mail-pa0-x242.google.com with SMTP id fl4so3913788pad.2;
	Fri, 12 Feb 2016 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NqLsetpE4HIzfubFzXVsDZtt9oRbwAlYtQ9bF4wlkvI=;
	b=gpiKP11OzDd9HJL5YuWjd1pv5pXdd9pscFNFmwU2ZdX2Mh6s5DnmUNZk0jXGptCkG+
	bPwPc+YAyqv9BoCTrL7nlGr7xXzpflMqKiaDbHTUascUnjbjpfNVaeu8OYGiYcIyuQIW
	N44cKjQHa2hDFtRDCjNEPnbfOrNoX1JMiUPvldNeEdS4LT6jSpHEkX15JG/4STzJqvV4
	xKGuWmTDUisUCcK7yQNhP8eBpXCVA/MFLGxeFdW6YveW7tXAg+uDKq+XTPJe03cAOi7g
	q4OPyBc+U4Egt8qGYruXFApnlWa7uPRLeXGQuaDhANdfEDPDD/1tyTKfmUTghAFrl3Kk
	yTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=NqLsetpE4HIzfubFzXVsDZtt9oRbwAlYtQ9bF4wlkvI=;
	b=ipCLuwaSTCsz6MrXdACVVlgMV+S6EuHJLKX0QEh4OZ5+9zMI6v6qUeBW7/XvFomX9q
	6Wn1ZBCiTEWaV53YZZNAznPayMAZAexTqz/W4KV55GfYpZL8tV/EPoxIOtCXINCygOTU
	DOXBHqiilnFfkwPY0/Hm0RU4LcjakX0gFAiKk2LzUzxPLqtzcLNZK9ubxvGGvfHvItfM
	pHbrGDdnW16NxpeJADdOctBlu6rKVlCishLccJhWlFMPdCidZlYIm82yTALvyZTvgRbr
	BiLoXUl+2QzQcq+EYHEfqc/31s6zh8AC3mwLkrrXAog96Gc9lhvp22y1HMd4t0afqhM7
	7ffQ==
X-Gm-Message-State: AG10YOSfFkNz3d6Q0DGscbdXi9HRGngJ9CUst+L5adCvDpjV5UQtNY+Hb5krXArijGAPxA==
X-Received: by 10.66.65.109 with SMTP id w13mr2783581pas.142.1455289703474;
	Fri, 12 Feb 2016 07:08:23 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	sm8sm20162762pac.43.2016.02.12.07.08.21
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 07:08:22 -0800 (PST)
Date: Fri, 12 Feb 2016 16:05:54 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212150554.GF31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455217909-28317-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 2/4] target-arm: Move get/set_r13_banked() to
	op_helper.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Go6BCXLVidWO

On Thu, Feb 11, 2016 at 07:11:47PM +0000, Peter Maydell wrote:
> Move get/set_r13_banked() from helper.c to op_helper.c. This will
> let us add exception-raising code to them, and also puts them
> in the same file as get/set_user_reg(), which makes some conceptual
> sense.
> 
> (The original reason for the helper.c/op_helper.c split was that
> only op_helper.c had access to the CPU env pointer; this distinction
> has not been true for a long time, though, and so the split is
> now rather arbitrary.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/helper.c    | 33 ---------------------------------
>  target-arm/op_helper.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index bb913c6..c46e3d0 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5365,21 +5365,6 @@ void switch_mode(CPUARMState *env, int mode)
>      }
>  }
>  
> -void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> -{
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -
> -    cpu_abort(CPU(cpu), "banked r13 write\n");
> -}
> -
> -uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> -{
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -
> -    cpu_abort(CPU(cpu), "banked r13 read\n");
> -    return 0;
> -}
> -
>  uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
>                                   uint32_t cur_el, bool secure)
>  {
> @@ -7762,24 +7747,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>      return phys_addr;
>  }
>  
> -void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> -{
> -    if ((env->uncached_cpsr & CPSR_M) == mode) {
> -        env->regs[13] = val;
> -    } else {
> -        env->banked_r13[bank_number(mode)] = val;
> -    }
> -}
> -
> -uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> -{
> -    if ((env->uncached_cpsr & CPSR_M) == mode) {
> -        return env->regs[13];
> -    } else {
> -        return env->banked_r13[bank_number(mode)];
> -    }
> -}
> -
>  uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 049b521..053e9b6 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -457,6 +457,43 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
>      }
>  }
>  
> +#if defined(CONFIG_USER_ONLY)
> +void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +
> +    cpu_abort(CPU(cpu), "banked r13 write\n");
> +}
> +
> +uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +
> +    cpu_abort(CPU(cpu), "banked r13 read\n");
> +    return 0;
> +}
> +
> +#else
> +
> +void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> +{
> +    if ((env->uncached_cpsr & CPSR_M) == mode) {
> +        env->regs[13] = val;
> +    } else {
> +        env->banked_r13[bank_number(mode)] = val;
> +    }
> +}
> +
> +uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> +{
> +    if ((env->uncached_cpsr & CPSR_M) == mode) {
> +        return env->regs[13];
> +    } else {
> +        return env->banked_r13[bank_number(mode)];
> +    }
> +}
> +#endif
> +
>  void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
>                                   uint32_t isread)
>  {
> -- 
> 1.9.1
> 
