Received: by 10.25.208.211 with SMTP id h202csp735226lfg;
        Thu, 18 Feb 2016 09:42:05 -0800 (PST)
X-Received: by 10.55.81.87 with SMTP id f84mr10330207qkb.10.1455817325066;
        Thu, 18 Feb 2016 09:42:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 83si9024291qhz.40.2016.02.18.09.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:42:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSaa-0004CZ-Ja
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:42:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSaX-0004CI-5C
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:42:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSaS-0000tW-6H
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:42:01 -0500
Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230]:36085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSaR-0000sr-Pe; Thu, 18 Feb 2016 12:41:56 -0500
Received: by mail-lf0-x230.google.com with SMTP id 78so37631766lfy.3;
	Thu, 18 Feb 2016 09:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=u+5kjdVYrMRxF0kI6VgoSHTxw2FA7kfuBLMS+s6CCbg=;
	b=YbiLTwICibr5B3qbcQ62gyTVTKvXlANJnqVBHcJvytcXLcpw3RDI+jQ3mUTjzrUbAF
	XEiW9I/BR5x145QeYP6pJ9yMlBamai/n1UylIlBX0d/PWbd8N26fbxRxxsOGLFuYpTDo
	cL/zEzNoSD+Bc5NngLdFVIEMUOtl3GXlNNl4vVWC8HfbZOBCw9VBE2EeiGJBfwWb94VV
	K0AQCmlzcngsyYvqcsNMUYpYr616zV+Dbva1ua39sUkY/uudTZeJzi964JEGZ71/fDtP
	vvd9+5ume+7gNBi5MNqBcAgsOCjmFDYyxpk6+RbngekzcBJ0agLmt4uG4GlHXhPIp+Tb
	rDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=u+5kjdVYrMRxF0kI6VgoSHTxw2FA7kfuBLMS+s6CCbg=;
	b=W6DmSyaGLPxeh5IQF1f2kdJHZBJoSpSUMTC1ciLRAW3szH0v2LymPu3kWNfiqzS/5l
	K2hwXlib0F/2nSwbV00T+Pj74fVPXC1c+8KnpYy9hFoBATAVukuu6zechkarNCJe2X4c
	0wSpyhj3NUycCH2sivEgmiwnMU1ei4KO/u+67LFs9Fd6Gn+grYYg/+dIh4yRpNDRV/eR
	YLnWXwoaE/DOsD2nlqCG+q4V+2RMvRMaL9/lKw5hmyeXqAd1nnt9i6hbg7qyCDpC2Eov
	FLZ2ovNPhnAoQEi8KhEBMdyvvtGOpQkFqh3A00QE7Y/6ewef3kOhsxaVTkV+2qKJqJAR
	hSww==
X-Gm-Message-State: AG10YOQl9gQs77LigZ7vEcQh8+UtdzMonTSUXhpR5PeEFoza6Pcwgi+HcRE889Rm0eCkBQ==
X-Received: by 10.25.155.72 with SMTP id d69mr3146013lfe.134.1455817314612;
	Thu, 18 Feb 2016 09:41:54 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	b5sm1083280lbc.14.2016.02.18.09.41.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:41:53 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C6025F.4060005@gmail.com>
Date: Thu, 18 Feb 2016 20:41:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::230
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 01/11] target-arm: Give CPSR setting on
 32-bit exception return its own helper
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
X-TUID: Kh8H+bx4FUkN

On 15.02.2016 20:22, Peter Maydell wrote:
> The rules for setting the CPSR on a 32-bit exception return are
> subtly different from those for setting the CPSR via an instruction
> like MSR or CPS. (In particular, in Hyp mode changing the mode bits
> is not valid via MSR or CPS.) Split the exception-return case into
> its own helper for setting CPSR, so we can eventually handle them
> differently in the helper function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.h    | 1 +
>  target-arm/op_helper.c | 6 ++++++
>  target-arm/translate.c | 6 +++---
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/helper.h b/target-arm/helper.h
> index c98e9ce..ea13202 100644
> --- a/target-arm/helper.h
> +++ b/target-arm/helper.h
> @@ -57,6 +57,7 @@ DEF_HELPER_2(pre_smc, void, env, i32)
>  DEF_HELPER_1(check_breakpoints, void, env)
>  
>  DEF_HELPER_3(cpsr_write, void, env, i32, i32)
> +DEF_HELPER_2(cpsr_write_eret, void, env, i32)
>  DEF_HELPER_1(cpsr_read, i32, env)
>  
>  DEF_HELPER_3(v7m_msr, void, env, i32, i32)
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 538887c..e3ddd5a 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -425,6 +425,12 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>      cpsr_write(env, val, mask);
>  }
>  
> +/* Write the CPSR for a 32-bit exception return */
> +void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
> +{
> +    cpsr_write(env, val, CPSR_ERET_MASK);
> +}
> +
>  /* Access to user mode registers from privileged modes.  */
>  uint32_t HELPER(get_user_reg)(CPUARMState *env, uint32_t regno)
>  {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index e69145d..413f7de 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -4094,7 +4094,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
>      TCGv_i32 tmp;
>      store_reg(s, 15, pc);
>      tmp = load_cpu_field(spsr);
> -    gen_set_cpsr(tmp, CPSR_ERET_MASK);
> +    gen_helper_cpsr_write_eret(cpu_env, tmp);
>      tcg_temp_free_i32(tmp);
>      s->is_jmp = DISAS_JUMP;
>  }
> @@ -4102,7 +4102,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
>  /* Generate a v6 exception return.  Marks both values as dead.  */
>  static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
>  {
> -    gen_set_cpsr(cpsr, CPSR_ERET_MASK);
> +    gen_helper_cpsr_write_eret(cpu_env, cpsr);
>      tcg_temp_free_i32(cpsr);
>      store_reg(s, 15, pc);
>      s->is_jmp = DISAS_JUMP;
> @@ -9094,7 +9094,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  if (exc_return) {
>                      /* Restore CPSR from SPSR.  */
>                      tmp = load_cpu_field(spsr);
> -                    gen_set_cpsr(tmp, CPSR_ERET_MASK);
> +                    gen_helper_cpsr_write_eret(cpu_env, tmp);
>                      tcg_temp_free_i32(tmp);
>                      s->is_jmp = DISAS_JUMP;
>                  }

