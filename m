Received: by 10.25.159.19 with SMTP id i19csp697074lfe;
        Fri, 12 Feb 2016 01:16:44 -0800 (PST)
X-Received: by 10.140.96.245 with SMTP id k108mr493529qge.31.1455268603904;
        Fri, 12 Feb 2016 01:16:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k69si9248986qkl.18.2016.02.12.01.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 01:16:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aU9qF-0006Bf-Ca
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 04:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aU9qD-00069j-GZ
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 04:16:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aU9qC-0005v4-Kl
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 04:16:41 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aU9q5-0005uH-9Q; Fri, 12 Feb 2016 04:16:33 -0500
Received: by mail-pf0-x241.google.com with SMTP id 71so3738556pfv.1;
	Fri, 12 Feb 2016 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FN3/sq8qUF0MXzh0chC10Ka2YVTyMb1TXZ+BVIJNRJA=;
	b=hahH1BMTtjmTdJju1mxlMqZPsVZhg0SbXKhYSDuYx7UJrHXla5fKewQA8/cQ7FhVwN
	cJowsBwe6NdbV8ygPLGU6a+w/VKdYPAPUP8PQ8e7yKkHgjEjLnN8KyCr6T43ufg2Mcbd
	JbAjkMScoxMZXeeTyQKBSxglDzgD+JeRZ1QRBpw+d00wxlqGKFPcyGVjojTW1PlcpaP6
	FuscrBHs83pKG1vBdsVtJv8HGkisEUGZwyKbRYvpMRqyN2JJ6luoDVeUJDC5iKdDsWaj
	wtKeTDEnlQOLaqITQj3RIfWBGNmcdlfam+T9BAiurzwRpDgTRgRqA01ugZC8uwF+8l7i
	wM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=FN3/sq8qUF0MXzh0chC10Ka2YVTyMb1TXZ+BVIJNRJA=;
	b=ZDuA3pe1wZLLMlssmUcbsi2DWuuwIWTRXVxXeP4e9VBbUa6gdRAErQszttCp5DLyJt
	Eb+jDUKpSrXPas7WZDsq+8bSSuRBw6L59b6Tbh6cVoiy/3VyRptWqi9TKqsdmt13zHoy
	Ckw/o8UJGw3dQfROL4CbSmcsvD4cldDcdN6jVXCSxIX5qfps1i/86oclxQN3Wi9ZAwry
	SA/xFF3qktQ+AyJON6/fRvzFxn6eDq4SZ97yFNobRVwRXJl2Rka5cVTX3qzVyv+os3Mq
	v18BuDo7x023w9isxQKZWn32cryAh0sJStHqcKSU7NJVyEM4HulaUclxVFnVj0Kl8Xtr
	uU+A==
X-Gm-Message-State: AG10YOSUACPlzxfpojoEWe/H195fnVwQTTkc85ilyGOGrA8vq90J8vh4nwC+UNcymXkLQA==
X-Received: by 10.98.72.133 with SMTP id q5mr616027pfi.166.1455268591085;
	Fri, 12 Feb 2016 01:16:31 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	s21sm17803312pfi.29.2016.02.12.01.16.29
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 01:16:30 -0800 (PST)
Date: Fri, 12 Feb 2016 10:13:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212091352.GB31433@toto>
References: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
	<1455206609-28009-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455206609-28009-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 2/6] target-arm: Fix handling of SCR.SMD
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
X-TUID: JKi/yFed+AMI

On Thu, Feb 11, 2016 at 04:03:25PM +0000, Peter Maydell wrote:
> We weren't quite implementing the handling of SCR.SMD correctly.
> The condition governing whether the SMD bit should apply only
> for NS state is "is EL3 is AArch32", not "is the current EL AArch32".
> Fix the condition, and clarify the comment both to reflect this and
> to expand slightly on what's going on for the v7-no-Virtualization case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
> The bit about forcing SMD to zero confused me, anyway, since I
> expected it to mean "in this function", not elsewhere...
> ---
>  target-arm/op_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index bd48549..4c0980e 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -614,12 +614,14 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>      int cur_el = arm_current_el(env);
>      bool secure = arm_is_secure(env);
>      bool smd = env->cp15.scr_el3 & SCR_SMD;
> -    /* On ARMv8 AArch32, SMD only applies to NS state.
> -     * On ARMv7 SMD only applies to NS state and only if EL2 is available.
> -     * For ARMv7 non EL2, we force SMD to zero so we don't need to re-check
> -     * the EL2 condition here.
> +    /* On ARMv8 with EL3 AArch64, SMD applies to both S and NS state.
> +     * On ARMv8 with EL3 AArch32, or ARMv7 with the Virtualization
> +     *  extensions, SMD only applies to NS state.
> +     * On ARMv7 without the Virtualization extensions, the SMD bit
> +     * doesn't exist, but we forbid the guest to set it to 1 in scr_write(),
> +     * so we need not special case this here.
>       */
> -    bool undef = is_a64(env) ? smd : (!secure && smd);
> +    bool undef = arm_feature(env, ARM_FEATURE_AARCH64) ? smd : smd && !secure;
>  
>      if (arm_is_psci_call(cpu, EXCP_SMC)) {
>          /* If PSCI is enabled and this looks like a valid PSCI call then
> -- 
> 1.9.1
> 
