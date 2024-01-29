Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp300836ejk;
        Mon, 29 Jan 2024 08:53:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG25NL/JDlKvRmdoddg3GD5XB3sSuSKoumLL/wbcWQGj6U/O7UvHexh663At7khkSHIa/wy
X-Received: by 2002:a05:6902:148:b0:dc2:3ae4:2180 with SMTP id p8-20020a056902014800b00dc23ae42180mr3410911ybh.129.1706547218016;
        Mon, 29 Jan 2024 08:53:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706547217; cv=pass;
        d=google.com; s=arc-20160816;
        b=fl8C3tkPe/n3+DzoAmXwSWOrC8o8ZbfknSvmafhk5E13d5faX/Q9A5kWzxlWN+IQFG
         9nR1Y2I8uhh+A2xIDsME4cdnZ2/F4G474rXrkxj8032hBnnrDMktFU0kBk9Nh/MjoOU+
         gXaEKPzbYI5g88c2mcT4dL9oQgBZFZ7Y56WzuRganjmCByWnnx1zNttmZ+vh45lVyEnD
         kBI+Q5wCeeF5a4lG18Kr9kLsxxxdRs1wswQtprvQQO0qw72bSrc3wBPY/JlTGqufTyLJ
         xJtiHZayAlZFtmAldHcSIqtcSLR0iuLWuFek846OGLQ7QZ6tT8LoqDSl+pqlF+wrmCtb
         TDdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=7zYf6iUNFHrfxMQpPNj1mXN6dt+LxrDt3+/kg2hLKwo=;
        fh=mKbORtPV9evsx5unJWKKGfepnvu+B10PJQezu9AX/No=;
        b=JmLSK9o9tG0JALbY8SfQZtkwpo0tw4gW7vKq2PjXypaVC2M/oZE9tOTjFnbtMg+Fzl
         4Xjj4ygx5rUXtUIvTYjC1qJut9mXWy1+trzLefUdBXAEeM0bUsIgwGVIlG8Cl0fhj/i4
         ak/yDD4jr3Gk2MOWWlo4mXJ92Rb/8NVzuUxtDWdrHob3rWQj1fnv+lqPYw1/TN134W2J
         1i8gooackYBENnkAFlj52BFTBUz+7+xR3JPfxRfdRmwFWR8XXMAKpXmYuPFfrL3YKbNz
         lUxl0KCct2BfpRQOG13kvex+Re9H+F7UTRLlZpymPmv96CBE2RmQWrQzRKhVIQcamR+H
         Rotw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqnnbCU8;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id bi12-20020a05620a318c00b00783c0f3abd5si8498232qkb.98.2024.01.29.08.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqnnbCU8;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7377-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914C31C22324
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793DE15703F;
	Mon, 29 Jan 2024 16:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqnnbCU8"
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C08156993
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706547194; cv=none; b=OUmhM4F+PJ0h14XhOthmrIyQwp5W59tS9Ejf4CFC8awgouPids+kXwsGh4gNIzZmV/rOhDByR+ymcO4je0r0qbRCUvK0fKMGeBJXNkuYgR/oxvgqOoJ2CwUOLbBojRc4IV7EYUmZho3qw2/3FdXZz7JXEWIlun5rfD1ZAvCtFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706547194; c=relaxed/simple;
	bh=nxUIBN0nLvbC5+IwHWEvU27KpU9TI+FywPen5vXP99o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgaX8AxgSMXrF9kKDEh8BICsu3fsjrfXPY5dCoIrPUZgM+LWOqONgTzWP1+oMz6Leao+FMSk9eVCrp14ZXLpVT9xOx/N5jjgerOLXti4vtJDa0etXCycjhw7rja7awCWiS4OJlZkA5dl4UaIPvBhQDdWM/3GJkUvg6dd3IHGR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqnnbCU8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51117c00a69so171135e87.3
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706547190; x=1707151990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zYf6iUNFHrfxMQpPNj1mXN6dt+LxrDt3+/kg2hLKwo=;
        b=ZqnnbCU8XlX1AACdQaazNk6i2U/eyo5BiEhJMMKLRUFA8cBVWPSaJXQy+/g6QFz2yO
         tOhO8tjtampvuqP7G8l8VMtXMWGOBvAsN8LP+Nw4Y0nR9GK+CJOMv67A2JE+a6nFpKIO
         CXviF69fyKGcN3tP7VXxDbkmtrF1Wp4cLNG4TYq1cqSeDVuu7j0tUQY4AtOeJx/dDXmB
         UFsOBAqsbDIbg/Wd+My76M76BT/cW9AMHwo0rfUxK8ak6YWW0Xu28Q9wh7XOj9RYmPdt
         qa3jxyXenJcZW+ayd1sy9d3mb0IPRpT927qEd3wQ4fZ3af4xfhCmuGGH9Wx11S3dvYMb
         2pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706547190; x=1707151990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zYf6iUNFHrfxMQpPNj1mXN6dt+LxrDt3+/kg2hLKwo=;
        b=igXwKR2DLJbH2xixpJ298bvDGeJl6YeEbT/TyFbTSYGw5ZiZkCUOq/IrzdOrWxQ4Nu
         G4GM29xASPRtL2vR2ZOGx2Kt0rhlIPfyuE6vB+EAUosSPWRbdnc2IbEggqRkcZI33rZg
         3NFhCkqS5UDvYzOZNbMECposnJutswPTNgWzhoPKDh6Kd7dLYJvqLupdXZJziEmo9iPP
         JvMvXXP/OAxvrQkt/dqFpxDIpCcPdwaxznNaudU9cakBaqlJYKMj5Qo1/w8IMN3EG6wT
         QLYwL4ZQ1PfLCWsCSyDky9vojVmDRIzwmBZi6UDxuYQfKfpS9AiNHMU0cEDpAHjQtESV
         Wr9w==
