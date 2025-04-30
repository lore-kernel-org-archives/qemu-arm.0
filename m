Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp993406njm;
        Wed, 30 Apr 2025 07:39:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlcxHhkeEhucgvf+PHIJygmPbFnP56asOT2sFiPoQX3e82Z5ckanR1RgMJOcw+wA/g1qH28nSLMvghig==@linaro.org
X-Received: by 2002:a05:6a20:6f0a:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20a8e173f9cmr4770201637.1.1746023944650;
        Wed, 30 Apr 2025 07:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746023944; cv=none;
        d=google.com; s=arc-20240605;
        b=EE/KvV39liMVd9/2nupPLvAzIyb9pwNFA2JixrR2jSETLvsT7E5r0fLYga5xLRvF1y
         XsILcjWCk0QcZKRxwR3lKc6pvzDujwBOqygtW0krUv9ifvlb7eH3Wrpf1HnRBFW5IjDE
         89HMO7ar9oLB/v+P8Z64BQ717jTTAIa+g18k4d95q9pgTngVbTjiwWsYMdgcSvJrSTMA
         oIhuTT1rLNaLrxJQP4IIAWjfFS8f3cxwbZAD2qenSityX68mdyqyS8m+8IxmhtbQ+U/+
         RzTW5CITBbOOq50/qzwGm0odZZCp8ZBg6T0eU0i3Aq1uonrwKXOc2gOxE4U9VktBZr8t
         TbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iziWfrMDATuxJ1oC+ojZYKc0BALl3/NiumthM8sV9aA=;
        fh=tG0Vlaqp/zAVttPz/19KTdTxtEezEszLWlYxfzbpNMk=;
        b=fx16hVxy3L5sYBoUePFBlBN+1Wc8/kVdsoRkWH4TMBDlgtgte67EACoYiZ0kCCfMu9
         KvAdSgPNTPWTuib+EIYH5RNZoFw2sLlccRanT4trqhMUsm+PV1vL7eYYOAdcudNQTra9
         8K7dd+oEtt01L+6abZcHEXRAU1G++fv+rTyhxs4FezaVM1wYpkZly14cMq77Ky3zIw8I
         9ayynFMm8gj0nE8wIg89Je78TaggEGgBFLdWZ3LYUrWa3Wh8ws6Ne/aaBXpfuEMsoBR6
         xa9tGTwlmt5F65PYXPwES3c6J/i1RFgkk8waDHQkaOdNCuzB2v4P99HmBXrV/+BRCZeu
         PwCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4xPyK3h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7403a99c20bsor1096968b3a.5.2025.04.30.07.39.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4xPyK3h;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746023944; x=1746628744; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iziWfrMDATuxJ1oC+ojZYKc0BALl3/NiumthM8sV9aA=;
        b=a4xPyK3hFPibJPGWvuYMv+xsvKL72BG+U/HZKjKB7jdR0wgu7txmpQ0LJm9NC2w6EY
         g21HIN486RXRGI3PhOGNbTSkhfgar/XS5sqhIuf0FpvcaMnV9N7RpREvYOy+E67zoho6
         sNX5daGgZs0TEC4NbrHHMx0elgKKnSnfFSv/RPAxKlZOjYuWt5S/q5IA+2wGIwXG90Fq
         Fvdz7tLZ1kjOUlNVJPCH8wxWOLVCmI4p8wo62Ks6xWR17Nn8grINVTJT2epVkVlyxYe/
         TxyYpDUIJ0J62I0e8kjzxpKBLK2OGRM4bahW5qklm4M9Jk15muPWBewljzZvOEziQ8sf
         0kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023944; x=1746628744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iziWfrMDATuxJ1oC+ojZYKc0BALl3/NiumthM8sV9aA=;
        b=t4nxAm0kRtleQdVwNuu4Lrtt8h5KTlPt554YgWX+Wls+64D4lZQAWL2kTKYVITsRER
         4EvEuRk/RcLqIEwDRoZVVThCxpSY2PYEscS23hDf3BXqKnLyYK0UpqzP9Q1qmwW8FyWQ
         KdsdqedmzMiPcy6jyqNwHEW7iwk3oDzUFgVutua+shAYcmlHnb2g+qKxOv/bVVYZ16nd
         Ossn1NBaqDu+Esudna8uDNGx4Ah+1pFy/peWk4du3OdSpBng+ZyABOMppNn/YxcCYtsw
         ZTw4OExEXtE767VaA/W+X7A1+GcaLnhCa5aNm2ltzwM0Iq9gg2krTZp6u1cSTgpi4T26
         KWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAdB2gdkun8/Thw+lAAa8k2/VKHzlqBguu2sD1OP2mf9Nisipc3q36GPWdAlaESZ5vZPatOrGluA0eyw==@linaro.org
