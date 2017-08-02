Received: by 10.25.44.15 with SMTP id s15csp58795lfs;
        Wed, 2 Aug 2017 14:51:16 -0700 (PDT)
X-Received: by 10.237.46.38 with SMTP id j35mr35835822qtd.285.1501710676556;
        Wed, 02 Aug 2017 14:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501710676; cv=none;
        d=google.com; s=arc-20160816;
        b=Yz8jV2+/klB5sZeEQ7jCv5RAbANyxqNFIE50E54y2KV1Ow7zPb8LginjGuHRJPCVRa
         fzu7R0hDIdKzYUq4684qEnSV/N1Uyxr5RUhyq/ryTbrRpOcSXJ3IXL8rwriCOgPHPIAz
         G8SFobMpcFuptKZ6ZZTD8XG/sVq+6VQU3w0pJ5si0GxmCx4RC2NWEO/nOxU4oEwS3cv9
         gOV9IG3QYLUfG0q9GHbfuKXGpZ7cSMTsBaLUsei5P+n1msZawpMDIs7X7+kOUZ+tTBxR
         n/Fdy+grQarBmyQikGGbtJebDom3nSseVwUK/EnYhq3m7ms6vkPlDHwvIvT+wmkp82iy
         vRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RDvK3zUR8byaFlE5RrbFNMXyx+tTmswp8zRYUjhk7sk=;
        b=oTX0JqiTN1KquQnXqXhKOTiYdzHmIaOItRY+/ZzMnZYxNLjF3wr0xaKDzSKi5gXUfU
         V1+bzGFclW8kSGtDFXJyF74m3d1rd1TSI5zJHCv2nymdDgy4QK3uHIexGCDubc/cM/Mh
         zWy1xPRkaUKz3KDEXUc3DLkY9FtfIKjfE/wabhG8AC4d7ydTMeoaZCm4WzajkTwXV8sa
         DHdSeN/bV2GCovBILqZCBvZW3JBYE/odmHnfTNmaA8d53X/9E7bgh1vqUL3YEP0pH2+I
         c5Lxg3WTjQfQXJnmG3bUIXZwskYQitvQ2zFU3C05wpw/CP5w2107Jt/UPujjx+dhptCD
         Rg1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=PcDVCdJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si18169668qkd.300.2017.08.02.14.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 14:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=PcDVCdJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dd1Xt-0001iA-W9
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 17:51:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Xo-0001gy-Sm
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Xn-0001wf-Sh
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:51:08 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Xj-0001qm-86; Wed, 02 Aug 2017 17:51:03 -0400
Received: by mail-qt0-x242.google.com with SMTP id p3so5915365qtg.5;
	Wed, 02 Aug 2017 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RDvK3zUR8byaFlE5RrbFNMXyx+tTmswp8zRYUjhk7sk=;
	b=PcDVCdJs/Ft+IDVufAjJFaqFXoBiTZ7wTRyeO9mTrh2j1HLSfB9kFNqam8AwiobA2p
	Q0IWfBIjoEONjaPmQ0Mkb8jZLUC9z6LmKDWDUOMllwxlDTs0hJfYPmNGiIvuQr7JHRgl
	ygQ/AL9aE6kcGlg9QdSRy4dgmanu2TiOJ8l2Dzx+WB76Cur/+LoHjtjI+o+AYgKwU+uK
	tMCh2uZd+CbBqUKefDSB9OrTSQxnKfi/SBa4cr2AQg7wzKSbB89DNZRvK4pOUdD9YSN+
	3zeGXrysqbzXUA4R2eEeLwd/mbMN6UC580A6XTPrTsrsWDAwOB67xAHAiRt8DygyYrUE
	znbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RDvK3zUR8byaFlE5RrbFNMXyx+tTmswp8zRYUjhk7sk=;
	b=dAhTkflMqQp6DyGCXQs/1FdjmGRNgJdkZlA/+TiBLcSCCqwqRh7wB8iRc7lSyMdSxm
	BKWTTnuDEuoPiXfkwVwbukA7WXNd3GmodVZ9A/mgCC9sTTEB+t9Fx00LMjWyGRblMFTx
	6tGfGPIlYMrPw1I6PcoRKVo6ABRu50GEFnvR4/6dCrWADgNsxiXJFAr+NZBvzasOJeRK
	stCSqSzGUO3GlCWiOsl5FTxLlrLXGTQhwVJKo5101NyhOt0ZysLANIK5Y4vI/4OPA8Ch
	BJlKaA/1JsRT46gnSukGiNtt6c9bhDPbtg0JuxSkrIwfjbARq+swVABwzRF7MbJ/XmFz
	9I2A==
