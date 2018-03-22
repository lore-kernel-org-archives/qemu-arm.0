Received: by 10.28.71.155 with SMTP id m27csp67512wmi;
        Thu, 22 Mar 2018 01:23:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt8conpF9DOy7UNz/YutMBYh/zgFz7jMkXsQyhxw12Qn82Jozs+Ym6D4Y06hli2KAtQqO1i
X-Received: by 10.55.4.132 with SMTP id 126mr33680796qke.277.1521706992670;
        Thu, 22 Mar 2018 01:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521706992; cv=none;
        d=google.com; s=arc-20160816;
        b=U0spyZlZNVBH4qeyNKqgd6jsuDlUudYDDNmrmafOy0MWkAPyaBi2D3oIPtUINoVjjm
         ijzUBQ6Fe/ZBP5r+O7GyiGcDeF3uA1vwMMApPuThY8Gt4jUrPT7EMJVUbqybgEkAnITv
         CPl7NXrx2K4suTIb5YChg/e3aCMcjJV068x/3ECulf6ZNq9DYb9Cw+M1C83dsjc+JhnP
         J6ypCfaKlSBC/9nVXKyXYINeB5m176m3rFqGlu8pBxml7pJiZTMDV/uyAI0pJwPwlDJC
         6TD1nvgswB8gMPmoEXLxluRHkPJP03+SzkqVzRcbGojaexzSazFWQZOoKSE/S7tkobLg
         x90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=AT+Fl4J5A5Tn63Wj1fhopsW/HG+R8OB/TsPWeyhbqGE=;
        b=gtZbkHK1TZgFn3nwJyDTST1G0xSKVLK6G6zY8jCTT+5WksBk6Amk43C/eDVYj05cgx
         /64Ua9xnUE4LDrKJToKHq0gvUXmslPLkyJ+f4Edduzf9RadJE/aLTp1FYN+PsIbTvEG+
         SKNQxDErxSdGOB1TnkVxCvEZDRYnf622zfpjmNLpU7R/RH7tqF1x+GsukigHMtpfw8VW
         xFHZsybaXTUb8pTEIbPnJw7ZWp3drKNH89oOWBz/l4xsJw/SUxpH8GimebyzqPkE1BQm
         9Tj/nwzdQRIyhhwOxvuuL6u7W1P9Qa5O1d7LXJmYx24ar7BOhHUBClX7iowlre9QbdSG
         DzdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fj6ApDWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si5743178qtl.217.2018.03.22.01.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fj6ApDWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvVA-00027p-2j
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:23:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvUx-00024v-Hl
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:23:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvUv-0002ES-QH
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:22:59 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvUr-0002BJ-9R; Thu, 22 Mar 2018 04:22:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id w12so454946qti.4;
	Thu, 22 Mar 2018 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AT+Fl4J5A5Tn63Wj1fhopsW/HG+R8OB/TsPWeyhbqGE=;
	b=Fj6ApDWNbWW7O+kQyAiXdAdRoTfLXs3Zyk93poKRTxI1LVWKjswD51F3pfTUxwpIWb
	7xSEpm9BHOGBH9Hjh8MKJxpaH0ofBYyb677GBZ0mw6yg55r7KH5W9kRn+gQifsu5Byqv
	E1A20XK+3JKSurWgzfkB9DhfrOO2R1jvUnFDCmriHYGUNz5mwqjdI4bko2cpVce88vfr
	3L5DsEKkIXXZnzl6CSC+orgwH92RykE3WTFIVHivRu6ZQzrRyhnURlClF1so29CZZ7s6
	WiO6PugrjvEKOUOuh+723NqQJw90kqx3IoQCdHh+GhKvNsRRMQS61RLtm1/rMNKrtCBK
	Rs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AT+Fl4J5A5Tn63Wj1fhopsW/HG+R8OB/TsPWeyhbqGE=;
	b=Gy07FEv3g5w9Q7jZjfIqMukn+wv+5Blma4OsntSc9CTnEDyMK4PGCxzfnZjpxZUyGu
	6mD5n1301YWUFhU1q5czG79qSYSv0FVZh/rey7Eu9GCeXKK9PEL57vZd/8R1GGiDNPaA
	rufkaQtiFiiX/ZXKLkgQxrg1IigvOnncyCUHVtchjx4jExRJAAiRhx55ohUf1NUPLuON
	rm0Ou9wzwd0pFLpJffjfKTyFN5gnrT9wTVPFh26k2CI0P/nfZ3arj5rl2eVHDlErRD1p
	eUWHa/SFbYZzpsRIdUN1XX3lKXmBDnBO+LM1fI3GMk/rBK7R7HusbdoKa2vf6DCKGK1v
	+DHQ==
X-Gm-Message-State: AElRT7HFyQrtIyRKr0/2EjJmAn9Drg0i2Fdpff5wHGxLQ/8iiL8jbz8x
	fi9dPfrTAbJ20wNJP8AnFT8F8PoW
