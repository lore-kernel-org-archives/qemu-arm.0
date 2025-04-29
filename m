Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp543858njm;
        Tue, 29 Apr 2025 14:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcEI5cHvYJUTBp7oDXuhYcyaEo/gQRoCEqDNERVX1ucMhyhxiKKqESW+ONBdqGNke1kYbkh1W+/1MTQw==@linaro.org
X-Received: by 2002:a17:902:e784:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22df3502e72mr12856075ad.29.1745961109261;
        Tue, 29 Apr 2025 14:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745961109; cv=none;
        d=google.com; s=arc-20240605;
        b=XZg38eSCLO4cy0IDdyjgGE6oIXEnYwwPzI9+b5K+Zp5jwG+ipuWHzpmOC4UbCykxG/
         Vkh/Cv4uFJLwzZSo17qaecW/LhWe37zprauLPJjgxvCW8HFN7PAI/ArU4XELhFYIyQS1
         krhbRlnSzSzEFCc2HAXQem5ygKpHriSkaPZQvI2kghhq9LPDCTAnbtVGnors6eYQj9UY
         JJ5Tu9Ocs5JrS0sQ9d5u1lEgS6YSrRJLMcYkaBn2G7ZmGQ+m2SPGOsAlQ5zqTrDnUKGq
         EMLLOQUjyIxYwSbAgc40ovk/wX4BmISMt9WDexK4ss3cDrtK6U3uSHw2UEhSwARC6Oyp
         UrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+vBxbVVL0iKGPcc8hbFY6P4N8NFA8CDBAgRz2WbbHH0=;
        fh=Ni3F9XFqxxlvvc+siRPA4QUC2AC6jqPq/DbMZl33zwI=;
        b=aIP4wu8a8CUDcM6Q68j0W1M8/9qmENEFbwWO0bqlo3/z1hhExBFxA8vs5h8dTRttSr
         7+1y5LhnMf1Q7ErRb90IYzjOaDMgtdadnHPC4Uc8GGpdaCWOUUN3jz4gSdj2AIug41P5
         2d1wYG3zyuKWpmTNfQ3l7lxWtIpvYyBccZwkTx3Zw67vyLcQg/lOUN7N4PRb+GRLmiC7
         3CLcJ77bXcSLHvxSZbf2d5YkYpRgVKfD0F6UZUt7qMmQYIDmgdGbB7BsD+VBo50/2fei
         0235Nj6xBhjTNl5YoV8JaK8WROUSqMKpEjM8TBPy1/kMijKfhGSefzfwXdp5kV0Lgdlm
         HONA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQydfsEO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db520bab5sor79288845ad.17.2025.04.29.14.11.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 14:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQydfsEO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745961109; x=1746565909; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vBxbVVL0iKGPcc8hbFY6P4N8NFA8CDBAgRz2WbbHH0=;
        b=bQydfsEO+Qoayxrrst1mT+embl+SZMTdfoS/cF7ILLo0F0XEWjycskVwkWnp8v3gte
         VBOqbxk5Pg4PwDBzYlyJ3hSiZGrKxPeJjPw/yKsqvGqgLRZ7HMOHKimCgvm6mhnG8sFn
         Bn+og3bKYn4krFfy3tGY/KesE/IZCJ0rtFfKq0a19c7zs5X0HmMqVncTuBIuYI5EQM43
         lhVWPto9U6Dsh8at7Ecc9nNCieCTP0nunzska8QuT5VqBR5vPWwM1G0C8jIaCLG9X7u3
         zrN4brp4I3qLxR4gHu4ejth5mJckYtw2vwE3OnpNL5yXFVHep3Ekz0/Mgzn4p0hXCiv/
         g8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745961109; x=1746565909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vBxbVVL0iKGPcc8hbFY6P4N8NFA8CDBAgRz2WbbHH0=;
        b=MFclpt+qtI/hTL7tIRfXk1oU9AycvtQwtJY8TnrJyvQSOwld5zXx/mvJ8nL+r+wfed
         LygMhp84q5uwTCGI5N70HW6e7atyr4/AmwZoRlYfztr95lSwFtM1sYMUPDI6bCY0wiD0
         stQBpwJFKkKaA0+3uCIamsQk3V7NMzJhvTLuvhcwktbZ/6Y2ZKYpdYLLFT+lsU1u1qNz
         K0g20JcjKGFT/fnKcI6wBnU5kPE+x4z/PCUjBwmFkSi6G6yDtZDW/Q0Jh+9f1GCe5wpX
         gdISR2rVQsmLJKIvj/0yB3VUxJHwyy6khwdvqJxdQ1w7NyvlQpRJM03DMtcT2lSxvC8W
         halQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn/MxHBD00TvYRuKJbervplWAMR6JcDWBGP6Xeido9DWvfquEZFgWQFoZP5I4jV8U83FKORDurBcXfMg==@linaro.org
