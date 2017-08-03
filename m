Received: by 10.25.221.202 with SMTP id w71csp819860lfi;
        Thu, 3 Aug 2017 08:56:53 -0700 (PDT)
X-Received: by 10.55.167.23 with SMTP id q23mr3216667qke.252.1501775813703;
        Thu, 03 Aug 2017 08:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501775813; cv=none;
        d=google.com; s=arc-20160816;
        b=sl0FWmpdZ6RTOSCZBlkRb2YOKuNN0m9oomR+oO5MQB+xLLfvZ+s9SY6ththBn6PNUy
         OSQjkQ3NTXouATgElKRM1Ki7vbQcVFA1XBAUlQlS0S4HGai7Jog95xlK2tpOfLpFbgwU
         I6ACg3A6ZxWoPAjzh7Zxpn5iuPTtpu8avheqCYLvIpS7BscwgybQerL8scgs2S4YkIwN
         2pm9GruTmiU8xLVqRrTd6zyWaxWJJAWQok5Fs7wW+mS0/XbtIL3etYOxzGzdxsfZVfqK
         X/gd65NewNlwZwzoLzeq69D+4Ag40Z4w1iQjnAQUjshY7HXGJy4uF84I9ZVtwx8pxKSu
         jJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=HzqPeTYjvSqjjI/8bbPL0otBJw3J+uHqOR5CI/MVyOU=;
        b=IqwJUi0OxbXYsy1KCzf5DTdydMU4ll9Cdj1Ryjbkcqi9jbuoUvWj0Zqok0wQVdZPSp
         tbc0oE83we/M0vOo61GlnM7awhWEe2osC5LajBHl7D5ZNitEOwNqWCXNB46u904ik/+m
         XJ9sFopcR+3j8qRDYquPL81BnHqNHM8zanTKh3Bx68riFODdHOgm29lRHMB+Ob2q8RfE
         +4GQrjWWinqFzcWGo4XhEWK6n0uROZ2t7/1w2BtKxVHhaC9gyC6tRyV9vXhwrjawwSew
         mXlFhoJJv8/cYOm6KeFFp61HapQvF/mMPo3bDyelFEHQrg0UfkITvaeqnyCPwN2To2HD
         hFuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=BJAKJiFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u80si14828525qki.15.2017.08.03.08.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=BJAKJiFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddIUV-0002EM-1f
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIUP-0002DY-VK
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIUM-0005xQ-SH
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:56:46 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddIUM-0005vy-IT; Thu, 03 Aug 2017 11:56:42 -0400
Received: by mail-lf0-x242.google.com with SMTP id t128so1222649lff.3;
	Thu, 03 Aug 2017 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HzqPeTYjvSqjjI/8bbPL0otBJw3J+uHqOR5CI/MVyOU=;
	b=BJAKJiFAg1OGNy9DwEt0S0GqyrxbpYzABQ+sNQieqq5TNCCv7dbAg1TMsy4IaW9vud
	KuEo04Tu0w9RwhRqvPviNhin6FsPWTXz9VdiAbb/omswqIKZwLbsi0vUV6TASOILtPf1
	wbXhPa5+/FmLk1KLWHbMp850eqvjR11jY0shxUqPdTNZpJns+O9awIVuwQkGSJQjJG3O
	Oh7x7H7GeQ+8Zqz8AYxY+9fgY8ABzzgXhq0mUTHssUH62oRyxINuVz0/2TXC4dWGnUmI
	v629Z5r4jWQUs7E96n1zoLhJna1S15TQOf/fYNQlG/5lfMQ2bA1HLUWAkMWaH1UyNN7R
	zINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HzqPeTYjvSqjjI/8bbPL0otBJw3J+uHqOR5CI/MVyOU=;
	b=o3duFkvyL+qw3SwCO5MT/9nnPkxXGnH/GrTvzrm7Ir1RvjWzWmlItp17pI1QwkLl6K
	8ePo6wS4h2+Zs48XQggMU0di4jVdyJ08wmz/Y4UawCR4/cIEcdpRbEWSr6uVyqz3L0jM
	VVZoPEywXgbQSfJbDSFnYNj7QvTob6EXCIBda5j7IUwKmQD1qspRl72Qim0jCrrcSkVB
	QQ0qgzDOmy9co71JV0M43UZm0oXT9BGueksw6ZwVKbFjvRQBkdbmjTjmyaqwAVvHkr1a
	Ip87TWTlr3Cq1y1wRNh02ReclTuVB+jCH5DI/DeBtDYUIBEoEwpQ3k9SBUpFplL/hhQe
	g3Tg==
