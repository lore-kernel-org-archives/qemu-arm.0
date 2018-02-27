Received: by 10.28.71.27 with SMTP id u27csp5050194wma;
        Tue, 27 Feb 2018 09:09:19 -0800 (PST)
X-Received: by 10.98.28.202 with SMTP id c193mr14770929pfc.109.1519751359160;
        Tue, 27 Feb 2018 09:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519751359; cv=none;
        d=google.com; s=arc-20160816;
        b=0ShogXjPIP9DE4181Ml1U09pA331PzJa1vrSCCMYmFc+QqIxytYMNKs4BMuAwwz53i
         gSVg2KbvAxARBKRXSJVsOW5FbIyKboAWFjZG4pjLxxsOU8GpQ5wMMFTnWTUpZrzGca9i
         i/imRNQXXpOqCaB838O4dd6HbYejHzb8rUd7yCDHg13on6mp3Rb4isOyxGmHDUV9bO4V
         ZeUxHcrF1ZfNHeQPlwGE6Y2dXP6Vp8OCk7z26IY08HlZlvV4ugHFjl6Rp1RPoaQeiDxA
         RAfJMa+p1aRLH8rQ4NQWvds0jUEyrnd13try6Ae7M+iQwatJNULo5rfB6zj0jLtDpxgY
         Vs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=H/96qLKaCJCnzrMp1/pFUgkeS9JFR2JuMIxwFLGPzVc=;
        b=P2Q3X3pDxG9w8skL4OP6qCQaIbUD+3xrfl3dVgzlR8J+ofwcZb4i4QzGxvomYcQgEU
         FthiI77znpOT2u59cYy2Sw11xLu3OltK0vXiwcdtbnB1EisTi8DHgOVaEJPIAkiZkD3o
         gOqPehfdHSmAgE/L9B7Sn5EEl7Eqex2dOXNQcSyaoQFtLGKbGK93TsqBXQ4f2rN6nvy3
         xsByY/nawsxFXoAE9subnUbFhWeLJ89kMhOytOSXEbo4oningQqnR6RmGYe5xlsWsKMl
         j62khJKWz9/h4MWUzbD8CRz/fVNZXfAHLfR+YoBXYcBNtm3dPAoZJswpxaEbF8+oDPor
         9+TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e49k7Swm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f19sor3050750pfd.87.2018.02.27.09.09.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2018 09:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e49k7Swm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H/96qLKaCJCnzrMp1/pFUgkeS9JFR2JuMIxwFLGPzVc=;
        b=e49k7Swm8zkPEBjt7x33adnJxqHCOMU5736pXOFbGgs6+yIuyb+AkP60ZVNHn/nsrt
         3IFSB7VEREmikSlWcL+RZSXnPWBSQAxWLBpbVfqnX9yoTpSdffuRDi+n73K0NRXhfz7s
         +n4ohRo7fnuOsHeP1DB5JpQ12HZ59xn7Zp4ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/96qLKaCJCnzrMp1/pFUgkeS9JFR2JuMIxwFLGPzVc=;
        b=rlFDIuwhXsSqv0uBd4YWRGvhqDlFkNZj+mw1M0Qu+nHWvagirxD8SrcWRAdrrOhV7V
         3Rd2zyMBQ0IspZTl4USnKIoGVUPgC7+PThxm+WoRGl2Hs9fNs8mIwv+twnu8MX7pE1Tv
         WL8pEx2ibXS03s0+vFnYdXaY8XopcB9O4RaIcmTNCbJC2s/K+i/Mgk+P9fwHDyy28BsG
         39rfUqG/InSbcfergqzS1u7zvTjQRcuzEuAH91q2i5An0ck0giN2WRq7LxOKh6Mlmerx
         rHCKoe3MpsvMS9XrAkTSBFv2ez0tOTa066OgKWxHfWiruD/8EUcbVCJFSEM2fkzChmYS
         nmkw==
X-Gm-Message-State: APf1xPA7RxUY0dGKTN5Tvf0K7nI0wqjzqldyhQUeexmNcsdQMpdDtr71
	nZBd6ChvB4IwITodPMCFFuvIKsXo
X-Google-Smtp-Source: AH8x225Jx4HSgVRA/4mN9pW/GogNbrBO40MjsIXSxH6EWDH3hkKvXjokWppXQWggLi6Ppv+qEr4X3g==
X-Received: by 10.167.128.194 with SMTP id a2mr14949391pfn.186.1519751358296;
        Tue, 27 Feb 2018 09:09:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id n7sm429913pgd.87.2018.02.27.09.09.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 09:09:17 -0800 (PST)
Subject: Re: [PATCH v4 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to
 simd_indexed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
 <20180227143852.11175-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19852743-3c93-9d0f-5ef6-8bf351a98ce7@linaro.org>
Date: Tue, 27 Feb 2018 09:09:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227143852.11175-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: USTHgwxbCMWf

On 02/27/2018 06:38 AM, Alex Bennée wrote:
> @@ -11244,7 +11245,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>          }
>          /* fall through */
>      case 0x9: /* FMUL, FMULX */
> -        if (!extract32(size, 1, 1)) {
> +        if (size == 1) {
>              unallocated_encoding(s);
>              return;
>          }

This is still redundant, since size == 1 is handled...

> @@ -11256,18 +11257,34 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>      }
>  
>      if (is_fp) {
> -        /* low bit of size indicates single/double */
> -        size = extract32(size, 0, 1) ? 3 : 2;
> -        if (size == 2) {
> +        /* convert insn encoded size to TCGMemOp size */
> +        switch (size) {
> +        case 2: /* single precision */
> +            size = MO_32;
>              index = h << 1 | l;
> -        } else {
> +            rm |= (m << 4);
> +            break;
> +        case 3: /* double precision */
> +            size = MO_64;
>              if (l || !is_q) {
>                  unallocated_encoding(s);
>                  return;
>              }
>              index = h;
> +            rm |= (m << 4);
> +            break;
> +        case 0: /* half precision */
> +            size = MO_16;
> +            index = h << 2 | l << 1 | m;
> +            is_fp16 = true;
> +            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
> +                break;
> +            }
> +            /* fallthru */
> +        default: /* unallocated */
> +            unallocated_encoding(s);
> +            return;
>          }

... here.  But it's not wrong and I can clean this up along with the additional
changes I need to make to this function for fcmla support.  So,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
