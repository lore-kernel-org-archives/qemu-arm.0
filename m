Received: by 10.25.159.19 with SMTP id i19csp2598186lfe;
        Tue, 19 Jan 2016 08:38:00 -0800 (PST)
X-Received: by 10.140.239.79 with SMTP id k76mr31027913qhc.87.1453221480414;
        Tue, 19 Jan 2016 08:38:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y205si38187251qhc.111.2016.01.19.08.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZI7-0002VM-U9
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:37:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYwX-0004gP-Fg
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:15:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYwW-00041h-HJ
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:15:41 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYwW-00041W-BG
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:15:40 -0500
Received: by mail-vk0-x22b.google.com with SMTP id e185so11658680vkb.1
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 08:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RTmCLujZ5oWd4qm/IH7U6qrqZdldlVwnvMw4iEnVrCY=;
	b=aoAPmJbfXeajoU8KKNhlr4xMMp2C5o5ICinCd0ieU8loL3AP1M+8eOXzoEh5Gr3rLo
	zdK8Tj2i9ZuVllpR6trRsgw1/eD0gDaO9iC03MdLbQPKSLLjFW46xhVkc/cxyzgXewbM
	Ftvp9XhiDKRVzCLa0mjWSGcnzCnwXQmMF1sy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RTmCLujZ5oWd4qm/IH7U6qrqZdldlVwnvMw4iEnVrCY=;
	b=TyXPSXvg92g1Zc3eCUVF/rgLsdHf4xKo9qHcvv+U1EhjBh6/3jD9DWgmA8BEBTNJ/y
	UPJUmjTfeYEr3DxYxUBlkWgOEM7WenEfDa7lUCQly+0v+zAj3Aa61RDY9RSXLbwgaTj5
	N7uIbse5q0o0SwqnJYNdVUmSXK92nYVfb5b6OdrkJA70hI3VwrH8fuIj//Au1EKlSJ+6
	7NSyGB8ZsShbqsvp0C0aogwQFBYPNRbiPpLnwCwd9wd1FRT8YvZw1UBfr8FReEtJ567a
	LEYGKgmlG1dpZ3KdwTeGJed+Mb5rA675K7X283bFJLpw82av9G2v/eGYm9ulMbqDw4XI
	EJYA==
X-Gm-Message-State: ALoCoQmF320EaHaEHVFyPfwX0y5GJqMklBuFjobd7jmh9KHCkGT1lSMVsxiBquuLBs6KjWuKWIIX5VxA5e/+EBsbDIKWMJnL5WKDrHfy8se5bMm4fHgbIGk=
X-Received: by 10.31.141.2 with SMTP id p2mr21087257vkd.37.1453220139956; Tue,
	19 Jan 2016 08:15:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:15:20 -0800 (PST)
In-Reply-To: <c0f5e1844b6f9e40de952e8ae01fe53e76a9e03c.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<c0f5e1844b6f9e40de952e8ae01fe53e76a9e03c.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:15:20 +0000
Message-ID: <CAFEAcA8pbckQr4TaXDwZ2GrFQy2dJvgdygSUo6HQE5q76onsiQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 09/17] target-arm: introduce tbflag for
	endianness
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
X-TUID: jKn0cuHHavBa

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Introduce a tbflags for endianness, set based upon the CPUs current
> endianness. This in turn propagates through to the disas endianness
> flag.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>
>  target-arm/cpu.h           | 7 +++++++
>  target-arm/translate-a64.c | 2 +-
>  target-arm/translate.c     | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 54675c7..74048d1 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1857,6 +1857,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
>   */
>  #define ARM_TBFLAG_NS_SHIFT         19
>  #define ARM_TBFLAG_NS_MASK          (1 << ARM_TBFLAG_NS_SHIFT)
> +#define ARM_TBFLAG_MOE_SHIFT        20
> +#define ARM_TBFLAG_MOE_MASK         (1 << ARM_TBFLAG_MOE_SHIFT)

Can we call the flag bit something that makes clear that it's the
data endianness (and that the sense is 'bit set for BE data'),
please? (We probably don't need MO in the name.)

>  /* Bit usage when in AArch64 state: currently we have no A64 specific bits */
>
> @@ -1887,6 +1889,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
>      (((F) & ARM_TBFLAG_XSCALE_CPAR_MASK) >> ARM_TBFLAG_XSCALE_CPAR_SHIFT)
>  #define ARM_TBFLAG_NS(F) \
>      (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
> +#define ARM_TBFLAG_MOE(F) \
> +    (((F) & ARM_TBFLAG_MOE_MASK) >> ARM_TBFLAG_MOE_SHIFT)
>
>  /* Return the exception level to which FP-disabled exceptions should
>   * be taken, or 0 if FP is enabled.
> @@ -2018,6 +2022,9 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>              }
>          }
>      }
> +    if (arm_cpu_is_big_endian(env)) {
> +        *flags |= ARM_TBFLAG_MOE_MASK;
> +    }

Doesn't this break BE32 linux-user? That wanted MO_TE and got it before this
patch, and now it will end up with MO_LE because arm_cpu_is_big_endian()
is only looking at BE8 related CPU status flags.

>      *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
>
>      *cs_base = 0;
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 59026b6..db68662 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -11044,7 +11044,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>                                 !arm_el_is_aa64(env, 3);
>      dc->thumb = 0;
>      dc->bswap_code = 0;
> -    dc->mo_endianness = MO_TE;
> +    dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
>      dc->condexec_mask = 0;
>      dc->condexec_cond = 0;
>      dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index e1679d3..cb925ef 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -11274,7 +11274,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>                                 !arm_el_is_aa64(env, 3);
>      dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
>      dc->bswap_code = ARM_TBFLAG_BSWAP_CODE(tb->flags);
> -    dc->mo_endianness = MO_TE;
> +    dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
>      dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
>      dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
>      dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);

thanks
-- PMM
