Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp186954njc;
        Tue, 21 Jan 2025 07:58:56 -0800 (PST)
X-Received: by 2002:a17:903:120b:b0:215:758c:52ea with SMTP id d9443c01a7336-21c35c8ca8emr220202105ad.9.1737475135739;
        Tue, 21 Jan 2025 07:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737475135; cv=none;
        d=google.com; s=arc-20240605;
        b=JapBQa+vU/Wo0FXYfs1H9On+zs9VetwV2nZZXWR95Ios1uqj5Bl00T2b1oXGua5/4X
         t+h0lvGoAv5pwHeBmPpJGKT5A1eXDjhbSzzEADcuqW3FwYwgnzmqAxRHtD2B2vPujc+Q
         spUlOPAmAiJNVTBAJTvxYP1eEB8dacHgl+qkaiEVd/5bDcsX//GpIAsmIqP4jjn9DxLE
         juH2wqci+oNWt2LQjxxwAOtpKEjhMhv/zEio3tKSRPLnadJckhhR9IKN2j2VtwlWX414
         Z9wUGAZL/dxQhksQR7CoEUk4Jd4hl3cCH4Wavlbkfum/9SQ6fTHnj+434Vkb5jR0uFKC
         Cn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yteJLDrX8z9NwzKuY0oEKuSDaISpzfgmtAaJccmDPHA=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=MuxTRs0c9LGqx4GKxtWhGn+yKpQz9uo6yb3xaGBwioALXXZog+h6PbHDmMZB/1xBO7
         pQs2LL2qrsZ3fCR5Tvf9kDDTaxAaxTkKbgrgseg8TA8JdFj8QsjtXo+5hBpCEPUjxTOZ
         cslTRrC69UdAae360TFJDaOWDLXfyU4ZZK6D9MNxLTeOsK+Crc2kxlhtuEL9OXGa3rcM
         o2YDnB/roTsTrjcc+mb+luQGKwfd+OK6zwAk6mDthrCSicjM0RaBGOuHc1RyHYCcBGtf
         f5t0tvMyJxplx4LW5hWWT1ga+HEEYdI8EsdAvd4ChkdFmylEu3YLa8EH5Ky1aeHU4orZ
         HWTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNgjiS1u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21bf438fc94sor66911515ad.1.2025.01.21.07.58.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNgjiS1u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737475135; x=1738079935; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yteJLDrX8z9NwzKuY0oEKuSDaISpzfgmtAaJccmDPHA=;
        b=yNgjiS1uVdsjlxkKupEWQeM2qVnV+HnRGUqprVPxaur3XcacQngByuVgYOvmZ1LZDl
         Ws7R9xBKeshdRmOrgygnD6gJct8VJBvef0VbZCQAqoKT/rDvTXNEBvMHkTucqFt7ZH83
         YYC7UfKf8igMjwg5UOwQdpxRbTSv1lK2EqStRhRcTmHy0qQ8Ak1C0625+NrVdjj03zjB
         XnsugTJ/WEPg1G7uZYCb9NJJNN732yn6TkIGq8v4oEWYazoClSKNfVDUFXt/ETdkleZS
         iTthVItXN9+5+CwXEYP5BVndnLPjn+VrtpHKicV+RiE3V2llAmTmaObgVMcDJnRsHpeb
         NCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475135; x=1738079935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yteJLDrX8z9NwzKuY0oEKuSDaISpzfgmtAaJccmDPHA=;
        b=r1RBUhKTl3cL4Q3H9Gq2kjJhY43oTXfQWTkOXeeb4/UTuWj/IALxSITyyRoBWuOQJl
         4w5M45cObTU89RIfI1HB4l4d3j2OoNLSqLTRmuS0GzXILM8/x1Hv/t6HRUz2AKk8RXg0
         kzmRSOyRsXbD7MqTddtreEhP+AXX/Rc0M5RFTin3ALU57XavZUl1d90KWhsby/1g2rHl
         iGbtlMSPiilkwrj8l3Kwq0hY6IL/Vmu/hls4UNM3hztfPkq+ObiGLwPBo+/si5ZyBdMX
         S21ExmHyt7/+wXbPO+8gpt2Q9lCHuTQOeJf3aq0EAL+Yg8MmKk3nMoOGrt37+k5ZnIfh
         5ITA==
X-Gm-Message-State: AOJu0YyoqLPGUb2fC5vFSqsyD5fjySkftuNk2MI7S/SSE76RSE3pvp+7
	znKJQxay7JImojEt43qn5ilqEx3DEMptbVrpQbFUKQHlio64I38t7/sEwwIST+obUg==
X-Gm-Gg: ASbGncs5eRp5tLKVrzAAlCSTwxvD8zwyT6ju55oxlqCQsseetS1EDqqcMuFDePYF0JE
	2ND/zUUei7fHVIhU8oEeM77fg/itPTNVWGcERgvBpeu6Uq5nxWDZMy8x+yhtE7+6xbteHVpjgHz
	IqElIyuYkmLbFB4KgAkcV1hOxhnbHB2uMf1BLWqby6sxa0bJIwPU9c5+UJ5xU0lqr3N4cUzCl8n
	k/VyRmNkul5KMp11tq/Oz+1IRbSEwjRe1aFWUP0IzP4js1jaXGjPP3KHp3W8rzB+nR+ONaY4BL6
	CZMrhOhOR8/iRnI/Aul9/MLntVE1mlagROw1
X-Google-Smtp-Source: AGHT+IEgkZegK0SjTi3xJ/QmVsXTX0CJDEJNjPOImNSs5PJyZnSDQ7Baf1VP8jj+SH+D5dtqce3KmA==
X-Received: by 2002:a17:90b:1a81:b0:2ef:7be8:e987 with SMTP id 98e67ed59e1d1-2f728e4841cmr38388767a91.12.1737475135233;
        Tue, 21 Jan 2025 07:58:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bb2cdsm13277304a91.34.2025.01.21.07.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:58:54 -0800 (PST)
Message-ID: <b28eb9b2-750d-4297-80f3-36fda01ba94d@linaro.org>
Date: Tue, 21 Jan 2025 07:58:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] hw/acpi: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Lfdb8PIxf9Dm

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/acpi/cpu.c         | 4 ++--
>   hw/acpi/cpu_hotplug.c | 3 +--
>   2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f70a2c045e1..6f1ae79edbf 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -235,8 +235,8 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>   
>   static AcpiCpuStatus *get_cpu_status(CPUHotplugState *cpu_st, DeviceState *dev)
>   {
> -    CPUClass *k = CPU_GET_CLASS(dev);
> -    uint64_t cpu_arch_id = k->get_arch_id(CPU(dev));
> +    CPUState *cpu = CPU(dev);
> +    uint64_t cpu_arch_id = cpu->cc->get_arch_id(cpu);
>       int i;
>   
>       for (i = 0; i < cpu_st->dev_count; i++) {
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 83b8bc5deb8..aa0e1e3efa5 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -62,10 +62,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>   static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu,
>                                        bool *swtchd_to_modern)
>   {
> -    CPUClass *k = CPU_GET_CLASS(cpu);
>       int64_t cpu_id;
>   
> -    cpu_id = k->get_arch_id(cpu);
> +    cpu_id = cpu->cc->get_arch_id(cpu);
>       if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
>           object_property_set_bool(g->device, "cpu-hotplug-legacy", false,
>                                    &error_abort);
