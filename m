Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2210784lfb;
        Thu, 21 May 2020 21:24:41 -0700 (PDT)
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr6792338plq.173.1590121481411;
        Thu, 21 May 2020 21:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590121481; cv=none;
        d=google.com; s=arc-20160816;
        b=s7gLchQ+XNInQUHtAxw3AYVSY75KDowKGbYtCXZx9j6JgkkV0CVGGhIJ/9evuM7iGl
         Es6MfvSnokKrmlCIQvaYhlebSRH4lKIe0UccKQmjegSJDdfCWLsg8LPsBZ6sq4ez/iyn
         c0O15cTf3E6EWtDcPlPq7tSjmm9YZUydKwlanuHfSalj1nZ7kj56M8u0EuiZXNlJeXrY
         pY+Y/QcQKM8CC3OZkn8ReppEohXXx9PnnJm0OX1IekrT4+3mKAY2cYgt8YSyvN/Vp0PZ
         U+E1nXlZqQyCz2uCwivj5Ne81OLHjfwLwKErcDke3FPusigrJyRpBmsRnshTUx+3JIXx
         gpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SLX5aUjyhwSpXMrIOBG3YzlEuSkp8wTIA0mN4lHrymk=;
        b=nWM7LzHEVYiuY/ErY9RRmQjHIYCttmZ0PND8tXVkGazsz0lQZSv3FcXSjl+qYM0AEx
         oR2uj+VkTskbbHbB8cavpMb5KjAM2yinjX2RfQfmhN1+vKE3y3Q25KG02S3DNuo7i+sp
         GBaYfzqvr35qjs50JlwNh5at0Py3tWLoFHRcyqExSNGHSYzOdikAIOQdxfUGj8Qig5F/
         8hIYGXAta/AQrh79hSVmEBCYkpLM0rfnxa0ttnh70ok5da7+VIAVGE7BPX8a7cl4eJ5N
         aQL9c+AW3jTDML/2WbJyKE1nyHNBP6f7YInmdE8osL+k2b9BNP6mzu7V79LD/OzASGCV
         dJIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgUeBjLp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q184sor10178360pfq.88.2020.05.21.21.24.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 May 2020 21:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgUeBjLp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SLX5aUjyhwSpXMrIOBG3YzlEuSkp8wTIA0mN4lHrymk=;
        b=zgUeBjLpxbxJGnkrsCaI4+/stpGitER/GPo+Kjlu1iEHNh/Z8qgvC+Am2yqw734vKY
         yuU5foJk26eqD3l27KjYQhDBRHjhXfmA0FcqP9S6gqH206zIQLbsc9FqjQHTcJcKq+/T
         n0SEdv1uOFhN4Kj9UjHjD3E+C+6z/VIomN3JlTn0y5H0Q8lGnTnh0KCMWTukBHpQi4us
         JE/lPcGsze4bkBX67xCqQ1ZqjX724Jt1SFXVa2jhgRaNkE6yIYtJF4eGJiMIUhjy31Jj
         EtRvrqKvu+vcLd48aPQD9hPRYv/qtz0Bhez5juznQtiSwBfeiX8EUjdUc5j4WEdaSKwO
         2hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SLX5aUjyhwSpXMrIOBG3YzlEuSkp8wTIA0mN4lHrymk=;
        b=Zu2ja6qSH61G8wxpQIb3Raul1Fpz7Ll3NcHQltlYuTKhBBqwa5Xtzd0aWKszeeh+pi
         eWh4cC6aff3uLtoMX7eYWYFj/R9KAzHLUXLW3MgTFMpfLuxZ4rebbGB5MeykY4XqqNTp
         f9kwdq+rV5UQBP5d1eoQGVO2ZnLvttEuW8hW91KOtyA+M2iKQMvorm5jJUD9eni846Qf
         k4F4XD/957aZTG0rECxae/AZWuXk/69q4QVXMHaOIeAP8/IRbQEyzR+A8SUZ12259WZi
         NAUyz1pZtOzWiL5EEy1VgABuoe2BzDcMNHKOLdTYKt9pY1VpQOVCLOMzUPszmqxCBxZN
         v2iA==
X-Gm-Message-State: AOAM531tGRq8wDtoT7JdDiKn6ilCixwt2pWxC4g9hGDf5J5bsNRWO/cR
	ruSne3EctJwZWz4rConQqOH63fXMsGN2IQ==
X-Google-Smtp-Source: ABdhPJxUDUK2nvpu7o+yHeDH397TSEOPvLdpguUeDy4kCHqYgi8xtmKnbcaZg9vNENzs8OYuu74F7Q==
X-Received: by 2002:a62:c9:: with SMTP id 192mr701238pfa.43.1590121480915;
        Thu, 21 May 2020 21:24:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id j21sm3845954pfn.202.2020.05.21.21.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 21:24:40 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] rules.mak: Add base-arch() rule
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
Date: Thu, 21 May 2020 21:24:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hkI5fMpSW0fs

On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
> +		$(if $(findstring risc,$1),risc,\

Eh?  riscv{32,64} vs openrisc.

> +		$(if $(findstring x86,$1),i386,\

Do we really not need an exact match for x86_64?

> +		$(if $(findstring aarch64,$1),arm,$1)))))))

Exact match?


r~
