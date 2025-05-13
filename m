Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp425002njb;
        Tue, 13 May 2025 03:45:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP1i5MJN/dtZBIDjHUi42PkM+svRjEAOzuAHK8oiOl/Nqo6xuohKyBrxipE3wq1k/IrNGS5mwfFRbMGg==@linaro.org
X-Received: by 2002:a5d:584a:0:b0:3a1:fd60:883 with SMTP id ffacd0b85a97d-3a1fd600accmr9754098f8f.23.1747133123231;
        Tue, 13 May 2025 03:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747133123; cv=none;
        d=google.com; s=arc-20240605;
        b=OUICAM3Gmxw2PONFotCXGYcj03006Y7HnB+x3ECRIxypMoc+bgUFl4H954f/COtL2v
         6E6Ch0kG+nr5jv6zHtNUS0tTLGMpQWBy83PqYQp/+MCTLlJZpZkbZMYKoff6PLfBP4Gc
         gdNPDb3ywog/RbgBTEQQaRTuTpELnVGIaJnlHShamynyWV37EBLds9ZrsRca1yuga8bQ
         tmHHXaNbPcrEg+5IZyVk0cxWMGWL5cyO7/EySKM/IfauCmSRHrtJbmSaA5lXjL7VVl/G
         RGgyMFtrsIglDr9ddme6McM5oNgkzVXhKODXoWFgxSPkDJbGJx5KL3rOnQsJKwO4Ft1X
         2qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PQV+7dB2bIIgAZan0TAPV10yQXx671Pd1FMs0t1F1F8=;
        fh=aAW927HHgCs7Y9jKjTQH42TKGmUjqRC+NT+6E/8F5eo=;
        b=X6AjF+TUzGfGehxO6o/UittjbQ9/bpboaV+KdrhN6IvwLdfb86HiHyAx9QtclZ8mgU
         MwDcT4z1kliaNcp2rhM8lM5GH02hFl0yn29iX44aoGZNikETpsFOO0jrrg0TZHG8NjnZ
         sRLwXol1AwYQtD6mHtvmaxTXLxGxXf5YwaKk4Jt1nUYoU2PTm8nGtP3V7zdy0vrvkj9U
         4wYRoHI3j3uWXue8D54vmzvFdfh2erIgYzf6o3Kz9AJjT5bGDo3+MKCWab5Ri7P4auiB
         6tz/eYQVOGsMrb8FYFaACZ9uYRweArW41lBg7GTAj1YnP8FV+Z44Kg0wtAYRraYq7eqq
         WARw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyH2hyOZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a2079fc2b7sor1949069f8f.8.2025.05.13.03.45.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyH2hyOZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133123; x=1747737923; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQV+7dB2bIIgAZan0TAPV10yQXx671Pd1FMs0t1F1F8=;
        b=uyH2hyOZj1UO5nCh+rUI/6XdsAO/OhEXuHgBirJ1gxO8qgnBN6o6uz/DOpuxAuYGtu
         nsb4Ga5ZadiZolc3y8Rwl8TANWC/M5Lvw8ZBvIRqamkuI4LcfsOwGMSsZXCwdnYTg7uU
         tspjepfYFbQRJ4akr1/xMzUcttaiPU2W606bMK/QP6uCTGd8RbYOrHLGPtkz7/Ug6wyD
         7WXTmaocFkenaZFOqG5iV7wx0W2i+9hesJekzrPH63liM1IlXBI8THhBprMZuXbH8phu
         qFJvNObnalouONaicX1Q/6YVZ7rOBTYXvkFaUnXEhLMFoY7R3Z0vRkfxjkdA8tyOEaIb
         Gj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133123; x=1747737923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQV+7dB2bIIgAZan0TAPV10yQXx671Pd1FMs0t1F1F8=;
        b=DeAONP//HHBtJIuKYLQmwbdGN6jl/nLEb+BpPMeqqAf9M/14Af4HsSDWvRKOZNWmHA
         Yvv9zvbNDySnCsajk75WbllVGcba6veFvUDF0mvp1C54TfsNU0Uxk0BQQGYUSxiS7+Hh
         DhQgqvTaSdwHENxTIKcTbiAeomwwYb0boS/fVrEAK2tidtXbbLQ3LJSNcFscFN8+CWWc
         4miS+R/nD8O1HVebJYE6TvZUnCECU18DlYvRwgsQxDl344n/qL6TRvl/0uT19DoJMnaD
         a8TGjvfQbKh0MnIQ0zPZR3MOvMjquryWHmRwqAx5KgQ85J5uHKEamkoCdmxeJmAWT2L1
         yVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXARvq6zs8ZmEkTzdgsmhZy4UaWwx9SjNPUUH8qp9PpqGeUd27ZGiwFbI2Y9K2JcBAUINWHbkZPAlgGyg==@linaro.org
X-Gm-Message-State: AOJu0YzauBpC1a5foEdJntFXAvLrwByZIZ3Pz/F5OZTRzGjf18yxTzVb
	qqYYdTDvAHEQPaBNbvQer0hOBmWv/YFa9Oqh6y6KZYp6YRcrOJqpVY/ARxFcESS6uw==
X-Gm-Gg: ASbGncuTI9OOskmn/5NN7NvetaChMCBF7seUym7EWiXZWAxEId87IJ7LBS/Gfh5LtfF
	Z1COMPBVnF/GmPisbhR0KjOD+gJNH5zoEVxvkdfcbrt94FiMpKHuOw3IlGzZSERS5Iui6CdXWF3
	tBCyqbcsIMihEZ2RppIclntvYZeLJg9gA5jWPqfpPz3ZA9Ule1E5OJqCzOJRQcrZUHK1OSLIIjq
	B2l0LfptrFSLyc+Ir0ta9a0ZI26ibiIScQSp3jWZTUR6ThRoLxJSz6YenoLALSDFrNeeq+4+XAe
	q+qGLm6jMFDCt+ox4aX1mn6RSW5ZUU87W90Y9jIN6JKqCx5f332RIWqU3pu1gXYSckCiSxjH4Mv
	ctu3UwGAsssBDnA+PFg==
X-Google-Smtp-Source: AGHT+IFw3reMRUBDNST3NUnjyeu+5GloTdANb9TuZA9BtpnHKd4htSDtQ4ZnlvnFdVWLpaXAtu6R8Q==
X-Received: by 2002:a05:6000:420f:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-3a1f64ae792mr12932586f8f.50.1747133122641;
        Tue, 13 May 2025 03:45:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm15852338f8f.65.2025.05.13.03.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:45:22 -0700 (PDT)
Message-ID: <7c4e1607-98d6-4040-ab78-317fb6a58e68@linaro.org>
Date: Tue, 13 May 2025 11:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 36/48] target/arm/machine: move cpu_post_load kvm bits
 to kvm_arm_cpu_post_load function
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-37-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-37-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3TbhSItDoh+D

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h |  4 +++-
>   target/arm/kvm.c     | 13 ++++++++++++-
>   target/arm/machine.c |  8 +-------
>   3 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
