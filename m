Received: by 10.25.208.211 with SMTP id h202csp1670776lfg;
        Mon, 28 Mar 2016 14:49:57 -0700 (PDT)
X-Received: by 10.140.95.76 with SMTP id h70mr38942956qge.105.1459201797254;
        Mon, 28 Mar 2016 14:49:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h61si13274151qgh.57.2016.03.28.14.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Mar 2016 14:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akf2q-0006Xg-SF
	for alex.bennee@linaro.org; Mon, 28 Mar 2016 17:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1akf2o-0006US-AU
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 17:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1akf2n-0004V5-Dd
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 17:49:54 -0400
Received: from mail-qg0-x241.google.com ([2607:f8b0:400d:c04::241]:36309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1akf2h-0004UK-6W; Mon, 28 Mar 2016 17:49:47 -0400
Received: by mail-qg0-x241.google.com with SMTP id n34so2708910qge.3;
	Mon, 28 Mar 2016 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=r+nJI59tJM24xo1VeBo7Z9cTguf7/t9UShcCdnROBEg=;
	b=Fkj3TnOwWaN6ca+c9GNfV1Qsog9ob6VI+ynePL62Z0jQ8KVc4HXV8CfiFmVbF6Bfhn
	IrAl/KnLjAfGeDu8YZr6Aau7G1eccsJ1UD+0zmvhSH09aVIRzt1MHPp+z2qqklu66yS3
	Oo54fQDOncnVTCuY9liC0pt0KTRoO1najoKVoT+CwM6IboKnPAMpr6cP5Xc/FlGCSTPW
	6bgbkw6z1jZuOQw0IlY/g4oHtoZGitbyVqERFnT1mDSviv3FDyLGioHpNnpL9FEKczUh
	Vu5iUjM6jqSBbxHrjscsFZN1esuB/m7mFriyZQICqeWjxlonE7QRECtJEgbwuJ5sT9mG
	h6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=r+nJI59tJM24xo1VeBo7Z9cTguf7/t9UShcCdnROBEg=;
	b=QjrdKBtbOnoRIXAy9hMLyDb7kByhQ10+rTwmWtHpKCJ22DZQYRPLaUprtpTyjXFPfm
	moaIMVjasuPpomh6HL5awVyAcQyQdN7XKc9DFTQKAvL7MSeMteCwAybM0A6KRUneQ8uF
	wpEn4UGyQ1s0p4wHtkj5kx3AkNFaYDzrJ1aBZS9zx9mEQ01dYmt0tSziAaRH9uKiLpbe
	WfbVbrbnO9akPNVLQPdIdUxzzAsSGuoYbHPFCXL8s/WbAu+mtnY5KEE+0YVC0ddEevo6
	FWWT/I0nfZcmd/mADIEK3IC97SmU2/6phga+uXn68wg2QnSlisEAcfWpzlQyod/JhPPo
	9JnQ==
X-Gm-Message-State: AD7BkJKGiug7Uj0QcE8NXUDybPDmrzha9OBSaZaSCorPldfTtG72MTaR6vAxewG2lw3e9A==
X-Received: by 10.140.85.133 with SMTP id n5mr39279139qgd.32.1459201786621;
	Mon, 28 Mar 2016 14:49:46 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	b67sm12526833qhd.11.2016.03.28.14.49.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 14:49:45 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56F9A6F5.2050504@twiddle.net>
Date: Mon, 28 Mar 2016 14:49:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::241
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	kbastian@mail.uni-paderborn.de, mark.cave-ayland@ilande.co.uk,
	agraf@suse.de, petar.jovanovic@imgtec.com, blauwirbel@gmail.com,
	jcmvbkbc@gmail.com, miodrag.dinic@imgtec.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com, afaerber@suse.de,
	aurelien@aurel32.net, proljc@gmail.com
Subject: Re: [Qemu-arm] [PATCH 2/2] target-mips: Implement IEEE 754-2008
 functionality for R6 and MSA instructions
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
X-TUID: TuePuVJ1267q

On 03/25/2016 05:50 AM, Aleksandar Markovic wrote:
> @@ -2621,9 +2621,23 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
>       uint64_t dt2;
>
>       dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
> -    if (get_float_exception_flags(&env->active_fpu.fp_status)
> -        & (float_flag_invalid | float_flag_overflow)) {
> -        dt2 = FP_TO_INT64_OVERFLOW;
> +    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
> +        if (get_float_exception_flags(&env->active_fpu.fp_status)
> +                & (float_flag_invalid | float_flag_overflow)) {
> +            if (float64_is_any_nan(fdt0)) {
> +                dt2 = 0;
> +            } else {
> +                if (float64_is_neg(fdt0))
> +                    dt2 = INT64_MIN;
> +                else
> +                    dt2 = INT64_MAX;
> +            }
> +        }
> +    } else {
> +        if (get_float_exception_flags(&env->active_fpu.fp_status)
> +                & (float_flag_invalid | float_flag_overflow)) {
> +            dt2 = FP_TO_INT64_OVERFLOW;
> +        }

Better to swap the tests here, so that you test the exception flags first (and 
once).  That is the exceptional condition, the one that will be true least 
often.  After that, FCR31_NAN2008 will be tested only when needed.

But also, this pattern is replicated so many times you'd do well to pull this 
sequence out to helper functions (one for s, one for d).

> +uint64_t helper_float_abs_d(CPUMIPSState *env, uint64_t fdt0)
> +{
> +    uint64_t fdt1;
> +
> +    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
> +        fdt1 = float64_abs(fdt0);
> +    } else {
> +        if (float64_is_neg(fdt0)) {
> +            fdt1 = float64_sub(0, fdt0, &env->active_fpu.fp_status);
> +        } else {
> +            fdt1 = float64_add(0, fdt0, &env->active_fpu.fp_status);
> +        }
> +        update_fcr31(env, GETPC());

Here you're better off using two separate helper functions, and chose the 
correct one during translation.  Indeed, since the 2008 version is a simple 
bit-flip, you needn't actually have a helper; just expand the sequence inline.


r~
