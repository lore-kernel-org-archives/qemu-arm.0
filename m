Received: by 10.25.208.137 with SMTP id h131csp915982lfg;
        Fri, 29 Apr 2016 08:07:53 -0700 (PDT)
X-Received: by 10.55.65.74 with SMTP id o71mr20745602qka.133.1461942473674;
        Fri, 29 Apr 2016 08:07:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si7704482qgm.95.2016.04.29.08.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 08:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1awA13-0006sN-0y
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 11:07:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1awA0u-0006es-9a
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 11:07:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1awA0h-0006Ij-33
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 11:07:22 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:51382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1awA0g-0006D9-Tp; Fri, 29 Apr 2016 11:07:15 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id F27AB3B131D97;
	Fri, 29 Apr 2016 16:06:47 +0100 (IST)
Received: from [192.168.161.74] (192.168.161.74) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 29 Apr 2016 16:06:51 +0100
Message-ID: <57237883.1020508@imgtec.com>
Date: Fri, 29 Apr 2016 16:06:43 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.161.74]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 5/9] target-mips: Activate IEEE 274-2008
 signaling NaN bit meaning
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
X-TUID: we6Zq+DQeAmB

On 18/04/16 17:03, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> Functions mips_cpu_reset() and msa_reset() are updated so that flag
> snan_bit_is_one is properly set for any Mips FPU/MSA configuration.
> For main FPUs, CPUs with FCR31's FCR31_NAN2008 bit set will invoke
> set_snan_bit_is_one(0). For MSA, as it is IEEE 274-2008 compliant
> from it inception, set_snan_bit_is_one(0) will always be invoked.
> 
> By applying this patch, a number of incorrect behaviors for CPU
> configurations that require IEEE 274-2008 compliance will be fixed.
> Those are behaviors that (up to the moment of applying this patch)
> did not get the desired functionality from SoftFloat library with
> respect to distinguishing between quiet and signaling NaN, getting
> default NaN values (both quiet and signaling), establishing if a
> floating point number is Nan or not, etc.
> 
> Just two examples:
> 
> * <MAX|MAXA>.<D|S> will now correctly detect and propagate NaNs.
> * CLASS.<D|S> will now correcty detect NaN flavors, both their
>   CPU FPU and MSA version.
> 
> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
> Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  target-mips/translate.c      | 6 +++++-
>  target-mips/translate_init.c | 3 ++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index e934884..2cdd2bd 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -20129,7 +20129,11 @@ void cpu_state_reset(CPUMIPSState *env)
>      env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
>      env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
>      env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
> -    set_snan_bit_is_one(1, &env->active_fpu.fp_status);
> +    if ((env->active_fpu.fcr31 >> FCR31_NAN2008) & 1) {
> +        set_snan_bit_is_one(0, &env->active_fpu.fp_status);
> +    } else {
> +        set_snan_bit_is_one(1, &env->active_fpu.fp_status);
> +    }
>      env->msair = env->cpu_model->MSAIR;
>      env->insn_flags = env->cpu_model->insn_flags;
>  
> diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
> index 1094baa..bae6183 100644
> --- a/target-mips/translate_init.c
> +++ b/target-mips/translate_init.c
> @@ -904,5 +904,6 @@ static void msa_reset(CPUMIPSState *env)
>      /* clear float_status nan mode */
>      set_default_nan_mode(0, &env->active_tc.msa_fp_status);
>  
> -    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
> +    /* set proper signanling bit meaning ("1" means "quiet") */
> +    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
>  }

To support r3, specifically writable {NAN,ABS}2008 bits, we will need to
restore snan_bit_is_one in more places than just reset (for example
after migration), which suggests that the code in this patch deserves to
be placed in a separate function, just like it was done originally.
Also, having the fcr31_rw_bitmask would nicely clean up the fcr31
handling in helper_ctc1.

If you plan to do that later then that's OK as far as I'm concerned, but
if those changes (which were already posted and not that big) were
included here from the beginning then we would avoid having to rework
above code.

Thanks,
Leon
