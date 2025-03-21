Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp493851njc;
        Fri, 21 Mar 2025 11:00:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUARmC+2HgK7qv6irwPiURPwwTHobyewBFcXYCUQtcSIiROo93n0Qo43AQRBk4LGXS6PgflnljxX9nfqQ==@linaro.org
X-Received: by 2002:a05:6a21:7316:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-1fe42f07b97mr8208176637.7.1742580020061;
        Fri, 21 Mar 2025 11:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580020; cv=none;
        d=google.com; s=arc-20240605;
        b=kgMjYbC6I7pqrQ77UUsIUo6a6TrWbW/o3C3uHvuIspkjuC3+C3I9qOLcKgAdCibC6L
         k/PE1Gig5xNM6uaEDwhLv8n30VuJJb16ynAsHpx1y6E1tqv4NE7SKhntc/bLXBfKF2sz
         LiASYREdNMx3loGkMiZX5hWjY8oszKLoTPTvoJE2/CgPDCCHIbDH6gpUoOg6KZcsTWMQ
         /mK2bYUf1BMkADFbqfSIJbUmTR97A8pBgu4kth/MbJdveWl4/9o3GLEBNh/LuBbDP8Gs
         L0+oMWWgbrPbjjp8LLweoUZ8pr2WykjQRMYY5SJpJbCEU3ZTV/WX2L6/lEuy6kb7ZFpb
         atjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NqUath6DYeiXFaEb/UtEorokAMpBsE3LelLAqtNlKlo=;
        fh=zxJZAxqD8EuerF4PvqnR8eKOao1bWRZLyR/LNTHNPe4=;
        b=hA8q+PaKA2p8vvnGGmANKiLOIvPK8APHgeZlVvYUskGTzJ3FWT+7mjSxU/MqZL3t8e
         hOLpVbnJvMPis97y3W2Wwzk+FTab6Gp95/sfu8JpVT8rI1aZeB9RHKGqM160lllUwUCx
         cFzu5o0IlsmWCP/v9rfty5GfgxRL5eQWkzpjrB1T7XlmbXoA8Njd/wqZDcSSLoKGi3Wo
         P9r3zxL5dfd1uKgFIAs6EUJJHel+OArYDpTvMV4xZsUQ/2M5ptXwOSH44KmYeWwYXPSV
         8jzi5eWg+7llGBJ1jaWvYq9QAUChleCvZYQL8tRLXg1mdtHgAcikE0ae3klWzwvKYbS4
         S8lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdxiw+hx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2926ac0sor2044890a12.5.2025.03.21.11.00.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdxiw+hx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580018; x=1743184818; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqUath6DYeiXFaEb/UtEorokAMpBsE3LelLAqtNlKlo=;
        b=rdxiw+hxuyp9ZeBDBeRkyxqEZs18A82apRn7CJfxXvft8Y3MvvTi2acNETk54LjcWA
         /tGt3wYYEWb1KIw7UWYi0sE0/XpxQvEF1gRo4ZLLaoLEhjWLGxYf1gFTqX6aPFnAQVAs
         +EPeiyxtVHuTDNsTUSbL3zcK9/vfgpVGXnCLNKAXQCmgJ3OZrFIc2b+S/ZmWpRJ7kVR5
         LLvSAgFaYsRmVcZLEUHhHrJ25M4X0ITetwkKKo6stzzWB9u4oWc1Iv08bM43b+jycScC
         7m6tZkGV8mPif/cKHxkSjlxhI29ZX0XpvP8yVVp+svSj2Nw7FHu1y+VoWFsZH5F2kHL8
         cgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580018; x=1743184818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqUath6DYeiXFaEb/UtEorokAMpBsE3LelLAqtNlKlo=;
        b=goi0x0Z8N+LgpCuDQZPCmQ+nz7fxa3pJydfQ3MYo/KIL7xxaPLwBPnB6i+ckWbfvW1
         UOJ2YEjTMydpt365LVfUFX279vFANx2fpf+qubct/2HROM6H7NvHxPWBdvqjHpPcuU6x
         NY15Lfi0K0fM1MTF93+UwTNl/WlZFDIGVgXcScuKWfg+EdCKg4p8XxxYarsvRKD+gzgW
         N3kMvP76S8jpz1uBRMr+8RhBX0cmPc9I/7fv44dRd7X9woZjV/0eqT89kIapxEm3k74v
         b7pZG/cady4CleXiCXPuWVKzZ+lEdhj4GXvoFxwSuqateIIDC6mnDEn/UrixNcfWi/mW
         d8MA==
X-Forwarded-Encrypted: i=1; AJvYcCUGmF6ZkWDgIrR2LyybeQEJmbHLOnJMyeofkAj5y643v/tBEnXmOu87StxL0LIYadt3oWj+Kd4mWlIwjA==@linaro.org
X-Gm-Message-State: AOJu0YxabwBHLnvFYS1gyQ4NKiLp0uJgDbTPM7XbGGVfAq//llvIiFR8
	ytAEBXcMMX3UpeVz/PwTkEGWLTBjM4x0lLsKh5wBCZfjQw6nD6jVrEhO+RXj051GQw==
X-Gm-Gg: ASbGnctDTVLnZwcjcE5dIifGhsvF3uItiPxMPNBP6BKO8AGgjF4hbQeEBeVStHJpVQ5
	Ju+T6OCDOufezrgWFLSDUuE1mDye/oPizx+tW4YBNohVbt9WNpuwFPY9TwNoVBruKfvg/cvAW3U
	c7x0ZxuU1Clk4x/8b8OCL1ay04/36QO6XxYRR5LvWyclTaCF12+i2XiC7jS8fCgX6z+E8vagrSP
	4cnJbSQsySXxtApNnDC4bTtnHd2p7WcPST065VwCLeFU+k7iKaxk8FipUkNgqafZdQaqtBA06cq
	cG0jnnnvxb75trmegaEzkh7OXvkhhvnCxFlF8Js43J03JHU1UYALKnmuXpF0atHHgtX+OpBap4R
	aBohQkWZS
X-Google-Smtp-Source: AGHT+IG+KnpKpR0jVp7IgTlzKnHiFoDpZhKDkqzftkZ4oAq96lTlohIvKcSdyzoZP3EgZGNch64EpQ==
X-Received: by 2002:a05:6a20:7f9e:b0:1f5:9ffc:274a with SMTP id adf61e73a8af0-1fe42f55950mr7582645637.23.1742580018455;
        Fri, 21 Mar 2025 11:00:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28003b2sm2072742a12.28.2025.03.21.11.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:00:18 -0700 (PDT)
Message-ID: <2529af4c-9341-4515-a697-8c0e4a1f2dbb@linaro.org>
Date: Fri, 21 Mar 2025 11:00:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/30] exec/cpu-all: remove hw/core/cpu.h include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bJYKqhl86Kso

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index d4705210370..d4d05d82315 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -20,7 +20,6 @@
>   #define CPU_ALL_H
>   
>   #include "exec/cpu-common.h"
> -#include "hw/core/cpu.h"
>   
>   #include "cpu.h"
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