X-Gm-Message-State: AOJu0YxSWUUZgjMCWsgsGBbpeGHCPTF128ou2oNOJh1qgeFfJDBrndzo
	X5+WFb5/iekBTrB3+YObvg1JY/8ZEVYhdqWF3B0aOL+VUtrYKmu/g95jZ1owIqrtTg==
X-Gm-Gg: ASbGncuz1UbPJyQcY46+CcPiVHFSulwUF05tEN+mG9MQRSCH4LPZ7bsZqo3g7eLh3pO
	4WKDwaaChXOyCYRZKn571BvQHIvqP4HFywSv1Sx7MvUogsGGvRC7We4Bq1E1njsSZAZlrUhGGu7
	0/S0Bvt7xbLb9hCmVUTRTdkHIbNIyOoKaqhqHZ/1JhXL4V6tRfk+dUF96oAdfaL0S6LEcsIrgGg
	eEqwAWHtS8I/nAW6IzCdpKS2a8Rcitc3vIZwwebb4SpnZabezvYaUA5OeI861gV5ug74eiDr6Ds
	m2ryObjDmpx0jRfeyrN/qzNAEML+KfArY5NrECqLqsPWaS2um/yqcA==
X-Google-Smtp-Source: AGHT+IFcck6NA9HJOHtUow4q+rzz7NtoeM0eMYtAmia6Q8OUDHFTb0ZXMo62jznlQs8eQn2j8n6ExQ==
X-Received: by 2002:a05:6a00:1482:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-74039a72143mr5121218b3a.3.1746023944135;
        Wed, 30 Apr 2025 07:39:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60099sm1765126b3a.140.2025.04.30.07.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:39:03 -0700 (PDT)
Message-ID: <793e4cd8-b18d-4ee7-833a-8415cb79cc05@linaro.org>
Date: Wed, 30 Apr 2025 07:39:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] target/arm/cpu: compile file twice (user, system)
 only
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-13-pierrick.bouvier@linaro.org>
 <dbc62384-b05e-4f30-b82a-395a82812f65@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <dbc62384-b05e-4f30-b82a-395a82812f65@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IniAQV2808y0

On 4/30/25 1:32 AM, Philippe Mathieu-Daudé wrote:
> On 29/4/25 07:00, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/meson.build | 8 +++++++-
>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index c39ddc4427b..89e305eb56a 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -1,6 +1,6 @@
>>    arm_ss = ss.source_set()
>> +arm_common_ss = ss.source_set()
> 
> Unused AFAICT.
>

Yes, I was expecting some files to eventually be really common, but so 
far I didn't find some in target/arm.
Same comment goes for the patch 3 with associated target_common libraries.

I'm not sure if it's worth saving the lines (especially in main 
meson.build), compared to the "pain" for someone to have to write them 
later.

I don't mind removing this though, if you think it's too bad to leave 
this unused.

>>    arm_ss.add(files(
>> -  'cpu.c',
>>      'debug_helper.c',
>>      'gdbstub.c',
>>      'helper.c',
>> @@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
>>    )
>>    
>>    arm_system_ss = ss.source_set()
>> +arm_common_system_ss = ss.source_set()
>>    arm_system_ss.add(files(
>>      'arch_dump.c',
>>      'arm-powerctl.c',
>> @@ -30,6 +31,9 @@ arm_system_ss.add(files(
>>    ))
>>    
>>    arm_user_ss = ss.source_set()
>> +arm_user_ss.add(files('cpu.c'))
>> +
>> +arm_common_system_ss.add(files('cpu.c'), capstone)
>>    
>>    subdir('hvf')
>>    
>> @@ -42,3 +46,5 @@ endif
>>    target_arch += {'arm': arm_ss}
>>    target_system_arch += {'arm': arm_system_ss}
>>    target_user_arch += {'arm': arm_user_ss}
>> +target_common_arch += {'arm': arm_common_ss}
>> +target_common_system_arch += {'arm': arm_common_system_ss}
> 
