Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3240233njb;
        Tue, 18 Mar 2025 15:11:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZRs6B6wMRPch8+SnshPn2ohCWHLXG+vUXJ73pAM9k+PnJgkex9jbPJQ5IIZvKGc7QLgfr4T+zVP2mkQ==@linaro.org
X-Received: by 2002:a17:902:d58d:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-2262c97e7d1mr75479795ad.2.1742335879077;
        Tue, 18 Mar 2025 15:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742335879; cv=none;
        d=google.com; s=arc-20240605;
        b=AaehQ4VuOKbpQ7/Dm7otpP9viuborwjMSG460ccxHK8a9sQ1/wgHXplTx4oXjz+/1A
         G4q5wweJwpySwYQOLzpd7+0wDBOQzUhfNQGmOWNWYA7Tbe2AsR6C8TQ08dA/HdJWCrjk
         g3dJeaH9Dkuld2NVv6w7gONK5JkFyemz7kBomOtVfPxX3XQt8xiCkK8PbpcmwZoAWnU6
         mKDqqr+tlck7edVC7jkOqwcfPVot6s3vmAufHwlXymD4dpW9f63F3/+EiMTHtWHvDSx5
         LyI1f9uCmF/rJh/ViQUoshTPqJsJW8QR+c8aAyc0F+PPMnb/53zNwDtAQK/gSiYQYDow
         5Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+69esl2nOuGPMBCNKxNirnt+vS+cxkG3qdPl+eItGdM=;
        fh=nNo6JNYmwyUL/hGB56lo7w8iVoWrBU3XoGPodT0hQEU=;
        b=i2yNiDy++nG6ZfymIeqwer2Ld/lfyTNKdwacxruhoCsR0Ex/IsR+sQ1fwd5Pmi+mbe
         V10afCNMGWzELEdCLBmjX3QNH1yokBsXdezS7CuxHuUbanWcasnrtxJJeF6B7a3WVgYF
         3mmTDMnTEcHPRmr8Ghq0CX+NCzGva5hNFJAnHKGVsSQ/c2mMhQixjwT6ijfb0XpsH0m3
         XFZf0pD7W0Hnvtus5ZarFiKaNNKgvoeUKIRszJzhdRvGp5VXoQy+vnoxvO7gBb0UHxSR
         OwH4UA1FVezKKRug98WOhsE33/2/opDDxoxBufT/+FOuQkfYY9/RhTEJPNEmzPmr7Wq3
         yX9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QzWUGVRl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7376e4b0ee5sor23722b3a.0.2025.03.18.15.11.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QzWUGVRl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742335878; x=1742940678; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+69esl2nOuGPMBCNKxNirnt+vS+cxkG3qdPl+eItGdM=;
        b=QzWUGVRlQ3s/0IkhkmyK22x74unc+V/AAAr6w1LedtLnc822nI8vxXO88wQqfZ47qp
         g9dMls3fX2n4Bud7ali3xruEXSfr5YwGhNUS+cvR4PRVs1LuUZ78bZUbHpmGQ3NAoNAZ
         WUQIw1EQ3VRZwve6Ekuuw0RYME370p1ELZDfOtVeoDZE0FnUWjgf1pZXcDmFjO/VbSid
         UZhNwlmged9fGU7Z0DOFbXnQAgAoxKC47l6MgQQNgpAtyRjKUyvU40duNk00xCg5cewy
         0JH6LVDLlB+1IeCbAkCcJsajdPGHJwUGXS6rFnIXMgT0hELpifjOE8VTK0V33NeC4Fep
         nFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742335878; x=1742940678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+69esl2nOuGPMBCNKxNirnt+vS+cxkG3qdPl+eItGdM=;
        b=QoRvMBJ4NWP3o7s62ZUon9nH+bGAFVVGGAir7x07WWrofPkdbWtvEYo1Abv+1MatEh
         SgUFgr/x7xQr1C19qy/luAJ9WGP079HoLZvRyrhPhT9uuUuxeJlXf0VacsDNUfDwg4Gy
         9DLdwjKuaG7ChBlc7CClG47Iy6Q4BoDzo7/HtJbhrZJyMPm9uXgcSQfMOwQSjuwXtg9z
         S0rOpX6sP+m2Si/zCtSEbUzWi9Tbn0bjRDgxxAeCo/IHEx7TTqCosU7tCjg8bjw2wv29
         sTnb9sd7uMLPXY1AGCLnLzP+Nr9VYPGjcsMhSM3Hb4MoAi9dJJd8MRiQTUrGtyBSBCpo
         TMuw==
