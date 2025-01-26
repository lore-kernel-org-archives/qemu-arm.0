Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2080442njk;
        Sun, 26 Jan 2025 12:39:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxi63dv2pqu6sGCEa+yZi+G+D6XZAkDxfkJwk6Nf+N5LI4yeqYdy3OvszbjWLfDAWrUIkro04ooejoqQ==@linaro.org
X-Received: by 2002:a05:6a20:734f:b0:1e0:bb0d:b1f4 with SMTP id adf61e73a8af0-1eb2147e6b8mr55681975637.11.1737923978162;
        Sun, 26 Jan 2025 12:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737923978; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ8rzOQS3GoN/e63A3LMDQqUBu6g2OwPSmGLi9sOcU212z5mCvuh5RbRQmpMEc7SZ0
         1wb6P8AHfY6FLdfKMMGzWLTqo/D+8LUfJBCG2wNyX4TzxsI2qpycZBCnwI8xo0/MqIOL
         AJazE6PQt5B/PT7s7vRlFdwCPb1/zuwjkTdWvT8EoRDhZ9qW3WyR5OkmhHoC8hOU/Up1
         7dSwfOHDPdsBwk/FmIuHa7xH4d40V88CZWm4/5TOjCm/AeyZLhzJ/5DWA93a88Mcwoou
         qAKMy+LM5ihax6M+T0Zwwfg/G8Ny+OEc2FETPhM+fTdSC5Y39j9Y1SajO8MdUzkzMpfH
         35bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MvjpRtAdSgDSzkYfmgpR6A/dBIEK8m+/NiOGB5xZ+o4=;
        fh=Sd1VyBLAuIDL1rL7OpOJmdDPRty67x4Fc1M/RaWbaE8=;
        b=UjiVuir7syY6UkC+iQpH5q4NCF2BL5bfLDU++cZMNTH94Jo3ylewcH4ysv1VyPG7Eh
         vb9eaOTelQCvBFblwD1u0UxsM7TOA4o9Uz7bIoCz/Cl8eKN/9KtfPU15xAjqE0N2oRs3
         fVjyRPaPj0TldttgV+/Pj0cnCJVfSLEiZ0KGUFJkCB/n8KJFf3BNB7npAud4n88KCYMg
         VVGK/NL01JaaPraGrTPVHxPniTWA7/jSN+nSPlj6B1huOr8hGB9R9CXlLONTpqLLI1Kd
         HO8cKdbDlWYAQnjxXSQdbqmfI+lkhMzR2XT+PyIseaILlTsZQLCLozeEcuMbF5VR8X7c
         dLIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRnm0aLV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72f8a78a927sor2865068b3a.9.2025.01.26.12.39.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRnm0aLV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923978; x=1738528778; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvjpRtAdSgDSzkYfmgpR6A/dBIEK8m+/NiOGB5xZ+o4=;
        b=jRnm0aLVPV5Vylblp1xwAFFt2e1oM9wpGWyzPB+V/5uQ8iBzpSTKIeMZczKVG18UmU
         JX8zPvp9gO4Mxqji/2Zlri8cI/MMrm07rt9tUlz2gv0Q7K32La2Lngt7uYLkgQ/FIjR/
         0qzoit4dbhCVFhP+XBlrlNkDHg6jBZxb6NQKO+n8KnoADvVMyRGThlutBjT6qbwZS0oq
         69omyVi9AWvHv8wFFBVez4IiN2cOXc/yhn1PuXuzD6kNUw+8Nsh1YfQqwFtQyj+bhjcO
         aZT/awU47R/fxmFLp0K/vfRHqlLviHlQPUIOTEUa15K7CNRFqoIhkM6H0zTmekImLuUl
         bmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923978; x=1738528778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvjpRtAdSgDSzkYfmgpR6A/dBIEK8m+/NiOGB5xZ+o4=;
        b=jKfZYwoGL62s01I36MtE9Zxz6FGK8oguCKNdz7ERoszQFO/Jgk1ouuZQLQ3JZW4YtY
         qMFRjPaB1ix94YdH02xllO9/UO1WrSuCVta+6BZ1Z0P1WEtuvAR/z6yabtkud1h/DFhQ
         umaOPD9KRbUg704UHnQnSKAxkm0kWVd0JuesWWK16uXhW0NG3E+QtxbKUwXLDsQo4Kxq
         Jn2DrR5KiKIeunP61ZotjWpKINE7tCO/MZj7xif1myRE0xu4vn1K2nPneWQ1kpxSMPcR
         EHcQUjU73MzQ2NL2eIu9UaP4JzTFRrqRKMpoO54VFYkGzNLnrNoCfi4m9cuTX/yvH+E+
         dyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTGrfG5+gGBMR4bjoLv4KhZj5EzwQDafL/HTeqwpx4nKyHXN9LJD01PsVHxxYdYe2dLpWM5GtGm07FUQ==@linaro.org