X-Gm-Message-State: AOJu0YzxWn1IAK584A82xNm9ykzP2YkKbKEr96NBroqMzBebQFBCRyHE
	wMrBdPiPKQ7Di1VA0Rcqps22mLVrK2sGsJFUi43mMYUKZ9Uo6aSXVUi+qbXKC+0=
X-Received: by 2002:a05:6512:1082:b0:50e:75ee:ec4c with SMTP id j2-20020a056512108200b0050e75eeec4cmr5201521lfg.11.1706547190625;
        Mon, 29 Jan 2024 08:53:10 -0800 (PST)
Received: from [192.168.69.100] ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b0040e703ad630sm14516047wmo.22.2024.01.29.08.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:53:09 -0800 (PST)
Message-ID: <bb4ed4c6-ecbb-45a6-af3b-caa4fe04afb8@linaro.org>
Date: Mon, 29 Jan 2024 17:53:08 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/29] scripts/coccinelle: Add cpu_env.cocci script
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-6-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240129164514.73104-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3Y7IESrGk1B2

On 29/1/24 17:44, Philippe Mathieu-Daudé wrote:
> Add a Coccinelle script to convert the following slow path
> (due to the QOM cast macro):
> 
>    &ARCH_CPU(..)->env
> 
> to the following fast path:
> 
>    cpu_env(..)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Changes since v2:

- Avoid templates by using coccinelle generic types
- Deal with uaccess API (by skipping functions using it)

>   MAINTAINERS                      |   1 +
>   scripts/coccinelle/cpu_env.cocci | 100 +++++++++++++++++++++++++++++++
>   2 files changed, 101 insertions(+)
>   create mode 100644 scripts/coccinelle/cpu_env.cocci
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dfaca8323e..ca3c8c18ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -157,6 +157,7 @@ F: accel/tcg/
>   F: accel/stubs/tcg-stub.c
>   F: util/cacheinfo.c
>   F: util/cacheflush.c
> +F: scripts/coccinelle/cpu_env.cocci
>   F: scripts/decodetree.py
>   F: docs/devel/decodetree.rst
>   F: docs/devel/tcg*
> diff --git a/scripts/coccinelle/cpu_env.cocci b/scripts/coccinelle/cpu_env.cocci
> new file mode 100644
> index 0000000000..5a70c2211a
> --- /dev/null
> +++ b/scripts/coccinelle/cpu_env.cocci
> @@ -0,0 +1,100 @@
> +/*
> + * Convert &ARCH_CPU(..)->env to use cpu_env(..).
> + *
> + * Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
> + *            cpu_env() is its fast equivalent.
> + *            CPU() macro is a no-op.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * SPDX-FileCopyrightText: Linaro Ltd 2024
> + * SPDX-FileContributor: Philippe Mathieu-Daudé
> + */
> +
> +@@
> +type ArchCPU =~ "CPU$";
> +identifier cpu;
> +type CPUArchState =~ "^CPU";
> +identifier env;
> +@@
> +     ArchCPU *cpu;
> +     ...
> +     CPUArchState *env = &cpu->env;
> +     <...
> +-    &cpu->env
> ++    env
> +     ...>
> +
> +
> +/*
> + * Due to commit 8ce5c64499 ("semihosting: Return failure from
> + * softmmu-uaccess.h functions"), skip functions using softmmu-uaccess.h
> + * macros (they don't pass 'env' as argument).
> + */
> +@ uaccess_api_used exists @
> +identifier semihosting_func =~ "^(put|get)_user_[us](al|8|16|32)$";
> +@@
> +      semihosting_func(...)

Hmm, s/semihosting/uaccess/

> +
> +
> +/*
> + * Argument is CPUState*
> + */
> +@ cpustate_arg depends on !uaccess_api_used @
> +identifier cpu;
> +type ArchCPU =~ "CPU$";
> +type CPUArchState;
> +identifier ARCH_CPU =~ "CPU$";
> +identifier env;
> +CPUState *cs;
> +@@
> +-    ArchCPU *cpu = ARCH_CPU(cs);
> +     ...
> +-    CPUArchState *env = &cpu->env;
> ++    CPUArchState *env = cpu_env(cs);
> +     ... when != cpu
> +
> +
> +/*
> + * Argument is not CPUState* but a related QOM object.
> + * CPU() is not a QOM macro but a cast (See commit 0d6d1ab499).
> + */
> +@ depends on !uaccess_api_used  && !cpustate_arg @
> +identifier cpu;
> +type ArchCPU =~ "CPU$";
> +type CPUArchState;
> +identifier ARCH_CPU =~ "CPU$";
> +identifier env;
> +expression cs;
> +@@
> +-    ArchCPU *cpu = ARCH_CPU(cs);
> +     ...
> +-    CPUArchState *env = &cpu->env;
> ++    CPUArchState *env = cpu_env(CPU(cs));
> +     ... when != cpu
> +
> +
> +/* When single use of 'env', call cpu_env() in place */
> +@ depends on !uaccess_api_used @
> +type CPUArchState;
> +identifier env;
> +expression cs;
> +@@
> +-    CPUArchState *env = cpu_env(cs);
> +     ... when != env
> +-     env
> ++     cpu_env(cs)
> +     ... when != env
> +
> +
> +/* Both first_cpu/current_cpu are extern CPUState* */
> +@@
> +symbol first_cpu;
> +symbol current_cpu;
> +@@
> +(
> +-    CPU(first_cpu)
> ++    first_cpu
> +|
> +-    CPU(current_cpu)
> ++    current_cpu
> +)

