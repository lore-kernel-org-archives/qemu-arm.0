Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2647733njj;
        Mon, 5 May 2025 11:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVY0BycsuDPe5cQj6QMebY4X0ASU6VHh2rpcAoakN45zSHHAZWoUkwZLG68AkgrLRI68XLPnkWRjTmm0w==@linaro.org
X-Received: by 2002:a17:90b:51cb:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-30a5ae3eb63mr14541198a91.19.1746470679880;
        Mon, 05 May 2025 11:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470679; cv=none;
        d=google.com; s=arc-20240605;
        b=UaAZrSA8J2jOMzko13weUoSqQXOEdIwtogJstUWCxpdtIYSjv2VJptvw3PnuASBWQj
         FO57nQoKFYAkUhwZrcJSEHmD9pOLy607/UJX4kQG1YfC9L1sYkDYI+Tm1Yk7PFFSHreL
         OTE/vldLg6kAU2TyQUeMnpoR6beHtrDyRUqC768HOfKR9RIOoXZyGqOuhkhOXRkrN5uY
         OBNmlnVKHE3qzEdJaGPiA8+JV2Kh3gIiKevWJY88z41mgJRMJ8Sgr2oH/ZlSzZIc1cZQ
         mmDpthVGgWTOl7DCufQwxadDPHnAKz8eEiSoWV03k92WDxOEVex8TPYA/KkdaJNCUR45
         CX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GKKv/xMbQTGSWwlpOo8WHdB3SggIft/5hm7DLXoKBbI=;
        fh=5TzC2PYlMHL713x8Od8aoEYme01xIrAUM/6PrNCnOwc=;
        b=czCv+IKFd4p73/rXNYVR0re+Y480ySNPzUXyMfASbD1CBf1J84fpejHblonT30c3Ju
         TcciABu7+9hP+YtyZSk2T3m9wvO49i7stkPGhBTunKEmtCoTfzbHGSfxJ0lZUDWWHgVZ
         l74KJHOKqYOb/ztXHhSqpG+o2OlowrrM27q9d1OBRHjiGwjyAgkkSTRqa1K0ra19jDT0
         iUWbuFSBo3gzoYgVo9InOdSLWpGSS+jVCSt6XucpwZg7Sp70U7psluQeBwu9nrscWB5C
         rEzhAYUcj6vtTWFOfIcOIK6gMIiMWDt1ao4snf11HUpePVdea0QA5tNhug1CeESSPej3
         6OGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1lniqRt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a47601c55sor6932621a91.5.2025.05.05.11.44.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1lniqRt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470679; x=1747075479; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKKv/xMbQTGSWwlpOo8WHdB3SggIft/5hm7DLXoKBbI=;
        b=M1lniqRtodvNWf/8UeROc9LhsQB3ZM8kPNAol5UQLeLx1xt/D/TuQpk+1OzKkEAPGz
         2msZwBGXA+/IcdyeCUPkePFdcDBMiF0Dxad7Ms+ZN2JM5czEQVv+1YzxPhM8Mw06uMKs
         xEy90hFuJ9eojX8MZfcgzWBGYrecgiQnt6irLKEWjOXzsgnTAs2qUybniqC6u8J870ld
         dVDd2PuC1edBrPKf2XniWlgsg3s1T4ePMqYBl6okrCksGw0ij4NzyuwBMva6e5143gCZ
         8IlV2lVsy3/+PCdxI5tP5pDRPwZKkonhR1+KFyOTzgaOUE+qXuzwjuGzIikyOR/hAo4P
         G0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470679; x=1747075479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKKv/xMbQTGSWwlpOo8WHdB3SggIft/5hm7DLXoKBbI=;
        b=Vb3DZAlc7nh8Ik8DY7lSrsJkgXzqQq82phbW/yc+OatT7ZYRXBSyuDcAV6swThiWCW
         6e2EhzTEAmeU1xCrnb5qam/1dQifGX32PBR+aEjCYIWRvDTPrcPinxbO7afBoKnEYYgW
         rZIP4cjgEtjvLMCShoSzHayfGh0NPKOSoihDXH5QHZDH/tYc/S0OfEEVUfz+1NzxgJS3
         YsQRL+R6b1ON9WD0W0wu03+Ci4PpaYRc96WFXwFiWIynQ+B2QhrX33KhC5kpFGPcjiVd
         499uYtnHj9qc/oFKb3KNuSh1k5lNFhRoLKx9LK/WhNfN+bO2Qukx9/BuNGPk+QE3nWc5
         stOA==
