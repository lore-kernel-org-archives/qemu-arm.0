Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp734536njm;
        Tue, 29 Apr 2025 23:13:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSRXxTUXbI7DBaJJLa5TMi5pS7avljGM1iJfLNoSUr4tNeXI7V9Ftc78wDQJ3/gfRy37RnyvC00pVM5A==@linaro.org
X-Received: by 2002:a17:902:f647:b0:220:c178:b2e with SMTP id d9443c01a7336-22df578a2b8mr23270555ad.17.1745993580462;
        Tue, 29 Apr 2025 23:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745993580; cv=none;
        d=google.com; s=arc-20240605;
        b=C6lTlFaGq9QOeZ+KIpEdhTkwHWIpnAjRsiPvsqbuMKCv8hzEL/9PggSthTl7wK1M1Q
         jqeFtLXIMBnZCqkBo3G2Oya+Ut1iXfH8/jFrBuTn4r3tOtoPP76nOQy2qmtEfE7C4N61
         PyMFH9+jL3G2t0owfGzEx4JZQrPfl0zox7q05rGdtITVP0kPx2CCyJTdJxnt5M3ZypOV
         VH5xTMM2oIXqEnWpdD2nLfLfcu4XEjyzjk1bZrG72SktthDw5tluj/ly7UBDdRPu8Ny6
         n0hrOfb7zDj/y2gEP4DmeHW3LgaNrP7hH+yucYqX55OTxoLXsO8BxKSRvWZtdw8tIJxg
         VvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qOz704mUFzAP7PczY6/TxPRr5rC31uzEdcNBaAx4x6U=;
        fh=emP2AqoPzkF4Ug3u3PBVCKFWIqearYbEOtFcRiCMDAU=;
        b=GI74RI2I6hKaPnKTZ/JTFjEW67ji39OPzBTaQADXPpkyawP5JyYSVXHv1uCANwNMBs
         Me9/DYv1jva7XWggKtXAi+1Zpd9y50rU+uII12NeKJY19BdfVR4tYvmwGGb0TjpQM8mj
         k/GOEw99geXiTjn0r69i/zeMokl+DX5FQGZ9PUnoCPAma2RAoA2dl9b/zJ6lSjY8th0E
         ohIKqI/NBXDjM7uoW4RVBOSvWGBImv3kzPCqw6nZROtv5+8ZTNwIGses9VrogtMgUwQi
         LXNzdHL4Z8hzV68srqnJt4u+LGD5twHbmFa/t/GrE95RE7oXyyfkXsGbrMJ7p/y1oXIS
         Y8aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IVxungbd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4de2707sor117638675ad.7.2025.04.29.23.13.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 23:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IVxungbd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745993580; x=1746598380; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOz704mUFzAP7PczY6/TxPRr5rC31uzEdcNBaAx4x6U=;
        b=IVxungbdgU7Azfe+QnXljdip5gszpqiBnYstuxLlUYkiqkKIm9aBvZqesCS/ZRt7b1
         yHiuj4FACPXs36jASO6ESsYH4QhVXUTQ74kOQ1xS2i/hvyPxIH531+xhCSJOqeS8YCLy
         JLxtTeKpRIc0eEY03DRbyESAdydOWvFDVsYF31jgwPJ5zCi/aLjx4JhcG5GpaLxqalTz
         u/VRn2zelt3ek1h1GnWJuz18FfWaRB3dr9ZqygeiCSXvs/Df8k7pK2Z3LiIo2xCwQbQl
         mIBqJ4ngCViKIilTg2BLUwY6AXEUehfXZhF28BZxtdwZTraZssXTZMGps+k2FYpa5poS
         QuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993580; x=1746598380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOz704mUFzAP7PczY6/TxPRr5rC31uzEdcNBaAx4x6U=;
        b=ja4dtZkYPjHJcwQuoGbqUXxDQpngYoHug/jwy73As2sVBbiu937gFB9A3yzApnyNJw
         thX+KskI6ibWLhdMomioLJCeLcr4QdStv78+W7rf8YIKmST1hmotXpmQW591AlrmzDsk
         2/jsthY67IdFH3an6tmX3XOSA3Vcpoh1492zwn9O/BqFCj1dvfOizSXIkD+XGh73eNJI
         6i8NkGmvqFPhbyfX9AKRXZrv0DUbHTxLktrxxCxWDDz9f1u2csk5QMsVhBGl/H9Czu3w
         xMeGwhLjGso4z4MoAUoQ9QvHPQORffRvQg0jZZuCZKLkAQW7U91u7xiygSUexdwiOJum
         u2sA==
X-Forwarded-Encrypted: i=1; AJvYcCXeT61m5bndanenMVrHarhEXUdtqGwtSxoaJyCPQYpY629BKIuNBbD2SyoaKrToSKPs3hN76FrTM0AQxw==@linaro.org
X-Gm-Message-State: AOJu0Yyh7XPqjnl2aFIY5rVcouJjXnossav7o8yXG6ZU5rMW52BjfwCD
	DMLz48pw8l4q1Fxytxd2EKxxEQ4uZRWVHwImtx/iR39eyu/DpjS7C6VowrGB3Va2Jg==
