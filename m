Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3173403njk;
        Mon, 2 Dec 2024 12:09:43 -0800 (PST)
X-Received: by 2002:a05:6a00:2381:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-7253005fadfmr34905521b3a.12.1733170182942;
        Mon, 02 Dec 2024 12:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733170182; cv=none;
        d=google.com; s=arc-20240605;
        b=VUTcrVejAR5Ii9DVKetyrhaTWC9j86ASSPfw+OS2uAG8gsNDf4W2QN7kmrrEcHUlrP
         ffW7K7f0anruuO804LYHY0oTqnL3M+nKO+PvRSOiMbRsrjiu2X+JV11OLZp78VnGusSC
         UlICnLbXGjRVmV384SvviiaUrVUDXQ7GyIKEQzWPQxhBOWIB76HWEHT3zbkOzVDQzdB4
         wKWFs61X8i2Oz2L2JVs060Svhg5t+rK/tYJ4CrzGUO05GLbvRHuWcMsM+O+qeFyjMJEU
         BRDbIoX2HkbZ+A6j/JbImha19CrvEvh3PwDC6agz4WQe1K+FYV3ZbG0b5i6YLmQsnPxr
         MCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        fh=pXNUrq7g7KqPZrtpfddQpPQcUThKcoRDiTblbFMy2mA=;
        b=H25ptmwYsTgug4LEpl038FW+ZXdtgA7l7QFWrgZcv2OLJkdkwUFEy8mPoIJ462TCti
         D/S4jM8uDirWmd244xABfk5WmtkHqcnjI0fFxvxyvr4bfi5glpsfCBNVxLPXpiUpfjBn
         CHRpA6diufih2GvY+PoigRofo9UheGV2wCtCko6aDQp8OvT4iSyvvwPTN7UMfbJm4XtN
         w8x/HDiJgF8HZOBrLswZNenqvveg595plJsameW6o9xvNqbEeRbC6rzjK1a+iRBuAOHI
         V5bfuqOdPzuB8gu/BDW7SGm9LIHlCLHx/qN6NC8shYKAGV3AkK/d0VjHke0mYi8pyjWM
         YhmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8pRtpXT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c35396csor5053801a12.8.2024.12.02.12.09.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 12:09:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8pRtpXT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733170182; x=1733774982; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        b=C8pRtpXTblRej8kxuoutv7qbfB0b8KoGmZK4b2PALudgiMz40oUjRtVH2VDvQidT+U
         nrHPUGDxQzQSUPuOj8DsXiBpeCNtSmQwmDH2h9D1Q+MSz7vA1n/qX1+QovMKyN/ZfRKn
         UP1RfDYL6iWUo+k6Y8pcw0WvMKlAs/NlSzTafJ1DBYmTd5kEi7f2LA//QjOKqcYlwtKh
         uXaUZQFtCNUFDQ6Q1qjHCV4NMUXmwA6qFjqyDzyyComVmYlxF9FeN1C4H84i3O1ey9o3
         giASxFhWTvtl8oApwio6f/HvFkdG8B5mT5SxCV3d+D70YngqxZgfcKJoHku95Jtu+xHm
         jQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733170182; x=1733774982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        b=l8bUJuRZ0itrahW7Qp3/BDyASkCUBjwJXCF2Twt2P8FmZUZSdCJz5GKc868Gpn07qz
         scql7ty2dqjTEk/JhSgQIEQvcZoMNUgkuN2wPAZWo1CliqYJgqenwBFYrVKggW9qTsq4
         5ayZzt6KwA1su3kMojnWfz7QN7q7bztVUfrmSV7KSY4XsoZvIK/0564s7A8KAuYFZ7+a
         kt7DzfQwJVrlIpEZrYW5tXirBRDcHtDrh3QIs37mDQm1ZqSTya8dSCFUJpM7Nha7ejMX
         9vpeQPwk2CKODJf8bY2wxP4uvl4fc+zPhlDMHnM+dAYrAlb0RD233ieUpfoC6HNVt587
         M+pw==
X-Gm-Message-State: AOJu0Yy3XVCfL/DrmoR55jrfYV86E2QFEzVGjsVgCz43wDgUEVCk1ovU
	t/+S89uzqXk0IlqCX7xHaSkWUXQ7ykUwaDZqj4m/14R7UsQdNcxWOQHsepBv1DpCxw==
X-Gm-Gg: ASbGncuKHIEdNxfIqQ11tbmjfYFUMYXUNJpkZ09qOxCwRIK7yVJxu57OJu7sfYhOEEx
	3zgXb7L/S9CDtngFuvAONc4g6+O9oGR2bRdrd3oeaHOVxU8OXxBlnhVELbtY671Y1ArglP06HrY
	xIg3P2Dr60kn6x1G+wvo+tEBfJPW+9hMNVXewuHDFQlyumP8QvWqMjw3EPtazNZ8eGX1zz2i/xn
	eeDOfAv02yYPP1g3hzNXAxmSPbI5DXN4nH2MXrwIcwawZGBU+z4uMOeATUEuvleMPyKiO50cFZ/
	VnU+E1Ci9IRyglR6NfppRg==
X-Google-Smtp-Source: AGHT+IEVjQ/wUGASyXtZJZ4KgANHmE0K1EEKCV5ky326QolfK9hhZRSLxfajMC8DV8MVthSO3IaNYQ==
X-Received: by 2002:a05:6a21:3291:b0:1e0:dde9:f383 with SMTP id adf61e73a8af0-1e0e0ac69eamr40650963637.4.1733170182544;
        Mon, 02 Dec 2024 12:09:42 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c311eafsm7185611a12.43.2024.12.02.12.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 12:09:42 -0800 (PST)
Message-ID: <ecffacf0-1dbd-4931-b1db-db3718332fcf@linaro.org>
Date: Mon, 2 Dec 2024 12:09:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
 <87ser6c5be.fsf@draig.linaro.org>
 <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org>
 <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9ved+LD19KT4

On 12/2/24 11:56, Peter Maydell wrote:
> On Mon, 2 Dec 2024 at 18:36, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>> Maybe our enable-debug should produced optimized builds by default, and
>> we could have a new --enable-debug-unopt for the "I need to use a
>> debugger" use case. Would save a lot of time for devs, and in CI where
>> minutes are precious.
> 
> The whole point of --enable-debug is "I might need to use a debugger"
> (or a sanitizer, or anything else where you care about debug info).
> If you want the optimized builds, that's the default.
> 

It seems like we associate debug info to "I might need to use a 
debugger". But, it's not the only use case.
Sanitizers for example, are usable with optimizations enabled as well 
(with some caveats, as some errors might be optimized out).

I don't have anything against what --enable-debug does, but supporting 
this for tests (and CI) because people *might* use it is a mistake IMHO.
It's an opinion beyond the current series use case.

It takes more time for devs and CI to run tests with debug build, 
compared to recompile and run test suites. And we hit timeouts and lose 
minutes because of that.

> thanks
> -- PMM
