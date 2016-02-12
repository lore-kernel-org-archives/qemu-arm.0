Received: by 10.25.159.19 with SMTP id i19csp688868lfe;
        Fri, 12 Feb 2016 00:56:28 -0800 (PST)
X-Received: by 10.140.168.85 with SMTP id o82mr448772qho.10.1455267388741;
        Fri, 12 Feb 2016 00:56:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i84si14704378qhc.45.2016.02.12.00.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 00:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aU9We-0008Lk-CI
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 03:56:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9Wb-0008LR-G9
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9WY-0000so-9j
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:56:25 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aU9WX-0000rc-TC; Fri, 12 Feb 2016 03:56:22 -0500
Received: by mail-lf0-x242.google.com with SMTP id j99so3817566lfi.2;
	Fri, 12 Feb 2016 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=3hyVYug8GYPoRpcsDST4cLiP1Zpf6Az02ImAmRVNHiY=;
	b=dSZTZ58IFnKEqemz82KxWuO5wLQP+7mVOMTFyUdUPz9twj2F6SaueYm/oXiMw7e3Kq
	KGzPOg09bJiLRP3WBSoPevoXUJmnHLTaH8vKVmNSQB8l5qghS9ulmoYlUUaxkNBvBbE/
	RFRriIVbE8uu8dfPNPLC0WgQ08/0FeWutDQhg9k7H4x4OJyzasjRprAbkfltSpGPUW98
	hwXpBjT+Obwbl1fPnBekrENt5hu9lhNuIcu+244kNFbHJLp6Nl3aYJhPDo7UyGfC8BB0
	Sgijzh+sFIdFVehOCTDQbQCCf6fWToIoXuq6IMDfGczeAF1TL5gZdeorzBbcSPBp+MpP
	wCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3hyVYug8GYPoRpcsDST4cLiP1Zpf6Az02ImAmRVNHiY=;
	b=gPMKGgVNSWRraSohr1818WHx2nGYvwbeo7u31pN03fh6Xi+eNKjcBbOnCJrJvdYfrc
	bcQnSCfjbdJ/JYawH+L76dtw+hH1XgOxT6puGGj+jBfCM5qKWWhTKDs0FEwCJ5pzUBSg
	rwU99gJD8bGzZ4b/BDSf4dk+S9bXkI8R1Ofp+p+cDoeTrx7ISrL48WX6wak27Mtx18zd
	fG9uOJjoWrg0bLC2DDzaiKEEjd4btZ2aXg0zZO/7LkIjtnJ2dyYVX0Y45QPDuKfYyr7k
	Iv8iRJJmLEzeV4AuDr7SYc5OvGmATwWYBc8ZdJGfdJG9oUU6LAl0rhBh4eC2FpaZxTXJ
	PVUg==
X-Gm-Message-State: AG10YOQFVcMW2KhN7nFp74uM+jxaNGk6+dSEGmtuhFGr8qBL4D94MmcLl186I2fp0/wrBQ==
X-Received: by 10.25.79.14 with SMTP id d14mr176784lfb.98.1455267381063;
	Fri, 12 Feb 2016 00:56:21 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	um4sm1740538lbb.1.2016.02.12.00.56.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 00:56:19 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-3-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BD9E33.3080307@gmail.com>
Date: Fri, 12 Feb 2016 11:56:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455217909-28317-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: qemu-arm@nongnu.org, patches@linaro.org
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
X-TUID: vBV47AwfqJ8c

On 11.02.2016 22:11, Peter Maydell wrote:
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

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

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

