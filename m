Received: by 10.25.159.19 with SMTP id i19csp879596lfe;
        Fri, 12 Feb 2016 07:15:02 -0800 (PST)
X-Received: by 10.140.44.5 with SMTP id f5mr2540098qga.37.1455290102759;
        Fri, 12 Feb 2016 07:15:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si16133038qhn.71.2016.02.12.07.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:15:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFR0-0007d6-7N
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:15:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFQx-0007a5-Q8
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:15:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFQw-0002u6-SG
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:14:59 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFQm-0002si-C0; Fri, 12 Feb 2016 10:14:48 -0500
Received: by mail-pa0-x242.google.com with SMTP id fl4so3920404pad.2;
	Fri, 12 Feb 2016 07:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AHdO19Fw1XvZVyHxlNuRBQCgCrY4XUhoMqiBDF1B60U=;
	b=Eq8n0FAtnSIqj57jswvGmYY7MnAbdYkd0ObKHXyWC6+V5SMOCScdIa+90LvLh3EYM8
	vz8zDxQuW4jdjtTm3ob9L4mrsUosnYtBighvQ5FCQk3RkjXqe5/f4WzwTNDeKpcHkr8q
	0oyfFijZGpSn4IQtjTc6YXM57W590F4QxvAhfGw+1nWqTNv0Z1fzCkv4lZy9FgwQNRHB
	rO0DuSFVVUbI2d+nHwlzseEq28NPPV1c8Ukr0d4hjVF9Pm5sf8hgJhk8R8LISfZk4rZM
	W4kKK51qJI4+gUuDgvUXd6/bUgSrvmXfzkVRh73QZw0qBJCWP+XyyQZf6cuTK+Lo3bQB
	450A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=AHdO19Fw1XvZVyHxlNuRBQCgCrY4XUhoMqiBDF1B60U=;
	b=BWTCbHIQOj7dZRHs5cLT5QTEdWEPSmOimVTtjZ2qATTjK/kwLtvep+wQXcpcH2vszB
	BsYurEaIw7e1wJW0q8Is0qGNr/G9tmytnZBsXsDikw0TaJdbc3rlTYVazt87U76JNHdo
	45Fk7ga3Cz+AYCoZAhAb/r6VQOqa9bw4FSkOBuP5JAooE8DVJ1An+dh9fDGrVpqCZxDC
	6+bQtMbx6ZSOkhjUa8kGRRwut6aQUrhKN+xzhwryZwODcf+BgoUliGgJWcJ+jaGOLOWg
	cXrUfjGESgGrYeQupT3mimrgSb6xuhZ3fN9lUH+GfOKLIGSnqrxr1atADGbvp2gF8Q51
	zekg==
X-Gm-Message-State: AG10YOTiM/JbxDQJY9kT4U9SNTy9+Z6x6GiTNWNcDiQQ7eBc/lw5mZBU7ZsIc9zcdisBRQ==
X-Received: by 10.66.102.70 with SMTP id fm6mr2837378pab.98.1455290087691;
	Fri, 12 Feb 2016 07:14:47 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	e20sm20200641pfd.4.2016.02.12.07.14.45
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 07:14:46 -0800 (PST)
Date: Fri, 12 Feb 2016 16:12:18 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212151218.GG31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
 softmmu get/set_r13_banked()
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
X-TUID: 2h/yP3YQ6lEL

On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
> The user-mode versions of get/set_r13_banked() exist just to assert
> if they're ever called -- the translate time code should never
> emit calls to them because SRS from user mode always UNDEF.
> There's no code in the softmmu versions that can't compile in
> CONFIG_USER_ONLY, so combine the two functions rather than
> having completely split versions under ifdefs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Hi Peter,

Do we really need the assert?
If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?

Cheers,
Edgar



> ---
>  target-arm/op_helper.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 053e9b6..05f97a7 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -457,26 +457,11 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
>      }
>  }
>  
> -#if defined(CONFIG_USER_ONLY)
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
> -#else
> -
>  void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
>  {
> +#if defined(CONFIG_USER_ONLY)
> +    g_assert_not_reached();
> +#endif
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          env->regs[13] = val;
>      } else {
> @@ -486,13 +471,15 @@ void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
>  
>  uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
>  {
> +#if defined(CONFIG_USER_ONLY)
> +    g_assert_not_reached();
> +#endif
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          return env->regs[13];
>      } else {
>          return env->banked_r13[bank_number(mode)];
>      }
>  }
> -#endif
>  
>  void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
>                                   uint32_t isread)
> -- 
> 1.9.1
> 
