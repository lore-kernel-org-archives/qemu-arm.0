Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp424312njb;
        Tue, 13 May 2025 03:43:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtZE5VS2PKdURLn2aztEIl32hAmxFFUxzGmwWDE5jylP/43TttOnFMAQx5X782tASIrEs4bRPB6IqjGw==@linaro.org
X-Received: by 2002:a5d:64e2:0:b0:3a0:b8b0:4418 with SMTP id ffacd0b85a97d-3a1f64a2ba3mr12427163f8f.50.1747133030180;
        Tue, 13 May 2025 03:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747133030; cv=none;
        d=google.com; s=arc-20240605;
        b=PHX7595SDFkZQA2to/gr7nb1I5QourGxIU2ONUcyKW6o/88jiAHICO7gpGc+HhwBok
         nlnorutUqh6SlON93MItVivYkxNB12ULyanYQfiF/SeYJfOYZ8O3mHRSJclfCrl/ITeT
         +3AFqxUnBWYr3CDzMjHw1VOHgvY3CrPuAhnlv9i9KBBVNJt/IuWMUxkNG56UmqRztw3a
         4Jfbz/U9I9uHsMni5jPMHwb8cD65IXGjw7M9F6umED6B2bz7v11uCSjhDiFHI9j42zqr
         vD6EcuNyeFAqtFj0d/knavDyzobhuc40IuP/7IKXlqx/VVYb/F9KJByd7IIiAzSVQxKi
         z6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mJvVulSRNfflEB8cQn+WQSd8w0kajqIwEFRa+psHWy8=;
        fh=XegGUGHG+9zkUI1ORa/RMQ+z9bLDs5AWoMNHxbktcl0=;
        b=CdRUocG0W6zZ/EOmHLsCVAhEcZwiy1O8H1oQOazZc2fObi8e2Newd73H872+Qk/3N5
         6J+VsxL3e+fKexaLyRK96aarJ0avnOeqZNc3QJ01Iw7Swfo2Opk9rAJjmEzV/GXjvRMZ
         wHrbmGuBgVHH7OC5QdkzTx/DRU4mUr4PP16VN/kSsQof4uNLmmGXYv7D18eynrKDpCim
         cygM1kYuxuwRKhmk6oeGz9W7F20zvJ9bPDEBjWP2FZdQ4vG9GzAp28/QSLxwYvFnQGjL
         +e9jMzRzrHhTQ+MI6uFcJJIulZTNuBMqFxmIGA3Vo6VFbdw8vi7DctV3PShCRUzeny0p
         tG/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ae2jq/6T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a2078c913dsor994229f8f.8.2025.05.13.03.43.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ae2jq/6T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133029; x=1747737829; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJvVulSRNfflEB8cQn+WQSd8w0kajqIwEFRa+psHWy8=;
        b=ae2jq/6TPIJOHU5fr3hZ8Dz6/JVhQy7EsIGZZBRncheB9eP1PbC+cCDuiI4jx79atX
         vKzfebNKba70wyfxpSIThdzRlpUbZR+/xlx7wvyS8AJdG949ESFOR1/qNndF7t5zGkc+
         tZiW4cgr5b3+Z0ybGkYiiqfXej1z8gocmTlrh2Cvah3SFcSZsWJ6MGOffrMuhzbW7CE2
         5FfhvvAflQoIP+03XEZtPCOzLP8Mk5LrONdNhltiEyw+/BoABeO9ee0PrePmd4zLTH4T
         dsGdY3y5yJ/XjtLbfDeZYe2/3P922wg5iFFeoBJT9YZzhXRrYPHo5bFJbXHWXboFoi7p
         h7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133029; x=1747737829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJvVulSRNfflEB8cQn+WQSd8w0kajqIwEFRa+psHWy8=;
        b=e1qpoAuGvPg5XU6HZe1dMJSrvr1Tgk1VGqXY5u8cAOjnBT4n1T6b+AvtcyNTN3y/3S
         7qMMMKJDrN9Q0PtUmLOY53McKKUOaNdtb44CBfzB+kIkJOVplunvxEdBzua04EmfIWXp
         SZIyv07kBRPtrPnY4XTR9nh13p401h4juxd/TyWdjgcp21a7I87+Onfhy7GjjUumQSaL
         DNkD4ivY0hrGV29yQaAIlKOAQNd28f96pbrtFSyXvH8WCzzAPFrUmkIGvv0W97Lu9A6U
         sVHaZX57dWkjzDYKmZHsIkOJ6innG+bMk0N5NJmafomNnZrlq54ED1NTDbM7PvgRTFgr
         G9ig==
X-Forwarded-Encrypted: i=1; AJvYcCWVRL4qCn8MkiAJdyPezvIXji7fcbP4QyoYBgzzNMI7SRUJ9sv2owzBS5m5oxRvBKOcZ5WzvEOR6DVeTw==@linaro.org
X-Gm-Message-State: AOJu0YzBYRkR7RvvyEJNadnHrkW8efRE0Z1mjBBAN7asqZr0LjYQKgXR
	GcCMeZvtfOOAPEivWI4304M5+mnz6e2Uzt2dIyCi6dGCHL1Xyp+iUQu9UUCZSehkIg==
X-Gm-Gg: ASbGncsTqpHOqIG1LTwTn4WpvDCgirMCBh29jOvzaWhZwPRzoqNnMvpJvXBCFzD7liI
	jMJ7wC6UCKcb58fo7GXd6woG1fU8LGDIpPkz5YIogZWU2cgUWhQWdwhQhBRM8JKVnVW6O5GaQir
	5zKciulzdlgMw0f1jmGvUZuV1g4PBwIViORE0/Oi7lKVLV28gmBLq7irjjCUsEKWyasOKI4okta
	yczSHq93khVVgVt5eQUVfFgSSkdH9aj+6mi5tK8mZSXS0UxbZYAA9CVtVYhGM6VE5BJOmKA9ETD
	YoDuEbSci8d0Yg7Ctu8vlNRKf6Ddc8CXSVu/wMEtUtbuHxBFPRlY6wKWyF54fR3bFklxuU7egKQ
	iAS/i/FzzV5r8fhMEXQ==
X-Google-Smtp-Source: AGHT+IE7SsWW23d4HuC9Pllcgg0YtTVNoY6INYytzgrD/bzPNjDtRytLc0ANVeFDV9A+rxypcRpFkQ==
X-Received: by 2002:a05:6000:250d:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3447cc490mr1847209f8f.27.1747133029496;
        Tue, 13 May 2025 03:43:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ee95asm15868601f8f.11.2025.05.13.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:43:49 -0700 (PDT)
Message-ID: <b050aa86-b6b1-4cb4-baa7-44cab9412ef9@linaro.org>
Date: Tue, 13 May 2025 11:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/48] target/arm/machine: reduce migration include to
 avoid target specific definitions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-35-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-35-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g8p39NMdxi1g

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/machine.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 978249fb71b..f7956898fa1 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -6,7 +6,8 @@
>   #include "kvm_arm.h"
>   #include "internals.h"
>   #include "cpu-features.h"
> -#include "migration/cpu.h"
> +#include "migration/qemu-file-types.h"
> +#include "migration/vmstate.h"

Ah indeed I did the same for microblaze.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
