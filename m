Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756534njj;
        Sat, 3 May 2025 22:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULGWwRjVJPigOnwxdrokvVp2Qu3gWbz1ENbqyaK0ySAPCshlnjqOmMUbQEORc/9d2eYu5VwxH+OTVU8Q==@linaro.org
X-Received: by 2002:a17:903:287:b0:216:6901:d588 with SMTP id d9443c01a7336-22e1e8dc780mr47480185ad.15.1746336656830;
        Sat, 03 May 2025 22:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336656; cv=none;
        d=google.com; s=arc-20240605;
        b=VHE+u8ibn8ILpD3je0smopC0xhAK68KHkqccdi7JrxuF+2T5F0eJf72RZzaTIks/U7
         hH7KIWJk5txysp6dq8dL398/LiWd8xYULmwF86NUa5K2nCUCIOTdvuwC3P1jY8ZiPm0W
         0cJKsKayDjj7JA+m/il0kZ9oRO+gDph1XpIVf+i/iqUmgYIVSV49T22Hx2HH/9TcDBcx
         U6vjp0bMpFwyImq2rwMu42ZrK/+Zs0OQJPQUl2YZPeve8Zr+EhOYwbbW321Iuo3IzjdN
         WWLnaL9mWVK31BaXYkrG04Y6+M0pTGCrV8EGzBqHJRxeyQSdHwwWu/OW+EI/VCt5nRk7
         lH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6KTAcWJ13xp5uQrxG2Jl/+OuSInS0YWXgC8gF3pCHPk=;
        fh=G+QY3tFz2booO+VW0mquBLa/LaMQR5L40WiGoUvhlpQ=;
        b=VsKKDnkTxZaO0K4NJb9Y5Wtmy4kHhItXMMWxm7Fxzlx4sn4Ap8ti4JRcyjlK64RPSB
         W8RjmdwX/AJxxYuLCwSCNLUtbmIRiCbrf1hkj9mH90Q0O9t74aybIgA5yhYaq1kztHfU
         UVGjpZDrWIpPPvV78GRBQ3BoTvNaaDlNBMubZAUoSIU9Qj63jbQ3CuMrjF8W/E0iwUT/
         P8mQ4pZ+Z1q6yFWhHLqRQy/zHLaiagk8iLJuTkZ6hXaO4j6qVnO/4OiO5Tgkah0SKWav
         aC8qFpkIIlBL9CFsz2faN57rMiMLzHUv2bwBrMosN4INaCp4zy3g7YmXeBPV6eyy+iRJ
         0csQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhYrQlg7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba7f093sor38222025ad.0.2025.05.03.22.30.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhYrQlg7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336656; x=1746941456; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KTAcWJ13xp5uQrxG2Jl/+OuSInS0YWXgC8gF3pCHPk=;
        b=YhYrQlg7MGCIhVRvXMsyXZfFG6SJSQCmT6rZpgeamVNiZwthQbw0a/2XeWEdeebnoP
         gdkJUgvvYJw9q8Mavn43HNa+4cPYf9FgkYrozRYVfvPVR8I/t6c6nTqjHBmAfwXNwSJ5
         udF5vyM5lozQRCB2vNalYPAGBuv25ECG3owVGI66IkWOQf3U0QDSaaExU66SekxdSczS
         PJOkqxIrC6oKtzC/Ir15RYWzPi5eTZng+8JNcIdSB2HgYVM8K90f1Bs6KI7eDn4x7sPr
         IlRTj6GInwPRx71kROI/QfE6+EUgOnCa5+eEvE0lD6ZnB8WhNDxO0WdHGCgodZ1GQGXh
         ObPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336656; x=1746941456;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KTAcWJ13xp5uQrxG2Jl/+OuSInS0YWXgC8gF3pCHPk=;
        b=mjvKm5EWSZFw7eYbAmnEdwdjQPT5d1xqOHJiLl2mNTOBw5+Inxo0L/AgPy3lJG/eaj
         xKZ6mSwl6Ev2hXm2o7B6GiFL97Ib7W8892Ij0OCIO0hEkF79jRVLTj+hLgfzHqHq5GCN
         v29x5MpgaLLrlVGwPfxbYDoHIO9S5oAyVOkx29WrNMLSoJGXINSFE9Px81UU2OMt1H+b
         U2YGin0vBmjoYsF9S/mszVKQHksQCOMDVmSaAH8elqZrqwrmFqS3axCqGVkXv/Wzr3xP
         VSXBi0erVnU0eu4GstpZhfqzG4rEDtrIW5SV43jWBIbWF9o2xohFPtnWsEab7kRVSxwF
         7S6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRaDh4hpSvXiOWPoOwDRtGOEHhDZC+9D6g0Lvi/WLvzJ6omYZpANGseFMGHmPTeKhfriEUxwjDRr6k6g==@linaro.org