X-Forwarded-Encrypted: i=1; AJvYcCVDBnSyZlZGrXTQvMOH2dMRaGxen2vYy/7aeB5MHDJSMUivxlr9cr2n9ufUvblZrj9v+3lBQM0te4AK7A==@linaro.org
X-Gm-Message-State: AOJu0Yz8PsefJsT7WqI1XJkVq32isB1hsCQjFuC44TZeeBqYhkC7hNrZ
	+DGvq5t0FZu1v9kQJEnagf8sYI5Ugcgg/adOkyuncIrk4PLu6iq9SMz7jvPAVQgsVg==
X-Gm-Gg: ASbGncs09DznH7Vp/I5sfnwuCU8AguYvKa08/AbMnTE5q/rNrej4l8k/iDwIPc8VChD
	itsnxxkB+Cu8ZhW7BgM2zksWMZBMvdjR2IBP9y/OfYPn46wGz6ZKrkNAc62dhAyE7wOjfNExFwv
	PW7JpzfIFs5rKjjwkXKglKeTKlvzaaB/I9eY4dM5be9zClaGaDE0Op5OdjASPUccY6d4Qw3wUYN
	MBA5T9wTRnQwEk/4MgpBjnEuetRsEVyn09TuA7eSsVnCUmAkVImVcM3CthbxQkAHeNZTvnB7Gli
	Tqw8zLySy8uM97hY5Lro+Y4PjVFUCxDcmz4SiVUnBzGCM7f9mBgnsjIGVl6/B2XM25DCmtu6zm7
	E81eAu2M=
X-Google-Smtp-Source: AGHT+IFypvcmIyf2TlfQ3FqOGv9EEEj4vApmLoTRsCwsw90TW1X57hFXURA9wAliPhoUB+iklAARJA==
X-Received: by 2002:a17:90b:586f:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30a5adf4ea8mr14076314a91.5.1746470679444;
        Mon, 05 May 2025 11:44:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745fab6sm9298182a91.10.2025.05.05.11.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:44:39 -0700 (PDT)
Message-ID: <7ff2dff3-20dd-4144-8905-149f30f665b1@linaro.org>
Date: Mon, 5 May 2025 11:44:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 44/48] target/arm/tcg/neon_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-45-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-45-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8b9/1MIE8r8u

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/neon_helper.c | 4 +++-
>   target/arm/tcg/meson.build   | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

Likewise, I think this could be built once.


r~

> 
> diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
> index e2cc7cf4ee6..2cc8241f1e4 100644
> --- a/target/arm/tcg/neon_helper.c
> +++ b/target/arm/tcg/neon_helper.c
> @@ -9,11 +9,13 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "tcg/tcg-gvec-desc.h"
>   #include "fpu/softfloat.h"
>   #include "vec_internal.h"
>   
> +#define HELPER_H "tcg/helper.h"
> +#include "exec/helper-proto.h.inc"
> +
>   #define SIGNBIT (uint32_t)0x80000000
>   #define SIGNBIT64 ((uint64_t)1 << 63)
>   
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 3482921ccf0..ec087076b8c 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -32,7 +32,6 @@ arm_ss.add(files(
>     'translate-vfp.c',
>     'm_helper.c',
>     'mve_helper.c',
> -  'neon_helper.c',
>     'op_helper.c',
>     'tlb_helper.c',
>     'vec_helper.c',
> @@ -65,9 +64,11 @@ arm_common_system_ss.add(files(
>     'crypto_helper.c',
>     'hflags.c',
>     'iwmmxt_helper.c',
> +  'neon_helper.c',
>   ))
>   arm_user_ss.add(files(
>     'crypto_helper.c',
>     'hflags.c',
>     'iwmmxt_helper.c',
> +  'neon_helper.c',
>   ))