X-Gm-Message-State: AIVw112zoP4lKEIof2+Z/ajMO30YGVzUBahLYYFxenFXW05uMpArTwXn
	1UTN/c58QMUTMQ==
X-Received: by 10.46.69.9 with SMTP id s9mr899178lja.141.1501775800897;
	Thu, 03 Aug 2017 08:56:40 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	q192sm667428lfe.85.2017.08.03.08.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:56:40 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:56:39 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803155639.GU4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 13/15] target/arm: Create and use new
 function arm_v7m_is_handler_mode()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mH5zm0zuZLwK

On Wed, Aug 02, 2017 at 05:43:59PM +0100, Peter Maydell wrote:
> Add a utility function for testing whether the CPU is in Handler
> mode; this is just a check whether v7m.exception is non-zero, but
> we do it in several places and it makes the code a bit easier
> to read to not have to mentally figure out what the test is testing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



> ---
>  target/arm/cpu.h    | 10 ++++++++--
>  target/arm/helper.c |  8 ++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index da90b7a..a3b4b78 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1630,13 +1630,19 @@ static inline int arm_highest_el(CPUARMState *env)
>      return 1;
>  }
>  
> +/* Return true if a v7M CPU is in Handler mode */
> +static inline bool arm_v7m_is_handler_mode(CPUARMState *env)
> +{
> +    return env->v7m.exception != 0;

The != 0 shouldn't be needed when you return a bool...
Either way:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> +}
> +
>  /* Return the current Exception Level (as per ARMv8; note that this differs
>   * from the ARMv7 Privilege Level).
>   */
>  static inline int arm_current_el(CPUARMState *env)
>  {
>      if (arm_feature(env, ARM_FEATURE_M)) {
> -        return !((env->v7m.exception == 0) && (env->v7m.control & 1));
> +        return arm_v7m_is_handler_mode(env) || !(env->v7m.control & 1);
>      }
>  
>      if (is_a64(env)) {
> @@ -2636,7 +2642,7 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>      }
>      *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
>  
> -    if (env->v7m.exception != 0) {
> +    if (arm_v7m_is_handler_mode(env)) {
>          *flags |= ARM_TBFLAG_HANDLER_MASK;
>      }
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0ecc8f1..7920153 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6147,7 +6147,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>       * that jumps to magic addresses don't have magic behaviour unless
>       * we're in Handler mode (compare pseudocode BXWritePC()).
>       */
> -    assert(env->v7m.exception != 0);
> +    assert(arm_v7m_is_handler_mode(env));
>  
>      /* In the spec pseudocode ExceptionReturn() is called directly
>       * from BXWritePC() and gets the full target PC value including
> @@ -6254,7 +6254,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>       * resuming in Thread mode. If that doesn't match what the
>       * exception return type specified then this is a UsageFault.
>       */
> -    if (return_to_handler == (env->v7m.exception == 0)) {
> +    if (return_to_handler != arm_v7m_is_handler_mode(env)) {
>          /* Take an INVPC UsageFault by pushing the stack again. */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_INVPC_MASK;
> @@ -6405,7 +6405,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
>          lr |= 4;
>      }
> -    if (env->v7m.exception == 0) {
> +    if (!arm_v7m_is_handler_mode(env)) {
>          lr |= 8;
>      }
>  
> @@ -8798,7 +8798,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>           * switch_v7m_sp() deals with updating the SPSEL bit in
>           * env->v7m.control, so we only need update the others.
>           */
> -        if (env->v7m.exception == 0) {
> +        if (!arm_v7m_is_handler_mode(env)) {
>              switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
>          }
>          env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
> -- 
> 2.7.4
> 
> 
