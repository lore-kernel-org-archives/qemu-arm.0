Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp478249njc;
        Thu, 14 Nov 2024 10:42:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWY20wf5U053Umo1zDhvCpQlaATOvPsRQ5PBdPq+wONHPg7llNeyqL/UnrR8nwAWzm8CDT2i34sRlbBQQ==@linaro.org
X-Received: by 2002:a17:902:f690:b0:20c:ecca:432b with SMTP id d9443c01a7336-211ab9b7ae8mr155094425ad.35.1731609764205;
        Thu, 14 Nov 2024 10:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731609764; cv=none;
        d=google.com; s=arc-20240605;
        b=IdHjopqOhvz/swrDj0T1sRtsYOyFnuo6sSfzJvUaoQTyvJlF80vQguppDuygDUs/y5
         +UFlwG25i83fG+rAZlJNpAwfHlroy5yh+Ui/yyrKaRy+kxK/cyfb3cA6Cjppa2K055V2
         S6Yq8v2jLdxORWFqxLC0dGdow83izBWfZxBdnPgWm1SALhD/B16wPtw5KEe5e0iHtr+B
         mGhzlDsW9WPhKuxoF1jD70pED1NYo09DVi3YSdJIziEHAptC5em8rza8LyBNFUaxpSqQ
         AOO2+rJAyqxA+FN5KcJOQdF8hJ+7aARD8ZuigM/ADtCVRgKQu2eQY5ZdQ91eMcPbWZpg
         +CEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mYvKfeZwSvOCLGHaePLaKvv3G49elL110USMSeKSzDI=;
        fh=gPZ2Rx9pm+2zKfS7bcOO1eKVXTkggJlaWozkiqo0YAA=;
        b=epQ5ucWp+svE7jddhncRGkCrjYg4b9DrUL2PkmF/JvU3JU65JdnhX4qTZFnNwj7kQJ
         AKfzqEf5Ztw32NM7BwcdWV/xmBtkxp6VUMMdKDrdRX5x1oN0n7imGAdY1D7GoceyaTF3
         +P79dfub6YM1Bcfw+kX5VKendu+uZR53dm6fZUhkEuohurCMuGpGzcbxb1xPL/ePt7x7
         1SYtIf+IVAnHiaaNJytk+CLDzF52taR7Yqo43mztfX3SBZJhC3Gqp4JhKJqXwhI+yMut
         PHFD2NB95ImDIEZ0H7PSmp8Q/N1KWrhoYkRvLcNovjutAuyFBmtQpLsTVitub3sY58Q4
         PE8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j3mH1Tva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7d4d79csor12878945ad.12.2024.11.14.10.42.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j3mH1Tva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731609748; x=1732214548; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYvKfeZwSvOCLGHaePLaKvv3G49elL110USMSeKSzDI=;
        b=j3mH1TvaZUPRl9LIzD9S3ojBaKvMqiaRu4vrrTKAUyhYDZFX48h7gnl36oB9EVD4kC
         wY5ChxBO3hjwa0AdKIlHC8Fs/pTqFZiVddVIMSJmV/IO7yP+q0xFRWKRbZVR6BbsRLCL
         n7FT8PUP/EfHSc82THlWmHd3ZMWGneMydw79LSy1BGey4qQsvUwJip9v/KFV8K4beai0
         utoDh/MXlaVRPtnjH6Ni9Q3iM0FB789DyOYNwBM4xQe3KR3Q9ZPCVVgZsViHQq1aljqC
         mOEvakWjFuHEC51RUgkwGT3BSvmpR1K+Lcg0IKa3qyolMjezDeOWV+YqJumWsKIbfwU0
         4lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731609748; x=1732214548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYvKfeZwSvOCLGHaePLaKvv3G49elL110USMSeKSzDI=;
        b=NIMONH3W3QOjtaWLePOKU+UG7+neYk9zU4XXwFTyYaZzj3fR7nyKnk5eh4XiXxDAAs
         UP3u/rxP2DQBk0WcKuVo49IrYt1EgXPy50u6JvqaCpDL0pGDNJGcSuwSelaNqG6Vxwx7
         SamhLd1dLFFWlYilDKJsnqOsuvk9F5n89/uZWvnINvkcdwkvEm9IQxHJbe1QHVpEjame
         e1e65rLKIWm+wDMICNkjsEkh+8QeV4JR5HYMf+mKiQWBPn9x8YQ00Agzz6Fvmj8vlmVC
         uUKAFqfPt5l+0ZfezEVk14eS+bWyRZD2nUGJsQ3uhDH1sbO58VPInHlpMdSSw+HTR4wy
         CDEA==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZDoYaEe7Ld0n2i1G9+hhTKEHs/L6FljZkHj4P4JKYdJCWfHbaFUITcMuol1qfyuz0SURy9KrQKqp6w==@linaro.org
X-Gm-Message-State: AOJu0YwiouiUecmQZqwgkQlEBD2z5lgkyqXmDfnvupKf7rM1GEOI+wTY
	ixM+Qwmz2pYemZbrYVA9DLdfbebnmGQ5Ol3aln0Ptbtc5RSS1Qi6W10ovw6ArOBaeQ==
X-Google-Smtp-Source: AGHT+IGw1Sbnt0gFZ0JHPvOouF17ekOpSrNi6lra9+PlpTGTkFZtyG4x1qPPZzz5tm+HZYnAsBe0Iw==
X-Received: by 2002:a17:902:ea05:b0:20c:f3be:2f8b with SMTP id d9443c01a7336-211abae69b4mr146667945ad.30.1731609748060;
        Thu, 14 Nov 2024 10:42:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7ce9627sm13916465ad.161.2024.11.14.10.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:42:27 -0800 (PST)
Message-ID: <1f0c07f3-6306-4729-99b6-1b8607687711@linaro.org>
Date: Thu, 14 Nov 2024 10:42:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] target/i386/helper: Include missing
 'exec/translation-block.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: y9m2m2hHD1cZ

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> TB compile flags are defined in "exec/translation-block.h".
> Include it in order to avoid when refactoring:
> 
>    target/i386/helper.c:536:28: error: use of undeclared identifier 'CF_PCREL'
>      536 |     if (tcg_cflags_has(cs, CF_PCREL)) {
>          |                            ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/helper.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 01a268a30b..75c52e2143 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -21,6 +21,7 @@
>   #include "qapi/qapi-events-run-state.h"
>   #include "cpu.h"
>   #include "exec/exec-all.h"
> +#include "exec/translation-block.h"
>   #include "sysemu/runstate.h"
>   #ifndef CONFIG_USER_ONLY
>   #include "sysemu/hw_accel.h"

Hmm.  The usage there in get_memio_eip really ought to be using tb_cflags(tb) with the 
translation block found during unwinding.  But none of the interfaces we provide from 
translate-all.c provide that.

Currently, tcg_cflags_has() is in exec/cpu-common.h.  Perhaps we ought to have the include 
there, so that all uses of tcg_cflags_has are fixed at once, or perhaps tcg_cflags_has 
should be moved.

Anyway, just musing.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
