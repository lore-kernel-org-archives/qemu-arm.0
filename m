Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C2DC83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctSm-0007Tv-4B; Fri, 18 Jul 2025 18:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsrb-00040c-Un
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:43:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsra-0006sc-Ah
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:43:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-23dea2e01e4so29490225ad.1
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752875008; x=1753479808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pNswNgnNbDvVcuoMnGRX1cNiu+F3tc7IPFoBAePUEnE=;
 b=d2eHSXo3zTqqIHmV5LxSd3SMUGHF+Ni+9qS/vrDtpqE2w2Z5BnYl9aHuxVuPODI35o
 3lqkQ9GpvcItOQEjAELA6/V47Azb5f9O0uMOO/Ywu270KjAzckn5Boykxh3pfRW0qkSu
 ebfk0XAjv912/K0ibpDRg+A11Kl5gcrlWfnp6hgDiO1nHmfL1wvH44UfxGY5AdFrgxdl
 a2vYPmCM1jaGdvX90WEL6lNPXxRONU+FSDPwijoK04TRcIsXrMtxvMuhzz+6TelIoCyv
 keKOfepcjqV5+Nsgtwvvlc2ZnFhi137kUZoP4vQqQxgtEPHLrlrFGtqXwJWHioSMyHGo
 ZM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752875008; x=1753479808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNswNgnNbDvVcuoMnGRX1cNiu+F3tc7IPFoBAePUEnE=;
 b=l+2k+xEhpYgDShyQ271psQhU9P11bqBijoH68Q/dcC0cMYXDTM3VPWZRPiM/PaJGgv
 OXp3ua36DWjp9y6GAKagBGnAFgdDMkI25D13kvRgS7NcHRn+gHk6RXHL/MZ5lN3KeETA
 RpSlpemLnc54YuRWoGDhOOXTopxpLcdackWebiQ7FFbJp7/EM1nk0VYzGLghYINxBoRe
 UYuwUdYWk5aV/LUdlwQ5rFeAejiRqTHyVMeMGhioGxd5BS3dRDv/M+fCiRVbAmI7Quei
 JsisajTRw6vS6tYLVFYUYpDFAK4PxgGmtYT2kUiw5c19kgeIT8cH/sgk4hTG2yqWg+CF
 tr8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0FIVmHhS1P5MeQjNuEQViFKaX1+W6UHmMKcWJeZszlbkTipl11MhhI3BAXDZIpiVjGAY2kfpV8w==@nongnu.org
X-Gm-Message-State: AOJu0YyyFDMGHCxoMPWRho3XoFItVXNyhjWqULjcQQxnb9YaqpVRlUlV
 ke1igS2qiwG+GpZuj/d5b8OPLVdyZvQv6PX0QTYd8+hhGCxx4LtunGvmhuRLS4MSMNg=
X-Gm-Gg: ASbGnctK3WJAYmESLtvMGkHe2A7xQj9uh77YKRjhgVF6AhxoFQ859D9q5vpxpfpbYM2
 SNfUF4iX/+cQANWP384TPlWmzRCCn7rD/jP9By3B7XGBSMhhQnzvQgGL3zqCMGYDXbU2Jt+z3pC
 MpOepZz/kr9ClKJ6cb+035PreQ03Q6S7BiE6L5Ujao6xjehgjVR1ZVCyWT4xxVepCO/OMQSu14j
 a+g/gxz7P3A5lqKCbN66x9g+vePKbT5exaX6yelp/IL5uKuFMYhDLUgQzaiSPyK5LmEhetP8kpx
 XeUU/1kryzaXI1PKZJIDJ+oUIECYQXAFP97PZt+zQ3T3nAdc+Bczrkhd9t708gBNGgyub/pST8G
 NJpaJeDJg93rdHY/SNzZ220J6mpXca6bTfw60yBB9dA==
X-Google-Smtp-Source: AGHT+IFBdQbVUATtOlpIyNZCK3RTA14viuWQoD406fNbjSqUwYu6UsKekLdTeXC92R+MKl/+gZ740A==
X-Received: by 2002:a17:903:1112:b0:235:ec11:f0ee with SMTP id
 d9443c01a7336-23e2569bbe0mr163386585ad.14.1752875008528; 
 Fri, 18 Jul 2025 14:43:28 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b612373sm18183165ad.72.2025.07.18.14.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:43:28 -0700 (PDT)
Message-ID: <d64ffc96-4991-46f2-8cbc-77d59c33f3b8@linaro.org>
Date: Fri, 18 Jul 2025 14:43:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 07/10] target/arm: Correct sense of FPCR.AH test
 for FMAXQV and FMINQV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-8-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/18/25 10:30, Peter Maydell wrote:
> When we implemented the FMAXQV and FMINQV insns we accidentally
> inverted the sense of the FPCR.AH test, so we gave the AH=1 behaviour
> when FPCR.AH was zero, and vice-versa.  (The difference is limited to
> hadling of negative zero and NaN inputs.)
> 
> Fixes: 1de7ecfc12d05 ("target/arm: Implement FADDQV, F{MIN, MAX}{NM}QV for SVE2p1")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-sve.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index fc76624b5a1..2ed440aff15 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4020,7 +4020,7 @@ static gen_helper_gvec_3_ptr * const fmaxqv_ah_fns[4] = {
>       gen_helper_sve2p1_ah_fmaxqv_s, gen_helper_sve2p1_ah_fmaxqv_d,
>   };
>   TRANS_FEAT(FMAXQV, aa64_sme2p1_or_sve2p1, gen_gvec_fpst_arg_zpz,
> -           (s->fpcr_ah ? fmaxqv_fns : fmaxqv_ah_fns)[a->esz], a, 0,
> +           (s->fpcr_ah ? fmaxqv_ah_fns : fmaxqv_fns)[a->esz], a, 0,
>              a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
>   
>   static gen_helper_gvec_3_ptr * const fminqv_fns[4] = {
> @@ -4032,7 +4032,7 @@ static gen_helper_gvec_3_ptr * const fminqv_ah_fns[4] = {
>       gen_helper_sve2p1_ah_fminqv_s, gen_helper_sve2p1_ah_fminqv_d,
>   };
>   TRANS_FEAT(FMINQV, aa64_sme2p1_or_sve2p1, gen_gvec_fpst_arg_zpz,
> -           (s->fpcr_ah ? fminqv_fns : fminqv_ah_fns)[a->esz], a, 0,
> +           (s->fpcr_ah ? fminqv_ah_fns : fminqv_fns)[a->esz], a, 0,
>              a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
>   
>   /*

Whoopsie.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

