Received: by 10.28.71.155 with SMTP id m27csp1070046wmi;
        Thu, 22 Mar 2018 19:24:11 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsXBflbHkoDRU+i74kwEsyPtYgWLhFrszVoVAYd0UOw2SwzWmGfYqiAyTqBsmgd4rTDJ8EH
X-Received: by 10.55.201.67 with SMTP id q64mr39018166qki.7.1521771851555;
        Thu, 22 Mar 2018 19:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521771851; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd4YV3wcfBJISB1asTkMkJ0FQnDZrb0UR32nhFQ8m/JuX67pQkeUl4cCdW3QyJVWlE
         pF8AdMpDYUe7icudwisn50+D7qJI8Me1v5A4fswYfVCcqA2M4l3tj3BsxJLX5Qz1jlcs
         euULbjEKEKqyJtEbz8ABHtStGqiSHjcLBwww5EGKl5dKhMVwohyzAjYB43zsvzYxyV0w
         tAieewUASdexvhrnUt2zoYn0U2Qt+B50fMxDoaz9oHJ/c4rSFMpS4JRDyAbeufwNGSgM
         D/9CBKR/vphVkSh3HHfKgIiYPRhbvCHIxMgOIKKaXtXLxS4WUq1FwyaeUNoRkvXBHLGx
         +d/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=yT9o3aUwEPRXq8BN8inmdkg3woMeuCOt4PAP/opxuOY=;
        b=WtAOiuJsVcz+ND4p/ZCXYT5YFYV6XMMculQHmmzfeqNdWP1t/e7guc2al+FwO3EWDq
         d7lUhIYiD/Jj6gQBLTYT/vTFS+jX3zvEpDsw9+cESHoKlZK6r499eJmuAFzRYJ6RYeAP
         xn+boJ411yHRSsAix3f3nro+IPzj2nDCHjxUjujNumGuQtYo6cA/F6rxM4ad5LqIlyFJ
         nUYtktSR4PBMGIRisShJ8VgKZGoxj34LlAFiZSCqY+MOlgMy4GvxnY8wxpbevkQfiiFX
         +TkQ8jfLngfm8mBSWM2Hsa/Y/JAB7RJK4vsao7ZN2dDCgLlT0JGOSx1ub4lkCYJ6Lsud
         mylQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HG8sYOLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1si2488778qki.89.2018.03.22.19.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 19:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HG8sYOLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezCNH-0005yR-1q
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 22:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCN4-0005wn-Fr
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCN3-0006tU-Do
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:23:58 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCMy-0006s0-0h; Thu, 22 Mar 2018 22:23:52 -0400
Received: by mail-qk0-x241.google.com with SMTP id o184so11449333qkd.13;
	Thu, 22 Mar 2018 19:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yT9o3aUwEPRXq8BN8inmdkg3woMeuCOt4PAP/opxuOY=;
	b=HG8sYOLzNta/5myD7hSmHfUHpIwaCU90gL2GxvZs7WfLwPfxbnmQtPRQA+N8SP00KX
	v34Pb/juv59yS9yjLjV3M7nY3dqzqYOh5nnB3CUiU7hQVerispOXcXG4DO9ysLYFZA+d
	ltg/caun7eQP+DiRHRe1elHg088FeOTxclNP+gF4YDdJ7Ba7l37qiWanlZJ2Zk1iNqoa
	27PXKP2UiF16SnUGkmg2Ccw71t3cRTC4ioWKmQkvYzi/n5HBxcwDxFpGvcop87yxVLgp
	JtV/heq6Sz/wMAAQQugIUjMRQgp3m/vu0/3eeZI4XXks6c7RjEICfhcaMNqLIVkN4Cyx
	zilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yT9o3aUwEPRXq8BN8inmdkg3woMeuCOt4PAP/opxuOY=;
	b=rrJfUb7291tgkQP/ZZCyLCYp6eaFRlao4BboA2XiyGoOQynAqBJkmNqADQWY97zbuG
	/FsjdKl14npwEKUrMFnnwdOSfMuJfquqEBzG97ynzyajRxVLFTrLw3Fvbt6I9amsycxi
	HcgzQ1bAZ1RyNyq5owirVEkBfurjT+I1We7WbXOLCMOvX4Q7S8ctpyaEuR3WTcQeRYnS
	D+PeQ9PEqR3gh44nZNij1GzY7dsMMucva23mfmMncO8/UGvvvhE7N2sOsNsszN0qAtYQ
	eq8jN+fo/wy0SlC1g9XC0V6ZfC9f4a/wQcqnxA/vodfD6TMu1i7tEdLCAs9j676vOmOD
	58Qg==
X-Gm-Message-State: AElRT7FGRbUAABCPiqKftL5/a2j1g/je8dJvj1BouCcO+WGX72VtuTWM
	oyIrt4yimrTLIA/9QAa0NOw=
X-Received: by 10.55.24.1 with SMTP id j1mr39053942qkh.23.1521771831529;
	Thu, 22 Mar 2018 19:23:51 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	p54sm5896581qtj.29.2018.03.22.19.23.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 19:23:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180315133441.24149-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3da2c4cb-35bf-b276-4733-f6cd7bf23497@amsat.org>
Date: Thu, 22 Mar 2018 23:23:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180315133441.24149-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
X-TUID: glikbjdAxCxV

On 03/15/2018 10:34 AM, Peter Maydell wrote:
> If the GIC has the security extension support enabled, then a
> non-secure access to ICC_PMR must take account of the non-secure
> view of interrupt priorities, where real priorities 0..0x7f
> are secure-only and not visible to the non-secure guest, and
> priorities 0x80..0xff are shown to the guest as if they were
> 0x00..0xff. We had the logic here wrong:
>  * on reads, the priority is in the secure range if bit 7
>    is clear, not if it is set
>  * on writes, we want to set bit 7, not mask everything else
> 
> Our ICC_RPR read code had the same error as ICC_PMR.
> 
> (Compare the GICv3 spec pseudocode functions ICC_RPR_EL1
> and ICC_PMR_EL1.)
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1748434
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/arm_gicv3_cpuif.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 5cbafaf497..26f5eeda94 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -836,7 +836,7 @@ static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          /* NS access and Group 0 is inaccessible to NS: return the
>           * NS view of the current priority
>           */
> -        if (value & 0x80) {
> +        if ((value & 0x80) == 0) {
>              /* Secure priorities not visible to NS */
>              value = 0;
>          } else if (value != 0xff) {
> @@ -871,7 +871,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>              /* Current PMR in the secure range, don't allow NS to change it */
>              return;
>          }
> -        value = (value >> 1) & 0x80;
> +        value = (value >> 1) | 0x80;
>      }
>      cs->icc_pmr_el1 = value;
>      gicv3_cpuif_update(cs);
> @@ -1609,7 +1609,7 @@ static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      if (arm_feature(env, ARM_FEATURE_EL3) &&
>          !arm_is_secure(env) && (env->cp15.scr_el3 & SCR_FIQ)) {
>          /* NS GIC access and Group 0 is inaccessible to NS */
> -        if (prio & 0x80) {
> +        if ((prio & 0x80) == 0) {
>              /* NS mustn't see priorities in the Secure half of the range */
>              prio = 0;
>          } else if (prio != 0xff) {
> 
