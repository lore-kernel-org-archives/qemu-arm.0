Received: by 10.25.27.66 with SMTP id b63csp602380lfb;
        Thu, 2 Jun 2016 02:17:34 -0700 (PDT)
X-Received: by 10.55.152.68 with SMTP id a65mr41396240qke.52.1464859054883;
        Thu, 02 Jun 2016 02:17:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si22148273qki.85.2016.06.02.02.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 02:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Okw-0003Xr-B1
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 05:17:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b8Oks-0003Wj-9Z
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1b8Okn-0006TM-A1
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 05:17:30 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:47455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1b8Okn-0006TH-3R; Thu, 02 Jun 2016 05:17:25 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 3E305A952FAF9;
	Thu,  2 Jun 2016 10:17:21 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Jun 2016 10:17:23 +0100
Date: Thu, 2 Jun 2016 10:17:22 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20160602091722.GB14419@hhmipssw201.hh.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-7-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1463407965-19733-7-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v6 6/9] target-mips: Activate IEEE 754-2008
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
X-TUID: nrJVfTB6zRx9

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

This change is reverted in patch #9, perhaps it will be better to fold
it into that patch?

Thanks,
Leon

>      env->msair = env->cpu_model->MSAIR;
>      env->insn_flags = env->cpu_model->insn_flags;
>  
> diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
> index e81a831..a37d8bb 100644
> --- a/target-mips/translate_init.c
> +++ b/target-mips/translate_init.c
> @@ -893,5 +893,6 @@ static void msa_reset(CPUMIPSState *env)
>      /* clear float_status nan mode */
>      set_default_nan_mode(0, &env->active_tc.msa_fp_status);
>  
> -    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
> +    /* set proper signanling bit meaning ("1" means "quiet") */
> +    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
>  }
> -- 
> 1.9.1
> 