X-Gm-Message-State: AOJu0Yx8Obpfh+0t6zY+XZMJUMTAk3BJQ5PHG4fSk2NNU0oTPjEIAPFq
	ZcZq1kAtEcj46TaWi4LDlziT/zq1obdCKPmflFzUp2410+UTfOmaq/TlUPBh5Mzpbg==
X-Gm-Gg: ASbGncturRVgM+HC7KGlBGnlpaopqh1QCqyJsQpgKVMJaRz9RCC5NlJORBEuwu9CYsK
	MpVR0iAvkCsb3CPPPRBR7u7kcEGjq2EY5M48vNgOpcphIHHUKIhtgYD4FK70BTtcqDcFoZDQsuv
	LMIZo2xbA00h/9F9WF4p0x5+e8DxyjpC9+YK4s7uPY3VTCfX2LEjAQbwqQZz3l7pq2vIBFfISw4
	0aFPMaNYzuN1IKwyZ0oYeAeqCILQPJbtvfPyvnZMWDJti76busQ/cQg3WHv91JzVn5LvSfZ8upH
	1ek5IeCtqi+NCGOF7S0ekg3Efx3/ZvNFxeeOcXzTLr/CJgI=
X-Google-Smtp-Source: AGHT+IGm+ocgYvvkVWsUvSKMByg6rdOolrkUz0sM7TYcNoHM9kXNHQjPzT7fvMCLNswi1NUAED96dg==
X-Received: by 2002:a05:6a20:394b:b0:1e5:a0d8:5a33 with SMTP id adf61e73a8af0-1eb21480ef0mr65256986637.18.1737923977749;
        Sun, 26 Jan 2025 12:39:37 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48f897f8dsm4913213a12.22.2025.01.26.12.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:39:37 -0800 (PST)
Message-ID: <25ab2464-7878-4ade-89b5-1691f70736fc@linaro.org>
Date: Sun, 26 Jan 2025 12:39:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] accel: Rename 'hw/core/accel-cpu.h' ->
 'accel/accel-cpu-target.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-12-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: P8qWtuvFXKVb

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> AccelCPUClass is for accelerator to initialize target specific
> features of a vCPU. Not really related to hardware emulation,
> rename "hw/core/accel-cpu.h" as "accel/accel-cpu-target.h"
> (using the explicit -target suffix).
> 
> More importantly, target specific header often access the
> target specific definitions which are in each target/FOO/cpu.h
> header, usually included generically as "cpu.h" relative to
> target/FOO/. However, there is already a "cpu.h" in hw/core/
> which takes precedence. This change allows "accel-cpu-target.h"
> to include a target "cpu.h".
> 
> Mechanical change doing:
> 
>   $  git mv include/hw/core/accel-cpu.h \
>             include/accel/accel-cpu-target.h
>   $  sed -i -e 's,hw/core/accel-cpu.h,accel/accel-cpu-target.h,' \
>     $(git grep -l hw/core/accel-cpu.h)
> 
> and renaming header guard 'ACCEL_CPU_TARGET_H'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                                               | 2 +-
>   include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} | 4 ++--
>   accel/accel-target.c                                      | 2 +-
>   cpu-target.c                                              | 2 +-
>   target/i386/hvf/hvf-cpu.c                                 | 2 +-
>   target/i386/kvm/kvm-cpu.c                                 | 2 +-
>   target/i386/tcg/tcg-cpu.c                                 | 2 +-
>   target/ppc/kvm.c                                          | 2 +-
>   target/riscv/kvm/kvm-cpu.c                                | 2 +-
>   target/riscv/tcg/tcg-cpu.c                                | 2 +-
>   10 files changed, 11 insertions(+), 11 deletions(-)
>   rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (95%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
