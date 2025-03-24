Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2077697njc;
        Mon, 24 Mar 2025 09:40:25 -0700 (PDT)
X-Received: by 2002:a05:600c:3552:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43d491bfe15mr210799655e9.15.1742834425243;
        Mon, 24 Mar 2025 09:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742834425; cv=none;
        d=google.com; s=arc-20240605;
        b=BmaG6Mv21Krol/Qmueg+2/+bOAwzeagASXI2IyaDgPczz7n6u+xFskrGj47AcpA0Ar
         Oj0uQAoue4gqEn88Y76Af8u2qBut9RxoFdCE+hVySbO9F7th0Ir9npWTq19McFtySOJk
         PKo0S7ypU962YwdTesetnrfqOoV3ctV9ajf3z/HwnTkZIPlh9tTS5BXd6NzJ08ytpGi7
         7FC8MelTk2Wfhq6r3mx6cuqhyWwvdsaAN8Gq0KY+oxHO+re1odINM17opNgqiroGdiHS
         7fKB4rYLeQZFTvuo4m56bbgXEvfbXWe8UtM7LaxxLJb0DyI/oO4zC7OcURqUhFpqNH9W
         CCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bTa1qSYmCQTmQKOmrsf4vKQV804JWM9ydm18X7vtUJ8=;
        fh=+hiypcBzRMz4cZbkcE6zZ3AbQNbWdAweEnpc9/zzoN8=;
        b=QJ0H4A7Rd8MxRL8ho4OL4wK5bn4S0eVa3p0YlAD9zgOq+hD3cNgbExP1H1+3Nbw1eB
         dNMD3TQO1tiC8y7hufNHGzTTH56JLmnhVeH7YTwF2fYD+5OazdBWspqClsa0RlQQGZdH
         exwwVsIckUABSTg/Hqf9kicJrhwL54xJ3lylY/N50DOEEEeSSrXDIBtD2512k2qgPFqU
         spLKDRHLKjFeIbp61qD0T2p8mMhI3LE+e3o/n9Qay6vZRREF/3XFnAPKFqrnGkXMytcZ
         wXbZfsXrrFkhxZa+ZtTMiXcdkVo4PrKGfc1d2IR3auOH4IS2rdAohWZGgYlDWAXN6emA
         HY3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Swc+pMEz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d43d81315sor25660535e9.0.2025.03.24.09.40.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 09:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Swc+pMEz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742834424; x=1743439224; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTa1qSYmCQTmQKOmrsf4vKQV804JWM9ydm18X7vtUJ8=;
        b=Swc+pMEzWZ7iYBXDBla7MzLbAZMOC8zD1F+COQtka5c1G3cbNiPZIbpJ/WSdsdwC5C
         DKvlWoaSZykU3DeimLPLjKnRnC8h55kpG55bEOOoHVOBGlVaMM7qzq0Dj3hlRcDrFIm7
         CO3twz7der6pD7vDBFT8Xwd4R3bnVqoT7g+IshPet+puKvdbKPke7k6MRf6Vd5+PhFOH
         NYR/XPw2CWi0wpp5xZkOpevBrD33iU8zWX/Jd2MJ6a4OTGxxdwuSQEVPw3v6VgrZGHBf
         5zm7wDyz4XCCZaDsIZ2lQDncekX/naMLrHDF1kCMGjQDe+8LpAKpRV07MFQHLD7Bre5D
         1vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834424; x=1743439224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTa1qSYmCQTmQKOmrsf4vKQV804JWM9ydm18X7vtUJ8=;
        b=K2+33fNbrGVK5NRCxk/CV5XuvWQIM5jMAO9eAY5m1ZceMf8AYsNKkURTeBtJod56wy
         m6LyK4RNrMgLY5FUwSKjqiBRFSybhsGfAmxhljSiUYHVd9/sFBmmTd0SfbUrpI/nV4OQ
         vKNKbWBLCcv1RjuuMWU1Gcre/CvPjUtdQty57o5JJC3q5k2cOgda7lX+BHI/1EfIySNb
         hgSnfXGwbZcWrYxlveVIee1lRJfWolJngFkOdKV2Uqn+TZGTF95FNgodIVwDPnR2sJ4L
         7mKOAE4kfJYW87Wb8ZYrfBQf2zrYVLU/lSEv0HZ+KtulqWwdx2jvjyRCnngUlmdsRzNN
         HMIg==
X-Gm-Message-State: AOJu0YxF1KF/btNc2DrDyew4ToOL4tb0iUqTWQCIkRhBtQLySH0SsCdS
	2sKd0QP20EebQBqqRXIJIUhCw9tQb3V5SYg1E0kRAlM86Ubtfx+VXDfFikAKuSg0CUsCK3uUqEi
	qnkQ=
X-Gm-Gg: ASbGncuFOs2+YXGWvdVr7M3JnNqTLBR8fUrD7sMPvWo5sjW342CifQwTRXw8X+Rf7sc
	DIoXeLr5fQpHIXC9ihjRClYNezjWjwO7ijCid0h3eK7drhji/AHP9FQ6dQ7Kfxl7ruJkfre5RY3
	zWDmo0WLD0MQb/B687rhIlDQecJzEL0HiV5UuI0MRNAVLFuwX2TJ6tdsQNfwps0XO0LISDnGLk6
	Xk2kljRGDZoCQBq1HXc69irSnTlQN18GBA7RntnY+3ig0kcxijCVZH5l31+SgOwapxQ16d4Lh7I
	TTZR5vbYCmhTH64wglsW3IV42pSZ5XWNBpvEzuQol1eeEO8g3iyiaLmqxoY12gv58IAy3kygOGI
	NaKR0klAyHST1uYdlag==
X-Google-Smtp-Source: AGHT+IEvZ/GXzs2W0cmBjidBxwdbJWVMhXMMKf14qXn9WElgvhHpYj93Nmhq/cx3A3UvvPASUW0QoQ==
X-Received: by 2002:a05:6000:154d:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-39979586dc7mr15451843f8f.21.1742834424250;
        Mon, 24 Mar 2025 09:40:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd348sm125765705e9.39.2025.03.24.09.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:40:23 -0700 (PDT)
Message-ID: <6d31aa14-376e-471c-99eb-646f25e6e9b2@linaro.org>
Date: Mon, 24 Mar 2025 17:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] include/exec: fix assert in size_memop
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-2-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250324102142.67022-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qGzZ9ExUFWLH

On 24/3/25 11:21, Alex Bennée wrote:
> We can handle larger sized memops now, expand the range of the assert.
> 
> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - instead of 128 use 1 << MO_SIZE for future proofing
> ---
>   include/exec/memop.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
