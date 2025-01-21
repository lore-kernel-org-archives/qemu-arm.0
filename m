Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp184326njc;
        Tue, 21 Jan 2025 07:54:28 -0800 (PST)
X-Received: by 2002:a05:6a00:4c87:b0:729:1c0f:b94e with SMTP id d2e1a72fcca58-72db1b6524bmr24693204b3a.6.1737474868175;
        Tue, 21 Jan 2025 07:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737474868; cv=none;
        d=google.com; s=arc-20240605;
        b=fvHObyj5KvNgHworDfIrATF17qq2YdqhWExbzKcXMzNd1Jd7OPhEQqYVa/82LsKTum
         ZYIaFik0boRr//7mVoTAFkJ1jmYDv8ba41CTzfeUsOkQxuxpSnym9PXc9KLTZc5FKobl
         jeBrCQmdAsu1Xs6gPS8z/hp8pPX6dexFug5JhfrCyNmfLm+H6GvVNWwgb1Ojvp364pfQ
         0E1CIw0CsuITqUaYAab1QtiV9GYAZhlYPTbtVqIulviCnvb1ccultYSA//bbo09S61lG
         tzqgMr+1SRI3YS6E3+Bfq/3xjjSqgeEIZ4qxs3gH1aQcatrwxCAdH3dNfWlUw+m4T6xS
         KO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7T7Lo+NWflz8c7dlsBgFML2crFfO9+i6EFhjEijDDbI=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=O/k98/8+jNO3CaVXCXFFrq3hexjYB5ZsZB/KWmsWQRO1CN8L1fA4iq0DTcyGOiGbCV
         2G4gBX8luKOyeX/9NExSi7qWuw0k1WjCxR1U9Il0pyR2iAwHCergcWWJd9pCCB5JKFFP
         /IyPWHHUQDutInMhbBqEakT0Pfj6QmEDdBbj5qFQU7gQiIaVcSVzGGMKfF+3uBkpggK3
         GwBxyhz0muyfXUKBgmuFwKfWWhucGSK8fB6N8MxluhIx3Hm8p+oqc2ptIcY2apUzdtqJ
         778reeRFPql1B03XWvtA24r+xdGzpJsZOvsGjziAEWuavXP8+cD8vDEPCGAHdVFSkhzn
         G1jA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7X1Aa2B;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72dab9894b2sor5152659b3a.6.2025.01.21.07.54.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:54:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7X1Aa2B;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737474868; x=1738079668; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T7Lo+NWflz8c7dlsBgFML2crFfO9+i6EFhjEijDDbI=;
        b=O7X1Aa2BS0TloguLt6Cpr5Nle+OXKYVbUu7/jBbRvrwTIHH7sDYM6d6T5xxZHfBxQx
         E8RI3I1eMcqA3SEkM7NNvASU2M7Je9c6hBIl5Rmh41dQXTdsQYHKnhfIfAF0C7ikFtpL
         4XTI6/ZRi/l4k+CnpLCq1/Fn40FoR0N5W72GbpUuGeiMME1zeOdW4qQ0s51MhggHC51U
         mbFlI5pMKFAEl+Ets2G6GKWGG5nAiDWdsJfXS/bkSUuF2dr5lwc+v2b77y0opqvFPECH
         eFqLPP9zBlk44hOIw2f4sO4REvJusLZ07XFmb7/U1x47/d7ofP41vuOTEHB/FPKsi85Q
         jcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737474868; x=1738079668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T7Lo+NWflz8c7dlsBgFML2crFfO9+i6EFhjEijDDbI=;
        b=dn6gzczmUPm7sHN4dHPqwZr0N2v6usJTi1i3cCx7f3OnDfKwCRVdDJuAcGQsD5Qg8Z
         fMlUsWPkYRIIKo00DvFzfqsLhy+UTijWMK0Smx19/Buh5Cth7F2zvd3CS8P1DAepoqLg
         T0mREOCidQGMo4CsG0pX4eToMg3RNv+9W3k2H+DnYQ3mMQe7ZHwAeGz5luVm9mvxOxT0
         s0V2cHPUCC4JArMpeMHXqc/i2Cl+WRM/Ct2eSKo8BvIlU8XrpJirGUGGhFF9a+hv9yGp
         XjWe+ceXfb3jXdgn84QgRKKNGXV/8601dYlMEjDxLZ/9xbVls8VxHo4djDfrDXuL0J1w
         GjwQ==
X-Gm-Message-State: AOJu0YwmFTO1ZO5aBjuzDJL9cx6wJxoEwPS/jhqf1JHqn7z4bwSAepnq
	OeXRfJE1MmkBhmbpUyTP6mmIKWsK2xiEue/ZKEiluuYf+vOs3mIepmMppfqRCz+YFQ==
X-Gm-Gg: ASbGncsMxrXpghtwr+5x4PjM/5zDwKxGkaw1JsJ4EAtAHhNNPIb89XLtQmYM5Sd0URJ
	Os44umIgZZr5sF7v2q2+08oyoh00i8AbKSU64X/rmRzAUe5T9vR1ZAUbdz8X+wFZ7d9GNMA1nJU
	uXDIciBRIgOdCxdIalgozHvahK0BZD3sCVCnLO6rea5S/e21lY1E/3zCE81lBLAx6kInV9MAiah
	GEHTzqAfMmXQ6NFc8bTfhAGdP70PktcHNrFBr4dClHJSenWyGtPuh9nUBb65PbHaST/EPZHdWRp
	hrVRxA1JTIrLaheovehpqVeMoU49ZADuIheu
X-Google-Smtp-Source: AGHT+IEo8Bx4nU0VT9Y8DFX78+JCD2OxkjMunLwg8Wl4r62vj65l9qrdXRAMOz2bwhV9ksrG1HvkNw==
X-Received: by 2002:a05:6a00:66cb:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-72d8c46e973mr35040674b3a.1.1737474867697;
        Tue, 21 Jan 2025 07:54:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcfb92d9fsm9057698a12.46.2025.01.21.07.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:54:27 -0800 (PST)
Message-ID: <e819ed08-db0c-4c6d-a70d-38f17b47846f@linaro.org>
Date: Tue, 21 Jan 2025 07:54:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] cpus: Cache CPUClass early in instance_init()
 handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dxCo6H4U9mzc

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> Cache CPUClass as early as possible, when the instance
> is initialized.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c         | 3 ---
>   hw/core/cpu-common.c | 3 +++
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 667688332c9..89874496a41 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -134,9 +134,6 @@ const VMStateDescription vmstate_cpu_common = {
>   
>   bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
>   {
> -    /* cache the cpu class for the hotpath */
> -    cpu->cc = CPU_GET_CLASS(cpu);
> -
>       if (!accel_cpu_common_realize(cpu, errp)) {
>           return false;
>       }
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index cb79566cc51..ff605059c15 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -238,6 +238,9 @@ static void cpu_common_initfn(Object *obj)
>   {
>       CPUState *cpu = CPU(obj);
>   
> +    /* cache the cpu class for the hotpath */
> +    cpu->cc = CPU_GET_CLASS(cpu);
> +
>       gdb_init_cpu(cpu);
>       cpu->cpu_index = UNASSIGNED_CPU_INDEX;
>       cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
