Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1981545njj;
        Sun, 4 May 2025 09:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUZXigJHTXgFOr36SReQ8HTw1A5GZR/pFwc3iqSHbEaklK7ZfH7XybyJG4lwUa0Rcn+l8BJWAflYiOOw==@linaro.org
X-Received: by 2002:a17:903:1450:b0:22e:9f5:6f17 with SMTP id d9443c01a7336-22e1ea3f617mr58242675ad.13.1746374455715;
        Sun, 04 May 2025 09:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746374455; cv=none;
        d=google.com; s=arc-20240605;
        b=RBacc6Q4Rf9fUinh1Qeg95ECGMgdjYu1DlbD8n3524yh0q3Gd0veo8K/37SATJKJrO
         DtSsx3BV0x/gYOrQ0krmR7my+xfh9NltLqtXcepyZe0BCTd464w1DSpcsmHAcOX3bJl1
         R1yIWHyAv49aDb0sbnui0eyrI6u/c5gyaGoCK2Edq4g2daAYxiyT1/3YXMviW3nih1nz
         bTjdgW14zspDU9FD6ugub6B+0EL9vEMweijGSW3XOzFm9vEXxMNLXez68MtrOp1F3RqK
         ApID+XGL31n7shQ+68CysrvzTNE6pvoQ2zxnbaNssI6TKdOfZwnNmnPBhQD+IUvZ9Ya7
         wrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YzVQpNPT+TL8s16+jQLivHLgw76ZAyXebgPC9LfcVXs=;
        fh=yfamt6t0NyWmBU0M37LPYe+/C8xe4KgnospnhW9Mdp0=;
        b=PVTCc0xTncZpJXOe7wlaBYwVyxZQSqDfi8oMXns36XDN+v3rgxaQL3O8bU4FmkTlgO
         IwuWVXNJXAcLm3/Yt7TyBfzOqviJmaUl+RJ0Gcc4qFtpCDwCaF2y49F8yIoNk1lItzTv
         1aXvvqyDSkO3iGOfSzJQDxVixqfDCasir6se4u91Mdf8iLMt3BKgmE9z/1oUJCNDEK3T
         2VyoyUc+4pEiZub6NuUDQSSR2rSk1FiM7W4GFbnZtVpvf/OR1MO72e85IbwqK28wBOTr
         Ifu62p2qHui80kSpE7xxdNUsn8BgSvlhU82t5ATt6sqCx+tdA7xbO++YJLj5Cz12Z7or
         EWUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hYCdyf/a";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7f740sor43995285ad.16.2025.05.04.09.00.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hYCdyf/a";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746374455; x=1746979255; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzVQpNPT+TL8s16+jQLivHLgw76ZAyXebgPC9LfcVXs=;
        b=hYCdyf/ajtLsd/bC30VOhea7Wq47aaRajWFT0EEuFZ4NYuotgcEVvCz/sVm0t9GoHQ
         WI4D7ThQ2MkEUcI9Oq2bvK2eRPSj8FgCcb+AWqmur0+DGgnFfWc5/obZv/y64QaE+OLt
         SMA+JgMqTfsvit+pYZqPwSOIxAb7vXLU5aayZPd4pXW9GLQCI/tHTr881SB4qUAxd256
         Ivt7TbJrwtOl7U7SpF5AI6+HMoJB0HOgJNWnx+jSYENv/WuD9taLY2tPiUxVjCiBQh5T
         K6tR5NUNdIlz1sFiSWhHCV/yBzhKevviE+puvaOTjVbp6aVFxrSVRcxVHcRcIRbVJn7G
         YtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374455; x=1746979255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzVQpNPT+TL8s16+jQLivHLgw76ZAyXebgPC9LfcVXs=;
        b=wIALaCH6VD54BeCtvzR+JUI/cPWx9ZdWAbJErBgdCBqtAiHCYG8k1hEtCki3X9pIm7
         FVc4wnx9/gTuNGx2nl0JtJ6reJfPnCfWD7Cn3pG68zv8sP7S4dq6nAEumbWwmVFI+KRL
         pqC5+CdIifr0bp5g6G4RoKUMApd36EbMaLQDsVuOAu2dLZW4ZSPFqyaYCo0wnrWe68So
         RwXUPkR3xy0UkQs3qAqpJVdwnkDz82VXuXm4ElpPhMkVUthw76i6aod3/61L03Yt10OT
         ZLa3BUYsDokYQ4b+Z78K54/9TAF3xdYtqDTKS9gf8HEhlyvcmRDfDI/c04Y+Nd3rgmti
         Aujw==
