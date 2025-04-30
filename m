Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp732065njm;
        Tue, 29 Apr 2025 23:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoPwB+ZGetNCrSQcORTM9vTcjBGXZT8fgRk/W5FCaq/77YsUS9DhM55GtHt73JMIRid2kj5JySTh+uzw==@linaro.org
X-Received: by 2002:a05:600c:3ba5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-441b26354f3mr6733895e9.1.1745993189564;
        Tue, 29 Apr 2025 23:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745993189; cv=none;
        d=google.com; s=arc-20240605;
        b=WMdbTHhTczEWTDZeha2rsk98+pGIEBySUgZVWyMVKtD8ab9i5j7HS7ExJ4ZHu8yTvV
         jgfBJeGlLoKB+mix20mHcglLgIumOchKuvpEhnF9fan4YU8pLcfElCNr3DAZGGWduvty
         EuAK3zClrD+AsJdMZWpy1HIW7lzlD+rNPEsVF12u1eax/PN7IrTieGgXiK2ajx6iKMEH
         Jx4EHP7z4rop5ejMG1y+ZhDvNozQEEBKu40zTuLLImXW6rfFTubph1mSsblbLkejWMjd
         AkxvkHFt4Y18piYjLmsEHvJu08cRM16QDrrMYD2GvZK3PUjq7+aZLU05cgIBbpFdInAq
         GBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VaK0UyE1mFBNKIjhFBbQsGXEj6TCL5MtPpa0p8PsSEs=;
        fh=0ffIOApnlsUyQv8NbPoeETp4Y7c83vOIIrJ2rX1IdK0=;
        b=JEIHCzjxTQLuvMj26NaoZ47klukM2Re8iNr0Pv8ATmdZpkGFGCr5E2CPa81Kf53o+5
         InhPQf6LvwrT4Yp1gWkOucsr0by6rVMS1Ph6c1uUqU0M7H/RTdYcoXp6VNfm0SBJRMFF
         j1xd+ml9MtH0dabqixZRe682TnA2A+G0aG/mdb5RgxmZFu75PwF1oBU/MS/NERdyiudc
         I88wChl13d7Eq5CoGf0b0JPBdGEPxMU2TYHYcyq6QAPsxTuj+VH8zGzFBNXTzO78LUBo
         kh9hbIjfVF/CuBRz/xM1JGiqbC2lav5AsGNM/SBG3fWzyXYMWVKENcUgKlhkiTRzq+uJ
         mv7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOqa5l5T;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a06d503ea0sor3633605f8f.4.2025.04.29.23.06.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 23:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOqa5l5T;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745993189; x=1746597989; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VaK0UyE1mFBNKIjhFBbQsGXEj6TCL5MtPpa0p8PsSEs=;
        b=BOqa5l5Tqhg+dszWl/kF9Fphc4WhLiRIn/Fh2vg67OxNA11tU/2/3+zzUPVzYp9JJU
         N98WqoSOXVNatACXMS0HuFLH4y9fo5E80lzIdsJMHUu6Zp6QbCJgAKV9c9U1v7OStsLL
         PdFJHdz9xL+L9NOjsCvH73sbglvCMfwJ8cX0oqjyrb4zzYS+E2TwoIJDksPgPF1WFyvV
         nKi3iVVGkdMcn8y1CJsY5NGpUmPoL1JZfSzPa0t7fIA8RpgPEZZTw4YvqI7etNJNwmIe
         3jIh26yZfsbiCRYt6teW0c9GYkU486yn4F7OwJYbnkDv7/MHDp0++oTjDeFsPKzswxC4
         6leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993189; x=1746597989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaK0UyE1mFBNKIjhFBbQsGXEj6TCL5MtPpa0p8PsSEs=;
        b=rD98/FPaSuKDXv04aOeGilggp67KZgQAh27XWfYeQWlNmxS9qecyRQdCYfe1wlbhtl
         hPX6qYvvhrnJ2h/C9ZH3F9aqc+yq8PjAvkb5uqZY/6jfqk9wrx5riyGwNpyn8a+PcLpl
         j7kIskFlVWBqy3SzJFX5bhUbmsDkV8BhGKUl5rSieDNTHeXq878vTsc5jypZxzhXcwYe
         dlftQnmUxYcPlCzLZwhueABGVXTtf7Ss+4vsxiH/9M9zNpwDA/kO4DMXKv1vm0Lj6BG0
         HmhrdCpEP42z2r/09BQx2nqJsyHf/Pns8lmxgYtZ5A/8jKh7oz3YUEV7v1hTIG3ImLrG
         voHA==
