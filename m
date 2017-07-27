Received: by 10.25.44.15 with SMTP id s15csp2581212lfs;
        Thu, 27 Jul 2017 16:32:29 -0700 (PDT)
X-Received: by 10.200.40.210 with SMTP id j18mr8607188qtj.172.1501198349299;
        Thu, 27 Jul 2017 16:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501198349; cv=none;
        d=google.com; s=arc-20160816;
        b=j5mLzhKJ1AGkSDVS2PxMJHpRghdViCYHZ4WyGsRWmQ3hVvOpVo8f8QvSCMg70QyvGf
         X0IciTjjU5r0qi28fldEg49vGmp5EBz9r6BGnriqZV7k8YGjGVs1/vKtkuYWz0f4p2yG
         crR0W5PcBQWM0QSop79k+Sim1v7nfRYSESwCr+B1uBOXAgF1nkr5wtDdmW2UfqEq0UAX
         S6mEpdz8Nrnmm8wg1OxfnoII60P4iGTewbxlT/m+ytWaSeldxYpMUIU5MXOWH0xdB++5
         nkv09+3/sDULatsS+Snk5Etc6oGM/bhWZV9o5yVvChu8KKW3yDIStuIRsNbx/wUvfxZH
         Mnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=WPR/oIT9B78QdkPtBJKTyMX2yxP02/q9AduWKcAQoBk=;
        b=M3X0e2Fsy5FlS+DlW7lIwYY/B4f4TdmC3lcCASihgXwE4LdXyto9c4HusjUkmt4Rhk
         Yn7j6qiQ3o70V1KOiDxC/20O5sR47ikl79WjRuXoQq4UcbUVFRQ6WPmnT6rT8WUybSGi
         Dz/L3FTgbzd/S7xRS2rvYc8WxRfdM2n9gbcY8jCK/YuxhyQCBtHjClqfpKShgkUIbx5h
         yntVnAGbkQD0zOEBbb6FmiS4g3zOfk8s4uYNhaisgTjMRkz3c23FeXU5SAwaFzYoCe1K
         ibnKHjb46YB8+VGyIlEvWUBKtRZQ/N0WYh3I9B+PuVDL5ZE+hStGIetwb+SvLa8dq+h0
         3kyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=sXGBZl54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si11697246qte.36.2017.07.27.16.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 16:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=sXGBZl54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dasGY-0001Z8-MY
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 19:32:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasGR-0001Xy-HO
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 19:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasGQ-00085O-Li
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 19:32:19 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasGM-00081v-Nf; Thu, 27 Jul 2017 19:32:14 -0400
Received: by mail-qk0-x241.google.com with SMTP id d136so19748205qkg.3;
	Thu, 27 Jul 2017 16:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WPR/oIT9B78QdkPtBJKTyMX2yxP02/q9AduWKcAQoBk=;
	b=sXGBZl548fUpztt7kQA8wn14oDpIztcnfdJzcFStTdW0GoeWHlcuUY5KvKTehBEw6t
	ZYueNr5iqC8oPl64OvSUiyEZs0rMJ+/YqYNBpDfmtF3jF8lJPfLwkX6NYIfwyvOumNKA
	5Rnggm/B2T8o1bubdOkfSx0so5iwKr4ou+ffaSnrzdkH85jKmiAcMw8OBYn+T7PxRx/z
	7pSrSOKFAL1509YgViMseBU0uNu33X7mV8Z98WLueVAuTxZSLHfH6TA0H3dYwWRrvWiw
	7HMMls8BlzIUN/nxyYP3EYQr77BBg70E26O7rxfwS++qqS9ObrdW3hpHBPTbYPEVoCgy
	ih/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WPR/oIT9B78QdkPtBJKTyMX2yxP02/q9AduWKcAQoBk=;
	b=jdjztXI1LxdHIahlF11tBJEQ4jFGhyX389ybT+RkufGt81+fWrgSsZw1X846PWRUdn
	9fRcKby4HWElsaeLlmNkEIfuUiMWPDjJLI7Y41623OLVg67MFq5onmBhRz4dCeHVugu2
	iU4HUJ6WgNNbwxz8I3JH2pLg6dTJX9+bQ2zKUNZdhYyX74nq7/lqKXeSXvFmGWmcuc2j
	LGPNTYcHnUMSkPODTTJKIJLtjbkJAtA8owAYX+qcG0A6XTrHsX3w+NP4p9pO/awQt1mB
	jCEGWVSj1qWohu9Fexwxfu1+onBTi6Ku+FJvLz1uHe/jS0/cqM0T4fO2o1Cr/nQ9EMEF
	Ol/w==
X-Gm-Message-State: AIVw112CqmZEyv9OHpuIRb2j7I+YXZTZWJKmcxbMRKFtE7SLHw+kULcp
	BVtw6iZwUjR59w==
X-Received: by 10.55.82.3 with SMTP id g3mr7767003qkb.23.1501198333974;
	Thu, 27 Jul 2017 16:32:13 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id c19sm4532700qkg.6.2017.07.27.16.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 16:32:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <529d1ff6-e9d0-9c63-6d15-ed8f5263d47a@amsat.org>
Date: Thu, 27 Jul 2017 20:32:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501153150-19984-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH for-2.10 1/5] target/arm: Don't do MPU
 lookups for addresses in M profile PPB region
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
X-TUID: 3sTIBQ5JCYzY

On 07/27/2017 07:59 AM, Peter Maydell wrote:
> The M profile PMSAv7 specification says that if the address being looked
> up is in the PPB region (0xe0000000 - 0xe00fffff) then we do not use
> the MPU regions but always use the default memory map. Implement this
> (we were previously behaving like an R profile PMSAv7, which does not
> special case this).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4ed32c5..ceef225 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8244,6 +8244,13 @@ static bool pmsav7_use_background_region(ARMCPU *cpu,
>       }
>   }
>   
> +static inline bool is_ppb_region(CPUARMState *env, uint32_t address)
> +{
> +    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
> +    return arm_feature(env, ARM_FEATURE_M) &&
> +        extract32(address, 20, 12) == 0xe00;
> +}
> +
>   static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>                                    int access_type, ARMMMUIdx mmu_idx,
>                                    hwaddr *phys_ptr, int *prot, uint32_t *fsr)
> @@ -8255,7 +8262,15 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>       *phys_ptr = address;
>       *prot = 0;
>   
> -    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
> +    if (regime_translation_disabled(env, mmu_idx) ||
> +        is_ppb_region(env, address)) {
> +        /* MPU disabled or M profile PPB access: use default memory map.
> +         * The other case which uses the default memory map in the
> +         * v7M ARM ARM pseudocode is exception vector reads from the vector
> +         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
> +         * which always does a direct read using address_space_ldl(), rather
> +         * than going via this function, so we don't need to check that here.
> +         */

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
>       } else { /* MPU enabled */
>           for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
> 
