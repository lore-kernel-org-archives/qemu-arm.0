Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp796381njc;
        Fri, 9 Aug 2024 01:54:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYapHwB49H8a1D83OmJiFcJkxah3QuLcH+DYGlt0hy4HkGV0BYnTCJhZMNyrt2aHiCHmQeELvsjVwfoqBFi+6ydUo5CwSy
X-Received: by 2002:a2e:be85:0:b0:2ef:296d:1dd5 with SMTP id 38308e7fff4ca-2f1a6907443mr10873551fa.0.1723193696201;
        Fri, 09 Aug 2024 01:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723193696; cv=none;
        d=google.com; s=arc-20160816;
        b=SsjAKiqxIz+V+IjuI7cnRwe2i3lzi9suu9iK80h7H6iGZrzhJHYw3rciOBz8zdUjmB
         wbCuggvXoUphZzYVzrWsLMItXmgKd7g6sgubGbFwIFu0AcqeJ28UcsFWWqRIVmJFKgiG
         9uRzhMXvrN5BenDdLUnn+6iE/m6EpSD6xEsYx11KUHVTNxZuJwDQKt/Pkn2xKLYFFlB/
         bIsI05qUqdc8u1+vXMsehh7vzUz6aF8I2QDAoXJyy00TZOP1fLdtXn2uAJ8esLEaBSHU
         iq0epJCae7CpHpXH11st68uGbG7jnfb3mQ2XGeLlf3q+gPu9kho6MzzoZCq6Zoo172/M
         AKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rWcoeLFLhB6eHvwZe6tvRg6JNrJnc0vscCQEZ14clkQ=;
        fh=eXE+/dOSZFcog9AZAaWEiw4y10KwGM98OEOsv7s5JW0=;
        b=McNASvF9m8JCr+vHPUKD7fKptVCVvJ/8jFGKBRS22mC4g7ibF594Eyw0rDOTMqgEYF
         /L6m/cyy+5VvJQAP7SB4Wp2Q/isqmz3vChmzh48XPDDA3uVNEwlb1oPWB/g5DHvEI6WN
         8RlInAO1PD+LNHm9sF2fW3Lt9ICpnWEiWGsOANCzOqAIbyNedGiFi8Wlx0WT4BTyiR7w
         Pa5ceJXo1lGbenyy2cxRUciMTcDRPgltEGma/WMS1ENRPYWOOQYzCGc73I0oQYqdULXA
         ylQX7kIJgeXTs2GrUO3QZ1NeLOwjM8gnWwT59w/ROE888kJs+n2IO0gzjAmALHJihezC
         oR4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sz2MgsPl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f15e1ae327sor40815401fa.7.2024.08.09.01.54.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2024 01:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sz2MgsPl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723193695; x=1723798495; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWcoeLFLhB6eHvwZe6tvRg6JNrJnc0vscCQEZ14clkQ=;
        b=Sz2MgsPlAmFov3m+hOcS2RtYIKxBaBNff1oDNR5UVacHI/qLwWWwiqSxESZE7Tt7li
         kXH/eFfkDVgdQ2SCy9ir+ms0VRW61ACj61+sDKhThLZsFYMaCDRWkW4EjVkL0GEOawtu
         GND5rAwKDYWqAtxUZfw2xI4eGWinLFUfBxjVsymbAweF99/040xdf54SiC9RrPw3ATjI
         6joMFenyQi/FGfGlldohBwIGYVrF+ZtTHRyW/TpKKyzCUlhqnVU0OnF3HqdvoZBQ5ijC
         DCY1n1e0fU6HSgG6DO5WfbFEO/2H3WvhfepxPqKhuL4/cjMXiGZLOeLTcnRTrSqtt+Qa
         UBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193695; x=1723798495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWcoeLFLhB6eHvwZe6tvRg6JNrJnc0vscCQEZ14clkQ=;
        b=H1n2L2sesY31XdQUo3HJIJq9v1Mvrneck0L1pUurQcGIiaJsmfs235upI8/L15our1
         X1ee471A8CqvYO8fXuYITDjxvFfNu0N7t4PD7eJdC9iqE1GB+1plIoN8Le5ZQwe/LU9n
         YjUlBHBab9Oc5+TWC5A6snv7LKp/IfN2O5nvsjPb5UVioXgyhW9MXDLJ4vFLN1wmuHGx
         2nXAF4QwiyasVV/BLmDvqATeG/5mdoS0gCMWw+dgEEhlHD1xJ0pvTrbSAs7Ghq7DbRX4
         VZ/3Sjjr6gq8NNOI9+y2/yWbWO5zBp6G+08xpnJAYMuuutjCNdjWVKO/DLMVgip2eAFz
         yxqA==
