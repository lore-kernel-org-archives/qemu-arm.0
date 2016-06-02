Received: by 10.25.27.66 with SMTP id b63csp600499lfb;
        Thu, 2 Jun 2016 02:12:41 -0700 (PDT)
X-Received: by 10.55.145.67 with SMTP id t64mr7333919qkd.96.1464858760826;
        Thu, 02 Jun 2016 02:12:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189si18422930qky.234.2016.06.02.02.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 02:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8OgC-0002C1-8N
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 05:12:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b8Og7-0002Bm-Lz
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:12:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b8Og1-0005dR-KM
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:12:34 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:33346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1b8Og1-0005dE-Dh; Thu, 02 Jun 2016 05:12:29 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id D47B3E23EC0B1;
	Thu,  2 Jun 2016 10:12:20 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Jun 2016 10:12:23 +0100
Date: Thu, 2 Jun 2016 10:12:19 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20160602091219.GA14419@hhmipssw201.hh.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-10-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1463407965-19733-10-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v6 9/9] target-mips: Implement FCR31's R/W
 bitmask and related functionalities
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w9ovHgSTeKMg

> - Add preprocessor constants for all bits of FCR31 and related masks
>   for its subfields.

Introducing all these constants for fcr31_rw_bitmask doesn't seem necessary
or useful

> 
> - Modify handling of CFC1 and CTC1 instructions (cases 25, 26, 28)
>   so that they utilize newly-defind constants. This is just a cosmetic
>   change, to make the code more readable, and to avoid usage of
>   hardcoded constants.

this an unrelated change; it should be moved to a separate patch

> +static inline void restore_snan_bit_mode(CPUMIPSState *env)
> +{
> +    set_snan_bit_is_one(!((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0),

this is just: (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0

> @@ -89,11 +89,9 @@ int mips_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>      if (env->CP0_Config1 & (1 << CP0C1_FP) && n >= 38 && n < 72) {
>          switch (n) {
>          case 70:
> -            env->active_fpu.fcr31 = tmp & 0xFF83FFFF;
> -            /* set rounding mode */
> -            restore_rounding_mode(env);
> -            /* set flush-to-zero mode */
> -            restore_flush_mode(env);
> +            env->active_fpu.fcr31 = (tmp & env->active_fpu.fcr31_rw_bitmask) |
> +               (env->active_fpu.fcr31 & !(env->active_fpu.fcr31_rw_bitmask));

I think you wanted bitwise-not here

> +            restore_fp_status(env);
>              break;
>          case 71:
>              /* FIR is read-only.  Ignore writes.  */
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index 0d1e959..cb890bc 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -2490,15 +2490,23 @@ target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
>          }
>          break;
>      case 25:
> -        arg1 = ((env->active_fpu.fcr31 >> 24) & 0xfe) | ((env->active_fpu.fcr31 >> 23) & 0x1);
> +        /* read from Floating Point Condition Codes Register (FCCR) */
> +        arg1 = ((env->active_fpu.fcr31 >> 24) & 0xfe) |
> +               ((env->active_fpu.fcr31 >> 23) & 0x1);

this is an unrelated cosmetic change, please remove it from this patch (there
are more changes like that in this patch)

> @@ -2558,42 +2566,66 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
>          }
>          break;
>      case 25:
> +        /* write to Floating Point Condition Codes Register (FCCR) */
>          if ((env->insn_flags & ISA_MIPS32R6) || (arg1 & 0xffffff00)) {
>              return;
>          }
> -        env->active_fpu.fcr31 = (env->active_fpu.fcr31 & 0x017fffff) | ((arg1 & 0xfe) << 24) |
> -                     ((arg1 & 0x1) << 23);
> +        env->active_fpu.fcr31 =
> +                (env->active_fpu.fcr31 & FCR31_ROUNDING_MODE_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_FLAGS_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_ENABLE_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_CAUSE_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_IEEE2008_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_IMPL_MASK) |
> +                (env->active_fpu.fcr31 & FCR31_FCC_MASK) |
> +                ((arg1 & 0x1) << 23) |
> +                (env->active_fpu.fcr31 & FCR31_FS_MASK) |
> +                ((arg1 & 0xfe) << 24);
>          break;

I don't find it easier to read. CTC1 and CFC1 helpers became a mixture of
various sub-masks and hardcoded constants. Also, it is now harder to map
the implementation to the lines from CTC1/CFC1 in the MIPS64BIS manual:

elseif fs = 25 then /* FCCR */
if temp31..8 != then
    UNPREDICTABLE
else
    FCSR <- temp7..1 || FCSR24 || temp0 || FCSR22..0


Thanks,
Leon
