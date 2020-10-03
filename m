Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2336318lfq;
        Sat, 3 Oct 2020 02:53:34 -0700 (PDT)
X-Received: by 2002:a05:6830:1408:: with SMTP id v8mr4930910otp.120.1601718814723;
        Sat, 03 Oct 2020 02:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601718814; cv=none;
        d=google.com; s=arc-20160816;
        b=xG0atn63sVVqNd37Xv7E8dNG48JzNRXofslPfO5u4d+Atn/6taa9IqN3hSSzieWReQ
         u8bmp43jT+qsbghacMim5sCwx3Ujbg6MYpqy7flDS+aauhhxmJ8CtPylOLU3RWWJZ7aK
         oOtbvdAy6bOl8nDqQCB2EZq7g7HdPz/ya07qAQpuRprciBvDV+C4qs15DC/AFupNdwmf
         oiT6T949tC49Uupr1Ev/9pJ5TF7ldFpHroeecnPIJo23fSKeaX6qY5QmgD3450nKR+M5
         pD0QY/xVJRTh0PEqLodIUcftGd65CfqzJ50Hr/+igSudPKcm/bSIK5Q7S7d5aKmalcJY
         yTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=obIunJMCwuIctwMB9KHyMjEcZAsycYX2a/PARzklzgo=;
        b=yzp3h1f/aj9BbVZ10gKGAAXhwmLcGKacc0VhBjHAx0SX0QCsYm0vWX1Q7Mbpusgn1K
         G96g1jwd25gbF5ZzfJDw/42SeeDwZ5cBdMxM6boe3UOmyfZpwAVgqAhLsvRpChSlGCQy
         dd0qGvf6iOAIEunZyp8ceEjSDeX3F0DxWu5OEF1CRABlQUfKD36xVObef/38BeA3/xPq
         JBn09H4bgqV2Pe7IpJ8cUm5a+WscFy4poY7xa5gpuwyikpuJGL/QzVXFv37wqH8s61Oi
         7kMOXtK61ulTUseaH+ZWu7QeB0GKHLdSsu3ydj0REGtd23pSh17CnWrsAseC0E71/hK/
         jWZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6AdNSF8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w18sor799518otj.98.2020.10.03.02.53.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6AdNSF8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=obIunJMCwuIctwMB9KHyMjEcZAsycYX2a/PARzklzgo=;
        b=e6AdNSF8ykaX1FRPeb0Av9rzGcI6O/WKjwfucJ0YWkM2PWqm4XXzoO8A7B/wgLAjgJ
         jwmVw7iegXUiPIuumoqUV+pbHwz5LqTgso0qHLSoAkMhPrcHl/EtqNa538JQbvcmsIee
         mYPulDS/O9ZsiGUJPi5FlBDl/N+8joV6u1R1gb2g14QDvj52ENpUkRvRi5Ka67umkufO
         8f/VJ5hNm8bl2RKyrR226RCuo5+kMTJ09UjHfrU26ZIIB+h/y311oK3EIPkKGRcD/yJW
         0U1v4jHJ0ovP3h+//HxR5TBDApmGa4/blsu4aium9WyQjaOM2muWO3c5v2VlxCUUkKGV
         bOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=obIunJMCwuIctwMB9KHyMjEcZAsycYX2a/PARzklzgo=;
        b=g0o5TNUbHD8gpe+DEtYx+6j+zqhTsLL3ZcW4NdDcRObocB91dUknVQBi4KHE/bcYMS
         Q4kO9PMjduh+5OhqmPP7UVF3+XAyOhWJ5U0h87tKStevbh82KxHBRYbxQwB3W58wgJy3
         t3x1LM+QBkKTckqQ7XE4bijm+DVn3PeUOBEP5dwHaIsUZwTPWgQTcYULAXWJYRuNwh8U
         D1KqHulFqcAi49USIQ9MShmbqwhOTlo7E9g+J+hcpUpyWqys4NSAsXmx8eU607l8gF+F
         563UqkF+qyEftj1J1fnDd4BOPW7RqLDQivIaKHJ21ki8kFqCKGP3rgw41cDqWR3aQ/hD
         n6FQ==
X-Gm-Message-State: AOAM531EmJRGpZbLON7R4K9W2vEPAVdYI12rHwgPCaQ6PezT5p9TBhZN
	MiBEheCOtcPPsFmo8XCGkjMiomrl7GekLe5CkXg=
X-Google-Smtp-Source: ABdhPJzortVGd43nIZrKjIRjdtZc+WQ0B+CpSCY952bMMF8IDrxjYl/ZrH209h+EJ6RbncHWhg6Nog==
X-Received: by 2002:a9d:5509:: with SMTP id l9mr5179019oth.154.1601718814363;
        Sat, 03 Oct 2020 02:53:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id c12sm1087623otm.61.2020.10.03.02.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:53:32 -0700 (PDT)
Subject: Re: [PATCH v4 11/12] target/arm: Reorder meson.build rules
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1328c0d8-be1d-1cbc-2c58-f17d078a1104@linaro.org>
Date: Sat, 3 Oct 2020 04:53:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: l1PpzvHjkzjk

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> Reorder the rules to make this file easier to modify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> I prefer to not squash that with the previous patch,
> as it makes it harder to review.
> ---
>  target/arm/meson.build | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