X-Forwarded-Encrypted: i=1; AJvYcCWNnb/8lKv4rbwtaCyEvah2fl0zTSyXamYa/IRt1o/pOnpqe5eSBvS9hvrBI1ZFW/YpXyJI2jyK61+HgA==@linaro.org
X-Gm-Message-State: AOJu0YwtklWOQ6f2dgaXf5157NX+LIYW5yIop7De1pJGqBE6gPe3/K8Y
	Tm4z+lselOpa0DXmWqgAMc0bDOoB01IpjNjThILeIVdhRzFg17kzUPXyX3oemU9ukA==
X-Gm-Gg: ASbGnctj/Z4kqdRjro2LzJAdvIfUV+oTWcMJ0YzotWuQLQ6IUvOUSmEeFeR5HzBcAw8
	cG38jYmpC+r7jSav/UOHfH3twPsmSQSAL7bX0l4Dvr5j6GccLGm8vkzEFNKB7CB01LYvXuLlXpc
	FaQjJKeHUbTO3D+y8Th2FjEbt0W1fnKuNw+c+hEGqyRMa9Q14/0o2ZiAPrhGUK4UelWjgOEkS++
	rs7tfQe27l4RPMcUPQqWUPzbCY9gyzgbqGIBa8JJ9xsAOTsLWusz1ZSri8rGDoMuDPVgMuVO7oM
	quSMkHiajk5jPYCAtraxckTJSW1Uijzq1Y7P8g4WjaHO4I650RFL90wE1UDaoF9B8v4BKX+O/xi
	iOxdSed7o
X-Google-Smtp-Source: AGHT+IF+o57KxPqZyp1dw2vr26h6BTXUQUOnR/DxEq+2jvgU+MIkHQqqlXf/RtfTtCdotr4CtaEHHA==
X-Received: by 2002:a05:6a00:218d:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7376d4619eamr874582b3a.0.1742335878454;
        Tue, 18 Mar 2025 15:11:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10edsm10459572b3a.171.2025.03.18.15.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:11:18 -0700 (PDT)
Message-ID: <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
Date: Tue, 18 Mar 2025 15:11:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: albuSLA2FBMd

On 3/17/25 21:51, Pierrick Bouvier wrote:
> Including "cpu.h" from code that is not compiled per target is ambiguous
> by definition. Thus we introduce a conditional include, to allow every
> architecture to set this, to point to the correct definition.
> 
> hw/X or target/X will now include directly "target/X/cpu.h", and
> "target/X/cpu.h" will define CPU_INCLUDE to itself.
> We already do this change for arm cpu as part of this commit.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 4 ++++
>   target/arm/cpu.h       | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 7c6c47c43ed..1a756c0cfb3 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -46,7 +46,11 @@
>   
>   CPUArchState *cpu_copy(CPUArchState *env);
>   
> +#ifdef CPU_INCLUDE
> +#include CPU_INCLUDE
> +#else
>   #include "cpu.h"
> +#endif
>   
>   #ifdef CONFIG_USER_ONLY
>   
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a8177c6c2e8..7aeb012428c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -31,6 +31,8 @@
>   #include "target/arm/multiprocessing.h"
>   #include "target/arm/gtimer.h"
>   
> +#define CPU_INCLUDE "target/arm/cpu.h"
> +
>   #ifdef TARGET_AARCH64
>   #define KVM_HAVE_MCE_INJECTION 1
>   #endif

This doesn't make any sense to me.  CPU_INCLUDE is defined within the very file that 
you're trying to include by avoiding "cpu.h".


r~
