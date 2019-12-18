Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1245885lff;
        Wed, 18 Dec 2019 11:45:20 -0800 (PST)
X-Received: by 2002:a17:902:8f96:: with SMTP id z22mr4560542plo.11.1576698320665;
        Wed, 18 Dec 2019 11:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576698320; cv=none;
        d=google.com; s=arc-20160816;
        b=BjrpqDCwQEVitj5k5zGKo7ehF3aNExsu667JNgoigeRIAoZiLjy25UfNdeqprGx5BZ
         83adPf5g94E0viT2FkgB11qJnV50Hk96nNIUe9XuldYmmpOv4kmo0zbWJBEZA8eKP2l4
         I3A2L7BVV79SS7E7KwmUIvBJXXMNkn5V69m2DPbeoVB4Ip0WWu+Pska6+7mt8aAzg9UY
         UDPfHhReZSoxMrpzixAdASK0nOjfEdMsi7z8Fkk7TflvscW7QaxX7aDJjyS0ElKF5mzx
         VfxUy81u6P75Hr6XgEp895u4//qcBRMUqxCKFQmj7lQO7iZmt5KiIpRW4LJEPRFTN2Nv
         64dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=5yWhXSDHqZ6Ptt+fDE9oY+B4VtUt/ihK9EgFsH/5ncQ=;
        b=j78aFYB/fasHmjlAbh61oNlC/3y9pioLmfPXusszM6fiHg0et4baoaNrPBit7D2eQ7
         tiHUI5KKtPlhRS6vRh2RVXYQ1Jbem8ANWrJyJfkhCCHhxdcRFk0WvJ5uz1puBauL1//Z
         ZbJhQev6+L/U9NP1dOaqAcOthRg59Wr+RHT4ybjhrMxmCjJiQGynqdvOI839cZOmYWL9
         7eGBRDz9RgIE0yKzqjyFUSap7aQrsq+PjfelndytP1nnHyIrO3hphn4myuSPgFzH+2+M
         ibqvZCiPJVNXShHe8CXkydwqG6OlP9GoigqGCWQAFgxVEH5L/HeZt6Jb7T5Nf+0JQ0b1
         GQlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTfqO40h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b6sor3634936pgm.69.2019.12.18.11.45.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2019 11:45:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTfqO40h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5yWhXSDHqZ6Ptt+fDE9oY+B4VtUt/ihK9EgFsH/5ncQ=;
        b=kTfqO40hjB86KvVFg8zQOwVp8sikOfTL8G2qFFhxggD2IQlKeyOAh0kV9VrI4OavMl
         r3kuVsAoY9IjxYRX6m6cPgj24bbRGXfUgL1pdY1jtKWSdn3vSAw5r9ZEjejQ9xrvtF+3
         Z/leHGxeWi0xIub3aexwz7404CYR/npQ4tKDoj9nNHD5lmC5/K1k2sEkdqA5GRLGz4L2
         Zg1qE3vFCrjm7Bq9zBAOM/Q0KuwS4CRPrzbWJhLxOy1zp1YcdiyjIuQpXVi8SlBXOPcM
         hbRLeXP9f14lhnyBiH7XXWLdsqOkz519mNOWejdjKFmheYzAiyq0B8VuGZbJjDDSwfX4
         gVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5yWhXSDHqZ6Ptt+fDE9oY+B4VtUt/ihK9EgFsH/5ncQ=;
        b=TuyiGsZVBJIUb51i3SjzPydhim4nP6R7U0LcYm8d/nyJqp3o7+j3OEJqBzm4qDmKFu
         kTyhlufRA7A+N1pcZuraKnN3t4IHDSS1/FaLekJdyi76GlAL5PKSEBEfFqKiHl75IX6X
         jWDZVSbtAVYrZ1Gmi1fjbdty/QEi5UIsbQUqt8ElmxVMFO8454cBMqFZkhbetR/W+zUV
         JMrQKuVz8agyEriFCUaulBznUCKjYcKA9qmcVS7Iom81P3kXIKYXSrRczjzYB5530DVj
         rVkn9ZV4GXnHAEdlTZpoXRQRaw+ucxzJ/gGxl2MN9SJXA7NJgtBX7qm/eB8U1nnNji6q
         swpQ==
X-Gm-Message-State: APjAAAVfT+t9tro40mporhpwsN7ANwHHTyHpWLe16NjF0+TBN5xrINpG
	Tp/N5jeJz7C+bt7ps7HF8S47owoz
X-Google-Smtp-Source: APXvYqxxlXTfq6IhZoBP10LCI+WbXwmAPsUr/eltnFJomiXaiCRM4tan07WAGjJVkhIFuqxGKE3WkA==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr4693189pgk.297.1576698319987;
        Wed, 18 Dec 2019 11:45:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445? ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
        by smtp.gmail.com with ESMTPSA id h26sm4665845pfr.9.2019.12.18.11.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:45:19 -0800 (PST)
Subject: Re: [PATCH v1 2/4] target/arm: only update pc after semihosting
 completes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <975db858-8470-d2dd-de53-278423984e46@linaro.org>
Date: Wed, 18 Dec 2019 09:45:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218180029.6744-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4xJYLX6hezed

On 12/18/19 8:00 AM, Alex Bennée wrote:
> Before we introduce blocking semihosting calls we need to ensure we
> can restart the system on semi hosting exception. To be able to do
> this the EXCP_SEMIHOST operation should be idempotent until it finally
> completes. Practically this means ensureing we only update the pc

ensuring.

> after the semihosting call has completed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 1 +
>  linux-user/arm/cpu_loop.c     | 1 +
>  target/arm/helper.c           | 2 ++
>  target/arm/m_helper.c         | 1 +
>  target/arm/translate-a64.c    | 2 +-
>  target/arm/translate.c        | 6 +++---
>  6 files changed, 9 insertions(+), 4 deletions(-)
...
> +++ b/target/arm/m_helper.c
> @@ -2185,6 +2185,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>                        "...handling as semihosting call 0x%x\n",
>                        env->regs[0]);
>          env->regs[0] = do_arm_semihosting(env);
> +        env->regs[15] += env->thumb ? 2 : 4;

... although thumb should never be false here, it does match the other instances.

I do wonder if it's worth inventing do_arm{32,64}_semihosting wrappers that
consolidate this register manipulation.

But either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
