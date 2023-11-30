Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp339818ejb;
        Thu, 30 Nov 2023 08:05:16 -0800 (PST)
X-Received: by 2002:a05:6870:fb94:b0:1f9:d333:74b5 with SMTP id kv20-20020a056870fb9400b001f9d33374b5mr11195042oab.16.1701360315849;
        Thu, 30 Nov 2023 08:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701360315; cv=none;
        d=google.com; s=arc-20160816;
        b=ASfVQrI38dk8Sir3BkDdAAv6FGNglNP1D29mJY+V1N3Diz3GcvHLw5kLzMn0Dt3mbe
         AHYrq8/vhi2cA2I/scfd5ltwwbOeApTS5QrBagd59rhmL/B3oYyfu47Gcez+1mYItC15
         zjzxXTRQmilNOnjRGRTmJyfXlMhSQ/U1DJzVOYC2syTiDwSXl1r1tagvFu/QW6taBBzf
         XrlFXYT7ZZuL+Yr8E1EdsAvKfR22ihh8Nk2aLmNX4wYhvoQDvngG5MwPz7bplxK6nBfm
         469Lzu+Jhp7DCsGgIZ9Pfq5gN1iYx3lVHEOAiVb1GcLYQFgfTZmnhxmiJPck17sgOQvc
         By7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n0aNH9A7zgDcAASqStlMfqHSZL65zf0mh50KHVviXlA=;
        fh=ZyWvtqBusvpXiredIPRfPI7+rghKH7XOzDp8YZQTD40=;
        b=X8qZksmqgEGjDx6br6WpAwt/oZAMOAYKvzXBoNVD+2cpvuB3IxbeWYZV2unZZW9HI5
         kAW1OEr5tQMTU3jf1bKweumlnoXJ20PM/Xf/buXVHD2ZV/NGSlM7SZjLVaXtoPEgQnyy
         C2sCVOeRuqtp5gQNOnU3WhMS0FX2ZCWBeJvAkVIhQu4SGCnL5kaBkatbXFPElDAmuFpZ
         /tjGzNr3F5xQqSQzxUg2hPA3k5jVR5/P7cw1SAOk2ed/pS4nlMoTzW6L/zQZWbYxIggv
         xUdCNXPWBKveSbFKI5Uw/5hljgXK1HzYx/9WTDeL2hoTz24NuVCjhi7E1ddYePPYG5Cq
         hMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbb4Vy+V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dy45-20020a056870c7ad00b001ef38a85f73sor497419oab.6.2023.11.30.08.05.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 08:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbb4Vy+V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701360315; x=1701965115; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0aNH9A7zgDcAASqStlMfqHSZL65zf0mh50KHVviXlA=;
        b=dbb4Vy+VjloqnnXQqk6LS8Ac9iw6HI2edNbNLT/zVR0QVuB0ZxBagha7XCWCdC3HUd
         j0sdKmXbylDDL9L3iyr4hU8oRB9Du58xXHLFJwFKbwJ2GCu/rpHHt/TvmkhbaqwgKg2g
         jBboZU6iEzOYvhfP6TPlOf9GclKLyZfANnK/RuRVHkc2jUxnKA/InVyprVEFiloee1D0
         d+5bG4nhXp9C7V4Uc70+aBiLvLcygGVaiHn962Wyx98ggdnSTP5MlcPAkalGLfMc8TQ2
         plE3k0SGuW2kayb6sgG0YhgH82HNDf+i9s6gRQMmSu+ASp13GokIeGS4Ms+Tfj8vHqA6
         qrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701360315; x=1701965115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0aNH9A7zgDcAASqStlMfqHSZL65zf0mh50KHVviXlA=;
        b=YniB59vPuzBi2Kt5Uw78d562a2RoPhKCiWjluJdIsGnSoWcl8iRc9LaOVNQ+XG77yf
         XbBskrVnawF+l+7cv628KUQVb/NgH1CRDilfsOlOXvzxNxr+XIJURwtTtxCVII30uYUB
         Ej/ILMEGkjVUYfzY+Yfz+0q7iEoXdMEMGeiuGj4J8xGuLCo8epFx0BxPW1vFAwtkAWi3
         mAR7c4ba968MGeBHOfKCNeUTEzsJUQrgVBkzeSxHKqlQG17oxX4JUDHTWMhnsLnKfcLA
         ysKPU/2dXC9l0brdAYd/ffoO7qfTFNijncsB/7ls+UNhloBKCiRxqrxvll4ySEmCuznW
         y0Xw==
X-Gm-Message-State: AOJu0YxQS3hGOsVo+iZH/PJbLOmKP/COPomTk/1lUIJ0bil9nWVgF3GP
	hZIY7hRgnSFiCiF5LgPsNivjKxQ+hKQl1UVNrNg3qw==
X-Google-Smtp-Source: AGHT+IG0zmPgyZxbDqG6Uei6B4s/i1C81O0voOiadZIFbyeAyM0f8QpYn6qx2NHORlUUU786epqlBQ==
X-Received: by 2002:a05:6870:b86:b0:1fa:169b:3cf5 with SMTP id lg6-20020a0568700b8600b001fa169b3cf5mr11950519oab.28.1701360315383;
        Thu, 30 Nov 2023 08:05:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb90:f2e0:8450:be70:af46:b71a:41bf? ([2607:fb90:f2e0:8450:be70:af46:b71a:41bf])
        by smtp.gmail.com with ESMTPSA id cr3-20020a056870ebc300b001fa3ab0a3bdsm319867oab.31.2023.11.30.08.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:05:14 -0800 (PST)
Message-ID: <c887c7b0-0d47-4350-bece-3668ad75bb9d@linaro.org>
Date: Thu, 30 Nov 2023 10:05:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] final fixes for 8.2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-s390x@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20231130153333.2424775-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231130153333.2424775-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aOx57KiiZ4pM

On 11/30/23 09:33, Alex Bennée wrote:
> Alex Bennée (3):
>    gdbstub: use a better signal when we halt for IO reasons
>    docs/devel: rationalise unstable gitlab tests under FLAKY_TESTS
>    gitlab: add optional job to run flaky avocado tests

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
