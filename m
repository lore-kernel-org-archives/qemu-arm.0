Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp59217njc;
        Fri, 22 Nov 2024 21:42:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/Rk3pbsT9rY43MKOhQbhkp5vFktHnxHumIjB5gDt6Zy2xICgS/u4Vx9FDcMBE839wgAcjBdCZvxo2mw==@linaro.org
X-Received: by 2002:a5d:47ad:0:b0:382:44e0:c5e9 with SMTP id ffacd0b85a97d-38260b6d8a5mr4698059f8f.25.1732340555447;
        Fri, 22 Nov 2024 21:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732340555; cv=none;
        d=google.com; s=arc-20240605;
        b=gb/fRIuZ73k8yXnIYDVZ3XBzTOQlWgtO/S9deesre/XQ5bEDRhKi0/u7vbdTM6E0/7
         SRA8dl3iyo9zw5k66yhbo3/ajrXDtRcu8vKf0gAya3PRu3R4wDPphCzfXFqK+vnF5E1g
         RnlostgP2TcPLnN2NB7P7fVVjl18LVWIfdwH0D0ioYLNjlbZpE5GqTKjrwRhYcv3Cbj3
         kgBfg3lj++an3renrt273i+KX/dWY1X5xfVG3J9NvRgf1v/4kvP59W7XXmenzyGkW19S
         GefMH7owwyvDfq6/78qoi9ATzHtnJnPu19yphTRX8Rx35P/aOXyrOs7w9YsjCRkmBvRZ
         u5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nhg/M+V5iZI9ZKsL5cgeLVB2R2fG7EArTVv5Xxqs/6g=;
        fh=BFvypAxlpNaVZzizJ34DOMFPJru4npAQ+A0Ua2SnvWw=;
        b=JbnLpEz2bZ8wmVAP2uEd04BjDfWeVAPY0uk4BBRd/GX+fMYwkoo2zBIgXmvguvF8rM
         gOYpxIJ2oceZMOjWlP1y/APHXX1vKw/PpSY5ZglzCZAr/kXBCVgIxUsa6LW5uBTMZUZy
         ZGDnR6mauPjsfVhw0OnnHaGZYD6yrpsALapXNJHIaS6v1TH4zypFSTYvrrXuX1B/S94g
         VAa7FySxRhPz1HE3/hKODh9n8O+3MIqqwXyfDkB+Rpm8j1nvwSGn0MBn4zSQVquhfcl0
         pBw+ZNG+c6UzTweBGVW3xC5pbSqRxBUMyMDCiaNFUaeDpIDmOwsOu+4b3DEs3NCFmRox
         6mKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsc5l6ZI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd84c30bsor15062515e9.10.2024.11.22.21.42.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 21:42:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsc5l6ZI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732340555; x=1732945355; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nhg/M+V5iZI9ZKsL5cgeLVB2R2fG7EArTVv5Xxqs/6g=;
        b=nsc5l6ZIJdZa2n3MZh+cCKq8+hl3Y+3KlCuSu1si2ggCcX4KsI8JERII5PWgABphe/
         tbe8YA52mxVO9wJ0rGDJFjeXXBbsNekpwD92asVgyOyz0W0aYRg6LX/jmuMTmDhq7Hpv
         v7ORU5L/VZpLxhMfFq+XMWDNbnCi87CDUwbRHMde8D4hUtDhSO35VJTtPlORc8YwbDIZ
         k5+U31VTiHwsQVj2Vg/l/UguaB96y5VzH3QSR44t6DvqkIXLliwjP0xwrd7rOR8AaGeh
         E8JI+qHwcqEIFAI5GdaDoPXiTwjeaFrhaUHaeYoAl6FYaavbkSTD8nHbd/njsdhoKY22
         qSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732340555; x=1732945355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nhg/M+V5iZI9ZKsL5cgeLVB2R2fG7EArTVv5Xxqs/6g=;
        b=d8BGwlXhRs4eu4i5wf3g2GuzjHn6aILZ4wKgkLmsGmiER9/Hdcbh7baM7w+FrNDXvL
         A06oGvCjFh/kDYt4ASlApwrVlq+FxSUB61ZcrSsWaCV3BhyxLk6G+ioQzh9e3/7UFBF7
         1QlHz1H0tXo6IJDQd02EqLQXBvecmtYgZcE9Cb96XmdCXRTD4s5US8+ga5Avx+fRAHp3
         eThDiyBUjPCFgzjxZrE9S1gTPgCxQgIRNcTOfil0kPcVMkwmRtDCGhZt06PCQD8skn3r
         tOfim27G037d1ZvpwerVV4g8cAMMCXV59Zpyb2NTu2Vx5xzpfwBrNMYBH3ftKOwaca25
         /GSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Kg/XUy3yY5E4y3S2wS1HzIRM9kCaNNSelgJ5ij618nvhrYStthchRxlBdSCu9NPRbO0dTu31DPWDzA==@linaro.org
X-Gm-Message-State: AOJu0YyLn4Ck2aoQJj1I4mJSyGN3VuL6sEm1u+IRJFXBLCZeWo5YA+uh
	KoaFik33ByYBQyeC/6IgEVppi6pSueRepIRYE4XaT4IHGhv4q31y/aF4XZNlq2LkpA==
X-Gm-Gg: ASbGncvlvlanF64QEqoFUn8dimZxjniKeOen1OpjQfia6O/M36xZCT0YfKGsln+cNFt
	gjkOCWwMgOnFJdIGylT02P0c3XrUGVAKXry0XDr4pmH3KN1cMGTMbfD6yQvJm/jTYJJVGz2hqJy
	HXRHmobPdfWm06sDuJvUQcKi4EHOEVM6reZO3KBLVcn2SsgbQOsCv+zYHVTtGA0PB+Ai/NbLjzZ
	Fw8LJjmYmRjbT+tTjQKuCQHDvDdVVQX6922Vpvzc4wLsar8BQSDA5YLsHutI76L
X-Google-Smtp-Source: AGHT+IEupZukp7+WR0NgRrnsdTzgKH5p1UrihkIvT2Wd4PLHL1Eq1mDyvEcmYjy6+Oki0L//pgijNQ==
X-Received: by 2002:a05:600c:34d2:b0:431:4f29:4a98 with SMTP id 5b1f17b1804b1-433ce4c2319mr41974365e9.20.1732340554899;
        Fri, 22 Nov 2024 21:42:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.146] ([176.187.206.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde110cfsm49083285e9.11.2024.11.22.21.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 21:42:33 -0800 (PST)
Message-ID: <99640655-11fa-4e8a-9d85-c7d1ea011d49@linaro.org>
Date: Sat, 23 Nov 2024 06:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] target/arm/tcg/: fix typo in FEAT name
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241122225049.1617774-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zCG4ImFT1qWG

On 22/11/24 23:50, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/cpu32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