X-Forwarded-Encrypted: i=1; AJvYcCUOsva2C4RS0ql3tL9bn0eqjEs5jRztOpl2Zo3Sd0/WoGIvmIClWcs7xjhZ7+habESalRK8k0Ex/MSjbgUD2ewb3fjC17sW
X-Gm-Message-State: AOJu0Yypt7x0WuE7In73nDW4+uM536q70wQB3ONKdzFvOop6IwxVk64H
	J5jNXnvNDA+REpf19zQY9JdDpisvHkHOmMC4TwKDkc50LF0t9PBE9pBO4+AaE35wNQ==
X-Google-Smtp-Source: AGHT+IEmNjKwYO1ar3A6LE3vIkL5B8s6n8rEIJ8g5EDK3RcvuVR7tzAxGxkEPCvA3ck/Ig7ROQVqAA==
X-Received: by 2002:a05:651c:2124:b0:2ef:2281:2158 with SMTP id 38308e7fff4ca-2f1a6c4bdbdmr8444651fa.1.1723193695346;
        Fri, 09 Aug 2024 01:54:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.178.175] (41.red-95-127-42.staticip.rima-tde.net. [95.127.42.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c77f078sm67322895e9.37.2024.08.09.01.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:54:54 -0700 (PDT)
Message-ID: <fc198ec6-d1d2-408f-b69e-d976d9576f03@linaro.org>
Date: Fri, 9 Aug 2024 10:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 20/23] hw/ssi: add support for flexspi
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 peter.maydell@linaro.org, marcandre.lureau@redhat.com,
 alistair@alistair23.me, berrange@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-21-tavip@google.com>
 <d31e1020-ce8d-40d9-ac8c-1dd8a0294073@linaro.org>
 <CAGWr4cQ0rv=83srF4NdJQ3ppP8mUu4qoCxU+nPtrBEL+TbgwqQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAGWr4cQ0rv=83srF4NdJQ3ppP8mUu4qoCxU+nPtrBEL+TbgwqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YkmZvHqWX2tV

On 8/8/24 23:31, Octavian Purdila wrote:

>>> +static Property flexspi_properties[] = {
>>> +    DEFINE_PROP_UINT32("mmap_base", FlexSpiState, mmap_base, 0),
>>> +    DEFINE_PROP_UINT32("mmap_size", FlexSpiState, mmap_size, 0),

Preferably simply 'size'.

>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void flexspi_init(Object *obj)
>>> +{
>>> +    FlexSpiState *s = FLEXSPI(obj);
>>> +
>>> +    memory_region_init_io(&s->mmio, obj, &flexspi_ops, s, TYPE_FLEXSPI,
>>> +                          sizeof(FLEXSPI_Type));
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>>> +}
>>> +
>>> +static void flexspi_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    FlexSpiState *s = FLEXSPI(dev);
>>> +
>>> +    if (s->mmap_size) {
>>> +        memory_region_init_ram(&s->mem, OBJECT(s), DEVICE(s)->id, s->mmap_size,
>>> +                               NULL);
>>> +        memory_region_add_subregion(get_system_memory(), s->mmap_base, &s->mem);
>>
>> Where is this region used?
>>
> 
> These regions are enabled in rt500.c when instantiating the flexspi
> peripherals. As implemented now they are backed by RAM, the full
> implementation should translate accesses to spi commands to FLASH or
> PSRAM devices.
> 
> We need the memory regions because even the simplest NXP SDK examples
> are using the memory mapped flexspi0 region.

Devices shouldn't access get_system_memory() directly (it is
documented as kind of deprecated =) ). Since you implement a
sysbus device, you need to export the region with sysbus_init_mmio()
then the upper layer (SoC) instantiating it gets the regions calling
sysbus_mmio_get_region() and maps it. Then you don't need the
'mmap_base' property.
