Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1956755ejd;
        Thu, 18 Apr 2024 12:35:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXs1LSf6ik83XPm13oGX/VEILMBgAg8Wm04svm229kbcevfjZS/V8bMD96JturvE7+Baiyx1E3g87EL1ueJg6G8QhjzlnFJ
X-Received: by 2002:a05:600c:510b:b0:416:643d:862 with SMTP id o11-20020a05600c510b00b00416643d0862mr3508866wms.25.1713468907049;
        Thu, 18 Apr 2024 12:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468907; cv=none;
        d=google.com; s=arc-20160816;
        b=VkbUnjoIPkki3HLQNZrPTqh/I72shkifYiyG1RTEY96s8IX/ZY92CZndIgckmsk4fD
         nWrWnyDg3HIiPebqsKpBLY6MD/nAJNNLmEwLsFsLNshPDVLniffKueg4aE3Nrxhn9coe
         6BYUxRSTfkmKAOKfSR8jl5WKvm8jXxIOFg7WceVFkaclul9f/D0ZZYBVH/5YyKLPYpXH
         5nedysVCkqeuUTpZHONdPaNicptG01ipFLbi/39ZBnFbuIvU/CvKCYuigNqcs+XmnjwZ
         mRKOBIjXQZ/1+sYwy3LrcZiTOHioOFUBOlhGCiT5BlQAsll3sI4DzF9bwxLqgQkq3BGP
         HGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W3POXLkXOEegSIr+CiLoNV+e6nPI439irSo27x6wQYk=;
        fh=TiqOk019mUJ7Nflx2TwHlRlaHEZ8cDYBi8xDfbtFEh0=;
        b=pUHK0j6rYtAwVDK9UWLx+/m3gvqn0wpqWSKPfxUo+8qNMfjoCcTRfhZ+W6sWScKFNd
         OTous2DnE1tQhLpHsQjpGNJkEahHjpfjYO0+NA/h739vSZaBMBRQYOxfGX2NDI+IVCLg
         5Y/EwADAtQi35hJTYrJKECknDWgGgKe7OMTbWXWLR3qXj2BZTY7/3K+D+TanlLJ2NjxX
         GCmkLF0naczOhZEaxwUWuTutAEYZmO4Jy2fZP2wh4LaDh8CGCMl0pymUMRUqvTFebJ5o
         rk5xO5hdsIOBJ8uTQCFodg5QFlGjEEsqgMWjyrzMIvvbsyHSB4HFEulUJwU8aPEtDY/0
         Bgmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pz5gjT/y";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jw1-20020a05600c574100b00416b260dbf6sor987387wmb.7.2024.04.18.12.35.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pz5gjT/y";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468906; x=1714073706; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3POXLkXOEegSIr+CiLoNV+e6nPI439irSo27x6wQYk=;
        b=Pz5gjT/yMlHSSaeiH0i9C/9+l/d2+8Zfl1DsT2GVcTqkW41iGCM4UMISVXROqChwuV
         oVQxGEiH6yhRNguWPKEabC/zu9tSh6RIQZp3CI2wraw1/tyLhudcZ2PDBvN8eqWb3MUV
         u7V5Zcf5FhHXhDJxtWw6lsMu4CVyif72xjAijEs1GeYGoRtos7Z2eFW5qryEeBaTrnNA
         UCtm4RHG/HrpL3wi1Nd3Zc5TEmzGfY9s95fE/gG5/FSEihqWyaFCM0mtn9snP+rpsDMj
         Gd4altoX0KObLrvSStJjNDk3C3B9gLZ2fFt7I0qvu/S3SSmB/7JJLdv6WoZHFSCLrNaZ
         kB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468906; x=1714073706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3POXLkXOEegSIr+CiLoNV+e6nPI439irSo27x6wQYk=;
        b=rwcVUoEsayXSGlI93hK9AtE3+x7D2f7mQKeHWfQJfuYcHpxoqo6M+6CQ0ogpIyb0Xi
         il4mMM0v4qpG23uFxH3RORGVSbatgoTCGVo8GUd42zGsmvLPB61O4ygtkvPgfwiwebRf
         9n5m9O78cEqP6JvOBgEZ7QDzRtygdXTyM/oUVIydzJr8ditIKUHTj18iuUIkVegoSJdh
         ob+BT+VutOM7DybSUMPpnFX86u2mq+S4TQIeZWyZNYXPLe1khcrdoQjp1vj4Q0sFhA8Y
         0146bWGCxF35Xj+MTI9f00kTG/0diTU1iuI8HXfV3wrZqbBHi53SGd/J5cUDjc8gn/++
         +q/w==
