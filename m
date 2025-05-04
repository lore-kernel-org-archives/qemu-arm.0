Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1991992njj;
        Sun, 4 May 2025 09:20:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdGNFOaLgF7OCwPTlDIrLbj4+7EF6xPKkQ8Iw3mZD/yE299GAUdTh8pEX+CdZ+bikOBnABLeOVC8E1nA==@linaro.org
X-Received: by 2002:a05:6a00:6412:b0:737:9b:582a with SMTP id d2e1a72fcca58-74058b25ae1mr12003523b3a.24.1746375633553;
        Sun, 04 May 2025 09:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375633; cv=none;
        d=google.com; s=arc-20240605;
        b=U1ayR/7VOI5+qEEUYnbmAd1fKpFQuUr6YAbIV0ClaxtWJnNd/zApT6VT7pZlfzMjwT
         9BfJnTCShyL9mvMpeswdpIFkP9vXEtfDYKiVleSu7Ub1Khw7npZxWwr5ChSl0sWyHQ+V
         CLZyKdhhQINNslbNvFukhFcHrdruWRnpEPqJo+oeSBqkfKCzkO1VE2/XdkBop0CsUuyD
         poCJ6pCPfHkWvlcLAm088TRD8wv3Hof+deYT+5pf+Ulniq7UDGWtF2ElpOH5z/2LqqfW
         QpvwCZiV1BFBGdpHkeylJPrNbHCF4q1++ciYwAjNlv17kJweP9bmH4IBKTWeagCXJ+sn
         0F4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zJHceEEkeyxcT3zd6mSkgQuCloVcRXc5aoVen58Kk/E=;
        fh=5QOWIUCwmN8P8jwfOS2b2WF8bNqEMa3ABGQfjVxzNZQ=;
        b=bILwW+Wab6qGycQYu2ZpjJTmcQTaXYUB5XaIlQMk4VXH9vNdHuWF0AF5PKyxpiVagJ
         QfpOK1oOsJjL1xIS6KyEfIUWfMWB5w69eExVsDMg0ms0AGBCpwbmvBw/Z8Y/n0V9FMVG
         wbvLh4jrWrOoSANw4gOtaVwnbrHSXpqLP0GjDpFZ1FLjpgTitanPun1STO4AcN5QTuuY
         Z/fBUXCO/+1x2n3CKhqPS+2S3cVmnKRgoElGDv4PgnB48EJ5J8KNra0GA5BdXgwoWPmE
         cR4NaM9ZvOJFbNaqdrUnEEf2YuCZ3vECiJQp7ln1HvX5bQXFqJMFlHlHct6WftOTJoYA
         zbBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdqgRQi2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74058d5afd6sor2460960b3a.6.2025.05.04.09.20.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdqgRQi2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375633; x=1746980433; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJHceEEkeyxcT3zd6mSkgQuCloVcRXc5aoVen58Kk/E=;
        b=IdqgRQi2EN0vsXeD2PxD9UdTblcnBZKTod9Hx+9BEOp3ZEOKP0ILw3H/qbjSplO+5d
         6gAffnLM+QbfqjuCUeaYdC6lgtbH2T1SBsDKs83XgbuvBBbvOckH/TfL3+0HujjbNEW/
         fea9pnAoCxImmABwdCzvCUbzk2h1lxtOU2uPu6bFHLZErU89Zr/vpyacdT1Winyl5ROa
         SXvtjQ7PQlU5s+4K0ThQGpARdK/qX3t1C+bYB0KsUp915NUib9wYntOj3mD+gb+ubxq0
         vp3h342RAtdDRPGMtyEwoll3vvuchflYvBN8XXmaGQU/B2jR8vx24RYuziBu4hoBJ3O/
         eZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375633; x=1746980433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJHceEEkeyxcT3zd6mSkgQuCloVcRXc5aoVen58Kk/E=;
        b=YyX0irWfyPEroeZXY/gKMggOk04AHuS4qNkFQ2++Z8YuXTLOg008BJd7Nit+RAr4pN
         uycON+U8U5vXfg7QnCacvmlBp+MAWP3nvySTABaHLpGlNk791NSibOscwvxoE1K/FRN6
         GXnigP+DM5LdRaQMJ3sDYbUrWK8ClN5AuuAPGVA3rLDv65t4v5XREX5J3cXeDLvMM3dC
         e8IegLcNbiKDPf6WVuj6OUGynpCfeV3T60y5J6chC9bn9oTvebYCGJHizI+w+m9EFWMX
         dC05N/bE8ju/dHmsCDkva4J/4xnXnc8JvgE7D0WHZWuuXzVOHAs3HSaLZfL2YUC3n0Fy
         5Z4w==
