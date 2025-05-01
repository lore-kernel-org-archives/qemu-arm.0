Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp279831njj;
        Thu, 1 May 2025 08:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqkY+sC8t6zJlq+iX8/4IKwGNkFyT/xuq6nV8uk2htGkp1NNc35kUCUrH7QUz8DzPAunt9OjGlbbzLPQ==@linaro.org
X-Received: by 2002:a05:6a00:1809:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-7403a82c6f9mr9938617b3a.21.1746113095475;
        Thu, 01 May 2025 08:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113095; cv=none;
        d=google.com; s=arc-20240605;
        b=jn2e7Dr0iu0HdSecvxJotFeRxMELZU73fLKy3WNNFVhgUjBVV57VhDWcVj/bpSOsGz
         ySntRXaqAc2E7yiC9dtZJ3gyLIIoMlRZ/p0o09q0zoIhLRmp844uym7jg8XrsiP9YiGI
         kWvin1DoLBIhDKpi64u0zlwlJ147RR6w9LdP1ZjLpH0CjPB8GhG0RU5e36NeCHIBy5jn
         lw30n8jETxF6zfyDjwLm2b69S1ZOEvf9Erj4MgtFrXNoUJqMMG1cZX2WAV3g2JY5MenF
         w+WPAnLyDS1Sa/LNLHWtOSwQtW7m3qZ1gTiB0KlP8iPTRhqs9sTBS/n4Pp1DC0yHbkrg
         Pklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0vHjLZIKMAcpSYJ5CKGfm251JpODp3KFOdq9sZMqTe4=;
        fh=5XwmbLEK34sYwnpmLGzV9K/eGMeagg5fbGQBvRTvOlo=;
        b=EfHvXq9pFGfEW5SOn+xMAJ72POOsQxhpI8S6BW0190IK+5N/Ah9BADjaBNmf3GqGHS
         j18IPLyPxUnMFKBYG/kZ0aUrE5FW9aBwjYfff7b0Q/r8TRYrrafpyON4Xosvsoz2Q3qh
         3ODuCiwwGGBxYwdF27ZGxupCVjPu2DeDspTqJR+qBptvFv7+Lwcj/aNRAY+4ykbClC35
         FMIwJ1pcxQHjVRLweI3FgsGLtdwXBIDm/gTTShZNAur2PZc8WLxCdjtShNoZp2SIhiKe
         sAsCb2Hho09sVKhFn8YhZOf76LVssUzbWOUkT+haQqnUEaCX/y4Mc32VfEVg9yeudWAK
         frhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=osh6bxMF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ac4dasor565336b3a.6.2025.05.01.08.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=osh6bxMF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113095; x=1746717895; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vHjLZIKMAcpSYJ5CKGfm251JpODp3KFOdq9sZMqTe4=;
        b=osh6bxMFAG28Mguu1c4GCnf4bujpyh8B5JGxYCxEqclT+h6bY8AxGoksGzQ4QCWzns
         bWtnqF2upoQ38EwotTNht0fAOMMNKANxJj6jqn0haRcpGigwDn7AudLNiQysyMfiZrAA
         WWRQpU9eJwFyH/r8CYx6Bw4UgUGqOgpAwzIjDeItMB6VFf0MSPfwp2DOMJYoVdYt8Y+1
         EqwPl4donFhN9NtBfnfS1mDrVGMZHmKacuyxwdiOFKM9u+VlZhwvfTBYYbYDkZumEkUv
         iw/Oz2prgt227vNmDsfTqfYc9rT2lMHj91w6NMvyK7tsTJOzdGrK0tKTd0dVET8QXwZN
         in6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113095; x=1746717895;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vHjLZIKMAcpSYJ5CKGfm251JpODp3KFOdq9sZMqTe4=;
        b=PKziwXN6NnHQKa+hyOxEHxe79ReOksX8fZri2l+qr+dEdYAclYdGaPEOaFpV+gkrgU
         AIWyRJFUij6xTPGl9dm8J1brFaWACGjbgD9rcd5QNPnjKwbUKkm/J98jdkrfCMzBIwtH
         0N7iXfVn90e8hP7pehlcgVu4NNoaj/r5cwIyrtje8lEOehQL8fzasuU927PaB/wQxWbY
         mmD/Q3UEfazJGo+DHiiiGIKViu5hIB27PSB+DESwAN6Gtx232E7ualyc77GTN8kLSdaw
         6XQQc2UgTRgIfVt0e78DyezY22A+pQmIO77Z8/K96ITwIvA8XKLOffZoWe/uNl1osMkO
         YJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCVWM/NXZ50+ul/98Wez6qG80KsHSc9sDVrtjzITWpRU1Jl/49FhYyk5LCTasT4uhdI3oVutqEEK8znhtA==@linaro.org
X-Gm-Message-State: AOJu0YwdEQ/0EIDiVus+b05zjWMRPRXbewP//P9Cu3yM0Kp+gOeR4Qm7
	eYGHE+wySOkc09bdS+K+gR5hMa57mPnOIiTcdHXe8aX/nbtKN/EN8taHAdNc+ArIgA==
X-Gm-Gg: ASbGnctehfrCArhVWJUGQ6irjupgGPJKfyf9VccGMcw6VfZ/IRqm4q47dgWtC5NeOil
	iidzTQcg7c6DYAEsJMy7lboDWwLaowwuvkl1FN7Vby6HU7JcIINk8OtiHx5mUM7MwrkhSvb/BsA
	DNsOdoWYtSTkXnZA5gKYyz6Ue/d+dmaB8nu2fM4wFUpyV5e1DdpQMiuB+2yYVTA/P5iUuU/oilN
	MIrBU6u0hM6f5kd3QyOmdHxNn/IZy6m3AM3KmBN5nnt7gF7an5JfX4y+dYyJMF7l8yCmHR44LbI
	FWCFUWkr+ZA77ojWKQQ2x9dWNeiY+A7CHfDp2h+JM2YOSprVH3CGw9kfPDEbnJWz
X-Google-Smtp-Source: AGHT+IExeTBVUyRMlLYCEVZym1i0z0bgdXtdjFqSFp4tC+pPFl63Tb4G9p16DCpNKUe4ciqiRFLCCw==
X-Received: by 2002:a05:6a00:2181:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7403a77bbf0mr8990694b3a.9.1746113095022;
        Thu, 01 May 2025 08:24:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fe765sm940821b3a.108.2025.05.01.08.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:24:54 -0700 (PDT)
Message-ID: <00710aa1-2a44-4778-83da-05cc125506e1@linaro.org>
Date: Thu, 1 May 2025 08:24:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/33] target/arm/helper: extract common helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
 <8f480fa1-609f-4b90-b6e7-02a76d2767d2@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <8f480fa1-609f-4b90-b6e7-02a76d2767d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: V9EafkLUCRy6

On 5/1/25 8:06 AM, Richard Henderson wrote:
> On 4/30/25 23:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/helper.h     | 1152 +-------------------------------------
>>    target/arm/tcg/helper.h | 1153 +++++++++++++++++++++++++++++++++++++++
>>    2 files changed, 1155 insertions(+), 1150 deletions(-)
>>    create mode 100644 target/arm/tcg/helper.h
> 
> Why?
>

It allows later commits to include only the "new" tcg/helper.h, and thus 
preventing to pull aarch64 helpers (+ target/arm/helper.h contains a 
ifdef TARGET_AARCH64).

As well, for work on target/arm/tcg/, we'll need to have aarch64 helpers 
splitted from common ones.

Makes more sense?

> r~