X-Gm-Gg: ASbGnctyUji9KqUJYJkARhAXLfMEQt+YPJ/K1FnnNZKllWXsvRjcYAIcSlonfzIO9T5
	5YzPKQFJPQOxO0LbUc68WzeRioaarGPkFTGKO5HyA4bGh8lqHfP6qzp9eU7naIfbgX/G1Ztxc2A
	7m1hn0xXysYpBRlAMoJL4YIWNGrjX0psKeiPG2oLThlQKAdcoT7M9j6T+8lz05bzk9ubw7Qslch
	m+aQ/EHEepM9nNDEYATNFxwIxUNfcmDanGlLvzj6sH0sDvIglV7P//t/fS5vVRY1rQ7uXl+ZjXs
	akMsd9GM9hL0S5yS1za/UedZ7f7flhpXQFCyYq+GAk5Xj9BW4oFZyg==
X-Google-Smtp-Source: AGHT+IGDqECtzVQiyvob42K+wWVkyDgAiBwFIiXNIl3yGzVgEww+Lj75qqTlHArlcv9m3haBR7C2Bw==
X-Received: by 2002:a17:903:22ca:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-22df5764863mr19101975ad.11.1745993579899;
        Tue, 29 Apr 2025 23:12:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216bb0sm114355105ad.235.2025.04.29.23.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:12:59 -0700 (PDT)
Message-ID: <71d2f4ba-6bbb-42de-b460-bea1ef979b68@linaro.org>
Date: Tue, 29 Apr 2025 23:12:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] meson: add common libs for target and target_system
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, qemu-arm@nongnu.org, anjo@rev.ng,
 richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-4-pierrick.bouvier@linaro.org>
 <fd70e4f4-29b8-4027-a70c-747729172ce5@linaro.org>
 <12579394-7bce-4b9e-ba66-00ce1dff43d1@linaro.org>
 <f5a5e439-ed3a-49af-a3f2-da8a6f44ae83@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f5a5e439-ed3a-49af-a3f2-da8a6f44ae83@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T08bWA0CsyTP

