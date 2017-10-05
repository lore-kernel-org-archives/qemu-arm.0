Received: by 10.223.197.9 with SMTP id q9csp182039wrf;
        Wed, 4 Oct 2017 21:46:54 -0700 (PDT)
X-Received: by 10.200.33.186 with SMTP id 55mr22734781qty.300.1507178814240;
        Wed, 04 Oct 2017 21:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507178814; cv=none;
        d=google.com; s=arc-20160816;
        b=Zw/CciXW2/KUj3OuaP7M6X/Sa0ZUlLQQTwS/2lk0E9tVEOJMnCk5HT/gAIiwma2Vmq
         de73WGBHr2AridFAQFmWWaSKrmQill1YtOoBWJOKyWSgeuiwEVuUS6wmQI3+4GZd1YAi
         /i25kHtGJvQlq5Shicn3AmFEBrKliDHANX9OvBwFsSd9BMUZQhiFHQ35JdG3nXVUqpow
         IIuXUZOn8GQRVrvCrCJ1iHyMAEhAYBN6oQh+g5sTT2zO0/OUwGCjZ2+s+eYY7X9i4iIp
         Bi/UMws7a26X43TpTHdHEY7XwRyXE0qvGF6xadVYZog4fL/+tS6Sfhvo5FXJjZHReFA3
         DCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=oT52yvXyU8P5T7QtPD6kOrUWBjAcQsYh3V6MI7/3oiQ=;
        b=co8EqYbPqBC0SIa+3BJeXnQXZqHcoqSMLXXtBMWJwEkY8NoE6vAFu7uNpxsxOvLY3J
         TMmJZ9qEloHTPel+eyOCQRz+Ez2lr2lWd11fk0hok58S0mbDET4YB/TY+3bg6NZsYa4M
         3SVVQspnG4kjlKbehOrh9ZbI+3VH0asZWhlvSn8rRg8FCpr4VM4TUPq6s8ObiYf/Ts+m
         Eb8WeK6Xk0fGkBFUjJg++KL1FbcIW7nkc6ibNDgkAgeBxAbV6euIaJlRYmDcNacmBvtW
         d3AhCjTUK7RXA2QoCy7yL7xoFFQkvyiXZcWwVnG4NyIw3UpUaT9IxCRfm2FawzGyvFke
         fZFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LTZSQKCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si1587714qki.133.2017.10.04.21.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 21:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LTZSQKCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzy3h-0001We-NW
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 00:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy3X-0001Uc-Cv
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 00:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy3W-000170-Fb
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 00:46:43 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy3S-00011e-3h; Thu, 05 Oct 2017 00:46:38 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so9337127qkg.3;
	Wed, 04 Oct 2017 21:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oT52yvXyU8P5T7QtPD6kOrUWBjAcQsYh3V6MI7/3oiQ=;
	b=LTZSQKCetsTdJmMytXJaArc53PrYSFW3xP+3Tpb/4JbkNnyZubwkvSbjKOw0NbABoP
	ffRiDsNiB1e/QKndFjO28bAPDiCE7CDBkfBRgn1fUBILaxBFKz7utUn7mWy45IUYChxJ
	BzXVIV+RdlwVMCCReCQZh261U5zBpxUKdzgPO8mv5GtMfaVjwMu7PCurUt7habUDtc7g
	MOoGgHMPBqb40xSk1OuUZD3KqCTF1CPJqpv+vPUXE3R0m4L4DNCJh9M5BAPZN+jZ1QRP
	Kf5QjM4YVWPEZ9m0+niRDpvyCd5ekvd94t0JbQ6Jc4/YF1Eu31Q9ZJhAG8GPuhfpfRcn
	LNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oT52yvXyU8P5T7QtPD6kOrUWBjAcQsYh3V6MI7/3oiQ=;
	b=ZGSNaEew/8uGx4I4a+0xVyIpZqa8+7Q4njD8QWM78VeCCc/nlcJuxE1gxpDzwLmurD
	Xv8lRQtHyEDWUEegxm5JDUqYQlbho6nu2c+6T/J9P6LU9wrKIbWHR7B7FWdP6mtwsFut
	FyrSK0gf/k7AMqgksGVM2uIENAgO2oinwHZhdECyqqQMCvI7VHd64vBs1RPdGHCoAjCT
	EQhKeKqTSA+5CFCNS9gsQvl32yroDqbEUFcvOFmbQzYG3Em+EN+xYlLdE2WmPWomxKLz
	0c2Z3NiFBqrRuTLJlv8c5F07tKRmu2mJrzzh7rIJBXBinUIKYTDD2QVd3YnsM1OxAKkA
	RQTA==
X-Gm-Message-State: AMCzsaVfQrQGZqRe2QEMHhOztKJCFf7AJUchlGbE5KAifJK2GZy3bmyY
	TjbeZrDfLXkfFG8R0tvGYAU=
X-Google-Smtp-Source: AOwi7QA9TMkMjPf1DpkjA5icUGlgp1LwmBSoAaxWdvG8GPsKpaa77rrFsN7YZcF0Lq+gwccF0Kkn2g==
X-Received: by 10.55.164.215 with SMTP id n206mr14218811qke.85.1507178797513; 
	Wed, 04 Oct 2017 21:46:37 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	m6sm11367509qkh.90.2017.10.04.21.46.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 21:46:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-16-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b2c72b55-fa9f-f50e-da70-225fbe01db45@amsat.org>
Date: Thu, 5 Oct 2017 01:46:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-16-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 15/20] target/arm: Fix calculation of secure
 mm_idx values
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
X-TUID: xhaVJfDvtkeE

On 09/22/2017 12:00 PM, Peter Maydell wrote:
> In cpu_mmu_index() we try to do this:
>         if (env->v7m.secure) {
>             mmu_idx += ARMMMUIdx_MSUser;
>         }
> but it will give the wrong answer, because ARMMMUIdx_MSUser
> includes the 0x40 ARM_MMU_IDX_M field, and so does the
> mmu_idx we're adding to, and we'll end up with 0x8n rather
> than 0x4n. This error is then nullified by the call to
> arm_to_core_mmu_idx() which masks out the high part, but
> we're about to factor out the code that calculates the
> ARMMMUIdx values so it can be used without passing it through
> arm_to_core_mmu_idx(), so fix this bug first.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 441e584..70c1f85 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2335,14 +2335,16 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>      int el = arm_current_el(env);
>  
>      if (arm_feature(env, ARM_FEATURE_M)) {
> -        ARMMMUIdx mmu_idx = el == 0 ? ARMMMUIdx_MUser : ARMMMUIdx_MPriv;
> +        ARMMMUIdx mmu_idx;
>  
> -        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
> -            mmu_idx = ARMMMUIdx_MNegPri;
> +        if (el == 0) {
> +            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
> +        } else {
> +            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
>          }
>  
> -        if (env->v7m.secure) {
> -            mmu_idx += ARMMMUIdx_MSUser;
> +        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
> +            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
>          }
>  
>          return arm_to_core_mmu_idx(mmu_idx);
> 
