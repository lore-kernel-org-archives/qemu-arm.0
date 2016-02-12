Received: by 10.25.159.19 with SMTP id i19csp882276lfe;
        Fri, 12 Feb 2016 07:19:49 -0800 (PST)
X-Received: by 10.140.201.209 with SMTP id w200mr2696663qha.57.1455290389453;
        Fri, 12 Feb 2016 07:19:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 207si16131582qhw.106.2016.02.12.07.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFVc-00048B-TR
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:19:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFVT-0003t7-0k
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFVS-0004O8-1V
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:19:38 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFVL-0004Ni-Kt; Fri, 12 Feb 2016 10:19:31 -0500
Received: by mail-pf0-x244.google.com with SMTP id 71so4107595pfv.1;
	Fri, 12 Feb 2016 07:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f58ICXQn7Z8TMlXvO8qHNqAB314wQ50AGvb0yCha0Tw=;
	b=iVMsDs5AtYdpNxNYcXmgq104uOWZC3M3NC6lhF1U/ahGuTc6eWbsxAT/qU7fn2+g+b
	dVXLnH4gwTSof0/PuCH2Xr8JNW3EX6Lmblj0Jp3BNMkUAkC3uVUlOwwcJxq7XPb72pHJ
	cyCJf1oKvFDX7e0P09tEL5kDlO0da+sxxQNqghV39nRIXmXQCusN/lRxPYHU82RpB993
	Uq9jorAyjN+kQ/TWuGGMhMEQQnPhAfHuC7Nlc9RDHSFvh2kr6HaDbcLdphEVT5esgJLl
	8gd4JwhxDyeGppvGT85jnLm1Fskkg371Sfe9QWV26o9DNKidbYbJcJhpdy5LzpoPV3n5
	G0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=f58ICXQn7Z8TMlXvO8qHNqAB314wQ50AGvb0yCha0Tw=;
	b=e/DxpSuW7mYjtn+XwJD6TgdeThjcQh/W3IoyfasoAsLJXNy2pAzJBr21rNL13Rn0Fl
	L9F/W1XNnGLFVxRpOyxjTaAvn7damMO4hWAwNef7JMxfiEsA7orhAlwy63Gz9FJwU33c
	ypIQuEtBU+7p/HZw/GEHKhV6GbV9ZQ3bY9Y6Cge+CATTZzE7e/VwNzlzFzrVB7ittczF
	IsHUBUiKumY+ZbNHDP439HrYxENk5OXIYtblcxF6XXKwHsWGu2ziTJaK3XwxMyeiKTlj
	9jIRATB/m8hrfNsKDituVcMTgFKBOg4jfZ4rKU/OjBMYiK80NghfuIZZXt8O6VHDlZck
	sMvQ==
X-Gm-Message-State: AG10YOSwbaZxjfAlLQ8Qe3z1UC4yvx0JOKN155Ug+c39bC7Qj9cExlX2T2+7duLQMU382w==
X-Received: by 10.98.74.17 with SMTP id x17mr2977156pfa.14.1455290371019;
	Fri, 12 Feb 2016 07:19:31 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	o17sm20202247pfj.50.2016.02.12.07.19.28
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 07:19:30 -0800 (PST)
Date: Fri, 12 Feb 2016 16:17:02 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212151702.GJ31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455217909-28317-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 4/4] target-arm: UNDEF in the UNPREDICTABLE
 SRS-from-System case
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
X-TUID: 3FzZQ7nb24hF

On Thu, Feb 11, 2016 at 07:11:49PM +0000, Peter Maydell wrote:
> Make get_r13_banked() raise an exception at runtime for the
> corner case of SRS from System mode, so that we can UNDEF it;
> this brings us in to line with the ARM ARM's set of permitted
> CONSTRAINED UNPREDICTABLE choices.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/op_helper.c | 8 ++++++++
>  target-arm/translate.c | 9 +++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 05f97a7..8183108 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -474,6 +474,14 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
>  #if defined(CONFIG_USER_ONLY)
>      g_assert_not_reached();
>  #endif
> +    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_SYS) {
> +        /* SRS instruction is UNPREDICTABLE from System mode; we UNDEF.
> +         * Other UNPREDICTABLE and UNDEF cases were caught at translate time.
> +         */
> +        raise_exception(env, EXCP_UDEF, syn_uncategorized(),
> +                        exception_target_el(env));
> +    }
> +
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          return env->regs[13];
>      } else {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 7bceb05..e69145d 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7590,10 +7590,7 @@ static void gen_srs(DisasContext *s,
>       * -- not a valid mode number
>       * -- a mode that's at a higher exception level
>       * -- Monitor, if we are Non-secure
> -     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
> -     * "current mode is System" we will write a garbage SPSR.
> -     * (This is because we don't have access to our current mode here
> -     * and would have to do a runtime check to UNDEF for System.)
> +     * For the UNPREDICTABLE cases we choose to UNDEF.
>       */
>      if (s->current_el == 1 && !s->ns) {
>          gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
> @@ -7639,6 +7636,9 @@ static void gen_srs(DisasContext *s,
>  
>      addr = tcg_temp_new_i32();
>      tmp = tcg_const_i32(mode);
> +    /* get_r13_banked() will raise an exception if called from System mode */
> +    gen_set_condexec(s);
> +    gen_set_pc_im(s, s->pc - 4);
>      gen_helper_get_r13_banked(addr, cpu_env, tmp);
>      tcg_temp_free_i32(tmp);
>      switch (amode) {
> @@ -7688,6 +7688,7 @@ static void gen_srs(DisasContext *s,
>          tcg_temp_free_i32(tmp);
>      }
>      tcg_temp_free_i32(addr);
> +    s->is_jmp = DISAS_UPDATE;
>  }
>  
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
> -- 
> 1.9.1
> 
