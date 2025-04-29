Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp442319njm;
        Tue, 29 Apr 2025 11:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVt19c9ubUPfSne2L8PLYsNDiOavTI4wcU4LZ8IW/sCMa4170wCaKlm9DgmletME0bCskByGhkA6XEw9w==@linaro.org
X-Received: by 2002:a05:600c:1f88:b0:440:8fcd:cf16 with SMTP id 5b1f17b1804b1-441b1f3ccd1mr1612445e9.19.1745949721612;
        Tue, 29 Apr 2025 11:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745949721; cv=none;
        d=google.com; s=arc-20240605;
        b=S5a2ZpFSsyL4FglAoSp0Xnjr+VHvm57mBYTRcKHvZN9YY8r4X4sAjjQWy/Nzq2qnrj
         Ean5Xn1VTWWAn2WTJF2Av0wREuEQxE3RcFJ6pU909PlbPGnw0X7Dt8T9/58vBMjDzC7y
         d/oq2nctyAMXAP0THZXWnRJkZKQGJKZANwK6pye5VgmEdAV9Qy/mUa1C7VWjN1Nb6RhI
         r+YFki4yVy8AmGfeGXVSPz1d0GeNpT6Q3Lu/SmlOFE4qBOmQvEo8ZLlTpQzoUldyUHjE
         Rd67yNBKhY/aYCbjH9Q/VqZNDSZbNdO+A7BTyJDDytIv9K05YSO6G2uyAxdfQPT9Loqo
         1cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5tX6znmzbpd+MNtjGZbGG6rcM/3SSGVVvBfmXACpsrY=;
        fh=MyQic0c0onUkjPinYlN4NqbVaDDvsMiYIIp68qZlMcA=;
        b=CGgC5DKK+aWFvUZ0ce8o50HURUvNuYw5KDLPuY7sNxvaj6++9noBFLVarpxGLpnKXP
         TfX1XeGXnzY2xlsKVpQhSC/tbCROXJdlbnkr0GeqziR/eoVd7rKeutAaOfFgNkDo0wvZ
         07fVumbK6VYRKLQ96tL20D/PBRkbfVcdCTSASAyoOXYZBwb8VrHCZypAUHbQWveOrq89
         NK20lQSzwxM7YoGE/iEky6kOpEcWZfRjZuy9zerF0GvQrQ1JQYEjpkc2en89j+VMVlNy
         BAD3r70tufi9IiiILoGTr/w7MSSuemHrChhahxfFS/G1Sm8oZn76RhePdaDDIuOZ6b4o
         Mi0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmsfXUNV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c40592dsor47494865e9.10.2025.04.29.11.02.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 11:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmsfXUNV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745949721; x=1746554521; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tX6znmzbpd+MNtjGZbGG6rcM/3SSGVVvBfmXACpsrY=;
        b=FmsfXUNVL+89ycfY/k7Noj/Oy6KZ5giXpks72wFPdsn+1nXTxyfbpcBCtsLsfRTSzI
         0SwLi8xLLqnylfXWfUVVpTVhOhFmuuz+Jh++Hb82HZlGg4zOYe4kG7uN+D+9X4nKycp4
         FZ8d2aZ9+zqZAvQlDpDRc9VS/6VRWqDQJkQyWW5WzFiJIpk0/RwZnndFxoCNGEIXs2WV
         UjM96G29O8YssGTbjcpp6TxBMuZWMVAg/Kd3GdQ2/UHrh9j4qz81Ukq3KSM+cJ/r5/GZ
         EvkW7U7BYDsjQAIWfeTdp50NLVWRUsIk8lo6aioQY/iBJm/VldDxaIAWndapzR8OV7oM
         6Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949721; x=1746554521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tX6znmzbpd+MNtjGZbGG6rcM/3SSGVVvBfmXACpsrY=;
        b=pAEH+S0D1AGIKZTSz/CMF20fPpzXE5I87fzYAsjtvgofkUfyUK4bxotk2vhpEkEBwy
         Z8ikIkvF2DJk1Sj5bQD/E4+Q69iAySJED3tPjZJ9srq9inBABkwKZUZg2TJSdgNx5wW9
         Knb8q2SKwQZ1weOi9r/iP6J5zA+9VkXV8+L05uJkwIkHyjiGT2bGavokLdYmV1vt01pu
         GRgNRSoKbJdWIKU8zbC54aUtQMvLwQg4v1u1P1pPQBtJPWxmuQOKN6rXJdvYsC2M8Glu
         W+feFkKmE/Mfqk6NRRDSt7lKQYndiVybFYGnKW4SlnTAQY4VrDMziH2tKYG1LxcmkyN2
         Uo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdl+ZaQjIs3WdBgF1D/L0Y7WWgZnEJSL0Y0UcxSlXZkQKFBKATPLFmK9QxeEbmGJYDvVhO1X3I6ON4OA==@linaro.org
