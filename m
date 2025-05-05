Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2344506njj;
        Mon, 5 May 2025 03:45:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHdImVkj+Qho+Ecck6g5tyDriXUC4pR6kRIS1q/f5K8r/Rwwp11cnBH/LpgR+C468oTLyIPGgNgZYo+w==@linaro.org
X-Received: by 2002:a05:600c:c1c8:10b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-441caf5f954mr13512725e9.2.1746441904684;
        Mon, 05 May 2025 03:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746441904; cv=none;
        d=google.com; s=arc-20240605;
        b=HWfFNhua2JZJLVhazL6anIrCwtcvDZOl7p6v+3yWgTcWdy7EhfNgpVnNLVjeXFeQX4
         Es6CenlfuHBaz0YFiktTLOIrVfeirPpAc62Iit4S5KyGiXp1nyF0pdyzSYDw2wswLrBP
         J2Pa5U8G7ShUsz8tWASNOm/+X4JZK2T3OwaYG9uGRIkp25e8Nd5RDkWzQOpsvSZHTdqk
         4dz70rLM/p6ETkQsRxZ3k0aSNzSP5qDFw9c8Gt+BJJZLzB51a4PXRx7fk+MBxir1toEg
         xK4ziG9FUdzYfoGgmC2W+v7pFmAE/dcAqE25Hqqcabz0x4He7rqoy8depaKnfTHOBKiE
         R0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G/Cs1RSBUq2rji5ltplqN53a1rlV5nJ16F1SyWjYlF0=;
        fh=1hed6zNCWbZCSFFD0RJ5f46RTDE+Rxr3d4jJAg9KYdE=;
        b=Ruqba0lMTlQO1WZYHEhxkecNxklVgZ9tSiwk1DW5WVxQzG6Ktjzz7DSUt0O4+QRtev
         KVtPtosv29EggdoyJGRw6xpqJiSfS94jg5KeVfQxcQ4zQ/ZwaWz5Z6CCTyg0ntd/LoeT
         jzAPTTB8bld8W5wIKzAGTVHENLXERi2M8GCqpu5GD2zmuKCp5xaN9N6OypcwvQM/cSgN
         0aoe0zgZ369minxnABn1saMaPTHgNgv85zIOCtFkhnDSBSJFYjvpjKdt40XATOUkuYzA
         cTURjNEg0EIqSYQpuoADoKTYha7qw4fIM46xhUXOd0IZMA31gTPrZHN8QLW+s8USYy3K
         +N0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSEFXoDP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-441b8a38d9bsor28468945e9.10.2025.05.05.03.45.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 03:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSEFXoDP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746441904; x=1747046704; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/Cs1RSBUq2rji5ltplqN53a1rlV5nJ16F1SyWjYlF0=;
        b=YSEFXoDPmGtNjOZMC6PgjY8vDTsZ/Y0/3hqFuKMJN8Y6YJdr+7uZ+6fUQYEL28LxZn
         nZ8xbjjgiauCzDn4OUgUdZkmjXUmSBlV2EOTV5LVccUDqljY53vcswi9pztCQi0Zn+PU
         8UPNRLvJJCfC65MWQI2kQ8uKU4iMsyNrbo/xcohAx3WkjI/gMeuK+3f5sesm9kucynU3
         5f6VhZY2a32w61J4fTw+YG/zhD6L0qRk7PhWZGzfGz0s8f8I2/RgMx0CYJwUMXunM/H8
         suf7XY3HgvP3N17HmxSu73SPVtVlCB4KEYdusAPD66mOQ8VDk2uqnM6OwT6iUv8ph+0Z
         QV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441904; x=1747046704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/Cs1RSBUq2rji5ltplqN53a1rlV5nJ16F1SyWjYlF0=;
        b=F8cl91skdCBGlYXVMFKE97VMAaBMkjm6rltGEemUxR2JIKcSup6oEIQRKNC8RUpA8c
         ZMoBzsX/gEprawMabIbBS27K8OCeAH7yPRdP0tSyYVDGRMVU1PklKK9MRlTFXbMIVzhm
         DQ2bxrNl7gKQrNq39eWosphxLjJ2yTVdbcs/hDC8k7IjieqWGC39yJbu6ae7Ztea+sgT
         4ndW2gG2m6X/flMs52/rXNpfXWPn3fGDfqpsPP5cRGGBQ1ZVeOBI+fCLI56wLGOvssZ5
         kT95IUhhOWEBTQSLyGfwFToIZA4OqCqGo8RedlBcgmRakYw+sOCHqVwTnspgKxCpibro
         +JEg==
X-Forwarded-Encrypted: i=1; AJvYcCVACqSaRBIx8oPQ9JMO+lroOGu6C06bOBjrt2oT7zoxJUgsl4+UolXBQFYvlCPXlzJ8DtNCM0fbyGXb3Q==@linaro.org
X-Gm-Message-State: AOJu0Yw9vWIRLyAZT4OzMxq8ixTh2ktRPHz+tRUy3w2KlYRg26+xdHwp
	f+xYzvRunPM2jNr/VM+r9lnyJ+qiMpzZhYoDcWZ3J4ZfrOzpe/5FDIx7cuIgsBB/DnMSKpGqp18
	LpFieHw==
X-Gm-Gg: ASbGnctu7kUuWihcUTAW1ltGAKnKMweZWAtHkXJc+tOywflDD2vmOB/RHccM5BPgVHv
	TzSubvscvQ+YzzO5xvh0hUrixaBj+1d9gjURhbHEsOKjg6m0jhe09WIzMlUY8SJ/iHTQpLBeG4U
	zwmlKizFW6QY/lFN0k1503UXiznG9OmAtJYV0y2vQyGoCCmeY4FayZR7FclZxk0s0Zeg4dwddFX
	SuONJx+XXr18AETiPm6uHKtQimzPNZUtTmwe5dwzHNCb/3RHaop5jQk+J7b5gAud97SQ4k3ILTM
	ylZPnLYNLqW6uIRNVLJjCBGpOGZ9gM7jObQAFu5HKNG+2I98h7t5TIzXSEG3hhXWsPa7n5IcuO8
	Et3SHMUm6cK4WTzaSdkpynsgjP85BXuKWUQ==
X-Google-Smtp-Source: AGHT+IFtgkvljn/LkdGPid9VuERQ3zMCyCG7gCBmTMCWKhbiDFjLcP/CnujP0cpUmTX1PJ7YhzH3jg==
X-Received: by 2002:a05:600c:1e1c:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-441c47d3b12mr68549295e9.0.1746441904183;
        Mon, 05 May 2025 03:45:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.194.152.213] (219.red-95-127-56.dynamicip.rima-tde.net. [95.127.56.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm9856690f8f.44.2025.05.05.03.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:45:03 -0700 (PDT)
Message-ID: <dc27e3f6-ceac-4e05-9652-28634d4fe73c@linaro.org>
Date: Mon, 5 May 2025 12:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/48] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-2-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250505015223.3895275-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jlDAlJ0B2Q6v

On 5/5/25 03:51, Pierrick Bouvier wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> CPUARMState::pc is of type uint64_t.

Richard made a comment on this description:
https://lore.kernel.org/qemu-devel/655c920b-8204-456f-91a3-85129c5e3b06@linaro.org/

> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/internals.h   | 6 +++---
>   target/arm/hyp_gdbstub.c | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