X-Forwarded-Encrypted: i=1; AJvYcCXzan9GXHCWebfNc6aYvjbvjYop6XYWc1iHaQhYT+MAz1jnvIPKbEsO37EqvJkz5r9X+GZ6iUPnLI0BJQ==@linaro.org
X-Gm-Message-State: AOJu0YzBtjLHRj079HLI7StCc7eoPmuPDA8pwdYPMAEDAcmCC83GHgvB
	GhnN41KEY49htgx1lu+6OBVytxXD1n8hn9v6XhLh4gc5WhcRtvqcOZaJjpTC/EArxw==
X-Gm-Gg: ASbGncuLddm/EGlLKcsgndYnNcENZH7x0Ri2BKIiTzercp/GS6ZTYC0NgONZQ+7hX+7
	d8IeCjUmltJJnThAH7AQ8/eaRPeIDz1VwTq1SYyqsvJLz+wupzl+qEMQTE1FviVeFtnGbXApxFM
	Ff6jheWyylTHUx9D5NNNA8rKPGyaAtcj8fD69KzrkXIHS4GlB0kXj+Tpi0GRR4K27p76x2VyykQ
	Fx8jQfnCduVDTgfOzHAmQO7KUTL7hHLrycj6EQN1dmvks4s89VEiEunrNTBZMDzVJdqyYxxoCTP
	qbzc+3v+L5uAJj69QS7aMSYxwuOzEc8/+Rl29blLGbU6mOKpD5r5dLhKT6mDrIqfYNwfruCklRX
	CbLkMeNYT
X-Google-Smtp-Source: AGHT+IFqY2wyvF3cR961CoTKkr0CDZXR/0s85Nwqd83veNOjb0gavDaD/XgV16EoOIwhK0OowJ6D0g==
X-Received: by 2002:a5d:64c7:0:b0:39c:1257:c96e with SMTP id ffacd0b85a97d-3a08ff55599mr664270f8f.58.1745993188968;
        Tue, 29 Apr 2025 23:06:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461bfsm16159104f8f.79.2025.04.29.23.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:06:28 -0700 (PDT)
Message-ID: <f5a5e439-ed3a-49af-a3f2-da8a6f44ae83@linaro.org>
Date: Wed, 30 Apr 2025 08:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] meson: add common libs for target and target_system
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, qemu-arm@nongnu.org, anjo@rev.ng,
 richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-4-pierrick.bouvier@linaro.org>
 <fd70e4f4-29b8-4027-a70c-747729172ce5@linaro.org>
 <12579394-7bce-4b9e-ba66-00ce1dff43d1@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <12579394-7bce-4b9e-ba66-00ce1dff43d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r8aEfaWDFIZJ