X-Gm-Message-State: AOJu0YwdJADm8P4IG1P+xol8LkXYwePx98N7lkOzQuPplMgBT3eLMYva
	eF8nrJS1PPcarg4F+zw0KZBQKKJypy/dGXBqzWWdUaGwh+4+V6rHTh+rKOagrVyjZQ==
X-Gm-Gg: ASbGncvhimc9B/Hv40fsypXMcQB6C0qhZ9qDvadM1Z0TN88PJsI5KepPoWUut+swcwe
	Ct7pZ1DbTnXoeyRo4+X51ygZHD/jeVbF1iprEmmgLBR1BZhbH2NYDBqunlgm9jwGMDbOtr1B0F9
	K6wrBsP5/cqNnCkI6xjTeJBP+epLSJm2msH56TudStvVASeLpzvUUINUTeMsos8vH//P0ZGV61t
	aQQ6uCFpmOphDGtM4pfsVGnXq6BCKDi5J4mMmpeiOwXS4LbSJPzrAsQK+m0DCSuPUlXqMwQS2PK
	W4mKoSYfpFHjB6S3LjQSRoi/g4xJ9LPFHATJFxrEFs05Trs8jZ2cde77RYWuray8APkwfmoqKnq
	t9MvyGRCqIEUiUw==
X-Google-Smtp-Source: AGHT+IGfaI23NYF76B479Bp7eKq+GJV/N5yaJymdVdvVphglf8imvkiZbjfj4oSEsp2KqhUsCvYy4A==
X-Received: by 2002:a05:600c:3844:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-441b1f32cb5mr1737775e9.7.1745949720801;
        Tue, 29 Apr 2025 11:02:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ae456d7dsm15945095e9.1.2025.04.29.11.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 11:02:00 -0700 (PDT)
Message-ID: <fd70e4f4-29b8-4027-a70c-747729172ce5@linaro.org>
Date: Tue, 29 Apr 2025 20:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] meson: add common libs for target and target_system
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-4-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429050010.971128-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5h6r/7Gd/YXM

Hi Pierrick,