X-Forwarded-Encrypted: i=1; AJvYcCW2m+qertsPuZEcTGKqj/b7C5WOg5O/aWogE29DWSkKT3N42oZptoQMgwJNH36K0+/rcENi0/S031Hv7w==@linaro.org
X-Gm-Message-State: AOJu0YzbmlZEP+Ab7xPEXbVGgUFDr5AXPVIc842z/h5B2OjdKxtpAHxW
	nU6bUptcLcvXoVFEZM2Fd4xTsfoffHKC96A44tu+lexIVkMBkF3gT+xFNQu+HsE95g==
X-Gm-Gg: ASbGncsxHrA2XXwcZNjnxXtJpJ4v5W44rZXT242m8L9uhgLeKsWdSu9wv4Gm9lzXu6M
	DAFZCQnjC1gPSxRzEBhMT39lQPFXPIxtTF43+CQNTmtLVfucPegeYWlHQrVEozaFaJV/NnSa3Ho
	00QTlFQ/sZaxUoCP/y0jkmBjPWpX0DhOi3/AO0cJ61ablwpxu56koiPFYlXmUpi1bwSbY+BU5EW
	kdt85E50Rg1JnkqwOG788K8VLgg/CyF85Mre6T7zOtA24mD+ELqweQMlbFjqAJpnGwTKx93+gh2
	+oNRTKu8jZOLo1cVnZ2FKfEP6UGVsX1+YJecjvw+UMhv+Q+4qPtc2NHoYguLaXm01+FcO6Hp303
	DwWWMuYw=
X-Google-Smtp-Source: AGHT+IE66o3FzhnOoYhmgbYjj7kCGXhJa8dnqD/72XM0gm+75hkSaixle1rVIRPVkTst3i+gp8NmmQ==
X-Received: by 2002:a17:902:d4cd:b0:22d:e458:96a5 with SMTP id d9443c01a7336-22e1eae8762mr70246125ad.38.1746374455257;
        Sun, 04 May 2025 09:00:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a332sm5199607b3a.16.2025.05.04.09.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:00:54 -0700 (PDT)
Message-ID: <6ca071ae-4608-4777-a2b1-719d869e1330@linaro.org>
Date: Sun, 4 May 2025 09:00:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/40] target/arm/cpu: compile file twice (user,
 system) only
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-13-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9/p9R2m8GWtr

On 5/3/25 22:28, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index c39ddc4427b..89e305eb56a 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -1,6 +1,6 @@
>   arm_ss = ss.source_set()
> +arm_common_ss = ss.source_set()
>   arm_ss.add(files(
> -  'cpu.c',
>     'debug_helper.c',
>     'gdbstub.c',
>     'helper.c',
> @@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
>   )
>   
>   arm_system_ss = ss.source_set()
> +arm_common_system_ss = ss.source_set()
>   arm_system_ss.add(files(
>     'arch_dump.c',
>     'arm-powerctl.c',
> @@ -30,6 +31,9 @@ arm_system_ss.add(files(
>   ))
>   
>   arm_user_ss = ss.source_set()
> +arm_user_ss.add(files('cpu.c'))
> +
> +arm_common_system_ss.add(files('cpu.c'), capstone)
>   
>   subdir('hvf')
>   
> @@ -42,3 +46,5 @@ endif
>   target_arch += {'arm': arm_ss}
>   target_system_arch += {'arm': arm_system_ss}
>   target_user_arch += {'arm': arm_user_ss}
> +target_common_arch += {'arm': arm_common_ss}
> +target_common_system_arch += {'arm': arm_common_system_ss}