X-Forwarded-Encrypted: i=1; AJvYcCV9FpLgtHuoIA5UtVmXKwrXXXAIFy+QmJ3GYR4vBjPV3veXW45rez9ZHHnREsvaD5d1KYuEJJYRSap2Q4dIbrDHbLOEI/F6
X-Gm-Message-State: AOJu0YzLrR3hJRaGn7CHpE7pxqt+FUMfM6zymSMXkjlT4JdU7LrcOlI8
	uC/uzsMGni6XhIIbmfvDY3d5VGz3gZx1E8EUp/oH8+1hFOyZdxhG89KoVhTI6e2FpQ==
X-Google-Smtp-Source: AGHT+IGMCzmEnXnVD4o31/C0VmlviDxbH19sLaVnp9L+a0G+U6wowTv37MaEj2AIuCUCXbCDxujMhg==
X-Received: by 2002:a05:600c:3511:b0:417:f527:21d0 with SMTP id h17-20020a05600c351100b00417f52721d0mr3869169wmq.0.1713468906643;
        Thu, 18 Apr 2024 12:35:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b00418d5b16f85sm3747438wmn.21.2024.04.18.12.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 12:35:05 -0700 (PDT)
Message-ID: <a75b20b5-995c-4de6-81f8-78a6f58d12b8@linaro.org>
Date: Thu, 18 Apr 2024 21:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] include/exec: Rework (part 2)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FBA422rssyJ+

On 18/4/24 21:24, Philippe Mathieu-Daudé wrote:
> Reordering exec/, second round. Mostly splitting:
> - TCG LDST API (to "exec/cpu_ldst.h")
> - CPU TLB APIs (to "exec/cputlb.h")
> from "exec/cpu-all.h" and "exec/exec-all.h", and
> reducing inclusions of "hw/core/cpu.h".
> 
> Based-on: <20240417182806.69446-1-philmd@linaro.org>
> or https://gitlab.com/philmd/qemu/-/commits/exec-next

And this series is available as
https://gitlab.com/philmd/qemu/-/commits/exec-rework-part2/

> Philippe Mathieu-Daudé (24):
>    exec: Declare MMUAccessType type in 'mmu-access-type.h' header
>    exec: Declare CPUBreakpoint/CPUWatchpoint type in 'breakpoint.h'
>      header
>    hw/core: Avoid including the full 'hw/core/cpu.h' in 'tcg-cpu-ops.h'
>    exec: Restrict TCG specific declarations of 'cputlb.h'
>    exec: Restrict 'cpu_ldst.h' to TCG accelerator
>    exec: Have guest_addr_valid() methods take abi_ptr/size_t arguments
>    exec: Un-inline tlb_vaddr_to_host() and declare it in 'exec/cputlb.h'
>    physmem: Move TCG CPU IOTLB methods around
>    physmem: Restrict TCG CPU IOTLB code to TCG accel
>    exec: Reduce tlb_set_dirty() declaration scope
>    exec: Move tlb_reset_dirty*() declarations to 'exec/cputlb.h'
>    exec: Move CPUTLBEntry helpers to cputlb.c
>    target/sparc: Replace abi_ulong by uint32_t for TARGET_ABI32
>    exec: Rename 'exec/user/guest-base.h' as 'user/guest-base.h'
>    exec: Restrict inclusion of 'user/guest-base.h'
>    exec: Move GUEST_ADDR_MAX definition to 'cpu_ldst.h'
>    exec: Include missing 'qemu/log-for-trace.h' header in 'exec/log.h'
>    plugins: Include missing 'qemu/bitmap.h' header
>    gdbstub: Avoid including 'cpu.h' in 'gdbstub/helpers.h'
>    hw/xtensa: Include missing 'exec/cpu-common.h' in 'bootparam.h'
>    plugins: Un-inline qemu_plugin_disable_mem_helpers()
>    exec: Remove 'exec/tswap.h' from 'exec/cpu-all.h'
>    exec: Remove 'disas/disas.h' from 'exec/log.h'
>    exec: Remove unnecessary inclusions of 'hw/core/cpu.h'