On 29/4/25 07:00, Pierrick Bouvier wrote:
> Following what we did for hw/, we need target specific common libraries
> for target. We need 2 different libraries:
> - code common to a base architecture
> - system code common to a base architecture
> 
> For user code, it can stay compiled per target for now.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   meson.build | 78 +++++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 61 insertions(+), 17 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 68d36ac140f..7b2cf3cd7d1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3684,6 +3684,8 @@ target_arch = {}
>   target_system_arch = {}
>   target_user_arch = {}
>   hw_common_arch = {}
> +target_common_arch = {}
> +target_common_system_arch = {}
>   
>   # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>   # that is filled in by qapi/.
> @@ -4087,29 +4089,59 @@ common_all = static_library('common',
>   
>   # construct common libraries per base architecture
>   hw_common_arch_libs = {}
> +target_common_arch_libs = {}
> +target_common_system_arch_libs = {}
>   foreach target : target_dirs
>     config_target = config_target_mak[target]
>     target_base_arch = config_target['TARGET_BASE_ARCH']
> +  target_inc = [include_directories('target' / target_base_arch)]
> +  inc = [common_user_inc + target_inc]
>   
> -  # check if already generated
> -  if target_base_arch in hw_common_arch_libs
> -    continue
> -  endif
> +  # prevent common code to access cpu compile time definition,
> +  # but still allow access to cpu.h
> +  target_c_args = ['-DCPU_DEFS_H']
> +  target_system_c_args = target_c_args + ['-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU']
>   
>     if target_base_arch in hw_common_arch
> -    target_inc = [include_directories('target' / target_base_arch)]
> -    src = hw_common_arch[target_base_arch]
> -    lib = static_library(
> -      'hw_' + target_base_arch,
> -      build_by_default: false,
> -      sources: src.all_sources() + genh,
> -      include_directories: common_user_inc + target_inc,
> -      implicit_include_directories: false,
> -      # prevent common code to access cpu compile time
> -      # definition, but still allow access to cpu.h
> -      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
> -      dependencies: src.all_dependencies())
> -    hw_common_arch_libs += {target_base_arch: lib}
> +    if target_base_arch not in hw_common_arch_libs
> +      src = hw_common_arch[target_base_arch]
> +      lib = static_library(
> +        'hw_' + target_base_arch,
> +        build_by_default: false,
> +        sources: src.all_sources() + genh,
> +        include_directories: inc,
> +        c_args: target_system_c_args,
> +        dependencies: src.all_dependencies())
> +      hw_common_arch_libs += {target_base_arch: lib}
> +    endif
> +  endif
> +
> +  if target_base_arch in target_common_arch
> +    if target_base_arch not in target_common_arch_libs
> +      src = target_common_arch[target_base_arch]
> +      lib = static_library(
> +        'target_' + target_base_arch,
> +        build_by_default: false,
> +        sources: src.all_sources() + genh,
> +        include_directories: inc,
> +        c_args: target_c_args,
> +        dependencies: src.all_dependencies())
> +      target_common_arch_libs += {target_base_arch: lib}
> +    endif
> +  endif
> +
> +  if target_base_arch in target_common_system_arch
> +    if target_base_arch not in target_common_system_arch_libs
> +      src = target_common_system_arch[target_base_arch]
> +      lib = static_library(
> +        'target_system_' + target_base_arch,
> +        build_by_default: false,
> +        sources: src.all_sources() + genh,
> +        include_directories: inc,
> +        c_args: target_system_c_args,
> +        dependencies: src.all_dependencies())
> +      target_common_system_arch_libs += {target_base_arch: lib}
> +    endif
>     endif
>   endforeach
>   
> @@ -4282,12 +4314,24 @@ foreach target : target_dirs
>     target_common = common_ss.apply(config_target, strict: false)
>     objects = [common_all.extract_objects(target_common.sources())]
>     arch_deps += target_common.dependencies()
> +  if target_base_arch in target_common_arch_libs
> +    src = target_common_arch[target_base_arch].apply(config_target, strict: false)
> +    lib = target_common_arch_libs[target_base_arch]
> +    objects += lib.extract_objects(src.sources())
> +    arch_deps += src.dependencies()
> +  endif
>     if target_type == 'system' and target_base_arch in hw_common_arch_libs
>       src = hw_common_arch[target_base_arch].apply(config_target, strict: false)
>       lib = hw_common_arch_libs[target_base_arch]
>       objects += lib.extract_objects(src.sources())
>       arch_deps += src.dependencies()
>     endif
> +  if target_type == 'system' and target_base_arch in target_common_system_arch_libs
> +    src = target_common_system_arch[target_base_arch].apply(config_target, strict: false)
> +    lib = target_common_system_arch_libs[target_base_arch]
> +    objects += lib.extract_objects(src.sources())
> +    arch_deps += src.dependencies()
> +  endif
>   
>     target_specific = specific_ss.apply(config_target, strict: false)
>     arch_srcs += target_specific.sources()

Somehow related to this patch, when converting from target_system_arch
to target_common_system_arch, emptying it, I get:

../../meson.build:4237:27: ERROR: Key microblaze is not in the dictionary.

4235   if target.endswith('-softmmu')
4236     target_type='system'
4237     t = target_system_arch[target_base_arch].apply(config_target, 
strict: false)
