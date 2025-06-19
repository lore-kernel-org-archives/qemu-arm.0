Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp512490njc;
        Thu, 19 Jun 2025 14:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrUg9qt4p8CNPCBQMXeN4zoEkWF/YyMB5vnaS5Q+ONLAH62lcgZQG9vRCi/to5fS6Wmbam0mwfaAtY+A==@linaro.org
X-Received: by 2002:a05:6a20:7484:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-22026e133a1mr548423637.1.1750367899563;
        Thu, 19 Jun 2025 14:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750367899; cv=none;
        d=google.com; s=arc-20240605;
        b=eEZZNnsFbqPqNOBBDW/0+7J/jHojlO71D3dvL4hLFtHBx0t0Dg9p+G+Knv4m1WjwFL
         FSnbQI5dScyN64NDEJWBdnUs123wAkQBp/aCcdIF6dBY5tmItfQyWiE/t5Q2Y2FFLy9A
         fkkdqzGxwt5RWdAvTmZW9uIhVLuLzbzI4b3AJnVgPRg//0JEFfVBqZuMpoKW30q1hczr
         eyESYr9Gt1fmG+Z4h+QcfnDazn0JEXsBc3blcJ9HmgYfczg3TkN19i/bi7v11CxInPAY
         XVTbrTNko6BCCY4vf4gr9Sja0cbpOLdX8aMx1ifTZAyh1M4kzRFOqxs2YbdghoesQ5yH
         gzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2Z1S7N42ERdXx54xmaOI9EsxTTnLKwaeZEDwV0ye2fM=;
        fh=UEcB+RPz3s6DAnRNIpxJJV9LNNEpiBaAiO6fFeUUR14=;
        b=NPwF3PRnH576nI3nsKPp7scVOVMzei4/fmW4dmenZgKqqsthrFGqo03re0ldUJBddg
         1k0kXkZei4QfKRWfhzn/F50vg3KarFvbEEvSo09AFYHSVS0hLWXqWPZZcbKC04zibA2J
         RbNekXG3onWXNLC2x4O2upAh/2STYAqikzK1+6bts5c13/OSwKlUor1T+76vKYliJr35
         O+t6qpxqd3AnfWDLAJpV8gdpuR0wRo3V8WIoCyVBn2ThPnZJ3wIWSNsoRsINVIhexpKo
         CXmJ/Ky1SUcQTc6kwcSuqN61AR4zaZx1jwZLUJ39EJ5Vunw4Qdb53KFQoJPGRL5n60sX
         3cag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tx5vGpEi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490c8cb5d3sor229845b3a.2.2025.06.19.14.18.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 14:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tx5vGpEi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750367899; x=1750972699; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Z1S7N42ERdXx54xmaOI9EsxTTnLKwaeZEDwV0ye2fM=;
        b=tx5vGpEin5N3CY/31v6rA57QM2vq5BodAXrZij8eTOT8bbZgZw0JNCGONil4vKX1Ms
         LzCerlVABICN5Md0TdzUfXyv8BGdXxOuHVP+wtAvzWIz8uM5PGQpaABi4gjMEC4MLDzE
         CTNrA6NU4pZ6LSp3O2TPP8xw/eFHSwWFNSs/UwS38ZrK+QEKxMZG1PH6YSx+V1+/pl0Z
         CDpNOJ0CzOf8mAp6rGr2I+F/JtOhiGdK0k/1Tv9KX4elMicKBauO+VPZCAsaEZDek0WE
         DaBMmEnL6dzvUcb3o1yCmYRQbAEA6hcfHR/pZP+NnrGSfWfUYa4dxX4PyZnSzd5qS9xS
         ybWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750367899; x=1750972699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Z1S7N42ERdXx54xmaOI9EsxTTnLKwaeZEDwV0ye2fM=;
        b=mQ9DmkjOmvP1RD1OEN2dvba+wHOkbZluq23UZHHs9s8sR5JH173DeeKmyKiET7/N0N
         gZ0nUgAFtcl5H62kL2UE3ngO5RXBB5fnEDTTjGi+f75PIET6rX6+DgTUwyJgv3bVF9yf
         XngsuckXHSN8GjvDL/3yRpzF3H7fzrGqcESkq7PJ6YSRjNFjY7BdZ54XTOZVKwX2095T
         5tBxdZQogFW7KgHw6yAP8A+SJGJGcG+Iyqx+dokPij7S76lEgrUsyYqkhT7jEyOcWaMF
         sVfN6DLgl+WoTtjMPObvyQkbYkl/iF6bDeptVwF37Nz9OU35tQHiU20CYtX1mBI+QbW3
         HhqA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfs3FkFeqH1JEEU36u6rTbvnSHBBtjoYnVo1YsjvZnL+3bqUeFfX/7lEvcrO3c3vSJhloLs7jQVWHPw==@linaro.org
