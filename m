Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5961238wrh;
        Wed, 1 May 2019 07:40:14 -0700 (PDT)
X-Received: by 2002:a63:7141:: with SMTP id b1mr73992437pgn.331.1556721614269;
        Wed, 01 May 2019 07:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556721614; cv=none;
        d=google.com; s=arc-20160816;
        b=OJCvDB/jVHZyPv5kivAeoI0+r2xp0nWusJ7uTALK8V/W4MsuE786InNzeezO4h0yq/
         CBsROoXYz9y+1dupEYDIpMiCnAIRijw8QFU/hBZZRRY8l3lC2HN2oz6sGm4hVcunHqKc
         h0bHOomFxYYAITdDpwLEQaAGQFztTPSrOYEyxfHbEFvMdmGdO8krml8QviFpYnfea7oQ
         dZhWK9mH24vWRnWUeqPM2aCw4tCcck25PZnKpxupa7y0Uz7y6o9mwg8XhkjYCJJsJbyV
         0Gkr9MPEq3kBhuJNgHoKw/vHgw61rxLEnmOz+o01NXwPRjlQoyfYiZr9EZeHk+vpto4a
         ZJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=obT7erebz1d+uJV0k92Xweva75iMWYWGKyB+KwrkqU0=;
        b=DTWH3/qAxRdQsDnb65PjlI9LEOWxHy3Sun6yZAgPc2I4tpsmtx/UZMiUD1QowsyIC+
         rr31vPnOQdpZZXYdPtIFsY+o1XPVKsBBE98IolFAecpzVpsWGLpHC38LvX/ieOddRRTk
         FDQ+Rarnb+HBozlJEVoL1wUlN62HNNHpJmrgqQ3xis5XIH3aS0fjrRIS+c/uhAlAaC3o
         AVkPQ1wfwZueTtdvSZJUm1GalTW07dqvayMZ4Cq9oyzeE/bRGx1ShRV8MgLuRQCq+9Vb
         2euL8d1D19cJthufUy+6X+7Ou/bKyMAhmD7FNAzgKa6ES+7jk6fork/4AyY0MTCu4P55
         pHsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJzKDPwF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g11sor4466633plp.40.2019.05.01.07.40.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJzKDPwF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=obT7erebz1d+uJV0k92Xweva75iMWYWGKyB+KwrkqU0=;
        b=GJzKDPwFtSV6GVWi3gE2e+F8JOjK63JYbHkmTdvmNtKMvE9Esvm3Liz/ONNVa6ydnp
         kw4O1YQGEJ1bODn188R2LDvkeLxCfP8Poe7YTreAkZHclRscXTlYkOIXIDL60YVbqkQ5
         UGhuw6aRyfZFbqP9LqPqAk4RM0zScS9NFNXNfVY050DJg+ag09TJ5Fj8rBOxLeJNLwZv
         YgS4eyHAHaP/ujXKZ4d/N4SdlYBN9YbM37kpXfvRdIHWdBYIQ9/c6LI9ghmYW5sWNuZK
         4VV6jWL8BMAR/O4VNSPDY4X+HM6P9DaIv803FuXZV4vbNxL8nvUsnKkC+PvayoWUcSoV
         omiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=obT7erebz1d+uJV0k92Xweva75iMWYWGKyB+KwrkqU0=;
        b=LoJyO65Nd37NxS5Z+FaS0hjy3cZMrZMG4XRSjIXCJN0MyG7H+waK1x8xPxUtHjLGj8
         uFrsIr4b4wD1UH/1V6YuMU7cEALRK5vbGbnjdZi6RzIXJt+zJo91efl7QXuQ7Y3XI5wm
         4ejZOJ0uRSbYB2jQKf6YnqHPZXYGZ/EEYK/fMSsKwZ41WS9KrwbWmSCVLghYnXDZvH+d
         7bPXp24+Cct8p3D4GvABj5gyGWx3PNu7mautX8E/i6q/huUnZwfZsltHb+SmDFF7mDXv
         WmJpu3eiU09NKu4150BIvQK9ohH/G48oTWnwykibqNArrJfpGeMoRif93h2rWUqQyz3Z
         9ZHA==
X-Gm-Message-State: APjAAAUEpMhBDdUZw56Ew7telFF+X18NlqZIDFf001iNOT71HaHxqatg
	ef72HnyUDzWiecg5/tVkrdpDcVEvArrI4g==
X-Google-Smtp-Source: APXvYqzUlMRoGauejCkYc02M9GKqXaMD4sFduYT8/gsVu/dCy7E95L1MxqhHv1CXeDOS7z0TaZUriw==
X-Received: by 2002:a17:902:7588:: with SMTP id j8mr14365422pll.332.1556721613481;
        Wed, 01 May 2019 07:40:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id h20sm105922242pfj.40.2019.05.01.07.40.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:40:12 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 05/15] tests/tcg/minilib: support %c
 format char
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1b33ac75-d531-1a9d-46ea-f392249e2a19@linaro.org>
Date: Wed, 1 May 2019 07:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oJBULNuWmojp

On 4/30/19 9:52 AM, Alex Bennée wrote:
> @@ -119,6 +119,10 @@ void ml_printf(const char *fmt, ...)
>              str = va_arg(ap, char*);
>              print_str(str);
>              break;
> +        case 'c':
> +            c = (char) va_arg(ap, int);
> +            __sys_outc(c);
> +            break;

The assignment and cast are both unnecessary.
You could just as well write

    __sys_outc(va_arg(ap, int))

but it's not wrong so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
