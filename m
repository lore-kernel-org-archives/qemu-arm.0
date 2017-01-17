Received: by 10.25.205.13 with SMTP id d13csp503183lfg;
        Tue, 17 Jan 2017 05:42:23 -0800 (PST)
X-Received: by 10.55.214.86 with SMTP id t83mr3432749qki.23.1484660543008;
        Tue, 17 Jan 2017 05:42:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20si16575979qke.187.2017.01.17.05.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 05:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTU1k-0007cL-8U
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 08:42:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU1e-0007Zh-Cj
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU1d-0006Ol-AX
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:42:14 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:35794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTU1c-0006NC-V5
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:42:13 -0500
Received: by mail-ua0-x230.google.com with SMTP id y9so103201500uae.2
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 05:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7uErlcjdSANYvaEl6x6ASRgr8Yt23IyHIM5UQRErBUc=;
	b=EI7ZxR88BDWEhwvH7X/GIBKJ2dSqk+K+kARNJOnY6VbbnbgowHC7Mb7lU522/HCTrb
	j3GLmmJoo5vwvNoI0z5xV7ihpMQnaNRiGMbuVbH0yoXvX1zxKDay2UCDA9Ao6vndCxIY
	v0fiPbKWCLsM8lxZTeviXtk65mGTtdri0MGyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7uErlcjdSANYvaEl6x6ASRgr8Yt23IyHIM5UQRErBUc=;
	b=G6SmV3rn2hmyUlfJW3arOBtsmYow+6A5W1vl4MS1e/hmVeUtwFGmm+9p+C/Iwow4Um
	pCZpc8GNhbpgXW5Hr/DgBnCpPRWziwWYXn0zhHTup3vX5W+X/YpWfmOh4g8gaw40bjLX
	cQfq/ipt0uWSnNns5GbgooJ850Q2mQ5cycRb2RMPVJbDX369h4RYdBcaTUon1mZZV9ur
	XL7LLULgpmGzEChSE4nJA1HNCmD5hkASARMEfxIYZ0j/gu6wN11i9z40AB0/MCqMzxqm
	FT/dvVEjnp1/C31MfqHcuTOluvotbotbpQUbZ/kfW5Omqm0n8vvP/vJZKzFUhFFkfRaq
	s8Ig==
X-Gm-Message-State: AIkVDXIldXYGOHjrzoyuDsG1uD8P75WPcNFmB+Yk24AsD0kZIh5wychAXNTMnxIYYN2k7yEYjxml4HH+iviozZrb
X-Received: by 10.176.3.196 with SMTP id 62mr17616905uau.120.1484660530696;
	Tue, 17 Jan 2017 05:42:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 05:41:50 -0800 (PST)
In-Reply-To: <1484204658-28058-2-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
	<1484204658-28058-2-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 13:41:50 +0000
Message-ID: <CAFEAcA-XKFXFUnpm2anZ3nG0SqzK3wdqJLgcXX79NEhQDuQSPw@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH V1 1/4] target-arm: Add support for PMU
 register PMSELR_EL0
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mb1j+3jc0NXZ

On 12 January 2017 at 07:04, Wei Huang <wei@redhat.com> wrote:
> This patch adds support for AArch64 register PMSELR_EL0. The existing
> PMSELR definition is revised accordingly.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.h    |  1 +
>  target/arm/helper.c | 24 +++++++++++++++++++-----
>  2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ab119e6..bd80658 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -307,6 +307,7 @@ typedef struct CPUARMState {
>          uint32_t c9_pmovsr; /* perf monitor overflow status */
>          uint32_t c9_pmxevtyper; /* perf monitor event type */
>          uint32_t c9_pmuserenr; /* perf monitor user enable */
> +        uint32_t c9_pmselr; /* perf monitor counter selection register */
>          uint32_t c9_pminten; /* perf monitor interrupt enables */
>          union { /* Memory attribute redirection */
>              struct {
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8dcabbf..71adb0f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -975,6 +975,15 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      return total_ticks - env->cp15.c15_ccnt;
>  }
>
> +static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    /* only cycle counter selection is supported */
> +    if (value == 0x1f) {
> +        env->cp15.c9_pmselr = value;
> +    }

This looks like it's trying to add PMUv2 (and ARMv8) semantics
for PMSELR, but it doesn't quite get them right.

In the old PMUv1 (which is what we currently implement),
0x1f was reserved and thus effectively writing anything to
PMSELR in a system with no implemented counters was UNPREDICTABLE.
From PMUv2 (and including v8) 0x1f is supported for selecting
the cycle counter and must cause:
 * PMXEVTYPER reads and writes to access PMCCFILTR
 * PMXEVCNTR access to be CONSTRAINED UNPREDICTABLE (we already
   get this right because 'RAZ/WI' is one of the permitted choices)

The SEL field is 5 bits and the rest is RAZ/WI so we should
mask value with 0x1f first.

Writing something to PMSELR which isn't 0x1f but is greater than
or equal to the number of implemented counters (so for QEMU, anything
but 0x1f) is permitted, but makes PMXEVTYPER/PMXEVCNTR accesses
CONSTRAINED UNPREDICTABLE. So you need to allow pmselr to read
back as the non-0x1f value, and have the handling of "is this
0x1f or not" happen in the read/write functions for PMXEVTYPER,
I think.

(Also I think it's nice when we're making an UNPREDICTABLE
or CONSTRAINED UNPREDICTABLE choice of behaviour to note it
in a comment.)

> +}
> +
>  static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> @@ -1194,12 +1203,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>      /* Unimplemented so WI. */
>      { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
>        .access = PL0_W, .accessfn = pmreg_access, .type = ARM_CP_NOP },
> -    /* Since we don't implement any events, writing to PMSELR is UNPREDICTABLE.
> -     * We choose to RAZ/WI.
> -     */
>      { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
> -      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> -      .accessfn = pmreg_access },
> +      .access = PL0_RW, .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
> +      .accessfn = pmreg_access, .writefn = pmselr_write,
> +      .raw_writefn = raw_write},
> +    { .name = "PMSELR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 5,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_IO,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),

For a 64-bit register the field in the CPU struct has to be
a uint64_t, so you need to change it from the uint32_t it is
at the moment. The AArch32 regdef struct then needs to change
to use offsetoflow32() where it currently has offsetof().

> +      .writefn = pmselr_write, .raw_writefn = raw_write, },
>  #ifndef CONFIG_USER_ONLY
>      { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
>        .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
> --
> 1.8.3.1

thanks
-- PMM
