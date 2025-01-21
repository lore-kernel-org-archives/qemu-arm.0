Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp186695njc;
        Tue, 21 Jan 2025 07:58:31 -0800 (PST)
X-Received: by 2002:a17:902:ce09:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-21c351bcf0dmr287491065ad.5.1737475111375;
        Tue, 21 Jan 2025 07:58:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737475111; cv=none;
        d=google.com; s=arc-20240605;
        b=LqEgpk5MdDl84tOWbXM5qWwvUHLgDBUnyAMNJjSysKnPCjN/4T82zccmLGW3bKGXx+
         IpfBZRdZqlXhUfbfmVHb2rf+jVKJaTA3Cqags1BBj+aytnrOohurbssBcYEjJPSzN75w
         LWWo7ll5thcTeyFlHv4UFbwWzcd8KjyIzCESD3PTYCMxGbvFMfPzLd7olb9USvqi85Bc
         ZpxurQkabZegGKjxQSJqkDRzQh5ZQ6IOKAHo/nE0cqGuk8ON8YbohKDVqVUnacJb0U2Z
         3GVM18DHkaOy3EAmpbJ6cn/8DTfdlGWzdFRbooaKfPNCHq7hsM7m/LjEHrFx11exiCTZ
         IIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gIrHZ0c2iTh3jXSdH/p5VWMnasPEDnPNa4raTYMLQjM=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=X1yhp7Vmut2AW7HjzTRAKBRr9RN+lCnaiLZIQ+I7gNneocmXRFkBdlp+fdet+kD4ra
         p2cGynTJt4Ia5MCI2Wd/SJt7R+BXimeuJ519pgN2nGTOcGUmt6LMOMHcFP6LKjHl27As
         11jKB5q8QWg1BinZpoSKgnP1mv88KOsa+ALJWbT5fGhzWXjFMnUo8vVy+ZRp9sEjgH+p
         pL6NACPCzXfQQWCdjt7NFqdLAXXxgnEnVgNjORD9gFEvHhfHpc9G4u5JJ2hU3tOltM6z
         mi0ufdCDyE1lef4wEjX9XhUHvFUkQjr1jrN8MiY/Se8x5XOYE8yTwXZvLWGnN2xSYA/o
         3BlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAYQkbZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21c2d0b5542sor63801675ad.9.2025.01.21.07.58.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:58:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAYQkbZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737475111; x=1738079911; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIrHZ0c2iTh3jXSdH/p5VWMnasPEDnPNa4raTYMLQjM=;
        b=DAYQkbZDJPpBQrKPilIbbrWkPMZ2oFF0fSidiozfCpHRZKdJ872YLKr1dN0qARml2l
         CF5RKgExHNbdG6Fp3vkt0kH+hlcTfcCD/17G+qd9tOGu0FkxiV/L4Cwi3S38StrWHMUk
         kobD7HmnFSt5IRVKXjBmjPBWjrNfckoXIu6ryyvRiemSTQ1nBzOW0vH7UnIeG9pQEk6n
         g+3RZ4D1gJWzLAWsTqGfmTleLCkRkeNqfDDxOIlY+zCoQ8AENtcelLAs8VXHO2T9Hw3B
         FwWiD0YgJ2JjiCxweeory6w25p1eXX4HfG3efu/UCLX5XkXhJBBPTETtblzPCS56uavn
         oqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475111; x=1738079911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIrHZ0c2iTh3jXSdH/p5VWMnasPEDnPNa4raTYMLQjM=;
        b=P6GIABvZNW0rCdFPgSXE39G8tuzmFQS+LFsbK6yOW2v3cjlfxvSFEyorSQHkvdhtLG
         zSmiGW8RoIkdFQEr7bypRUo33u5vKpqYv2abwJdIKzPtymSQ6wAeuhQ4MGnGUA0QAzEN
         WWXl+FZ4aOJE8+kFdBjwggQz1zUhX4rR2IcvtmuvSfC3jfM+zMCSiF3UiD+yBdZLPGNX
         y/KkgUSWgjyKoRMivlGMe+7EdPIOeRMjZ/hUvNrDG2vOPeuZyfk3/OCcbnv/D+/ont+s
         nt5LtorUc8tCQCtZfwXFESsswQU0TggPYi3piZEu02n6XUNyWfSCVb3Ft2+JvfKecU8V
         FQ9g==
X-Gm-Message-State: AOJu0YyhICJu3ZfGWWE1t4zm62O86zCBqS7ElJSwskzM0CS4UHPzBHlS
	T0+reSgMSWLMl8hQTQ9stZFBs0aNrBoCHbPQhFc5BSj7uXyh/i1+L0+Xizu+/XMCM2xu/H+loE4
	9MQE=
X-Gm-Gg: ASbGncseR+YVnmxXEL74Q0txgtOnFdt1eDb/4n80b6SxDuxYL+17yYSxYF4kieegHQ8
	ty96BwpI3b5gAVr0eNEIyGsKNVoAVKU3Rj+mmJdAAzYA9kuGjcEaKKgs1tPRcHSNA7KPClRbXaj
	HYztWw10q4x37QhGxGHxOe3tNwitNAgrdVTES01GYk8od6tvPfLEL9XkpWZ52wWBS+RJYeRzpol
	W5WHy7nwOTyEYNY2kLD5XQvmJI0xbtxkt6ANIAILVKKRIFCsqdXaoC8xAP/7f6AClaBu7YaVNq8
	vnD+F4nXhRqoahRyI36Cu4KbVksDgeha3zUy
X-Google-Smtp-Source: AGHT+IENF7fyUvzZuQGn9pHaJMAMFwBxfSlvSxjWqVLKwA8KySCKzjFvGEyLbkAhsRd6tOvtGY6WrQ==
X-Received: by 2002:a17:902:dacb:b0:215:5ea2:6543 with SMTP id d9443c01a7336-21c35546dcbmr274484125ad.28.1737475110958;
        Tue, 21 Jan 2025 07:58:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea2e29sm79601185ad.38.2025.01.21.07.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:58:30 -0800 (PST)
Message-ID: <e77acfd4-be29-4831-b034-cf95161b5681@linaro.org>
Date: Tue, 21 Jan 2025 07:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] gdbstub: Prefer cached CpuClass over
 CPU_GET_CLASS() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cvFQ+RwaAP0C

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   gdbstub/gdbstub.c     | 26 +++++++++-----------------
>   gdbstub/system.c      |  7 ++-----
>   gdbstub/user-target.c |  6 ++----
>   gdbstub/user.c        |  7 ++-----
>   4 files changed, 15 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
