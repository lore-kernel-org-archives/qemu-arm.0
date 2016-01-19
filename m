Received: by 10.25.159.19 with SMTP id i19csp2574551lfe;
        Tue, 19 Jan 2016 07:59:01 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr38492580qka.20.1453219141174;
        Tue, 19 Jan 2016 07:59:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y130si38099228qka.87.2016.01.19.07.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 07:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLYgO-0003F4-Pc
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 10:59:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYfy-0002cV-FG
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 10:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYfx-0005Jb-7m
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 10:58:34 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYfw-0005Ir-PG
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 10:58:33 -0500
Received: by mail-vk0-x233.google.com with SMTP id k1so350548287vkb.2
	for <qemu-devel@nongnu.org>; Tue, 19 Jan 2016 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=H4ha59UZcJTmPEeFWtMA9EV3QO+gGOKRY46epNUEDZ0=;
	b=ZLSMBm66hY8aYwR99lFMrPn2pzQAU5N2bqBUyO/qT7f3JIrSNp5JnAh5EwLqdncpzx
	4Ct0gdCkSkissSrQGbNVLzL7R5p6ezzhd2MnBaPFn0AzZHuh6ofMuE3EJ7TpiEHSO7WY
	JwyEPCI2GSlmyzoYQeqkq+9rKGJrVL8ZNtGAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H4ha59UZcJTmPEeFWtMA9EV3QO+gGOKRY46epNUEDZ0=;
	b=LfgX15JP8gUkzaxgC23NV4oGYh4WYSzynO7USBRsSFYsllqvJNCJKq9Z/J8lpjrMoo
	YzliBzmVQensTd0btkFuZI6mP1QN8bvBncv+LHx5BsSfPns/Vxzn5p9EuLWRi1nrM8p6
	ftW+9Tn9z2/pZVduvgi0qipCJOekh9/U7H7neDDWnAVdoAT8jvZ9eO7a4wR1LWFEUbfT
	CXRFD3wJym7hmM2zslqQ7PEcShFKoNCviDxj1tQIN2nUFp9KtIIqM33hy38WCYKxzsph
	XsY2teD68MUprOndTFyW/KpJ/MB75rsmoMIOblixVefIqg7H2AJHX8ZkQHYjq4D17Q8w
	up2w==
X-Gm-Message-State: ALoCoQkD2U9rUdJ/t1YZgbkwrePr8XhmlRPPGEN9bPc1SCBRn1asFslorOsxIgGxLd7R+zookAsxzaTm/UZ92qP6/2cKxnaRMmKjefV/JvtWtXkBUXZY8is=
X-Received: by 10.31.194.21 with SMTP id s21mr21034759vkf.92.1453219112278;
	Tue, 19 Jan 2016 07:58:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 07:58:12 -0800 (PST)
In-Reply-To: <fb6f0c034f8a1d36961247f56337aca1f22b3653.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<fb6f0c034f8a1d36961247f56337aca1f22b3653.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 15:58:12 +0000
Message-ID: <CAFEAcA_-X0SMfihg288z7w-pQhAUJH-BS+N3PooPNQAT5dcH6Q@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-devel] [PATCH v1 04/17] target-arm: implement SCTLR.EE
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
X-TUID: wTAsIPH3D3sa

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Implement SCTLR.EE bit which controls data endianess for exceptions
> and page table translations. SCTLR.EE is mirrored to the CPSR.E bit
> on exception entry.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>
>  target-arm/helper.c | 42 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 59d5a41..afac1b2 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5889,7 +5889,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      /* Clear IT bits.  */
>      env->condexec_bits = 0;
>      /* Switch to the new mode, and to the correct instruction set.  */
> -    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_M)) | new_mode;

Why change this line?

> +    /* Set new mode endianess */

"endianness"

> +    env->uncached_cpsr = (env->uncached_cpsr & ~(CPSR_E)) |
> +        (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE ? CPSR_E : 0);

This is a bit confusing. I think just splitting it into
multiple statements would help:
   env->uncached_cpsr &= ~CPSR_E;
   if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
       env->uncached_cpsr |= CPSR_E;
   }

>      env->daif |= mask;
>      /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
>       * and we should just guard the thumb mode on V4 */
> @@ -5958,6 +5961,12 @@ static inline bool regime_translation_disabled(CPUARMState *env,
>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
>  }
>
> +static inline bool regime_translation_big_endian(CPUARMState *env,
> +                                                 ARMMMUIdx mmu_idx)
> +{
> +    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
> +}
> +
>  /* Return the TCR controlling this translation regime */
>  static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
> @@ -6263,7 +6272,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>   */
>  static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>                              ARMMMUIdx mmu_idx, uint32_t *fsr,
> -                            ARMMMUFaultInfo *fi)
> +                            ARMMMUFaultInfo *fi, bool be)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -6274,12 +6283,16 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>      if (fi->s1ptw) {
>          return 0;
>      }
> -    return address_space_ldl(cs->as, addr, attrs, NULL);
> +    if (be) {
> +        return address_space_ldl_be(cs->as, addr, attrs, NULL);
> +    } else {
> +        return address_space_ldl_le(cs->as, addr, attrs, NULL);
> +    }
>  }

Why not just call regime_translation_big_endian() inside arm_ldl_ptw()
and arm_ldq_ptw(), rather than having every call site making the call
and passing in the result?

PS: this patch will conflict with the multi-ases series but only
fairly trivially.

thanks
-- PMM
