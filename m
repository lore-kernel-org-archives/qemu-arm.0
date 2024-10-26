Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp251664njf;
        Fri, 25 Oct 2024 21:29:27 -0700 (PDT)
X-Received: by 2002:a17:903:124b:b0:20c:ab33:f8b8 with SMTP id d9443c01a7336-210c68d4a96mr17763245ad.15.1729916967023;
        Fri, 25 Oct 2024 21:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729916967; cv=none;
        d=google.com; s=arc-20240605;
        b=DnZaS8SSJz3H6ulmFVkRBY7r6GpzKFfW96kXZ/qtUc845O03P2WKHBzxXjFhirpmyh
         XAksXINZQm/lvvmD7vpvVIEGvswFpTa7lBNV7OMnLdRNfDb9Y0LdNUo/1fBjiXvbUc/t
         BG/LCgz9u8SiYsuGXFqPibAWEHACj05CAjc5nMTZIBGnGveFE4CzOjYHW2FAKI3ZnPmF
         zoA2upyRQbct8SI73spFkheqAEMgGJToKB04b7jpVVk6rEwKKq7m2HZjpIydh66GVxpR
         ONpf7Ey3Yz0s87yMmZOVMfJ+NK1uYR60AIJY3Nv19B2hoPAaonYvazpvcohh8tz2zgf2
         dEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UVjxF3ESHzHgAk0dGqkCsRxn8hWXACkiPeKVzbzaR0c=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=lc3KG1MQ81BC7D8kXMSdfw5wLpuLagxD75R8GWHGkDjtDxUnu/iQIFss1vT9tXf8Ze
         h8JXwY2XaiJGulfY6wztGz2T7ZQCVI02uYgBJPzNpkHe3Ydc/slP2GdndERDNgeYipyL
         erAqKPCeOWsPcK1HdevJEMXsrOUrroTQTzbZBHjwTrCmivpLVzYS0dyhTgC0Msl4fvOC
         WHbo8UQYvOAsDZRbYeW/UvQzY13MRzOGgM+iEUzHz/hbV1TT5di1oupaB9c3AG3+zTR7
         3lrqvTb2bp/eFoePHwlKvkbY3jXv7uUxVfxTchZ6VYl08JHKcEpFAg38ETds7iT4hgzj
         z1Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=egGmHhK8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbf411ddsor15796145ad.5.2024.10.25.21.29.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=egGmHhK8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729916966; x=1730521766; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVjxF3ESHzHgAk0dGqkCsRxn8hWXACkiPeKVzbzaR0c=;
        b=egGmHhK84HOd3OETv9BqQQiLP0DCVBQ6jM4LqSpXh0cjEpEqJWXi+R3hbcojfPjmIk
         c4ZFNjRNHaQdaJXQTOZdP8rM6uuR8K8hQVdppNJU2L/Ikv5qKo09G6AFYG274WGcfCrZ
         kTm9EjDCcV8UcjRSoMB0/svBy4QhfA411TqPgnRhY8ZeDZM/8jEAGRTiO739CggkHUOm
         4FflwkFXIOVXK6+UY008rvmB5A73rXe+Q2CBnd+oNwf/Y5c8LXfDq3znL74EBXEj/Voy
         OBXySV2nRPHOjjT0MBg/xcY75sM3DcQiYRtg2r8vjMXl6tw68tu4oSN9GLI/lGg0vLce
         QV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729916966; x=1730521766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVjxF3ESHzHgAk0dGqkCsRxn8hWXACkiPeKVzbzaR0c=;
        b=Jb8UR3IlBJaX644qT+9VrLo5sUcoyUZGvgIQql2PwQz4el/ce049rl5uM7bAO6oPQT
         x8yv6nlcDUli6UuCtz/RpJaF+D4QbCxTWeBQYJQkYMxeOBW21JpVpsDsN1Uyx6ismFQY
         uMTLiEk5R96nADMi21AsBYx8+M751OjKuJAmN5eBHNEOvP9aXhXGkNCMSmNy1QAuxrd6
         PVMHqSatAI+tVOptQsKNYh08eL6QKBgILernQpW7Mh4CBxG01BprmMnub6TENSsxK/ns
         7yV0jxQklgSFvAgbsMFJotQFo/d6dZhjOaugaBASMqCkweT9snti5d7NUqlZ28sRdkfl
         Aalw==
X-Gm-Message-State: AOJu0YzlmsB1pMFvFkDkT5O+EsHlA1bBc+/VTInntX/KAQqMpjsSq6Ls
	6fXpY1N7+StvP+303N31hJqCXGlqLytof0lMJdXUfw7nTDx+tEGj8bJ7iZOwsD8hdw==
X-Google-Smtp-Source: AGHT+IHn+TeGpIjJCcIgHcT7/vNz+Hebrk6hCDc8j9HSpSNE3xaZFqLbUrpMq6/FIGtbK9hI1L7KnA==
X-Received: by 2002:a17:903:1c5:b0:20b:8e18:a396 with SMTP id d9443c01a7336-210c68abfe8mr15661615ad.9.1729916966560;
        Fri, 25 Oct 2024 21:29:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc012f19sm17191775ad.158.2024.10.25.21.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:29:26 -0700 (PDT)
Message-ID: <bd83aec6-ddd6-4d21-9d7a-7eabf3e1a79a@linaro.org>
Date: Sat, 26 Oct 2024 01:29:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/21] target/rx: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-21-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VikdonksxG8/

On 25/10/24 11:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the rx target.
> 
> This not the architecturally correct behaviour, but since this is a
> no-behaviour-change patch, we leave a TODO note to that effect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/rx/cpu.c                | 7 +++++++
>   fpu/softfloat-specialize.c.inc | 3 ++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
