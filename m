Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2597998dye;
        Mon, 30 Jun 2025 09:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0Zlho+++a4X8ykjheHYclZqDpzaJBZiXRiWxxe7qNoQ28bOOWavQfYCyPrOW8gha1TaQYFr9kvOrnTQ==@linaro.org
X-Received: by 2002:a05:6a20:2d0b:b0:215:dee4:4808 with SMTP id adf61e73a8af0-220a1292cb0mr23763729637.18.1751302135123;
        Mon, 30 Jun 2025 09:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302135; cv=none;
        d=google.com; s=arc-20240605;
        b=d9MNq29U3Qfc7Hk92oU9JNSXEcS4omE67GkHlKQdm0ZJx8n8BDrpUBHJM0xsI7RP6o
         AX3IGYCl/MG42rbfz2WAcjX+ZV+QUXkq5bttb4Wk0V785AR+qJyFaVZo41xEIvJhwoFU
         3EjoPeHqtwktMjZHvS3qlfxGSibtQtpHDoxMrMUWAczTfKSsTauP3WRZtBnUp6/jDKTf
         +9NREb1DH4KNl+BuaFnpwonv4eKnpJc6CqBnxWJC9tnGcpaO4cX6zZNpW6HCXCPdQBFM
         PgYHVlI+Y/4j98YR2TSg7KbN5XHdzjAzAGz/RGl3K8AT4iZXhNMbcKBWR9RvUpCIR5RU
         zJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=//9dJhOtE2lkY/XekYzysjuTbyZ1SmC5V7ccVcBGw+k=;
        fh=/2HYstyfudrLB4wN6Mgwo7NOeentYn3sV0qBFpkiFVM=;
        b=b7EnnKVT8V0dulnUOdI8K56o9OcuUHY9htyVjznGI69HaPjE0w6KpxVkbByWd0D5AI
         h2ISktxY2TLbE6u6zNf4tWPkwmcXDjvVzetLVp8BG8pxua0qyk6rLWdAfhIVKoWMn9jO
         e4YBlO0HXRAjbrsk4t+NdUcOnAYhnn9iVw402sVBkz8ktM1kSeHRhFTgTd9BfyNAOdgA
         EBsRxyoDky8RzVtrJFRpEri9P4iPY/NhL5/WP2Txe5B+AetkjBoYdY11tB6eM8AGzB3E
         v6zI+1hk8K+aPEP8YEtTlVcwkb3T/ELSU15PwwIGH4GbK14u1q5hH+F5q18nwEhqBtXL
         V3Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQ1cfy4T;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74af5413c08sor1628286b3a.4.2025.06.30.09.48.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 09:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQ1cfy4T;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302135; x=1751906935; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//9dJhOtE2lkY/XekYzysjuTbyZ1SmC5V7ccVcBGw+k=;
        b=iQ1cfy4T1Sr31MCkSblKsZZ3uA8rr9pZINOOZpNfrar+1Yf3c9kD51erjPMmMXNfJ6
         hv9Z68QlXB/N8UVEnJeNmxwVxilk6h7zL8JUd9d/6htA9Ija6KnD3Dub05ypV7Mm3i51
         81bhBcPYqGRLT+BWFuaCP+wljoAN8XjJX7scYweBwojng+8bT7K5i965rKcXRyHiPp/1
         6n1Uga+OXeqBpVsDcp14OEehwHPZL1EeI3ESCHF1uYxZgAMFY0SstRxBBgw6+Ned+HOO
         Ay0x088xy1Js0og3csCwVgUhDLn1zxmVsSgPdZ3sKaOAZVErn2kGjdP8TLFlNzOfsLL9
         hESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302135; x=1751906935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//9dJhOtE2lkY/XekYzysjuTbyZ1SmC5V7ccVcBGw+k=;
        b=am/t1zjaGnkABAz0RqZmIWZTh72lJyyl3tAztFf95jmqi4k3Z5su9RD7rBVOY6lEDE
         holOsft/uWQmNiF9TTy5k+tqO9BOYWdH0yGYuxOOdRNjx37J2Ac0d7UzN0b0oksoDa9N
         /TlY1y9l/i0cqjMgQysLjVX3cOfA0R5pESFuhknvz1i5Jd3k0TKA/3pEvxy5VrL7zktr
         riUkQgFOGdgCjeE9vsPF/9xMYM7WgCIsRlHXK5u+XAW871D+rAUUWsKqi1i+wcstBYrf
         IlTiU/dsy+mjXRuzspfteQ8EIbn8n4tu3EspOXgPg6yjKCJkcGWmCXVg3rq4C38negw6
         0/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1xJBYL5jmH6M+HcqQqGPitlITFRhniCRUNomHv7LtMSq5fqRxCJB4x5yI6IuGwySwN5VQ/c8vTXhdw==@linaro.org
X-Gm-Message-State: AOJu0YyR8zzkK4ntUluJUZmTe1mRmvDkB3X9wSAHDJ0Sq0WaSue1S0g1
	M61iuZhENCDNuCXglKN0smpuQm3xmMUObxNbAkiMta+SOjolNT7bq87tJVmGGXTJ7p8/uA==
X-Gm-Gg: ASbGncuemHNNryPldIM7n5HsX54nbUJTR+Y++gzBWCrxFzzY5fII8zMKK3mHsChQT4g
	vj2GjHpSM6E6MyVXPY9VFfS62o/YqYpbpC6+iggyxcPPeEE18rd0OHEWhc5/Wo6fbJ3RTd+vfLx
	EB5T3GVddW1MiP7eQ4D1ziOVTEF4vKZPtzzchxtgeqSKadESrmCDs33E1INgpMLtw0SXw+GhQ+8
	wgMKntyx7OqQr6WE8hn+CE7XEkX9KYtMkqGZaztN5TQZUAYv1XG4ghZU4SHUCin3HFP1XccXrSv
	JUAOsB9ap3Bdv5DeYiWCjw0s066VdkJEPAjMYJ71KHB7PkAyWl8vr0GA2z4MyqppIuA9nELSVwY
	=
X-Google-Smtp-Source: AGHT+IEyyxGjDtBxgLK1AjzuQEapewl+2cC29y9rfEYPT7XWohXerOl6ssa6LAWSPt+qNDhOpMXqnw==
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74af6e3f46amr21115371b3a.3.1751302134683;
        Mon, 30 Jun 2025 09:48:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e655sm9483237b3a.65.2025.06.30.09.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:48:54 -0700 (PDT)
Message-ID: <038363c8-36e8-4730-a1dc-eee360f6533f@linaro.org>
Date: Mon, 30 Jun 2025 09:48:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] target/arm: Only set CPU_INTERRUPT_EXITTB for TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-2-philmd@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: S8YAGzXD/jW9

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> Commit 34c45d53026 ("target-arm: kvm - re-inject guest debug
> exceptions") removed CPU_INTERRUPT_EXITTB from KVM, but it
> also appears on HVF. Better to restrict it to TCG.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