X-Gm-Message-State: AOJu0Yy6HwZAgHWwnyavByEyVxIIb2EOttbX/uOxSZXF/6hdRNVAxoed
	TRf5T5rRIWpjPkHungX0fGnwoMuHB8gMKWSqIaU+U2zMticPElFKiXBoToJigKVSSw==
X-Gm-Gg: ASbGnct3ppSG6UX0lMdRRN/sw8z3xVwGYC48mC2jPgDn1NH0m5mk2ixRWFsvBGQ6Rwg
	p77t1sNA8HdYBMho0AMUOESRi147Eon8LqmaaQUulYlmC/QHzjL1cFeutaHQyBEqaLkG+dcs3ZJ
	Ke/hQftEflfyTtNYfdiFYvWrinhsA4pwYdVxOjMDDpVboJVKASaIXjxE+TYvFYc0kezS4LFKO3G
	NoIhuV2SEcvrCS9QRcI6uylU0927hXILn6M8d5dkQArHLESdN7BMS259dkEIOMslQQcYyzMqUBT
	EzCGRUQxJKfa95KAHF54+xP+2diIhZ5IJEV3rhnEiFCZvYe9sWJsdw==
X-Google-Smtp-Source: AGHT+IEFmAHBbO2wKdGpPUmlZ7vzYIs7H2Tc0jXj+u7tbNw7KX5eQru8f502ZH9woOgYHKduUx5NSg==
X-Received: by 2002:a17:903:8cd:b0:223:6657:5003 with SMTP id d9443c01a7336-22df35700b2mr14256935ad.32.1745961108795;
        Tue, 29 Apr 2025 14:11:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102d31sm107976365ad.198.2025.04.29.14.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:11:48 -0700 (PDT)
Message-ID: <12579394-7bce-4b9e-ba66-00ce1dff43d1@linaro.org>
Date: Tue, 29 Apr 2025 14:11:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] meson: add common libs for target and target_system
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-4-pierrick.bouvier@linaro.org>
 <fd70e4f4-29b8-4027-a70c-747729172ce5@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <fd70e4f4-29b8-4027-a70c-747729172ce5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4QNVz4JOhHmX

