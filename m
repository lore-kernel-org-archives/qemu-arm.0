Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3639269lfg;
        Wed, 26 Feb 2020 14:50:22 -0800 (PST)
X-Received: by 2002:a62:1b4f:: with SMTP id b76mr994045pfb.163.1582757422425;
        Wed, 26 Feb 2020 14:50:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757422; cv=none;
        d=google.com; s=arc-20160816;
        b=BaRMlWHfSrgxfkMRf5Jm3pyZxeg6S6a+/ljKSf5SOuNAO6H9/dSaLPau4YPTfRLwlm
         nVma0Kx3gFRjZ7VqKzZOjxhAIxEGbMzUa0WbHsreqZMkSqJoFB3YgWFInaxC6LYV7rFA
         MO5rswGZN6DWMuTz068/nsvGBbQIi2Mc9l7yEUxYm5Oh3fGPE/HOn/IHPabVDgs9krQH
         bV7hDVgoChbLLuZe8+6PwEnWy7nAbWwAsuk+AVVSVihh++z0B6YwFLAfcDHkrBaBzksc
         XbbZkHLUHzfIZoNtl+K58tA1sorxW3oZGqFHTccF3uNdXuPVTs1VEmYmSP4ZznI9Q8R3
         xUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CQMLeLQ/bkVIYCJZJZncIzXsdZ5tgDqx/ndr2z64TIA=;
        b=mEi5aX3Ta6Piv9s1Fgu7WSNpNBzaED8U+Z9zBiYJ5ulKXMm4m8y9xbXYBC+SKycvCK
         Bx0XyNtGQub9ZZwKPqn3v+wHa+TDgg1B2VsMNTfNW2d4XG/uTTCqPlHvzzlFtOILUHTP
         Prxe1FjVeunpgpTtXToLcXSpFqNLyrcC0zbUhCgXA+Pp+2DNDnLp2JRKy6J7xzn3mjSK
         XrbaY72TXuXTcmrwqPDeYIgnuLIerTJnpYYlDep/TXXDS+kVIGjio+KNduykkZLu0x7Z
         wtv1GpJ2KAk/tqwEzTw9roGLccodNtud8qxBS1d45Azx4b14hUyKa57rTR1cAgldkEL7
         zJbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqHhXS03;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l129sor1115624pgl.67.2020.02.26.14.50.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:50:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqHhXS03;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CQMLeLQ/bkVIYCJZJZncIzXsdZ5tgDqx/ndr2z64TIA=;
        b=GqHhXS03bWEZ2jMlgcrBFaJgAHXzdqWTTv/o6xiITr0dcDZD89coyzGKyXtTEYB5WA
         8Oc3W1wjLGpoTGySKQBAKqMVsRSkG8hz1eJmqbyc16zheI95e50MtLlMJeH2fVUOmVTY
         ns6SlMZPpj+kZbImVOwdXTQSxWyV/lMF/mKuBB1UImHtsgZJZmaTcKfbRFRgJdetJNar
         ftDEEnDfFgJerT4DWswu0mQ9nj12jiiWv51haLQltdOteAPHvIAkpctauJpLPKXzGzmV
         +B565pvd+Lhcx6HNmsaLYM+SRJPWb7iorxJL2ll55RRzOmL0mOvK3Abo24M6AMwcfW3Z
         1ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQMLeLQ/bkVIYCJZJZncIzXsdZ5tgDqx/ndr2z64TIA=;
        b=cB+ouLqZKxe1L22B1rJznNn8KNKCyJzcWe4zIMl+Zh5EHUlpYIuWO4LFHmGQkFkuI/
         +fbVc6ZO7nalhvDuJ7HyMAok5uqLE9QIWDFZonHAE25QU4xpKXV0XplxGp53fB4yIkNy
         L2MCBQIIFWHQ9zmIHcAeXAs7akM6ZRWBcVMl9QAFt35F7oAgxTbshkDjbL1SzlZjoNLu
         Xu24usPY5itMUUpPsJ/AQG39mJSXKNUcvFYfrF9piknPoOtifVgeawq9Qihzgofqup30
         sACWqa9rJvM+wsgfGNHVu3wjK6+zkfftaYTH8tjsKK1ArnyR5iBuULivLbVoOWdvfSKH
         t2og==
X-Gm-Message-State: APjAAAWeE69sf7jwbWx3+kw/EwbP6br0djb2AIdoRJjEk4cjMgbuPgQd
	/1BWLdfahc9rQk++Uu4ci6RjTAoZPZbubA==
X-Google-Smtp-Source: APXvYqz7HC5Yf7shVDwSYUQ+HEgeqbJZZQiy3tL/xzCZrCSvqK3DZ5Dxnioo6zT7S04CRtv6xjYwMA==
X-Received: by 2002:a63:a062:: with SMTP id u34mr1100295pgn.286.1582757421918;
        Wed, 26 Feb 2020 14:50:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id i27sm3750169pgn.76.2020.02.26.14.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:50:21 -0800 (PST)
Subject: Re: [PATCH v1 2/4] accel/tcg: remove link between guest ram and TCG
 cache size
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-3-alex.bennee@linaro.org>
 <CAPan3WrD5kpnyNM_TqKOZP4GG4E0npaEqbJe6KidqJW2toAe6A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a14cb6f2-01b2-187a-64f5-0ee62d237971@linaro.org>
Date: Wed, 26 Feb 2020 14:50:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPan3WrD5kpnyNM_TqKOZP4GG4E0npaEqbJe6KidqJW2toAe6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bbtXupnhnagD

On 2/26/20 2:26 PM, Niek Linnenbank wrote:
> Hi Alex,
> 
> On Wed, Feb 26, 2020 at 7:10 PM Alex Bennée <alex.bennee@linaro.org
> <mailto:alex.bennee@linaro.org>> wrote:
> 
>     Basing the TB cache size on the ram_size was always a little heuristic
>     and was broken by a1b18df9a4 which caused ram_size not to be fully
>     realised at the time we initialise the TCG translation cache.
> 
> 
> Now I'm beginning to understand the issue better. So without this patch, the
> TCG translation
> cache effectively was disabled, causing the slowdown, correct?

Yes.


r~
