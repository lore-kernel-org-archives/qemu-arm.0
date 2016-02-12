Received: by 10.25.159.19 with SMTP id i19csp869481lfe;
        Fri, 12 Feb 2016 06:59:07 -0800 (PST)
X-Received: by 10.140.251.70 with SMTP id w67mr2422267qhc.99.1455289147042;
        Fri, 12 Feb 2016 06:59:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si16109922qki.75.2016.02.12.06.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:59:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFBa-0001Cs-Lx
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:59:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFBD-0000vR-6f
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFB8-0007zK-Dc
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:58:43 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFB8-0007z8-21; Fri, 12 Feb 2016 09:58:38 -0500
Received: by mail-pa0-x242.google.com with SMTP id gc2so161111pab.3;
	Fri, 12 Feb 2016 06:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zGb/AiPQXjmlhGibNq9bv3Kwmb5Gjop6ZbqHyDwv9xQ=;
	b=S0QAg1rXxUukVQHzNwTsCSOz7WvEWK9BOgLESDL3xOqL/ldu6VzLPeXTO2+Xsymxr3
	Dg7VQYvbJ9oCZ7aOXrsC8GTj5OL0X4RSUEWIqYqfuJlvzx9XHkmN4l8f+k0KJ9tHoYH1
	J9LA+ZMIaoo3kqs87zjxiBbFji3WyS7kJQHg6iTSpHJV2v6vBfJ0VA4s202ga676zTSJ
	Bo8xOg39cWfaQTZIJvT1q/6Tw2tqA02JtUwW5uoNG6CNDtcXjM1Dpt7GWVw6KLUUYtav
	sUEhFhla2zsNBL92yRzI9XgqD8HMbCfLSRSh6CiXBGPuc670PoV4gzSW9acpPFyuf6WZ
	wCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=zGb/AiPQXjmlhGibNq9bv3Kwmb5Gjop6ZbqHyDwv9xQ=;
	b=ELw3vFCnHcPUUNjY2SZ1u9lJyGAKO5DDneC4CDe1VlNwvtTYQSLI9qZ0Z2xmt20vEi
	YNBshU5HauKrE1EM0/9+7ik23DK2MoO5hf5KkPpHnjI3L9wzTOHRWsRt9nWtDa2Y92+D
	Y7GRmSXQ15l+FGCdJEAgarIkYSuCIgg9EOeU1ObbQUU1vrURAKmQyKmVSRXnxXGV2Lnu
	VS2SXehRFRJxaXBwsyA0vN4ztL4ZlCz30/19j3RuiDHcVNxC1K/tv4HTcGM4yJerFpHm
	s2qljIk8VYi6zniwszpjdlIwDiKy56145jGx7DrlQF2qTw9byJHUcmX1eBgeD3Gim0wm
	ku1A==
X-Gm-Message-State: AG10YOTXXe/hmrW5y+b8xHknrq1u195XnLGKXHDGEh7gp5iusIDit6RTKFNdpkHp7jTu0w==
X-Received: by 10.66.244.194 with SMTP id xi2mr2620360pac.139.1455289117263;
	Fri, 12 Feb 2016 06:58:37 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	n68sm20111528pfj.46.2016.02.12.06.58.35
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 06:58:36 -0800 (PST)
Date: Fri, 12 Feb 2016 15:56:08 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212145608.GE31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455217909-28317-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 1/4] target-arm: Clean up trap/undef
	handling of SRS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RUxnDBzS6hM5

On Thu, Feb 11, 2016 at 07:11:46PM +0000, Peter Maydell wrote:
> The SRS instruction is:
>  * UNDEFINED in Hyp mode
>  * UNPREDICTABLE in User or System mode
>  * UNPREDICTABLE if the specified mode isn't accessible
>  * trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
> 
> Clean up the code to handle all these cases cleanly, including
> picking UNDEF as our choice of UNPREDICTABLE behaviour rather
> blindly trusting the mode field passed in the instruction.
> As part of this, move the check for IS_USER into gen_srs()
> itself rather than having it done by the caller.
> 
> The exception is that we don't UNDEF for calls from System
> mode, which need a runtime check. This will be dealt with in
> the following commits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/translate.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 5 deletions(-)
> 
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index cf3dc33..7bceb05 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7578,8 +7578,67 @@ static void gen_srs(DisasContext *s,
>                      uint32_t mode, uint32_t amode, bool writeback)
>  {
>      int32_t offset;
> -    TCGv_i32 addr = tcg_temp_new_i32();
> -    TCGv_i32 tmp = tcg_const_i32(mode);
> +    TCGv_i32 addr, tmp;
> +    bool undef = false;
> +
> +    /* SRS is:
> +     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
> +     * - UNDEFINED in Hyp mode
> +     * - UNPREDICTABLE in User or System mode
> +     * - UNPREDICTABLE if the specified mode is:
> +     * -- not implemented
> +     * -- not a valid mode number
> +     * -- a mode that's at a higher exception level
> +     * -- Monitor, if we are Non-secure
> +     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
> +     * "current mode is System" we will write a garbage SPSR.
> +     * (This is because we don't have access to our current mode here
> +     * and would have to do a runtime check to UNDEF for System.)
> +     */
> +    if (s->current_el == 1 && !s->ns) {
> +        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
> +        return;
> +    }
> +
> +    if (s->current_el == 0 || s->current_el == 2) {
> +        undef = true;
> +    }
> +
> +    switch (mode) {
> +    case ARM_CPU_MODE_USR:
> +    case ARM_CPU_MODE_FIQ:
> +    case ARM_CPU_MODE_IRQ:
> +    case ARM_CPU_MODE_SVC:
> +    case ARM_CPU_MODE_ABT:
> +    case ARM_CPU_MODE_UND:
> +    case ARM_CPU_MODE_SYS:
> +        break;
> +    case ARM_CPU_MODE_HYP:
> +        if (s->current_el == 1 || !arm_dc_feature(s, ARM_FEATURE_EL2)) {
> +            undef = true;
> +        }
> +        break;
> +    case ARM_CPU_MODE_MON:
> +        /* No need to check specifically for "are we non-secure" because
> +         * we've already made EL0 UNDEF and handled the trap for S-EL1;
> +         * so if this isn't EL3 then we must be non-secure.
> +         */
> +        if (s->current_el != 3) {
> +            undef = true;
> +        }
> +        break;
> +    default:
> +        undef = true;
> +    }
> +
> +    if (undef) {
> +        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
> +                           default_exception_el(s));
> +        return;
> +    }
> +
> +    addr = tcg_temp_new_i32();
> +    tmp = tcg_const_i32(mode);
>      gen_helper_get_r13_banked(addr, cpu_env, tmp);
>      tcg_temp_free_i32(tmp);
>      switch (amode) {
> @@ -7739,9 +7798,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              }
>          } else if ((insn & 0x0e5fffe0) == 0x084d0500) {
>              /* srs */
> -            if (IS_USER(s)) {
> -                goto illegal_op;
> -            }
>              ARCH(6);
>              gen_srs(s, (insn & 0x1f), (insn >> 23) & 3, insn & (1 << 21));
>              return;
> -- 
> 1.9.1
> 
