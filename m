Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp46295njb;
        Mon, 12 May 2025 11:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXkc4K84AkfJUFCsRFYoNT7eViaTeuIwzpmiHJSPhKhd6fozaKLRJYnJPr12kV7f/aPRwP1IYSDHhmMA==@linaro.org
X-Received: by 2002:a17:903:194b:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22fc918fe99mr203848885ad.41.1747073448269;
        Mon, 12 May 2025 11:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073448; cv=none;
        d=google.com; s=arc-20240605;
        b=gmayuAl9WtrTLgOQnKy7jJsRINnROk1rH632CLCjnqaLRFdZGkr05g+9wuESnJJJS/
         SeYpC+1HJkCzXvmlbJMgrvgsHqVvSnTgdVR0l6x0XMT0bh4tz5DkVxt20B8bYsTaWISU
         6MPw9qO3HZI2l1KyvlEun+MGxaLdSiuAZawrkvuc+O1OBiU2vl4ZiW3I+YSWLU85tBaM
         zBLY8/IfLmyHFIUQfLl0PG4Se7dQqHvEiTDmZs6Wzfm2a+YDhpvkb8SJ3t+do/YcCBjd
         t9ARQpMACt1s6NhGWMm0tEVBChmdraPa3gzgX1BCUlfItQW4tP/J1osdoo2OJnSLg1Hp
         A+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ih1/WMG/Bvz6RkifhE4YJa1IDYAyJ8Bjd0bveBKxKIM=;
        fh=MgV26sfq4mRoupKzchxWteJl0a6ZqRu94xXMdugSHIU=;
        b=WxJAF2gcPmPsltKXRA4ZwQE4LGp3fzcklmvQE8GH2mgjbEMZIYnTbBeTX/2K1V4h4N
         rnLTqyGEPfmsbKOMkrGhFS4uBwNlTR3+fwv5l0tEzo6vGNiTk35LCkrzVQbf11NMvzMe
         RmM+nU4LbVW0rRGVgTQ8QUkOZggI3x59u5k8oN5tgpKNZj5MPIfNZ9Ft+ce85L9VzhoJ
         Gj3FyBGSq6ydfAvVbDN3zCiifvkSgU78bAHkJmepr2Lvm9jv0WO69gRb52N4vFwhNMZ5
         yNaw+/f5i8O7rc6wF2s71rfS9fPrZLdbxc4hgO/Oq4mnxTU3HbeUzUWzctEZn+JOmqlD
         qEJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqURjtHB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6efbda5sor46201435ad.11.2025.05.12.11.10.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqURjtHB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073448; x=1747678248; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ih1/WMG/Bvz6RkifhE4YJa1IDYAyJ8Bjd0bveBKxKIM=;
        b=YqURjtHBLpzuezmHogAemO3toUYlZqp89bXenYAJbk+LQOHK8krFxVxMvUUjmbKj3u
         AUZy16nlwpiBiK9k6Khvg4J2idDFlJYNEEYqY/qB6Dk63JIpiRsQ+CzjYxSysHGJRy+a
         vk8gXoBaxCe6ykBJozxl7m8/201/TT0QfSS1DIPUwHLW5cxhIt+CFpVgzm/AlxQleIvJ
         jV0q6WstVLxSxx+iLf0//jHFgkKLjDwS3G/IJuuQJ6XiLgxYcxb+5K6YGouecUpXsDBw
         DcVQ1lfE8/fN1NuSb7SqJnQ+wwvpDbEOZrsyd6Crned5GxXu9HktaS4FmUrZmIQ6btao
         R9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073448; x=1747678248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ih1/WMG/Bvz6RkifhE4YJa1IDYAyJ8Bjd0bveBKxKIM=;
        b=i6gonzW5DiX+YGvd2Ih4+TdTivYIh7cJG/8nGB6EhjdkceyM70O9Vo3F5ph0NCOpyY
         oDMMCJtKVnlUdEDU3/Iaqnx+6pNzfzcYxyGCJHlGZnmVZldGr3J1in9afsTt/x/6S16R
         N4m0b28Y61RhkhMaPwwUMeF8x2pykW/458nFvrkARweyNPSw77afzsu0R7z13hAoSmDX
         BaJJPPtMi6XVYlRJQw/7ILJfXiEBP8cWJXiaWCXSn50frnD9ZSyCJzg2Y21dvBSDt4bE
         5CHgGXTmM/okm0YoUDY0SyXg34yDrilIM0z3h+kuRixJFx23l6Z589BdcZ/bE+VoPrd/
         moZA==