On 29/4/25 23:11, Pierrick Bouvier wrote:
> On 4/29/25 11:01 AM, Philippe Mathieu-Daudé wrote:
>> Hi Pierrick,
>>
>> On 29/4/25 07:00, Pierrick Bouvier wrote:
>>> Following what we did for hw/, we need target specific common libraries
>>> for target. We need 2 different libraries:
>>> - code common to a base architecture
>>> - system code common to a base architecture
>>>
>>> For user code, it can stay compiled per target for now.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    meson.build | 78 ++++++++++++++++++++++++++++++++++++++++ 
>>> +------------
>>>    1 file changed, 61 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 68d36ac140f..7b2cf3cd7d1 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -3684,6 +3684,8 @@ target_arch = {}
>>>    target_system_arch = {}
>>>    target_user_arch = {}
>>>    hw_common_arch = {}
>>> +target_common_arch = {}
>>> +target_common_system_arch = {}
>>>    # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>>>    # that is filled in by qapi/.
>>> @@ -4087,29 +4089,59 @@ common_all = static_library('common',
>>>    # construct common libraries per base architecture
>>>    hw_common_arch_libs = {}
>>> +target_common_arch_libs = {}
>>> +target_common_system_arch_libs = {}
>>>    foreach target : target_dirs
>>>      config_target = config_target_mak[target]
>>>      target_base_arch = config_target['TARGET_BASE_ARCH']
>>> +  target_inc = [include_directories('target' / target_base_arch)]
>>> +  inc = [common_user_inc + target_inc]
>>> -  # check if already generated
>>> -  if target_base_arch in hw_common_arch_libs
>>> -    continue
>>> -  endif
>>> +  # prevent common code to access cpu compile time definition,
>>> +  # but still allow access to cpu.h
>>> +  target_c_args = ['-DCPU_DEFS_H']
>>> +  target_system_c_args = target_c_args + ['- 
>>> DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU']
>>>      if target_base_arch in hw_common_arch
>>> -    target_inc = [include_directories('target' / target_base_arch)]
>>> -    src = hw_common_arch[target_base_arch]
>>> -    lib = static_library(
>>> -      'hw_' + target_base_arch,
>>> -      build_by_default: false,
>>> -      sources: src.all_sources() + genh,
>>> -      include_directories: common_user_inc + target_inc,
>>> -      implicit_include_directories: false,
>>> -      # prevent common code to access cpu compile time
>>> -      # definition, but still allow access to cpu.h
>>> -      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '- 
>>> DCONFIG_SOFTMMU'],
>>> -      dependencies: src.all_dependencies())
>>> -    hw_common_arch_libs += {target_base_arch: lib}
>>> +    if target_base_arch not in hw_common_arch_libs
>>> +      src = hw_common_arch[target_base_arch]
>>> +      lib = static_library(
>>> +        'hw_' + target_base_arch,
>>> +        build_by_default: false,
>>> +        sources: src.all_sources() + genh,
>>> +        include_directories: inc,
>>> +        c_args: target_system_c_args,
>>> +        dependencies: src.all_dependencies())
>>> +      hw_common_arch_libs += {target_base_arch: lib}
>>> +    endif
>>> +  endif
>>> +
>>> +  if target_base_arch in target_common_arch
>>> +    if target_base_arch not in target_common_arch_libs
>>> +      src = target_common_arch[target_base_arch]
>>> +      lib = static_library(
>>> +        'target_' + target_base_arch,
>>> +        build_by_default: false,
>>> +        sources: src.all_sources() + genh,
>>> +        include_directories: inc,
>>> +        c_args: target_c_args,
>>> +        dependencies: src.all_dependencies())
>>> +      target_common_arch_libs += {target_base_arch: lib}
>>> +    endif
>>> +  endif
>>> +
>>> +  if target_base_arch in target_common_system_arch
>>> +    if target_base_arch not in target_common_system_arch_libs
>>> +      src = target_common_system_arch[target_base_arch]
>>> +      lib = static_library(
>>> +        'target_system_' + target_base_arch,
>>> +        build_by_default: false,
>>> +        sources: src.all_sources() + genh,
>>> +        include_directories: inc,
>>> +        c_args: target_system_c_args,
>>> +        dependencies: src.all_dependencies())
>>> +      target_common_system_arch_libs += {target_base_arch: lib}
>>> +    endif
>>>      endif
>>>    endforeach
>>> @@ -4282,12 +4314,24 @@ foreach target : target_dirs
>>>      target_common = common_ss.apply(config_target, strict: false)
>>>      objects = [common_all.extract_objects(target_common.sources())]
>>>      arch_deps += target_common.dependencies()
>>> +  if target_base_arch in target_common_arch_libs
>>> +    src = target_common_arch[target_base_arch].apply(config_target, 
>>> strict: false)
>>> +    lib = target_common_arch_libs[target_base_arch]
>>> +    objects += lib.extract_objects(src.sources())
>>> +    arch_deps += src.dependencies()
>>> +  endif
>>>      if target_type == 'system' and target_base_arch in 
>>> hw_common_arch_libs
>>>        src = hw_common_arch[target_base_arch].apply(config_target, 
>>> strict: false)
>>>        lib = hw_common_arch_libs[target_base_arch]
>>>        objects += lib.extract_objects(src.sources())
>>>        arch_deps += src.dependencies()
>>>      endif
>>> +  if target_type == 'system' and target_base_arch in 
>>> target_common_system_arch_libs
>>> +    src = 
>>> target_common_system_arch[target_base_arch].apply(config_target, 
>>> strict: false)
>>> +    lib = target_common_system_arch_libs[target_base_arch]
>>> +    objects += lib.extract_objects(src.sources())
>>> +    arch_deps += src.dependencies()
>>> +  endif
>>>      target_specific = specific_ss.apply(config_target, strict: false)
>>>      arch_srcs += target_specific.sources()
>>
>> Somehow related to this patch, when converting from target_system_arch

"Somehow related to" ~-> "pre-existing issue exposed by"

>> to target_common_system_arch, emptying it, I get:
>>
>> ../../meson.build:4237:27: ERROR: Key microblaze is not in the 
>> dictionary.
>>
>> 4235   if target.endswith('-softmmu')
>> 4236     target_type='system'
>> 4237     t = target_system_arch[target_base_arch].apply(config_target,
>> strict: false)
>>
> 
> Patch 12 introduces an empty arm_common_ss and it does not seem to be a 
> problem.
> Feel free to share your meson.build if there is a problem.

Empty arm_common_ss[] isn't a problem. What I'm saying is
when I move all files from target_system_arch[ARCH] to 
target_common_system_arch[ARCH] I get an error because
target_system_arch[ARCH] isn't expected to be empty.
I suppose due to:

   target_system_arch[target_base_arch].apply()

Yes, I can keep/add an empty source set but it makes meson
files review more cumbersome (unused source set, but if you
remove it then the build fails).