On 4/29/25 11:01 AM, Philippe Mathieu-Daudé wrote:
> Hi Pierrick,
> 
> On 29/4/25 07:00, Pierrick Bouvier wrote:
>> Following what we did for hw/, we need target specific common libraries
>> for target. We need 2 different libraries:
>> - code common to a base architecture
>> - system code common to a base architecture
>>
>> For user code, it can stay compiled per target for now.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    meson.build | 78 +++++++++++++++++++++++++++++++++++++++++------------
>>    1 file changed, 61 insertions(+), 17 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 68d36ac140f..7b2cf3cd7d1 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3684,6 +3684,8 @@ target_arch = {}
>>    target_system_arch = {}
>>    target_user_arch = {}
>>    hw_common_arch = {}
>> +target_common_arch = {}
>> +target_common_system_arch = {}
>>    
>>    # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>>    # that is filled in by qapi/.
>> @@ -4087,29 +4089,59 @@ common_all = static_library('common',
>>    
>>    # construct common libraries per base architecture
>>    hw_common_arch_libs = {}
>> +target_common_arch_libs = {}
>> +target_common_system_arch_libs = {}
>>    foreach target : target_dirs
>>      config_target = config_target_mak[target]
>>      target_base_arch = config_target['TARGET_BASE_ARCH']
>> +  target_inc = [include_directories('target' / target_base_arch)]
>> +  inc = [common_user_inc + target_inc]
>>    
>> -  # check if already generated
>> -  if target_base_arch in hw_common_arch_libs
>> -    continue
>> -  endif
>> +  # prevent common code to access cpu compile time definition,
>> +  # but still allow access to cpu.h
>> +  target_c_args = ['-DCPU_DEFS_H']
>> +  target_system_c_args = target_c_args + ['-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU']
>>    
>>      if target_base_arch in hw_common_arch
>> -    target_inc = [include_directories('target' / target_base_arch)]
>> -    src = hw_common_arch[target_base_arch]
>> -    lib = static_library(
>> -      'hw_' + target_base_arch,
>> -      build_by_default: false,
>> -      sources: src.all_sources() + genh,
>> -      include_directories: common_user_inc + target_inc,
>> -      implicit_include_directories: false,
>> -      # prevent common code to access cpu compile time
>> -      # definition, but still allow access to cpu.h
>> -      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
>> -      dependencies: src.all_dependencies())
>> -    hw_common_arch_libs += {target_base_arch: lib}
>> +    if target_base_arch not in hw_common_arch_libs
>> +      src = hw_common_arch[target_base_arch]
>> +      lib = static_library(
>> +        'hw_' + target_base_arch,
>> +        build_by_default: false,
>> +        sources: src.all_sources() + genh,
>> +        include_directories: inc,
>> +        c_args: target_system_c_args,
>> +        dependencies: src.all_dependencies())
>> +      hw_common_arch_libs += {target_base_arch: lib}
>> +    endif
>> +  endif
>> +
>> +  if target_base_arch in target_common_arch
>> +    if target_base_arch not in target_common_arch_libs
>> +      src = target_common_arch[target_base_arch]
>> +      lib = static_library(
>> +        'target_' + target_base_arch,
>> +        build_by_default: false,
>> +        sources: src.all_sources() + genh,
>> +        include_directories: inc,
>> +        c_args: target_c_args,
>> +        dependencies: src.all_dependencies())
>> +      target_common_arch_libs += {target_base_arch: lib}
>> +    endif
>> +  endif
>> +
>> +  if target_base_arch in target_common_system_arch
>> +    if target_base_arch not in target_common_system_arch_libs
>> +      src = target_common_system_arch[target_base_arch]
>> +      lib = static_library(
>> +        'target_system_' + target_base_arch,
>> +        build_by_default: false,
>> +        sources: src.all_sources() + genh,
>> +        include_directories: inc,
>> +        c_args: target_system_c_args,
>> +        dependencies: src.all_dependencies())
>> +      target_common_system_arch_libs += {target_base_arch: lib}
>> +    endif
>>      endif
>>    endforeach
>>    
>> @@ -4282,12 +4314,24 @@ foreach target : target_dirs
>>      target_common = common_ss.apply(config_target, strict: false)
>>      objects = [common_all.extract_objects(target_common.sources())]
>>      arch_deps += target_common.dependencies()
>> +  if target_base_arch in target_common_arch_libs
>> +    src = target_common_arch[target_base_arch].apply(config_target, strict: false)
>> +    lib = target_common_arch_libs[target_base_arch]
>> +    objects += lib.extract_objects(src.sources())
>> +    arch_deps += src.dependencies()
>> +  endif
>>      if target_type == 'system' and target_base_arch in hw_common_arch_libs
>>        src = hw_common_arch[target_base_arch].apply(config_target, strict: false)
>>        lib = hw_common_arch_libs[target_base_arch]
>>        objects += lib.extract_objects(src.sources())
>>        arch_deps += src.dependencies()
>>      endif
>> +  if target_type == 'system' and target_base_arch in target_common_system_arch_libs
>> +    src = target_common_system_arch[target_base_arch].apply(config_target, strict: false)
>> +    lib = target_common_system_arch_libs[target_base_arch]
>> +    objects += lib.extract_objects(src.sources())
>> +    arch_deps += src.dependencies()
>> +  endif
>>    
>>      target_specific = specific_ss.apply(config_target, strict: false)
>>      arch_srcs += target_specific.sources()
> 
> Somehow related to this patch, when converting from target_system_arch
> to target_common_system_arch, emptying it, I get:
> 
> ../../meson.build:4237:27: ERROR: Key microblaze is not in the dictionary.
> 
> 4235   if target.endswith('-softmmu')
> 4236     target_type='system'
> 4237     t = target_system_arch[target_base_arch].apply(config_target,
> strict: false)
>

Patch 12 introduces an empty arm_common_ss and it does not seem to be a 
problem.
Feel free to share your meson.build if there is a problem.
