Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2065458njk;
        Sun, 26 Jan 2025 11:56:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUiLmW0C2HTOCtOlDSUPBETqTRw/6iEbF8QfdtkKGQn+u+3lyYEdwDCUQ6L5vUkypC1Ix67HfDFAbTxxg==@linaro.org
X-Received: by 2002:a17:902:f543:b0:216:5002:7341 with SMTP id d9443c01a7336-21c3564e6e5mr616772095ad.44.1737921375809;
        Sun, 26 Jan 2025 11:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737921375; cv=none;
        d=google.com; s=arc-20240605;
        b=dHZmh6OwmZpRgs6H5ugGKFLqny7BeTym1E8RmdD72EIwErZMiXea1wBNbBSr/+KNIC
         DE1/VSZxL/rE+oPLHqpFdKAjRDkJCggLo4eAkbc/RrmoA52qVngVSrO3Jh9+68g3dJ76
         39RQgNRgL99YTl4g0+zzCIxh4rQ25hgHlTrjFHTTVn4t0CVKfwkXBGrRnjJ6Ooxkmeek
         y1M10RoiNFeJu4daGrHciUqjcVYWIO9aW4YJBxgQXFvjkJMZCLq/EZUHq4eATSiT7GR2
         esIPIL4qjBRkuJuJ+hKmZDe9o54AKiYlFwOBJVvwoXk65HZuE33oYPEO52OhfgCB2ITg
         tyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
        fh=PGhBYvLwmF03E+dSWKRB2rLJzSotRFdkd7aCEn6B14Y=;
        b=lJre0vfCSA1o82IDDhxhrPRBGr4q67n9XFW6AiYD1p/+mOZY8hSsb8KdZLrFvTUZZ7
         8qfrhUIptIwDBptG8sRKCARoD+ncM8W9Z1B/n+X8l4l1fz+fjZOGDdSgQoKU53XfaB8h
         qck8ulwIeRoTC0VeZavvu2zDZ/2NxusrLDSdwBKBTz61EZS1WAbmZMiv/5ueh2kZrSms
         eYKUSxOTDuyRyaVMrsL1oPjUr69eRf6r0aW1oVOFG+ffNhgETnBBvNhsfcHreYCy+CwS
         lvWR+325PEqhrl22vMWTVVzAIKYQruaY1fZtjwCOitSc8pddOIoJg6T1LLA+JepkXKIo
         wdMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tLKovqQc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da40e6d75sor54399645ad.8.2025.01.26.11.56.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 11:56:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tLKovqQc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921375; x=1738526175; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
        b=tLKovqQcpPwab/KJQq57582BZbhyJjSF1i0m4mPkkwMGt32SE6o1EIhS2XL7QbrsZI
         uwOLID2nEXmEKbTzsXt5XkWk4CbAXu+s3RdODwHvq0kcsgR+0yAvajF5YgGqxFcQQRQt
         iu7pKhUY/90ziC1jpNK6JwoDCM6XjvdbRDsHlf7r/UG29kiRPuRUuxmL490bnAzX73x7
         nNxXBaDOrhuWV//9kJC/AP6Cv+qXUSbQzq8us1tXyjN5GUsMqSabNSiWjj9s+xuHtyBU
         5GdDEAEgl/Xe9c5lX1sVcSsxEYYuGfjPCx8AkE8aMttNGTCWR74tFdoVuHvefdbaXGiK
         UtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921375; x=1738526175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
        b=UAjhj/5/SUSfHJSuW1qG8Kp3Bv2rCdHqvP4bYdPUgIoyELnwhMcKDlBjUVc888IGYV
         BVxTE2cdMezhAyuN3+iQE75IVkxXrqyPD+t9+f3egx2WHSayU9954fRLh6gvjzTs2YAT
         I9OkXihXyjdecVeVZwfiFbZKN5Er6A5FG4ktEfEIl5uoI+Kd2+7jYodqRZsyhc2OtNmB
         C97TvFddbdQSpTWosKvyt7EQI8WYpe1T5WVa9f9Q6mk4L9LbHVpQxtEaV8CtrjqfgQ+g
         9Q5OVyTKbkF7uQ9AN6qLeg8SoWX3yOAA1VSpb8IrIph2x0sgmxgHDQUgl/dtpPH6uIwD
         Ewgg==
X-Forwarded-Encrypted: i=1; AJvYcCVrXREV3DHRn0OVHrOSgDqJcnI8HPEL6yDoYSlEqvFhPxMv5sAm3hQXQ4EjTciXkK57EzSA3PP8z9rSLw==@linaro.org
X-Gm-Message-State: AOJu0Yx4wjCUeB5f8Der8KwuTkmmaBhhTrVbnAohXd6CNt5uWqRtBQa4
	cVK/UaYLeg7KAcm8gd9Mq5cX2AFBACUqELAgzkpBFcBEOyyCzD/AgpwILA5V9vrGHw==
X-Gm-Gg: ASbGncvAYN4pCuXwtgbeLlGSikZYJ5gQlTJua9TUvupv6bOXzEIjqyStzOMLV00UBEi
	jgAk0UO4nJlJ0O6aKGbUiHnLXWTpC6nPnCLaHYZmRZAvkJMkSRzBELFod0F5w6X5lX51SEk/Nl2
	JQrGemyXGRWBFgNPvY2fuDyjOKfHiKJnkuEsr/os3WnfhD3s9rWPTTGpKXzNp0rVs5czlvpxUSh
	lhNFhyUfyCQ6v4zlpFUyauymLtfNFSiKet+anFxG0jAjOWg5OD/iCnU9VNhRVaFsmUDeQcyAjCw
	UvWjNFyBBFonyWTiskVbaXA2D80jyCTcN4C3JwJyJjbkbnY=
X-Google-Smtp-Source: AGHT+IHO4WMUbjm+0GYB5uvcZM2pATyJHyNJ2uKrCdmerCTV19qq9YWTnaUhr9U9sZ/t561e+9mUEA==
X-Received: by 2002:a17:902:e746:b0:215:97c5:52b4 with SMTP id d9443c01a7336-21c35631dd4mr526655615ad.39.1737921375406;
        Sun, 26 Jan 2025 11:56:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424ef28sm48976545ad.258.2025.01.26.11.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 11:56:14 -0800 (PST)
Message-ID: <51770df2-ecbb-47b9-b5c5-a60decf0f751@linaro.org>
Date: Sun, 26 Jan 2025 11:56:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rYC+oGr4UAjP

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> Use the tcg_enabled() check so the compiler can elide
> the call when TCG isn't available, allowing to remove
> the tb_flush() stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/stubs/tcg-stub.c | 4 ----
>   gdbstub/system.c       | 5 ++++-
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
