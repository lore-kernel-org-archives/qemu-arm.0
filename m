Received: by 10.223.159.74 with SMTP id f10csp5334409wrg;
        Thu, 7 Dec 2017 06:16:05 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYHPp9bZ+BZsx3Xmh8l/rmrPGvnZVFvI892KxadhEhS9x0d+N5Ly+BAKV38YfdjYZ5aPzKn
X-Received: by 10.129.94.68 with SMTP id s65mr18774539ywb.73.1512656165350;
        Thu, 07 Dec 2017 06:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512656165; cv=none;
        d=google.com; s=arc-20160816;
        b=K2yL0OwrT1X07FWbzO/NgPbP/S0rGKwUjlDfa2os7xHySjFZl2srlicSW0P7cjRgQy
         OLT4VrN91tMZ8tpm8fvL4kTr8k003xHyrlFhbPWnxDtixFzRmb8iapSd7eyObA4rkqj+
         n0OwziV6UZYCLXkRB+/2ra9oRhPM+ZZ0ZYxu2aXIFQgebL+Eg8CXl0kGpljF6xSLHEIe
         ckeM+bfXuX1ebGL/T0hcQLOYQLvDFQ21WzvCI2MbVCWOn85JNYKnitSECMRMEMGORu4Z
         sYyAoyMV9XSU7HFdJwEhpLNuQX7jX6qLx++jIWtrXVaow5zEyJGpwv1Zc3k40wOdKYXj
         jVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+zMlxNkHCpgIpdyZ+i/qaeSEii8ZtL5XJfpb+I6Vwrs=;
        b=fgBIg8sZHbwzLK7S+l/NDcgcNpTw+kGCSrsApo9mGbfKUjGpJOIUUS95gCZX1DfGMY
         nZODwTCqNE2kE1lQLJkMrVU3/sSUkBiv4RP9YKZbNrbib5IAKi/Y2VWsYbxBmM7FIXJZ
         j+4dtHZSmWFnV91mlUK1cIKVCqYtjya+tOMLvBMioNKOifx2KQHNj8Uamt1wXJaGNHZT
         1n0s7dpCqD5n6znJo6idbL8PY4cyB2yjA7un1C3M1hPI0u2pEbQvC2xIUOCnQdbcDGXa
         OnUEt+aYSAqaJ0bKmcdNBYwkZpsSeps1imjhnYMHpbdH2lGjQEopJL2C7o0FyuX8OToP
         XTqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MiEDkn0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z9si1152148ywb.50.2017.12.07.06.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 06:16:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MiEDkn0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMwy4-0002R4-O7
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 09:16:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMwxk-0002Nk-RY
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 09:15:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMwxe-0002ss-Qa
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 09:15:44 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMwxY-0002eR-JR; Thu, 07 Dec 2017 09:15:32 -0500
Received: by mail-qt0-x241.google.com with SMTP id a16so17837638qtj.3;
	Thu, 07 Dec 2017 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+zMlxNkHCpgIpdyZ+i/qaeSEii8ZtL5XJfpb+I6Vwrs=;
	b=MiEDkn0d3KYe7918qMR1WaE4kJZM/mwIW2xcvVDt11t3OG9nb5odYnYP4yW06YqseH
	G/uitrEruVZS8Tab2lqdM08TiTLrMxlQZI53v08MpKFdo+vk8qKft0YuHUH+zTk8wXqn
	nA9j8ijVL0kQFsTph/hFe9NTaQ5gAJNmotbZTl4ruEeSnibZlbXUeB52pn0nJwdWvlbE
	7udwFQkRUeVgk1Yaa9CJi4z08wOKOP7DljWHPvxlHeaMnlo/EZUcNBuMwOPrMdGF8CNH
	lb3D2nCCenNdUzIN51zIooow6/j6JwqYIpKvWHdolHJBAojvhChC+5mITQ6aAGqSVcLZ
	9hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+zMlxNkHCpgIpdyZ+i/qaeSEii8ZtL5XJfpb+I6Vwrs=;
	b=qz1yIgvCbekqaVnv8Yf/8R9RsIRDiFHqdowcxFk+QeXU10eXmms5myCDVobvnCNQoP
	m7VOhIhfT0C6pSkNAh0xGlZqg9D6vKRHiPvUSFCdpbljk1S5mWO1+wfB0z1PxGhiS1YT
	0YNGApJtOZZuy1WVUs3xrgZ78hyuziWmhh+OqodAMtgdg+l5KLthBjWxT5+DXejhAKn5
	Z0DL5r30v4rYppujcZ/g9uH0NHPuIN88g/AuJ5u1eG3bIgNekLpixIdnfrmgm0WctUgP
	KabgtaF6bCZxUrk0zFp14E7Zh9BiJXAe1V2/6lU1b24ajMelM8gnOwTZyuCZQTajW6U5
	xC4A==