On 4/29/25 11:06 PM, Philippe Mathieu-Daudé wrote:
> On 29/4/25 23:11, Pierrick Bouvier wrote:
>> On 4/29/25 11:01 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Pierrick,
>>>
>>> On 29/4/25 07:00, Pierrick Bouvier wrote:
>>>> Following what we did for hw/, we need target specific common libraries
>>>> for target. We need 2 different libraries:
>>>> - code common to a base architecture
>>>> - system code common to a base architecture
>>>>
>>>> For user code, it can stay compiled per target for now.
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>     meson.build | 78 ++++++++++++++++++++++++++++++++++++++++
>>>> +------------
>>>>     1 file changed, 61 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 68d36ac140f..7b2cf3cd7d1 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -3684,6 +3684,8 @@ target_arch = {}
>>>>     target_system_arch = {}
>>>>     target_user_arch = {}
>>>>     hw_common_arch = {}
>>>> +target_common_arch = {}
>>>> +target_common_system_arch = {}
>>>>     # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>>>>     # that is filled in by qapi/.
>>>> @@ -4087,29 +4089,59 @@ common_all = static_library('common',
>>>>     # construct common libraries per base architecture
>>>>     hw_common_arch_libs = {}
>>>> +target_common_arch_libs = {}
>>>> +target_common_system_arch_libs = {}
>>>>     foreach target : target_dirs
>>>>       config_target = config_target_mak[target]
>>>>       target_base_arch = config_target['TARGET_BASE_ARCH']
>>>> +  target_inc = [include_directories('target' / target_base_arch)]
>>>> +  inc = [common_user_inc + target_inc]
>>>> -  # check if already generated
>>>> -  if target_base_arch in hw_common_arch_libs
>>>> -    continue
>>>> -  endif
>>>> +  # prevent common code to access cpu compile time definition,
>>>> +  # but still allow access to cpu.h
>>>> +  target_c_args = ['-DCPU_DEFS_H']
>>>> +  target_system_c_args = target_c_args + ['-
>>>> DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU']
>>>>       if target_base_arch in hw_common_arch
>>>> -    target_inc = [include_directories('target' / target_base_arch)]
>>>> -    src = hw_common_arch[target_base_arch]
>>>> -    lib = static_library(
>>>> -      'hw_' + target_base_arch,
>>>> -      build_by_default: false,
>>>> -      sources: src.all_sources() + genh,
>>>> -      include_directories: common_user_inc + target_inc,
>>>> -      implicit_include_directories: false,
>>>> -      # prevent common code to access cpu compile time
>>>> -      # definition, but still allow access to cpu.h
>>>> -      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-
>>>> DCONFIG_SOFTMMU'],
>>>> -      dependencies: src.all_dependencies())
>>>> -    hw_common_arch_libs += {target_base_arch: lib}
>>>> +    if target_base_arch not in hw_common_arch_libs
>>>> +      src = hw_common_arch[target_base_arch]
>>>> +      lib = static_library(
>>>> +        'hw_' + target_base_arch,
>>>> +        build_by_default: false,
>>>> +        sources: src.all_sources() + genh,
>>>> +        include_directories: inc,
>>>> +        c_args: target_system_c_args,
>>>> +        dependencies: src.all_dependencies())
>>>> +      hw_common_arch_libs += {target_base_arch: lib}
>>>> +    endif
>>>> +  endif
>>>> +
>>>> +  if target_base_arch in target_common_arch
>>>> +    if target_base_arch not in target_common_arch_libs
>>>> +      src = target_common_arch[target_base_arch]
>>>> +      lib = static_library(
>>>> +        'target_' + target_base_arch,
>>>> +        build_by_default: false,
>>>> +        sources: src.all_sources() + genh,
>>>> +        include_directories: inc,
>>>> +        c_args: target_c_args,
>>>> +        dependencies: src.all_dependencies())
>>>> +      target_common_arch_libs += {target_base_arch: lib}
>>>> +    endif
>>>> +  endif
>>>> +
>>>> +  if target_base_arch in target_common_system_arch
>>>> +    if target_base_arch not in target_common_system_arch_libs
>>>> +      src = target_common_system_arch[target_base_arch]
>>>> +      lib = static_library(
>>>> +        'target_system_' + target_base_arch,
>>>> +        build_by_default: false,
>>>> +        sources: src.all_sources() + genh,
>>>> +        include_directories: inc,
>>>> +        c_args: target_system_c_args,
>>>> +        dependencies: src.all_dependencies())
>>>> +      target_common_system_arch_libs += {target_base_arch: lib}
>>>> +    endif
>>>>       endif
>>>>     endforeach
>>>> @@ -4282,12 +4314,24 @@ foreach target : target_dirs
>>>>       target_common = common_ss.apply(config_target, strict: false)
>>>>       objects = [common_all.extract_objects(target_common.sources())]
>>>>       arch_deps += target_common.dependencies()
>>>> +  if target_base_arch in target_common_arch_libs
>>>> +    src = target_common_arch[target_base_arch].apply(config_target,
>>>> strict: false)
>>>> +    lib = target_common_arch_libs[target_base_arch]
>>>> +    objects += lib.extract_objects(src.sources())
>>>> +    arch_deps += src.dependencies()
>>>> +  endif
>>>>       if target_type == 'system' and target_base_arch in
>>>> hw_common_arch_libs
>>>>         src = hw_common_arch[target_base_arch].apply(config_target,
>>>> strict: false)
>>>>         lib = hw_common_arch_libs[target_base_arch]
>>>>         objects += lib.extract_objects(src.sources())
>>>>         arch_deps += src.dependencies()
>>>>       endif
>>>> +  if target_type == 'system' and target_base_arch in
>>>> target_common_system_arch_libs
>>>> +    src =
>>>> target_common_system_arch[target_base_arch].apply(config_target,
>>>> strict: false)
>>>> +    lib = target_common_system_arch_libs[target_base_arch]
>>>> +    objects += lib.extract_objects(src.sources())
>>>> +    arch_deps += src.dependencies()
>>>> +  endif
>>>>       target_specific = specific_ss.apply(config_target, strict: false)
>>>>       arch_srcs += target_specific.sources()
>>>
>>> Somehow related to this patch, when converting from target_system_arch
> 
> "Somehow related to" ~-> "pre-existing issue exposed by"
> 
>>> to target_common_system_arch, emptying it, I get:
>>>
>>> ../../meson.build:4237:27: ERROR: Key microblaze is not in the
>>> dictionary.
>>>
>>> 4235   if target.endswith('-softmmu')
>>> 4236     target_type='system'
>>> 4237     t = target_system_arch[target_base_arch].apply(config_target,
>>> strict: false)
>>>
>>
>> Patch 12 introduces an empty arm_common_ss and it does not seem to be a
>> problem.
>> Feel free to share your meson.build if there is a problem.
> 
> Empty arm_common_ss[] isn't a problem. What I'm saying is
> when I move all files from target_system_arch[ARCH] to
> target_common_system_arch[ARCH] I get an error because
> target_system_arch[ARCH] isn't expected to be empty.
> I suppose due to:
> 
>     target_system_arch[target_base_arch].apply()
> 
> Yes, I can keep/add an empty source set but it makes meson
> files review more cumbersome (unused source set, but if you
> remove it then the build fails).

Oh, I see.
Then, you just need to add a conditional
"if target_base_arch in target_system_arch" around this spot, and remove 
the dictionary entry set in target/microblaze/meson.build.

- target_arch += {'microblaze': microblaze_ss}

This target was much quicker than arm, it's nice :)
