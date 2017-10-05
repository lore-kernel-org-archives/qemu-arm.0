Received: by 10.223.197.9 with SMTP id q9csp538507wrf;
        Thu, 5 Oct 2017 06:07:39 -0700 (PDT)
X-Received: by 10.200.42.136 with SMTP id b8mr21162117qta.52.1507208859639;
        Thu, 05 Oct 2017 06:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507208859; cv=none;
        d=google.com; s=arc-20160816;
        b=VHmcEfEhNtsCVC9CDdRol+1TYsW/nWI0p8WC+cfDp9l0fcOQTHXWaJNzPJ6jlEcPmI
         i4SJttfXlGa6Cah+Cdo0USg+XHopcmdsU4yoGo0mrWEDqsODzc6MvrLEb7t4SQmoXMWu
         ZiQPq1mRSHgpitq2X93qyNjKtlLVdBEosbmDNdSDD3iHuDizh+n4yiBgDauTOgxwvg29
         JpoYtVGblqaN4QiaUdlqPcvZZGO3RwUh4i6D2SJD/HeOaaRifN6+PO/94Ok541WTVHfC
         Ctjw+9Yf1mK7eIYsQUdSymhAWf41qo/4at/J9VZVIiL4kQng1Z2/IUVZlnhDlrg7AQ3s
         IQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+fmp2rZaLgacBapq1Kr7IfV7N0g4vr5zPBSRpIkfCxc=;
        b=hRG+GyxarDVzq3fG0VzO3ZtLfBeDPhUpuecL5+YXKBLKvOOuR+F1FBfnpC/3yDClN0
         iyloe9sPmscGTcZ+3UaCX5jB1dZETqL7HW5r04/Gou4MbhffTAR97Bb3cImMIzsM2ecZ
         5UrAF2phm7cweQ115u49nUsxJRehCi4dSzF/CN80dJwuyd4mVFahFEHlc360HpR1lpgy
         ga2msUZNmyAGedpPdDgfGA+0Y/rl0I5jNB8VUphqMoNq4MOMPnrORwv3RA6AeIisHxi7
         HvhhDjSMDKS4/FwSF68UYuBASQNxrEX+d7ZrmFHrUsqaj/81U8ELyVMRAD3dpSEc3x+3
         U+Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=owez1xNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si2600464qtd.448.2017.10.05.06.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 06:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=owez1xNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e05sJ-0004vm-3l
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 09:07:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e05s6-0004ul-ID
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 09:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e05s0-0006hf-Cf
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 09:07:26 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:53967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e05rp-0006Ny-Hv; Thu, 05 Oct 2017 09:07:09 -0400
Received: by mail-qt0-x241.google.com with SMTP id 47so25124100qts.10;
	Thu, 05 Oct 2017 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+fmp2rZaLgacBapq1Kr7IfV7N0g4vr5zPBSRpIkfCxc=;
	b=owez1xNJ4r1iPZ5spXHM3ceg27JFlsDNEYTbvQGonNAGXLk5kGpkvjakJfEKmp4ho5
	VX7iY6Fo6smFkEtpTNdKfA8syiIjEFQKTwaB/mwy5lvR4NoMRdJdb8Zmk24wle+EAR+P
	RCKVb5U6jF7ufsA2ae+dW+s8MsojY2/ONekpzuqxWvoQYAXPfZKMShWpWCLEcpwWxWbI
	/mhzN6iimFc269fIULVQRmU78gjAuBiohKlhhTuT+PuiAGD4wblKG6q8bmS8YhUQeaMB
	GN3TIjM68CGu/1t1uonJcyMGZJ5gk74LpKLlYsyyfJBnR9OrtrN3EZhEK9Sjf6XVdTEd
	pswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+fmp2rZaLgacBapq1Kr7IfV7N0g4vr5zPBSRpIkfCxc=;
	b=b6KGcTBZS+zPVHECDTQP9/krPdNl6zqTra2WIeMtJndoqCOzywCuggvWWV1f9IRtHS
	RJYNzfwirJz0+oVHK5Ih84C74etfjAGeKzUXb8TDfzCheWb6VcaU+iq/bbGsSPLSAtI0
	splddTWf5cwU82Msv7O6eKmx7r+O1g34l5la/AuRewu599J8JRM4FodIji0W7SkEh6PV
	IpEnXOa35veFGZ7RPYF0ltNEHLW2iZVJ0H+J/rap3AJAUk0klVXE4EbaPqx0lM285wVm
	7HpqEDguG7lnxBqGIysyyApuSkN2uHbRllrQSUmHD0eDKed/2U1Zxic95DXS/wrPVUBf
	tZzQ==
X-Gm-Message-State: AMCzsaWRbRaiBTzqX9D3Ga24iv+xZMsAwqYC+BYa9qg+/ULkEHXH5a+q
	EXPmT2nA4t4CqAIBLhijF1g=
X-Google-Smtp-Source: AOwi7QDpLszJAwq5O8pexs/QwM+jw7SP0Z9Az0JQ2/fcEsuY9Z7ZGJ7w+QzE6V4Acoe8xUgoxA8Nsg==
X-Received: by 10.237.36.146 with SMTP id t18mr28128505qtc.17.1507208828816;
	Thu, 05 Oct 2017 06:07:08 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	x68sm11289814qkc.84.2017.10.05.06.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 06:07:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2fc8208b-a3d6-001d-a60d-fe3250f7befe@amsat.org>
