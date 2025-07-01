Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3046905dye;
        Tue, 1 Jul 2025 03:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUurdWoNFF6xVbZUzP2mZumFK5/pSTiRJBdB6DlBuq+vJIGmls0VU2w2qbjpDxH2+PKV6WMX83yDj4xgw==@linaro.org
X-Received: by 2002:a05:600c:c05a:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4538ee8565bmr133694075e9.18.1751364911781;
        Tue, 01 Jul 2025 03:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751364911; cv=none;
        d=google.com; s=arc-20240605;
        b=Iz5ceX9m1zPEcKkU6y5LtNyX1blBQ4/MGpCLsexT1x/Ff/2OQ72PZy5YELT8pEM1yN
         XN2fJoTIx+1+EIWU/XTVFJp71YLWK9IbPCPBXtgvMeCGV6eT7Gki4Y1K8FdTuH9wZG6J
         rdZfPBK1Q2qf78+sI5xZv9KRrOyx65FAd4tnwTeAB20pL4/st7eWBWSDZMJA+eIvC+Zj
         MZ/j8bEiKvlarlhceuzOYLYmeZK5dPdBGUKR4tg/fy7V+7qo/gqsNnDZCgNF3/su1gHK
         I5ldSOYQL2mP3+floWccnBA7w8YKz7x/C9tZTV116u3Tgo9LmBzC0EFfOcgpWc5M7F8F
         M5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aCAWKACQX2fPUuLCEOQi2kKR8kfTCXZQfgtxYqfJhnQ=;
        fh=lujVEPaHK/YLT4fZr3u7vr5Qcx51P7jqoXxGB51XW1k=;
        b=JgWzSxKkdfy115gYRtEpRgHfav7IVwoc+2qvMpTVjw58LKB7cVl/JWRs8Ld2Jinxia
         GoKz9UBD9AFWJDAEyoV6ZN3QWDptSghgTueluJLRezBRokCWo35VO2xaxpsNFapAYE4S
         LV+qeAPR27gudTMzrzzHJ8/ATEVbZuBqCwPR3L7DRDTPiGbcyPmEOjZInWmvW1abNDmZ
         HvZ5eqJO1yPr8bnFP7B7z+JyHCIlfUmUyGs/04W9mBa8APdnqpY0RJnFFXL1hONHV3H1
         IAlPlFW1IScmXNUPu4ltn+G0j7RGvy2nxlYW+5orqnOxc04gRBAPxOFUQq0oijJz/i89
         i9bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kFyQEk+K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4539eae0352sor16311335e9.0.2025.07.01.03.15.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kFyQEk+K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751364911; x=1751969711; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCAWKACQX2fPUuLCEOQi2kKR8kfTCXZQfgtxYqfJhnQ=;
        b=kFyQEk+KaRdjJZTeJXESxy4VWGlROLyQwDZjg2bBQVIz2qbkWc997iHhv0UTdF4xbv
         NpfHPzuhA/DbRRft8J1wQJPjNfz+++HuCNWVIXnJMHaokBuglM7WseY6gP5vTR+3VLvO
         rdXj1WpBsXG2wJaelc08yBRlX/DRnA0Mi3+tEuo5YuBj28jzNnmascBhUe8sBRYVJVO3
         Uda4NzL4uj7aAaEVilK+2fcj8+3ySTCQ0TVT/qTb2cTnTZl5iQfTnlVg9hNYKbJUpxu9
         omKeTQRNPK2kpANYPkmn4G2cmMkFHqTnc/WLfA+T4frOgn/R0HjIOdDera7dPfrZ3p30
         23nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364911; x=1751969711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCAWKACQX2fPUuLCEOQi2kKR8kfTCXZQfgtxYqfJhnQ=;
        b=p+Pp4/p9YhRJHl6h48YvtRzys1w8UDH4jDlEqM+QGKNeZ5lADmQuLE+FYp6AwIxfim
         ZA1jXvxUIlkWpVwwq0tPWtlXkfRA9jWbBT/TFt9/tgDZFqpVZI0gaQNOiPSjkukKpkOQ
         +cZksJwHDnRBZUYI6dmhl/+R17KQj9mk21a7zjujwHahOFeaop8FyhssUSV883vlsuyR
         xD24V68CSvQ2O+hRlRQ2JhH3i9dVKqpsTz7qw4lXLp0yIj/24/VxYN5SSFBt1qL6hOUU
         k69SAA3+ny0dct4WIsaxrY8vajsg5cPWNTJ2p3VZaYUaEwGTlYJdAco0tq2uyS7FMVJh
         e1rw==
