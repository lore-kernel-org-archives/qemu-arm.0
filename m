Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp543869njc;
        Thu, 14 Nov 2024 12:48:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTS5TQlYKo3M5EvQoUFw7lfjJAQbTS/SMHFABHOoF+XC8hbDAJ/2XJXDSY82xEkPMxFsOS7BmX9c5pwQ==@linaro.org
X-Received: by 2002:a17:90b:1e41:b0:2e2:e6bf:cd64 with SMTP id 98e67ed59e1d1-2ea154b5755mr412426a91.5.1731617338472;
        Thu, 14 Nov 2024 12:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731617338; cv=none;
        d=google.com; s=arc-20240605;
        b=bBXQGgGgA81v5uUVOCHYNFuK2cV6qi0vEH5MC8LW0Ih+rkOZzJaPkBwOP5FL/XGRF8
         awScHTYePHkgoy/2bmBnybYd2yr+G660UEEslkrIqkRXRTDcNmoLm6AjF3PEWHS1Xv7M
         8nUvcoBTfa5IE8h+Ia8qp65U7Efn+ebf8dXMfUn5SgvKcltKVJQXhH2zBYYSBjh6jFLQ
         rutpdJcyio1PK3lg6GP8Hd62u2gddTyo68cHDPE/bMcyNRJvyZLXj8vrT2sDLzkb7YO/
         hiOlOeRmTZlYmxScHG2jloMJTS7NwQZ/MXSZiHeYx0lGJjFU8V2VaurRHrrKHFiZyi6X
         wmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NvT91xuPxiPPi83Z5rvcALQMp9g2aGeDYw5FZ2UVvgA=;
        fh=V5zm0jNq1jheaLtycm4NCH/OSdO7OAtwHT+DZwjw6zE=;
        b=BeySVrc4P3BlY/49dTiP6s6kAQ9prutGSrnpZib5T2v820iX7vWM6pSQxG3ft/NlOt
         Nobjs+6V6WmmvLPhb86TjB9vrAvX40HXbo8r4rIHnE9IqZLKrKHHQVQ3MFikGO88DQyZ
         so9ECJuX3OXPDI+FL27V55MRiS8b7WWfnTDKcky2Rw6UaSMFDG7v5DPXNzp6svPmaMFf
         CIHG+2NsjM9WsFY46AY2zDSX/6idYOTFB13Zeb0OlGUe0zKIMbHvtuBxXXH1TrMj5e5+
         N9fng+bdsDs3ARwUSQ64dkVW9mBzHG6pNMIeAVufqy1U0vfiDpW8rfOH5rpGUxj0g53L
         Dyiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vo9lCmLE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea07e6a859sor1462779a91.1.2024.11.14.12.48.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 12:48:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vo9lCmLE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731617338; x=1732222138; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvT91xuPxiPPi83Z5rvcALQMp9g2aGeDYw5FZ2UVvgA=;
        b=vo9lCmLEWSM93zIDNd6ubsvVGdvNyztvOmSLUVqlbCIR/AoUMVKj0kopdB4T7rqfea
         hpiETUJg01pRxfL1fi4ib4w0wyZgHIeP92bxD51JrQNyAoGDbfsKvw0Ey2eqNYYj7Lsn
         X0Yop+TZ7ROsRBHXCiyS9ASkESXkqFPVj8MT0sMhpoRS10XoNviysEeuv15iz3bqn6Nn
         LO7l6KEgeFwc1yNV9vl2DgPR6T0XhBxKttk5+czj5J0to+OxLEs4Fdld6FRoUzEwOE4y
         2S3PVuVrvbOopiCRAsyt9HwA0EkKk5vQfPcPOE3oxSSMQfSZ/RcWjI4i3Qe3oVjfSeDT
         blJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617338; x=1732222138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvT91xuPxiPPi83Z5rvcALQMp9g2aGeDYw5FZ2UVvgA=;
        b=cazkB3drpgQb2rRK9f42eC/sDE3zTVZVPvKiqbtnFCZPyIDpvLc2rISup3TZgkCEEq
         4W5QFPfevJhaX60e5UWOjvbrGybCnEMoaH0latho2e8Q5YG6FUtmqL3IQHEXG9xf6nwl
         Y5D+sahq9735B4xVgOnPBQ16snLR0e0WnmsGYr+E93JL1NH1uo/rHCYZg5oz+cXE2dbA
         RVbC01vCSpbqBWZMRxDxX1D2MnuSUy6O30K4RTrHfhK+HtG7kabvo9GeNxudUueq+tjh
         bfdPzQQy7v7GAwYQKE+bVyAPu23Zs7yTyadIlvKKFHJ023dyn13D4E4el5WJaeCPkRVg
         b+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCURRd46+1ooXhJ6t0Hk4jh3XkK0upSzwTtPpB5QailP/rW3n93xkwjk/jQvzlsXlCI3Cx1GXowAhd/VmA==@linaro.org
X-Gm-Message-State: AOJu0Yyfol47D/mFGUgpR/BKJam9aub32Hs96n/LmWncyGK4PkWX1VeW
	aLsWRioREJP+4wjK3uQuaTwSZKFW1lhT8Aulw/MnGRbVx59w9ETsO22rVjN9BnqM4A==
X-Google-Smtp-Source: AGHT+IE91X7Fcv7dxFSDLh9EGDMQ7wgTgogGy4GFohsdJZGpjj6piuiO4JPRxltr2nHCoXNPK4VLlg==
X-Received: by 2002:a17:90b:1c0c:b0:2e2:e2f1:aee with SMTP id 98e67ed59e1d1-2ea154fc4a5mr343688a91.22.1731617337991;
        Thu, 14 Nov 2024 12:48:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea024ee428sm1731777a91.50.2024.11.14.12.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 12:48:57 -0800 (PST)
Message-ID: <a1db36ca-47db-41c2-a60f-59514b33b757@linaro.org>
Date: Thu, 14 Nov 2024 12:48:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] exec/memory: Move qemu_map_ram_ptr() declaration to
 'exec/ram_addr.h'
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
 <20241114011310.3615-24-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-24-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Mkr3uMpaNjwa

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h   | 2 +-
>   include/exec/ram_addr.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 9458e2801d..58faa3eb08 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -28,6 +28,7 @@
>   #include "qemu/notify.h"
>   #include "qom/object.h"
>   #include "qemu/rcu.h"
> +#include "exec/ram_addr.h"
>   
>   #define RAM_ADDR_INVALID (~(ram_addr_t)0)
>   
> @@ -2973,7 +2974,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>                                      MemTxAttrs attrs, void *buf,
>                                      hwaddr len, hwaddr addr1, hwaddr l,
>                                      MemoryRegion *mr);
> -void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
>   
>   /* Internal functions, part of the implementation of address_space_read_cached
>    * and address_space_write_cached.  */
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index e0620ddb03..c4f220ae93 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -73,6 +73,7 @@ void qemu_ram_set_migratable(RAMBlock *rb);
>   void qemu_ram_unset_migratable(RAMBlock *rb);
>   bool qemu_ram_is_named_file(RAMBlock *rb);
>   int qemu_ram_get_fd(RAMBlock *rb);
> +void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
>   
>   size_t qemu_ram_pagesize(RAMBlock *block);
>   size_t qemu_ram_pagesize_largest(void);