X-Gm-Message-State: AOJu0YzGguFDrBtUSBNYiER2NLwCJG9ytH0xciBaSaQdy28BpaMWqd2c
	2a/AxMpE//otDn6YEStFJtzfyJ7nMjrTH9n46Mk+sXTN8VcpH7pS75E+402mQuUyIw==
X-Gm-Gg: ASbGncuFS7nybvT3OS8z1XiK4xRPdgq7Kh0iv9U/bpJrxfqS7RLJKqHh+jLOMa/R4+3
	UIN3tuY1vADuWhXdIDhuK4YzhhK+/G0g68aDo22h5v2vvd34xOJ/0Kzy/Dftacz3iEvIhqsOl1F
	im0X7+waEj4Q80QTXQ8Y59DVbxfQJTr3IY/YwPcUjbwxYQ1Dax8NVMhxVmUXD2/M2MHb9YuhIiD
	nNQP4atOPTns88GWs0sTRF0ggAwNLxySIJN9BqFTYC1qklzhhLEqkr0vanAeVrpcKTu1e70wN5e
	95KOV/8Bd5mXMUmipQv9pTiq66LXUm5mhLSGKXOR7E6dFrin41jB2PrGdxSu/o6+
X-Google-Smtp-Source: AGHT+IFG3Fh3OmK4nyyMWaj/8CJF8m2OKT56xa6Rlm7TVxCw3VLXdVuw4KrYDmvPYL2Yqr7Q05OW6Q==
X-Received: by 2002:a17:90b:3505:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-30a61a49176mr4616861a91.30.1746336656291;
        Sat, 03 May 2025 22:30:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152291e3sm32237285ad.202.2025.05.03.22.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 22:30:55 -0700 (PDT)
Message-ID: <e060e797-306f-4541-907b-7fdd8ae7781d@linaro.org>
Date: Sat, 3 May 2025 22:30:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/40] meson: apply target config for picking files
 from libsystem and libuser
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-5-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20250504052914.3525365-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: x6Vm2e+JwntF

On 5/3/25 10:28 PM, Pierrick Bouvier wrote:
> semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
> However, this is a target configuration, so we need to apply it to the
> libsystem libuser source sets.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   meson.build | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 6f4129826af..59c520de359 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -4056,27 +4056,19 @@ common_ss.add(qom, qemuutil)
>   common_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: [system_ss])
>   common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>   
> -libuser_ss = libuser_ss.apply({})
>   libuser = static_library('user',
> -                         libuser_ss.sources() + genh,
> +                         libuser_ss.all_sources() + genh,
>                            c_args: ['-DCONFIG_USER_ONLY',
>                                     '-DCOMPILING_SYSTEM_VS_USER'],
> -                         dependencies: libuser_ss.dependencies(),
> +                         dependencies: libuser_ss.all_dependencies(),
>                            build_by_default: false)
> -libuser = declare_dependency(objects: libuser.extract_all_objects(recursive: false),
> -                             dependencies: libuser_ss.dependencies())
> -common_ss.add(when: 'CONFIG_USER_ONLY', if_true: libuser)
>   
> -libsystem_ss = libsystem_ss.apply({})
>   libsystem = static_library('system',
> -                           libsystem_ss.sources() + genh,
> +                           libsystem_ss.all_sources() + genh,
>                              c_args: ['-DCONFIG_SOFTMMU',
>                                       '-DCOMPILING_SYSTEM_VS_USER'],
> -                           dependencies: libsystem_ss.dependencies(),
> +                           dependencies: libsystem_ss.all_dependencies(),
>                              build_by_default: false)
> -libsystem = declare_dependency(objects: libsystem.extract_all_objects(recursive: false),
> -                               dependencies: libsystem_ss.dependencies())
> -common_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: libsystem)
>   
>   # Note that this library is never used directly (only through extract_objects)
>   # and is not built by default; therefore, source files not used by the build
> @@ -4315,6 +4307,16 @@ foreach target : target_dirs
>     target_common = common_ss.apply(config_target, strict: false)
>     objects = [common_all.extract_objects(target_common.sources())]
>     arch_deps += target_common.dependencies()
> +  if target_type == 'system'
> +    src = libsystem_ss.apply(config_target, strict: false)
> +    objects += libsystem.extract_objects(src.sources())
> +    arch_deps += src.dependencies()
> +  endif
> +  if target_type == 'user'
> +    src = libuser_ss.apply(config_target, strict: false)
> +    objects += libuser.extract_objects(src.sources())
> +    arch_deps += src.dependencies()
> +  endif
>     if target_base_arch in target_common_arch_libs
>       src = target_common_arch[target_base_arch].apply(config_target, strict: false)
>       lib = target_common_arch_libs[target_base_arch]

@Philippe: this is the patch you need for semihosting (+ previous one).
