Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp406778njb;
        Tue, 13 May 2025 03:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtet2/Nh9tmvJtigWmPOQEUQDmdDftu38LYBVNrJprjc+6xRbgEJAqz4eT9VA+ca94EjKSAtW0aVdIkQ==@linaro.org
X-Received: by 2002:a05:600c:8208:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-442d6d19269mr164919935e9.3.1747130812242;
        Tue, 13 May 2025 03:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130812; cv=none;
        d=google.com; s=arc-20240605;
        b=ABJL8obFtSSj1ZKwnRPEoQKCWmJpeXzTR2UOFiOyASicSej9Josr5nX58eKgaMyed6
         9A7yO+hexLqnkFoNsk29Pf7Ailq0IkUrEq5bwQbtMhW92KtRpywlQ6OMOGYY4XMY8lw3
         vEmzRhj7UHif6hGpdG7owNmeBMQst0KOvPeMBG+TvrNjhpV10i+WpQBZYJW1sde23dgI
         DUf8DxjETHxkpdZ/OA4WdA8uk1b1aeXRY3r8VrUXZfuEt6HYgauTpkdYCI0hDoqvHAv/
         KpvZdXftx+Iy+eK+47leVcfnhFp9B6FfkFmqOuqFuQQj9SvrK79fc1hB+GBiySHDVjR0
         cNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rkdCcb2R7zHmNwKVh1SyhRx36X2sK+MN/Vsql2qiJgk=;
        fh=0e0i1lHzm5isqrEvQGk3pVGUkD+hlNQIQbNPIMs0ROo=;
        b=XRxmGLz2BBry76vtAqskr+/gAZiCY7whfDRsekWvNUgcRNimsc3ipa/Hdg+9Bt9mt1
         HNUfOXhA92NgbIHp9FRD2sV9AVui87lGxhGWa1/6QCKpcpM92EmpA0keuq06U9cNt1Wa
         p1YqfhSrNhnbd3C/RjaC1Yh9G5WRvJU0wRcNaUcPXDwZWpDLnsHLhdz/JH4wO9xeQEYd
         rO9l03dm8sJc8VoTw7RQbDzqh2nHpfKlirYzu7mhxQXK73i93bAXTueK9wy5HHSyQZtc
         yEIoupcmnl8aD3O3msQOj05CDL6wmmpQzgncYZCWZk6dkM29EY+BG1xUdwbaXcuCG8xL
         ZJdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfZpxwkn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d6839ad0sor23867025e9.7.2025.05.13.03.06.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfZpxwkn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130812; x=1747735612; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkdCcb2R7zHmNwKVh1SyhRx36X2sK+MN/Vsql2qiJgk=;
        b=TfZpxwknN9im16jLffLYlUaFI1CDqp3YQs3kuV2KVwVSg0J77rUWBhf1I7BpgzwzA0
         ELwoNLuaw/qfplwWoDOuyIWcTy4z4vAN845ZSJoY6ma9YGMsJI/nP1eRYTO84HesE7GY
         TG7AYc/gLv8vgswgabwjy4xQIIy28Y1IPBPH8/kH3QWWbPk8E3/lsuRU0pWCRhXj+sdS
         PY4Au3/Q9+kwVjLH26pZ8+OY/M6WNgiIpHlQg2GoA9Qt+5nefDUc5DFdHg4m5mIaU6Vl
         FBzmX0mrzBVe8k7NdqHdhg7bBnYly9GpOkD61Nu2BY7p+/yreQGWIxksLW1fzWgg+uWS
         BuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130812; x=1747735612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkdCcb2R7zHmNwKVh1SyhRx36X2sK+MN/Vsql2qiJgk=;
        b=nTgCRmarMxIigtAQqBfVpIxWpbJ1UcDJWdJ/fpEUGpAyQWZ8ayTtiaQlfHtRAq/JbC
         4LEkiaMsB8SSROV46oXVO3Ex0hX7EuWOqlDESNnd6kFZGpZW17BrYHZ4/Fc+fEuedpFU
         KWsIFZq/u6bpau6o33PF7QZqU8AjoWTYeSvI29RWs9HnSUDWcKoE0iye/YEI+uB0yj0R
         RRunWx0vnz8V4qSixTBDubwYZw3RghAJzAWQM3hLxfyYUpWB7ZR4cRnUdj/oTFFMeAjS
         aAgzPCxmipQsevHhD6QMVmAt/3YUCNBcY7we7Bss62s+OB2uwqAzKAlmIAI8AiRXG1M+
         iNeg==
X-Forwarded-Encrypted: i=1; AJvYcCUSML/t0GuivThuSn2cqgPUGc2FoJ+L6m9DsZODA6QsqVDMYEdlnqKHSxJGrOZNfJNr63d3/FUG/uVb6Q==@linaro.org
X-Gm-Message-State: AOJu0YwNF9p0aB4hj+qqcpDtrVxqMChxryOWcpAnnpXLIAVtzY0SBnea
	LalJfKHQ9SDrOYicHeN4Bb1rvnsz/jqY9zdgonk1SfZvhqM+N0vyH3jMXR7dMvYPQLhbNAloBM2
	SAX9vsl2XSJM=
X-Gm-Gg: ASbGnct3LMAWMctEVKjcQlHsq3QkBZZiTc6kA9RW+0xRRjEkmfSY/vek+gRqFPV0zu1
	eGr8bbrrhqV254cH08FUaqqyGNfOP+XOD0XKnH+fw5wlmmYZPO6uWsQelSSEzr2fuiXAvvxbKpy
	qQ7UTmC9YLbMpP2YcbNNry/PAgws59uiGcB1mwM/3rBMZQRqqsvI7nHpbH+4Ai9gRHJx0WLZdv7
	sapTSpbzUHe0EQWcZEBpT1ZY7ah5rGoePVFpwi5ICuYg23PzY5+IcdClPwQ4yuCDhjmvMzQ//yQ
	1r9xV3us2sQR41Wd0xAzwycRPnNiGxwRNVUmwyGoWN3BOvHPZoLTKEovL2tKNcgpsDplz43/IKS
	r5Le2C0IZFwLT7H6nH08j/G7hrXZ/
X-Google-Smtp-Source: AGHT+IF59XNEL81dS1oW7vVGPK6GR9EouAGp2ff4bHfb3hVB+cV5LDsiKzGWKG5GHhh+AJSeeOHVVw==
X-Received: by 2002:a05:600c:4694:b0:440:94a2:95b8 with SMTP id 5b1f17b1804b1-442d6d6b65fmr152597255e9.16.1747130811611;
        Tue, 13 May 2025 03:06:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67efd26sm161229615e9.23.2025.05.13.03.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:06:51 -0700 (PDT)
Message-ID: <8a01f62b-f7f7-4ef1-babe-dce4cb536700@linaro.org>
Date: Tue, 13 May 2025 11:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/48] target/arm/helper: compile file twice (user,
 system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-24-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-24-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4U93G73v/rs1

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
