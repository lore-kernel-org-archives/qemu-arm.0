Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp1034143njk;
        Fri, 24 Jan 2025 11:25:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWBeAr23/Q/l9nNKh2h3uckwcITWBMHUh5W9j0TYtUdW6Fz4nx55KVJinkYutpYgc0BmwU6F1UYcAMcg==@linaro.org
X-Received: by 2002:a17:902:d4d2:b0:215:ba2b:cd51 with SMTP id d9443c01a7336-21c352ecccemr487646245ad.15.1737746732704;
        Fri, 24 Jan 2025 11:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737746732; cv=none;
        d=google.com; s=arc-20240605;
        b=ZN4kfwn1ez+UpWY3LTHoq66e3JN5ktCrIaBdtGFEFuxlW1JD+MFFb23UxUGy/VM8VQ
         n9pqQbQ0PmDf6ycSY1yXi8rWaueuVr53HnOIDipRHXQY5d9AJO0S3JqHu5AeB6DZZ5Ay
         6JjgHfiN+SBVVzMmrj4okNDQuEWJn/wdFunS3bk9J21+mplTzGnSKdfZxf6OPsNxu4ZP
         AbSprmgNczZuMepBaGNNZ6+tfcJdzut9WZcNea23+EhwN/xVUhzae6cLp/BREzMl0BEI
         907v2fJeoxNf6CsaDOpwx/xkvo8IHWQkrlUMyCWcl7ZPyGEhdaDt2lxEIlQHnwb4TYMo
         iWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Efp/hPVSZRE0vEoa10cngIHoSiF6tGCC3iy86fCUHm8=;
        fh=8iK3XOuNiEwfzY5rAeMzfWIGwzvLkXkwnxbEOUciYUM=;
        b=KF2KF6c0J6OnIZ6Dj9ATzltp33UojOFDYFmQcW5saiXhfO6kuMTWBFxnFNukwDsb+P
         XqeIFmQyHkujriNWZu5vlZEitXMvgFNXxtcPROKnF6lG7gFrBv90PIGki48fII6LPSDm
         H6/tpdpwlResJVLtiPfJq3zOgjSEmNdkPWSfGWcknDyCiQK2vaKeDChQigqktZx8A6Bo
         h4C2/Dw954h4EXBL1XEFLji3GI/puJovE3oDc/Q0qNziVVeCMuR7mEuo9qZnQgzJvfN2
         pMvSh7m5JqKOKeiUNSaTZHazJcui/+U+1sD737AzXoHu0af6pE20BeNca9ofFmDPRfCC
         bpLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdtlNhe7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3ea9796sor18716315ad.5.2025.01.24.11.25.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jan 2025 11:25:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZdtlNhe7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737746732; x=1738351532; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Efp/hPVSZRE0vEoa10cngIHoSiF6tGCC3iy86fCUHm8=;
        b=ZdtlNhe7CuIRNh0IjclQ0r9gWrJ1v0HEb7nmXXhavd77j9fEkATa5WEpiAX6FVdHqo
         a6PQ/gjYrChH8GinqK3EeIwteHW4LjA1ewWLkauKiVDD+wVApF8kgj8SHPodczGwE6Lo
         gpXCxt6HtgIj0L6HbfjhiBNuojdTyEv3xQ5O6c7mPXsFKes51dXGO9dkaC/Qm6NbCRaH
         o1PWBVgY2zDVklyhKVuvJBEKDB+aBYoBo+cIavl5p4bOImxv6UQGDc5wmyUJpiElhHtS
         v28CxGDW0qsRsAzI1VHhAoeaVYtiUbM51j0C9+EpIgMywtQxS6rn3Ksvq4PwOaqbfVLf
         ZVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737746732; x=1738351532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Efp/hPVSZRE0vEoa10cngIHoSiF6tGCC3iy86fCUHm8=;
        b=NsZ/cyUp9lQfxNoMo3tB7j129NR1QeknQ8puFiA8+BWqPY9sK8DQRP/7xozUh8iJBm
         BinzcJxsJL9VmKCqv0PNKC8H8jGRGyn0Ha/LpFyp+siCVQfl3eaDFrkwKN+b4nozVBw1
         ZcOcHtEms4HUTtRnnQWfO95SLO+Ig0WBa1q05tEwEHZfwoBnmNdsUAKQ+FBDgTHCW8ZB
         K2hYDAVYL6LoC8plSpK7zg2eVUmh+su7x23cqecu1HfdsNWLTYYBozzVfi8TK3OPq4wX
         BxobSS8sYotgWU/Svw3jPE/JN5umRZHv4TE4LtqaIynTvzbn/5wGnra+DQZvfZ+UNQAL
         TvMw==
X-Forwarded-Encrypted: i=1; AJvYcCUOZD2ymiA6PbFQZ1Tr0vADNpYlw3gQ0NoBKFrpJQ4hOS15l9eB7uxz5yN4DTDOSrndC9qDrxJcchu8Sw==@linaro.org
X-Gm-Message-State: AOJu0Yxxoue3AhVFkRwc7F05xiOYrRnENfYRIe2IbjgdM31seo1SGNKU
	ndOzXybiMqMea3rN1EW/xs1y2fgba1BL6dZddUguw/SJqfqPYJylgrv1o1sHYxspb8LVwIEfQa0
	g6gU=
X-Gm-Gg: ASbGncs3l0VkXfeNciAEOPySxg7n5Coh0uAqKMecWpsinOjtWNQ9Nude17GD7JA2GcY
	4LjesX173m+AwCbDTV2gAPw4GJEk2kuRkGbQdvnbw+SuQ1IcNwgxO0QYoYJpG0q9dlANGzToCds
	nwdeWdbrGvCkUya+K9DdKqgmNpsKsPeLIedmA6KYn5Oiqrgi8Ksm9ldlFo1t63s00Bj/x8MoqSx
	L9W8YGV0DaNpq3ACOkTqvV82in6+tMxXZH9dDHG9k7SMAxKF1y0nyyosVFJtzGgtmsMeGVCbb65
	R5mHnfIr9YlGVvkidudA1fqD
X-Google-Smtp-Source: AGHT+IHhfy3WqRkecYQHj7p5NldQGRlOnTtbYjD1R5ZbFJSIDt8K2ohO4QyumQAuDceW6pX3jPENeQ==
X-Received: by 2002:a17:902:ec81:b0:216:5448:22a4 with SMTP id d9443c01a7336-21c351bcc64mr512873895ad.10.1737746732119;
        Fri, 24 Jan 2025 11:25:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.163.227] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414e022sm19708205ad.198.2025.01.24.11.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 11:25:31 -0800 (PST)
Message-ID: <b985ddf4-cc3e-4b89-8e69-7b71dad73d28@linaro.org>
Date: Fri, 24 Jan 2025 11:25:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] hw/core/generic-loader: Do not open-code
 cpu_set_pc()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
 <20250122093028.52416-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250122093028.52416-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t77lds0zlAh6

On 1/22/25 01:30, Philippe Mathieu-Daudé wrote:
> Directly call cpu_set_pc() instead of open-coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index fb354693aff..1b9ab600c9c 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -48,11 +48,8 @@ static void generic_loader_reset(void *opaque)
>       GenericLoaderState *s = GENERIC_LOADER(opaque);
>   
>       if (s->set_pc) {
> -        CPUClass *cc = CPU_GET_CLASS(s->cpu);
>           cpu_reset(s->cpu);
> -        if (cc) {
> -            cc->set_pc(s->cpu, s->addr);
> -        }
> +        cpu_set_pc(s->cpu, s->addr);
>       }
>   
>       if (s->data_len) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
