Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp452716njb;
        Thu, 5 Dec 2024 14:03:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWW5M2lLVJDrfj/UQ+TNx0x1UN9DKAYBB09geV/kI3/caccsrq7ywS+I2QFuOnUfkW7ZgDQRm5tfk1BJA==@linaro.org
X-Received: by 2002:a05:600c:1f81:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-434ddeb48aemr7141375e9.11.1733436223512;
        Thu, 05 Dec 2024 14:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733436223; cv=none;
        d=google.com; s=arc-20240605;
        b=Eqnoa9SKmwaM6cPlHDI3O5O1g+/6lPNmNPUAUGGClYWVQ42DXfmSrPbM9NEYlpMT4o
         SVefuW526Thu8DitiCIesQbIiUVBL+qr0oYDPrmxZuPG8d4sGXPZsgpnrUQchqAN9Pwp
         YOOXUpr7O9KOrXhdNbLG0vd6aJ87pi/O4NzvbK5GQqx4qM1zyWhHYE9T9MkKMXP8yK1L
         KrQUyY7WcSGk8fGpS7/BW2NeNi++19V6vZojIPumFF6XABal2m3JBHF2QIyHn6eoPqF0
         0SmyOgkKNVpN4XayEsRFjRZT9fJo8zLwZB5ky5tLyJLQOgIAYPDtt3UQvJdKmkEwjDZ9
         cDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JkKt6OdZT5hMip/aCluKuPmTaua7wLiTWB62lQ4JtdY=;
        fh=lrAi5wkbL77qd61DTS86UEk9+tYCQKZxC/b1zo8LlRo=;
        b=Ln9hGwZzZATS0Fvz8u+bIb9wNaHsfrQiHRtCTE5tiD/BieNcr/MsvYKfN/zvMnlZhS
         A1HfZaj+owKbw2ICcvqghvK45VGRyL610AA5csg6DUG8Web8Dm6YqeygE9vpKEJW0ZbB
         Fn4c9yQR16sn46tOQH0/+xnUEMFYWpyqnu02rLmTY/TjLAgqj6fpebK/eCsCDEmCyZEF
         lZqLMOqf0XhyhCU2LHBPuAFgtHD5e9gMFiZ4EclpJVDQBf2p5Qb5u0gC82D/X1KNpfyo
         ZNTJp4sMc8eN1ceT8c0SeYl2j63S+81eUnTmRyuLO4Lcb9fVqnv7dy+8hyXr6Tofo+zU
         CZ/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rx138lMm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434d9e9cae1sor10091125e9.8.2024.12.05.14.03.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rx138lMm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733436223; x=1734041023; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkKt6OdZT5hMip/aCluKuPmTaua7wLiTWB62lQ4JtdY=;
        b=rx138lMm669K1h8xSu+ljH2GpDIBoBe4mCxriSvlnaJ691eG3WFliv68y2pd5vWWhn
         Pb4ZCABiFWFXVWw+KZvQblG76KIAbRd9e0dDzPjfBjoHj0bBUmnuX+JMOE79cXdccHT6
         E5ORLhquMm9KeYmMFUEI6VXhfJQhnpWKv55XHa4QGtB8ZnTh1xjReJ/7RjJECOqmTGFs
         qUcfr2IYgrzpIAtJGEPmMb2ztGQIFp+350UOpTg8BRglfjkfrS/gcaquPtv7wZbPVFPJ
         X7z2EcAEpJE9qzlG83kePUyS7W493r47w2T7HIr2AbwtPmYHkLic7NNVXTWLf114awUR
         CTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733436223; x=1734041023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkKt6OdZT5hMip/aCluKuPmTaua7wLiTWB62lQ4JtdY=;
        b=RZ1o0oHE+/7+0IVC7S+Tn5+XnjdYxuJ5HVocb89Z1SoltgcbHt4AlmbBmvvIZja8+/
         uvd8AwG8pM3TNA5OCi2V9f5oALsgFvN9yLWkiG8V7tm4gjBYvhkiPgXCzHyyfBh5v+F2
         qFQpFg+UvpOFuYr+hb4yTmEPC8rcrA6ORwjlWKMnlmPkSx66EHKN95qUwTIOIy90DWSx
         F1dearBn07ukvOoCBE6CP5ddApgfUmzUzB79jkD9basf+r70io0AvfRpxcqfSQL1Xiv6
         AtzTfxnolaDQv/pwpYwEgg8TqYonHZ2wdMavHe2CoWRZCmsZVeZz4iKGqY+/G36TtaAn
         t1gg==
X-Forwarded-Encrypted: i=1; AJvYcCUY/ZWnBe24EHXze216AJiAotK1RsB+LuHcjcGKx3fh7XRPmELF2egqoIIGXn9Z1XsnrRluMtlXpQFXSw==@linaro.org
X-Gm-Message-State: AOJu0YxZCsxxrkUnsKfCw4vCm2M9tfVFWSx0t0GAqQGUVjclwfHXaxSX
	1PKMs/9s74t4wyLpiHv2DuY+C5QAMXYeAFD9RulD7Pu9rnGD9YShpvyXG8NT5mzvng==
X-Gm-Gg: ASbGncsJ2GZdtdzZaHDt1Skzb7vFYghhdTnRiXAt2Ma94LZGE9T+rUmy3iIf42CiX+M
	IgqYo62meOhCAYkerteasEZzmFo92SPUGInvta7bgX+b9x/cH00ZhnzzHxXBQBwM20peIBA27hv
	5nHZm7zezcv8wE4GASd5yl1AHmtFE6Y6B1akKBXo9fxOkbC5DDDrpZAXS43ddNrkF/DXPlOgtff
	+EvhE5Ftzcs4herkF4jG1Yf/WjvqCoAZVtdRdyUwhLm1s/1HIqLXpJn0FXDohwJgV9BqUEaSB7z
	+7iQw1rIK0urF3lBFw==
X-Google-Smtp-Source: AGHT+IGrz+ES8JLbYNN/i4EayGyiD4lgwSFAHv9NpWILXRrEYx5gVEVj1IAccetlOM9xVnnDpdlThg==
X-Received: by 2002:a5d:47af:0:b0:385:d852:29ed with SMTP id ffacd0b85a97d-3862b3d0a3fmr398203f8f.36.1733436222889;
        Thu, 05 Dec 2024 14:03:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59ccd6sm3002857f8f.32.2024.12.05.14.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 14:03:41 -0800 (PST)
Message-ID: <d80be891-e0f3-46c0-8cb1-7ed1df8e223a@linaro.org>
Date: Thu, 5 Dec 2024 23:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/26] hw/arm/virt: Disable DTB randomness for
 confidential VMs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-18-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-18-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PrIwDz0Yv1eS

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> The dtb-randomness feature, which adds random seeds to the DTB, isn't
> really compatible with confidential VMs since it randomizes the Realm
> Initial Measurement. Enabling it is not an error, but it prevents
> attestation. It also isn't useful to a Realm, which doesn't trust host
> input.
> 
> Currently the feature is automatically enabled, unless the user disables
> it on the command-line. Change it to OnOffAuto, and automatically
> disable it for confidential VMs, unless the user explicitly enables it.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   docs/system/arm/virt.rst |  9 +++++----
>   include/hw/arm/virt.h    |  2 +-
>   hw/arm/virt.c            | 41 +++++++++++++++++++++++++---------------
>   3 files changed, 32 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