Date: Thu, 5 Oct 2017 10:07:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 18/20] target/arm: Implement BLXNS
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
X-TUID: r4OdKEG3FBYb

On 09/22/2017 12:00 PM, Peter Maydell wrote:
> Implement the BLXNS instruction, which allows secure code to
> call non-secure code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.h    |  1 +
>  target/arm/internals.h |  1 +
>  target/arm/helper.c    | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c | 17 +++++++++++++--
>  4 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 64afbac..2cf6f74 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -64,6 +64,7 @@ DEF_HELPER_3(v7m_msr, void, env, i32, i32)
>  DEF_HELPER_2(v7m_mrs, i32, env, i32)
>  
>  DEF_HELPER_2(v7m_bxns, void, env, i32)
> +DEF_HELPER_2(v7m_blxns, void, env, i32)
>  
>  DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
>  DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fd9a7e8..1746737 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -60,6 +60,7 @@ static inline bool excp_is_internal(int excp)
>  FIELD(V7M_CONTROL, NPRIV, 0, 1)
>  FIELD(V7M_CONTROL, SPSEL, 1, 1)
>  FIELD(V7M_CONTROL, FPCA, 2, 1)
> +FIELD(V7M_CONTROL, SFPA, 3, 1)
>  
>  /* Bit definitions for v7M exception return payload */
>  FIELD(V7M_EXCRET, ES, 0, 1)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8df819d..30dc2a9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5890,6 +5890,12 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>      g_assert_not_reached();
>  }
>  
> +void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
> +{
> +    /* translate.c should never generate calls here in user-only mode */
> +    g_assert_not_reached();
> +}
> +
>  void switch_mode(CPUARMState *env, int mode)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -6182,6 +6188,59 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>      env->regs[15] = dest & ~1;
>  }
>  
> +void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
> +{
> +    /* Handle v7M BLXNS:
> +     *  - bit 0 of the destination address is the target security state
> +     */
> +
> +    /* At this point regs[15] is the address just after the BLXNS */
> +    uint32_t nextinst = env->regs[15] | 1;
> +    uint32_t sp = env->regs[13] - 8;
> +    uint32_t saved_psr;
> +
> +    /* translate.c will have made BLXNS UNDEF unless we're secure */
> +    assert(env->v7m.secure);
> +
> +    if (dest & 1) {
> +        /* target is Secure, so this is just a normal BLX,
> +         * except that the low bit doesn't indicate Thumb/not.
> +         */
> +        env->regs[14] = nextinst;
> +        env->thumb = 1;
> +        env->regs[15] = dest & ~1;
> +        return;
> +    }
> +
> +    /* Target is non-secure: first push a stack frame */
> +    if (!QEMU_IS_ALIGNED(sp, 8)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "BLXNS with misaligned SP is UNPREDICTABLE\n");
> +    }
> +
> +    saved_psr = env->v7m.exception;
> +    if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK) {
> +        saved_psr |= XPSR_SFPA;
> +    }
> +
> +    /* Note that these stores can throw exceptions on MPU faults */
> +    cpu_stl_data(env, sp, nextinst);
> +    cpu_stl_data(env, sp + 4, saved_psr);
> +
> +    env->regs[13] = sp;
> +    env->regs[14] = 0xfeffffff;
> +    if (arm_v7m_is_handler_mode(env)) {
> +        /* Write a dummy value to IPSR, to avoid leaking the current secure
> +         * exception number to non-secure code. This is guaranteed not
> +         * to cause write_v7m_exception() to actually change stacks.
> +         */
> +        write_v7m_exception(env, 1);
> +    }
> +    switch_v7m_security_state(env, dest & 1);
> +    env->thumb = 1;
> +    env->regs[15] = dest & ~1;
> +}
> +
>  static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
>                                  bool spsel)
>  {
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ab1a12a..53694bb 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1013,6 +1013,20 @@ static inline void gen_bxns(DisasContext *s, int rm)
>      s->base.is_jmp = DISAS_EXIT;
>  }
>  
> +static inline void gen_blxns(DisasContext *s, int rm)
> +{
> +    TCGv_i32 var = load_reg(s, rm);
> +
> +    /* We don't need to sync condexec state, for the same reason as blxns.
> +     * We do however need to set the PC, because the blxns helper reads it.
> +     * The blxns helper may throw an exception.
> +     */
> +    gen_set_pc_im(s, s->pc);
> +    gen_helper_v7m_blxns(cpu_env, var);
> +    tcg_temp_free_i32(var);
> +    s->base.is_jmp = DISAS_EXIT;
> +}
> +
>  /* Variant of store_reg which uses branch&exchange logic when storing
>     to r15 in ARM architecture v7 and above. The source must be a temporary
>     and will be marked as dead. */
> @@ -11221,8 +11235,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
>                          goto undef;
>                      }
>                      if (link) {
> -                        /* BLXNS: not yet implemented */
> -                        goto undef;
> +                        gen_blxns(s, rm);
>                      } else {
>                          gen_bxns(s, rm);
>                      }
> 
