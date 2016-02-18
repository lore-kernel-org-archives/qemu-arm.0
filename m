Received: by 10.25.208.211 with SMTP id h202csp735788lfg;
        Thu, 18 Feb 2016 09:43:27 -0800 (PST)
X-Received: by 10.140.195.203 with SMTP id q194mr11026452qha.45.1455817407111;
        Thu, 18 Feb 2016 09:43:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s95si53977111qgs.25.2016.02.18.09.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:43:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSbu-0006ew-HO
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:43:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSb4-0004v8-Ln
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSb3-0001Ez-2K
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:42:34 -0500
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c]:32943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSb2-0001Es-LB; Thu, 18 Feb 2016 12:42:32 -0500
Received: by mail-lb0-x22c.google.com with SMTP id x4so33381777lbm.0;
	Thu, 18 Feb 2016 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ee46UTVp/tduZdMuY548s8r34ugM6BKc1EvbqeWVqoU=;
	b=VvVAaS7crVuppLyBsgGaCtcOJO80FCIMsjwZe1q/UX6p3Y80X+TC7GYSmtDO8W5r3u
	La+F6NNHrA1wtVpkYycb6CBDDvYGVdnTfLKT7zKpCi8rcb6xGAkiv5Xe13FxvNw690/i
	BMohPLxYYDyYFWHE4QpqPPXHz92+QWnBjX7ARmy/1Nma6dPyaWoM0HV+fn63KQ6v1IG/
	6/A+4le9Z3MeQQRkLyZALJsAeYyB4qEUL733EHGMKoFxurtaWYhk1QtU38UkqEDUEyto
	8gJTzoHG2zBXLzSYc7NqPcD61tZ0I94JpLLIMhLPzkSZwuGVQwrJsjhLbCzMbVIabndq
	MLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ee46UTVp/tduZdMuY548s8r34ugM6BKc1EvbqeWVqoU=;
	b=IsIJ28VA0fMCRy6uFH8JLAUR+l9eAEx2L103P5sxEuMk/cqASRYBVIDm+7n03oU3NT
	P22el11wkxeGnSKVeVt3DjA8xm4HLCoHZQgxhT099qtY3GkQ4a9837MsbuyfYYTCV9rN
	TYOAAl+fui5Cck9cByjjeKiHTbDUvorLDs6JA/GlrTCXjq7yUW2JwyM8tl6OeFg7EnHi
	oiUdcseYLks1WEZjmcCUosV3OJDjgZ7vhmbfYz8CfcAU9JLSlFB8QQMEuKICcrY7Q209
	CaOcj4o9K7lMz9IvVdfXclR2qj35QZghB5rXsz+9jyH1B9zK4vSrOmyymfFSDFcnmTEN
	mQNg==
X-Gm-Message-State: AG10YOS12MS/soMC/4JaA2Q0PSTZHIHdcqWJrVZv4s97L3zEfGY778XaPi1b99UY6EpJ1w==
X-Received: by 10.112.140.169 with SMTP id rh9mr3257863lbb.69.1455817351819;
	Thu, 18 Feb 2016 09:42:31 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rp10sm1089209lbb.13.2016.02.18.09.42.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:42:30 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-4-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C60285.2080007@gmail.com>
Date: Thu, 18 Feb 2016 20:42:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22c
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 03/11] target-arm: Raw CPSR writes should
 skip checks and bank switching
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
X-TUID: Qlco7lX3G+Iz

On 15.02.2016 20:22, Peter Maydell wrote:
> Raw CPSR writes should skip the architectural checks for whether
> we're allowed to set the A or F bits and should also not do
> the switching of register banks if the mode changes. Handle
> this inside cpsr_write(), which allows us to drop the "manually
> set the mode bits to avoid the bank switch" code from all the
> callsites which are using CPSRWriteRaw.
>
> This fixes a bug in 32-bit KVM handling where we had forgotten
> the "manually set the mode bits" part and could thus potentially
> trash the register state if the mode from the last exit to userspace
> differed from the mode on this exit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c    | 5 +++--
>  target-arm/kvm64.c     | 1 -
>  target-arm/machine.c   | 2 --
>  target-arm/op_helper.c | 5 ++++-
>  4 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 828822b..d1919bb 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5234,7 +5234,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>       * In a V8 implementation, it is permitted for privileged software to
>       * change the CPSR A/F bits regardless of the SCR.AW/FW bits.
>       */
> -    if (!arm_feature(env, ARM_FEATURE_V8) &&
> +    if (write_type != CPSRWriteRaw && !arm_feature(env, ARM_FEATURE_V8) &&
>          arm_feature(env, ARM_FEATURE_EL3) &&
>          !arm_feature(env, ARM_FEATURE_EL2) &&
>          !arm_is_secure(env)) {
> @@ -5281,7 +5281,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      env->daif &= ~(CPSR_AIF & mask);
>      env->daif |= val & CPSR_AIF & mask;
>  
> -    if ((env->uncached_cpsr ^ val) & mask & CPSR_M) {
> +    if (write_type != CPSRWriteRaw &&
> +        ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
>          if (bad_mode_switch(env, val & CPSR_M)) {
>              /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.
>               * We choose to ignore the attempt and leave the CPSR M field
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index 08c2c81..e8527bf 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -722,7 +722,6 @@ int kvm_arch_get_registers(CPUState *cs)
>      if (is_a64(env)) {
>          pstate_write(env, val);
>      } else {
> -        env->uncached_cpsr = val & CPSR_M;
>          cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
>      }
>  
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 0fc7df0..03a73d9 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -173,8 +173,6 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size)
>          return 0;
>      }
>  
> -    /* Avoid mode switch when restoring CPSR */
> -    env->uncached_cpsr = val & CPSR_M;
>      cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
>      return 0;
>  }
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 543d33a..4881e34 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -779,7 +779,10 @@ void HELPER(exception_return)(CPUARMState *env)
>  
>      if (!return_to_aa64) {
>          env->aarch64 = 0;
> -        env->uncached_cpsr = spsr & CPSR_M;
> +        /* We do a raw CPSR write because aarch64_sync_64_to_32()
> +         * will sort the register banks out for us, and we've already
> +         * caught all the bad-mode cases in el_from_spsr().
> +         */
>          cpsr_write(env, spsr, ~0, CPSRWriteRaw);
>          if (!arm_singlestep_active(env)) {
>              env->uncached_cpsr &= ~PSTATE_SS;