X-Forwarded-Encrypted: i=1; AJvYcCXYzZmb45myED4mtshBuY3DvXreAO2MiBJGvCwESi5DrE44JUsaytazKVJBDpMhJNyqdNn4LIw0o0DUdw==@linaro.org
X-Gm-Message-State: AOJu0YwDdLiF6pOdOgXpHk66mdchKIXPrJ6yo6xUMBdKXuLwglWdKDM3
	sk5oCuJdLsWYUhhzvviDQMB1ccEf27TgkWuVdeN7tdIIU9CIYXsRn0ItoVU86w2hNmC4aA==
X-Gm-Gg: ASbGncugTJpXzS1mnvYi3Ywd8Xf2kWltFWxfUG2B3AukG7DnsTkoCux2N0XThFNyLH7
	Us6B9N94eszWKUwdTofb+p4lKprQufRq9DBN+PCEiGlwCPOcyt7xLImfSXpCJDXbiF+MzHmtIHv
	DFkEIE24POeFvlaBbKqqBRUcXfK+pGtc6porJ0SzPlYDm+qXtzfYzFKv54eVgWzVnzZ2dP7f6Vd
	nyLTKbniazBUctA1q7n0u+BmbSSykcD2qhkc0MLNZ6SDu0UCNWgaDX6pqv2owZbOcKm2uVfXK5L
	Tz/d5YPOQOZ7lqJgYuronVDS04sO5vvWOd6M0ujTizt5mDFj9UhkDJGRsAxx0DdMuD9EobpaEUU
	FpEdCu2n0e4DQCKp+/mJZYslqEzmISQ==
X-Google-Smtp-Source: AGHT+IE2TIUCu3tWDUhYMKR2RX27xn19+zw/Sg/ImtPMtPrU5FOrGBc29LXE1pvk/a3tWyk20y/Jvw==
X-Received: by 2002:a05:600c:4f46:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-4549ff26757mr11446845e9.16.1751364911092;
        Tue, 01 Jul 2025 03:15:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0f3sm194858785e9.19.2025.07.01.03.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:15:10 -0700 (PDT)
Message-ID: <34fa39b2-fc0a-4d3b-9a3f-4888d02bdebc@linaro.org>
Date: Tue, 1 Jul 2025 12:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/26] target/arm/hvf: Trace hv_vcpu_run() failures
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-7-philmd@linaro.org>
 <CAFEAcA9ref1SFd2uPRBBjyg=eph+GptWxoyURxMZj8aSVD7zAg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9ref1SFd2uPRBBjyg=eph+GptWxoyURxMZj8aSVD7zAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AzIBDE/fNc7g

On 1/7/25 11:49, Peter Maydell wrote:
> On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Allow distinguishing HV_ILLEGAL_GUEST_STATE in trace events.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/hvf/hvf.c        | 10 +++++++++-
>>   target/arm/hvf/trace-events |  1 +
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index ef76dcd28de..cc5bbc155d2 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1916,7 +1916,15 @@ int hvf_vcpu_exec(CPUState *cpu)
>>       bql_unlock();
>>       r = hv_vcpu_run(cpu->accel->fd);
>>       bql_lock();
>> -    assert_hvf_ok(r);
>> +    switch (r) {
>> +    case HV_SUCCESS:
>> +        break;
>> +    case HV_ILLEGAL_GUEST_STATE:
>> +        trace_hvf_illegal_guest_state();
>> +        /* fall through */
>> +    default:
>> +        g_assert_not_reached();
> 
> This seems kind of odd.
> 
> If it can happen, we shouldn't g_assert_not_reached().
> If it can't happen, we shouldn't trace it.
> 
> But the hvf code already has a lot of "assert success
> rather than handling possible-but-fatal errors more
> gracefully", so I guess it's OK.

OK, you can drop this patch: I will replace with error("unrecoverable:
...") && exit(1); to avoid such oddity.
