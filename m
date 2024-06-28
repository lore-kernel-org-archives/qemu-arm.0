Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp243842njm;
        Fri, 28 Jun 2024 10:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVE7dUxFbsjnk7nhtAA2RZsqXhMZE+aAd1ZaJ+XqGePBAgQgSZfePdMyViSfDCtOQsNyBSkGOtY8SN3owSHeuVWMhfxChPC
X-Received: by 2002:a17:90a:3d0b:b0:2c7:49b4:7e3a with SMTP id 98e67ed59e1d1-2c927652b3fmr3583510a91.7.1719595098531;
        Fri, 28 Jun 2024 10:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719595098; cv=none;
        d=google.com; s=arc-20160816;
        b=Du5pem/4stSPrKmjwxaQ5mdyWjFKTZINdLpSVMdVRCCmbYniuo7LNj0ooRkgytKMmN
         ilEQ3C76rHt/61UUO4Sj15G2D+ifXneJcww5q21BHQuDx6rvBM33WAMPUr7zYPrdfrDp
         d0bXT7EIJ10vNmpl/1ggBwJrKggdqxRCRivOjV75/3EqT0cXmiSZM7axjCs4XiEXJaie
         m7oP7oNba9dcF0sdXGZs6CzUoGAsy+RSRLEu6Hu1cBNgkG5uxHyru4C2UeW0yohNlk67
         9I44xg/efcGbu5AvAH67EIocyyir6u81Z2Bfa/lAq7hDJ+FHvQ4Q2zy7RZNXBc5gwl8b
         tV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=B06FeOC/VxpOr7DtLjpCDl47O7wMugTmDtSiZ9we2i0=;
        fh=E38e5N4R12lUcoeSaaxgGzEX5ChpSG3HnGJSjpnl9q0=;
        b=0TtCx4idnEjDqZ10g3C+MbrOGJbawmso/yXYe+9X2gjMq0rrRg1wMSUm+wwh3wgkUO
         Knu3fX38lE0aDWCli4YiDlfqEtdMFgl1pCen8PuG4auXsHAt019sZgcGTMSosyOq2i7U
         OrQOehLwxheJex5FoyymgqAH9XrTFg2ZTF+RrzWRvFe5dy4k2380XwfIRMjUYfllOeBU
         fSvcgrg2/CQ4CEKRFHwDKtimPzBOYnKn6p+sBzpdg0Z10jAbeg38EgTTlbW4zVdEfWZY
         qyRZ1P6mFIzwPkJl2VzCxO05hME8LX8m+dxzGXZdmg6ORn+HZsiG4Y1qQuo/OnmqUBP1
         XAAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIVR1GZu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-72748e85c13sor1795312a12.3.2024.06.28.10.18.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2024 10:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIVR1GZu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719595098; x=1720199898; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B06FeOC/VxpOr7DtLjpCDl47O7wMugTmDtSiZ9we2i0=;
        b=zIVR1GZu1HRudWGg5n2mS9EaTJH9KGIj+CzUBPXAFibTnpFOCrwopjN7UZsMpTk/MC
         3YFOfWxwVxx6XYki0Ux7jWC9kBNvpBH8NGzxZ9pV5JONCVbCp85zdNYUKCd+D5O7ACr2
         udKAANZ8FCg1Qoj9FnqIUin8YMMgADqc7GIEt4o75qDejuY5COory6muKZMNMoevXn0f
         zHVFgagSvZPqMESsTIgyx9fo61VZuReMmPlfpNPbrizSyrgFCxXDMLJOGBRyS/tUysUw
         PHhnK4YzRXl6VF9y1vS01YgBE3XO1NNetG66ism/uByxHfZAhG4zmxxv8O2TBpSrq4g2
         xBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595098; x=1720199898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B06FeOC/VxpOr7DtLjpCDl47O7wMugTmDtSiZ9we2i0=;
        b=VdIaOMWtkmTcwgRja9BnVVE918pMvFLtNLsH3d23O3YlUl+n7go75Np0YLeQkB21PD
         FbGi4Lg71ezGOvVtvuqJWVvVtNhmTbfMb15D9W2kMgwJnpARAobIWYzWLyWbzljrUJj0
         6sUu0Al3nGDiNtLLw1aNzrqXdmpacHIpZjmu35TJASo3O+XWLlvM2RXcGr6alCnaOBKa
         Qb2zVtnOipqLh9qKwCBzDDaeNmDaBMjdoG5UMGoCyQgYJXXCVw/H64Y+uboO2m+Oppt1
         zegJk0OzOPNp+7Arokfr7a4iaE7PPRAvcmEEl+tdJZWfiNHm0B44ILQmNFhUVJmEjoah
         WS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUytSEDLdjq+CpuK3rLRPcF7CVldb/ScznGFII5tKRuecJh8WWQccaxvqEZTOvWgu8NJDYyJOP86a9Xry5pQ2yMtZ7/rX6a