X-Received: by 10.200.2.11 with SMTP id k11mr33325128qtg.292.1521706972564;
	Thu, 22 Mar 2018 01:22:52 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157])
	by smtp.gmail.com with ESMTPSA id m3sm4472341qtb.32.2018.03.22.01.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:22:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8a1e0f57-66d8-3662-d250-0252853f0112@amsat.org>
Date: Thu, 22 Mar 2018 09:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320134114.30418-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH for-2.12 1/4] target/arm: Honour MDCR_EL2.TDE
 when routing exceptions due to BKPT/BRK
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
X-TUID: e64nhJdV/WZx

Hi Peter,

On 03/20/2018 02:41 PM, Peter Maydell wrote:
> The MDCR_EL2.TDE bit allows the exception level targeted by debug
> exceptions to be set to EL2 for code executing at EL0.  We handle
> this in the arm_debug_target_el() function, but this is only used for
> hardware breakpoint and watchpoint exceptions, not for the exception
> generated when the guest executes an AArch32 BKPT or AArch64 BRK
> instruction.  We don't have enough information for a translate-time
> equivalent of arm_debug_target_el(), so instead make BKPT and BRK
> call a special purpose helper which can do the routing, rather than
> the generic exception_with_syndrome helper.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h        |  1 +
>  target/arm/op_helper.c     |  8 ++++++++
>  target/arm/translate-a64.c | 15 +++++++++++++--
>  target/arm/translate.c     | 19 ++++++++++++++-----
>  4 files changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 0d2094f2be..34e8cc8904 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>                     i32, i32, i32, i32)
>  DEF_HELPER_2(exception_internal, void, env, i32)
>  DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
> +DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
>  DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_2(wfi, void, env, i32)
>  DEF_HELPER_1(wfe, void, env)
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 7a88fd2c92..4b123d2bd6 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -483,6 +483,14 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
>      raise_exception(env, excp, syndrome, target_el);
>  }
>  
> +/* Raise an EXCP_BKPT with the specified syndrome register value,
> + * targeting the correct exception level for debug exceptions.
> + */
> +void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
> +{
> +    raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
> +}
> +
>  uint32_t HELPER(cpsr_read)(CPUARMState *env)
>  {
>      return cpsr_read(env) & ~(CPSR_EXEC | CPSR_RESERVED);
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 31ff0479e6..510951f7c7 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -321,6 +321,18 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> +static void gen_exception_bkpt_insn(DisasContext *s, int offset,
> +                                    uint32_t syndrome)
> +{
> +    TCGv_i32 tcg_syn;
> +
> +    gen_a64_set_pc_im(s->pc - offset);
> +    tcg_syn = tcg_const_i32(syndrome);
> +    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
> +    tcg_temp_free_i32(tcg_syn);
> +    s->base.is_jmp = DISAS_NORETURN;
> +}
> +
>  static void gen_ss_advance(DisasContext *s)
>  {
>      /* If the singlestep state is Active-not-pending, advance to
> @@ -1839,8 +1851,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
>              break;
>          }
>          /* BRK */
> -        gen_exception_insn(s, 4, EXCP_BKPT, syn_aa64_bkpt(imm16),
> -                           default_exception_el(s));
> +        gen_exception_bkpt_insn(s, 4, syn_aa64_bkpt(imm16));
>          break;
>      case 2:
>          if (op2_ll != 0) {
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ba6ab7d287..68f0c585f4 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1248,6 +1248,18 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> +static void gen_exception_bkpt_insn(DisasContext *s, int offset, int syn)

Can you use the same Aa64 prototype when applying please?
(int syn -> uint32_t syndrome)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +{
> +    TCGv_i32 tcg_syn;
> +
> +    gen_set_condexec(s);
> +    gen_set_pc_im(s, s->pc - offset);
> +    tcg_syn = tcg_const_i32(syn);
> +    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
> +    tcg_temp_free_i32(tcg_syn);
> +    s->base.is_jmp = DISAS_NORETURN;
> +}
> +
>  /* Force a TB lookup after an instruction that changes the CPU state.  */
>  static inline void gen_lookup_tb(DisasContext *s)
>  {
> @@ -8774,9 +8786,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              case 1:
>                  /* bkpt */
>                  ARCH(5);
> -                gen_exception_insn(s, 4, EXCP_BKPT,
> -                                   syn_aa32_bkpt(imm16, false),
> -                                   default_exception_el(s));
> +                gen_exception_bkpt_insn(s, 4, syn_aa32_bkpt(imm16, false));
>                  break;
>              case 2:
>                  /* Hypervisor call (v7) */
> @@ -11983,8 +11993,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>          {
>              int imm8 = extract32(insn, 0, 8);
>              ARCH(5);
> -            gen_exception_insn(s, 2, EXCP_BKPT, syn_aa32_bkpt(imm8, true),
> -                               default_exception_el(s));
> +            gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
>              break;
>          }
>  
> 
