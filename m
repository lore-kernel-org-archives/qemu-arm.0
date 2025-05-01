Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp423231njj;
        Thu, 1 May 2025 12:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP7exe/snvz9H6p1flQwcottLJXPtIKyO3xV2hqSbVn0K4q0ILDuftMQlRFO6Tnc62RkwtfArlrEbEVg==@linaro.org
X-Received: by 2002:a05:6e02:3c05:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d97c2557d4mr1598535ab.21.1746127755319;
        Thu, 01 May 2025 12:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746127755; cv=none;
        d=google.com; s=arc-20240605;
        b=IGe1mjlWIzoNlXKqCGfpGsyr+XFUfIGMmdG1BhNAUI5C2unVY55ULB3J0Qvyy9t8Jk
         KLoIFlAmi5muPDakWXpQ0nqv76PP9W9Urb7k5P6V4H8VbYgZirzlqJSR3O80guFqH3t0
         xtrdvmBf7JQuEEVTMg2owt3jK/6i5d7PEQKAyvOSmYz1eZ+CIPNgxtwpsYkyEDSgNZbR
         hfS83YmdrKKiCo+7db1KqcEUc2OJ6xVW19WeAUh4CvlL9ACDHV25OpgLWH1oWM6X2G1a
         enzKLEBQFAFfUBQJW/5KD1L2WzFO7jG3qqPpk0rD7i9OHugethlBGUKuhJQzGCTuGmsI
         DUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cOHSlVnVUYbsq+LzS7RdKhTmiXHT7BnynLD9UnP6g6Q=;
        fh=WftYHeqfYPdPiJ/TvKN/RsrhihzLkJaXgvFKmRZkJM0=;
        b=PqwtftADAAVxKXzEFT+kHQMzomG5nIlOz9itCMkuVy41+DsNL6gi0ZVVFbvLYyFkDJ
         XmI1c8oi6k4Z8KMGz49+0hbB6IcaWoJHy7iLERFxcWdQY8CV6s7H4dUMbpn/XpEHMa+p
         uogZaenYD1ZlaFNax84YY+1PgBNx6m/EfcmH9x6tnTKmTp/7li0U5ZRAIBqtWmGQIRqL
         KQ4nwXeM/fPH8wk9zIiD1CI4rJqXYX7i8V6pAepCq9LAyxt6J2Wh6MhoW55hjBEql8nq
         jHXioU2eVoGWwzIj0oe+VG08FSzS9rKA/Z9iE9teAuBgeJwJsFfXTXVZWnxaEBvOowJM
         wx1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlKsQDl9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3d975f7b637sor6282875ab.14.2025.05.01.12.29.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlKsQDl9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746127755; x=1746732555; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOHSlVnVUYbsq+LzS7RdKhTmiXHT7BnynLD9UnP6g6Q=;
        b=rlKsQDl9j4mkq/eo4Pd/teP0owX59oShBDqotpyl3NSTqYONhttVtEgxTnChwqbOeZ
         A3vibJ6hWKZn2Sr88QZtM8awjSYMaTqHkbTkf10Wwoe6XtpqGdeNrtNb37K6OHI72dLr
         +EruLj0HR6QrVpqR2m+FsTbna9DH1nhtvtElUu5ZS/nffwL1qTLNmKciTLhF3AF0em0Y
         Ak95EW7kAD9XeISp1Z+sZAJX2S6o1Fno2UYMLudCMWpaJZnvP/BXPmiVFax2Djz9RC33
         kAKndQFOY3UwV8TVxrKMGeIAd5J2RyXhmIyflEDY7+JIvxrgLzvfFdTKjRnspHdZkSLt
         Xv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127755; x=1746732555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOHSlVnVUYbsq+LzS7RdKhTmiXHT7BnynLD9UnP6g6Q=;
        b=CwJOzS1mgXxtvRqVYYZK2crmcRJTi3k40GCHpeS5MVt6Wb7JaEZs5ObVzsvcE/iEYV
         DrRfsQshG6GraGFxYR3dnA1CkPTGFcsfR4itaGDyWv7AM8ss+u4hxKOuExoOAU5DAB1z
         seXilZ+dHsYgzBnPJ+vGDLaUW7N7Cfzgi3nlKd3sxTEMa4QMBhHJyHe4kvwMPIEOhc8V
         3J97xhTOdy5HoH8StNd4uHMCeaBVprLuvH0yb+0hP0GvoxfR9KAJVo+Eoh8AjQJS6XM7
         NPq0+4XFw5yNMrF/VP+rNUJ1o36/t0npYAW0uOREsngDly4zjJtb18d2tTqovKHLnLkW
         ohWA==
X-Forwarded-Encrypted: i=1; AJvYcCU8lDJoqbvCKNST1Yy8l2z20oQNHGKFEz3ZxQPlW59nkThHt6fGB/v0xNNkSccaPgCW36KGLwnV82fWjQ==@linaro.org
X-Gm-Message-State: AOJu0YznJFRMHFje8zEpGOVdYIDr7+fmg6W0eEKp2+GzicE9M/aMyAEk
	TZOIR6amniCaTHKMowmpCf1rfM6FKI0I3IO7GNahsChLsQUra9OFNwdK1t1LGgTf7Q==
X-Gm-Gg: ASbGncvxEz30SfdAwXr9RcMehHxTVKdD60SCDpJAG4b2sRNNpaju0Esq630l2iWOmQi
	ZrZI/lV9InmHm0ebOUGlbLStDt5DrMp4Bf6XxbEgm4W+1STljmhRlaGPcV+SCHwrL/peJJto/Wi
	ChemOb0PYr9YV30EVQtxf58z0NCatyRs2WmdTEt2wF+6Q0EEH9Zw/KotHX1FUyJsmN/b43bc3Yh
	RGBFy9o3nYvIdOYbweSOfnQ/IiMjWElxTtQUOwhFHvcIeyHdfR9T/ZUHUhxHZb+t2RnMaWO1zqy
	pw1ciRERGDHtIxtGDj1aYxKMnqU0naTQ82wKjjrukoTXaidBgQTFpUK8+AQPAhyGBmmLZJQjnxz
	Kx/OCrYhxkZheDw==
X-Google-Smtp-Source: AGHT+IGmmsBx1v0Mc9NmngwCAaVLMxSI/zjfAdzKAyEaHpmHH+kM83IMv5j4FaPz2DvLozh56NJhYg==
X-Received: by 2002:a05:6e02:1a85:b0:3d5:81aa:4d0a with SMTP id e9e14a558f8ab-3d97c1705e6mr1486405ab.6.1746127754958;
        Thu, 01 May 2025 12:29:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8da518sm12648173.16.2025.05.01.12.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:29:14 -0700 (PDT)
Message-ID: <e9c82559-77b3-4e5c-bcd1-05e39c8c7dea@linaro.org>
Date: Thu, 1 May 2025 21:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/33] target/arm/helper: expose aarch64 cpu
 registration
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-22-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-22-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EvSeaW6M4osq

On 1/5/25 08:23, Pierrick Bouvier wrote:
> associated define_arm_cp_regs are guarded by
> "cpu_isar_feature(aa64_*)", so it's safe to expose that code for arm
> target (32 bit).
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
