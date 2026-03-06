Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC9DFCB621
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:39:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyYCK-00014h-1h; Fri, 06 Mar 2026 11:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyYCH-00014A-D4
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:38:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyYCF-0003Ix-P6
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:38:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso140004065e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772815118; x=1773419918; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6jWx1BGRFQjklrs2kWhg2v+cB8X8lSpsYI+htxB8Qs=;
 b=hJ/LO0DDnII7IntaKtnCErzXTLMOJoVNBajxNHkTi7+294n2dpo2kfhphcDt5HUnFK
 7CDfL70XJiS0G/wA6Ew6If6l0BLQFo70VhTbyX1o+QVZ33vMZoxagsE8/98Rp61yzRt5
 JX0/kNUUgnolk7jdd2r85reMyc63uELhA2C6/tQsIo7VfMADhio+oTD8b2M5EAg7zeDl
 Mn6XayloF1SNlSolZBXVlBx3H42K44AF0qDeI6CMivtaIcl2dHVnd1mib4JQPxM7gq8t
 yyeg9e8i4i67lIJpQloaPQG1f3sWII+cwEzp5VoACziu7FOuZdC68AeYcsNM6FuIxO3F
 PDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815118; x=1773419918;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6jWx1BGRFQjklrs2kWhg2v+cB8X8lSpsYI+htxB8Qs=;
 b=Rec6z2E8B/Age9wQD924nqvtJ2BXQ5pxTi/u5HBt5SVWDTCZgT7d3+tANiCfn3o9Ev
 K7csMG5mN+FYC4MFo0Htpn4rMjrmNPOj+T4e/vp9DNL6+EbDIG6luSRwuvQ1hZt8nhc/
 ajXWI2w5Yhy0FVBG6pOWKCQDEBAxJ94qMKULYx7kqg5AoxuntoiV2mUAbJbR1pgCjxeK
 bmFV/oYQYydoHwh6V2Wmia6AD+O3stE870pfLOJnl4CX5pl77rEb8QHy8WyrUmrW/cMl
 T6RTxQk8Hsl+cy+CA/D83xy80r5HqwFREQ4ih5cfD0iw4Hgw8ZZzzkZi/kxni+lZxmcj
 Lymg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh4YStbE7AEWp2CJQa2zPiKxTm6plLkxsWgmahX47spA68snLLVSRzUN44lOrNEIQsCPCZohVKvg==@nongnu.org
X-Gm-Message-State: AOJu0Yzriu+RG1e46GNu35JdzMinafi8cVoYHSJXyDrRrtEsa1RcoS19
 VpkzorehkgYqjKC1c+EBssORgGvwNtDpoNeh5eXZG4Q0c4u6/50tuvUoqJ9bXgiZXqk=
X-Gm-Gg: ATEYQzzMycQSdGUzjZRcDHbpnaJtJLagPhwlA4glNzqLjAZZ6RoGfq/C4gPMN+uL+LK
 Rufkh1oy95j/HgUNsWv/oXm9Ecc8YK65qygIgRIbCg+nS3LBhrdAbnZEIMwB5lB6DFTiRF8wPip
 DgsXvFxFtjrcs3itWh+I2oKN7TTesVbntuBeN1nk133pIuAJLkORWaAFEy/5nXl0befaUod+hrj
 XI5+lo84WUksJ/Q7f8Lujmhva+O1lnK25ZlnMWCtITe+kFBBV4ih1wRDr45/GuNGl4R11S/EOWz
 eTctE0x7MLSDMbXMIr/ynBcrVlUqoY6oOsgWZCaGDGHmC2vk+LdKTb7QvrzwVC4+EM0mfS2Ap7h
 Id/anIG0FgZoZUnYXPbmntT0v+DS3b/GmCNm+Of/vLjjwyFaX56/AFiiO3Yrrkunn0Rig6KnTIY
 GfrVpxIUMucRLOZGxzsMMq32oBmoDyEszr2Yx34aGknd+QS8QxYRbUKpoqczqP6zzsfg==
X-Received: by 2002:a05:600c:34d2:b0:483:badb:6191 with SMTP id
 5b1f17b1804b1-48526923595mr44412985e9.8.1772815117531; 
 Fri, 06 Mar 2026 08:38:37 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae538bsm165445295e9.7.2026.03.06.08.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 08:38:36 -0800 (PST)
Message-ID: <6ba56fc4-210e-48f2-a31c-aa049dad8f57@linaro.org>
Date: Fri, 6 Mar 2026 17:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 01/17] hvf/arm: handle FEAT_SME2 migration
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20260306161509.79712-1-mohamed@unpredictable.fr>
 <20260306161509.79712-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260306161509.79712-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/3/26 17:14, Mohamed Mediouni wrote:
> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> SME2 support adds the following state for HVF guests:
> 
> - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
>    not support it)
> - Predicate registers P0, .., P15 (also FEAT_SVE)
> - ZA register
> - ZT0 register
> - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> - SMPRI_EL1 which handles the PE's priority in the SMCU
> - TPIDR2_EL0 the thread local ID register for SME
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Message-Id: <20260306-sme2-hvf-v7-1-e72eeda41ed3@linaro.org>
> 
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c           | 298 ++++++++++++++++++++++++++++++++-
>   target/arm/hvf/hvf_sme_stubs.h | 172 +++++++++++++++++++
>   target/arm/hvf/sysreg.c.inc    |   8 +
>   target/arm/hvf_arm.h           |  41 +++++
>   target/arm/machine.c           |   2 +-
>   5 files changed, 518 insertions(+), 3 deletions(-)
>   create mode 100644 target/arm/hvf/hvf_sme_stubs.h


> diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
> index 5d19d82e5d..6b1c3b9792 100644
> --- a/target/arm/hvf_arm.h
> +++ b/target/arm/hvf_arm.h
> @@ -22,4 +22,45 @@ void hvf_arm_init_debug(void);
>   
>   void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
>   
> +/*
> + * We need access to types from macOS SDK >=15.2, so expose stubs if the
> + * headers are not available until we raise our minimum macOS version.
> + */
> +#ifdef __MAC_OS_X_VERSION_MAX_ALLOWED
> +  #if (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200)
> +    #include "system/hvf_int.h"
> +
> +    static inline bool hvf_arm_sme2_supported(void)
> +    {
> +        if (__builtin_available(macOS 15.2, *)) {
> +            size_t svl_bytes;
> +            hv_return_t result = hv_sme_config_get_max_svl_bytes(&svl_bytes);
> +            if (result == HV_UNSUPPORTED) {
> +                return false;
> +            }
> +            assert_hvf_ok(result);
> +            return svl_bytes > 0;
> +        } else {
> +            return false;
> +        }
> +    }

Why do we need inlined definitions?

> +    static inline uint32_t hvf_arm_sme2_get_svl(void)
> +    {
> +        if (__builtin_available(macOS 15.2, *)) {
> +            size_t svl_bytes;
> +            hv_return_t result = hv_sme_config_get_max_svl_bytes(&svl_bytes);
> +            assert_hvf_ok(result);
> +            return svl_bytes;
> +        } else {
> +            abort();
> +        }
> +    }
> +  #else /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
> +      #include "hvf/hvf_sme_stubs.h"
> +  #endif /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
> +#else /* ifdef __MAC_OS_X_VERSION_MAX_ALLOWED */
> +  #include "hvf/hvf_sme_stubs.h"
> +#endif /* ifdef __MAC_OS_X_VERSION_MAX_ALLOWED */
> +
>   #endif