X-Gm-Message-State: AOJu0Yz4dtKIZBhXDRAbYsbVEou4hBTFce4qDJn9sxQL3E+jCrmXMI55
	isTpS4xWvRAf/rAod3Op4ynZml8cCADKoKhTIWvOylKYflwc/71gvFNAOXZBcMdohmlstQ==
X-Gm-Gg: ASbGncuPkwxrXbIZb6p0C5+92rQ7D+dBN8Rqzr0SRIzpy2wtxUbPLNLPiajQL5bLSPB
	89Qwbv+Q4WMzfEtJcaALwnY1825jrQ00goO2cpEEIqrW3z9zMdrvw1mIVB6pVyf3MkXmocWfTxw
	FcpcjVGDIll9Rg6jubW+uDBYZ/5BtBk0+3RJiRt5sYNYIrDKwcD6EQROj8a+odhrz7etvMeZJcR
	/ALmpQCtOqj92WM4bYZImvnoYOdWW+jU2nosWJu0/j7+6177okLaEAPLTVx74Q5s8pNGqICHD1H
	3UvFEPjnljiGlLlL5EbAWNB+bmj2LRgbeu/EyXKHU4/IMwatXBcxBS3leoBceY+4tPWhcIF1vCG
	rG4js7egzyAaOc6O/7k7lKh7ji1sl
X-Google-Smtp-Source: AGHT+IF/i78SKeZMt1mg6x2bfGDSE133dHtUd8yP3kI5ZU9HD3E878XuWDesY7ODfNDIQ6YO/kA/4A==
X-Received: by 2002:a05:6a00:3d53:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-7490d786d8cmr351870b3a.16.1750367899123;
        Thu, 19 Jun 2025 14:18:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46bc2bsm541945b3a.28.2025.06.19.14.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 14:18:18 -0700 (PDT)
Message-ID: <2b1fdb64-1865-41e1-8638-17f60a47cdf4@linaro.org>
Date: Thu, 19 Jun 2025 14:18:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] target/arm/hvf: Correct dtb_compatible value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Julian Armistead <julian.armistead@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
References: <20250619131319.47301-1-philmd@linaro.org>
 <20250619131319.47301-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250619131319.47301-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iIPjXrv0Mguu

On 6/19/25 06:13, Philippe Mathieu-Daudé wrote:
> Linux kernel knows how to parse "arm,armv8", not "arm,arm-v8".
> 
> Fixes: 585df85efea ("hvf: arm: Implement -cpu host")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index ccdadce4766..1fbfdaed59f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -879,7 +879,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       hv_vcpu_exit_t *exit;
>       int i;
>   
> -    ahcf->dtb_compatible = "arm,arm-v8";
> +    ahcf->dtb_compatible = "arm,armv8";
>       ahcf->features = (1ULL << ARM_FEATURE_V8) |
>                        (1ULL << ARM_FEATURE_NEON) |
>                        (1ULL << ARM_FEATURE_AARCH64) |

If so, it's equally wrong in kvm.


r~
