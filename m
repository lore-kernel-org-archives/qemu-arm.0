Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1559751njc;
        Sun, 23 Mar 2025 12:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSoTnSUdAxge13KMUp65/VXm1cKByHH78osGZx+pd0vTtONVw58FHNjUy2h7HGhRd9s349KQYsqx158Q==@linaro.org
X-Received: by 2002:a05:6a00:a20:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73905a27696mr20250382b3a.24.1742758625163;
        Sun, 23 Mar 2025 12:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758625; cv=none;
        d=google.com; s=arc-20240605;
        b=ShfqAe5qfZ13cPryn5QSU5qqfosfqQAYePe97xHzXq8eH7kx54raTdBRQ0XVJuciLr
         HKUXnT0J5zyAgYn+WMW8f5cCUB7Cv5b5LW8Bv5VXYprydaijBIwfu8ePpMFxyQHjg9oT
         cBw3AtwZSwm4uvX7a5gGOsCOEUV6Bpni9qTgKbF7g3BB5MpoQ8KKa2QyhVLl1MYxgU5u
         Qu3zOyyfqw1ws1skxXaagcqRFKS95xpyDl40LbuElBb1B98VuKdlys2vDZ7tsH0bgV/o
         /CEq4KhB4qDurBIL8/b3giDjpfLTDSpJjqLQyOclcugWVtqe5JbDwdR3r1w0efoq25zh
         wz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aFsN9QNVIUdgmic/nMHOU/vMi+SnWp1uZJldFQD5uko=;
        fh=mwEnjDbRAaGxgbVJH/tLECYJkuol9NVFMkbkloeUp9U=;
        b=TdhihHvaHlgbKK98vnstaUc+GaHATKHD3wrEc9VsB9P+TP/kR9GoNIwbRmK7ogGScG
         CTWOGTKCU+RmCzkITF+eF90s63miVuH4BOf0KfghFvspDsXYG5yYT2S1p2YLFj/YceDF
         zQRNJQ2ktDR1navr6ScKJRmTbpiP9l02SqIc3xZmQMnsgR20GaseWkwtMWqM/3qSkI+f
         N39Ti88icno6UPUFlkCNe1QFIUC0++vL5rW5WTUIt/CVBUVy87G2WgRuGe2ajDYj7MlC
         3YY14k5HWBp9+8VfmAwVtkTX92Y7Sxng44uQJFs85+AC7UJp+k6VLybzYlM2Rh48UAMf
         qTHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfASGh2D;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a80aa4sor2920708a12.8.2025.03.23.12.37.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfASGh2D;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758625; x=1743363425; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFsN9QNVIUdgmic/nMHOU/vMi+SnWp1uZJldFQD5uko=;
        b=QfASGh2DZAvUOKCdwFOxEPQFdiLYCsZgLouixmyu3wMbZCPoVLwy1k260+/90trSLG
         vvXK23eQlhA+qpcMyciFNgEQ8CtoUQ/jT8j3HAZudUUcsIw5YmDDL2HPYODXtqiCoxSH
         ZiEB/wwApV4QzOostzY6l/Xpkl9YLSrDl0R0pxG68mx2X4Q3C9QwUmUtr4ptyqr89FyH
         kWZJK/WQG9QlGXamTlODbi6EaDcdWfbXgkXcQky04A5BRT54v3SjS9R8vLkSIQcuxFeO
         R/z7CnCI40z8H3S1AS8+wt2fbDtDUCzbF/weZxWKyTvhufA/gY/E7LD7IWCJa22ypMFe
         Cmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758625; x=1743363425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFsN9QNVIUdgmic/nMHOU/vMi+SnWp1uZJldFQD5uko=;
        b=D3SMU/hu/q+M1fiPZIJAV++Ev8txVSfu6Jy5z9rEAyejoQzm61yJDofBSMJBR6vjs2
         DXXS6aRNsQl46hguvP2EhrW+Ad9fAzEIlgV7BT62fDPf7cGO6q/VNL1P8hZ7kNsWe3dl
         yqCSLT9nhIN3KZ34ey9yf1sofgO88aC6d5i0vi/JEW/iNvSaVV0MirDWhO9aPg1n5yZF
         IWci+rdmpmMSjiQHtL5H0m/eDhaw/i2xL5Lj2ZG5PDOCZ/u+7kuMcAyLkPvJsr02arL4
         faHdmOT/ZGeeQ95/WUlGfostrbNiqyv4h3AELSJlUWaUU7z7dlsjfb1nK9lXPQHynMjd
         ASoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTqCtLxcQkYnTXldPg6Lwh4QTXudkhkcu1++RySy7qIfxvCTKqJKZ1vHnNoOfabIDJUTox0jcuA3WWdw==@linaro.org
X-Gm-Message-State: AOJu0Yy448fk6LdYtRTx4+P8b1m0CQu+bbVRuYMn8twJOgA/fvtB3saG
	eHdwolliLoOqQoA4/CRw+ltSVgHGjry7xOJZaIhvv76+f0erYUyheipRDrOfil0w7w==
X-Gm-Gg: ASbGncvWpmZVMh0UIdKH2gxfxDrQjfMevq1McemmRBK+wMKLr5Th+qPla7AO1dq4ol1
	7P9Tu6zL8iBkEYNPCj8iYeumYk626FX7bm45UTK3Y3YnabgkgyLUQiwBeVsWN5D0Brmd4rS84lr
	JVsHC2wzFt5D6DHA/a2Qs48jrJZsFagrziMb8HMeYUuNbLeQDY2YnEs58RdaxwyW5UfsgW+Of1O
	P+kyFCaErXBnhO16a/OtUB3RYZXO6bILVl26PHgQ7uRKNaP72+hQU8zlCm4itw9pCSPI6uJr4Y1
	Q0lS34oK/fWoJuc5UMM2Ju47Fh9Nrh+aB718Irs7AoF2hgKtzaY8iliaq4Xz4acBKo0YnxEQ3Hi
	WFlVBDLOM
X-Google-Smtp-Source: AGHT+IEfZzNzGR8ATTRp9XvwUOJ9Ba9h+/FFFjlbnr+Q3InyZSRXbyWWEYoY1KpvywdGICttkrg2Mg==
X-Received: by 2002:a05:6a20:9f90:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-1fe42f311bfmr15412277637.5.1742758624686;
        Sun, 23 Mar 2025 12:37:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28001efsm5587748a12.22.2025.03.23.12.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:37:04 -0700 (PDT)
Message-ID: <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
Date: Sun, 23 Mar 2025 12:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] target/arm/cpu: always define kvm related
 registers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yhIsczGTbYhm

On 3/20/25 15:29, Pierrick Bouvier wrote:
> This does not hurt, even if they are not used.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a8a1a8faf6b..ab7412772bc 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -971,7 +971,6 @@ struct ArchCPU {
>        */
>       uint32_t kvm_target;
>   
> -#ifdef CONFIG_KVM
>       /* KVM init features for this CPU */
>       uint32_t kvm_init_features[7];
>   
> @@ -984,7 +983,6 @@ struct ArchCPU {
>   
>       /* KVM steal time */
>       OnOffAuto kvm_steal_time;
> -#endif /* CONFIG_KVM */
>   
>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;

I'm not sure what this achieves?   CONFIG_KVM is a configure-time selection.


r~