X-Gm-Message-State: AKGB3mL25t83fn0IFhw9wf39nvoCyu83AD8PnJ8Vb2uJMsCqyaO73552
	XeyL+j/fi359lEhxm+hS9+8=
X-Received: by 10.55.212.16 with SMTP id l16mr30524729qki.40.1512656128553;
	Thu, 07 Dec 2017 06:15:28 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	n73sm2926821qka.79.2017.12.07.06.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 06:15:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
	<1512153879-5291-5-git-send-email-peter.maydell@linaro.org>
	<ac246e55-a12d-6d9d-959a-47aa0334c17f@amsat.org>
	<CAFEAcA8zN1nd1pWE9SZGzE1AipO-Ss7Xz8kSXMEvFhX_C5LckA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <37c60c49-ad3a-559a-c6d7-9687ae868f55@amsat.org>
Date: Thu, 7 Dec 2017 11:15:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8zN1nd1pWE9SZGzE1AipO-Ss7Xz8kSXMEvFhX_C5LckA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 4/7] target/arm: Split M profile MNegPri mmu
 index into user and priv
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LNd2xCcpW6h5

On 12/07/2017 08:07 AM, Peter Maydell wrote:
> On 5 December 2017 at 21:23, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> The patch is correct, but I don't like having magic values.
> 
> Yeah, you're right this would be better. I've already put this
> patch into target-arm.next, so I'll just squash in this change:

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2258,6 +2258,11 @@ static inline bool arm_excp_unmasked(CPUState
> *cs, unsigned int excp_idx,
>  #define ARM_MMU_IDX_NOTLB 0x20 /* does not have a TLB */
>  #define ARM_MMU_IDX_M 0x40 /* M profile */
> 
> +/* meanings of the bits for M profile mmu idx values */
> +#define ARM_MMU_IDX_M_PRIV 0x1
> +#define ARM_MMU_IDX_M_NEGPRI 0x2
> +#define ARM_MMU_IDX_M_S 0x4
> +
>  #define ARM_MMU_IDX_TYPE_MASK (~0x7)
>  #define ARM_MMU_IDX_COREIDX_MASK 0x7
> 
> @@ -2328,7 +2333,7 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
>      case ARM_MMU_IDX_A:
>          return mmu_idx & 3;
>      case ARM_MMU_IDX_M:
> -        return mmu_idx & 1;
> +        return mmu_idx & ARM_MMU_IDX_M_PRIV;
>      default:
>          g_assert_not_reached();
>      }
> @@ -2342,15 +2347,15 @@ static inline ARMMMUIdx
> arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
>      ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
> 
>      if (el != 0) {
> -        mmu_idx |= 1;
> +        mmu_idx |= ARM_MMU_IDX_M_PRIV;
>      }
> 
>      if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
> -        mmu_idx |= 2;
> +        mmu_idx |= ARM_MMU_IDX_M_NEGPRI;
>      }
> 
>      if (secstate) {
> -        mmu_idx |= 4;
> +        mmu_idx |= ARM_MMU_IDX_M_S;
>      }
> 
>      return mmu_idx;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 14ab1f4..70cf313 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7885,10 +7885,7 @@ static inline bool
> regime_translation_disabled(CPUARMState *env,
>                  (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
>          case R_V7M_MPU_CTRL_ENABLE_MASK:
>              /* Enabled, but not for HardFault and NMI */
> -            return mmu_idx == ARMMMUIdx_MUserNegPri ||
> -                mmu_idx == ARMMMUIdx_MPrivNegPri ||
> -                mmu_idx == ARMMMUIdx_MSUserNegPri ||
> -                mmu_idx == ARMMMUIdx_MSPrivNegPri;
> +            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
>          case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
>              /* Enabled for all cases */
>              return false;
> 
> 
> thanks
> -- PMM
> 