X-Gm-Message-State: AOJu0YxHPQ+9mQuX57wVG7iUT4HKgYgd625bvVvvvBMBPVpsTHHEo+z0
	8EPyzjpByayPrStN3MwfT7pSQB2FenT/iQx6/VJuPGzu+vu5hQxV+vbomUkFV6IUAA==
X-Google-Smtp-Source: AGHT+IHDXd6sAjQB6nmHBa7xZ/g0j0zzb9rxCrNRHrtdWBTY/ynYDmROpdSjKrIc7WbdMBl+icB0XA==
X-Received: by 2002:a17:902:ccca:b0:1f9:f6a7:9330 with SMTP id d9443c01a7336-1fac7e4c1c5mr36783135ad.9.1719595097822;
        Fri, 28 Jun 2024 10:18:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faceb78d02sm10370765ad.136.2024.06.28.10.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:18:17 -0700 (PDT)
Message-ID: <993fe6b3-1823-4aff-8598-11ea69ac6213@linaro.org>
Date: Fri, 28 Jun 2024 10:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] tests/tcg/aarch64: Fix test architecture
 specification
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-2-1690a813348e@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240627-tcg-v2-2-1690a813348e@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lhRt8kbryKGf

On 6/27/24 06:58, Akihiko Odaki wrote:
> sme-smopa-2.c requires sme-i16i64 but the compiler option used not to
> specify it. Instead, the extension was specified with the inline
> assembly, resulting in mixing assembly code targeting sme-i1664 and C
> code that does not target sme-i1664.
> 
> clang version 18.1.6 does not support such mixing so properly specify
> the extension with the compiler option instead.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
>   tests/tcg/aarch64/Makefile.target | 11 +++++++++--
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/tcg/aarch64/sme-smopa-2.c b/tests/tcg/aarch64/sme-smopa-2.c
> index c9f48c3bfca2..2c9707065992 100644
> --- a/tests/tcg/aarch64/sme-smopa-2.c
> +++ b/tests/tcg/aarch64/sme-smopa-2.c
> @@ -14,7 +14,7 @@ int main()
>       long svl;
>   
>       /* Validate that we have a wide enough vector for 4 elements. */
> -    asm(".arch armv8-r+sme-i64\n\trdsvl %0, #1" : "=r"(svl));
> +    asm("rdsvl %0, #1" : "=r"(svl));
>       if (svl < 32) {
>           return 0;
>       }
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 70d728ae9af7..ad99e0e3b198 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -27,7 +27,8 @@ config-cc.mak: Makefile
>   	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
>   	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
>   	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
> -	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
> +	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME); \
> +	    $(call cc-option,-march=armv9-a+sme-i16i64,     CROSS_AS_HAS_ARMV9_SME_I1664)) 3> config-cc.mak
>   -include config-cc.mak
>   
>   ifneq ($(CROSS_CC_HAS_ARMV8_2),)
> @@ -68,7 +69,13 @@ endif
>   
>   # SME Tests
>   ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
> -AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
> +AARCH64_TESTS += sme-outprod1 sme-smopa-1
> +endif
> +
> +# SME I16I64 Tests
> +ifneq ($(CROSS_AS_HAS_ARMV9_SME_I1664),)
> +AARCH64_TESTS += sme-smopa-2
> +sme-smopa-2: CFLAGS += -march=armv9-a+sme-i16i64
>   endif

How interesting.  We were not actually passing -march=armv9-a+sme to the assembler 
previously.  Lack of this is what is causing sme-outprod1 to fail to build, as reported by 
Alex.

That said, if we use compiler directives we must have gcc-14 or newer to test this, 
whereas binutils supported sme (and extensions) much earlier.  Given that this is all 
inline assembly, we do not really need compiler support.

I think we should continue to pass assembler options (-Wa,...) and detect and use clang's 
-no-integrated-as option as well, at least for the SME tests.


r~