X-Forwarded-Encrypted: i=1; AJvYcCUf5j3v7+IXZjtBayzrBGGm50gyNGS+FEKi9gZXjMgaIjcWMIY46Wd/LlewqN5+Fmy6faS1Qj9wwTgz2A==@linaro.org
X-Gm-Message-State: AOJu0YyEPZ7mtOrHp78WOJJomKZ8X3b56Q7ZuJVZqFRKRbcOzcLO+Gc/
	mIXV+u29crEdjjrHjaMdBsoB/+R2CHPkfisP12YMWE1BvvDM2Pi8H9QPGnOvEBD5iQ==
X-Gm-Gg: ASbGncs5j6TXcGblW5n77+VL1Njz/TdyXgzW9Jjg9AwQo6HYKBpCyaR5trTSdR+kqri
	embqOtDOnsNV/37znNldcDBaJazN29B/eP05ZTL3aznAmx+QEcWFmYIznb8XzhkHHHINzAUW2jJ
	i+cKmyTe/9NeioxMP4sv0rCPz+QKUEnfggJft/4QS1qMFW1ITtCq02J4wCExU5UEPFf8C8vLtMs
	sHEq3d9zhJtMP+PPpVxSE2KCN/DNZJZoAOQrvpjt5vqzCLnbas3hIWc2aBnpiIakC+8rwD4805w
	h9vS+KrvRfUl0POBU5jU/QA5gI+ZbtfZ9bkJKEGab2+zAiFmVm/4Wn5iY7QNQd3QvPwAusBBH5V
	qaqiuXJF+D1CEsH7uAg==
X-Google-Smtp-Source: AGHT+IGtwwpdCoFgoeHENo7R8imMlsVj5gbbGhDx/+eRpKnO+uoh+dxjP4dhQqBg49qM6YaKXQNzeQ==
X-Received: by 2002:a05:6a00:6ca1:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-740589050bdmr16062495b3a.3.1746375633152;
        Sun, 04 May 2025 09:20:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d029sm5162896b3a.134.2025.05.04.09.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:20:32 -0700 (PDT)
Message-ID: <2ce2b462-bce7-4160-b8fb-98ca2409df55@linaro.org>
Date: Sun, 4 May 2025 09:20:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 37/40] target/arm/machine: remove TARGET_AARCH64 from
 migration state
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-38-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-38-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oClOhgn/F0lU

On 5/3/25 22:29, Pierrick Bouvier wrote:
> This exposes two new subsections for arm: vmstate_sve and vmstate_za.
> Those sections have a ".needed" callback, which already allow to skip
> them when not needed.
> 
> vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
> vmstate_za .needed is checking ZA flag in cpu->env.svcr.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/machine.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index f7956898fa1..868246a98c0 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -241,7 +241,6 @@ static const VMStateDescription vmstate_iwmmxt = {
>       }
>   };
>   
> -#ifdef TARGET_AARCH64
>   /* The expression ARM_MAX_VQ - 2 is 0 for pure AArch32 build,
>    * and ARMPredicateReg is actively empty.  This triggers errors
>    * in the expansion of the VMSTATE macros.
> @@ -321,7 +320,6 @@ static const VMStateDescription vmstate_za = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> -#endif /* AARCH64 */
>   
>   static bool serror_needed(void *opaque)
>   {
> @@ -1102,10 +1100,8 @@ const VMStateDescription vmstate_arm_cpu = {
>           &vmstate_pmsav7,
>           &vmstate_pmsav8,
>           &vmstate_m_security,
> -#ifdef TARGET_AARCH64
>           &vmstate_sve,
>           &vmstate_za,
> -#endif
>           &vmstate_serror,
>           &vmstate_irq_line_state,
>           &vmstate_wfxt_timer,
