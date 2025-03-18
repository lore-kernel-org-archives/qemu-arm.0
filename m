Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3255338njb;
        Tue, 18 Mar 2025 15:45:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjJ0YMICLvoZ0BI8lMpjM/2KvQNSS0TkcVcc31Qg9GOfKCVDMlbnuOSEcxFR+Yx4IS043CSStsqhzvng==@linaro.org
X-Received: by 2002:a17:902:cec3:b0:221:7b4a:476c with SMTP id d9443c01a7336-22649925931mr5560355ad.18.1742337945192;
        Tue, 18 Mar 2025 15:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742337945; cv=none;
        d=google.com; s=arc-20240605;
        b=dOrfwRN87HOt7nrtfrN2TGeFeOHtmVZP4e9iIh9QPVfB7Q6wiV0o/HeNAWckCLFW+A
         car6f3VS5yzQmXjoxutF8JMiAbRnsurUtyMjcKVV7uyG1MspCJydj2tLaywnL6LC2iyk
         0Y9tGqWLwYD10bMxZl2QuA7VS0T6q5iPuK7/8/9d9/R/L0RG7kFJejhcwkeo1urCqM12
         JMmpG3svLiH4Ycr46jQrNhkhSjrNmx+0m87BRLDYcmcCRtyyaL+2xciq3zf4HgPViY56
         HqxlI54iWK5+ccR3j0++7dC9zsoGcn+MH/gnTztJQcHt4g2Xf7odmQWhgFd2ZC0FJKxB
         eyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OYj2m8wY9HvQL8f9sPwRIBivPUDXh/Fmsum2H+ZPr40=;
        fh=QCzRPXgShAfqGVOXgqk4naREzhQ0cDF43Z5sh+5q2EI=;
        b=EN/GoA4wkVl1fVkPR86KOrvCp6nNE2ia34oPiCUGKNnUol2RwE90zvBxCLKV44jEhu
         JyQahdT62Z6ZhRBj2QLE/6aWR1g5G4q323CEW2NhOPd9Jz++vlhFQdFdkDx/gVTIthpr
         e8sMvo8UXBwQGKYWBO2iKAef5vIVvJxxc4S+SvFTIKQ1sAe+4xk5PEC+c/2PE/LZFpfN
         wyaX5OgSYR/BysdgZmAMNSrOd3QXtcMoFVfqR/UR0sV1n2RwXNISFDwE/7DGVwiyCYbw
         7g7EHL0IUbJtNfvfF+YFdhHve9BH7bFS/jzjhzK+DndHIMBPx6FTBW3Z/q0fbZG9TVQ1
         mhGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQMN9FAZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73712bc09e2sor6423900b3a.6.2025.03.18.15.45.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQMN9FAZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742337945; x=1742942745; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYj2m8wY9HvQL8f9sPwRIBivPUDXh/Fmsum2H+ZPr40=;
        b=YQMN9FAZs8nZs/Gianc9IEXBTuv6MJLZr2FL8HFL2fqS3DnBGrWv3x3rKMKB/Im+Wi
         numXxthDle4F7lpPkxpVRvGaKfjVMVFLruNe/oS7oWcfW3XPbSDCyG5CHv7LqqSHEBVq
         T2oe3fkZia8AwqdTRUdovvNbk4qw9WNJYyqtTuYfm/3D4Ys7qqjpAxVV0aUCaTBrGmui
         qWc66LB3ysL4rDlkYFugWQTUWkg7qL5j4ehgkYpc+OTym1HosQuJQrSsyCSYBSYCA9Yv
         HFZZHRHFWTo8m/LQg5ubXvkd8hpuC9SEjWJhAjkCp2Qi9n/1/RyPEv98tbOdyyq05tOw
         G0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742337945; x=1742942745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYj2m8wY9HvQL8f9sPwRIBivPUDXh/Fmsum2H+ZPr40=;
        b=vdyQy2HAL92pEoItRHf1pNQxdw6d04uTYOQU3c/Nag3tPVGWgCgWFoVhwsbgsDMbgb
         TOoKcDD5tjetV+Pd9hk6I7pA5kgEEosa/PkyuqxjdnYu1Zs/XRAZQC+06JwTppEnl+Pz
         onkSpvx+uOvobuJwY/h4nduvz5AWtPD1VynJHVcJdkMXJf7FuWzoRDbMNP/1l7ncQjhV
         rBN+BQ5KdQ9fOh+0S6KMal0rhg0mT+/mvEDOv2RlXqAYufwmaO2JdUCfyphwSHhUqLJJ
         A3t87Tn5rad+f9NvLl5TMW2IN1/hOjYniwEKst5KAJaQq1fLvB1Hu6dmy+PB2OMxOAQd
         oLVw==