X-Gm-Message-State: AIVw1132gJ2Ai/LvFTlXNl5H4JMdgRu/fQM0nnB2ugyLIMt6toKv1eVd
	sSerSfbhwHzzjuATK2A=
X-Received: by 10.200.38.39 with SMTP id u36mr34668133qtu.121.1501710662589;
	Wed, 02 Aug 2017 14:51:02 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	d13sm25574749qti.72.2017.08.02.14.51.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 14:51:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c967927-f368-84c4-ce7e-54e51576ed14@amsat.org>
Date: Wed, 2 Aug 2017 18:50:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] target/arm: Consolidate
 PMSA handling in get_phys_addr()
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
X-TUID: Apy17APkXQXy

On 08/02/2017 01:43 PM, Peter Maydell wrote:
> Currently get_phys_addr() has PMSAv7 handling before the
> "is translation disabled?" check, and then PMSAv5 after it.
> Tidy this up by making the PMSAv5 code handle the "MPU disabled"
> case itself, so that we have all the PMSA code in one place.
> This will make adding the PMSAv8 code slightly cleaner, and
> also means that pre-v7 PMSA cores benefit from the MPU lookup
> logging that the PMSAv7 codepath had.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c | 38 ++++++++++++++++++++++----------------
>   1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b78d277..fd83a21 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8423,6 +8423,13 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>       uint32_t base;
>       bool is_user = regime_is_user(env, mmu_idx);
>   
> +    if (regime_translation_disabled(env, mmu_idx)) {
> +        /* MPU disabled.  */
> +        *phys_ptr = address;
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return false;
> +    }
> +
>       *phys_ptr = address;
>       for (n = 7; n >= 0; n--) {
>           base = env->cp15.c6_region[n];
> @@ -8572,16 +8579,20 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>           }
>       }
>   
> -    /* pmsav7 has special handling for when MPU is disabled so call it before
> -     * the common MMU/MPU disabled check below.
> -     */
> -    if (arm_feature(env, ARM_FEATURE_PMSA) &&
> -        arm_feature(env, ARM_FEATURE_V7)) {
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>           bool ret;
>           *page_size = TARGET_PAGE_SIZE;
> -        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> -                                   phys_ptr, prot, fsr);
> -        qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
> +
> +        if (arm_feature(env, ARM_FEATURE_V7)) {
> +            /* PMSAv7 */
> +            ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> +                                       phys_ptr, prot, fsr);
> +        } else {
> +            /* Pre-v7 MPU */
> +            ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
> +                                       phys_ptr, prot, fsr);
> +        }
> +        qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
>                         " mmu_idx %u -> %s (prot %c%c%c)\n",
>                         access_type == MMU_DATA_LOAD ? "reading" :
>                         (access_type == MMU_DATA_STORE ? "writing" : "execute"),
> @@ -8594,21 +8605,16 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>           return ret;
>       }
>   
> +    /* Definitely a real MMU, not an MPU */
> +
>       if (regime_translation_disabled(env, mmu_idx)) {
> -        /* MMU/MPU disabled.  */
> +        /* MMU disabled. */
>           *phys_ptr = address;
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           *page_size = TARGET_PAGE_SIZE;
>           return 0;
>       }
>   
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        /* Pre-v7 MPU */
> -        *page_size = TARGET_PAGE_SIZE;
> -        return get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
> -                                    phys_ptr, prot, fsr);
> -    }
> -
>       if (regime_using_lpae_format(env, mmu_idx)) {
>           return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
>                                     attrs, prot, page_size, fsr, fi);
> 
