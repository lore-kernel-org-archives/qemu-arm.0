Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp276159njj;
        Thu, 1 May 2025 08:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5xrgRzV2z8XddPb6A82cC0Mq0vw5PJWl4LvDlty6jNni5G7eP6LSxR714Dmmo3aXyuTNViGg1k7i0Zg==@linaro.org
X-Received: by 2002:a17:903:2283:b0:224:191d:8a87 with SMTP id d9443c01a7336-22e0842bd68mr37886085ad.26.1746112762231;
        Thu, 01 May 2025 08:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112762; cv=none;
        d=google.com; s=arc-20240605;
        b=KgtvPRjTZKFs5inzrZMfd6ahu8c1Mbzc4EV3PIT0xHGuYy/rT0iJ1NZjggDcyPoufe
         eAjSrrrjnjd55q7Y6eDN4rfl8s4FBlbKF7mi2UWGmV42OUU+1JtykGwfvBj3pwS0kjq2
         E+Cw0iTFitWJ5EsnQs4EhTj2G/KQMwm2RLS2iFdyF0A4h1j2ujzos4nVYJ4GAOz3Uv4O
         7Ec5zzB/76gcHCsMtbj8seegdgj4YCutX4sErdtI/LbFddUhtNqzERTmp0vvva///4vZ
         ivWABDufokULh1UivwCCykKMXfRXh8dzDc8qIOhYhEJmnElg21+Iod7MB8K6J6CN4BRG
         7cCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EQkfl6PWb1kXCkfaF29URjOl94N4FTQyK7ZQw8qsJ8s=;
        fh=LN/9brE8y9GXtF38mQn2DXYALWYYd0fJmr8sQKbzWVQ=;
        b=X9tmA5zKI6tvDj+XuA17Ei4egVMq9tdPkjDwLmY75IWL2rIhBto/FlCL+4rOVr4Jrs
         TlcmoE/rWqTBH9pM1dFVv9e/bz9i1JPo4KuNhf/J2ZucAuUc3gO9BHDxHV5XP3PNVB89
         rjZ5BylpsWB6P8SSjb6rLTdgOQ9MbDcy73AbwllJl5coBK7FHn4eWcUodCNDofmm3LdJ
         ig7PAELu4U8nb4AMqXELAnlHuDMfpMfOu75v0bq+9vRfAzkJvvlWAB3dmMb8BQ7VT8Dz
         MWkk1kJ4S6hwkgrUtLFdYXv+FGkmFXDoT6BpcDSlH4J92PyDdC1Lwv9h0z3w7VuUiYX6
         oS2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQvPAu2M;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0bdc8sor7091695ad.3.2025.05.01.08.19.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQvPAu2M;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112762; x=1746717562; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQkfl6PWb1kXCkfaF29URjOl94N4FTQyK7ZQw8qsJ8s=;
        b=LQvPAu2MvEVTfUIjftzdDoV0L8woehVS9w7EoKDJBvYt/EofunFLdIH/MNJ1A27K7n
         q+NV3JPGwLOVVs7V6QCKlGUTz+FdPnd8MS3DS4bw44uD2I608CpsqAObMipaljByc/RZ
         qxS2UjPYxlNCJu79JP5DU3JK0xoOe1+JfSqUoVA9PnNvaUUXaXCFGGX3Hc+XD3pQLRvl
         i9K3T1lK+tcjLae4kw/h0ubCgrGGI3PC7hX3Va20jAzYJ+HaPItoFFmDQEnQpbHVaQCG
         Jeu3qDFVU71NMYTrxyExonoyH/7ppZkHGqI1CIb0PoC4A+z1r5lAVxINofY2ev2xKIJd
         3jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112762; x=1746717562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQkfl6PWb1kXCkfaF29URjOl94N4FTQyK7ZQw8qsJ8s=;
        b=PQtk4tYhtpCozgcNmDqVUEXt8ZduEXUvz/7zeQAxJYKEG16oP6LJq0TZT+rJeOHdbj
         QCCPJkvq2W2ELUKu4kIpZH2uLIty0Y+SIIWrziV+5xBdJKfmFezRIfIqXE+rmCZn7jgO
         QJBX2yABPr6LPosR7ytxgo8kKnys8ULQTmET+S30sKMmtdzfG6yZ1gQMmMgPTiZbqgyN
         dZHxfZ7cdy9Cm2wc26dthZropQCA4dknJji3bnSXTuV0ABZzB99vrYh8PRC1lULM2o+0
         Rw72dhKg14WJt4yelqHBZAi2KSeTrQL3o+iGD/ibzCTrOOY/rVfjB4N6E2SdHUaXlxL4
         QGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEGWQIawOVbxpz4CyXdCZcmewo6WSXyYy/Fq1nBCfe4Sn6LYUom/WYH4AhbxO089wB90Odwe0Oc7u1IQ==@linaro.org
X-Gm-Message-State: AOJu0Yxp3Af+ryvsZ52rMjgjYU3TO/hbuQIVqokLMr7YDig5hVJIZ9Lk
	2G3Qp6oWgjKOqVwQWLHdp2jZ0kOf39AHg6DLaz2XJaYu7rF/xXiwXjpdBPfZyyRXZw==
X-Gm-Gg: ASbGncs22hgJedjZqIG6v3M4FXQwFhTCGpDd48g0kYJlqoTMgjw09xeFOLPHJ4SqTCE
	seB49yRPvTuhWnrHkXdupmotxcWsxK02atmlFRPQIrjtD0xmYrmgqEY23O8QMifg8lsP3Yj3JdL
	cmn5rNY4wG1Emvx6vP+xchdPusm/j7hgLBuqqZZBonspOVkprZQlkYu64FDDJwWxN9XXtA5OYFn
	LjpO7k/KaG7L+tLdYv+/XS6D4ZGvMWM3jXTSjRlwiNc0O3lr8VOsr7zucoj1NjqFU9ZRQQ4P5tb
	G1KN06p8OSECY7xFpnIX2KSXl05Hjg9aDxTlZ5cHtBaJHwf7da+CIMfqApsRndty2MiYtpS3rOH
	sDNYjP/U=
X-Google-Smtp-Source: AGHT+IHo1cQj3dctWO/PI4RDwJQxUMLzCGTpYaZ4IX9+6jZm2ktcxW6CnV9GH9l2Ufag+sg/SHlhbQ==
X-Received: by 2002:a17:903:3bc5:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22e08424e71mr45540075ad.21.1746112761851;
        Thu, 01 May 2025 08:19:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7bea4sm7798285ad.198.2025.05.01.08.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:19:21 -0700 (PDT)
Message-ID: <0ced131a-0072-4b15-890b-3dae3a1c37f1@linaro.org>
Date: Thu, 1 May 2025 08:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/33] target/arm/helper: remove remaining
 TARGET_AARCH64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-23-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-23-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pqsxcKGODFat

On 4/30/25 23:23, Pierrick Bouvier wrote:
> They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
> we can expose safely.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