X-Forwarded-Encrypted: i=1; AJvYcCUb+oUlrqghW795SBfY+8n64tZbKYJq70n+9E9CCA5QzhlRxtrS/6hkxg8U6N0QalCKpMxxfy6xIDSU9w==@linaro.org
X-Gm-Message-State: AOJu0Yykx4nb2GIZHY721Gw9430rUZT7oFabT0wdJ4+8nWGsQBKytSGf
	v+Zdzc4D1m7zYShONr4B/4mHoN6XBGL3DuNnl93MvX4OEKP1SpSg7HRR23qSx3WDeQ==
X-Gm-Gg: ASbGncu4XkOYV1ZRw808FMbuxlUnYb7JS9paB7m0L2qz5WwDMj32NCGvvlwKaFLGNvh
	S2ZHdgrqnpIBkEOI7SbkqoeJ7OIzVU3gFCiR/kBDVcMRKdvR31RsJw94p0Ae+7Sj7GS8BSecUOG
	MSDe019lj6/P29l2HhFrO2jXMmR7+v1PIs7Zm2wHsRY21TJXmOKW5ZZ4cfX97IIr54qVUKLslAl
	+UXdvxLgi3K3f0U7Fhhly/vrUeWyhoOd25OUHPBSPCsTjzrai0Lfj90UFf/qVnhhG2CqUplUEIY
	Ohzq/IW1lqchs1e2L3j2wBvnG6Jc+Nc4WN7jd+zjiFepRmYYYaSwpIpCEmnDzbIg
X-Google-Smtp-Source: AGHT+IF7cjh160/3os9miThpQ3cQjhGE0+bC4mKm0ylUowD5kJcPEGlWgg7VcP5nTdLVEsStyUuIzw==
X-Received: by 2002:a17:903:2f89:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22fc8b51ac5mr168985615ad.18.1747073447682;
        Mon, 12 May 2025 11:10:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f354sm65646295ad.213.2025.05.12.11.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:10:47 -0700 (PDT)
Message-ID: <4bc309ba-ecd1-4a4f-a717-d9ca71b77333@linaro.org>
Date: Mon, 12 May 2025 11:10:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/49] single-binary: compile target/arm twice
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, anjo@rev.ng,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_NgJw=eu+M5WJty0gsq240b8gK3-ZcJ1znwYZz5WC=wA@mail.gmail.com>
 <726ecb14-fa2e-4692-93a2-5e6cc277c0c2@linaro.org>
 <CAFEAcA_WtAAba9QBS_zOPUPtjdeDv+0mDJiTEepHS2+61aZERA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_WtAAba9QBS_zOPUPtjdeDv+0mDJiTEepHS2+61aZERA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9WhS0HPhEDB8

On 5/12/25 10:05 AM, Peter Maydell wrote:
> 
> I had a go, but it seems to depend on some other patch
> or series that isn't in upstream git yet. Specifically,
> the changes to include/system/hvf.h assume it has an
> include of "cpu.h": you can see it in the context in
> patch 2:
> https://lore.kernel.org/qemu-devel/20250507234241.957746-3-pierrick.bouvier@linaro.org/
> but that include isn't there in upstream git yet, so the
> patches touching that file eventually fail to apply cleanly.
> I assume that's "accel/hvf: Include missing 'hw/core/cpu.h' header",
> but is there anything else this series was based on?
>

Sorry about that, and wasting your time.
I rebased, checked patches apply, built, and sent v8:
https://lore.kernel.org/qemu-devel/20250512180502.2395029-1-pierrick.bouvier@linaro.org/T/#mc1b30cb98e11932458c1566ebe50a4efbc10473e

Regards,
Pierrick

> thanks
> -- PMM