X-Forwarded-Encrypted: i=1; AJvYcCWCwOZNmxKTC9Qq5q4n0+i5dWWrHYcOE2QPrmaKqSVM1Eaofigfo07MKB6+OWeZjSZFngirqOGwFuDbKg==@linaro.org
X-Gm-Message-State: AOJu0Yx17MAglAlOK9h8K0HYfxY4mMuARHpTMFpPDidYiFRj83fZbIN+
	VE+eZpx4GpKlqNCH1h+/Z01l4nUuSV4UjqK9CGSIsHW2olRpFKXeQaz45w/yQd73Cw==
X-Gm-Gg: ASbGncutj2+ax3CqGm7T0KeLN5Rm/MpabKR3vdIb4M/ab6oLOk0psRKTZqUOzR36ZXs
	gTHzAWJJh3lkd8KSJvhWUzQXrYNm8Y35hubfojQx0EFyeVnHlAXMzjyLugmFtBUmEjkKin7JFkk
	KMCQGf9IuO+SVzWhnHFMJM2B9R+0EYVfl2bRpbJEcs40Rw/TCzKyuGn8ytB9/y4ecmPhAyMNwep
	Q4Q3UQzFX2jbqcuILlgGkyrmrdbYcQS+eDTcHklLViAfAaCcQ1cjA/2lgNKSP0YgAeZxyFpHUXy
	ZO0VBEea4F2IjX9L4v8QMSmAVBa36vWCn4h1FiqDRy0xIFJ9/K2mlIteFDbtj6/Jd4gA7qRUuAu
	tYMpfYpnZ
X-Google-Smtp-Source: AGHT+IH99wFLHvDNK9DJaCFMZ+buTxPrONpqtpx2Dm9CE5AsWM3wvi5vYKeaIugwzTzbLBTrpVb69Q==
X-Received: by 2002:a05:6a21:a44:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1fbed503e74mr557864637.39.1742337944753;
        Tue, 18 Mar 2025 15:45:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea947afsm9656324a12.71.2025.03.18.15.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:45:44 -0700 (PDT)
Message-ID: <2b438e13-b377-4b4e-a4ff-0b219d7f3964@linaro.org>
Date: Tue, 18 Mar 2025 15:45:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] target/arm/cpu: define same set of registers for
 aarch32 and aarch64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-11-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: g7F//EY5WGKH

On 3/17/25 21:51, Pierrick Bouvier wrote:
> To eliminate TARGET_AARCH64, we need to make various definitions common
> between 32 and 64 bit Arm targets.
> Added registers are used only by aarch64 code, and the only impact is on
> the size of CPUARMState, and added zarray
> (ARMVectorReg zarray[ARM_MAX_VQ * 16]) member (+64KB)
> 
> It could be eventually possible to allocate this array only for aarch64
> emulation, but I'm not sure it's worth the hassle to save a few KB per
> vcpu. Running qemu-system takes already several hundreds of MB of
> (resident) memory, and qemu-user takes dozens of MB of (resident) memory
> anyway.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I think this could easily squash with ARM_MAX_VQ, since the
rationale is better spelled out here.


r~
